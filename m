Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.66])
 by mx.groups.io with SMTP id smtpd.web11.4631.1612504613987517135
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 21:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fpdeQ6ex;
 spf=pass (domain: windriver.com, ip: 40.107.243.66, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cq/h5BoguTg4nOM6EJP1pP7bFBZ26+hlH/ngKrY4tza6y1kPos2Am+T7kzPGC+4lLI+Jq73iUNuctri3xzXfnHhOO2yxccA/YB8E4wlZCimeppeaAEnVcIELQhEmRdGDNltY8VI5y+BqwL6rQYlqGuypgkaNTvWoonN4jkJ4fvxvtr09GUvBLyHwsVxqWg1mguD5G1r3vi+3d5vgNiMydQ8GmlBAEqfJcurRNYgwmjr7FRPkLEq9tYrZVH8vGEx3cGEclpv+5B5Rvbm80dx2bFRtLOT+RPCaGIncvHEgk91o67kyl7O1rJ7IsvcBXNz0EpzV/hTH9aNtfY1KU7b/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwIX0X6MisFfhim21bhLkdX+2CYRcBzaiH73u06lZYU=;
 b=TZzIrbgSbumVXqde90ocMv+y6OObBeDnRMBGpdQCF5UIHQgTxcVdIG3qpdf9sPDfnFWVvzmuCR6kQOEdiIIcg0fjKHAT4CHJKPuXIMBlE18IV8HM8eSbnwttglTzwKueRNsfsOXWiMMVtzmp2E7G9lCe9YhtPUsebrDEGS+722U93sNp4dZNZqTs5P3tmp1JoVS/BkP7/f9cllClZm0YSspUh04GGII6luks2iB7SZDXITrdPSYk5fEQGEPgd1M6pyoiw6k6lBORbjd28nfU6uOT/Lo24poXWig+svCU8npXSUtUb/gyu2x6zCu/xMC5VCG9KLqcEuZowtM3Kvqi+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwIX0X6MisFfhim21bhLkdX+2CYRcBzaiH73u06lZYU=;
 b=fpdeQ6ex4i74JRdN8OWBCGoGe2I8FBd3C6tIsxFDJXzqanN90x/qwqwKfNH3uqXDrQ44pybEM665P4t+NpmToPqTbx+9xYuXAiADLGLyl3hkxaio9mAfU3LBW0e/I2r4s2FZOdllFRu2HLQG5BBzXowq/rMhl1a7Ewxi6rRlnms=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM5PR11MB1546.namprd11.prod.outlook.com (2603:10b6:4:d::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16; Fri, 5 Feb 2021 05:56:51 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a500:2ae3:a6c4:bc13]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a500:2ae3:a6c4:bc13%4]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 05:56:51 +0000
Subject: Re: [meta-networking][PATCH] lksctp-tools: make conpatible to autoconf-2.70
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-devel@lists.openembedded.org
References: <20210204103441.98459-1-hongxu.jia@windriver.com>
 <440305ac-6868-7086-1329-ddaa36d21d0c@gmail.com>
