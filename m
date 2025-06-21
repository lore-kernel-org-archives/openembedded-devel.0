Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77059C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 20:43:26 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.58])
 by mx.groups.io with SMTP id smtpd.web10.14911.1750538603741733332
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 13:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=BccsiWoa;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.69.58, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0ntM6gWoIEcIIf5UOUkKeQdN1+6KGGk8HViPolR8G0UeSpSGxiyB4sdMgXMQY0WPlqBrkR1abuoy/XoieE/VjrZWfVa6J6OcGsAilXpSNyIS7MXnuSwAET4B5FV4aG/UJYiBVGuJX9owXchyysV/ymS/4vy/odsdE1OcCa7k5TV7KOcIvuUMy0konzEqrK0hnnTYXyZWW05ytEek+SfGv8Qi0Q00qWxJlIcWxwp/GVjlT2JtPmxgXH6kR+dKO9mac2eRbrCazg6n14ytuAvXQ1vTkuedaTR1sVbIH1FmtAFaDggEyVHKmPQHSIhYSUANvmOH5wO+nYRK+4tKSYRug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8uOxXvNrUXyafxbeL5kFKjMDE6vaKAUYDY/3JYLvew=;
 b=GSa+GznYzwngEZ2aYPNJxo1iROWmdsvcdifyCdOD+gO7XcP936wqDGtkod6WgpRBynXt/8fRiBQMFquNYrdJx1W6fm+H9cTM8naVtojbbum0V05UczBgmNFLnGI5flgiESxK6yHZWUzrFyWHku2jV/GSIcN7vUXNL7C/7+gX8xziYcImCfFukFU73JPND0bT/J9v95x+qVQ2aKIDR3GnqNhtX9/gXWvpPRn4wstR1WSZ2PEyEsSPPAJffr28dwUrD/ic9HgXqfltyGpbr2MUkI3zR6W5g+PbfGzXoL5B4WrRezkVFcdp9Wl/89jWO0Jx0U9skZ7R+AlsbUsBHfnJVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8uOxXvNrUXyafxbeL5kFKjMDE6vaKAUYDY/3JYLvew=;
 b=BccsiWoa2/UzuQFyzyCVSc9xcJUor3dBP6kvoe8FCjKBMy1qiWNfDS54M9NVqzS0Yb+W6mW0wlAWrKra3w0iHigzOAxfOL3ePOQ5SUkF1ih7AVGEdQ6TZtBTp8yKkImACAkSfXbg403FV4EyxN6xr5JDek1zjfn2K8Zs0q/ttsg=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by PAXPR06MB8580.eurprd06.prod.outlook.com (2603:10a6:102:2b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Sat, 21 Jun
 2025 20:43:19 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3%4]) with mapi id 15.20.8857.025; Sat, 21 Jun 2025
 20:43:19 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: =?Windows-1252?Q?Enrico_J=F6rns?= <ejo@pengutronix.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>, Khem
 Raj <raj.khem@gmail.com>, "erik@riscstar.com" <erik@riscstar.com>,
	"mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
Subject: Re: [oe] [meta-oe][PATCH v1 0/3] add support for building "system
 extension images"
Thread-Topic: [oe] [meta-oe][PATCH v1 0/3] add support for building "system
 extension images"
Thread-Index: AQHb0htCGdFSxSETPUyQFktdPK6nabPvpK0AgABJ8+mAHkUZBA==
Date: Sat, 21 Jun 2025 20:43:19 +0000
Message-ID: 
 <AM8PR06MB7521381635E33D237D0F6B7BBC7FA@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20250531110022.3843938-1-johannes.schneider@leica-geosystems.com>
 <9d73f186246db36363f095aada9289215561d43c.camel@pengutronix.de>
 <AM8PR06MB752189DAAD2B6C399A654C63BC62A@AM8PR06MB7521.eurprd06.prod.outlook.com>
In-Reply-To: 
 <AM8PR06MB752189DAAD2B6C399A654C63BC62A@AM8PR06MB7521.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|PAXPR06MB8580:EE_
