Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF76FC5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 14:50:56 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.66])
 by mx.groups.io with SMTP id smtpd.web11.51824.1748875851252354803
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 07:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=kkoNIH1h;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.84.66, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmrGSiRb4l4dAz8Obf1wHaLul2khm51FKOVSFI2n5CZGQ46D4YKTFpzOaY+DYDdze3qq69EDCj8B0EVX5Hs3Et1sRnW07cpS9mgBSBwbYrdyk39aApLABFeZCGv18GXyoQk/wQHPZRR9d/E4Iij7O+P6BXKMnL+51POXApAM10NjkT3fGx8LbYAPn1hMl8uH9yLI/LW3VeQgSy+0FVoHrGbFNb0JehO378EWA6KS6Bu1Br2Blv3U+TevaId0YbIa6sZP1I0YH6RelvnISJe3P8HKtSgpD0S79+61ofuMGWgkqJ/ypNl0aAWStZ8hol8cMaq5+wW8/FSz18eWpFAq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4Ig+eptdNmrsDEmKMvDrpmkMNVZChr6fQ7CZ811IPs=;
 b=lj7sN1LgJij7K/uW+iFjA/1ctiJ1UbaWeYUdToIOV9I/3EOrUZ9N3bB0EG+72otACh9UOIq3azBH4hiMqBWAA+1DcVoQd81Xg3NjK6QOMKO2ZC5jVrM03N4aY1B7qpiI+APSOWHDyrGp6pCYJU8TXYYyC3d4NoZ197YWHffRkrmAfK3NbpRIroynBzvniAXI1aNHWjjThvDzMk16uKh/WD0dQsP7MxZZoBg1ReQlFtPlwSiFnvHgu2oHtRrP2iUqWV/cJXsjjIusByKsJhlWYXrYgjQZvvghGdVeck46dQ75EoLdoPsR7JuZL9rODozprLSlOIIrd1m8Agrcqn3c8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4Ig+eptdNmrsDEmKMvDrpmkMNVZChr6fQ7CZ811IPs=;
 b=kkoNIH1hPwkEtrKMnorSkAaweLv9AuBldEeLW6hCDN8F5efZiJ2phSUsX8xOCn/PC2qTgghsXgQjXioxG4Fl+/PFW3oj/SHSXRPLAdFyYzEboyFATlgIFjgFbrRZVp6JeRguxcM2004ya+wEvaTAgDf4cwdCLDGUqKR0djIn8oY=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by OSMPR06MB9907.eurprd06.prod.outlook.com (2603:10a6:e10:6f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 2 Jun
 2025 14:50:46 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3%4]) with mapi id 15.20.8792.033; Mon, 2 Jun 2025
 14:50:46 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: =?Windows-1252?Q?Enrico_J=F6rns?= <ejo@pengutronix.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>,
	"erik@riscstar.com" <erik@riscstar.com>
CC: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: Re: [oe] [meta-oe][PATCH v1 0/3] add support for building "system
 extension images"
Thread-Topic: [oe] [meta-oe][PATCH v1 0/3] add support for building "system
 extension images"
Thread-Index: AQHb0htCGdFSxSETPUyQFktdPK6nabPvpK0AgABJ8+k=
Date: Mon, 2 Jun 2025 14:50:46 +0000
Message-ID: 
 <AM8PR06MB752189DAAD2B6C399A654C63BC62A@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20250531110022.3843938-1-johannes.schneider@leica-geosystems.com>
 <9d73f186246db36363f095aada9289215561d43c.camel@pengutronix.de>
