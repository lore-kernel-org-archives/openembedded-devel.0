Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46069C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 08:08:48 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.57])
 by mx.groups.io with SMTP id smtpd.web11.5671.1721117319486803995
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jul 2024 01:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arri.de header.s=selector1 header.b=jt/YbsdV;
 spf=pass (domain: arri.de, ip: 40.107.105.57, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssw/OIAjA5vgA1mtQgDGTml4HWt2qk06jlaRs5XKQrT69DTr6rPKvPjLv4/gi3ufQ/mkMDE2XmQBgziPd65i54LHifkLDYz0CqmVEBePlygBbBf6ITYmUpeOLQfHkm2BrnHQBL4o77Gbq/sr8MKX3l2ZQ+m/30rn9/QD8gmitIVwyXr5eVQrw+MH2r2n9h/DyVcucGhTmfEgJQKJj+rvkCTcmAt1qHbvST3AgEHnKsBocbUzxZLDXdjw8hb+TqHqP9qNhaOnPMKOkWqRYsx5BzP2mqUPH2KFjrFhgisUnlKW5NvcZP80zz4+q0bHRjCrsHN2c+MxaG7/2dgpGd6y1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0wHMJlu59FB+nuzGkFYqfmElV9ldPASOknxcSqpSmk=;
 b=VOwAaIXHs9H1BNB+nZO8mQ0abSRVw0hFwYKGVzi9lYE2LoQC8gOMF6G2c7eYp5u8v88xPqc7PWYukz4quWWdqsi4a5QqgSNGGtNYC9uS/bIQk51vXyGWF2Y6or1ED0/Lylsvesh0dQ1q6+y5Fyfdl9C57vbbwasqK5zd7ZZ2aPuS4hI7jA6qVPpESa3ArjUgIslS2A+fmQSFxSOAW7IF/3J3eKzEEHitXIEjFQ71MphCPAR49ni1m8t0AtEfnfhfz8nzgzU3kml9x0aqVzKrFrUuIikkbP8rswZJrh3siGiyEF5rBhLf9GzpOtJXRpHQhZPi+Es0cmpetB8IUh4V0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=arri.de; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0wHMJlu59FB+nuzGkFYqfmElV9ldPASOknxcSqpSmk=;
 b=jt/YbsdVAEWfS1h369XAWX38T52wQGy6rGu2OOLZT0GUpEJITmdMNiFVo3uOplQEw3j4TjmTVi2Ee9zuS8f1gUjTv6m5SAwnmAhdJ8Ot8FR6+vKtiFFNP/w4gUuATMN1rZhv8L5EuhkvbiiRl7gZNaLVdvUS8v9UrM9eQZyDTBM=
Received: from DB9PR02CA0012.eurprd02.prod.outlook.com (2603:10a6:10:1d9::17)
 by PAWPR07MB9466.eurprd07.prod.outlook.com (2603:10a6:102:363::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.10; Tue, 16 Jul
 2024 08:08:35 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::e) by DB9PR02CA0012.outlook.office365.com
 (2603:10a6:10:1d9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Tue, 16 Jul 2024 08:08:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 08:08:35 +0000
Received: from n9w6sw14.localnet (10.30.4.252) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 16 Jul
 2024 10:08:34 +0200
From: Christian Eggers <ceggers@arri.de>
To: Khem Raj <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][RFC PATCH] include-what-you-use: new recipe
Date: Tue, 16 Jul 2024 10:08:34 +0200
Message-ID: <2532679.XAFRqVoOGU@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <CAMKF1sp+OV9U8SbRqR=CvR8vxS0dsgCfWqp3ShGr5w2AcuG2-Q@mail.gmail.com>
References: <20240715121744.18888-1-ceggers@arri.de>
 <CAMKF1sp+OV9U8SbRqR=CvR8vxS0dsgCfWqp3ShGr5w2AcuG2-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.30.4.252]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B92:EE_|PAWPR07MB9466:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c6ac019-7150-4282-4396-08dca56e7dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|4022899009|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ejJhS3hFRkRxL2lTazRRY1RKVWtNb2tJeHhtcVM3aUdQdTZOdFkxSDVyeTdR?=
 =?utf-8?B?QUVtYXpvdEt4NUlZRlp3OXAraFNEcEdybXdjYnV0NkZvd1JKOTN1UzhTaU9Z?=
 =?utf-8?B?dnVIWDI1Q3B2VU1hSXVxUFU3VE1CanJKMEx1Y1JTY2o5bkd2c3VBb09aeGt2?=
 =?utf-8?B?NXppc1FKQlAzS1FxcTh0Q0c4RnJMNVlsZjl3c3NiVG9EeEhEbmxUNWl6TXgv?=
 =?utf-8?B?MG16bWZKY1U2eXJCcE9IaHphSFdxVDBxME5lUDJXNDNBdkNTZ1VyTFNPR2tJ?=
 =?utf-8?B?U21McGlYZkExVTRUcUQ3UEhtVUNRUFdxVFQrRmpwMUJKU3dTODFZYjZvTXdz?=
 =?utf-8?B?ODJLa05ZNDgyamx5SkpobXZFYWlRS1RJZFhvbHJhVnRpdmJyL2ZnUXROa2U0?=
 =?utf-8?B?WWgrZWpudXhZaUlEYXdWN2xrZENiL3JFOUZRVGpqRGNiUFA4bzc3R3pPUjlD?=
 =?utf-8?B?MC8ySk5uc0h3U0ZRVExERUdNRTBoZndUMjZmS2RJZUpUWUxGME90aUh6QnRG?=
 =?utf-8?B?QW8zYXZLZDdUQk8xaFk0b0FQYXREcVZrRE1xdlJrMUdwZk1MeWVqbnJJNFY5?=
 =?utf-8?B?cms0RjdKT3F2K0JIWm80anh4REZZb2d3MEJwY1EyTWZqUjFtZ3Y3V0g1aFp4?=
 =?utf-8?B?ai9qZWFEamN3OGg3ckNZWW9PVDNIWUVnclhyRVVITWhzZGR1bWVOTXlzdG5q?=
 =?utf-8?B?MW1iWGNHWkdFU2V2MGNTT3ZwNS9HRVJHUDZ1T1h5Z0h6eFpKeWI4QlJzOVFq?=
 =?utf-8?B?S0pZZ0NLTUlYelc3SVJSTTdTbUsyeVVQOVlCQUtxNytYVWJFMTA5emR4d01Z?=
 =?utf-8?B?Q0RtUitMZVpEeVRJTEFhY2VITDlRUzMwNjB3REprOS9nOFFxczBDbmxUS3JE?=
 =?utf-8?B?dkViWGlaS3dVeEpGcG81VzdBQWQ1N0NDVy9tRUNDQVlNakJFekRNTnIyc2w2?=
 =?utf-8?B?QU00MXNBbHZFK1hvMHdZZEFqbldhdEI2WWxTSDZxUXZOVXlmTDF3RHU1UmIy?=
 =?utf-8?B?YnJLZWFpTEJkZU9Va0ZQVW9kbjJQeitzcEtpTUFDMlpuUXN2NGNVcityWmty?=
 =?utf-8?B?bkl0eHJqVkdRNVRCR1ZHK21wNTAyU2k4ZGdaWjZrMFd0QjFrYUVveVhoNDQy?=
 =?utf-8?B?SGNJMktESUNLNHRlSGNTTkRwMjVUS05SMkN4LytidkpRZ1NzRnRhR3pTbXlD?=
 =?utf-8?B?V3h0MnAvVlNUWlJTUTVyci9BeVA0MTFuOS9HazNRNXMyc2JLRnhSZFEzVnJz?=
 =?utf-8?B?UHVOL3FOVURWbkZpNzBxVkdaZEJCdFF3RUo3c3FsZXJ2OTFEN0gvc2ZvUUdS?=
 =?utf-8?B?TGtiMW9mQU5DTm1Ldk9sZjNJMDFjSVFwY2NVVXpkTXE5eXNyODRsSm5aSGZa?=
 =?utf-8?B?dGNjTkJjTm1JdCtOT2VMMllIa1RXZ3plS2ZrRTVtY3RtY0N1eEZLV3FJMDVQ?=
 =?utf-8?B?TCsxZm1jU2ttQ1Ywa3UrVi9GRTR0K2p2aHVZTHF2Myt6U0tqb0h6dDlPbG5t?=
 =?utf-8?B?OVpIbkt4QzY1b1VRcWY0Z0pHdm00NTZVOTR5N0toVXk4VXpTWjk5UGpRSVA0?=
 =?utf-8?B?SHBpWlZOWTlPN3NMdm44cDAvOTNJMXZ1RTc4b1l2SjRDSjhTNlV6ZE9vNStK?=
 =?utf-8?B?elg5b081VVVjanREVXVFckIxellZTVMzdXBDVnl4OTNEWHJYN1QzNktTLzNu?=
 =?utf-8?B?MFhZc05PNEJIY1hlUG13V0xzUnEzQ2FzSnltQTEzN0plV1Z0bUExSUNEZmU5?=
 =?utf-8?B?VUJHc0x3aGxMQTlkUUZ5STdGWnNrbEwrdmlYeXBVRHNLSlJkTlZQRDVkUVRv?=
 =?utf-8?B?REFicVNRVERFbW5SYWZTRVlmSHdOa1NQOHZQdmJ2dWN6ZDFxT1dVM0g3dkUw?=
 =?utf-8?Q?GMT02mXZ5v4Ff?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(4022899009)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 08:08:35.4773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c6ac019-7150-4282-4396-08dca56e7dd0
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9466
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 08:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111370

