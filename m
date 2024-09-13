Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A488EEEE276
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 00:56:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.68])
 by mx.groups.io with SMTP id smtpd.web10.63211.1726189004304211056
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Sep 2024 17:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=I/QhVVC2;
 spf=pass (domain: axis.com, ip: 40.107.20.68, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmVEcl+a0cO+0cIrRHOPZoxXBqvoGnR09RXFzKkG7yzvfHSnGtOBgDxWcij1hkgyJNzgUcMoMK4beOz0R9pmjITPGg6hcei6Vu5HyXUC1vOZtbBEO5DhKNBUDNwRGRB78fGD/Np092PqjGUk6B6wIjh5Jsh0GHCqcxvevOIhfkivXR3fIsD597ShMyHnAj8x7GYCSkBvAZijvpPG436Yue+OKJR7cD+9dish16IZf1mpdMnz4A+7/+IU+fsWC5k1JM8Pw+n6X4maoax0yzs4gXs3PCLt0gu6NvZCUEHFunWbyDSMWNj/MzvBE7pgtKFNu3JU9sBgQX0G5B+AmS93PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UzGIO/NYgRluqwmV4E2rbNSgtPGAhCI+TxoBbskLfw=;
 b=DzHcLBiPLdr6TEhyijN8rYDZSgr7lhhs4UP2gpvfn2wA8wjngpz0HDrv5wideYLRQD2Svws/hbGpD7qDxzuZ3hpcK2l5TrNUEnpcFbCKU7o0RL8vhalMBHjJGG3l2Xj3zfiOSuSVMxl/7dsLzvLiTgjtKnxs6XAq+l1ms82EEvkLee4PKYA80ogwOwhV6Yphxp+Uk5wppYML9vseLYp/l72jokqaskX3AvLoNa24gyGRYV5ilMY2hxaam1i5X72NM5oHzAg/jCxMo0EQ1gY+rxDqkAUmA64ba7rQ/jbgc8qGPOyTkrz7ZFxuPHvzwi6EEQZzm2fnDOn/RUh7bR6nvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UzGIO/NYgRluqwmV4E2rbNSgtPGAhCI+TxoBbskLfw=;
 b=I/QhVVC2jeUrox4jUwbEPt9rinio29UMSZRb3RxcmR0CGdkaNCmrR8zRm//Rjac0SqZkT9zYFZ/WO51axlWl7bB4iCFD2KCEKlknObjvEu9DTR6TpubzeuPEG6/h6Tq/BYj7xiNxbLVDDa/LgdXkUHmzei0LfQlXclDXHUj0rjs=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS2PR02MB9955.eurprd02.prod.outlook.com (2603:10a6:20b:605::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 13 Sep
 2024 00:56:38 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7939.017; Fri, 13 Sep 2024
 00:56:38 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] paho-mqtt-cpp: Remove the dependency on
 paho-mqtt-c
Thread-Topic: [oe] [meta-oe][PATCH] paho-mqtt-cpp: Remove the dependency on
 paho-mqtt-c
Thread-Index: AQHbBXWJMhAK8losBUajXxUXW3FM4LJU4DKg
Date: Fri, 13 Sep 2024 00:56:38 +0000
Message-ID: 
 <DB5PR02MB102130A8EE714E0CD06633B46EF652@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <17F4A6DC446036C0.21522@lists.openembedded.org>
