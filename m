Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1CDD116F1
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 00:23:20 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6505.1764634990509464486
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 16:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=E3zn0uj6;
 spf=pass (domain: axis.com, ip: 52.101.84.67, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zR3Qp7qSrxl1NrBwTSe9+9utR44sT4d43axXmTXERizdQd2+1p2yV0Em8knCmEQewDKRzqi7lh84Ezty0ugFgZ0PuGo1jhZS+jp0wixXrOAoKQKuxTolwGEK5l3+k2cRxC/ObqJfpgdYVF6Aa1otRf+CbBkYdyHd4xnkqfRbyzb3XcHwKqpOKreCpzYA2jFyZAZFUq5BjBUEte9CEsAfvjYb0iK92Y27IcGfqH7iOTMiol+I6WNbdpybsstn63YRPc6xAHT3N6ajZYnO69kZ9XV1/72h9QwRkBSiqOkZIbtpqEbWCtHXwjMcWefdFP+wJtgQOjbU5gSAhYqCeTTIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCc0sQOYjpMGb+g0deYRFsM4Y73kT1D2smUHkbHOkgk=;
 b=FnajV97x1UmwROxhF9MKqlcGM+ziaLfjXF+fO/tVE8CdupHkPnjt0gywTasArf45lLSaYxNh/AOlSLclyC5NC9G1oJ8ZLEXk/ZVVPUlouu6oyz5d2nARcl3F7e2f2uQJS3JRXBI5bbqVrAUlnQYZR89MWhn7D7LfDyPVJr9YyfrKSxXU5ZAQK9ugdBEyafzRx4HZA819jHxByBDW+ATXKr9ggdbMEu6WIqNynBvm2gvY9hRr+YYA/N+Ufa6TDxRYapzHxz2atMFP2C9oGGTGZbSJQ110xPeTolrA1Onq1i2/6/KKWYQcqYb6ZNRGDoSyJZNzXI5SGb3y2GVLQXeHzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCc0sQOYjpMGb+g0deYRFsM4Y73kT1D2smUHkbHOkgk=;
 b=E3zn0uj6Qr8Qu5IVWwzcwBqDqKNSZVd7LxiH6XexSl5dtuXST73p3cELVhauTha9R8XqzJF4DExCnBVxQupSCzVvtROL0DuD6nUpjdkRVXAU2x02oTlOcWee6qpprrNE7AMNLTbIL3P0YPgePVVx8EnXtPE3j5ww5M6pVDrichA=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI1PR02MB5838.eurprd02.prod.outlook.com (2603:10a6:803:130::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 00:23:06 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 00:23:06 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "alperyasinak1@gmail.com" <alperyasinak1@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] proj: Fix do_package QA issue for unshipped
 bash-completion files
Thread-Topic: [oe] [meta-oe][PATCH] proj: Fix do_package QA issue for
 unshipped bash-completion files
Thread-Index: AQHcYJ4VXCpth8/M1kaSHJ+xi0BHtLUNggHQ
Date: Tue, 2 Dec 2025 00:23:05 +0000
Message-ID: 
 <DB5PR02MB1021376757CFA9B4D65FF2F90EFD8A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251128193425.1104585-1-alperyasinak1@gmail.com>
In-Reply-To: <20251128193425.1104585-1-alperyasinak1@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB5838:EE_
x-ms-office365-filtering-correlation-id: 6ceb71ea-a088-4943-9e04-08de3138f6b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?qYIo+GYHF6RxcgNccoEbGatqnft3uHRLiSnq09/F2Ys+GlmKCSnD8lfsm2an?=
 =?us-ascii?Q?zwMDB7Xtky5rS07KnMhzQPR4aY3dcBj+bB1sTr639EwMwrxclDKsg5f9WyXL?=
 =?us-ascii?Q?TsjWZT+5x46awbuX5SDXd0vCS1xoq/cINlJu26YjN5nb1i/dFLYwzt7Z2i82?=
 =?us-ascii?Q?6GlTmnkGIyny7gQM7PwyB/J8Fqe34fQya6oX+bU3IT06aHqqoBRtqFinK+j5?=
 =?us-ascii?Q?ARM9nyfftntrAnNhPU7v/kgZN0MObdbPwMUs5SuAsdGv7cCw+X6BpGl7r9nT?=
 =?us-ascii?Q?dVnkwoLazd3ucuwQRA0agtSRq+4UwZhxy82ji0v75yVL9Muzl9SzIDlYlRTr?=
 =?us-ascii?Q?7vTJRWrkIFuVEEjN+dAOpyW3NPdR9ahOZLm7Vz0R3X8SJ4hBv5+4JGjyUiwi?=
 =?us-ascii?Q?8jNOeLCUCtugirDOkhSIzAqOLa05bIBg8B/HeU/s3IgimZt+yygFA9NbKGYW?=
 =?us-ascii?Q?jjuKwH7IOK5wg4i7MMhsCsJsXXEeoU2yV6OjKz4br4uLSMp4uR9z6fIpwfcF?=
 =?us-ascii?Q?YMdnN9kDS2oH2PsWgpqmVHcu+VhITXV6xLVZCunni4CJeAVFBC1RpGgoWvw7?=
 =?us-ascii?Q?JqOOF27/bGZVmSJv2e/1MnzqQjoMcZ2H3LWaf2e9sih14QBZx9AcrMd3D1Hu?=
 =?us-ascii?Q?3ujlSWEU0JQA8x8UfeaD1qbcfBNTkiG7T7qUmZ7Kud2/feSV4LGYsQuEKc2r?=
 =?us-ascii?Q?fvRGy2LflP2ZByVIBQLZ4ex3kn+HSjbGDNJoEBMi/zBFaLw6v3+JIN6iz6iM?=
 =?us-ascii?Q?oK5r+BXWWYSUGvxyEmonjJm0PKecdUe1q4bJGpJmNc+lBpYEHXTKradIB05r?=
 =?us-ascii?Q?NXhdFt3j1RFMTQBV+ZglRarGDmmQOd0ra02GbKRkUhFx3um2CbhG3zwzwPA4?=
 =?us-ascii?Q?2annwY2Qkkqiq9x/2hUrLMMV8tQDfOkEd4/1V1M90u8Dw0QhNA4I5r98K9fn?=
 =?us-ascii?Q?Q3P+51TPjwxJCkq/xGEjfoXpvAWSX2wFOS6xeB65C5xRIA6sPs68TnSx++qw?=
 =?us-ascii?Q?lHZAAoOx3iUgaicLG1p2klb7iYePbV6E2+qQ3x+z6msHkJkG2FP+0ifiCCZP?=
 =?us-ascii?Q?hjeQGXElSNazOXuGtG7/qNkVhj0CI7yk1VMJPwx4eCDMw8mthatA1CxC8MTW?=
 =?us-ascii?Q?o+Y4n9G5WaDgzvRByy5uaL1wVNrPBt/Wj0jAD76EXhEsqXguikD383Z877/F?=
 =?us-ascii?Q?OHCajqxGWXuAJ4WkjQMnFMBJ1QDPPAniOnR3I7jsOW/FQTbgVGA93qQUh85w?=
 =?us-ascii?Q?GdH/P/rhzWCepGEEnkzpYoaXApBxoYr1qbmCcmTAA2SJ4Zk6IC+rkyfBY5sr?=
 =?us-ascii?Q?9fpqa5XG+XfLkOElohIuPRXFULIhO7DXPBORrr/PZsZSHIqLUl/HzUad4sVM?=
 =?us-ascii?Q?jHlvlMDtzU95/wt3eg6CIQw5NfoFWxGqjhCVIkxNRE7L79vuVoZAaYdu11bD?=
 =?us-ascii?Q?pHA6pzd0Y/tZu9rtLT1iUm1xdDteXe7s40AHXWofvY95mcCfNFUlRK0SShd2?=
 =?us-ascii?Q?l9Hz8D1kngSuAN/2YcN4IE80d6IIwJbT+t4W?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?cQip5KMa/hQzrNEbrQX6z+vCATVO5z1i9oqJQVUvkUW99xai7HtrXdh4nBc8?=
 =?us-ascii?Q?R2q0SD/kKINnnuie0SE3zxLVP7PkFNDOyzi7vRQV1Hyj9qGR/vLh3fAqY2Av?=
 =?us-ascii?Q?81STILVODrd9QvBTiY5g0XuewigCR8DkDuB/iAwtaNQ0NGUH7O9W+lk1fOWJ?=
 =?us-ascii?Q?1ykaQkCn3/EqND75GPgraUdRGGp/E6j0htX0r8xsiLBBUg0V1FfEiN7W4XYm?=
 =?us-ascii?Q?kptLnAP0bC8rLBGFZ+l77TT/ORlyG2ntSrvzzMnQFwzBqxXRfc2YMi/sxbCU?=
 =?us-ascii?Q?8cw4XBmFc3K2UZ83DoaFAk8iCK8AIj0zRpJqk4c9g+58FsnqSaxukCHiB8MZ?=
 =?us-ascii?Q?MSCqS5CW/SXyes37P9t+HuyqurkDOeUU+cN+ggb5CZbCls7E7L3tSssfbq2x?=
 =?us-ascii?Q?WBqOsAc8xrdPXNl+3mLfzaUQKzPg+9DqJoQzcYDs8MwGLp+r9fXYx5wuiU+h?=
 =?us-ascii?Q?Gswd79f8vQZ/+pHwe5YfIXIsGLr8MbocBcSjcthMp874UAax44UP6PtAyBnr?=
 =?us-ascii?Q?zFz+lq0vslegJhnXoqr7p9XSKrXZlv9DFoiqk6oLzJjCiQABtQFq9BsjG92W?=
 =?us-ascii?Q?7+PrnWMl+ug9jRL6pqz5x8N1YouHZ5gNOPVCM2h0zTUlNLI64DMq7x/2thOH?=
 =?us-ascii?Q?aG7kZ6dCvraMRlZupaKgT1KAVauVRPZC7DWdH4iepNyokbsjoJpwclFWeSgQ?=
 =?us-ascii?Q?RkeoOGrNRTdMKD9Cw2MbxsD9FuW6YnSqgXa79wWgMuCAgVycZOBqUXMeH5l/?=
 =?us-ascii?Q?LWbs9I+bVVLDI2tqSkoMh4+LnaNbGzQyr+SR7lidIr5ssY4yxJDDw9FR1hAu?=
 =?us-ascii?Q?un1EuRX8rmYRP4BJKlQ/w9eel1WqnbPO/8roVgkGOCRxsUFzeLZ3Kh+wZ3Y2?=
 =?us-ascii?Q?ElpNPf++dBl0buTjGW+TAk0KhHb9r9zyUlgK+ixmRlVoaCDKi+W0IZBeN4gu?=
 =?us-ascii?Q?89wBh0jrIpFG/ZlQ3YD2aTcCZA/jk9DY972ZxZ9zIqOtIYtwa9YjgTPpeELj?=
 =?us-ascii?Q?SJ/Hw8ZuHeCUV9ZMD/dLpDvYVb+PNkUCOK5qQ0of98bZ4icc0Hzh1zqZNkwd?=
 =?us-ascii?Q?l+D3/eyruXZtW0O9p5JVdVkLEiYKDH8G6xOFxuxBG+TOX3Jr11ROY7ruC+xW?=
 =?us-ascii?Q?X/9jo5aKig7UHQnCu7vPtUBXmbg4du/zcUp4YEtm/tkLLzOBVwSuNIvgRRTN?=
 =?us-ascii?Q?YJVivPYaUpAzJzt3KzQvumAqW/P2F2HNior88I9nel0ZmYKylQFJZiJTXNPx?=
 =?us-ascii?Q?/R8i2QMier1Dr0NF8BL4bp7sE01TZZbcvnIiu99YMtY1Xr3Bnm2WOIR6I0zp?=
 =?us-ascii?Q?SGU8v3plxLh72bNxHj6N0GIvBU2SuCDgAq8COVadd5p9zuK6aBAxGU7bRZsG?=
 =?us-ascii?Q?rnRr+xbZfnZ7/GNk4HVP/BN6LOvmbWyG18rUJ2NO3tgjZggDb2uuJIBhoCL6?=
 =?us-ascii?Q?vPhe/f402iEc3dd/Cbc/qrYxsgt0ZMAH+WQoy3J2/bbc5VQ6bWsghR8z4qJw?=
 =?us-ascii?Q?RjCMcC1cli1FCiFoz5RwqSLRGiR3ikDebQtJBq5D/OyqSdxbMi1nIFzWSA?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ceb71ea-a088-4943-9e04-08de3138f6b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 00:23:05.9703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MKtgSfnjpX7EraBO2F4sURf0zzqfnLSISiz+BkaWVjUsELtfGJcGhpdkkFk7YLV4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5838
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 00:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122223

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Alper Ak via lists.openembedded.org
> Sent: den 28 november 2025 20:34
> To: openembedded-devel@lists.openembedded.org
> Cc: Alper Ak <alperyasinak1@gmail.com>
> Subject: [oe] [meta-oe][PATCH] proj: Fix do_package QA issue for unshippe=
d bash-completion files
>=20
> Add bash-completion directory to FILES to resolve the installed-vs-shippe=
d QA error.
>=20
> Fix:
>=20
> ERROR: proj-9.7.0-r0 do_package: QA Issue: proj: Files/directories were i=
nstalled but not shipped in any package:
>   /usr/share/bash-completion
>   /usr/share/bash-completion/completions
>   /usr/share/bash-completion/completions/projinfo
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
> proj: 3 installed and not shipped files. [installed-vs-shipped]
> ERROR: proj-9.7.0-r0 do_package: Fatal QA errors were found, failing task=
.
>=20
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  meta-oe/recipes-navigation/proj/proj_9.7.0.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-navigation/proj/proj_9.7.0.bb b/meta-oe/reci=
pes-navigation/proj/proj_9.7.0.bb
> index 2a41f1ec52..eb9fe46f30 100644
> --- a/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
> +++ b/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
> @@ -12,7 +12,9 @@ inherit bash-completion cmake lib_package pkgconfig
>=20
>  EXTRA_OECMAKE =3D "-DBUILD_TESTING=3DOFF"
>=20
> -FILES:${PN} +=3D "${datadir}/proj"
> +FILES:${PN} +=3D " \
> +	${datadir}/proj \
> +	${datadir}/bash-completion"
>=20
>  BBCLASSEXTEND =3D "native"
>=20
> --
> 2.43.0

Please inherit the bash-completion bbclass instead.

//Peter