In-Reply-To: <9d73f186246db36363f095aada9289215561d43c.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|OSMPR06MB9907:EE_
x-ms-office365-filtering-correlation-id: 9dfdf8a6-ff0c-4ae5-f7af-08dda1e4db96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?sVlUuntN/ONDUNS6PYL5bxbHqoCu4go3pfMLErXxEXTFCXuPAqCZdaTF?=
 =?Windows-1252?Q?MYb1XGgmwE/lPFGrmxxV1mu+x6dLCUG7X9ipbAvQf+KLZDn6faGTBCvM?=
 =?Windows-1252?Q?agw028G3o6UhrrLY3AWt7eRNyxelCaLeBFSWXf9taBgS664mZS5NIDc2?=
 =?Windows-1252?Q?diJ7V+x6aHivKMwLmxrTxpI7sJcYmIFSmqUJ1+2I5bBFpByvmlpz1kSH?=
 =?Windows-1252?Q?KKx+XIVsO9zKO1cECAwsgxhR/j0xdiZfSkGCLyyInGO9TD3Lfdk0ctUN?=
 =?Windows-1252?Q?Ts8R9aowQEZNOL4UbSXHXpfDsfHfRPfhoKKgRS5SntlAQMFRXKI2XrY1?=
 =?Windows-1252?Q?ADrIRpz68LPE28FYtKG8p3wkEb0cm5MbazNqhSj1PHrLnLp85hsxYTse?=
 =?Windows-1252?Q?1wlfgzLxs+/HQwYsjE3TucFCCCOsEh38DFaoAhKZP0nf2TCjspgV4AVq?=
 =?Windows-1252?Q?tVFjwI71fNansuL9tDzkl2bmeLOB9IW/6BgJa8Ifksb+3H2UA3w0eNqi?=
 =?Windows-1252?Q?PM+RR1/dmWmhRkoWJKSJLey5uiu5XeKLxOZUXb+Vel0Kit4S1dCzDCAR?=
 =?Windows-1252?Q?iPZ4jhcBW/GH+dM7/bYs0YmpGKgN+WVTyqyPYyB6Pa3AQhn7ECgldz7O?=
 =?Windows-1252?Q?eulf94t5G4ECN1zhB2yf63c6j9lhyPI1zfZ9eM1arFvl5qQ92K5n5y2z?=
 =?Windows-1252?Q?PZ/J1O8u2dgcrJ+V+VwxaU7IULneZ0IKHZoxzFlOaZUXf1xfFcahxa/H?=
 =?Windows-1252?Q?aTj1U6enUZUAgY7a8c3ShML5/rq6MRnylxYifdFCX5CeO8Let1e8GkYr?=
 =?Windows-1252?Q?S5zVjVhj7dcz/pDPuVU9dKJzr2EbFWnEM5Ms0yVC7gBXhagViyr8KzXP?=
 =?Windows-1252?Q?cUmY9LEYfQOZMDb4QzfOWwuhjo7jPady3weTMPCUaGa6hBDrOcLnn1J7?=
 =?Windows-1252?Q?MNsWTh5slOEVyQOTtx22WQ9yfMH5cryUchy+HmtdB9J6qVOh+Y3HKFOP?=
 =?Windows-1252?Q?+HdMPmTYN1pNr1o0ggrUP9Sazfwxs7UFn7QQih6m453AbwkZsSHfFLjB?=
 =?Windows-1252?Q?xy/qfBst0EFG5bdSHY3UktoT7fiaim2f9ONAzvTFACvrekjb/v1rSEUf?=
 =?Windows-1252?Q?XdhoPk4OmY355uCrvFMI4Bt1/YXv7622ailfWgK7Wqdodt7nt8fgDlQJ?=
 =?Windows-1252?Q?0zhITiLpxYHGk6KspoIyi9hmNSK2RR+rar9cu08nGq/yj6XHTWT8apAF?=
 =?Windows-1252?Q?Uajy1K6zk0w+evt11NaLwPikns0qObwWmfDK5Ti62SZqdFzkebkn649k?=
 =?Windows-1252?Q?gp5hrdtNYzV6wKx8L/QzicbzLZxP/IDq5yodY1Qz44VSnZerFDaWrE96?=
 =?Windows-1252?Q?GlWCf/wZlM3FV2a9e7nFtxzfxY5uBCkrvH8sIfMtlNuZhYTOVMIyM89k?=
 =?Windows-1252?Q?3mXUoirPQZg5G+N2yYCkpuRD5QUNcwYJUncC/LflLep2MQJsCy7ct66G?=
 =?Windows-1252?Q?A5Tji+wGEpAoWb4J5K/BLjRLpbjBDNEeOELIOTfGCKKDdHYDkYI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?uIqjzHfOEFBoUe80gWBShnFtEYiTe1AlaErVDzdLwNb7eFo0yGcrokt8?=
 =?Windows-1252?Q?EfPMzekykbHSyWD9J+XhGSF1szAG4fKaq0oZdlrKDhCHIi5ihqHKC7Wz?=
 =?Windows-1252?Q?Xuw9Spf+v81WCbl2DHfG0kXktrolVTObiLiXFVbwt0hZEtpeIeli2qmG?=
 =?Windows-1252?Q?ZQahMOzwULO+/jEm8tfv1GZ6SLjtqOu/K3Clb4nL2kNW8eXGN/mt1Pgi?=
 =?Windows-1252?Q?73sHQs0wCkzPQUwoPetxLJ70nhiX9OxolXISRDnkvCFwI7i3hnLbHUTP?=
 =?Windows-1252?Q?0sA2viYDVPaqx6DOmb2/SXBPakjw7wbMAMie3esnGOnMUM1kxTye5+KU?=
 =?Windows-1252?Q?2wNfx+DK4tPfxa0C6dClaXtmY9dpF1paqE4LI25nLo+tBXbwI+oWEQQ0?=
 =?Windows-1252?Q?RkakB99wnSBX3Hw1kN12zMKaSz1YLJcfeoaw+gXWnQsWGfXLd8Go+5Wh?=
 =?Windows-1252?Q?5zt6X7Q2MGVrvJTZ4u5pfvMRAZt0FFXimoz8A+2pfleA8zPa8FLyb+gJ?=
 =?Windows-1252?Q?ixqfi/molWr5NzAepC9KZnv29u3FdEZDw2N/2IfWSWRozYH++IhzYCH+?=
 =?Windows-1252?Q?0CBPJkRMsgtXy0wiYUlg367tdnshGTOgXVhQ1RGMVzEY+iglUBzPYfwB?=
 =?Windows-1252?Q?9uPDT7nrtWUd5a1LEqlwssnzPwWzOodrFQX1biXHXapVHCXHmaz87U3F?=
 =?Windows-1252?Q?NYWwIEZr/JujbbqxOEWuDfMduSTxqDaEg8dyHhNZkOA3mrwAgXctj6kX?=
 =?Windows-1252?Q?MMN7gZmK7ScymeM0GUZM9ENtUztQHCcxXSas09y67IK//NL2rQMMfWQv?=
 =?Windows-1252?Q?0kWnNXhpoMWcsq9o1k90WTdL7NYXumkaMk83oBXKRScANLqgA0gn0gNh?=
 =?Windows-1252?Q?eA0FtRs08khf/brzNcqZi1WdqJKeUAP2h5G0BIAbJFkwyjSmCnQfbXwB?=
 =?Windows-1252?Q?jgzKhvgKlVNq69FdgYTLWkjyy3eWgoEFttdPxQbVSkgD7bRdMThq72/b?=
 =?Windows-1252?Q?MPRIii/EiIh5ZNOZLNWgXs8gxtmCvIMROM3rOEKHJjxDnzdQtvLeNNXA?=
 =?Windows-1252?Q?f/U//e4YGba4PuwCT2SvH+TC46Ktp8BMoEd6+EwWLC67eYMa/ruWeVbb?=
 =?Windows-1252?Q?GJltP1WxmWy2DXlaji7JXlxgnUwdhyS5IiBZkqTuk/QfDopxBdFBq7vc?=
 =?Windows-1252?Q?m9sAkQeUV2Z04a6TJrn/NEuDlZIvUR3UPehWiTACU7JxHRoUojj/g3ws?=
 =?Windows-1252?Q?yHL78FHz+xOU3mEWrDGmxiV1A2ouM1Fayoair3iJbZNdZXaXgT5yUF2+?=
 =?Windows-1252?Q?ilAUazZer6iSgJEga1RGRtNsc1C63vNYdPpEC++8HcS1de2LeX3mrkfe?=
 =?Windows-1252?Q?Pgu1MvN5oRfJALFZRfcq61kE3KJFfe1PIJnLZkJqwrxc3lmJQeEaIJjn?=
 =?Windows-1252?Q?XES4jTzqxpjUPRT2+F8bJf0chGrPo2/8oNlj0LqoS50K8f86uzvC2Fvx?=
 =?Windows-1252?Q?/H5/QJ6Mw/g/EaPCsudz2ktzrYQKUNcdJYLYX2bKJSb1fBN2MsmbQSHO?=
 =?Windows-1252?Q?2/VzrxBGoh/iNhts5J4B0VH4H7xWLnug3Jq9Z5kCdxkWearhbQGr2cKp?=
 =?Windows-1252?Q?80TdqJcMHnvwHe56rra7RS+ctttV2T+ApjilzwPx+sE24tpwMnuElm+c?=
 =?Windows-1252?Q?dEEwM8eKRGLO42afwOxnd87ZdhF1bMyFHgp1o5rqHDwXm4/4pKtYC/9w?=
 =?Windows-1252?Q?odJ5PXZunjei1EC9POXrz/XHRPB5o86gr6MXQ53iK6ns8KiaoSfSgH15?=
 =?Windows-1252?Q?DonuoGLpXbBLdamolNziHnhXCKo=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dfdf8a6-ff0c-4ae5-f7af-08dda1e4db96
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 14:50:46.5148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kkzgT6KD8uhWuVNn2aY89tBdgFAk5B1NSxi53gHXfYlJitVFXbfmcjcE7ZaTCRk1Jryhy+s/jAIZHbJWtZxopj/VnTku40D8sLF+Xq4jOBkgzQMTncPDBOg7caJrO9oK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSMPR06MB9907
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 14:50:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117709