From: "hongxu" <hongxu.jia@windriver.com>
Message-ID: <94f32371-637f-73fe-652c-3237d8db7d94@windriver.com>
Date: Fri, 5 Feb 2021 13:56:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <440305ac-6868-7086-1329-ddaa36d21d0c@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0010.apcprd03.prod.outlook.com
 (2603:1096:202::20) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.131] (60.247.85.82) by HK2PR0302CA0010.apcprd03.prod.outlook.com (2603:1096:202::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Fri, 5 Feb 2021 05:56:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04a1b30e-ed14-4cda-9c43-08d8c99ad4bd
X-MS-TrafficTypeDiagnostic: DM5PR11MB1546:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1546753D442F2E34C38B7F0C94B29@DM5PR11MB1546.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L569KUb60f8yCShQ3IPz+n8uXZbr9osZcVX5mtt1y7Ps8rD5sdJcb2fy+4s7ahdQuLg9CtQZDEFl5quTPOzcMA8y+iK10dLljrngvMc+wZVVUAGUL6r69L2tngzeU9ym4UjmROdaXbBTYFvXXHBN7jIPmaR6+eu9F5Ar0j9ikvxs9e3q5ERNJoegKOv5eEJHyxjSHxdVUo/6DvNIYegq9DIHLbFQztwCxxSEnBCZj47Co30kSw+Wk7qPIeUdW/nUsD0fL9xIYuOg7E3rvDw4hGEAoNgFQkjpd6/chZR1cdcNXvqMqVMT5MzABh12ZpCy692VTohkZvlb3I/WEPH2Fu2eqCDMWXv18QBdBzOzE4U86JJWenNWL+K2WRFZdgWj8iO7hoJthZblh716KQ3ppn1F6rh8SYa1+6MOXvY2GAuF4nWuTZf3tOXOmctsI5aA2XpKdZmDd23yi5/Y9gWT5z9rzUwe8r184mollR41dHAtkQW+ZZSjk1bNYCm7Tob3KEFCfCHaCZlweVHpKbY5WXRuQxptjOtjlaA0WpFcipFpxFvNd5h7W5u8x97GP4TkYi8e4caelFNIXVCAUiHA/pTrYmiCtGbtggM/cd5nvhzXC8usoCod7MbC+TQM/2g3cI6a+6OLMP2XEQG2mkSHMoXAAEsrwMsA0nHbMdPgT8iILtwnXeAGWTzWUifHgJwj6A4zRUQwCjzo9CE49qhavw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(366004)(136003)(346002)(4326008)(8676002)(52116002)(16576012)(5660300002)(316002)(478600001)(36756003)(66556008)(8936002)(66476007)(44832011)(2906002)(31696002)(86362001)(6706004)(6486002)(6916009)(956004)(31686004)(6666004)(53546011)(83380400001)(26005)(2616005)(16526019)(186003)(66946007)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?/UULg+ElKVdyPaufaoqjTpm228WnkRSIAWJyWeY546/SlZVw4syKpqm/HEj6?=
 =?us-ascii?Q?AXxutE8Y78E/kdATyqUApIAzfIntt0iIp+dlWbX96clJAXmWLqs8U+a32w2e?=
 =?us-ascii?Q?VZCCqk+O5/25b24X72FaD+nSZvmJzayKxSJuNLkw6arlxKTnzCHTtIaNedom?=
 =?us-ascii?Q?RL/KpmMM7mX9PT1L/lZoXi89XK8YkJ9zF9S3/0JqhMCicWvQOwwVw1YbLuXx?=
 =?us-ascii?Q?U7XjG/DEv1MWnqNuumDk8M1+tng+Mu5FmLMiT8Tut1lLqvlZ5TtQJbNLDDiU?=
 =?us-ascii?Q?cjcFdTnZ983caoev2lyLxBVUb9gE+pMohYiYAzTIz3gLNJu+2dC6eE3cRrXy?=
 =?us-ascii?Q?L8h4cLZ+RWDyqFn1P9HeNuI6HzwwDIkAzSH/ZbjSEROzCxBDLXNaY17QeCgB?=
 =?us-ascii?Q?+DsfgfQYH0pcBjoELBfornA1Uotz4lq+z9W1sSq8rOAeWGNMgJQEmiHNbfwp?=
 =?us-ascii?Q?Uti6QV1ADmRuUyLCAGh+ZwO6vCCvffJgsmaQ+M1IFeJOZCKUVUlavyr/oCI5?=
 =?us-ascii?Q?+jSOeV0dnSU0DVn1hquxnLMuKv/o7cBpTxSBxilDphYxoZ3g+/G/y13vLIrv?=
 =?us-ascii?Q?BnSVO3sqh9hLiO4km0vX9zFBh7GYckOrqO/5XZxpi/FeScfH0no6opXzJw14?=
 =?us-ascii?Q?4lgFH39rDpXatcbegRsjbZWo8q8myaz+anyKo2bNJtl8ztpqKxgeYquiImCB?=
 =?us-ascii?Q?tGVlndycoTZM9XzSnFYi7A9Ocvq5LKQxYdsK+nf9+f2UByWlRnEHrxZ57NQR?=
 =?us-ascii?Q?77wlHkqAEjhJdXsIprkRtta+kJrZADrn+OWlBcVwVTzM0gaQqneFKlSOQzX1?=
 =?us-ascii?Q?zuFxhfxveilKBeROyXVW9l5dSoRiE2wA2BK1/2g7Q1PxH+dC0Z6XUm4yXQ7o?=
 =?us-ascii?Q?bqicHMkTtG/opIJaY1g7koS3U9s4hgJc860EQMeMZ9j4pJwn6yjEI7VTYNbc?=
 =?us-ascii?Q?k2RLM3l4Jg89wA7EGJk7OgROBz3r44MmV7/3MiUZvWL5nMG/JRJN19B9mNSO?=
 =?us-ascii?Q?EF0JDVV2cUZP/BH+dHo6s++Jx6ZzwByznNA9tIdwgcstdAP2JN1YDxxCY97t?=
 =?us-ascii?Q?biIH/0S34VH9PFcwQj4qI+5OV6+291bkkwBPFY30kdzpZGrdfp5+cMTSiqKD?=
 =?us-ascii?Q?nU60w9Qts1JhCfUaENFNdwgoIMzDqXgUHv8NnUZhIz/ESPRDJsof4XwND7rd?=
 =?us-ascii?Q?u7R3F2aDKoUH2dVqUSONfdrCYxkuzXgJzhMkTGjaTBDl0WNdnK5OQyzWO43Y?=
 =?us-ascii?Q?3+4WFu/YfU3abKcNTiXVpiwTRjt4iS1plHTLL2xCqcdjgeYVF7jc3HyhL5mh?=
 =?us-ascii?Q?PWIQqiJ5t7K8raAXHApWZPEp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a1b30e-ed14-4cda-9c43-08d8c99ad4bd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 05:56:51.1903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPAqfRA7OKhaaGNCGi6EQY5ih0TQwZFuB9V5lFWoYdGzlvrp857VK429FjcMZD/zBunsp8iM3ruU2rfCaik+N6GoBUEmSaW0Ktu97tOOGhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1546
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 2/5/21 1:25 AM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 2/4/21 2:34 AM, Hongxu Jia wrote:
>> ...
>> ./configure: line 16398: syntax error: unexpected end of file
>> ...
>>
>> Backport a commit from upstream to fix it
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>> =C2=A0 .../corosync/corosync_3.0.3.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 ....m4-make-conpatible-to-autoconf-2.70.patch | 89 ++++++++++++++=
+++++
>> =C2=A0 2 files changed, 90 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-m4-sctp.m=
4-make-conpatible-to-autoconf-2.70.patch
>>
>> diff --git=20
>> a/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb=20
>> b/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
>> index c0531d386..7e0b5d5ca 100644
>> --- a/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
>> +++ b/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
>
> should this be
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
> instead ?
>
Sorry, my mistake, V2 incoming

//Hongxu

>> @@ -8,6 +8,7 @@ SECTION =3D "base"
>> =C2=A0 inherit autotools pkgconfig systemd useradd
>>
>> =C2=A0 SRC_URI =3D=20
>> "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz=
=20
>> \
>> + file://0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://corosync.conf \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> =C2=A0 SRC_URI[sha256sum] =3D=20
>> "20eb903eb984f6a728282c199825e442e8bba869acefd22390076ef3a33a4ded"
>> diff --git=20
>> a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-m4-sctp=
.m4-make-conpatible-to-autoconf-2.70.patch=20
>> b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-m4-sctp=
.m4-make-conpatible-to-autoconf-2.70.patch=20
>>
>> new file mode 100644
>> index 000000000..484af4e0f
>> --- /dev/null
>> +++=20
>> b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-m4-sctp=
.m4-make-conpatible-to-autoconf-2.70.patch
>> @@ -0,0 +1,89 @@
>> +From d6d7130f0a2e3b81880fca29966e42c1b2be40a7 Mon Sep 17 00:00:00 2001
>> +From: Sergei Trofimovich <slyfox@gentoo.org>
>> +Date: Fri, 8 Jan 2021 22:22:52 +0000
>> +Subject: [PATCH] m4/sctp.m4: make conpatible to autoconf-2.70
>> +
>> +On recently released `autoconf-2.70` generated `./configure`
>> +fails as:
>> +
>> +```
>> +$ ./configure
>> +...
>> +checking for struct sctp_event_subscribe.sctp_stream_reset_event... yes
>> +checking for gcc options needed to detect all undeclared=20
>> functions... none needed
>> +./configure: line 16464: syntax error: unexpected end of file
>> +```
>> +
>> +This happens becuase new autoconf generates less whitespace:
>> +
>> +```
>> +{
>> +if ...
>> +...
>> +fi}
>> +```
>> +
>> +It requires at least whitespace between `fi` and `}`.
>> +
>> +As input already has newlines the change just drops extra `{}`.
>> +
>> +Tested on `autoconf-2.69` and `autoconf-2.70`.
>> +
>> +Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
>> +Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
>> +
>> +Upstream-Status: Backport [git://github.com/sctp/lksctp-tools.git]
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +
>> +---
>> + m4/sctp.m4 | 12 ++++++------
>> + 1 file changed, 6 insertions(+), 6 deletions(-)
>> +
>> +diff --git a/m4/sctp.m4 b/m4/sctp.m4
>> +index 6593517..94527a6 100644
>> +--- a/m4/sctp.m4
>> ++++ b/m4/sctp.m4
>> +@@ -6,7 +6,7 @@
>> +
>> + # Macros to assist on probing kernel features
>> + #=C2=A0=C2=A0 Probes if a type is defined
>> +-AC_DEFUN([LKSCTP_CHECK_TYPE], [{
>> ++AC_DEFUN([LKSCTP_CHECK_TYPE], [
>> + AC_CHECK_TYPE([$1],
>> +=C2=A0=C2=A0=C2=A0=C2=A0 AC_DEFINE([$2], 1,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 [Define if $1 is present.])
>> +@@ -22,10 +22,10 @@ AC_CHECK_TYPE([$1],
>> + #ifdef HAVE_LINUX_SCTP_H
>> + # include <linux/sctp.h>
>> + #endif
>> +-])}])
>> ++])])
>> +
>> + #=C2=A0=C2=A0 Probes if a struct has a given member
>> +-AC_DEFUN([LKSCTP_CHECK_MEMBER], [{
>> ++AC_DEFUN([LKSCTP_CHECK_MEMBER], [
>> + AC_CHECK_MEMBER([$1],
>> +=C2=A0=C2=A0=C2=A0=C2=A0 AC_DEFINE([$2], 1,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 [Define if $1 is present.])
>> +@@ -41,10 +41,10 @@ AC_CHECK_MEMBER([$1],
>> + #ifdef HAVE_LINUX_SCTP_H
>> + # include <linux/sctp.h>
>> + #endif
>> +-])}])
>> ++])])
>> +
>> + #=C2=A0=C2=A0 Probes if a declaration is present
>> +-AC_DEFUN([LKSCTP_CHECK_DECL], [{
>> ++AC_DEFUN([LKSCTP_CHECK_DECL], [
>> + AC_CHECK_DECL([$1],
>> +=C2=A0=C2=A0=C2=A0=C2=A0 AC_DEFINE([$2], 1,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 [Define if $1 is present.])
>> +@@ -60,4 +60,4 @@ AC_CHECK_DECL([$1],
>> + #ifdef HAVE_LINUX_SCTP_H
>> + # include <linux/sctp.h>
>> + #endif
>> +-])}])
>> ++])])
>> +--
>> +2.27.0
>> +
>>

