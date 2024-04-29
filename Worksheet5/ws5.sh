#!/bin/bash
#output=`grep -a ",United States,US" "$1"`

categories=("Music" "Entertainment" "Gaming" "Comedy")
# do a for loop in the outside and a while loop in the inside

#for category in "${categories[@]}"
#do
#    echo "$output" | while read -r line ; do
#    echo "$line" | awk -v curCat=$category 'BEIGN { FS="," } {print $5}' 
#    done
#donei

for category in "${categories[@]}"
do
  while read -r line; do
	  echo $line | awk -v categ="$category" 'BEGIN {FS=","} {if ($5 == categ && $9 == "US") print $0}' >> "United States/$category.txt"
  done <"$1"
done