x-ms-office365-filtering-correlation-id: 36e74a1d-5c05-425f-3111-08ddb10441b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|38070700018;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?BUE9yW3lc+EmsYtoYnBi7WQ3h0633fRvoLBrmV75/GGDhhimYTKxzV4g?=
 =?Windows-1252?Q?B27QsgvYCZd7k/cl3Z9rxbhZXhTc9KrvJJjtaAgondK+aS3RYM0gyN+j?=
 =?Windows-1252?Q?ufShD5Snj6hSsERuRHet6kyrdEtA5t/HyABscz6mRKcPdxCFrbjFBp97?=
 =?Windows-1252?Q?DyzmrYAFj5YIHNjXeje9ganaTF63MmotewB9GCn8aqjhcYSVBVdaNQVF?=
 =?Windows-1252?Q?E+tP+arAEXgC2byrGAV/ScswbNbQj2Q0cqCGDH8g5ZWWvdLdUXUlnYO6?=
 =?Windows-1252?Q?sWQml0cJM/f56yLLwJQcH2cy/1gl6+7BJz1L3vHBNgNChP4d5S4N5Jo6?=
 =?Windows-1252?Q?isW9Jht0pKt5YC8Zz4Ywpfx6qm2J5ZdUGHvG/6V7pYqBjAiMSAd/zPM9?=
 =?Windows-1252?Q?DMfB0K2UL9DIQPhDDQx3se1d7GEAtOORKb0YKKn2Tu7PjlGgY77iOO42?=
 =?Windows-1252?Q?JThfVRV6vCiZgv9HO0YyGk+BP8RMXoq1VxB8JYsoQrLTAR75JNbuA/Ba?=
 =?Windows-1252?Q?ol0Pd2xAVf1oQWYW0cI55i2nj0QwNnCkp1u7l3mbkIq0vUmJPHD2Rv06?=
 =?Windows-1252?Q?+3jvaVVsTGOLbXeyTub2Ms6OdEmzwWAwxkDhc8Y/xO7qSeWq+KopjeFZ?=
 =?Windows-1252?Q?w9PctRvNB3v6RBVqTZkrdMs5gA736OR0HRFp4ofgJ3y7urosuOAqKKRM?=
 =?Windows-1252?Q?rXO021vZ8agL+KyBsvU3jGA/kXHu7YLLUgXGxzhW8Sdi+E/Yf7souwwj?=
 =?Windows-1252?Q?gUk2jycGnID7mPo7/yFuGp3BO8XoAtq9EXFXApOnSMAfYHKNrtnA9/m2?=
 =?Windows-1252?Q?PapBTe/Y6rNIU8Brfi4Ze9u4n9V3vShLlLjl/TvsMTcbpSeEWWxtg8fD?=
 =?Windows-1252?Q?S2iCrlLIX7qK5tUu0fhfZ57UhBpjJhb/qdm4soLWadmMdOap2emuanwm?=
 =?Windows-1252?Q?7hDZ1fFxdWCur5PP+MAXdTKAvQmVMui8MRjZ/qjjjtbcdGDSda2vcecD?=
 =?Windows-1252?Q?qnUYy5RpjMABCAcUDlBasvnqaUzSotTzQWm7wCQIELajr4PjK9TwolOm?=
 =?Windows-1252?Q?CIx9gtDIK35SrJC7n9QO7fMpGc5CyhjG+4qYxVwb+k+z/+VQXNuJYgOd?=
 =?Windows-1252?Q?FKQ6mFLXZnQ1JswNbC9XEBl5dldHGdrE/Wc3jEykC4ybJSojzQM78Ei1?=
 =?Windows-1252?Q?hVBgKVX03vHgbFH2ZrqdRWS8TS6BBfWmhJ81b8Ov0sD1rgobLHqD5XAL?=
 =?Windows-1252?Q?FSkqqMfikuiScAJDWpGfti7sNfDCEpnxj+3e/i3jbVado0U9MK6lWrJ4?=
 =?Windows-1252?Q?LLaH/ZI1gYR8CO5K9qGMEf0N5MpfrJFGcAKZnLgrOXtHA7ypjTWqjpHX?=
 =?Windows-1252?Q?EoZmssiBtYR8UEGEzn2+de43F9q6ipC2y5egeMif5Q8SEwm1jr32/Ojz?=
 =?Windows-1252?Q?aN3c+U7TkJTKKsQuDhf/MLRs/Yo53/f26RyLSP8Bg5nNzKiLH+THjeYM?=
 =?Windows-1252?Q?RCqYuK2D3m+Jg47Y9OO8pzDPALt/gETwzoYPYwXvVBEtjMtIC9k=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?V2vm75FYGnB4dTKuET8XJqQiysi/MJ+sJeIl/sqAY4GgFKB8mp3w8Dxl?=
 =?Windows-1252?Q?sHm0XhfWf8Z7vTksBu7lMmGpTWAFRVY6FhWLhHXSObV9vE4SLbQo8gAv?=
 =?Windows-1252?Q?VOBAptvaPlhgCPUuAmnhNVrtQJtK4taj6p/8OVzHwl29r9MNp9t6E3JF?=
 =?Windows-1252?Q?Zzn9lzhTK/Wa9rK06a+2ZQs/2VVjQk59SWBK/SAoA8yJCbU7nh3Lenop?=
 =?Windows-1252?Q?x7ZA0vCZZRuraHHTaoxjpU9NHsFFAKo4w9nSVTyWvl712eEO5k6zgF7c?=
 =?Windows-1252?Q?ZE8Q8JOcHtwPMAE6S7HXhQ09VLvg+6fIcUOmdG0KbqjPqvP7revmBpME?=
 =?Windows-1252?Q?owfwsGCptoGaE79aJGj0YoqmG1b8pnWEW1YQx8dF/lJFhAfswkngm+iQ?=
 =?Windows-1252?Q?xco3tS+vVVjn3XImy1UR81CPYv4O63Vhmtzv3heXp/n61bmNDwSGRvOB?=
 =?Windows-1252?Q?MWfBk+xoHqm0IBa8KaqRT6oUatiU+HCHJgezS4Gha93wXzBw6TYaOrv8?=
 =?Windows-1252?Q?Y1bE27zoYiPc9+OEFkJdVH47R5ANZHI/QhF81eHXgZbamvuLoSb/UNrc?=
 =?Windows-1252?Q?nDxFIjHCGtXwNhCNe5FWH79WgC8x506ep45Pp6hcwhVADzMcLZg69GkI?=
 =?Windows-1252?Q?Q2MxvS4AKm6kRCIFBeLgCnG7ynPJXUtN/F8c+/4MmHN50nTNB6FLJRb8?=
 =?Windows-1252?Q?ta7RBWG2sZtYHgMNsKO78KrUUjj7V+Cxh3TMa5jIVqyP5KT/rMInjuRC?=
 =?Windows-1252?Q?LsSNX/jt8nP7fgF1S8ug+zxF5NrhAJH/jYCxqDkeuct5r7FGVyZJTynL?=
 =?Windows-1252?Q?dx7vJe8vXBPxfiYAkSo2hbjsF53Ci0ed4bnHzXtH4c0FvrxuwufAz0X0?=
 =?Windows-1252?Q?bfRZmKR7/UJD9JahS8AoerngH03kDxSuFIWuE7tthiQBnaSNriQjqb16?=
 =?Windows-1252?Q?HlAPkC9jwQjXAmDUyJZJEkt0kG783umfjAjeOsGmbYy6yitVbmLF2a6/?=
 =?Windows-1252?Q?4SgnzlAmpbpMRGLoMNEgtLGnirMgG0hlekRu2LKDGQV8CumKgmEdtznK?=
 =?Windows-1252?Q?ClQjO8bWyltGwlc4oVrUQlIwPQw7WaQIBhYtY76cIYAJJ0ol6IWujUs8?=
 =?Windows-1252?Q?JHTTsRJqf1tu7zO4rhX1a8v1qIRfCIdjW1msGZawVtrpuav33+U6m/gc?=
 =?Windows-1252?Q?M4j5pzmQ6GqLYybreTW1qs+u4jeL96CZ3/sdj4BrwX9/TgRBmFUriSeT?=
 =?Windows-1252?Q?dZKst3YU5QEOxamzJktwVP/NtbfoZQVoRcyZA6qLuI+2lHsc3QlJ5VjJ?=
 =?Windows-1252?Q?HXgmrUbnyY4Zz5uRC1ieu/9t5vR55AzehPiWiIKnR9kRzhEZwJ1yi0SG?=
 =?Windows-1252?Q?P1OgGo5pBiwofEBK9/gKezdBIMJbrC/RFB2aOnHzGpGWadFuZGVuRazQ?=
 =?Windows-1252?Q?HFcfiLAVJG3d0Yphzqxxa1tnwfXo4Jgn3c1cAZqfVfciiqQkqgDeusiX?=
 =?Windows-1252?Q?sNepITVBIYy2kqUPDZFwpXV3QXQg2ucAQmIlELgh//oliZ1C9TKBkcJg?=
 =?Windows-1252?Q?cMEXdXhQXmK/zLjssHgZu92GReFh9PyYNOPkMvViDW2NfoxTR1rPMz0+?=
 =?Windows-1252?Q?nmPbPYqwsZ/LnUn9+LFKTUVvnT0WvLfe6c3aeUBD3Mga7Yi8WyG1dkO9?=
 =?Windows-1252?Q?hBOJG0bNcT/gzsdRgYS7Ly0OFImA5z+f//2+wkG3UdTFNeA2hHuxpoho?=
 =?Windows-1252?Q?W02QmMxHvztsdpViQeeirPPnWuEoAf5SCF7noSAB3e/Xlo6EZLQnPWGb?=
 =?Windows-1252?Q?cyME+/z5UgKJAh7ddd8wouKmaiI=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e74a1d-5c05-425f-3111-08ddb10441b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2025 20:43:19.6267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zcZgT26F1rcGwmw72aTk0ZJt27A4Obqu0gnoWo+ae4cl6nK5oiS56Qd0gigJf+/ZSebEfR6ThgMSJLkRDA5q5OtX4YVhX0DyuhsqR0NMGgAJy4v8uOuR5BfnKwA5RXe5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8580
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 20:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118013