In-Reply-To: <17F4A6DC446036C0.21522@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS2PR02MB9955:EE_
x-ms-office365-filtering-correlation-id: dc835e6c-2ae3-4dc8-4977-08dcd38eec80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?e4spvJvaeGYk5QLaO2lhIg+lgn9WYuO/f2UQ96oqilM0nwRn5xEkv7vNPBTl?=
 =?us-ascii?Q?Zj1KX1B881Oahhzv55NLPQaZ76wb6JblTJsmVgbEGngEVD2dfoKaqKqXI6V4?=
 =?us-ascii?Q?qQpy7wCGy2Eszf8/s1MB6mwaPkST1hhpLtfAObAh31/41TYag2+aFWn+UJbV?=
 =?us-ascii?Q?3/UPEv4mmv6YvEZsksTitsYoA+ZnzZaI75yfKS1H/hVjmezOUj2fd9AdnkeQ?=
 =?us-ascii?Q?CSrrfbEz3JasXpIwacNLaZf8pXUhDyOY1aPsyJtFSaalcunlRckQsFLwb0Gh?=
 =?us-ascii?Q?g5Ip1JtCoZnZoX8IifKBqEDPEPueVdb/4FR6ow0YvnWcQQR339E82EqFD1co?=
 =?us-ascii?Q?XuSYCwRruarZjPe744lEgFGjUGnwSe2FbFeouQ4z1HSFNe4MphHLSoeMkwyR?=
 =?us-ascii?Q?LVy+a33mD5ed/L6cN8F6ZPM+ycXaDaXnn3hy9TYMaDzyWBCSLJ1CxmQ6PvA6?=
 =?us-ascii?Q?CyBTkBmK7qz33zQKoIBQvyiqx35JK9KqaILjWx94Gi3a8ZkXQkQBOoi30uYg?=
 =?us-ascii?Q?P1NuU6f5h3BEUh7bIcluGOA8ZG5HVPkdsuE+PQYFNhdgU6QknC4HE5V+LLYB?=
 =?us-ascii?Q?wWOOQXjEeyCEduLOkT25cwMFzT4hz/hYzAL4cQkRsVBTPoIdFw9cq5DQQAsC?=
 =?us-ascii?Q?90mxGL15+V3ONdeYX9C3fMBak4HPL1qa+fQKQvfruf7maGxF5N/hMihQZrf7?=
 =?us-ascii?Q?6WWdZDiYE3vGbzsQAXshJ3aBeyGENTanMBCz/8wKjwHLg+YDh64/DZ8nZ9bb?=
 =?us-ascii?Q?m/mNkvRZOySD03KJbsDOEM/cG/tQKVREEO/c+FjYMh4jVTrjejNdcht9QqqW?=
 =?us-ascii?Q?1LI1d1m4ab7CsV3XUEqlUb15cfxkHeiXxEaNC1mMZvQJTENCugXNhP9f3B2s?=
 =?us-ascii?Q?0zqAnRHgJKmqqF9VsDdrUDX7FWfgPrptQiiGN48UvTuMq/YUaPhC1GLOjYdj?=
 =?us-ascii?Q?UHVF/eei5Sk4P6plpm+EhADnmPUvnMZCDxT8ZN3U9lzMnmSU39z9N3cXXHhJ?=
 =?us-ascii?Q?2bgcC+KdJem3KoCS/bLZ5j9Zd2THpsh9pMVMsNl3Zt0CLZbPW03X+ehLdEZK?=
 =?us-ascii?Q?I22mi28+syNHwNm0//r84soUH0apyereMx9cLnaNP255RVEprn21DJvSGUAL?=
 =?us-ascii?Q?GzOGpx8dQp7NHrTXT2y9bDaV5BcncOAgRRFG+uj+qBY7eZ1giIX//44N7kPs?=
 =?us-ascii?Q?Suen6I5ivqRt1uH+ngRPuj0416F3f1Azg7MgCQuIZS+on/mTEJuWBLZAtfa/?=
 =?us-ascii?Q?Hav9XVOrLSMuej1WHkxTc6FfZY61tdgc53vEt9ZILAqFbGqWRg93hfediUVx?=
 =?us-ascii?Q?ZeKPNYDnrA92GBcWLHTmlnDDQumWILTweH+SglVAZ5AAMhC4dS5SADaLCF6Z?=
 =?us-ascii?Q?FG5fijwiCa//BF48/KJthCfC07N/ZqECAfjNIdrl4mgNx7vJFg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?IOTlT/or824gfdvUR4wCq22JSIG08ZaKa0FXVs+UtCR4V67lzhGnN9nURjyG?=
 =?us-ascii?Q?lqcXq8Jnh1d+DRO7fAgsV8eMiCRAz8WPTVSvkocKiTovmfYLqcpMiZ7WDYj8?=
 =?us-ascii?Q?qeAQ6WIQupTRUJ1a8CJJfpZeX+DHz2199bt8thiOUth7TPiglQTsgM26P8Jt?=
 =?us-ascii?Q?8LhuqJrM246b23D9S7a+HAatAWb5zyG+ZM7uiDBr7tdFB+s0IO6gSA/ydKwQ?=
 =?us-ascii?Q?xUVzdP5NFkr/3z3B+TcMPsTL1xudV+iPvhoKXsXFeF4QQAF1SprkCtIZzPI2?=
 =?us-ascii?Q?dZsLoPPKiZDH6jMcU3sLhcebPrUEyWAjCXhSTXTMY6H7+XWVX7hnA7AiMEES?=
 =?us-ascii?Q?X6MXBOpzgNhpT1TNWL2ZmYQnfY0Asq5p3eY198cBYJi86QLFqtcnKQf68Y9G?=
 =?us-ascii?Q?XBZLK7qCSbRlfePI6NFSU9zOgU9XtaADyloEEFTUOpGEka/xmDf6r2bpky6x?=
 =?us-ascii?Q?SGLQXKKAbYoJZlRn0DttsIzz0NUCtmWKFCsZMgc+A0l7d6zldqJc37nkEswr?=
 =?us-ascii?Q?rbr/FASQdDC89wqXeWNIBGckRWCS+nfIqFZ+eEjG4f7DUkZ8A0Exl5tiBoHO?=
 =?us-ascii?Q?MoFiWfIJZ1+I1uNkbmnzq5QhQcxSCKrSf0rJJxQBow2HgwUHZyzKfrUeztnZ?=
 =?us-ascii?Q?nrlTjLSqa6lxEeQnTZKtYmYnIjsabfdoG4LtSqNYCh86qQo3H72krlgaMiTo?=
 =?us-ascii?Q?y4Ervzdq0H3tXbB3pSv1YihEUSxnp8GArIohxLOyhUyHMwuVaGIxzdi51m6c?=
 =?us-ascii?Q?qK3iebf6T/gI0Ni7jMCBgsPVhLjHUfaPv6bujVGwEcNHXOHWgMJssumRBu2u?=
 =?us-ascii?Q?1YCvubyHMs3BI4QNlY21aeNpxOxMHIgsKBBCh6kU3HEZ9yy7Q8aNCN6shKAV?=
 =?us-ascii?Q?ij9eoetTDKKf3/Bjr1TCFHcNypvfEckCbmTEy0yoVAZ6tjWZyfXat4HYTG3C?=
 =?us-ascii?Q?EUaWbG5T0JlXvhEYXl7nqQy9ZgwmNysqQC6hid4yI0VR3vc8RykoqI9YD1R3?=
 =?us-ascii?Q?L4wCKGmPLtDYgzNKPGPUTC0Jndvf2ptEeVvtbOW38a4HZy4asARsgo5M7dRE?=
 =?us-ascii?Q?Cx6YuSjO76XXBkyNGBNhnWOv9n7DFDoWZgUrBy6fG4tniNP5UjdX8BLnU+Fi?=
 =?us-ascii?Q?SR2Ros557xHyk/BZ5xi0GF5XYE0CrvGTbRhBE/ZZmlIEebb3L841cih6ry2z?=
 =?us-ascii?Q?1JbnJCjiQwmZ11ReEzxf/0ouoO/AQhK0DOsgBcUVcu5yefjljh8X4jkkkxky?=
 =?us-ascii?Q?QLatm3YbGoCOY5HTJDqmwuKXQYxqYLcGBIlRNbMA7TL2Sx/a0PRTLfXdIbpV?=
 =?us-ascii?Q?M5Ac79S+6qqkgknVSvC4NBYIhV7o2+WgIRLR0AaSaY5YMMFnEV5k2rvN0HY3?=
 =?us-ascii?Q?XhnWQWtr/HnKjvRwxQfHFp9ESS/ts0orLYBKKOTOBm1CyNlO7+QdlnUmPjj9?=
 =?us-ascii?Q?hBJ0erIw3wsuAQBrmfg2+2ivATuwuVPAKy/5X3I8rha7Q6xtsg4lTbHGDBq1?=
 =?us-ascii?Q?PIyHWy0I81OuZyLKD3TXAFHsJFU5nt5nRNqurVCamdalOBN7DPTKjPeBkm+7?=
 =?us-ascii?Q?6Q3awfP9roTwKz5P9X4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc835e6c-2ae3-4dc8-4977-08dcd38eec80
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 00:56:38.6175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lJZk0PZNljn4gC3k/Er5dlYIiuhcB4ZKyWbZkxv9UlkTYek64aL0rB0hlrdI+bPz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9955
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 00:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112259

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 13 september 2024 02:40
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH] paho-mqtt-cpp: Remove the dependency on pa=
ho-mqtt-c
>=20
> paho-mqtt-cpp is built with the vendored version of paho-mqtt-c since
> commit d4f8a3074307982a45eea9551060424835e1cfde.
>=20
> This avoids the following error when building an application that
> depends on paho-mqtt-cpp:
>=20
>   ERROR: foobar-1.2.3-r0 do_prepare_recipe_sysroot: The file
>   /usr/lib/libpaho-mqtt3as.so.1.3.13 is installed by both paho-mqtt-cpp
>   and paho-mqtt-c, aborting
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  .../recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4=
.1.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
> index d2fbc3a34c..f0ad76762b 100644
> --- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
> +++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
> @@ -16,7 +16,7 @@ SRC_URI =3D "gitsm://github.com/eclipse/paho.mqtt.cpp;p=
rotocol=3Dhttps;branch=3Dv1.4.x
>  SRCREV =3D "ac1b023eab789e829656144f12b248602c40e37b"
>  PV .=3D "+git"
>=20
> -DEPENDS =3D "openssl paho-mqtt-c"
> +DEPENDS =3D "openssl"
>=20
>  S =3D "${WORKDIR}/git"
>

Given that the paho-mqtt-cpp and paho-mqtt-c recipes now conflict, you=20
should probably consider removing the paho-mqtt-c recipe and making the=20
paho-mqtt-cpp recipe have a PROVIDES =3D "paho-mqtt-c". Until then I=20
expect packagegroup-meta-oe to still fail with a similar error as above=20
since it depends on both recipes.

It might also be worth considering the packaging of the installed files=20
since if all you want is paho-mqtt-c, the addition of paho-mqtt-cpp=20
increases the size of the installed files by ~50% (620 kB -> 907 kB).

//Peter


