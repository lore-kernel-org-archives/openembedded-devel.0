Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE341CCD1A5
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 19:38:23 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.29])
 by mx.groups.io with SMTP id smtpd.web10.1310.1760989099146073490
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 12:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=rd/OFI98;
 spf=pass (domain: axis.com, ip: 52.101.69.29, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zL3As1ojaNqYs1uXfNC8/GjY8DMBzENMm0jfwDDa94t/A0zmJyDJEAV9Bt6CBtRHWmDh11xUSp7w20tNizLW4ILw6WQdHpHyUZ+eniaca+IuCYFIrvG578msxQAhYDGRXF3xAsQvgrl+qab2n9AzrZxedaGqT84Ohl5/wla4E4wYY/RYEgXVdgl289TWqO/4lkhLIekvN+K2J28m1zpKfccqVV2+ACowGZNlxWxAUJubH0Vtec8+mjHr/O8YTtj/w+IpDL91sYghgQwXD5OgoQI5rQh0wqbusU6W/Koazj3UBzvvnwURL5/j1jzHWFbM0fral8oFr2nZ2kJI8pvXmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLvl6id/V+h+MDn1FP76dFWTlqJ7R8eVD1Bn7SDcAKg=;
 b=xkX0Kux7dlcYIc8cQ2B6yTdVkMmK7+PkGHaNcykoQIJkeDtx9ExOKbwuMFw+p1QO7eapZFztf2BPVxhdJAESZjCrlSWdsx/YnUuH0B9eKDvI25ljeV44Wgwhq/MF6zq4o5J8BGdaRl5LS9AfHqLf4K0rGnEODvVx6CA6P7H18ISPKVL5HsmlFE/shkxzX2fXVmQqUW2VxKuH+jxYh9rHjnVSW9DhxxX3cWthC8b8+azhCU7UxtxKpPBYRSgsKAepoXX19vjz782t4fui1ifNXKQHY8RQSnSs5DbhdTRugGGi29jgcfdMn/JPO6mm92wCEOyKI5FNebvCjrZJwckB0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLvl6id/V+h+MDn1FP76dFWTlqJ7R8eVD1Bn7SDcAKg=;
 b=rd/OFI98iwL8Z778WFWKN0dpyh5EIkMwZjK+XJS3Bwnpz3cbOj+TP9/pheoeks/Mckm+TdzkbTuUuKl+eQI65efyUctP1S6nrjyGZkkuX4g751Y71Iu6WQkN8vJ7mDFOJa3RvwMPUj/TZWu9P3l33KqcZvPOFhlQFhOjyYTAhWY=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM7PR02MB6306.eurprd02.prod.outlook.com (2603:10a6:20b:1c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 19:38:08 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 19:38:08 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [meta-oe][PATCH 2/2] cryptsetup: extend licenses with Apache and
 CC
Thread-Topic: [meta-oe][PATCH 2/2] cryptsetup: extend licenses with Apache and
 CC
Thread-Index: AQHcQetrB+WS5EixCk+kfw79Yp4FMbTLbIaA
Date: Mon, 20 Oct 2025 19:38:08 +0000
Message-ID: 
 <DB5PR02MB10213BD36DCCF1B79BE13FBA1EFF5A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251020180022.3398560-1-skandigraun@gmail.com>
 <20251020180022.3398560-2-skandigraun@gmail.com>
In-Reply-To: <20251020180022.3398560-2-skandigraun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM7PR02MB6306:EE_
x-ms-office365-filtering-correlation-id: 9c890a43-418b-4625-f144-08de10103297
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?iE37e0Wbt2NFetAEuViNIaN/GwEKusxAF9rAIsseOQByBAvJdOswLiALctue?=
 =?us-ascii?Q?mDMHmhKc7ONtJm4m3G8WRR+Ej+QpfE6nLbiL8CWBsoJKa9yLzreURGK/5Myj?=
 =?us-ascii?Q?TwiKg5LJE4BWEsyORGd/iVA5izkeEW43WWbqSP1+wlNdsNb1EWPwVD9g57Zq?=
 =?us-ascii?Q?kyOpIDKzJwR4/Ok7PTwWJ2kv8R/sz8kTFgR0CSPB0OMRSCKi+BF1Rg9qPR4e?=
 =?us-ascii?Q?tx5NOzcNbAe70Gi8uo9DLhD2XDgjNuIdMl2eGYUVpMyYHkoa0aUVxtaR5CIa?=
 =?us-ascii?Q?ac/TX7G+aO/dhBCArsWBx0BFg4DN8kdWEeQYbmoqlpFeewAVMM7qKQL2loGM?=
 =?us-ascii?Q?TZ2gjZDPck96Tnf5Ssp64uY/fBLrerys0bueZ3Z5dkllSEQcyJhJSuy837Qf?=
 =?us-ascii?Q?N2ZPbWSinchTqB+eWHLnZo93lkFTuqs0IFZC/k/YGplpzCKt7b58SasZDpbc?=
 =?us-ascii?Q?cj2XCj5q/5W8r41B74p3Kl+8oGGNhq8dTEBQqH44efpGBa+/rhmsnBhw5CAo?=
 =?us-ascii?Q?T06IXlof6+U7vagJzBN5X1LH2rMCjTSh/jNFK70cSEczUHfffSrbqQQ9XPhl?=
 =?us-ascii?Q?AENhYNqkdRGDj8gYObRQglAiBWgoc8X3Ley+5aWArft0GTvWv4txOKD9Ma6y?=
 =?us-ascii?Q?swPj6RwDnQCn6LEYt/SafcZc+LTHJY6golOSHwynA6TqKp7Q/VXqfZS9lQFz?=
 =?us-ascii?Q?jKEelnuIz6UWn4aUbok4EEPTdYgPzl7C0MnSbNQyLeLFthXoKo6H3hpMARHE?=
 =?us-ascii?Q?NQphDC5ZpRzdN2D8YI6tu992obJ6e8I8rpHrFi3BaXakBgDYjboFPHq577qE?=
 =?us-ascii?Q?ZLzCDR4y4E7io1lQnrwYs2cSx5n7WRfE1kpmsN2OvLjLE24oNHutlgnTXQl4?=
 =?us-ascii?Q?PdXUb6gSA6ZPlE8ELRRWdPlatrTLrUK3ZsDnRVRf/3BLhOxa1SCZwt3Be9mS?=
 =?us-ascii?Q?xtsV+oA344CUiMl81GKY0UygKrrU8bmLAU7ZrXhb09yHemX10g6dgzpfXin8?=
 =?us-ascii?Q?UxD8b6RRR676qIZbU+xAYWhegVaKVTPTcRuIr6Kv2ClnauBcfSq4nuuypZGc?=
 =?us-ascii?Q?3ANQ08YhxP8qN3BQUIagVCAdZ4Y6UXCrVFp5cXVkch1QIdcSgdx+7hBnaDgb?=
 =?us-ascii?Q?Yb3yusz+0MLX91ydKFatlhyoKj2EKDRBv7KgJqV5c/ivuiOgS+oRohJ1GYE6?=
 =?us-ascii?Q?AjT0UvzzLAr5UpYeriJ5j6YPXatmticLn2lii3i6EmOfa5C4f0EWy8to6hui?=
 =?us-ascii?Q?gOEIdEmpwtsUcj5T8Sw1S96qelWle/+6pBVNCiTUnF3nxOkSMt7zv+PIJ6xU?=
 =?us-ascii?Q?qv60P8HZCeI4actE/1S0gQtVbCH8nHv9wAmNgEUcv69vAtua4OSyVXCXjjVC?=
 =?us-ascii?Q?W0sQTSUmsQpchS0fiiH7ChH34L3v2OeLrS65a4ThGRCR4gOVpBFfVSemna+O?=
 =?us-ascii?Q?vtBO/ui1J2snaXQh6nH1fkUkuI5nudTrBzcEcs6YJg5P0YI9y8HJqIzPp3pT?=
 =?us-ascii?Q?ee8Sz/saJ7RsbUKQas+P0lxE5RJrRDAw5eF6?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?F+OLd3pU1I5GmbEKnr027kpOVhTN09+/P4Mr1zv2g0SfPAItIU9fzTNywVaN?=
 =?us-ascii?Q?7LtSvUbuVLtC+8BTPdXF+MRr8wumqUs0K25wPw5+OmXuX69J2og3UxTQLX7j?=
 =?us-ascii?Q?bdVF3J3qjaeYOgtosg7C9ne+HCsgvbnUYuXJ3/WUOxNCy0oK/8/Xm+lRj5k0?=
 =?us-ascii?Q?sje3LZ7r6z1oDugRfjVqDGnG9rG1GNJpZEO8fOpSj9jzpn4Ca5q+s7CjLOi1?=
 =?us-ascii?Q?wWk55CWbASUhGFJmwuTBbWgiNyqVBPGVsbiKMPqdbdUgOuH69ySHdo8SpHgX?=
 =?us-ascii?Q?Ph7KdLciuxmguMrNt9xGbkvmwV2rt8emBjmcOj1NBNJ9GDny9q0evKrL08JS?=
 =?us-ascii?Q?zmkJj5TtNbVkOTyAhOuNoA50T15fxZSoLQt/2APgHfy1ls3j8+xPNnZi9xGF?=
 =?us-ascii?Q?Q6WHPNAV99pXZKBrwnj1Z/CSgE2j7E8LLWQQ3UQhlEDWDFQ8Ob/wGERXa8mK?=
 =?us-ascii?Q?BZDEljAEuHdBhIgpMN4HJqRGeb+oDO4wIwPAM388DiyDZajILar55/JDXGpS?=
 =?us-ascii?Q?6gijh2o8iteq2B/Kay17o0yhOg8X+BgrhJ3/v96SegclUOC5n2UfoZWc6oOb?=
 =?us-ascii?Q?A8WWK83us+vJ6bk5tTKXAWcuitp4vSvpfIQkHxlT026SpRDEGlIG/a7KH7nP?=
 =?us-ascii?Q?GVQBDZV5aaQxQrzMFN4E8u4+ZOj/eq2kGrNK4m/QYr4vZ3mUvfgqACqros0B?=
 =?us-ascii?Q?C3K4gYCKsgi9fLBRbfBtDEzSOYLyrs6xwylIM1zS1xrxpUnJV7im23uGX2yc?=
 =?us-ascii?Q?JFX+nlQEyZ+fTGTpAQQKqh8/jCNwM4Q1IG8HmovpIGWIRYUa13s2O4n44xxV?=
 =?us-ascii?Q?2mww6nmZ6I2kwIVjNfx2sG+uhbUC1njBuvlzl5xgTEYBF5P58O6WJ/MS9Gtm?=
 =?us-ascii?Q?XyTb7XWILWmfR1WeSoFDdxEyUu+fqoOeowheCtlq1AhOrLD/lKjS9BiRkKRa?=
 =?us-ascii?Q?7YghHJZg2HSp/53q7zoY/uiWwBFMOP3bxVzT8JM1+XCI4RIeVZKji86aCo/z?=
 =?us-ascii?Q?zPqhLJtAjdhQ7lA5DPu9OlnPoG9lg/VxZYNWuBWq1UkWse7XRYUBSqOIzjCX?=
 =?us-ascii?Q?jaqCu9+s/JSSl4t0N4RJAt/vp5GKpzK5oy9kTprAZV1LuBz0cm6RyoU+30tF?=
 =?us-ascii?Q?pyhE8upiTWmeTzdAvf8Uy5+Bk02rXEZhyRnEmNliKjd4jh9cHE1Uo8h4H5/g?=
 =?us-ascii?Q?KYK8oc9xkmJwYAWxoYC1Zo0P663xFapKm2XRaMvAkgzGAxEa1+S3Qib5Yf/N?=
 =?us-ascii?Q?8qaXIdYb2L6EXaXY8yrN78jGvdiwFTevlQnxQrZstjnz+B80sTWnu+1aXfIb?=
 =?us-ascii?Q?+vImftASTAvrB+JF9SqJlT1zznfVjlnDLlgPAbZHmDyUMb3mY57fYccp030c?=
 =?us-ascii?Q?SF8dBdr3iZVG0xM0FsYLsD0vhaT7Gel63fMz9SjM523Njs/5knI/REKwhHPS?=
 =?us-ascii?Q?QWd2DC0hf5SD7U2+AfSEPbfczzvHc1j2vRSsKqU5/GXoF3BXHUiYAu1zgoLP?=
 =?us-ascii?Q?qx3x2eYRfDovA52tmCO2Byc+tNX0GoBpb4R5A4jVxc8ZYyNgmbZKgvw9bA?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c890a43-418b-4625-f144-08de10103297
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 19:38:08.7006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Lr5zRTRBUFssgPMdYL+anMBY+bqJ8niPN+w4oFCW9/WQqgwUPqtJBa73tAH2Ijs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6306
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 19:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120821

> -----Original Message-----
> From: Gyorgy Sarvari <skandigraun@gmail.com>
> Sent: den 20 oktober 2025 20:00
> To: openembedded-devel@lists.openembedded.org
> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Subject: [meta-oe][PATCH 2/2] cryptsetup: extend licenses with Apache and=
 CC

Apache -> Apache-2.0
CC -> CC-BY-SA-4.0

>=20
> The project's readme indicates that some parts of the code is covered
> by Apache and CC licenses - add them to the RECIPE accordingly.
>=20
> Reported-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb b/meta=
-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
> index c297de053d..f2dc5d9b46 100644
> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
> @@ -6,8 +6,13 @@ and can hence offer more features than plain dm-crypt. O=
n the other \
>  hand, the header is visible and vulnerable to damage."
>  HOMEPAGE =3D "https://gitlab.com/cryptsetup/cryptsetup"
>  SECTION =3D "console"
> -LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL=
-exception"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D32107dd283b1dfeb66c9b3e6be312=
326"
> +LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL=
-exception & Apache-2.0 & CC-BY-SA-4.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D32107dd283b1dfeb66c9b3e6be312=
326 \
> +                    file://docs/licenses/COPYING.Apache-2.0;md5=3D3b83ef=
96387f14655fc854ddc3c6bd57 \
> +                    file://docs/licenses/COPYING.CC-BY-SA-4.0;md5=3Db296=
faaab9c17d5874fd17967df54736 \
> +                    file://docs/licenses/COPYING.GPL-2.0-or-later-WITH-c=
ryptsetup-OpenSSL-exception;md5=3D32107dd283b1dfeb66c9b3e6be312326 \
> +                    file://docs/licenses/COPYING.LGPL-2.1-or-later-WITH-=
cryptsetup-OpenSSL-exception;md5=3D1960515788100ce5f9c98ea78a65dc52 \
> +                    file://README.licensing;md5=3D45c1ba157f18d08991819f=
41f56d72e9"
>=20
>  DEPENDS =3D " \
>      json-c \

If you are going to include CC-BY-SA-4.0 in LICENSE, then you also need=20
to set LICENSE:<pkg> for all packages that this recipe produces. The=20
license is only used for the FAQ.md file, which does not affect the output=
=20
of any package.

//Peter


