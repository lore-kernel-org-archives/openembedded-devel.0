Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5BCC3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 14:10:15 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.44])
 by mx.groups.io with SMTP id smtpd.web11.19439.1721398213794252202
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jul 2024 07:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arri.de header.s=selector1 header.b=J2/T5akz;
 spf=pass (domain: arri.de, ip: 40.107.21.44, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUunFizVaA9LWJdmeOo3lLaU9xMgVKVaz4NHkLQPMgg1s0lV/xY82DMtOyoZfyvZPKFL+Gfq9rHG9jNPaiQJhWRdAJ1NysREGO9M+lw7WCim6YvrvXoHjwPxd2anUnpzCsEYzuwdbeA8cEOKSpe5hg2XHxCFCLtOnIItLmxfVHsJXEtyKTzT0T8ocvRj4EK6f3yKjHxb9VedHAa/lSsaARLUdTyoVwM4GZlW1JuQ92rWmmzK4GeFiq5zhvxsdXQB0bi3lvnDrI8z6oG2hCT+sMvZ0FMUuVJdlogXZBsXPzHreJ4Cb2T8K/fY3vsxTAvSDpsIQeg08D46FkGWe+pSPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SrQ2Le+OPda3IyWvI3d7/+7GiDkn3FRq8wYIZBCoTg=;
 b=FWCZzqo6gf5BpjCyuIBZracDqs2FRH188W35qV1bqq4/sA00cp0pAqDMWiGJIFRtWhLScRIJ9Q9lz8IfFrAS0rxLE+u/YYGtQB212WMQREIrzap0RYGwdmJwtb/S8MWvdaKqC7UJ1fUlbY4AW1S6zNa7/TjwdekekRfmalpSQeT+0xgLHiltCYo/IPbqJnV3AdoYwqG/Qm1orelpgR+QIZtyghTIga/VqnR50fkZadJ2DwiZBK6NgQbP/3lZWkWYRc3hsn8TD7+MW1j5B/N1PBm5BmLn7P1CTCdf1A154bmWqhNnFAHnV1gse1ca0i9D3GQobOgFOSME9uQhXJGnrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=arri.de; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SrQ2Le+OPda3IyWvI3d7/+7GiDkn3FRq8wYIZBCoTg=;
 b=J2/T5akzPQqT4T8oEy7lrwuKTsXPVcwSaC69zWvOf5KXHWr92uY49o3wsfpn9LwfWn7Dl8NekH2oCGa3gvbjipAgKJAhxfM3sW9hAIe5vwUlVHohXFwlLUW2bcGTbZhofn9YW3wTPga/5Rs8KanRSeTeeEtO5mWXvPEGSlHMt6c=
Received: from DB8P191CA0020.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::30)
 by AS1PR07MB8711.eurprd07.prod.outlook.com (2603:10a6:20b:47a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Fri, 19 Jul
 2024 14:10:09 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::29) by DB8P191CA0020.outlook.office365.com
 (2603:10a6:10:130::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14 via Frontend
 Transport; Fri, 19 Jul 2024 14:10:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 19 Jul 2024 14:10:08 +0000
Received: from n9w6sw14.localnet (192.168.54.109) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 19 Jul
 2024 16:10:08 +0200
From: Christian Eggers <ceggers@arri.de>
To: Khem Raj <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][RFC PATCH] include-what-you-use: new recipe
Date: Fri, 19 Jul 2024 16:10:07 +0200
Message-ID: <3479754.LZWGnKmheA@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <CAMKF1srofvxUUgGQqXBCxvLpTSkbK2puFamrL_U7Vmvb+BC6Dw@mail.gmail.com>
References: <20240715121744.18888-1-ceggers@arri.de> <4907407.OV4Wx5bFTl@n9w6sw14>
 <CAMKF1srofvxUUgGQqXBCxvLpTSkbK2puFamrL_U7Vmvb+BC6Dw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [192.168.54.109]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|AS1PR07MB8711:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e0e76c8-c3ae-459c-98c4-08dca7fc7f5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VTl5aGtkbENBdllib1JaQnNPemlCdWphRnF2MFdubEw3K1pnSWI1VlMvSm5D?=
 =?utf-8?B?QUh0Qjh0czhWN0Z1a0pabkFOaU1sRjlpYVNHQW1tOS9PUE5BdnpGeFdSWVAy?=
 =?utf-8?B?Q0YwZ0dWQ0I3Njd4b0p1bytkaWFhVjlIWXhwNUpHNE9UVWQvc2FWU2ovdGwy?=
 =?utf-8?B?aXNUMWhWcGlCbUkzN2phLy85MmdLN0dUSWlDQW54d2VNSWZuSWpQNlc3S1dn?=
 =?utf-8?B?dU1iSmhNbEFrblljZmtSVzlYOVRESW9ObUxCNXlJUk55c2JjK0wvS1JYRjJK?=
 =?utf-8?B?cVc4WmVPeUt4S3JCdGZJbEpHM3ZFK2k2NG1jWlJ4bnBCYUkrVVNYNm0rQ1FF?=
 =?utf-8?B?NUhLYkoxcUxnbTZtamRtdWRHYWYxS2lPV2xpK0Q5MGxTeU9oWTJ5cGlkOWZU?=
 =?utf-8?B?Nm5hV2l5d3UwU1BkRjBteDJGaGRISWRwbnBsLzhQWWRNazMrbWh2VWFlNUVh?=
 =?utf-8?B?UmZhck1mSkNPNDNGLzE0NW5aZStOREh0ZU5Zc3NjUENsczhFdUVWd0JRUVd4?=
 =?utf-8?B?MnBEWnZwWFJzM3ZhN3RESk9kREt2SHhFUHlsNHA3ejFlRFBJQ1E2RzE4b2xp?=
 =?utf-8?B?Zzd2RXZQYlhkMkJoSjJ5N3J0NTVyMWZZOE4vRXBVV3dWOVA1VCtVZm50N29p?=
 =?utf-8?B?OFZTSm03T0dXVXF6WisrK2w4QUNYR0FJYU1oYlZhZk9aSXo1NTc2UGp4STd0?=
 =?utf-8?B?NlNJQ1lBWmVMVXdlNVJZblBHbmN6NFZUeGZqaXZxOTRSSTNDYTZ4Uy9YWGxo?=
 =?utf-8?B?WVdvVzZlVHZxTm5xczR2b2FEaXozUnVGL053STN2RDM1REU5SjM0Q0wyRzNQ?=
 =?utf-8?B?RlBaekJaYU5oeUxVZk1tWEswVE1xUVVGNjVzT0VXcEw5ZzJtTThlcHo2a01Q?=
 =?utf-8?B?Y0VRODVmeVRVRm52L1c2azNOaDB2amRlWVJoSXArbG5ydWE0dHdONU1DTkJs?=
 =?utf-8?B?Z2ZYcXRmTDJTWDVIRk1ZazBScHVFdlBJNFFMNXVkanl6b0ZNZFpmNk1INlB6?=
 =?utf-8?B?dyt1SXRtaVpJT1F1MlY3ZUtTUTlVaEliMmVrdzZYOWMvZi9Nb21GZXV4VHly?=
 =?utf-8?B?U2JqRFpTdGp4aENyMWlzVzhQT1pucHZkSm5UWHBIT1FhSkxZQW9TeDUrQnpB?=
 =?utf-8?B?OHdZMkczaG5FQVMxbDFmZ21wUU1ybU1uNFpVV2NnVDJSNWh6anRNTjhMb2sx?=
 =?utf-8?B?NDk3TlpKTDhWdnpEbGtZWkhXc3VQZ201ak42cEgyQjJ5bGdVOFV0TktsTDMz?=
 =?utf-8?B?dU1VZUNLS1l1N01hY1J3NmNZY2dSOFl2bWZ4cG1PK00vaWFlQ3F3aDNDSmVS?=
 =?utf-8?B?R3A5MUh1WmpNeTJ3ZmRPaEZBbkNSZEtWUVZ0VmlIclNhbUNRNlY4N0MxY3cv?=
 =?utf-8?B?dDJ4SG81bnZOZmxLY1ZMdjc3QXZOSFdmN2RjSmwvdnBjekFKT3NQdXZSVTYr?=
 =?utf-8?B?RHlnTGpsa2YvSnBicU9talhNQ0FZTjdkdkNhVEZDVGRESWVQNWhFZDJYcDBM?=
 =?utf-8?B?T0VIVzFZdmg5WVR6ckc3ZnR3U2JjTXhPd1UrdnAwSnpmT1VzaE5VSlIxSE53?=
 =?utf-8?B?Vm4reHV4Wlo3OXh6YUVweTFsNnI4ZFZ2UGphT1ZlMnpRbDVuM085MGJ0SEZj?=
 =?utf-8?B?TnhlSXRVUnNjSTVEQnkwanFYQnBqYUlqNFJLNk8yaXRSUnNBcEo3QjYwcjlY?=
 =?utf-8?B?eU01bkpWMjEzcERCYTdYbVF1TVMxd2xWY05qelpiblFPL3R6ZGtqS2ZtajM3?=
 =?utf-8?B?bUFFRGx0NllBRnRSaFBSRzY3dWNKS1pnTlhKU1JZVjBUMzJ2NCtjMld3aXJU?=
 =?utf-8?B?bUhPbHBtNE5GQUJONEk4Uk1vdk1NWitrVE9CdllFeG5kVGk0TkNkRTdmcHJq?=
 =?utf-8?Q?JoCaEKCzgEft7?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 14:10:08.9580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0e76c8-c3ae-459c-98c4-08dca7fc7f5d
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR07MB8711
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 14:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111416

