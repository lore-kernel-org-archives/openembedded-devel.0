Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.72])
 by mx.groups.io with SMTP id smtpd.web12.725.1615398016273223558
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 09:40:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=S94sP7+H;
 spf=pass (domain: spinetix.com, ip: 40.107.4.72, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLKAsi83dN3RlBZ9dKypIKhYH1/GjyxE4NYSOG7s+d/QAlr/jEI26hjxIPY7ND+X2LXEU8jvhLLrk9iIFJqtiWnV2RS7JWTIiHgpGxVRyQa286X9jE9c4ziqsndOaZmvtWqdpzDD/3yXE2a82wVpPGYD9GNO12SvN3+bZrZZqTjKQK/qaFPUFOFZHkROHlk1AoNwp7/duQEkM7FTe/7RWc+fg1rfg94cNi5XrgvFohaBLBOEvXpP6lIuo0e+hyoRa9wowDr2kNMkjMCtDe5mjjUkVzq8w8kbRlm3iY2k0r/H5m9VghCGONKlJfFU7v7KSnVvLIkBy4Xd1C9qW3zNog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OpCbrM0tOehF+10/6xqaFjTUzl292ehx+YW8hRt9Jk=;
 b=AbcEf+za/V4gIVSJIsP0MXqUjifDy2UfVzG/0X26MqYxRCzF+Udcx3yYgxLw9D97D9sCNks9nVGE1woZjvdrbmhnp7N+nRVz/WnkBBFDA0dLehwyUPrdyXH96KNL3wJkGxxOOlYgu2SDSj2j8txpVXxb6XdYIaOTWPwdIdqXLdFU4lswMBqoX9UZmsZGW+v37x/j6IcGVpeVPXOh7WYluFBfnycKGWFEiK5kpCIROvnVXOQ4iGtKkqKyRUhlPSws7oOOC4bM0Ci1SaL8h0w72nFIgtxAoFsn55n9gGELK3jkbgQF2/0HQvBql2mQkTaBGk8tmqrbkPXC+IQAmodo3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OpCbrM0tOehF+10/6xqaFjTUzl292ehx+YW8hRt9Jk=;
 b=S94sP7+H3v0NZUFX4yT6a1ZF7c2hGqjrURfFbHDZoRhT4z1HuMzocNGT+hJF5zaDqtQisbHe9GIYZQxDXdKCQvGE84nvihH8CALN8VX1N1HLSlQcjKs2Xu4bEhdm49FA7H51TtGXZauRVoEMnA8u/kZktE+gh0MSRhVUjuQaMiI=
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB9PR01MB7307.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:219::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Wed, 10 Mar
 2021 17:40:13 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b%7]) with mapi id 15.20.3890.039; Wed, 10 Mar 2021
 17:40:12 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] php: update RDEPENDS
Thread-Topic: [oe] [meta-oe][PATCH] php: update RDEPENDS
Thread-Index: AQHXFUfTDzShVwzmrUi3Rwq04ePfBKp9fAHQ
Date: Wed, 10 Mar 2021 17:40:12 +0000
Message-ID: 
 <DB6PR0102MB2630AB1E1DED39FD81AF91B788919@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
