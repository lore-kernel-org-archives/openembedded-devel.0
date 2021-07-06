Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7250.1625582707841511754
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 07:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ps4FqXL7;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2821954714=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166Eej1u008279
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 Jul 2021 07:45:07 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39mmkd85x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 07:45:06 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 166Ej5nN014610
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 Jul 2021 07:45:05 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 39mmkd85x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jul 2021 07:45:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WF50a5appeo2Nt4uCq4tGPo3nFrR0vW6RF9jlkYOxWoo5I6K+t4JfWqFiTWqkvvNCh9S0+VJ2jLeEM91Z0zTR4Kh0vLXcS6aqM41WcLeTFNM82o5pDgAkHyUwoMBlC6RwJRgz3Wt7eQ9S9t0YJVYepQQkUTuYlpCsCqDCQU1pfVotd4wGbr8PH5yjXfsLHQ26y725rHohX3xsjJooDel0AdjneZm6u0t6oKWGzslHNwiNvt27ltKB6Ee/XrpyExrs1KpcKzR8/oXosSTRXNRVyqpf7sfXeMwuYHYWHnb/YNFpfZ4dI2QOr0iE8YUPfB8jBUi1DI5alUft0aQS0R17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsRyv5tAfRbDPzJpcTwyrCAaWr2EtUdhLWmyxx3wcmU=;
 b=J53oBAvldiYdLpEkZhP7AaOds+hcC5Z33caUhVDbdlpHzWaB3mIiKIhyxQK99SAhWpIdzSHeG6TiY5ghrv9jqiryN0TzmlAhjLJZI7GqC7mvI/RO+sUCmvFuZeD+yHTlc0sfMxKRBQLOD/94YDQ551jT2FMo2fwF8mwb8uP8DU+VtvGMHin7p6YHhc+1Hs0uyAHZsA5lz4bH6c/IPuYjO8LCzrJCJ3kcxBqg+6+TXxN6q9ZRXY7PDdjrFkfW5X1Iuby7x72vyFd4pPVTu7q6SutzDxrvMRc2j+lIAuCzK6ED+ldddFZszkfMsgW/V2OobQg0FKO65jlEsFzV805ygA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsRyv5tAfRbDPzJpcTwyrCAaWr2EtUdhLWmyxx3wcmU=;
 b=Ps4FqXL7UXibHYJhJb9Kt/OUm2UvVvgTBJwQQWmXc5QuZLQanUF3pfSBAaSDbID0LgjlzBP4Gfd1+3GaSCFJjd5d/loWplsSxd52JIbHMCCcSxl3OzszM04MSDWn4uxkEUIhZWLUUFFuqv4Fe4zoHWCa/3ZOQhFlGz1xOVxI9v4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2536.namprd11.prod.outlook.com (2603:10b6:a02:c4::32)
 by BY5PR11MB3894.namprd11.prod.outlook.com (2603:10b6:a03:18c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 6 Jul
 2021 14:45:01 +0000
Received: from BYAPR11MB2536.namprd11.prod.outlook.com
 ([fe80::348e:1e92:4134:aaf2]) by BYAPR11MB2536.namprd11.prod.outlook.com
 ([fe80::348e:1e92:4134:aaf2%7]) with mapi id 15.20.4219.025; Tue, 6 Jul 2021
 14:45:01 +0000
Subject: Re: [oe] [meta-oe][PATCH V2] lmdb: add recipe
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210706055708.22017-1-sakib.sajal@windriver.com>
 <CALbNGRQDp57bA=8-J9_0a1pVJ5VnQWn1T24yzwaJ-Y67abo8kA@mail.gmail.com>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <8558922c-9bd3-1c45-9ac3-7ebe377ecaf3@windriver.com>
Date: Tue, 6 Jul 2021 10:44:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CALbNGRQDp57bA=8-J9_0a1pVJ5VnQWn1T24yzwaJ-Y67abo8kA@mail.gmail.com>
X-ClientProxiedBy: YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::6) To BYAPR11MB2536.namprd11.prod.outlook.com
 (2603:10b6:a02:c4::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.20] (70.49.163.59) by YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Tue, 6 Jul 2021 14:45:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44dbea1f-b459-48ba-9eda-08d9408ca270
