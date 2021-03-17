Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.88])
 by mx.groups.io with SMTP id smtpd.web12.1086.1615945481341152455
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 18:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZouZZY0k;
 spf=pass (domain: windriver.com, ip: 40.107.93.88, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITwKQRtZDCdbOpeutKm5CUuvfbUKgTLMD7D2RaUXGOMmteOicis8IQOtfFK6GYSByCmBTd35xTGRB99Ci8T3l+da3lLQj5Syo4RV/fOMBXrEpQlQ7kVfe1lE9tk0kE7EFHmjFFvbpRg9GogA30iQyHdPhitlFOhjrUS3PmJarMt5HhP5RKPvpTAHBbvqxNEcJXlf0ZaSPRMQnxagCz0aRb1DOX1ZyQ6JN4OqO20lBCMqNrgHTuMTIx8v1h59IG8z+GGW+JKQH/InH6J936fe2WEAuRPpXOWgPmUGHDELx61YtisT5MByE5skVAaczy6xUfCDvDn77JUysTfhZwZSoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bM8YOGBlCtwPRyO1C1v+2PP6KQbV43xddvgdTq2zjjI=;
 b=QXR4dzXcTtnyrgmsKIejG+O9H/oRjEVBpCkD7IKsc6whLssePROUyfQ4G9urwkUeDSWcdbePFxlMYYAwfyCuYieuh9l1iYeFWkle7skq//AVOVmSEgGDb4dB9UBNJ6xLiqj1URdtKN6AG5t+6N9LhMpYIec0uoxzuj8b2V9ecEgAaZbn3mrXrjLTcT+ko30h1NlcwwU7UVnD0bfx3Yvl5nOR4YSZW0VosHfYGNDQkbb44532jrn8d0GnOe5BqVg772wLbAAUrK4hoJmQ5GorO52a6hix/aD4Pkm9kaeconaVT0ZfVaSuuLW5Sq4FZ6Yp2TbX14RcyfMyfiXgRYjzsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bM8YOGBlCtwPRyO1C1v+2PP6KQbV43xddvgdTq2zjjI=;
 b=ZouZZY0kp1FKAInrnM13kPP19hFH+yQavhoNaexAfmVyaEn6o1Rq0m76zdt3jcNXOMyod64uGGFCWki0XxsB5uEpyC2ShoNb9w2kDJmxryHosJ5MTg6luVG9y69yk1G+XNKjs7EnFVQh/xXMjNKWIF8S9xRAQjgELHQdQvYmqtA=
Authentication-Results: ossystems.com.br; dkim=none (message not signed)
 header.d=none;ossystems.com.br; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB2537.namprd11.prod.outlook.com (2603:10b6:5:cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 01:44:39 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 01:44:39 +0000
Subject: Re: [oe] [meta-oe][PATCH] tclap: upgrade 1.2.2 -> 1.4.0
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org,
 lans.zhang2008@gmail.com, Otavio Salvador <otavio@ossystems.com.br>
References: <20210315155528.1471897-1-Randy.MacLeod@windriver.com>
 <39e112d5-79f7-da6b-4d26-4824b8201785@gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <db9b3a7f-4e30-40df-3f4f-f2bd3bbd1589@windriver.com>
Date: Tue, 16 Mar 2021 21:44:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <39e112d5-79f7-da6b-4d26-4824b8201785@gmail.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::14) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR03CA0009.namprd03.prod.outlook.com (2603:10b6:a03:33a::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Wed, 17 Mar 2021 01:44:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b48ccb36-0a3b-4595-07a7-08d8e8e63a58
X-MS-TrafficTypeDiagnostic: DM6PR11MB2537:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB25373E317F54E36A67491D26F86A9@DM6PR11MB2537.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DDia1u6Z01VWzdZSq3kLPkRIOjTiCSI+BdanELZXlb0GiWCT4zhvvvljxyIgWGlajgV5/0QpmALpACcgw8FGoyWYXGOZdtc3biGQi3vJTtpAseCcIpdhkXuPs7XM5jqegPcOzCbudCXyQBenKRhsFQorZgkbZxwQmIP17RvE3TXR4quyejPASR5/8plqleoRIMeOdGsHpvhmeB3P3FeH46A0luzO0v4SM7J4zKT9BRwe/UKgaQJ1ELruwpu3+IQG5woAFaMrJCyGmCmutO97PlY+BQ9DXUX3NG0fnTSVFiJfHTxcMF3SEzpMua7A39Z5hWWE+EvKgp5WrF2BLS5YcDjrkdCc4/6350ezh/yla3thFJgUcZ2qkucmAMJubqky3K1NN8cMSjaplQO1+lR8opXfABIKNRP8vMX7TQEtIFpMrblFv9gO7ANquHV2hJH/A7DXGbSmZUloTpgbbryBm0yYv/5UXCiKhlXtcdBB/vBqXrLYbBQWF2eC68fgenNAar4xC974V3rHDk6kkyDp3aNF9/fEFg/WYCjvhutVd+oXQwQ5wo4sSf5T5HO13UTGEWIpXqYyn2VYZ/lG/9EfjIyxN8oiSDmFPQh5vbRnZgEDZNYK7o0ihfU963BlVbIKY9E2XQEs3qQzsEfZbf5yFjW+90Ewa1Cw46AzisVQTxKqvUnBRb9FVNxhhV3mYXZeSHDBaUp5IwWcdMXQOGbRYMiHRY5xwKjdNo84hDh00Fk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(366004)(376002)(346002)(36756003)(31696002)(6666004)(186003)(16526019)(26005)(2906002)(966005)(66556008)(6486002)(53546011)(66476007)(66946007)(86362001)(16576012)(5660300002)(956004)(110136005)(83380400001)(478600001)(8936002)(52116002)(316002)(8676002)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?fseZ+XMTPDbLGuBxuYjLkkQ3EjPqsj4vmpIAPwsJ7x1zRTr3iLy1fggl+DPs?=
 =?us-ascii?Q?tljTShDjwD0v70o0CMjud4GZ96TMgIdKhbc/w73ry/5kif/C9tsKyPVgrZLs?=
 =?us-ascii?Q?wW/E8RG9qlLshCFhw1ykBjK3TIsAjjPCP7oJGUPM8C//wMR4HDQwuZV3lxYt?=
 =?us-ascii?Q?lcU1RtdvNe4o/lAREy+pdaCJ/pTMY3jtK+08ad7xaKtR7z1vpEAQvtGPHaMT?=
 =?us-ascii?Q?ivXpPyJspKRxlXCjIqA31TpdBQ8ZssjSGw0DvHESk8yNkcNQv4Vm9Syeaspr?=
 =?us-ascii?Q?dG82weka3T44a38hxb+KqM/QQrwJtztOV897prIe0M+XhdnZUw/6iLpfR/cE?=
 =?us-ascii?Q?h5mx3pqr7VsQXCW2Q6JFF6sGdu0du30V9dkYrGVEn0yJAUvJWMoBZZwxudmm?=
 =?us-ascii?Q?xiH5MoJ6qY/oazeGgFGAo5uZ6TSI2hz95f1dcFrsjQdFvDSwsSucZPu9h1M5?=
 =?us-ascii?Q?irsohjeoSMB2hWCQ0uMDY05fkGHLG+hLmfGoFxG0k9CzTNUga5AwNqnaG67U?=
 =?us-ascii?Q?tVyCZk2+9fSF3dwA+VJRJ2otzY+g63V4vNbwHESd4FSqQ7mvHNI8VLxiMo4C?=
 =?us-ascii?Q?HHXQcFQ3BJnctJeafyEAa4TwAHMMtw5SQNY5Dz08QzQI79rSUfk9Xp0+9SFD?=
 =?us-ascii?Q?jUCv9GLOPiWK0/TwXproQxkg0s0fiGzSzVniyxQn/YPUO93yFcK13Bob/0aB?=
 =?us-ascii?Q?DvSE8ErFkmWCcAHlBgoM/r9LSAbo3e2HEPAqOiPjeTAkXNlq1wn2c1hDhtFn?=
 =?us-ascii?Q?QZGxHipM5kLi4q/Hlv/9Q4a+ER6bLDLWfsl0bk3bFihlvJdOYDcuvQvOGXWK?=
 =?us-ascii?Q?kjWdcxf0JqGrpCRTWAGN/+TbI8zMJpA3uMP07UjlRo1dDI2Yf24lpeV7OFqP?=
 =?us-ascii?Q?oFfmuVaTgDVGNat86RtIVEiTu3YyYPWoxtLH3WFGa+yvL7YHyoeyuKmOqgUh?=
 =?us-ascii?Q?2jSV6D6Ur+0Jou54PHg8aAh3Ad4mLZR7C3lwh4Q4ThGMAuWjWFPUQzRF/h+Z?=
 =?us-ascii?Q?gdGA3JhBsb8hMmXybjyzI4C4z6FEv3D9GS7SmCz69oZ6K3wksIHtSa8KexdM?=
 =?us-ascii?Q?Fa3NlHJIdkfeiPOeGwNzWxqTc7Rrmsb9dVC4lXneg9FMsBYZWbetpPyFduQ3?=
 =?us-ascii?Q?yQuUTXIKAtzEFdre2/HewkflBO17VRNNN5L3TkO6rJjYh8o46HckBB94DSHY?=
 =?us-ascii?Q?ijCwmfK30ZTnI9GNjrmml8iOS2TIrnxPotXBVAbBt90qWmWtux1RzV8UlFUu?=
 =?us-ascii?Q?+FmBCFImsD2FYepA/KSj5PLNS+SBwABX5A4mWWnOUSMO8eTFw4Zb9X5+dATB?=
 =?us-ascii?Q?iWB+g2tDabKDc3TLOUQQ/KhJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b48ccb36-0a3b-4595-07a7-08d8e8e63a58
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 01:44:39.3394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IiTKIMD0n9JK+I0LVqO/IiSM50gVQmw9HOmELFmHdR04M2xa/e35Qyuu4OkgokC7TfaR1O6nOUuy3maiOzNi+jRuZXQMmxgZ11pdzNOqRUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2537
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-03-15 2:47 p.m., Khem Raj wrote:
>=20
>=20
> On 3/15/21 8:55 AM, Randy MacLeod wrote:
>> Project switched from autotools to CMake so drop the Makefile.am patch.
>> The COPYING file copyright years were updated. Add description.
>>
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> ---
>> =C2=A0 .../tclap/Makefile.am-disable-docs.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0 | 31 -------------------
>> =C2=A0 meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb | 16 ----------
>> =C2=A0 meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb | 22 +++++++++++++
>> =C2=A0 3 files changed, 22 insertions(+), 47 deletions(-)
>> =C2=A0 delete mode 100644=20
>> meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch
>> =C2=A0 delete mode 100644 meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
>> =C2=A0 create mode 100644 meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
>>
>> diff --git=20
>> a/meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch=
=20
>> b/meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch
>> deleted file mode 100644
>> index 358cbefdd..000000000
>> --- a/meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.pat=
ch
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -From c209ed0e7ffca32fe3714bad9cc54bdb00c286bb Mon Sep 17 00:00:00 2001
>> -From: Ting Liu <b28495@freescale.com>
>> -Date: Mon, 15 Apr 2013 16:28:37 +0800
>> -Subject: [PATCH] Makefile.am: disable docs
>> -
>> -Upstream-Status: Inappropriate [OE specific]
>> -
>> -docs need some generating tool (for example, doxygen) from host which=
=20
>> may
>> -be not available. Disable it to avoid build issue.
>> -
>> -Signed-off-by: Ting Liu <b28495@freescale.com>
>> ----
>> - Makefile.am |=C2=A0=C2=A0=C2=A0 2 +-
>> - 1 files changed, 1 insertions(+), 1 deletions(-)
>> -
>> -diff --git a/Makefile.am b/Makefile.am
>> -index 0a6ebc9..6b42f41 100644
>> ---- a/Makefile.am
>> -+++ b/Makefile.am
>> -@@ -1,7 +1,7 @@
>> -
>> - ACLOCAL_AMFLAGS =3D -I config
>> -
>> --SUBDIRS =3D include examples docs tests msc config
>> -+SUBDIRS =3D include examples tests msc config
>> -
>> - pkgconfigdir =3D $(libdir)/pkgconfig
>> - pkgconfig_DATA =3D $(PACKAGE).pc
>> ---
>> -1.7.5
>> -
>> diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb=20
>> b/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
>> deleted file mode 100644
>> index bba8d5c21..000000000
>> --- a/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -SUMMARY =3D "Templatized C++ Command Line Parser"
>> -HOMEPAGE =3D "http://tclap.sourceforge.net/"
>> -LICENSE =3D "MIT"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0ca8b9c5c5445cfa7af7e78fd27=
e60ed"
>> -
>> -SRCREV =3D "ec3ddcfe41b0544a4551a57439b6b3682fe31479"
>> -SRC_URI =3D "git://git.code.sf.net/p/tclap/code;branch=3D1.2 \
>> -=C2=A0=C2=A0=C2=A0 file://Makefile.am-disable-docs.patch \
>> -"
>> -
>> -S =3D "${WORKDIR}/git"
>> -inherit autotools
>> -
>> -ALLOW_EMPTY_${PN} =3D "1"
>> -
>> -BBCLASSEXTEND =3D "native nativesdk"
>> diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb=20
>> b/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
>> new file mode 100644
>> index 000000000..13f66e47d
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
>> @@ -0,0 +1,22 @@
>> +SUMMARY =3D "Templatized C++ Command Line Parser"
>> +HOMEPAGE =3D "http://tclap.sourceforge.net/"
>> +DESCRIPTION =3D "TCLAP is a small, flexible library that provides a=20
>> simple interface \
>> +for defining and accessing command line arguments. It was intially=20
>> inspired by the \
>=20
> typo - initially
>=20
>> +user friendly CLAP libary. The difference is that this library is=20
>> templatized, so \
>=20
> typo - library

Heh, I copied directly from the SF page so I opened:

   https://sourceforge.net/p/tclap/bugs/32/

and I'll fix the typos in v2.

>=20
>> +the argument class is type independent. Type independence avoids=20
>> identical-except-for-type \
>> +objects, such as IntArg, FloatArg, and StringArg. While the library=20
>> is not strictly \
>> +compliant with the GNU or POSIX standards, it is close. \
>> +"
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5c64b2e8cc50917b2744a90950f=
aa7cd"
>> +
>> +SRCREV =3D "799a8b1f99818e39fee19d0601030770af1221e1"
>> +SRC_URI =3D "git://git.code.sf.net/p/tclap/code;branch=3D1.4 \
>> +"
>> +
>> +S =3D "${WORKDIR}/git"
>> +inherit cmake
>> +
>> +ALLOW_EMPTY_${PN} =3D "1"
>=20
> is this still needed ?

Yes, err maybe?

tclap will build fine but if I build ima-inspect it fails
because tclap-1.4 using cmake doesn't produce a .pc file.

The tests I did on the weekend for ima-inspect were using tclap-1.2.
Oops.

I'll figure out what to do but it's not really critical for me so
if Jia or Otavio want to make a suggestion or something that'd be fine.

../Randy


>=20
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>>
>>
>>
>>=20
>>


--=20
# Randy MacLeod
# Wind River Linux
