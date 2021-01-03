Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.49])
 by mx.groups.io with SMTP id smtpd.web10.21665.1609649759015101212
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 20:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dtMDKu55;
 spf=pass (domain: windriver.com, ip: 40.107.76.49, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7EFVHv/xIBM1MxIKKuOpIAs0elh9bInFQpeN0Dxo3xY3B3jjNtP7ZZdm2qsyYG+srAXm7MsLZcR7bYBF0gIrKAdar5S9ClWdTxiyyNdypjd7+UUwVGMGFq4DnliVxbBxGpOEssV8iCzu4BFFE13KI/kUWRU9wrqsMk+QWsxcMGX9mEazSNo/RgURLBTv/9ZeC0xT0aDj1cbyOHdrPzB/iGNXhv0GJqvDsLmdv9HaGX1nHcwB4SNiWp+uSmas2EZnOPNIEOe0P+iPm6oADwIaMhVodr0jzA5qbuT7lu8s1egP6t40bb3UFG7uC2lbQQeE75TjMYYApmm6Zl5RKiCUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMmkwAMbWD3PU4haM3+xDivcVZeXoQs76UUsswOxJHw=;
 b=NmQZcmN8p0Uurd9AwAytPrpV0GVd/aHY+4mTDyzlStBEeHNvOCEo+WCVAgjS+iq8uHIjVCcpXYVp9f746JwSnTUcvXKsc+SwvyVgNRkVuahJCZCSjXjoc01z5TTriuPosUqXkUJLUJDODJ66AGuOlY4U83oF1nOx+zY3pzA10m0X7oiBRDxVxpNFRyayRRdQHPT2KkHo64lN/sCSBFe8YHJ7Xw7pqiBTNfWCrLio5iDuaM72vRnGq4IsshSVVCuTB9IaXeF/w3x392tS8UMhq7KwvXvBM6CnzN+iEV/t5i041mmsixHufGzc9oBMAFsKxR/SRvFeiUD3AxlbkGp6+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMmkwAMbWD3PU4haM3+xDivcVZeXoQs76UUsswOxJHw=;
 b=dtMDKu552UzfRmgn3z288FjYTKiQZpSqGvIzdNRlFCtMbuUy5nSs8QzD+Eg3jDKVWYPCEh6v4ZnZqfWd2Csqx86xRD503LEjZN1jEBcjPIqIu/uBvmjbHbvPHFqht9GZ5TAHcoQf7g0Vb3AfXUdZIxrLMFpdabRMu+CaCx0Z0Iw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1792.namprd11.prod.outlook.com (2603:10b6:300:10b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Sun, 3 Jan
 2021 04:55:56 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3721.024; Sun, 3 Jan 2021
 04:55:56 +0000
Subject: Re: [oe] [meta-networking][PATCH 1/3] ebtables: add missing file ebtables.common
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20201231090331.223784-1-yi.zhao@windriver.com>
 <CAMKF1sphr4ZTmN5qE8M-XcTHsQx=bdTwgaopumwDu=2h=kgd5w@mail.gmail.com>
From: "Yi Zhao" <yi.zhao@windriver.com>
Message-ID: <b2f6490f-f334-3dd3-f0a8-e0015020b933@windriver.com>
Date: Sun, 3 Jan 2021 12:55:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMKF1sphr4ZTmN5qE8M-XcTHsQx=bdTwgaopumwDu=2h=kgd5w@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0177.apcprd02.prod.outlook.com
 (2603:1096:201:21::13) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.174] (60.247.85.82) by HK2PR02CA0177.apcprd02.prod.outlook.com (2603:1096:201:21::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend Transport; Sun, 3 Jan 2021 04:55:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d878aa6a-0cc5-41be-6828-08d8afa3db6e
X-MS-TrafficTypeDiagnostic: MWHPR11MB1792:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1792F864D5EF9E14A22F5D5EF9D30@MWHPR11MB1792.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:23;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H3w+QsuKXd7ZsKU3KcaJg6U9eTrShdhJko3sD2yGwgCpARGsbXVB23zW3JPyxdsO298aTwdEpoNY9Yb8PmzxmxxOp4lzv87uPlO1M7UnZgXWXuj6YabOs9/sEF8VlC2FdsEzwkPgOaXyx6WqrwjZSjCAOIaXJ0X6TW+Nlm+bS7o4v8uxt9COH3lESI0oFAiuiThBUULIfG/1oDdnyj42nEb1cRwe9KDbeOZAQ9Orbt6VOSHswKkxndR0blANRAw1DipNwseqhWw4S+iOhxvpwNy+Q89pzdnne6eyOGXDHVfk9qPbEZQuQ+bXMBYPCuYlDNTQPf82PYAKpmFm6RhlLxL7Z7u7K8OD1VxGG9+rbPAz1lYTbrfFdrSx3cj3a+9e1f4zVPj8eWKZIDgqOnwoXDqej/oNCwU44vpXuP+NQpmPhSWPnqft9p7mbYmKrEkM9eWNde1ZzkCavHbC2b+2EEj8uCCuPnoOmRtYFRT5GYK/3IcBLR+HgKBK50P+RUWBV47KO7uj06yEnMANaPI2dG9EMwjI8WTShPUrbWCH+I76EFVv2G7/P1csfwh20BJMjcE3uLFyBPbETAivvc2/kA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39830400003)(376002)(396003)(346002)(26005)(36756003)(6916009)(66946007)(66476007)(6706004)(66556008)(4326008)(316002)(16576012)(6666004)(8676002)(44832011)(2906002)(31686004)(16526019)(52116002)(31696002)(186003)(6486002)(2616005)(956004)(966005)(53546011)(478600001)(8936002)(83380400001)(5660300002)(86362001)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?S2h0YndsY0pBYjZRRHpLQUs2SkhnN1hvd0tsNGFrd2ZsWC9SSEZOSjI2QjNU?=
 =?utf-8?B?UW42TGNINE9jWGs5SjNFVXBiNUhQTEZXM3NlU0tKV1VBcFo4aUhZQlNIblVM?=
 =?utf-8?B?Z0xLNzhsV0ZOckx6d0k4UGhtZ0VwdE1nbEZWd0doZ1lzU1k0ZEIxWmQwYS9l?=
 =?utf-8?B?dElXTTl6U1BYQmRUaEpvczBiVktYZmFyVERCWXppZlBHcWEzZ25RMkVwYUtw?=
 =?utf-8?B?dlJDdTh1UnpOdnVScFBtV0NuVysvYzNqSUlVMEJsYUtJc2tXU2dNc3dNNjJO?=
 =?utf-8?B?SHdVZ29oWWdLK0w1cXB6djY3eXd5T3dPdGI1WmF2ZGtCRHdLRnFUR1NTeVpO?=
 =?utf-8?B?UzZSUFc5SXdsSnFQd2IvL1lRWVdMcXdNMW5mQ1FxcXhtQUtpeGZxUk1jcGh1?=
 =?utf-8?B?VWpacVJIWHR1YllBUTN0eFMvTUVUYkNZRTZRTmdRdjVTQUtXeHB4QURtL1dm?=
 =?utf-8?B?cytNL1N6T2YwWk1BckNHTVdYK1pVRUhKSWlyUERCT005VUpmK01PQ0N6b2Nh?=
 =?utf-8?B?SDVUN3dkbzdaV0ZKb3doRm96QWd6UWFBamxIUUZvSW4wcVVvQjVhR2lSOHV2?=
 =?utf-8?B?ZmlWUUJoWFd2ZjVNTGRKdUxxQmRMOTlvQU9QRDBNYnN5ai8wN2FkVlJBYUxa?=
 =?utf-8?B?QkVTVDlMUmdaYTNaQUtrRVFvQXlUWkw5TVpsWVo1dnNLUkNDRG5DVHplNlli?=
 =?utf-8?B?S3NZRlBQVHkxYUwwT0wvcUtRaTB0bzNvckcycC81b2FXSSt0NUtwbXpNcDdZ?=
 =?utf-8?B?WGljWmd4Wnlzb2lWQWQ2NzNXSVZUdFIvUU9wL1o3ZmJuOUt3ekpDdjBlV3pL?=
 =?utf-8?B?cjdhb1VYYnp2TlB6cUhYK2h2dmpmRmYvVE9vMjE2WDdPT1lDWW45ZmF2aU1R?=
 =?utf-8?B?ZERoY01wY20wakJrTTNqejVCTkNLbmxjTHJKMUJmM1dTcWdieFJxSlpwR3Fj?=
 =?utf-8?B?cFVFRHJsY05LQ0p0SEpReVZ3WmpQN2xQcHVuNS9sR3MvbTFJcTdybTAzSElT?=
 =?utf-8?B?RVIySzgxc3hIVGMvSmhPSjNOY2p1MjFMUVIreDhNWGcxaDdGSFQ3QzJveWFD?=
 =?utf-8?B?d1UxNXNSRlQvMmc4UXN4NUVxTVRKSmJrcVVUb0pRTGU0T2QwdzFoYlYrd0tw?=
 =?utf-8?B?dHkwSmduK1gxMTJpc2JiZHVKbkcvV3J1WlJUaWpCZ29oa25QLzB4dXpTa0hR?=
 =?utf-8?B?ZmNpYXVpMTdtbzYxMGVxOFlHTVRNYVY4NVB5S2NLeTR3bWk2SDBGalNJMlVU?=
 =?utf-8?B?b09ETlZ3YkRUQkNIWllXb3NOMVRwaDRxOXNTUk5mL1k5MU0zS0JDRHRkc0N1?=
 =?utf-8?Q?5Dy9gUJ3It1Fw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2021 04:55:56.7158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: d878aa6a-0cc5-41be-6828-08d8afa3db6e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWbhkzTGx2dVPBbgUJMx2EIpCqlrizpUcj0pWbHxMKW6bqXclh+klwy3CFnvqQJiXASlkR2+cfgnAYQEPstBFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1792
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 1/1/21 4:23 AM, Khem Raj wrote:
> this series fails in do_install see
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/838
> https://errors.yoctoproject.org/Errors/Details/540440/


This caused by patch [PATCH] ebtables: Add symbol link /sbin/ebtables.

I have sent V2 to fix it.


Thanks,

Yi


>
> On Thu, Dec 31, 2020 at 1:03 AM Yi Zhao <yi.zhao@windriver.com> wrote:
>> The ebtables.common is required by ebtables.service. Add it back.
>>
>> Fixes:
>> systemd[660]: ebtables.service: Failed to locate executable /usr/sbin/ebtables.common: No such file or directory
>> systemd[660]: ebtables.service: Failed at step EXEC spawning /usr/sbin/ebtables.common: No such file or directory
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   .../ebtables/ebtables-2.0.11/ebtables.common  | 163 ++++++++++++++++++
>>   .../ebtables/ebtables_2.0.11.bb               |  10 +-
>>   2 files changed, 170 insertions(+), 3 deletions(-)
>>   create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables.common
>>
>> diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables.common b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables.common
>> new file mode 100644
>> index 000000000..d948422e9
>> --- /dev/null
>> +++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables.common
>> @@ -0,0 +1,163 @@
>> +#!/bin/sh
>> +
>> +[ -x /usr/sbin/ebtables-legacy ] || exit 1
>> +
>> +EBTABLES_DUMPFILE_STEM=/etc/ebtables/dump
>> +
>> +RETVAL=0
>> +prog="ebtables"
>> +desc="Ethernet bridge filtering"
>> +umask 0077
>> +
>> +#default configuration
>> +EBTABLES_MODULES_UNLOAD="yes"
>> +EBTABLES_LOAD_ON_START="no"
>> +EBTABLES_SAVE_ON_STOP="no"
>> +EBTABLES_SAVE_ON_RESTART="no"
>> +EBTABLES_SAVE_COUNTER="no"
>> +EBTABLES_BACKUP_SUFFIX="~"
>> +
>> +config=/etc/default/$prog
>> +[ -f "$config" ] && . "$config"
>> +
>> +get_supported_tables() {
>> +       EBTABLES_SUPPORTED_TABLES=
>> +       /usr/sbin/ebtables-legacy -t filter -L 2>&1 1>/dev/null | grep -q permission
>> +       if [ $? -eq 0 ]; then
>> +               echo "Error: insufficient privileges to access the ebtables rulesets."
>> +               exit 1
>> +       fi
>> +       for table in filter nat broute; do
>> +               /usr/sbin/ebtables-legacy -t $table -L &> /dev/null
>> +               if [ $? -eq 0 ]; then
>> +                       EBTABLES_SUPPORTED_TABLES="${EBTABLES_SUPPORTED_TABLES} $table"
>> +               fi
>> +       done
>> +}
>> +
>> +load() {
>> +       RETVAL=0
>> +       get_supported_tables
>> +       echo -n "Restoring ebtables rulesets: "
>> +       for table in $EBTABLES_SUPPORTED_TABLES; do
>> +               echo -n "$table "
>> +               if [ -s ${EBTABLES_DUMPFILE_STEM}.$table ]; then
>> +                       /usr/sbin/ebtables-legacy -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table --atomic-commit
>> +                       RET=$?
>> +                       if [ $RET -ne 0 ]; then
>> +                               echo -n "(failed) "
>> +                               RETVAL=$RET
>> +                       fi
>> +               else
>> +                       echo -n "(no saved state) "
>> +               fi
>> +       done
>> +       if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
>> +               echo -n "no kernel support. "
>> +       else
>> +               echo -n "done. "
>> +       fi
>> +       if [ $RETVAL -eq 0 ]; then
>> +               echo "ok"
>> +       else
>> +               echo "fail"
>> +       fi
>> +}
>> +
>> +clear_rules() {
>> +       RETVAL=0
>> +       get_supported_tables
>> +       echo -n "Clearing ebtables rulesets: "
>> +       for table in $EBTABLES_SUPPORTED_TABLES; do
>> +               echo -n "$table "
>> +               /usr/sbin/ebtables-legacy -t $table --init-table
>> +       done
>> +
>> +       if [ "$EBTABLES_MODULES_UNLOAD" = "yes" ]; then
>> +               for mod in $(grep -E '^(ebt|ebtable)_' /proc/modules | cut -d' ' -f1) ebtables; do
>> +                       rmmod $mod 2> /dev/null
>> +               done
>> +       fi
>> +       if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
>> +               echo -n "no kernel support. "
>> +       else
>> +               echo -n "done. "
>> +       fi
>> +       if [ $RETVAL -eq 0 ]; then
>> +               echo "ok"
>> +       else
>> +               echo "fail"
>> +       fi
>> +}
>> +
>> +save() {
>> +       RETVAL=0
>> +       get_supported_tables
>> +       echo -n "Saving ebtables rulesets: "
>> +       for table in $EBTABLES_SUPPORTED_TABLES; do
>> +               echo -n "$table "
>> +               [ -n "$EBTABLES_BACKUP_SUFFIX" ] && [ -s ${EBTABLES_DUMPFILE_STEM}.$table ] && \
>> +                       mv ${EBTABLES_DUMPFILE_STEM}.$table ${EBTABLES_DUMPFILE_STEM}.$table$EBTABLES_BACKUP_SUFFIX
>> +               /usr/sbin/ebtables-legacy -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table --atomic-save
>> +               RET=$?
>> +               if [ $RET -ne 0 ]; then
>> +                       echo -n "(failed) "
>> +                       RETVAL=$RET
>> +               else
>> +                       if [ "$EBTABLES_SAVE_COUNTER" = "no" ]; then
>> +                               /usr/sbin/ebtables-legacy -t $table --atomic-file ${EBTABLES_DUMPFILE_STEM}.$table -Z
>> +                       fi
>> +               fi
>> +       done
>> +       if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
>> +               echo -n "no kernel support. "
>> +       else
>> +               echo -n "done. "
>> +       fi
>> +       if [ $RETVAL -eq 0 ]; then
>> +               echo "ok"
>> +       else
>> +               echo "fail"
>> +       fi
>> +}
>> +
>> +case "$1" in
>> +       start)
>> +               [ "$EBTABLES_LOAD_ON_START" = "yes" ] && load
>> +               ;;
>> +       stop)
>> +               [ "$EBTABLES_SAVE_ON_STOP" = "yes" ] && save
>> +               clear_rules
>> +               ;;
>> +       restart|reload|force-reload)
>> +               [ "$EBTABLES_SAVE_ON_RESTART" = "yes" ] && save
>> +               clear_rules
>> +               [ "$EBTABLES_LOAD_ON_START" = "yes" ] && load
>> +               ;;
>> +       load)
>> +               load
>> +               ;;
>> +       save)
>> +               save
>> +               ;;
>> +       status)
>> +               get_supported_tables
>> +               if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
>> +                       echo "No kernel support for ebtables."
>> +                       RETVAL=1
>> +               else
>> +                       echo -n "Ebtables support available, number of installed rules: "
>> +                       for table in $EBTABLES_SUPPORTED_TABLES; do
>> +                               COUNT=$(( $(/usr/sbin/ebtables-legacy -t $table -L | sed -e "/^Bridge chain/! d" -e "s/^.*entries: //" -e "s/,.*$/ +/") 0 ))
>> +                               echo -n "$table($COUNT) "
>> +                       done
>> +                       echo ok
>> +                       RETVAL=0
>> +               fi
>> +               ;;
>> +       *)
>> +               echo "Usage: $0 {start|stop|restart|reload|force-reload|load|save|status}" >&2
>> +               RETVAL=1
>> +esac
>> +
>> +exit $RETVAL
>> diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
>> index fc544e1b6..08d4d661d 100644
>> --- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
>> +++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
>> @@ -13,6 +13,7 @@ RRECOMMENDS_${PN} += "kernel-module-ebtables \
>>
>>   SRC_URI = "http://ftp.netfilter.org/pub/ebtables/ebtables-${PV}.tar.gz \
>>              file://ebtables-legacy-save \
>> +           file://ebtables.common \
>>              file://ebtables.service \
>>              "
>>
>> @@ -33,9 +34,12 @@ do_install_append () {
>>          install -m 0755 ${WORKDIR}/ebtables-legacy-save ${D}${base_sbindir}/ebtables-legacy-save
>>          sed -i 's!/sbin/!${base_sbindir}/!g' ${D}${base_sbindir}/ebtables-legacy-save
>>          # Install systemd service files
>> -       install -d ${D}${systemd_unitdir}/system
>> -       install -m 0644 ${WORKDIR}/ebtables.service ${D}${systemd_unitdir}/system
>> -       sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/ebtables.service
>> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>> +               install -d ${D}${systemd_unitdir}/system
>> +               install -m 0644 ${WORKDIR}/ebtables.service ${D}${systemd_unitdir}/system
>> +               sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/ebtables.service
>> +               install -m 0755 ${WORKDIR}/ebtables.common ${D}${sbindir}/ebtables.common
>> +       fi
>>   }
>>
>>   do_configure_prepend () {
>> --
>> 2.25.1
>>
>>
>> 
>>