Hi Khem,

sorry for the delay.

On Tuesday, 16 July 2024, 17:42:33 CEST, Khem Raj wrote:
> On Tue, Jul 16, 2024 at 7:57=E2=80=AFAM Christian Eggers <ceggers@arri.de=
> wrote:
> >
> > Hi Khem,
> >
> >
> > On Tuesday, 16 July 2024, 15:45:54 CEST, Khem Raj wrote:
> > > On Tue, Jul 16, 2024 at 1:08=E2=80=AFAM Christian Eggers <ceggers@arr=
i.de> wrote:
> > >
> > > > On Monday, 15 July 2024, 16:18:14 CEST, Khem Raj wrote:
> > > > > On Mon, Jul 15, 2024 at 5:18=E2=80=AFAM Christian Eggers via
> > > > lists.openembedded.org
> > > > > <ceggers=3Darri.de@lists.openembedded.org> wrote:
> > > > >
> > > > > > Based on proposal send previously here:
> > > > > > https://lists.yoctoproject.org/g/yocto/topic/recipe_for/83279588
> > > > > >
> > > > > > This recipe depends on meta-clang, so should it be added to tha=
t layer?
> > > > > >
> > > > > > Unfortunately the 'include-what-you-use' (iwyu) tool doesn't wo=
rk yet.
> > > > > > Although I have installed nativesdk-clang (via CLANGSDK =3D "1"=
) and
> > > > > > nativesdk-include-what-you-use packages, the C++ standard heade=
rs are
> > > > > > not found:
> > > > > >
> > > > > > include-what-you-use
> > > > > >
> > > > --sysroot=3D/opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-l=
inux-musleabi
> > > > > > impl/Fdt.cpp
> > > > > > impl/Fdt.cpp:9:10: fatal error: 'cerrno' file not found
> > > > > >     9 | #include <cerrno>
> > > > > >       |          ^~~~~~~~
> > > > > >
> > > > > > As iwyu uses Clang and I have no experience working with it, th=
is is
> > > > > > probably only a beginner mistake. Can Clang use the C++ headers
> > > > provided
> > > > > > by libstdc++, or do I need to install further packages?
> > > > > >
> > > > >
> > > > > It can but it seems your SDK install might be missing any c++ run=
time so
> > > > > check a simple program that includes say <iostream> header and try
> > > > > compiling it
> > > > My SDK definitely contains std:: C++ headers for target and natives=
dk. But
> > > > the
> > > > libstdc++ C++ headers are installed in GCC specific locations:
> > > >
> > > > /opt/poky/5.0.2/sysroots/x86_64-pokysdk-linux/usr/include/c++/13.3.=
0/
> > > >
> > > > /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-musleab=
i/usr/include/c++/13.3.0
> > > >
> > > > How can Clang know that the C++ headers are located in the (GCC spe=
cific)
> > > > c++/13.3.0
> > > > sub directory?
> > >
> > >
> > > Try adding -stdlib=3Dlibstdc++ on clang cmdline
> >
> > The following seems to work:
> > include-what-you-use \
> >     -target arm-poky-linux-musleabi \
> >     --sysroot /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-lin=
ux-musleabi \
> >     -stdlib++-isystem /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-=
poky-linux-musleabi/usr/include/c++/13.3.0/arm-poky-linux-musleabi \
> >     -stdlib++-isystem /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-=
poky-linux-musleabi/usr/include/c++/13.3.0  \
> >     File.cpp
> >
> > Is there a way to make this a little bit handier? I would like to avoid=
 hard coding this into my CMake toolchain file.