Hoi Enrico,

>
> >
> > thank you for sharing you approach!
> >
>
> :-D
>
> >
> > I few quick notes that came to my mind when scrolling through the patch=
es/cover letter.
> >
> > Am Samstag, dem 31.05.2025 um 13:00 +0200 schrieb Johannes Schneider vi=
a lists.openembedded.org:
> > > This patch-stack adds support for building "system extension images" =
to meta-oe - to quote the
> > > man-page [1]:
> > > "The primary use case for system images are immutable environments wh=
ere debugging and development
> > > tools shall optionally be made available, but not included in the imm=
utable base OS image itself
> > > (e.g. strace(1) and gdb(1) shall be an optionally installable additio=
n in order to make
> > > debugging/development easier). System extension images should not be =
misunderstood as a generic
> > > software packaging framework, as no dependency scheme is available: s=
ystem extensions should carry
> > > all files they need themselves, except for those already shipped in t=
he underlying host system
> > > image. Typically, system extension images are built at the same time =
as the base OS image =97 within
> > > the same build system."
> > >
> > > Link: https://www.freedesktop.org/software/systemd/man/latest/systemd=
-sysext.html
> >
> > The interesting part
> >
> >   system extensions should carry all files they need themselves, except=
 for those
> >   already shipped in the underlying host system image.
> >
> > is not really addressed yet by the class, since it takes a conventional=
 rootfs image recipe, adds a