Hoi

>
> thank you for sharing you approach!
>

:-D

>
> I few quick notes that came to my mind when scrolling through the patches=
/cover letter.
>
> Am Samstag, dem 31.05.2025 um 13:00 +0200 schrieb Johannes Schneider via =
lists.openembedded.org:
> > This patch-stack adds support for building "system extension images" to=
 meta-oe - to quote the
> > man-page [1]:
> > "The primary use case for system images are immutable environments wher=
e debugging and development
> > tools shall optionally be made available, but not included in the immut=
able base OS image itself
> > (e.g. strace(1) and gdb(1) shall be an optionally installable addition =
in order to make
> > debugging/development easier). System extension images should not be mi=
sunderstood as a generic
> > software packaging framework, as no dependency scheme is available: sys=
tem extensions should carry
> > all files they need themselves, except for those already shipped in the=
 underlying host system
> > image. Typically, system extension images are built at the same time as=
 the base OS image =97 within
> > the same build system."
> >
> > Link: https://www.freedesktop.org/software/systemd/man/latest/systemd-s=
ysext.html
>
> The interesting part
>
>   system extensions should carry all files they need themselves, except f=
or those
>   already shipped in the underlying host system image.
>
> is not really addressed yet by the class, since it takes a conventional r=
ootfs image recipe, adds a
> version file and ensures that the removal of 'os-release' works around th=
e sanity check.
>