> >
>=20
> Hmm so -stdlib=3Dlibstdc++ does not work ?

I cannot reproduce what exactly went wrong, but now the following works fin=
e:

include-what-you-use -target arm-poky-linux-musleabi --sysroot /opt/poky/5.=
0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-musleabi test.cpp
include-what-you-use -target x86_64-pokysdk-linux --sysroot /opt/orbiter-ti=
ny/5.0.2/sysroots/x86_64-pokysdk-linux test.cpp

So neither '-stdlib=3Dlibstdc++' nor '-stdlib++-isystem' is required anymor=
e.

I was also able to integrate this into a CMake project (built with the SDK)=
 by adding the following to my toolchain file:

set(CMAKE_C_INCLUDE_WHAT_YOU_USE include-what-you-use;-target;arm-poky-linu=
x-musleabi;--sysroot;$ENV{SDKTARGETSYSROOT})
set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE include-what-you-use;-target;arm-poky-li=
nux-musleabi;--sysroot;$ENV{SDKTARGETSYSROOT})

The IWYU tool states itself as "experimental software", so the output
better should be interpreted by a human. I've tested with an existing
code base and got many valuable hints for missing/superfluous
#include statements. The results are quite good for std:: C/C++
headers, but other libraries like Boost need further improvements.

Can this recipe be added to meta-clang (due to it's dependencies to libclan=
g/libllvm)?