On Monday, 15 July 2024, 16:18:14 CEST, Khem Raj wrote:
> On Mon, Jul 15, 2024 at 5:18=E2=80=AFAM Christian Eggers via lists.openem=
bedded.org
> <ceggers=3Darri.de@lists.openembedded.org> wrote:
>=20
> > Based on proposal send previously here:
> > https://lists.yoctoproject.org/g/yocto/topic/recipe_for/83279588
> >
> > This recipe depends on meta-clang, so should it be added to that layer?
> >
> > Unfortunately the 'include-what-you-use' (iwyu) tool doesn't work yet.
> > Although I have installed nativesdk-clang (via CLANGSDK =3D "1") and
> > nativesdk-include-what-you-use packages, the C++ standard headers are
> > not found:
> >
> > include-what-you-use
> > --sysroot=3D/opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux=
=2Dmusleabi
> > impl/Fdt.cpp
> > impl/Fdt.cpp:9:10: fatal error: 'cerrno' file not found
> >     9 | #include <cerrno>
> >       |          ^~~~~~~~
> >
> > As iwyu uses Clang and I have no experience working with it, this is
> > probably only a beginner mistake. Can Clang use the C++ headers provided
> > by libstdc++, or do I need to install further packages?
> >
>=20
> It can but it seems your SDK install might be missing any c++ runtime so
> check a simple program that includes say <iostream> header and try
> compiling it
My SDK definitely contains std:: C++ headers for target and nativesdk. But =
the
libstdc++ C++ headers are installed in GCC specific locations:

