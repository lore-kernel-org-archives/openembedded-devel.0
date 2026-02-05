Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CB1ECD995
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 18:17:02 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27746.1770315419616275250
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 10:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=r1gIan+o;
 spf=pass (domain: axis.com, ip: 52.101.65.57, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRSAoGgQRyc3ghHBXmyPPpq+4SXA+PcC1/6blxLhoprcIEh2SZmXSbpeBz6HtxEQu2dk86gaOJqd0Km5VFrHSROrbFar6v1EI3gBqVd4obdrf8qQix5nbxQh3a6fMpAUhXnj9zISwdLZdBD1XY0bMNFgbZGCC8RimrZ6XdhoNJCa2yzm0WQUR5daQLY+wWMIqYhdJXCHob1MUto+i1QNT4LPdwkiE1LM91jYqTYzCqUU+y6tqHaxk+0jiOUs5y1S61ae58+4mZC8MomxwqsRn6oInz+2hcpRTcxUk3qa4naObkQXj3QfH10ex1SYMQftsSDPPtSt1wC4+VfeoQnBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jaGwWk0/MBGCWgT5hBeJOrm2hGLwYtA1f7NTsNVzTQ=;
 b=b+5a2HX1GXRPv91LS6XQ//2bX6TNopTK4T38rm/p6GGQ3f+zULtle9eAqdojiw7zuUy0oEZyFh3jOcBX3dLjY5tK0mt400TIstvTyExdjrQg7rf9OMghFg1+n7qm615x7lclQ4oI28ghMyLTHWurCQ2L2HzC/Q1HSViWtmiReP+UhxS6IbkazwNZWkcJFe9I8gsp+HOXbMxPEw3Tm8QCFwNURcQqBd3u+zfNexQ0Thnf69e8lmH9lEZki1vpl6s8HpqP08Y90Gm1phKbE93HwRSEEaB+JLruiJZkd+OFiFXai7XY/DdAbqWu6aJ67tZXIp4qQbFNQP/lPQc1LgjwAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jaGwWk0/MBGCWgT5hBeJOrm2hGLwYtA1f7NTsNVzTQ=;
 b=r1gIan+orKwnmUqSCUxkYlwnZmFz76UL2AxQ6gie8S0oWh8dP80/usQPC0K6GqT3gFJ6EuCveSONbtnjWN9pgfVxjZHxvtnwzuofvMGSgxhifqryI07wFdRGqABZkCaPw1beDAtxKafyyy+nuSSrx0ooOpMnZ1SPt5MkPR848l8=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB10370.eurprd02.prod.outlook.com (2603:10a6:10:3da::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 18:16:56 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 18:16:56 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "yogesh.tyagi@intel.com"
	<yogesh.tyagi@intel.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] abseil-cpp: Set CMAKE_CXX_STANDARD to 17
Thread-Topic: [oe] [meta-oe][PATCH] abseil-cpp: Set CMAKE_CXX_STANDARD to 17
Thread-Index: AQHclHh0kRDrOvA/UES4XqUkTnb3p7VwvkWggAOvVXA=
Date: Thu, 5 Feb 2026 18:16:56 +0000
Message-ID: 
 <DB5PR02MB102138D6D0E736A5BD27AF601EF99A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260202192055.1588477-1-yogesh.tyagi@intel.com>
 <1890B47D79B141EC.3664483@lists.openembedded.org>
In-Reply-To: <1890B47D79B141EC.3664483@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB10370:EE_
x-ms-office365-filtering-correlation-id: 5ced53a0-0408-417b-a711-08de64e2bf16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?n7oVmvP4sL8iTEwTH7sonxRh/y009ZS3DkfkgUXpwBYEn6W9d5ZPKyaVNqyI?=
 =?us-ascii?Q?/g7QdmPzvw6S59vfUPrHstFbBodm6mxWe/WcZH+i/hypM6TNkI2eYZokp41I?=
 =?us-ascii?Q?kBwCoj84Rhds+AI7Wbo9REni+QSqCm625QeuA4BaodqZlfLCtEaYjFmAptmz?=
 =?us-ascii?Q?TZlbjbnF7xZqEsF2Kziw0ids3mBND1dAd+7lrSzrPoMc+rm7b1gcCvqgFoj7?=
 =?us-ascii?Q?FfpVowTVupGUlP9B/ySQjaoAPhZomxqDxOEnxxMoGmcl3FYMtE3VQM6Ex01R?=
 =?us-ascii?Q?UJwhEeANKPiFv83buVW46Xxw0zvVcd8jfsawTWDDtItpveTUZZdyc72jRwhG?=
 =?us-ascii?Q?1N5tBAvPe61xiQwjmHqVzEL0BUU3Onn03n1GPRRmXgON6t5MBaikeg2ord+U?=
 =?us-ascii?Q?u2jx0A+bpuTs6QZJU8O1ZFI6iNj8Q9+C/uKeNFlqb6r4OGvQIpLd/DK4N0mP?=
 =?us-ascii?Q?1Rd4SwzXSsVqKn6bBj3/x0FT7VtMzfBd0Y0nQhPstpFGd5xzd5rvxYhWAfg6?=
 =?us-ascii?Q?D8u1RwSnoDf5ua8AvUSiC63XlrD3EsL9SNhiCHSGUh28nEVmDFNNN99rIODD?=
 =?us-ascii?Q?vXAAbMMWXKxpu+l4jhI94H9YO8cSxm8VV172q16xqxfAl958mA8u83h/Xjvb?=
 =?us-ascii?Q?pZCSRZqcsGWBz1gZ7dyjtdWa+guSN+MBy98BtPQkqqe0hsIJ/fg4ZVCnlj8b?=
 =?us-ascii?Q?kYzsl6Z51esRH3bJPbP+GnzBvIKCK03vFGkGZTf8gQE4PdDNfbWvC0j0xl9W?=
 =?us-ascii?Q?7/LuTVLkwAnLOVG0RqAvFV93mFQjoZlv0N/nkQHnCd3wf2jmt5O7CNKezLQN?=
 =?us-ascii?Q?1wdrEKTkpN7jmfHUm92esa7JdnFyXvRB+3pQfnc1Fzy3vL0aL6hD2AL+SF2/?=
 =?us-ascii?Q?cRJpp9Km4hd7FY+P4gtA8S8cEK375Rf7LMfWUj2TL3UeRuqzKdaj13UPhJ+a?=
 =?us-ascii?Q?U/VyAfrrF0FRJVguo9f3pG98b90i2i8iLmvyv5+56aNmONCYtYq3o04Heg5B?=
 =?us-ascii?Q?iLfSCFybdbUb0vLGyENI0AaScv8ql6nibA9iPMvlTZXuEmu/a4M5ywJQNJ9L?=
 =?us-ascii?Q?8XpDBTkul2kpfXwRcdpOaXpSA6kpQ2pnSpuagsg5CbZC6qIgLXp+zkkSvaaA?=
 =?us-ascii?Q?WPs4R/36R2B3oKbQG6nQ0RbGOEiaDyjiMbSYIV6pSsrjZ9Lke2aQfgD4IT0m?=
 =?us-ascii?Q?8517TsH4v6mf7Vc0QBvSqB72quSnikwU0EvHlFTaxqnLa7PBxbZiJJm7X7/f?=
 =?us-ascii?Q?NHaOWd0GRXz3wS9Pw9EFpZBwAFXhku2m6agD+zxtvpm9So7esHHbv9Juz3BD?=
 =?us-ascii?Q?bxLgn3Cu3TxwcqNH+uL7gNOjxpn0KD2WPNNAzbshbK7ehBz0T8vgSoh9Ab1X?=
 =?us-ascii?Q?tUxzffWNqkqtkc4zhRiwXDy7uET7G8VxItg6y9WJXpCmxH/ToWCR7KbCj3R7?=
 =?us-ascii?Q?oCmsZ9ydBbc/NmBmwfFVdtC10HwcqH9x6bcjlVsz7BGnbw+f/QOmbYXZCnsQ?=
 =?us-ascii?Q?JetVETcGlE68bXnuW4c60/e7fmgv1TiUnxTZefSYyzS1bPGMnjz/hR7oVM8V?=
 =?us-ascii?Q?4ZCfTtwClpO5lSEfz+8PYraQOo+lLsPSuxKWNS+K2RozusbWvdbauLNrMbhs?=
 =?us-ascii?Q?W3G4to2zQ5kfK1J61Zr45R8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?t/FGcooDjLQ0jMwOqib+vTRP4KtwVjonBsfGUSqCRDM3jjszrzz/BvRST5Bs?=
 =?us-ascii?Q?r/L2towEbDD0OKQvbMsnkeJcZzlW05RU45Ul/mo0xc8f+GRD4mQuHqQvNdTu?=
 =?us-ascii?Q?rCyQPPQXr7dxqkt4289hK/Vjax/w2XbhQOPRHrKID3N3HbEWo6X6qiMz/ze1?=
 =?us-ascii?Q?5RDdN5UoJL7fKt2HN3eV3RY1VOXdee1iAG0kdGX05hc9RrTX2p8lWKGCwFHS?=
 =?us-ascii?Q?3w2AjUFCc6KWJ9+hht+KF/uzKvli3fd++lXIeW89HIdPhaOW6HFMiTN68tnx?=
 =?us-ascii?Q?9esKi7eiOMEaaLlRjWLnasXv+TQZPj5am+LUsPL5uwpZYwBFAKufJitwTfFC?=
 =?us-ascii?Q?ZGU99j2HQRvExRG13vVAq73cmSIqlFbUTUA1ReRFHlKRKgNrXCUGl2UEYYoA?=
 =?us-ascii?Q?nYu/F7D3/82ZU5D3AYWderlIEGz3xjXUoRjC897NfW9cbDDXW/SR98Vdwepd?=
 =?us-ascii?Q?yuCPHxaBTM0xRIWvgmxc7kJ1XZtAjPnRlBtY1MWS7WM+E/McVXmjdF7eLK5J?=
 =?us-ascii?Q?wm1tjAqIAE2uezoJMqboz1mLPRFq7J9ggkcOckRT1q12AY1/MOrcLfnj0o2n?=
 =?us-ascii?Q?Xv11tthRxNOKJz0pGpHtBXA+3nNczPJ69m5pVZ62SQ7pFv3BnNprH1OgkZ4+?=
 =?us-ascii?Q?Rih/F2A3nszvF/3JCOVEb80wuQ3r3o+ZhjSRi6CX01VGR65jhez/aGO7eu4D?=
 =?us-ascii?Q?77Tatl2gZCoUBzgP7h7haK5eaBceGvFreA5d4woP5y0Xs56yPr2G2lF0G3x6?=
 =?us-ascii?Q?WLcDynvbxTIOd3fYQ3XKUdIvZXcERJtgz8N5Q84tem5Du/DyErYTbVbS6rOM?=
 =?us-ascii?Q?AAY+THlRGoWk1NkGtCdK5JHTvpbOGV2TkJTeL2pnkea45OQklWKLRx5HJV7W?=
 =?us-ascii?Q?lCAC29Uqh4vPWFuMwVhLLrwuaoqBUVM2dmelvvZaBOGUy5NwSl3ycdaX/ir+?=
 =?us-ascii?Q?btV7i1jhjATPTkT+PhpA2LDsTo/Cpife8CrI3Qe8ecx7D8qZD6q31N1+i+wx?=
 =?us-ascii?Q?ljaYva2NF8qPoviuVN/kjLvE3+gDoI9kmLix+yoGYlV1OiUtKBpRKzO9Pb3e?=
 =?us-ascii?Q?y3pARhu/Uno9GO3pj+WGApk+kr21YslBLalsbhE1/lq3myUMX3edv16Qkhcm?=
 =?us-ascii?Q?jNqicjervySHk6tFaYYovX/QzziTRhHhBFdAxsADcGSocgMk/ctztwpt8oNt?=
 =?us-ascii?Q?AiOEUaktuXy8vRbyV83+f3rptj01dJeNeN1Fmu0re8glc11ZOdFVSl/q0YOn?=
 =?us-ascii?Q?t3cTYa1xyU33nc7ap6W3qQB4LRdlWo5f6r/tMl8xNiz0R1KpD1k/fvQ+ylEu?=
 =?us-ascii?Q?sXnWxnwpMU99ft/BTNgy3cOuKcVBkboYj+B/FJIB5vmXm3wV/La4hWjGDweP?=
 =?us-ascii?Q?ULldzWHHz6Sm+mvSBeCI4rliRppwfi+/TgJPg0rihPxsHkpwSrGiuqRUUuiZ?=
 =?us-ascii?Q?UmUSRj8NeCdhILMQyDXP/Dok1sDbzMI2GMtv3vrhx6H/+bP3YtQJ2KJhqNe9?=
 =?us-ascii?Q?4DaIfDmFQHUOULCsFenv8xx87Pw+qnHYwVaAl1lpKLrg4z750CN7mUL2pRgk?=
 =?us-ascii?Q?WwaEHbpLWT571mfKei2B6SOpzbkxBDQrQbt+t5ga6KirPfEGWjHG07Y5umND?=
 =?us-ascii?Q?43B0apgrKsBMNY/fHBNQAzoyGyiymnYuqOxVm7bgnS2hAp/aqbhzAAPta8yf?=
 =?us-ascii?Q?95d3KvD0SG2WliftZCKnqd5Gb5U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ced53a0-0408-417b-a711-08de64e2bf16
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 18:16:56.3998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SP5MwdvD0zxbEDkRGuWllci6WzCFZoig1dMP/5yZbczlbftv6KBsBwKmpqnYzrOc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB10370
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 18:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124218

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Peter Kjellerstedt via lists.openembedded.o=
rg
> Sent: den 3 februari 2026 11:05
> To: yogesh.tyagi@intel.com; openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] abseil-cpp: Set CMAKE_CXX_STANDARD to =
17
>=20
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-devel@lis=
ts.openembedded.org> On Behalf Of Yogesh Tyagi via lists.openembedded.org
> > Sent: den 2 februari 2026 20:17
> > To: openembedded-devel@lists.openembedded.org
> > Cc: yogesh.tyagi@intel.com
> > Subject: [oe] [meta-oe][PATCH] abseil-cpp: Set CMAKE_CXX_STANDARD to 17
> >
> > The compiler defaults to C++ < 17 which causes build failures.
> > Abseil requires C++17 or higher, so explicitly set CMAKE_CXX_STANDARD=
=3D17
> > to ensure the build uses the correct C++ standard.
> >
> > Error:
> > CMake Error at CMake/AbseilDll.cmake:745 (message):
> >   The compiler defaults to or is configured for C++ < 17.  C++ >=3D 17 =
is
> >   required and Abseil and all libraries that use Abseil must use the sa=
me C++
> >   language standard
> >
> > Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
> > ---
> >  meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.=
bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
> > index e2bce0be11..d4475ee73a 100644
> > --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
> > +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
> > @@ -21,6 +21,7 @@ inherit cmake
> >  EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
> >                   -DBUILD_TESTING=3DOFF    \
> >                   -DABSL_ENABLE_INSTALL=3DON \
> > +                 -DCMAKE_CXX_STANDARD=3D17 \
> >                  "
> >  #  riscv32-yoe-linux-ld.lld: error: undefined reference: __atomic_stor=
e_8
> >  #  >>> referenced by <recipe-sysroot>/usr/lib/libabsl_flags_internal.s=
o.2505.0.0 (disallowed by --no-allow-shlib-undefined)
> > --
> > 2.34.1
>=20
> I am not sure this is the correct thing to do. This means that for target=
,
> you will now downgrade the C++ standard when building abseil. However, as
> it says, all libraries that use abseil must use the same C++ standard. Th=
is
> will thus no longer be the case, unless all users of abseil are also
> modified to use C++17.
>=20
> I believe the error you are seeing comes from building abseil-native, i.e=
.,
> the native compiler you use uses an older C++ standard by default. But al=
so
> in this case, just changing it for abseil is probably not the right thing=
 to
> do.
>=20
> The correct solution, I believe, is to use a newer native compiler. This =
may
> mean that you will have to use a buildtools tarball unless you can upgrad=
e
> your host system.
>=20
> //Peter

I note that this was integrated without any response to my concerns.

//Peter


