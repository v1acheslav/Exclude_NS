#!/bin/bash

old_list=$1
new_list=$2

for domain in `cat $old_list`; do
        ns_example1=`dig +short NS $domain | grep example1`
        ns_example2=`dig +short NS $domain | grep example2`

        if [[ ! -z $ns_example1 ]] || [[ ! -z $ns_example2 ]]; then
                echo $domain >> $new_list
        fi
done