X-MS-TrafficTypeDiagnostic: BY5PR11MB3894:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB389496006DCC8C3C68C6E421F21B9@BY5PR11MB3894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aOQI/zyf7FrU5Tsz8wHblC2ZkuudIZg8rDZPdJLtb5VMvHGN3ZF96xM8TzF1sZ0rn9REFXPsjze29IK4vE14hbC45qdiUP86ZiqJYaQrVexIIc64ZV4hdC0Xsbps6z02Elt7WxQtkQAFEqsDul8J02hFE9jfKhEXM4EWr27eGn9vVb07VC6P++1UvNHhKwKIkWNeDULWWgNry7Vlv3Qg5PhhEaZ+H+1vcqvZBCRMqCQ5se3idcTo03P476r7FxtKdXx/900qtjNvXlWboBzDkaIMt9XkiVjE/KDoWlWiz96I+9N4i0Y+VapVzQxi59i63Yon04UA/yc44auz3sRKWpkjQTmXNwYII77bPax1K6wf8iBKkJ6qzd7vr9j7uB/Rwuqq02MID0HSlBiiMASJT9sPwlfesXBG3J03d84xNBJQKoNQkdECaDruv2aDUlEOAnPIman1zVSdedse7NUdqFkOLE9wDyLc9B6UTqTuM2Rfj0DXdmVAbU1UgW+VLQZqkENLzPMrvpR8RE9rFZ4N9e6NKSxiZ9T/8dg/QeDdtQZd6ctozK0GmxtGu/fiSn4CijAukKze2CQy0AmTEo6YjqUiYYvlyzkwd0j8KKpTJYQYJetWWDHn4m5eR1CtoaVZsLDL2T8HqPzrB4M2AJe1XYWgOuMINyOS9mFQsPiY2wRkouFyrzwHKVfHfKdq83LfY3ChTFSKn1SGRam6ghAufzdHUR1rGsHC0eYyQ5AILiX15SNz2hqEYCS0W1RtMMUgKrGFt9ZrgTKC7f3ZEgk73cG3ZO/DKs5OQ2IYlzeMbvljDPUJVwSSJr8n9RFU3TzJQEBQJKSKkE1MFYMdyYH04w+y7usYcTT6VNAxQ5nZaxEFninbgyC5DtNS/eTcgNSHs0XFpROwEgoxh+4Zysoy5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39850400004)(36756003)(53546011)(66946007)(83380400001)(478600001)(26005)(38350700002)(44832011)(6486002)(66574015)(6916009)(2906002)(956004)(86362001)(186003)(38100700002)(4326008)(31696002)(2616005)(16576012)(8676002)(31686004)(5660300002)(6666004)(316002)(66556008)(966005)(52116002)(66476007)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MHU2MXVlZGFDYUJ1aDFTSDAwUXBFSjRtZzJpd2k1aGw2N1g4bWtaSk9lZ1Z6?=
 =?utf-8?B?SlYzSVlLTUZDcUJQNmxvMllpWHJSTDBZa3FZUGVOMmk4bTBaWitYRldYVGF2?=
 =?utf-8?B?bzM0RElXcUlKQUdsRkY3VktWSjhQUVBweEZFekFCUjFHSUlTSTRBNVBmd2Fi?=
 =?utf-8?B?MjNWYysvdlNuNFFSZHlSZEJlUkpubnZ1b0hDenBjcVlEeXc1OE1sOERGNy9y?=
 =?utf-8?B?QnZ2L0NaU0VyN3ZscUw4RkZvNk8zeGR0ZGxTWGNXbHFmUm5FbnNOQm54R011?=
 =?utf-8?B?ZFdZby9HTG1HT0tRUk9NcWNRUDJCVHJ3OTV3VWtuRVZ5ZU0zY09CWG9oYk9C?=
 =?utf-8?B?ZTFWWmRvQ3YrNGtiaXQveFNkdjVpVjNYbkw2NGZaQnZCbkRNcHU1N1NPOTUw?=
 =?utf-8?B?M1NnZVB2OEFqMlFEL0NHRUFlVW9mNkF4dmUwODB4RDFkeVMwc2hwSlZ4VS9W?=
 =?utf-8?B?aHJZQTc4anlCK2R5VCtyd0RNaCttZ0tocHpYOG1HWkE4bGRVbjBOQnpzMkwx?=
 =?utf-8?B?QXJ2cjluRGFBWExUanhERC9EdUc1SW8rOUZDRFR0UFFNU1YybnhyWm0rNjNM?=
 =?utf-8?B?T2Z3UFE0ZXVxVHpHcjRBZHZWNnZ1dENFNjVWZWN1RUJFVWE5a25mS20wNFV1?=
 =?utf-8?B?ZURWb2FLMHhnOGxBbHA0ODJPSDNFWGQvMXR6SGhFWkdCUGxIZzE4cXBiTm55?=
 =?utf-8?B?RCsyMXhXOFdjZmJYOVVFRGJZRFRYZVNTNGJKQ2ZzdnN1N2daZFhYd01HdHlI?=
 =?utf-8?B?MjhvQS9GNWR2WFJxUVdmckZITm5sQWgzUk5GMG5VNVRnWHliaWFuK25Kays1?=
 =?utf-8?B?ZkI1TzRQU1dXQ2FjblRreFhkRzFYK2lrRXBrR2lUam1LL0UwWmRya1dtemFG?=
 =?utf-8?B?TWJwVzAvN09WeEx0MDd3d0NzVkZtTVBSQjlKQjh4WXp5anZRQ2FyRWlpdWcx?=
 =?utf-8?B?WVlLbnBtcWNlODRDU2NiNEFmbWFPUGU4RTlDWnk1MWtENjRNTHZEaFhwMk1O?=
 =?utf-8?B?TEFqeXZDTnhZcURkZkk4YTRUaDEyTWJueWFaZUxDdVRnanc1MXpnTzJwK1RL?=
 =?utf-8?B?WUwzZHgzMjhlYnFLMEhUemQ4VWhEN2lmbUJwSzhZL0UzL2JFU0wvZjJGa3F1?=
 =?utf-8?B?RXE3eDBYeGlzUFJYVTU4WkZCUkxqd0N2NW9zL0NLaGY4US81ODIwU2RuajR4?=
 =?utf-8?B?QXhUTkR5UXlvUHQrV1d2NDI4THdGSnAzV2ZWbXh6RXlTTHhRMTJQaHdjcHVY?=
 =?utf-8?B?SFVzeGNVc2hNQnlnWU5VTTZBcUVhc09uTWtkZnBYb0w5bXJaUnFLQ1VzZWlR?=
 =?utf-8?B?TWVSVVIxVFJETVo0RHlVSWdwYUJuYjNSMHJZdk1LbWhlSE5YMlhoUmkwUGFv?=
 =?utf-8?B?RXM2VHdqOEVhRy9ZWTdEL2lvMXNXMWVMUUJoemd4RW9jS0NNeU1DZ1MwcU5C?=
 =?utf-8?B?RTZOU2pKUzZydTdFUXh5V3ZDc2piRzNNZzBUeW1XS0pjNndVWkNBbnRveVd3?=
 =?utf-8?B?Tm1nV1pmUEt4SVBIYlptajJNWGtGTDdaL0FMZHo2ZHNVbDdqcFAxOWhsVktp?=
 =?utf-8?B?WTNiVE4vSTFtWmdLS0ZpRko4OUNEQ2xjaTQ3WEtaRk04V1Y2ZG5lMitGMXhT?=
 =?utf-8?B?QnV6UVZWSFJ6dXhwQVlEUGtKMjhxNXJnQ1hOdjN2YUpGUUFHMFJrVDdmZyt4?=
 =?utf-8?B?aGZnZ24yQkg5Z0ZPcitzUXhlTlF1OUlNU1J2TlovWkxzSTl2U1NKUEQ1UytC?=
 =?utf-8?Q?+/qyQFSamlQyexMfvMsG5WMQRWRE18nH4OdM/Z/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44dbea1f-b459-48ba-9eda-08d9408ca270
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 14:45:01.6353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4w9IK77L+5UXPXoNq4HXfa5BFlMWbXeIoAHlX+127CU2dotw7zRs+Sit5nGKxeZwM4HHqnY48HdunQ6J8889OZQeUGFOfDTcTxGGmqvnyno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3894
X-Proofpoint-ORIG-GUID: V9DcG6S9KXyvLQ_biqq7mhjDqYzbwiun
X-Proofpoint-GUID: 8nyqZ8zL8UW--XpHV5jdVeFh4TMnpxwx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-06_07:2021-07-06,2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060068
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 166Eej1u008279
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 2021-07-06 2:10 a.m., Andreas M=C3=BCller wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Tue, Jul 6, 2021 at 7:57 AM Sakib Sajal <sakib.sajal@windriver.com> w=
rote:
> Sorry for being late here - and I am aware that this causes you more
> effort than you expected (that's why I kept lmdb in meta-qt5-extra :).
>> lmdb provides a high-performance embedded transactional
>> database in the form of a key-value store.
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>   .../packagegroups/packagegroup-meta-oe.bb     |  1 +
>>   meta-oe/recipes-dbs/lmdb/files/run-ptest      | 14 +++++++
>>   meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb       | 39 ++++++++++++++++++=
+
>>   3 files changed, 54 insertions(+)
>>   create mode 100644 meta-oe/recipes-dbs/lmdb/files/run-ptest
>>   create mode 100644 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
>>
>> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb=
 b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>> index 1b21ec654..c83bd0913 100644
>> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>> @@ -211,6 +211,7 @@ RDEPENDS_packagegroup-meta-oe-dbs =3D"\
>>       influxdb \
>>       leveldb \
>>       libdbi \
>> +    lmdb \
>>       mariadb \
>>       postgresql \
>>       psqlodbc \
>> diff --git a/meta-oe/recipes-dbs/lmdb/files/run-ptest b/meta-oe/recipes=
-dbs/lmdb/files/run-ptest
>> new file mode 100644
>> index 000000000..9c9e6e70d
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/lmdb/files/run-ptest
>> @@ -0,0 +1,14 @@
>> +#!/bin/sh
>> +
>> +cd tests
>> +
>> +for t in mtest*
>> +do
>> +       rm -rf testdb && mkdir testdb
>> +       ./$t > /dev/null
>> +       if [ $? -ne 0 ]; then
>> +               echo "FAIL: $t"
>> +       else
>> +               echo "PASS: $t"
>> +       fi
>> +done
>> diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-=
dbs/lmdb/lmdb_0.9.29.bb
>> new file mode 100644
>> index 000000000..7f97a0d15
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
>> @@ -0,0 +1,39 @@
>> +# SPDX-FileCopyrightText: 2017-2019 Volker Krause <vkrause@kde.org>
>> +# SPDX-FileCopyrightText: 2019 Hannah Kiekens <hannahkiekens@gmail.com=
>
>> +#
>> +# SPDX-License-Identifier: MIT
>> +
>> +SUMMARY =3D "Lightning Memory-Mapped Database (LMDB)"
>> +HOMEPAGE =3D "https://symas.com/lightning-memory-mapped-database/"
>> +LICENSE =3D "OLDAP-2.8"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D153d07ef052c4a37a8fac23bc60=
31972"
>> +
>> +SRC_URI =3D " \
>> +    git://github.com/LMDB/lmdb.git;nobranch=3D1 \
>> +    file://run-ptest \
>> +"
>> +SRCREV =3D "LMDB_${PV}"
>> +
>> +inherit base ptest
>> +
>> +S =3D "${WORKDIR}/git/libraries/liblmdb"
>> +
>> +do_compile() {
>> +    oe_runmake CC=3D"${CC}" SOEXT=3D".so.${PV}" LDFLAGS=3D"-Wl,-soname=
,lib${PN}.so.${PV}"
>> +}
>> +
>> +do_install() {
>> +    oe_runmake CC=3D"${CC}" DESTDIR=3D"${D}" prefix=3D"${prefix}" libp=
refix=3D"${libdir}" manprefix=3D"${mandir}" SOEXT=3D".so.${PV}" LDFLAGS=3D"=
-Wl,-soname,lib${PN}.so.${PV}" install
>> +    cd ${D}/${libdir}
>> +    ln -s liblmdb.so.${PV} liblmdb.so
>> +    rm liblmdb.a
>> +}
>> +
>> +INSANE_SKIP +=3D "ldflags"
> ^ This one should be taken seriosly - what step made it necessary?

removing the variable, the following error occurs:

ERROR: lmdb-0.9.29-r0 do_package_qa: QA Issue: File=20
/usr/lib/liblmdb.so.0.9.29 in package lmdb doesn't have GNU_HASH (didn't=
=20
pass LDFLAGS?)
File /usr/bin/mdb_dump in package lmdb doesn't have GNU_HASH (didn't=20
pass LDFLAGS?)
File /usr/bin/mdb_copy in package lmdb doesn't have GNU_HASH (didn't=20
pass LDFLAGS?)
File /usr/bin/mdb_stat in package lmdb doesn't have GNU_HASH (didn't=20
pass LDFLAGS?)
File /usr/bin/mdb_load in package lmdb doesn't have GNU_HASH (didn't=20
pass LDFLAGS?) [ldflags]
ERROR: lmdb-0.9.29-r0 do_package_qa: QA Issue: File=20
/usr/lib/lmdb/ptest/tests/mtest in package lmdb-ptest doesn't have=20
GNU_HASH (didn't pass LDFLAGS?)
File /usr/lib/lmdb/ptest/tests/mtest2 in package lmdb-ptest doesn't have=
=20
GNU_HASH (didn't pass LDFLAGS?)
File /usr/lib/lmdb/ptest/tests/mdb_stat in package lmdb-ptest doesn't=20
have GNU_HASH (didn't pass LDFLAGS?)
File /usr/lib/lmdb/ptest/tests/mtest5 in package lmdb-ptest doesn't have=
=20
GNU_HASH (didn't pass LDFLAGS?)
File /usr/lib/lmdb/ptest/tests/mtest3 in package lmdb-ptest doesn't have=
=20
GNU_HASH (didn't pass LDFLAGS?)
File /usr/lib/lmdb/ptest/tests/mtest4 in package lmdb-ptest doesn't have=
=20
GNU_HASH (didn't pass LDFLAGS?) [ldflags]
ERROR: lmdb-0.9.29-r0 do_package_qa: QA run found fatal errors. Please=20
consider fixing them.
ERROR: Logfile of failure stored in:=20
/yow-lpggp31/ssajal/builds/yocto/fresh_lmdb/tmp-glibc/work/core2-64-oe-lin=
ux/lmdb/0.9.29-r0/temp/log.do_package_qa.12896
ERROR: Task=20
(/yow-lpggp31/ssajal/repos/meta-openembedded/meta-oe/recipes-dbs/lmdb/lmdb=
_0.9.29.bb:do_package_qa)=20
failed with exit code '1'

>> +
>> +do_install_ptest() {
>> +    install -d ${D}${PTEST_PATH}/tests
>> +    for test in mtest mtest2 mtest3 mtest4 mtest5 mdb_stat; do
>> +        cp ${S}/$test ${D}${PTEST_PATH}/tests
>> +    done
>> +}
>> \ No newline at end of file
>> --
>> 2.32.0
>>
>>
>>=20
>>
