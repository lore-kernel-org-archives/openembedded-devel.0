Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA82C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 11:24:59 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.109])
 by mx.groups.io with SMTP id smtpd.web08.9784.1645442696493767005
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 03:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=sEjjm0/P;
 spf=pass (domain: arri.de, ip: 40.107.4.109, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1Aw78J/mdxp5eGy+8SO+5ZYwSwiHvOn/jKTSi6LOtyhPTVrnoWn6r7iFzEbV/0j7rq5y0k1MiEeCkVaL47O0TXFxSQ97fpjzPceAsTWfbxSslBK2lhXaevF6ngG24+/C+TAR1MlM7Q7ouP310FNALuIGnKZI5a/fh7L/7FLdR1pJztpswNvBIlwzBjpIDt27PSaS/nSuETwMBWcAnlGsA43bHuVVHB9u4tLOnw1zLMD7SRiIOKoKu/N5JCOJjFNkLhYYNTzDNpzM75phy++XnNHZTQJK4uErmO/uhWl3JmWjvcUg8ExHNU3tOX3ZUL83viqMfC3av7Krz8ixpKVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f839w7dciPsUHTxRVG+WVXOO44NhSLqeqx0yIh1kiyU=;
 b=Ic1b7nfkM+j0JQdCtes7mrZxXu2CragbQtVJ9fSdDDxhxYqvhIb9tDxoRTqD6ivTfn6XteU+16NAr5OUTxvfDh67532drCQVDOA5trtPpnPrrimJoAywmyxsI3zVDY4zYl04eZm636u56L9MON2jHnCgtcydQ1RbVqkQDLqfXCxzIF5KNltVSQj5eToKcXXnco1AnexT/+k6HWLE2yEhr9XKBCccvxyEPnLGX0WHrDKSrDzbYovGcUZFIBTmDsGn/niyoVg5Z8WiRu0Wxgq7LKjz0ERQRTWOSWOpeJ9ZntZcGsm0ZnsOMEwVOBzSgeBsXH18PtgO8lJzE1M8oL3abg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f839w7dciPsUHTxRVG+WVXOO44NhSLqeqx0yIh1kiyU=;
 b=sEjjm0/PHsJp5ai+71a4WnWVRgGGbt+C+WdIISUtY1uI1YK0g7oYxevjdyx8/xBWBR1DeFZZZSrv9PRJiD/XA9gXtIFprZhVhH1m4qgF8eF8EVBcPfIWsZeFRA8gvzQXwlufAbP24pQtWyJyzi5rn2UVdU8HtFeouAcjBCdgzm4=
Received: from AM6P194CA0076.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::17)
 by AS8PR07MB8235.eurprd07.prod.outlook.com (2603:10a6:20b:37a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.9; Mon, 21 Feb
 2022 11:24:53 +0000
Received: from VE1EUR02FT060.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::41) by AM6P194CA0076.outlook.office365.com
 (2603:10a6:209:8f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15 via Frontend
 Transport; Mon, 21 Feb 2022 11:24:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT060.mail.protection.outlook.com (10.152.13.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.20 via Frontend Transport; Mon, 21 Feb 2022 11:24:52 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 21 Feb
 2022 12:24:52 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Mon, 21 Feb 2022 12:24:52 +0100
Received: from dhcp-192-168-0-28.wgnetz.xx (192.168.55.45) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 21 Feb
 2022 12:24:52 +0100
From: Christian Eggers <ceggers@arri.de>
To: =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>, Khem Raj
	<raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] pcapplusplus: add new recipe
Date: Mon, 21 Feb 2022 12:24:51 +0100
Message-ID: <10044668.nUPlyArG6x@dhcp-192-168-0-28.wgnetz.xx>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: 
 <CAMKF1sr+uxB-0ncjSrTSs=GyyqE6JPgODx5F5k-ekmUKP4bsfg@mail.gmail.com>
References: <20220217144533.23247-1-ceggers@arri.de>
 <CAJiuCcccjYudzAPyM0RYzkGj1pmD9Nj3Kt+cKcpbU=zRFuggBw@mail.gmail.com>
 <CAMKF1sr+uxB-0ncjSrTSs=GyyqE6JPgODx5F5k-ekmUKP4bsfg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Originating-IP: [192.168.55.45]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b479b353-dfc1-45cb-5896-08d9f52cc7da
X-MS-TrafficTypeDiagnostic: AS8PR07MB8235:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR07MB823581818DF6ED993A4E264CBF3A9@AS8PR07MB8235.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NKEgWdj874aCDGzJtMaxjJ8bU4rYrLLqAL+0zmz1YIk+aeiGH+vh9MOdTkE1Ybxp1gxumUpqgHqBC873D9WYJiaw4WyQp5lHKSjEh1RN6o88qSPed594q8gU4QpK3e6ZB4oCnez1/wh7OMBEyJiz04qaE4wJL56BYQKCM0SsML5KKh8TWWg3WKpckycGUXxHNvr40x7IPl8mxmJcBXTU/l316qPzYqpJvTCCnTL43Y/b7u9hTVKErSn901VZEDJVB+/QnNny8dwTCobYykGD41heE+cTzKGiQ4TvOh37sNXYwzc0aCdqatQz8qlswD0wZbSBSWfJZ30zSwCoRZEyB9Ie7sL9M3PGgLFWt42pJuUlTdGVv7ZEXxvL04Ic9ppxYcTChKligWOwJh7xKWkFF7F7hz7HX7vKqlUzjGcIhQjJgo3fxlkwfDQBNvqCjN0Tk8LOcB0/3/WEUMsKvfod51DlJwLQS0bF9twZLRDw82JA2l4vRp8Mxc1sWCWzs1rFZ30UqHi+k4taYKEdL+UEycHTsQYkiBDxxGx/Up6tjEbSt0/dM2IPVvqN/toWYZfQ/Wq8o+8S/zHTTjghxytt/Q3AO3nffvKQe+vLQGSGA1oNPGpBDznG9+Mt5anFtzt/8dIFLM8UNTMEUDUNl9ADnmthx8sXTujMkq5lRwXVxGVOiN706G51lREg6kcaGc06o+Lg/lbYi02Qtg/aUb/UZMCae4x6dyYaz0YD57R5Mko980hof8fK0qdNEqIsuA75daE1upLwqXNx4m6IcnsfORxxwWvsv6wBY3utB6kisnvT8GiB6yhvDSYhRlzchm2y
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(7696005)(55016003)(508600001)(36916002)(966005)(53546011)(9686003)(47076005)(2906002)(36860700001)(16526019)(5660300002)(186003)(110136005)(26005)(66574015)(8936002)(316002)(356005)(82310400004)(426003)(336012)(86362001)(81166007)(70586007)(70206006)(83380400001)(4326008)(8676002)(39026012)(102196002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 11:24:52.9508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b479b353-dfc1-45cb-5896-08d9f52cc7da
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT060.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8235
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 11:24:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95406

On Saturday, 19 February 2022, 19:24:37 CET, Khem Raj wrote:
> On Sat, Feb 19, 2022 at 1:05 AM Cl=E9ment P=E9ron <peron.clem@gmail.com> =
wrote:
> >
> > Hi Christian,
> >
> > On Thu, 17 Feb 2022 at 15:45, Christian Eggers <ceggers@arri.de> wrote:
> > >
> > > "A multiplatform C++ library for capturing, parsing and crafting of
> > > network packets"
> > >
> > > PcapPlusPlus uses as custom build system (shell script + Makefile).
> > > There were attempts for using cmake but this work has never been
> > > finished.
> >
> > Work is still ongoing by me
> > (https://github.com/seladb/PcapPlusPlus/pull/652), Review and help is
> > welcome :)
>=20
> this fails on riscv32 which has 64bit time_t on by default unlike
> older 32bit architectures
> see
> https://errors.yoctoproject.org/Errors/Details/629829/

I see the same problem locally on 32 bit ARM/musl, but only as a warning,
not as an error.

The C++ code converts from from struct timeval to struct timespec:
https://github.com/seladb/PcapPlusPlus/blob/master/Pcap%2B%2B/src/NetworkUt=
ils.cpp#L172

struct timeval uses 'suseconds_t' for tv_usec which is _Int64 on musl, while
struct timespec uses 'long' for tv_nsec.

1. I think that conversion from useconds to nseconds requires multiplicatio=
n with 1000.
2. Is there any problem casting from 'suseconds_t' to 'long'? I guess that =
nanoseconds
cannot exceed 32 bit.

> > > +
> > > +EXTRA_CONF:libc-musl +=3D "--musl"
> > I think there is one fix required to build musl
> > https://github.com/seladb/PcapPlusPlus/commit/0607f5ccb7a26bc1567908507=
e46603e7c16b1ac
> >
>=20
> additionally we should be using
>=20
> EXTRA_CONF:append:libc-musl =3D " --musl"

=46rom bitbake user manual:
> These operators differ from the ":=3D", ".=3D", "=3D.", "+=3D", and "=3D+=
" operators in that their effects are applied at variable expansion time ra=
ther than being immediately applied.

What is the reason for using override style here?

> > > +# main package is empty
> > > +RDEPENDS:${PN}-dev =3D ""
> >
> > Why not use ALLOW_EMPTY here ?
>=20
> lesser of two evils.

RDEPENDS:${PN}-dev =3D "" is used several times in oe-core / meta-openembed=
ded. Some
comments show that this is for the same reason (empty main package). Would =
it be
useful to covert some/all occurrences?