/opt/poky/5.0.2/sysroots/x86_64-pokysdk-linux/usr/include/c++/13.3.0/
/opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-musleabi/usr/in=
clude/c++/13.3.0

How can Clang know that the C++ headers are located in the (GCC specific) c=
++/13.3.0
sub directory?


>=20
>=20
> > Signed-off-by: Christian Eggers <ceggers@arri.de>
> > ---
> >  .../include-what-you-use_git.bb               | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/include-what-you-use/
> > include-what-you-use_git.bb
> >
> > diff --git a/meta-oe/recipes-devtools/include-what-you-use/
> > include-what-you-use_git.bb
> > b/meta-oe/recipes-devtools/include-what-you-use/
> > include-what-you-use_git.bb
> > new file mode 100644
> > index 000000000000..e7df6a834a34
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/include-what-you-use/
> > include-what-you-use_git.bb
> > @@ -0,0 +1,22 @@
> > +LICENSE =3D "NCSA"
> > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE.TXT;md5=3D59d01ad98720f3c50d6a8a0ef3108c88 \
> > +
> > file://iwyu-check-license-header.py;md5=3D7bdb749831163fbe9232b3cb71861=
16f"
> > +
> > +SRC_URI =3D "git://
> > github.com/include-what-you-use/include-what-you-use.git;protocol=3Dhtt=
ps;branch=3Dclang_18
> > "
> > +
> > +PV =3D "0.22+git${SRCPV}"
> > +SRCREV =3D "377eaef70cdda47368939f4d9beabfabe3f628f0"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +DEPENDS =3D "clang"
>=20
>=20
> This means it needs to use clang as library to link to is that what it
> required or does it need clang as static compiler to build this package in
> which case you can do so by using TOOLCHAIN =3D =E2=80=9Cclang=E2=80=9D i=
n recipe
I think that it builds fine with the GCC toolchain, at least it doesn't
complain during build. Finally it links against libclang-cpp.so.18.1 and=20
libLLVM.so.18.1, so using "DEPENDS" sounds correct for me.

Although I haven't configured Clang to provide also llvm (as described here
https://github.com/kraj/meta-clang?tab=3Dreadme-ov-file#providing-llvm),
there is a nativesdk-clang-libllvm package after building nativesdk-clang.
>=20
>=20
> > +
> > +inherit cmake python3native
> > +
> > +EXTRA_OECMAKE:append:class-nativesdk =3D " \
> > +       -DCMAKE_SKIP_RPATH:BOOL=3DON \
> > +       "
> > +
> > +FILES:${PN} +=3D "${datadir}/${BPN}"
> > +
> > +BBCLASSEXTEND =3D "nativesdk"
> > --
> > 2.44.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#111360):
> > https://lists.openembedded.org/g/openembedded-devel/message/111360
> > Mute This Topic: https://lists.openembedded.org/mt/107229738/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> > raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
>=20





