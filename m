Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.491.1631638817127663332
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Sep 2021 10:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NiWzjbmZ;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4891920849=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18EBYhhA032532
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Sep 2021 17:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=nsJUwFWCovVSODFocF6cJtYr5vxIV55tDNNqEEYJbO4=;
 b=NiWzjbmZ74FMxcyx2pzoYwSY3D0pmGsDqXwpAinCZEL+RjQVi7M0wS3kr0ESLLunI5qd
 mMfewAPzT89yQcepU0fEW4e0G9mRAWmyPhQoAMm03I7liGXNiKSOCCtx/vkginRKPUIq
 vuWi6bYIPea8t21ES/JybZaFOwAfTmm5um8su44G9deB7sM890FI//VHqQxZ1SC0KWr/
 BDWSiO4VPLdCR3i4d17KiPhtqkbX4cKcXbAPPOkdIkOVZnqh1ueZcSmcceQ9ykzqKEFZ
 MmYmXcalYuF9C9eg0rI5g/urcT+q/y3idKHRTRyHr27fa8YDMHrIttN/xfj3GxfMzZz2 Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b26m194wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Sep 2021 17:00:15 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18EH0Fo2014723
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Sep 2021 17:00:15 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b26m194wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Sep 2021 17:00:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFBCDB9FmuTmc2NQ3UulqkZAWfycIwazBRu8h9kkfC6vQLrxErQyUyS2FjH7hkOhKrXTyNZzlktLE/lMIxXlSym69e22swpSCCj7dcu41ltH3ON0B9vDg5yYbRCQLJ/hT6ewXTgLC6Jn2Y93bOr6mnTp1yyFye89gJQVL6j4vB851xda8olW6ECXxlmhbQwvtROGQOG0bstY5CnQZ5RxoYgqiQ6pmMg4nHdSxdjizTyGvXoh+HQYrlea5A3toL4KQpN1Txqj3Bqvb9V02SaDFDpPiEiLgOPXYw8GMuIt3mGiuTHMVnho1hBQJRa0WvkxmLn/9O5vw6vJF/CgEcoH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nsJUwFWCovVSODFocF6cJtYr5vxIV55tDNNqEEYJbO4=;
 b=HIeTCNVnAJHv5qrR6AQSOtoe7hvIJn3xezTiVbpKNzE/v6vThPermd4VN3g56cbyYSxAWOBzAaO5vCxO7WvJylwCu8o/5gQlbDbzzLX3Tj5dxnXKT8UuIsKX8ELg6f1aLFsgnS1yTb5bFPERsLmOPMo8IgWyITAQoxZqqxTrC57rfzBdNLA5juJvf7Av39pUqBVlIiNdH3EnVvzBAfGCsAMb2CjSlMXb7xlpcRjjwpgMJF19DUlNlCZzUJ1k499z7rkoudoQvQyqNQn/ZtAf53zGrADiSTnp2fIGh9Hs1NxwjUocf9jE1vGPs8Eu0usiEHtyH5U1f0ShF2K1amATlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB2716.namprd11.prod.outlook.com (2603:10b6:5:c7::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.17; Tue, 14 Sep 2021 17:00:12 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4194:d852:a5e5:77d6]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4194:d852:a5e5:77d6%7]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 17:00:12 +0000
Subject: Re: [oe] [meta-oe][hardknott][PATCH 1/2] lmdb: add recipe
To: akuster808 <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20210913212141.353383-1-sakib.sajal@windriver.com>
 <7883cdd3-28f7-d3e8-146d-4b2d612af1b5@gmail.com>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <1f3274c5-3836-b606-f7e5-efc4a9a5ff59@windriver.com>
