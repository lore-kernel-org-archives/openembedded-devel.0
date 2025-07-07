Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC842C83F07
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 13:21:29 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.7])
 by mx.groups.io with SMTP id smtpd.web10.59872.1751894486015929017
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 06:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=IDOJzVBY;
 spf=pass (domain: axis.com, ip: 40.107.159.7, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPmIFEDzcYVElXwPLzOpv/x85aWQy/0lqV4Sz/t1+x1gaJGH0Qs6SDPmvFoJ+vGUS+iSVxFh0VO9MzPaF1tELb+b2OqqkIfWmeAkLyj9ZghX2R371/WcwtMo6GArwjGn/h/C+zqlqoLRAZU8K3q0TC1vitptrj8p5JLoLjQn7ypIbxyR2WXcD2BcCs1rHEeqCpqQ7jTVlGjrmfSrbqe4Uf+5kR9r5ULfdNYysFHFLaOy1iTaq1/bRrSmc9IAZx8G5AGa2tvXXz7jJ2cogfkvH7rCr/VjrT+GRYp101ZRml17zhO6u7frI0z+ZBC9S6ISiJSP8y5XWqlfOfSOG7zBoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pZXIZTPEa3CS8LV+rvzrU3wxvOswklkNP9EzDx/SuM=;
 b=f7w6ceU1IkzHdoDkB4AXAmWvQt2xfOf7RtWJRugCThwEeySYSbyb2zFTQIUBC6l9J0aak6i0hAZwZ/MOoeK4R9vrZwVZDxGXUJE4I6pQJXk1+NzLbEKXU1NRAscDFevc6F5MPiS4ENq9VW5LDuR3AfSWhC0Ru7erm0G2N7FhcGvpcECfmU4nsXja48+8H5KQyAEreLjnRhdQok8QiSbs39PscUD/MsW3brqrVOt6tQJ+BhAOMtOyu6eGa6llXjpQ6fdjB5vuji4QZ1WaLdtrsCg1WeBOA+TvvTgvO4a/XLqhVIwLqlWYwQnfkFDqabMROYGE+ALdKlR1tZgGUXxcZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pZXIZTPEa3CS8LV+rvzrU3wxvOswklkNP9EzDx/SuM=;
 b=IDOJzVBYWLC+y6roeLT+yTS+MpMcYRxecqduk5ufmRbDCJkM/tQAK9nBZWNqkq4pL67n1pfIHtsUfAsWb7QMwHchZ268McFZimHaoEzDqD/lNnv+Y+x+P6xfV95TPT+Mp1TX+VITgTbpdVMn6LBkZWHvFUD3RFwrHIokyxCAEWE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAVPR02MB9819.eurprd02.prod.outlook.com (2603:10a6:102:312::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 13:21:21 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 13:21:21 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH 08/35] jq: upgrade 1.8.0 -> 1.8.1
Thread-Topic: [oe] [meta-oe] [PATCH 08/35] jq: upgrade 1.8.0 -> 1.8.1
Thread-Index: AQHb7x6n/ujgne/3PEq9oLPs8oU2RbQmpVMQ
Date: Mon, 7 Jul 2025 13:21:21 +0000
Message-ID: 
 <DB5PR02MB1021373D44A6CACFE6C179DD4EF4FA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
 <20250707090656.1216-8-wangmy@fujitsu.com>
In-Reply-To: <20250707090656.1216-8-wangmy@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAVPR02MB9819:EE_
x-ms-office365-filtering-correlation-id: 3b5bb8ae-3b72-4810-a1e8-08ddbd592a25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?ko6ndoX420Jj8+l18J1GmrCx2Agh6nKFdrgBuJAg4YvSXVJKwrV32hMWP7XL?=
 =?us-ascii?Q?LfLrleRUPPyPeXRvfrBtuBPjMdFZYdLWBtrEJCdYIS0tB3YQRyH58OTMGAq0?=
 =?us-ascii?Q?DJjJICtfHN6oOPUJ8SdeskavW4agSYu5XOrqrofh87Mi1m3opcELoYxmDKE7?=
 =?us-ascii?Q?TzCtb4Y3yXDUP5hkmGDgvRhnlhtU8oSeffMuDAJFFO5uIeZLZu6C3UduHIrC?=
 =?us-ascii?Q?N+IXMtSHEc800GsuuOeun03NIIsAL0HKI4jbWH8Jock35rSmNEsi/pgxbhCH?=
 =?us-ascii?Q?JNh4+7GGoHS6JyvrQWKQunHUcjzSBVlvoJvgWBZ7lWqeG+UCopoJgmNAydZe?=
 =?us-ascii?Q?1bBcq2LbEUvP8b0f6fJMbYZbAr2xrpCDl4ehRCEYwLeYAb62AZMxbEI34YHW?=
 =?us-ascii?Q?85VRPThwpEB7NXWBXkthlELcLb10tPQKLJBgMSns7gMlb0qsVwXl0Phql7PN?=
 =?us-ascii?Q?KLOfSVSHo6cYafW3mIbjqtI0OF+BsULa/99YXwdwQhnMeFRC4/22GJMc1SjV?=
 =?us-ascii?Q?KPWYLAMWru9Zy0KuIcT4aD5LKngo8aEJZvAzl3/ctnbSFX99FDKrwij7s/dr?=
 =?us-ascii?Q?9APf1/EzUFngcfZdiFBAXLr3ISg2+0aWJCybOkvhht0INvwvUjhcaXL05ZxC?=
 =?us-ascii?Q?aTJWI6q5IbEvwhIk34fEJ1KvOLRAokqlHPNDYCTKOzsfx9iokn7u1SQ9I/nI?=
 =?us-ascii?Q?MYsJVAEQgftff0RuM+MtY46lt3wwOS2MbK+gvxE7p9WGISWXH3+/22W+ACg4?=
 =?us-ascii?Q?0HOfbL0dkvZ1ErW9hhHs/CLigS4S0qKNjs1HiVehnB2xS2WorS3Pxf3u7Wiz?=
 =?us-ascii?Q?iMVZrESbO+TpZ6hSOixWk0np1H1mxCbmhOcy+FG9Ek2AioVm5xaXWK8ngG+w?=
 =?us-ascii?Q?xVMMOylurIxYQ4n9sajsO3QbfbxjhBBp8vIjymSgqqzgd9MhHeCndPzhjyt4?=
 =?us-ascii?Q?60SDdsv/vttYvfhXLvv6zkOkITifeIa3elhOQRkv5dTqOoEDKpmqcyaAgmam?=
 =?us-ascii?Q?1vzIMzG3uc2O2cEr8lfjar0hiIaEG6fUXHDY1jtUcI8GWPZFSN5UgijUfHwe?=
 =?us-ascii?Q?8NMV9kxkqRfJ2n0zZUxx6KUDcv9rIkHZDU42enIba9NXjSbdTmZ93T0/uMuR?=
 =?us-ascii?Q?LqKt3OEfR8I+T8j1+o+wgUHSFEM/pe289Gif8XgvdFC8BrCTgS2jQfgKWCiO?=
 =?us-ascii?Q?+5uQ5eHLaee14D5HSk0P7kbpTrfPr0jGeBMAK+/nt17ePpNoaGLNKIR0ajlT?=
 =?us-ascii?Q?+48oMEQIgAoANka1dWBXq8hIKz8wM/C+PLjA0RMs/c1ARboOJpZyuMugdUyP?=
 =?us-ascii?Q?XjcV4tNtTj2eUCn5LNi12YpSp4It7mEJJjrbJsa0a4HTsu69DG/alhEfi89V?=
 =?us-ascii?Q?O/KBqD5cWBOHvH13MfF4KuvL42u8nER2TnHI3bb1SR+sBOEmEwcP+Sohdawj?=
 =?us-ascii?Q?DMirQynpp54=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?di2Bdu0IotP6afNYDuRYop8vgxC0IBFpJtbKMIKKIDKeFWSZBediFeHwdouW?=
 =?us-ascii?Q?0w0ZKfjznF+mlzIUsA71kwygOAeFKHOqdJN8SHn7QjFvu0FtEcjM1DLYEOtB?=
 =?us-ascii?Q?2Gr1xf9/JWxTfKPr+Yr3Cts7sRwPsswC6WrqrW2JvdHoV5fgtNIkr1VztV5w?=
 =?us-ascii?Q?FFmSBwWmNuEwiTqCB5TevatFngQ7qIFa9iMrYQN/oiamcech9ldadVDahImd?=
 =?us-ascii?Q?CCRNBUXSCCx6iyxrc55zG2kMh5TJ1ttW1w+u34ZLsQBKT1Ky0QCPAtAtk+EJ?=
 =?us-ascii?Q?j6rkMl5/v3FCmBAu390ouXT1bKzGmarNIwHsNEiFs9EhwKwBnER6WS475Eox?=
 =?us-ascii?Q?3mdy2PSlHBbW1wauEiQ9/JVJlQQ2t5JjwQXwoOO/PMWWjH7whWpeH2lfqcLl?=
 =?us-ascii?Q?n0jGXBL/155ZtikJvWbe59Xx21a9rdVmU+nFLmum4fB02SJhHArRnkDbKLvG?=
 =?us-ascii?Q?tWdnMl1lNRYaMw0jFnhYTQYfnnt6kzdMO8pcQyJRue5r5tbs1DKDNqiTJRTB?=
 =?us-ascii?Q?vMjuM1jUToM/dhgqqdtwAQN6bPdR7m8HTTuLBbxF0FTeKpvKkDAtoTtG73gC?=
 =?us-ascii?Q?O4DIc08jkFpG3JGgKWEuCqFebTWdALRhH6e5GX9hJdBU3YoAicD8akRpzaFw?=
 =?us-ascii?Q?f8kZHL3C5m4lKMKWnem3c8Iyef8RpdQwRaIdR3wcyUoiKdDFm+YXe0VUrY90?=
 =?us-ascii?Q?Adq9xvcomoHus6PS5DbZax8BCm3TSFCQWJsAo+XdBwB+tKqA/4BWPplaUbDs?=
 =?us-ascii?Q?Rfq3GmLBIQ9GQv8ZbuXU99Pu5lbP+WvOMTnW6f14jxxgeXt9SE9AITzCs2Dg?=
 =?us-ascii?Q?WV+vYf8QCbKowlghf47Zr0YIr5u9xRp6YobUiZjlHm8ZdIF9zH+Wv10Igs2Y?=
 =?us-ascii?Q?Ny02bYG7vj2nKLB+oYi+AGAJXwfBEqYyOHeFB2yH9H3RobxR+Z30quU2BLo6?=
 =?us-ascii?Q?1kzev9Vz3iYADPsi3NK3oGUYXm5edsZaM7N8GP7bti2KjEL/xTMESbXouaoc?=
 =?us-ascii?Q?lKOw02XRDlp5ZCkLpxwhXYYeczlTiiOilvycYCwJMTWDbuDyMnYlEOf8e3CA?=
 =?us-ascii?Q?OfDkBUH7X8oPuSBaGwnK/eJdsIcKclawesz/+hmMrxc4gPVZXGHirn8UftIQ?=
 =?us-ascii?Q?ysB+Nb4OBIaf3Q/HcV8UuB3up51ZeUzqaNRni76nvu/NFeP//j4b5rJJ69+R?=
 =?us-ascii?Q?QLU1QRgmEuhU4MpoQP0GbL3ja7m3F2VLfMgkWMpQ7a31LhIZVBVEhVB6/B00?=
 =?us-ascii?Q?P9PuPo/y2NL2dBa6uzYACUFbgexCNzZHd5RfTqvWJQyE0yqH7PowA1WQxAuI?=
 =?us-ascii?Q?R4BXE4fklmNcVm/PLgRe//nal7MKkXwTI2XzTOwjAYr4+NyhrT9xSGzFGQ8h?=
 =?us-ascii?Q?NbBhForRXKs0ETaNz6ahTFFVHwiikjqM3tKrhcQ8Qxfn8HNa06ovoHx3NR9G?=
 =?us-ascii?Q?0BkMhpWV0cgPx3lBhNdxJa49UEmZTUL3eyJoYWDts6bqG09RhZCIYthlHsr6?=
 =?us-ascii?Q?Fing6qq5mHD1HkDnFN2BLAQlRAZNN3sB76jBttO/4DtvgmCZosTrvu5xd9EX?=
 =?us-ascii?Q?M2k/7C93Wi4BJTgfqD8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5bb8ae-3b72-4810-a1e8-08ddbd592a25
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 13:21:21.3046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CBk+XUypOkAhZBd/hwxQ5YO/Z4LnXylFg39OXOSgdc5uHHJWlU7FmiKEAFI/Xfzi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9819
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 13:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118285

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of wangmy via
> lists.openembedded.org
> Sent: den 7 juli 2025 11:06
> To: openembedded-devel@lists.openembedded.org
> Cc: Wang Mingyu <wangmy@fujitsu.com>
> Subject: [oe] [meta-oe] [PATCH 08/35] jq: upgrade 1.8.0 -> 1.8.1
>=20
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> License-ppdate: Add LICENSE notice of NetBSD's strptime() to COPYING

License-ppdate -> License-Update

Also, doesn't this require an update to LICENSE?

//Peter

>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-devtools/jq/{jq_1.8.0.bb =3D> jq_1.8.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/jq/{jq_1.8.0.bb =3D> jq_1.8.1.bb} (91%)
>=20
> diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.0.bb b/meta-oe/recipes-
> devtools/jq/jq_1.8.1.bb
> similarity index 91%
> rename from meta-oe/recipes-devtools/jq/jq_1.8.0.bb
> rename to meta-oe/recipes-devtools/jq/jq_1.8.1.bb
> index 4aaf27da9a..fca4d18a57 100644
> --- a/meta-oe/recipes-devtools/jq/jq_1.8.0.bb
> +++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
> @@ -6,13 +6,13 @@ HOMEPAGE =3D "https://jqlang.github.io/jq/"
>  BUGTRACKER =3D "https://github.com/jqlang/jq/issues"
>  SECTION =3D "utils"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D08ffb5ac7e7e6bfc66968b89f01f5=
12a"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcf7fcb0a1def4a7ad62c028f7d0dc=
a47"
>=20
>  GITHUB_BASE_URI =3D "https://github.com/jqlang/${BPN}/releases/"
>  SRC_URI =3D "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.g=
z \
>      file://run-ptest \
>      "
> -SRC_URI[sha256sum] =3D
> "91811577f91d9a6195ff50c2bffec9b72c8429dc05ec3ea022fd95c06d2b319c"
> +SRC_URI[sha256sum] =3D
> "2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc208a311dc33ca837eb0"
>=20
>  inherit autotools github-releases ptest
>=20
> --
> 2.43.0


