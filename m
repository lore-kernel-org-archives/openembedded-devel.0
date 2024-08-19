Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53963C52D6F
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 15:33:38 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.40])
 by mx.groups.io with SMTP id smtpd.web11.213836.1724081616201422370
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Aug 2024 08:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=e7uXTEGS;
 spf=pass (domain: axis.com, ip: 40.107.20.40, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVYyyV9qiutppNskNbfj1qEhWOhbhGhFCwyT4ZTJ+myJ05/nmCqtU+eD/4LTiMYR8oZP/Wu6jV04c2o+3e6IEwmVdeuEAOmtBdypbnQVThyedeAU61yVxAmI5LfEKtAwMDWlhm0+Kniu2HNL5mjk4Ea7/IskFrx1Ds1bJMwxAu+aq8JvTmkb/BueIqD/KRCZbhXKcDP+waWoB68lVKSo+Wzxz2UaEXscv/mJDOf4/e4dq8i8Kbud5zMtMW7ytx+AMsQ4VWbX2AoyGMbbRNWMzMitRfhPTZoLjxsGSp1HE4I70eLleW6S7A0D93umBeVDapWNdb5GQGeWN82vXVoIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pif4oCs/SdhJpT11iAByaZw/Chu0HpvwbWam9Eng0fM=;
 b=e/rlDwhvaaqCBUyMxJe2ZwzgdW8OUggofzQPy+yTqWKx1vy0gUp854+heplkQ0NQ4h9plrgiSiuO/rvMz+tW7kLgouWGybpDV10s7Bh2zIUO2uzi/DZtu2wrIFY58vchOGEY452KIYvx/CFKilzoo5+TuW2KmMoG5avsBm9VALI4FUvPzwlnGUloJcQWJXfne+XiUS52Rb0XMm5uPMOKVuhf8pQhk+gNHJspk5PpKTwPerOHzCeBLfMYhuGQCNxwOsp5f3rcASFZyIoq1wjdJAuPzOHW8piky1z25XmQDAsBE6MMJFxSGeTIr/ghsDUjflLIAVsXM8Z4SqwPz7RvVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pif4oCs/SdhJpT11iAByaZw/Chu0HpvwbWam9Eng0fM=;
 b=e7uXTEGScI6xqc+XVw34f4i3Zirft8WgpUNo3//boYOtXbDPQiJWRBTnB5eo12Z/BrMgcG/g74+ZO16ydFoehEyn+fHoT//AzQxUhcm2hZwlL8fObQiOE6lXLd9dso0rS3Yr0a5x+nEYGj00m1AFtSHQwHCT3LKXIvyjomM9dD0=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM7PR02MB5896.eurprd02.prod.outlook.com (2603:10a6:20b:10c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 15:33:32 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 15:33:32 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][PATCH 2/5] fwknop: Specify target
 locations of gpg and wget
Thread-Topic: [oe] [meta-networking][PATCH 2/5] fwknop: Specify target
 locations of gpg and wget
Thread-Index: AQHa8cHgfHDRtKEYTkyNKSogAcg48rIutc9w
Date: Mon, 19 Aug 2024 15:33:32 +0000
Message-ID: 
 <DB5PR02MB10213E8A744BD7731C1DD7591EF8C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240818225620.2226473-1-raj.khem@gmail.com>
 <20240818225620.2226473-2-raj.khem@gmail.com>
In-Reply-To: <20240818225620.2226473-2-raj.khem@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM7PR02MB5896:EE_
x-ms-office365-filtering-correlation-id: 977cf057-08fe-47ce-851c-08dcc0644849
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?TQd8EubR8//s/URwygcglNDZcnAIFaYYOtAE4peSX9FuGrsu0hjcSnjejLz2?=
 =?us-ascii?Q?JCxKuI9IPRss/UuS2oQuEprpx8zpO7FVm/E5rkkGq3WtuUSpKVwOYUU2TwtO?=
 =?us-ascii?Q?J8WbxSzt/zgCKSbELBdFJ2lhiBJbvMO4gQtic1kloO97cFDrY/vMEMvwDvF/?=
 =?us-ascii?Q?sGrV9dQLfUBOLoY0hQ9xhEOuiy56SufscwJxi+o6Hx1PAGa023P5NmpIPL+7?=
 =?us-ascii?Q?lIIwbmyknGKS9dtIARaXojRm7Q/hSWptjFWIgaDjLJ2bsCGOReQauNkkZIFp?=
 =?us-ascii?Q?qQz4swcnfphRXqHbF58unP15ngGV23hVOUb+Y/sraAviVTgRFZH8DKR3IFTJ?=
 =?us-ascii?Q?hvxafCjkZFvQhWxCGYjMBUWEGMSpxxlQrIUVXYqdicHmU9Wx3w5Xaf1uzSvJ?=
 =?us-ascii?Q?ysn5WGSwISI/35vOSKp1Wpk0dpWm0KB0oj/z/omxvMmmOPTmEyWgnbQYMNYw?=
 =?us-ascii?Q?HV0oA2hQq3Iu5sGsQ+BeHhJbjMEdN6Lub2lhiP1X2qMBZMa+58xYYwRhioqy?=
 =?us-ascii?Q?Tgf695Zw9Ry280HHRLSnL9vnoykIuEtX5FbIkXb3yWgzC7XETEh2tVvscQ0d?=
 =?us-ascii?Q?isc1xqkf2/FTV2LF8JPIHvdcQe3ubLacYUaOeLjKzPZJqKm7wRMDEn/Q6kuP?=
 =?us-ascii?Q?YBzkf/WubpueMfc7YUCEPxn9svshSzwYG3AKnf5oRum/ArDd4ghbAMVRXIg/?=
 =?us-ascii?Q?C2LagOryfo/XBZXtItmbi1fdhpim7cHWoL9i1Ysr15+CddqrVGUsfkPzoNFW?=
 =?us-ascii?Q?GaOuRSauZVpz0b/fghFwbOkKGB37CGxexaTw8ZQxy4KRh6t01uKIPpZ5or5U?=
 =?us-ascii?Q?xTnKQijU1G2S35UNa5UW3BDf8p/7btmIU1Hyupbvnu/ud6Z1MA9h9yQ7hhxb?=
 =?us-ascii?Q?d9egg+iFrXol1OsKPjA1SCmU1bA1Bxffg2AHWazOX19n4hLzodHEVcoFe97K?=
 =?us-ascii?Q?c8X8miw2nSYkYJHqN3sHEBJGbF0fM1gS/0wopcIbMk25MMOB33jWWjCj6tlg?=
 =?us-ascii?Q?T1jjuzOGou4+pQMSLZxdMsCMAEp7IGCCn5PL4rfwfoagnog8DopYIUGtCvXU?=
 =?us-ascii?Q?4d4TwPppWGePEYEGNjRrIQ9OaJTp9rKfl9ABhzs5UvOg/uzHBcH8NmIoG6I+?=
 =?us-ascii?Q?daz/RHNNelAb9TWEW3/PEchMMSVZtU2kT35htL/DNqHSNz0EoRdM1YvQ1E0j?=
 =?us-ascii?Q?FQ9KZMY+NAXypWrOYmaKiBAfNvQ2+c1XVLXOIDJCFRDgL3xaVg+3CXCGf1zB?=
 =?us-ascii?Q?e2Ntgj2uHqzzBi//ZJL6rFKJzkeQdeQLKNnzYeqwumOnJ0oxF9t3Ec2J32xx?=
 =?us-ascii?Q?Xu4Y64UhdPaaKNbYoOMsFPWzvE/tO7k6jejXWDrxfM55mJbA5jWEm2zOIWTm?=
 =?us-ascii?Q?QVFLiDruZx6Bj16kWMVDPpu2rJHzopDmJc3C20EjV2S0ZQOWkA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?yKiDI/hWAxdqVuSXKdpEGjZsDmceSw2zjlgl/IUUFCeobd1sRhHvYdkpC2Xg?=
 =?us-ascii?Q?HdaOqu+oLLh2d5yiQzYdeOtTKBgBoc8PM4vSQ52dZ8OpmF2Ktu75QkDP862d?=
 =?us-ascii?Q?8QKOpQO8xWNZUXd8XJk+C0QzX47RbJ7JCL7i0yi9ZTsibBX/KKRZuycTJS6F?=
 =?us-ascii?Q?NqZY5TYlwb1S4xsZfV7pW2hbjFsj8APldxkmq+vQA0+3GidlwM4ygww1RtxV?=
 =?us-ascii?Q?d9etan3gypuNxSSzxFbbkGWae5NE4VxSEmqGWJYdFiV1/+4McXzw8YETI3cw?=
 =?us-ascii?Q?gt11nEiVuFQxr6Vi6WDkYaxqyyw7XvBsPhO7nzUlGUWI2L6Fr56kbeLu9Ela?=
 =?us-ascii?Q?KkbNq3lodVuJzYlA+vbKjUgf0BCnsavMjuiRIGQrAysjRsB1E+WbaRkscsSc?=
 =?us-ascii?Q?B88fjlsh4a2Y8Sa8P/EU2K5HNBYPrrFENUOc3POJbJu+V05+fAC5Dk2Yi6EF?=
 =?us-ascii?Q?APQP0yn7IFkb7r5HC0GvJarDJpgQe269IPXRCwJr1+DZuaL7zM40344YI+9Q?=
 =?us-ascii?Q?PdbCIAPD5W1qPJIC1GrXVSs4ldQ+TMAoLNgQNsJXqaVhI9uQ7L4XXGCKxXGx?=
 =?us-ascii?Q?2a7Ob9HSlWr70quk3Mw6xjrOtzhxilctxelgg9pVTp17jTM7VAjk6iyDiK9H?=
 =?us-ascii?Q?6MGDwO88U7J5eV+A8GqsPl7bXYPEILqmAr/izQAN0UBQ6fBS8D0kdQgQa46n?=
 =?us-ascii?Q?71kMfWMQmjp1eAU3UbNirHQ+2TboOH2bVCMdN15ON9gdUz9zEqFFKiOCMUoF?=
 =?us-ascii?Q?LM2DlR3kukWl5F35ql3rhdIlJX/XUjkpS1vPmVtiB/jcwfIvMuYkohIaqw9L?=
 =?us-ascii?Q?49ru36V6AVpQTgW9IywSq9rZBWXec/GGiSo+zc7uayOrP9flQwKwqOWjXmuQ?=
 =?us-ascii?Q?AAGW7OKx4iTeVElznt3IJv6+VAzXxQ47z4XEiGehi9K34jnJPqWQjbhKwFb1?=
 =?us-ascii?Q?DoTUJ7Zt62CYmbrX3a1FVNPiAlejarYpLp0C+wTYGx5E3c1Hf0Ud0aNqwcEJ?=
 =?us-ascii?Q?wkUiv82OnJdwKlIvjNc6SYIzG8mkNBVd6uRVVII7UvJmL2Yf1VWKk6Qugu+o?=
 =?us-ascii?Q?Y32PRfyYHOPs+dq9Sx02Swri+ba9LG04TAEDSFG2qr67ntS/6e5zYrzm8JWO?=
 =?us-ascii?Q?Tj1ZvJdGcSGOcP3aSz00QhT0+C/E1aEaj4bEDl6CtINsO2qLUrmbjsdnkC/4?=
 =?us-ascii?Q?IZkZ8PtlkTNiKw0UnDHU3lBaudrkfeBRrzUIZM2trNcb5x3l539u0ph//r+Q?=
 =?us-ascii?Q?np9tq3a7hsc7CEHYmyh+5TMUyXLLLmBuXxxIpuDShFHI3ashsbBt6ayhtFMr?=
 =?us-ascii?Q?YbwtVqLgEWJc8u19uGrTLE3IrODdAeeMgR/BpSNyh7PAJcOed1sfi1EXXd6k?=
 =?us-ascii?Q?uiv8L4uFimVKtDCcmaTjU0m1NoNdanCbdGo+ji4xH9vEF4DgohAl4WWS6J48?=
 =?us-ascii?Q?7nlgQIMNRYiaIz+I5bsIFvmkrPbPsmJWxE6pcYahWqQhGygGNhJ1E4TzJdC3?=
 =?us-ascii?Q?xutweZePkHYLB0mirhuvc0vcWc76DSnzSuBupn+WLJ8bltl86WE+C5VpZc1r?=
 =?us-ascii?Q?FKr76VdoJYFohGGDYqo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 977cf057-08fe-47ce-851c-08dcc0644849
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 15:33:32.1564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y8v8drczd/xerx9r/enwjfOEnAMEE9b6frWsAgC2iVpGC9TvWX+p8pcY1ihHsUQx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5896
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 15:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111851

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Khem Raj
> Sent: den 19 augusti 2024 00:56
> To: openembedded-devel@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>
> Subject: [oe] [meta-networking][PATCH 2/5] fwknop: Specify target locatio=
ns of gpg and wget
>=20
> This fixes emitting buildpaths into binary and also
> fixes the issue where these tools wont exist on
> the paths they were found on build machine
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb b/me=
ta-networking/recipes-support/fwknop/fwknop_2.6.11.bb
> index c9f9596eb4..0e7998b6dc 100644
> --- a/meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb
> +++ b/meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb
> @@ -12,7 +12,9 @@ SRC_URI[sha256sum] =3D "a4ec7c22dd90dd684f9f7b96d3a901c=
4131ec8c7a3b9db26d0428513f6
>=20
>  DEPENDS =3D "libpcap gpgme"
>=20
> -EXTRA_OECONF =3D " --with-iptables=3D${sbindir}/iptables"
> +EXTRA_OECONF =3D "--with-iptables=3D${sbindir}/iptables \
> +				--with-gpg=3D${bindir}/gpg \
> +				--with-wget=3D${base_bindir}/wget"

Do you happen to have tabs configured to be four spaces wide?
Please use spaces instead for alignment since the above looks=20
weird with 8-character tabs.

>=20
>  do_configure:prepend () {
>  	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/=
config

//Peter