Date: Tue, 14 Sep 2021 13:00:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <7883cdd3-28f7-d3e8-146d-4b2d612af1b5@gmail.com>
X-ClientProxiedBy: BY5PR16CA0012.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::25) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
Received: from [192.168.2.28] (184.144.68.109) by BY5PR16CA0012.namprd16.prod.outlook.com (2603:10b6:a03:1a0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 17:00:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d143126c-f994-4d20-c807-08d977a11dd1
X-MS-TrafficTypeDiagnostic: DM6PR11MB2716:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2716C84F8B4C40C76658BD31F2DA9@DM6PR11MB2716.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xC/JvETYjgC7qpFTCqRA7l0V6IVf46A3TT5k9dDIott6Vt/q9/9Pxhvl1+hyAVIO26boQEJxjgc7/hYHyMp6qKsr35d0jbi5bhJYz6+wc8x1TESvVyz1M/gRlzQTvQchYy6+cXQBv2VXr7e4DS0XJnxCjtFKqvP4lUJibKdcnb+3y/GA95Re83jEnW7jHSiuXPTvpTcwkA0YJi+4i+0aEO7KmGO8Y7OBTMFoufZaA3DMEmVuXnWBeIV2cU5E0U2SyMp5wXfleL4eB6nuWOLhsJw5FpTsCtp/S83McACm2C4VYGKJ/bv75QrMSIga/7uxueASQgHmhJiIsC03TnG/R6B8VXPjbpLIkBlgnud0Codd4SGQGP/JA2TNPZBiAjIuLjrWeZDYthsatWcNNg2lxS7DYC91soR5lPathtAHJJJ6OzumC0gvb6xfpgXSONffc1G+qTCF2Bhdg7U+SEGjR/jvuaoVi/uJxGLc9CjLo05CIZjAVhyNHwblaADucNNHm12qdxyVQbfiY60wxb1zGr71Rd+4yUENwGNkzXvaQAfQZyZuVebmjZT8LzrrouZgbxV/dVy3z7sCgPwST0v7XDFNpZoUDU324UleI0hOUk0f8Ny7rWDGGYwmu7zFFGR0Jp1nNXgb5H1+8Aa9G2UF9WPUV6lwTc7E/wQNu4QCwyhjew2JJsqoqPy59fohY/VhJAJ1b2WGg93oyxFHNdL9z7Jhq20l0qdwtP0dNpx9Z7ErRn6hWQKLPkspojuC+C61+2aFdbC1fggOvULAknZVOnKyBzXJVu1A3VL6JoQXMBM8ZeBvDzeHQyxGB6AzQs8UqxaSJdTL++/jNIPMabYuldNRJfgredVPAzjgT/cma+vHCvvKsSByX/i80TAsw4j95oR89Iyrs9L0Q0ZYagYwyg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39850400004)(136003)(396003)(66476007)(66556008)(186003)(31696002)(2906002)(31686004)(66946007)(316002)(52116002)(6486002)(86362001)(16576012)(956004)(38350700002)(26005)(5660300002)(8936002)(38100700002)(966005)(478600001)(8676002)(2616005)(6666004)(36756003)(83380400001)(44832011)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NUszRG9YbUJpbk1lcituVHdpL1NUS2lkU1hlWmhDM1BUL1hGWWY0UVgySWlX?=
 =?utf-8?B?L3ZBekZFbjZocllPc1dxMEwwbTd6eUtqdElrY282MFAzaHVLVmZVYXhITXQ0?=
 =?utf-8?B?TWpjemJseStnMzZib2o4RmhXT1JHMTlBbzhKV3l0TEV5SGo3ZGhJYUF4U2JZ?=
 =?utf-8?B?M3hjRHJsYzM2RTFQbmhwUXpFY0FwYzZ4aElGcGhQdExKMWxDcHRFYU5qb3F0?=
 =?utf-8?B?a1FISE1nMVFhdW1ZdDJiTG81TTFOZkN2cUhwVkIrS0lwOTZiTHcwVnl4OWRY?=
 =?utf-8?B?ZWJXRFRUdTlScDJoL2tLeC9uRFhMWHJ5Tml6WHFKUGlwWnZ3RzZLdHZKbFY0?=
 =?utf-8?B?dndnVXl3dkowZ290b0tzNXFxd0lGMjJ5YmhvaXR4VlhQTlA4WkY1ODdkY2dZ?=
 =?utf-8?B?eHNaUXdKWFl3dVdGY1RwQ3piOXFheENpR3JmQld0K1R5emlnelErTmJSVnZ5?=
 =?utf-8?B?Q3RTcXl1V3h6dHF0WDVWNGwvc3Bkc2RPS0R0bjlTVit5OWpZSEd2UFNEWEV0?=
 =?utf-8?B?TVBNblEvemxMWkhnS1ZjYkp5YWREa2tMUGFBaWdORmpHSEtrN01SOG5GL0FG?=
 =?utf-8?B?TGRhTU43SmxYWTUvY3ErQzFKdEFpQUtrcERoRFBFWVNEbjVYWHpSMnBtYUxo?=
 =?utf-8?B?WVk4SVdSUGZ6bFNEblNDSVk4ZHZEU1FJY3QySThJT1JQU1ZCdkZYMHl4MmFZ?=
 =?utf-8?B?ZFVrOExReU5EcWZYWHZGZHpQR0xkbVFpMlQvcUxQQlJQNDhqbkxwOGRrK2dj?=
 =?utf-8?B?SCsySmphNWx4ZkJFMEJKS2RpTFhXM2NaZ0dWaVpYMDY1OUplY2M0K3laR1I0?=
 =?utf-8?B?aFNqRTcvQ212dDgweHZ1Z0dpQVpDQ25LY1phdHBnUlllVlovK3ZuU3I0ODUx?=
 =?utf-8?B?MHYzNVNKUWxCV1FQREhTRUZKTXZSRzBNQUJuaEN5NWlTZVF2dnBrYTZDN3lZ?=
 =?utf-8?B?bVNwY3NSeUhSc1c3Ujhvd0k0WG5sTUlFK2d5YWl6SVl5cjlSbTFhZ2NpcXBw?=
 =?utf-8?B?amV0UGVwM1hsUkUxak1nVmtPcUZLMXBvd3NSSlZMMWtFN0VnZUZlYlRISVVQ?=
 =?utf-8?B?c1FKWEt3TnFRaVQ4Y2xtWFMrb0daWjBzVnIwOWREWklRUHlqQldBeGY0SDQx?=
 =?utf-8?B?aUJnVVNpMWNHMkVObFZUM3FqTUV3RitjL2w1YXRBZGN5RS9jNm13WjJYWlNo?=
 =?utf-8?B?S0NyOWpDVVdwN3h4WWhUcEZEM1ZwMUFkbERyazB5QmlTVE5TdVhpcXBsMlpu?=
 =?utf-8?B?OGhQNFpNWXVmUW9yUlorcnhpUjRIeWlDR2NyVnR1TTZuL1JGRlNyNFEzd1di?=
 =?utf-8?B?TDJzK0pkM2c3Y05BUEZGL0ovMmFBakVGUnVNZXlIYkxVNmRvZGV2azJxVHBx?=
 =?utf-8?B?UmMvYUVhclZUOHV4Q0ZsTGpWYVFZM1FEbmViM0sydnU5Z3M5YVh1ekdHQlk4?=
 =?utf-8?B?M241ZmFwV3lZSXlyMUlLVXVIVytVTUtPMTNBQmgwZ3kzbytXZlh4M0hDWHVy?=
 =?utf-8?B?SDFhNW5vUHhBcmZhZURsRGZHSzFEOUVLTEFaWUh0R3NONGk4UUJvT3VxVkdZ?=
 =?utf-8?B?dDVRWnN3Tm9GbGwzTXJLbWpNaVY4UnBET05uNGE4dTBoeEo3cWE1dkJqZExn?=
 =?utf-8?B?RzQ0ZUJ1M0VkZk02SlZFdFlQb0hZb3BlRDVQNm8vOE1vTVBWZ1FtNnI3SHF1?=
 =?utf-8?B?azlJZmZIK28xUlBxbHZXZU9TcHEvek5rQklEdW5OL1pLY2IrRnZYK0VseVE5?=
 =?utf-8?Q?bXDOSGNNf2Xn6oLx2BcGBJdE6AjUw91EevxNe8+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d143126c-f994-4d20-c807-08d977a11dd1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 17:00:12.5921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Agw0P0/DSz6ZohkZIkUsaly6wdSL6TEU3lTCD7Z/PdqOuSRCJ0LmRaQAfJ2uW+06dRNK1QfN7NthgRR1sdZcUlSeujI3p3pNxFmFOX5wbQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2716
