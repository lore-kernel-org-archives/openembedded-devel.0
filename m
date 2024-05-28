Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BCAC25B74
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 02:53:39 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.50])
 by mx.groups.io with SMTP id smtpd.web10.13638.1716864808973323005
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 19:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=G41KOQoy;
 spf=pass (domain: axis.com, ip: 40.107.8.50, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8ZeabGq7p/FrdSZcEFDDCVuQ4R6yPpKswGgiEO0ehtWQM8Br+WngovpSwOQEgPxAr4ghea75u0jSy3H8gC5OuvHuxHsY1hCx91uQhvITKnZ/IiI3GEMbDTzt8kvuUsRDTra9MMR7vgSmroKPBBm7BTqQ37giZcovw0/xLjFTLy401UftyuHRYFMGi5Vr3GLrV50jkVcMatsU02JokoWrEbPZ/8zaI21e2jqQXiaqtK3h2egDOSg5FvXTRUkExMLsxO/NMUkJ1WMd/6FildtRivvgSB+W7V1+jFKRAbckMrJ3m3+Zr2NS4Ifd/NSPPal7puRDF6RzCBst4wtcfDeQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nD6isiDZnjQ7Mu/LjQY3e+H58bODlgJC8rViW1kw4Y4=;
 b=O5C0hUwDBUPQPD1ktkVsLvlU2LTENRM3hqFb+8Uh6bqRXEWxUfZqeQHekeqVEN6Ew0A6aO+JELNBnCbMgvlA31jHYwISwZvgtXst0+0pwIU+r+cs5PpDOnZE0xyGIDFngIl2UQI7xaEAaDIKLz7e5fpZtdptKaHaZZmIUWqtzjUWkMoiKsBwebp7W46Br7cIOyzuF6BUTdWnx/oTL9IKNLlTG+Z6CBYh3aT/w0wYPslqQuGK5PSDDBDiDHPtw4sCpswLP0A3VPOkq1CJjYVuSzeQK+vcMeW+KuLzU/i5Os2eWM79rQZir4KxAzWdsQeNF7Hm0ZzrYc1/DqHdjH4gog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nD6isiDZnjQ7Mu/LjQY3e+H58bODlgJC8rViW1kw4Y4=;
 b=G41KOQoy5NDbE4VBvG996YLcQvsVUacg+TyfvzuNLIY3mjikueyk+aAqg0bznKTUf5cNOxNqFGlRDnBccrhLwMQwYkZrzemNhkt2IROTDVtom0ioxw0uaOUuUPCHJfMGnvKLaaL3hC/WTnU3JgQz9KRXun1sVj/nMpkAkflLd4I=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB9790.eurprd02.prod.outlook.com (2603:10a6:20b:61d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.31; Tue, 28 May
 2024 02:53:23 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7611.016; Tue, 28 May 2024
 02:53:23 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH 09/40] libdevmapper: upgrade 2.03.22 ->
 2.03.24
Thread-Topic: [oe] [meta-oe] [PATCH 09/40] libdevmapper: upgrade 2.03.22 ->
 2.03.24
Thread-Index: AQHasKFI4+MxwtnCO06vTRuZxaaeIrGr8ofg
Date: Tue, 28 May 2024 02:53:23 +0000
Message-ID: 
 <DB5PR02MB10213DE423CD73656BEC16800EFF12@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
 <1716860901-863-9-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1716860901-863-9-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB9790:EE_
x-ms-office365-filtering-correlation-id: 6c9607e4-c2c3-4c3b-5ab4-08dc7ec156d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?L4ihdsU0a8M+nNrFHC4x3nxvg13h772R6dTwD69XDyqFfg1LNg7D3LUB0xNo?=
 =?us-ascii?Q?9zu4aszXmrltTWtgXhOYWPcQlw1zaYexfXldJoEbIPYKqIyC1BrM7L/VrYEC?=
 =?us-ascii?Q?louA9/yWYAPB2y3hKIWO0reJ0ssosIM1tVvsYpKCfWh32p+9p664CSXdvTbk?=
 =?us-ascii?Q?TgoYGB4LBRTTi3lPNQBy8QsvyVSRXoemr/Vu/S9asTpr+rnHG+c53EP/HTe7?=
 =?us-ascii?Q?G2h0A5gLY7CEaU3gvsFmJQKUpt899Nj6YJEsE/Ashwqrub77QAjBrQJJlKc/?=
 =?us-ascii?Q?RiZPbEjbOV3+1w+vFV90UqMXFeQ7hlg83nPySHRZZs6D4qlliEfW3dwKGZ1a?=
 =?us-ascii?Q?0Y+E4/k2VCrITuxe02mPc1aSHKjIeAZc52IrjzgPe+j5MjbGGirhyoifdsbL?=
 =?us-ascii?Q?6r9c1V3mRqDQ+R69SpsxqqEh+AMByd3dVTpxDAXiaPSrkspdqY91ApwZkLkU?=
 =?us-ascii?Q?g4drRtH9K+dcYVABdCtOcLOEAUzhwqThKro+QsYCKQcYTLOZCa+q29jGczFq?=
 =?us-ascii?Q?ts+QhXJRlSIKknAirtvVt2xkHdFSvFFjGJXzFpfshI4GKTeK6WMxzQkgmYbY?=
 =?us-ascii?Q?Pwe7zJgmMBbferpuSonPdhZ3umx3GHXCY5t80IkfP4pxn2U7TcLSq53DrRRH?=
 =?us-ascii?Q?iqcgYS/7Duh4/e4Na5zGe/IlPGtj+3gB7sNAZClMo3mC6JqWYH9SENyGeUFj?=
 =?us-ascii?Q?OlkH26eJTgOzLBFe0kQ2A3oxfZO6uJfTQiwi2BBRGcunDgAGNvhcapLhTYuB?=
 =?us-ascii?Q?rZl4iw9Yh94V8piY4CgT3075fXReD0x55ZSM8XX2fa0/cLND/5F5wA9KDAaZ?=
 =?us-ascii?Q?LjRLUm4h5DN30KILmSnKUThbVjlxhIcoPM2s2qTzoC1jlGevvgPjJw8mAWzL?=
 =?us-ascii?Q?ma2LWGnVhLIsY5CctQXS+k1prjI979yyGXPMQZt4cGZdhWdV1qULvasF3C0F?=
 =?us-ascii?Q?5nQUiDRDhwTqrHnYbv4Rz2OOZtPnRusk/aYW3n3Or6HCL5etuVif9g1xH0ao?=
 =?us-ascii?Q?Jx8bO5whQw9IVIhyTfY1crAnpGur+JSD0n9uD+8VZScR0efgmNptQCDnMh4l?=
 =?us-ascii?Q?rkrhSuyLxRVBaMiHVI/GaXmHT0Z5X/d5cbhq2Um34mZpV2Qjf/vWCt3wiYws?=
 =?us-ascii?Q?mH4wtsyc7CvnW1srv7eFEXVSke2B3ejl89RoxhdyByOCK9kFVT6aoeUPn6qg?=
 =?us-ascii?Q?J4U/xTMDZqJm6M7oz+gmxUPBWi3AX75bVRVLpeww/dqtQ4wxKGJGF7WexQ1p?=
 =?us-ascii?Q?WMnqj58CYXPCkKHT53UYm6z8e26THsNFoOh4dCSgWTXgj9lA5kSrTNqWJvDg?=
 =?us-ascii?Q?0h4nf6Xv9u9aXnk0qZu6PJVtP0R8RxY7xZHJXNjGsV/6zQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?K5Fc+HTQ8jhdLGaJSQCjLmbOtLdILvMZ2EJ2h+a9zWRHKtwdjE1PyzX40A2K?=
 =?us-ascii?Q?/Cyf9khckjNRqLVManQnLKCejekL+1OBwTY8qAb+l+vMdZ7qQuSllwVogq/g?=
 =?us-ascii?Q?6rXupqAHUFQK00avFWNEGqw7XznpSXVYhUAVy0oogbZXjTzA/IgxlLNVUa+C?=
 =?us-ascii?Q?KWZcBojRxAKW6yfUX9J3QEqQv46zsyOdueeb/wz7Fna9YP+eGHBJ3iQnD9Gs?=
 =?us-ascii?Q?ziOyS8XMNa9PLBPfTpVmyq6bSJeXyL9f+CkvKyCBxB6jFEk/KtdgYBLr8BHR?=
 =?us-ascii?Q?egM6cEeNUTFarSSx1V9Xj3tpT9wIdqIbRB2fo+5xORg0MlzCp1+hG745BwIL?=
 =?us-ascii?Q?hHjWwffydC1G024rrkHF1FMAyKzfXSXkf2qwQLzvvq8j/hZRh6erdFnJ6p9L?=
 =?us-ascii?Q?NZGOD0kXjRkOdDDJUAujMBaucwKEATUOrMZo7NCcHiLiX/nFMngBCxxvyN5a?=
 =?us-ascii?Q?mke4aIyZNFdXqp6ca+aslrqiB9ug1H5oa2lseE2yjcAfaBGYhVR6oCzZEsxP?=
 =?us-ascii?Q?TCSc3ZA76ASzz6lRFwfYSfhAoYCsE4flFjUgxLtPb+RT8qaiYqKFNCcaXY7l?=
 =?us-ascii?Q?u8enzK7lI4rlEIuIQfk+BatJwLaxG1iWdf89qwd3uNcVUsC6KiaKeX+tT83+?=
 =?us-ascii?Q?PFUwpCxl69uLcYPHj6w5jWk4D1FmD6W9gZsM9DsU2xnTo6UWYkZc8JT+8rgR?=
 =?us-ascii?Q?qjvFYJJs3j7PQrrhgpKNRhUbbESDa2L/uqgDxvVjF17FBon8e7r2QabaKOqV?=
 =?us-ascii?Q?ROKf+N75tNkDBalryPHAxoYJz4UU3VQN7d1hfnLYyYRp35+fuCv9Dc1/DuhN?=
 =?us-ascii?Q?I7UBrWdfCAUUD+1pzALAPzMDdph0WZ7rMWgyS/N1dPPzL4yJ725ARUei1tRj?=
 =?us-ascii?Q?ztXaS4mbD1jDfG2um4g88c3rDTfcM2gqMkVZ/0SHIpbk5WC1CfuCANxzJPRr?=
 =?us-ascii?Q?V9RkX10HSi+6y+ipMr3O+2dnzVTq7yMR9T2+/cTp2AZg7jSFYoO1S1tDYPSS?=
 =?us-ascii?Q?MRHvHEu6JXVIBuSK7qgjchvhtjxHt897BlS7GhEZV6AUGcpgA/GQOCAr60O0?=
 =?us-ascii?Q?fmID2IFXUyK8mwDy9dcfxlvbNOw19Y+iVoGJ7wLYXlmMSBOKH2bnPQwt3krG?=
 =?us-ascii?Q?o/Ux1l0ar6HY2Hl5FB8aNlyF5ZWcOcuUeUTa8WBL8v3QBGoArsVay/NTSXjd?=
 =?us-ascii?Q?S1qL3+9dlhvF5AJLH42ALUe3UThxLxSf6xEadHc6nTxpNQK92KVFpmWauhlD?=
 =?us-ascii?Q?etLIy4KlnGAux0TlT4mIuBIY6b3DjfyiBypl9XNlwukijRQ5i+qAg8tE6WV5?=
 =?us-ascii?Q?xoI1rNQ6bPbjx3K2hnH1PHvZeMUKH7NQgBzunOQm/RVbaX1tSyng2yAypzpj?=
 =?us-ascii?Q?uhqj6s2RB36Q/oHQNJ29ulbqquo0PoNMW21BjWRX/9LnUq4GL9Xw5PUC0a+E?=
 =?us-ascii?Q?MWHRoMFMs4oLpcbd2/EYGc3YLs+yXJfF3AQ48R6Zlb2qGi44vd2tB1aU0BJg?=
 =?us-ascii?Q?/wHkLh0ICLQQJkRyQJSmNQvbE+aJrK8sQR58U3SeMP1OxSSaKL38fvNjpTj3?=
 =?us-ascii?Q?Q4F1xAduI7F3nFgAYJs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9607e4-c2c3-4c3b-5ab4-08dc7ec156d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 02:53:23.0198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n2Xd7EO1m4jjlZAzI126gcwDfp8mwBntdk4YjEjHaj3SwH5SuyQA1STbVUepJOEB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9790
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 02:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110576

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of wangmy via
> lists.openembedded.org
> Sent: den 28 maj 2024 03:48
> To: openembedded-devel@lists.openembedded.org
> Cc: Wang Mingyu <wangmy@fujitsu.com>
> Subject: [oe] [meta-oe] [PATCH 09/40] libdevmapper: upgrade 2.03.22 -> 2.=
03.24
>=20
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../lvm2/{libdevmapper_2.03.22.bb =3D> libdevmapper_2.03.24.bb}   | 0
>  meta-oe/recipes-support/lvm2/lvm2.inc                           | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/lvm2/{libdevmapper_2.03.22.bb =3D> libdev=
mapper_2.03.24.bb} (100%)
>=20
> diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb b/meta-=
oe/recipes-support/lvm2/libdevmapper_2.03.24.bb
> similarity index 100%
> rename from meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> rename to meta-oe/recipes-support/lvm2/libdevmapper_2.03.24.bb
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-supp=
ort/lvm2/lvm2.inc
> index d95366f97..0351eb6b3 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -19,7 +19,7 @@ SRC_URI =3D "git://sourceware.org/git/lvm2.git;branch=
=3Dmain \
>             file://0001-include-libgen.h-for-basename.patch \
>             "
>=20
> -SRCREV =3D "016e469caf856f1eb8dde39df0d1aa2e74225aed"
> +SRCREV =3D "90ec2cd92f6367c431dd8dae55d0cbe7e196734f"
>  S =3D "${WORKDIR}/git"
>=20
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\_\d+)+)"
> --
> 2.34.1

lvm2.inc is used by both lvm2 and libdevmapper so both recipes must be upda=
ted=20
at the same time.

//Peter