> > version file and ensures that the removal of 'os-release' works around =
the sanity check.
> >

Just noticed: yes, the sysext class only adds things to get the compatibili=
ty...

> >
>
> very good observation - yes, the extension/overlay would bring along all =
files
> that the additional packages (recursivly) rdepend upon - regardless of wh=
ether
> they are already in the rootfs or not - so ATM the overlay is not a true =
delta
> to "some underlying rootfs", but more a self-contained/-complete rootfs (=
which a
> "systemd portable service" would require... but different topic ;-)
>
> the blessing/curse is that the extension image is larger then it would ne=
ed to
> be, but also brings along exactly the library version $some_tool depends =
upon
>
> roughly a year ago i tried to upstream an approach to construct such delt=
a images:
> https://lore.kernel.org/openembedded-core/4a6b60ec8200956e25e031cd28bf102=
3cf02df3f.camel@linuxfoundation.org/t/#u
>
> but it ended up bouncing off of the testing infrastructure (which isn't e=
asily
> accessible or spun up locally) ... that's why it ended up at v11, which f=
inally
> passed the CI but then got dropped alltogether :'-(
>
> >
> > To better solve this, I guess we would need a way to either split the s=
ysext content from the rootfs
> > before generating both, or, a proper way to create a 'non-rootfs', i.e.=
 a file system that does not