References: <20210310005331.23711-1-changqing.li@windriver.com>
In-Reply-To: <20210310005331.23711-1-changqing.li@windriver.com>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none header.from=spinetix.com;
x-originating-ip: [46.14.255.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50ddc42e-d9a2-4f8d-f2b1-08d8e3eb8f00
x-ms-traffictypediagnostic: DB9PR01MB7307:
x-microsoft-antispam-prvs: 
 <DB9PR01MB730776F64B376FF98A741CFA88919@DB9PR01MB7307.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lLf14g5rOqKmLerRQBaWUa24zgPIi+JBnu1mvbEpwsp66YKXXFQjLZekjN3JIbdqnEfUa82AruKynTkKQHVO3XSJDbIM2bZwJW05W/gjSsH+uf/693jpmWgxqiPxQiBFJQhqAJ2WHei7XS+8YuovzDV3Wee3J8uUuQFtnt8vZyZJbbIBY1CebZ42ZKbYsemBbdglFYDHI2JL6osigCSFSc579nzUcadDh+kFmjDuapSxki7N3s//vQL7ahrqdZoPa3Ka4upDTiCSkN/d2W/ZV0PCJOv7iR/uZDsaw0r74jzoR3wqNkh/wOwhhYJqKEmtclKl06AADfxK94/lfqVbjXcHWzFR8tqbLHcD2IcQEmxYV2mb0jf2/Ga2LcoxUa5nDpcCiSvTCazUs7O9+lPnJBEb5chcumdQ13OfB07P9KeYhNduSdGKVR7NpP9Z79lq5f9jdS2fvA5H20QOj1mo9JgXQEwWOaf0veaGVYxF4pxX8YEOQtaRhSeN4KopVKgu9OoPaiku/alwqvJ3P7B41w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39830400003)(366004)(396003)(71200400001)(15650500001)(76116006)(6506007)(5660300002)(316002)(8676002)(2906002)(26005)(83380400001)(7696005)(33656002)(86362001)(66476007)(478600001)(66946007)(8936002)(55016002)(66446008)(64756008)(66556008)(186003)(110136005)(53546011)(52536014)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?iL0Ui0/Tjvdeis7+OwbWH63IKJCwljzWc4Nh9tLLt8vOp8XKics7CcoFlaJI?=
 =?us-ascii?Q?U7pUMuAR/EYS32UOxutAi4VP/wXNwxVNEhIX0vgMSvOD99psHrx2vjDid8//?=
 =?us-ascii?Q?0+mp8x/bOH47CD6Ea0Qrk98vELrwUSdsGaLXv0D29eb5ufliyMgD5NIB3o6f?=
 =?us-ascii?Q?Q5Zek1Uq/ZhBwuNizbuL3yWSo151L5Hov9dSkAHCtBcpKQxPwzMdGTT42ZNk?=
 =?us-ascii?Q?duGLLctvFX1r55oWGvsZ2ynPuaNft9CYbGyrwVMGqCsDA49MHJX/y9uO+GEw?=
 =?us-ascii?Q?i3ZS05vdopMYtDXzWXSj1ZxjKkK7T291UiRnhIetXXpn5JbS5GLIZOUvSZvM?=
 =?us-ascii?Q?cptehvoND38lkoGWMNIzsOCOdFjq8z7caJ06GQxYFJf4l44pBKDSV9qtYys3?=
 =?us-ascii?Q?7qKhlp4guWb9NSG4zsYn/JJOIsryQLQgseZUjGTsuyxjikJGF285nm2iaOfd?=
 =?us-ascii?Q?gnLc2V5j3Nhl/NLXE6GKyhAkL8+2QuHeVozpgoFNMpPcS8btosOo7iSLHyNw?=
 =?us-ascii?Q?3BGTNfGDqzuS3nw4m38tK8+7sAVGe+gq1Ylk/yjlOE/D5BUOq/FQODZsN6NB?=
 =?us-ascii?Q?ilRBkaeuFyTdWj+fz3UyQHOEsuJTPdp1Dx/nox9yFp5nj9uU6gfBVyklUkNf?=
 =?us-ascii?Q?IOUZiua7PgMJ2S4wVxQg4bMcfzE4CR9UyTsOosOX5B6o5UNh8qSfuJMXsr6U?=
 =?us-ascii?Q?2FerqXqcBKCatZhkdg4+GKU3V54SBMi3KabmH6lwH3hnELoWVMNg8YHunH2u?=
 =?us-ascii?Q?1qk4FF4QLyVGiy1vffP5DAPV83p3GtJvJyGlX1pqWFQ6is2FEtQuMoAkRZyC?=
 =?us-ascii?Q?LxSC6LafZAxMqPQzDt44KZV0vn7sgMxfH57gnLgpv0sLzPdP+oejcZ2c2ax8?=
 =?us-ascii?Q?yXnPU4GSFD05dQme2F9oIJT1ktVGIk+c/KXsWt2PDTocwxrd/TFgxN4HJTia?=
 =?us-ascii?Q?0wHDYfqtWR5EFZqcVcJnBeODOm7zS7ALGr4JJLxF8cULSwxct7d0UIeKJ+nT?=
 =?us-ascii?Q?2p1x3V+GBKolUApLQ2hL0TedQHVaEWm8T+MdDunkO9Nv0UD540/epVFRQp8j?=
 =?us-ascii?Q?DTgE4YKYpygL+e8m0plUgSjaet45vHxHEoHq8CIUXWpjbDvCwLVJzfDAYJQB?=
 =?us-ascii?Q?P/0hyNLTX26WZjviwPkujDbQ6hqkeP8jELO767UcAVjNNAqsle/LaoSaI4bG?=
 =?us-ascii?Q?MkxFbxIPGMwwoh8rq+NzXZ/i+6tX2Yc8/8m04trLl5sUt1Lmm8yGaOzyZD9J?=
 =?us-ascii?Q?2LBu5WKDiz6YrkOL3Rs1MGwZ3M1fj2zvf7WByA9MYFZxlHvrGbT6oNqJlOIH?=
 =?us-ascii?Q?i1LAQkyse8JC8gGzgRgHWsX+?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ddc42e-d9a2-4f8d-f2b1-08d8e3eb8f00
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 17:40:12.7619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9KhykudcOAMc64r64RAvsO1NyL8Wm4Y6u1nYC/kNvGMScNTQSafIk8dQGsuAGb41jYNKdFCzwqIaWEnJWA6a9eN1InTvEtBCF7NWt4BWeIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB7307
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Changqing Li via
> lists.openembedded.org
> Sent: 10 March 2021 01:54
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH] php: update RDEPENDS
>=20
> From: Changqing Li <changqing.li@windriver.com>
>=20
> Since commit c4ffcaa2[php: split out phpdbg into a separate package], pac=
kage
> php is empty, remove it from RDEPENDS to avoid error:
> nothing provides php needed by php-cli-7.4.9-r0.corei7_64
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-oe/recipes-devtools/php/php_7.4.9.bb | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-
> devtools/php/php_7.4.9.bb
> index f8a8755b9..d6df998f3 100644
> --- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
> +++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
> @@ -208,11 +208,8 @@ MODPHP_PACKAGE =3D
> "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp  PACKAGES
> =3D "${PN}-dbg ${PN}-cli ${PN}-phpdbg ${PN}-cgi ${PN}-fpm ${PN}-fpm-apach=
e2
> ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-
> doc ${PN}-opcache ${PN}"
>=20
>  RDEPENDS_${PN} +=3D "libgcc"
> -RDEPENDS_${PN}-pear =3D "${PN}"
>  RDEPENDS_${PN}-phar =3D "${PN}-cli"
> -RDEPENDS_${PN}-cli =3D "${PN}"
> -RDEPENDS_${PN}-modphp =3D "${PN} apache2"
> -RDEPENDS_${PN}-opcache =3D "${PN}"
> +RDEPENDS_${PN}-modphp =3D "apache2"

I do not think this is the correct fix. In many situations php.ini files fr=
om a bbappend will be part of the php package (that is my case and why I di=
d not notice the above problem when I split phpdbg), are common to various =
SAPIs. I do not know why the current recipe does not install a php.ini file=
 though, I thought it did. Probably the best solution is to just allow php =
to be an empty package with the following (it will make life easier for bba=
ppends that need to ship a php.ini).

ALLOW_EMPTY_${PN} =3D "1"

>=20
>  INITSCRIPT_PACKAGES =3D "${PN}-fpm"
>  inherit update-rc.d
> --
> 2.17.1

--=20
Diego Santa Cruz, PhD
Technology Architect
spinetix.com