X-Proofpoint-GUID: thGZ-mScieN5uhiTHu1zp3etL1fr_ylb
X-Proofpoint-ORIG-GUID: 6ZOkfknRhPoC1U8r0ixSdPF5Ub4e3iZ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-14_07,2021-09-14_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109140098
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2021-09-13 5:50 p.m., akuster808 wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 9/13/21 2:21 PM, Sakib Sajal wrote:
>> lmdb provides a high-performance embedded transactional
>> database in the form of a key-value store.
> Thanks for the patch but  adding a new packages is outside the scope of
> stable branch maintenance.
>
> - armin

Thanks for the information. Will try to keep in mind next time!

Sakib

>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit f658a3b40ba0491aab2da3bd9b0d2ae7123a6f90)
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>   meta-oe/recipes-dbs/lmdb/files/run-ptest | 25 +++++++++++++++
>>   meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb  | 39 ++++++++++++++++++++++++
>>   2 files changed, 64 insertions(+)
>>   create mode 100644 meta-oe/recipes-dbs/lmdb/files/run-ptest
>>   create mode 100644 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
>>
>> diff --git a/meta-oe/recipes-dbs/lmdb/files/run-ptest b/meta-oe/recipes-dbs/lmdb/files/run-ptest
>> new file mode 100644
>> index 000000000..a6a7549b9
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/lmdb/files/run-ptest
>> @@ -0,0 +1,25 @@
>> +#!/bin/sh
>> +
>> +cd tests
>> +
>> +retval=0
>> +for t in mtest*
>> +do
>> +    mkdir testdb
>> +    ./$t > /dev/null && ./mdb_stat testdb > /dev/null
>> +    if [ $? -ne 0 ]; then
>> +            echo "FAIL: $t"
>> +            retval=$(( ${retval} + 1))
>> +    else
>> +            echo "PASS: $t"
>> +    fi
>> +    rm -rf testdb
>> +done
>> +
>> +if [ $retval -eq 0 ] ; then
>> +    echo "PASS: lmdb"
>> +else
>> +    echo "FAIL: lmdb"
>> +fi
>> +
>> +exit $retval
>> \ No newline at end of file
>> diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
>> new file mode 100644
>> index 000000000..0746da141
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
>> @@ -0,0 +1,39 @@
>> +# SPDX-FileCopyrightText: 2017-2019 Volker Krause <vkrause@kde.org>
>> +# SPDX-FileCopyrightText: 2019 Hannah Kiekens <hannahkiekens@gmail.com>
>> +#
>> +# SPDX-License-Identifier: MIT
>> +
>> +SUMMARY = "Lightning Memory-Mapped Database (LMDB)"
>> +HOMEPAGE = "https://symas.com/lightning-memory-mapped-database/"
>> +LICENSE = "OLDAP-2.8"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972"
>> +
>> +SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1 \
>> +           file://run-ptest \
>> +"
>> +
>> +SRCREV = "LMDB_${PV}"
>> +
>> +inherit base ptest
>> +
>> +S = "${WORKDIR}/git/libraries/liblmdb"
>> +
>> +LDFLAGS += "-Wl,-soname,lib${PN}.so.${PV}"
>> +
>> +do_compile() {
>> +    oe_runmake CC="${CC}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}"
>> +}
>> +
>> +do_install() {
>> +    oe_runmake CC="${CC}" DESTDIR="${D}" prefix="${prefix}" libprefix="${libdir}" manprefix="${mandir}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}" install
>> +    cd ${D}/${libdir}
>> +    ln -s liblmdb.so.${PV} liblmdb.so
>> +    rm liblmdb.a
>> +}
>> +
>> +do_install_ptest() {
>> +    install -d ${D}${PTEST_PATH}/tests
>> +    for test in mtest mtest2 mtest3 mtest4 mtest5 mdb_stat; do
>> +        install -m 755 ${S}/$test ${D}${PTEST_PATH}/tests
>> +    done
>> +}
>>
>> 
>>