> > contain the default rootfs files, etc.
> >

... but the discoverable-disk-image class does some "filtering": systemd-re=
part
takes in configuration files =3D "definitions" (see:
systemd/repart/definitions/${REPART_DDI_TYPE}.repart.d/*) which then let
systemd-repart take in a whole rootfs (default files: /etc /boot /bin ....)=
 and
then copies only e.g. /usr into the .ddi

What we still don't have though is actual layering: some library that is al=
ready
in the base RO rootfs will show up again in the .ddi - if it is pulled in a=
s
dependency.

-> added a comment for that too with v2

> >
> > I'd assume these base questions are relevant for a number of similar pr=
oblems, too. Like for
> > creating layered containers.
> >
>
> ATM i'm not aware of anyone/thing doing sth like layering images (for con=
tainers
> or rootfs) that actually build only delta-images and then stack them back
> together - or did i just miss sth like this?
>
> >
> > For now, to not give the impression of being a generic solution for cre=
ating systext's, maybe one
> > should rename the class to reflect its for a rootfs or covers only the =
version file generation so
> > far? E.g.: systemd-sysext-rootfs.bbclass.
> >
> > > These patches are added to meta-oe - instead of oe-core - because sys=
temd-repart-native requires
> > > 'cryptsetup' to build discoverable-disk-images with verity and option=
al signature partitions - and
> > > cryptsetup is currently only/still in meta-oe.
> >
> > This could also be a point where one might consider moving it to oe-cor=
e, since it provides 'core'
> > functionality for creating encrypted system setups, which becomes more =
and more relevant, e.g. for
> > properly protecting sensitive personal data.
> >
>
> and systemd uses (lib)cryptsetup in many places... should i move the whol=
e
> patchstack over there? opinions of the layer maintainer(s)? (-:
>
> >
> > > Note that erofs-utils and systemd-repart-native have to be of a recen=
t version, to support
> > > features like compression and signing through PKCS#11 (e.g. as provid=
ed by the
> > > classes/signing.bbclass)
> > >
> > > As an example consider this simple image recipe:
> > > SUMMARY =3D "An example image to showcase a system extension image."
> > > LICENSE =3D "MIT"
> > > inherit discoverable-disk-image sysext-image
> > > IMAGE_FEATURES =3D ""
> > > IMAGE_LINGUAS =3D ""
> > > IMAGE_INSTALL =3D "gdb"
> >
> > This example might be quite helpful to see how the class intents to be =
used.
> > As it will get lost when patches are merged, maybe move it to the class=
 inline documentation or at
> > least into the corresponding commit message?
> >
>
> good idea will do (with the next version)
>
> >
> >
> > Regards, Enrico
> >
> > > After building, the resulting 'extension-image-example-*sysext.rootfs=
.ddi' can be deployed to an
> > > embedded system (running from a RO rootfs) and 'merged' into the OS b=
y following steps:
> > > place a symlink into the systemd-sysext image search path:
> > > $> mkdir /run/extensions
> > > $> ln -s /tmp/extension-example.sysext.ddi /run/extensions/example.ra=
w
> > > list all available extensions:
> > > $> systemd-sysext list
> > > and enable the found extensions:
> > > $> SYSTEMD_LOG_LEVEL=3Ddebug systemd-sysext merge
> > >
>

gru=DF
Johannes