very good observation - yes, the extension/overlay would bring along all fi=
les
that the additional packages (recursivly) rdepend upon - regardless of whet=
her
they are already in the rootfs or not - so ATM the overlay is not a true de=
lta
to "some underlying rootfs", but more a self-contained/-complete rootfs (wh=
ich a
"systemd portable service" would require... but different topic ;-)

the blessing/curse is that the extension image is larger then it would need=
 to
be, but also brings along exactly the library version $some_tool depends up=
on

roughly a year ago i tried to upstream an approach to construct such delta =
images:
https://lore.kernel.org/openembedded-core/4a6b60ec8200956e25e031cd28bf1023c=
f02df3f.camel@linuxfoundation.org/t/#u

but it ended up bouncing off of the testing infrastructure (which isn't eas=
ily
accessible or spun up locally) ... that's why it ended up at v11, which fin=
ally
passed the CI but then got dropped alltogether :'-(

>
> To better solve this, I guess we would need a way to either split the sys=
ext content from the rootfs
> before generating both, or, a proper way to create a 'non-rootfs', i.e. a=
 file system that does not
> contain the default rootfs files, etc.
>
> I'd assume these base questions are relevant for a number of similar prob=
lems, too. Like for
> creating layered containers.
>

ATM i'm not aware of anyone/thing doing sth like layering images (for conta=
iners
or rootfs) that actually build only delta-images and then stack them back
together - or did i just miss sth like this?

>
> For now, to not give the impression of being a generic solution for creat=
ing systext's, maybe one
> should rename the class to reflect its for a rootfs or covers only the ve=
rsion file generation so
> far? E.g.: systemd-sysext-rootfs.bbclass.
>
> > These patches are added to meta-oe - instead of oe-core - because syste=
md-repart-native requires
> > 'cryptsetup' to build discoverable-disk-images with verity and optional=
 signature partitions - and
> > cryptsetup is currently only/still in meta-oe.
>
> This could also be a point where one might consider moving it to oe-core,=
 since it provides 'core'
> functionality for creating encrypted system setups, which becomes more an=
d more relevant, e.g. for
> properly protecting sensitive personal data.
>

and systemd uses (lib)cryptsetup in many places... should i move the whole
patchstack over there? opinions of the layer maintainer(s)? (-:

>
> > Note that erofs-utils and systemd-repart-native have to be of a recent =
version, to support
> > features like compression and signing through PKCS#11 (e.g. as provided=
 by the
> > classes/signing.bbclass)
> >
> > As an example consider this simple image recipe:
> > SUMMARY =3D "An example image to showcase a system extension image."
> > LICENSE =3D "MIT"
> > inherit discoverable-disk-image sysext-image
> > IMAGE_FEATURES =3D ""
> > IMAGE_LINGUAS =3D ""
> > IMAGE_INSTALL =3D "gdb"
>
> This example might be quite helpful to see how the class intents to be us=
ed.
> As it will get lost when patches are merged, maybe move it to the class i=
nline documentation or at
> least into the corresponding commit message?
>

good idea will do (with the next version)

>
>
> Regards, Enrico
>
> > After building, the resulting 'extension-image-example-*sysext.rootfs.d=
di' can be deployed to an
> > embedded system (running from a RO rootfs) and 'merged' into the OS by =
following steps:
> > place a symlink into the systemd-sysext image search path:
> > $> mkdir /run/extensions
> > $> ln -s /tmp/extension-example.sysext.ddi /run/extensions/example.raw
> > list all available extensions:
> > $> systemd-sysext list
> > and enable the found extensions:
> > $> SYSTEMD_LOG_LEVEL=3Ddebug systemd-sysext merge
> >

