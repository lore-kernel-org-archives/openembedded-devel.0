Return-Path: <san@skov.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633D1C5B543
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 13:51:32 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.132])
 by mx.groups.io with SMTP id smtpd.web10.28941.1748267490146272748
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 May 2025 06:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skov.dk header.s=selector1 header.b=N4eOMOs7;
 spf=pass (domain: skov.dk, ip: 40.107.22.132, mailfrom: san@skov.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gfystwa9cySp3eg6VKjYG7Qho5sAsggvWZYFQgHewBJhJQVYb/CCd0Sqeq9/VGzQkuqCMrBpJ6ejK8Xr0GEY2n0VtnwoCUigNTs6tAGtiXrYKme5GIv0/VzDjRW6D3lJHWBr35+Fpo6jGmplghdsXFnD3X4hem1TzULiCWJgg/0tUv1jo+P6SnpXwi2RZwpH+h4YGfu4Orl0qtDut8vw4NM6uDerkLGiHG7WNYjvsh41LXsd1Y4lQaCz2rA83BhNwG4wTpY9J1spdyLm5ZtaWeYl465+VXJTNWhcA+nawkdTlKuchET7QZFJFRpUSxULf4ZnhMSKe3z+NaWIYFd5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwMKThxHbw+3riTZkAnyQUTCCGETz3KT6/1mW/5dJFc=;
 b=yX54a8nLzz9y5gQEAiV58e4p56a/SZKoAdDhO5tu2dLGq17DeHEYzjvkIuh325qI1ojexWODwxaj7WiuPnW0/LWrpdYbWfRE5Tkg2fN2/tLNm8DES87chVpfWvnKBUOpjtOw/cbOAsoX9bFXD1sxi9NxQKm693atYahcMikgEeHk1kx9BAhABPkFvLYraMihwNPrBvazkuGgy0+vkO4jjUqK11fyuNRzU/7CnX2heDFsBlGYt6TnFJqXc8sQ1BCmpSuhIIZ8eXDDDoO1yLpRth03jHJMQl1u3twyvbS1bhddwMFGJS2IBi+rD4M8CZD4aGYZoI9FPO8YrUYjcr7q+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skov.dk; dmarc=pass action=none header.from=skov.dk; dkim=pass
 header.d=skov.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skov.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwMKThxHbw+3riTZkAnyQUTCCGETz3KT6/1mW/5dJFc=;
 b=N4eOMOs7AmwhwVk7/mzPPpVaS8vhzfw7viTGBK+Skk6egyM72UIWHtfSGUQM1cHCe8Sc3Qv6GkePvldqn3puq/ZRAzHDmjgsg6RDGiY1/iMTU6Spq7Ie3veS1Zx6tUUppO6Ueiw92ms170K8/iK5bKW0s65MHqYbATsdpwZSHCw=
Received: from AM6PR0402MB3429.eurprd04.prod.outlook.com (2603:10a6:209:6::22)
 by AM9PR04MB8890.eurprd04.prod.outlook.com (2603:10a6:20b:409::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 13:51:24 +0000
Received: from AM6PR0402MB3429.eurprd04.prod.outlook.com
 ([fe80::9561:f7c4:dea8:ebcd]) by AM6PR0402MB3429.eurprd04.prod.outlook.com
 ([fe80::9561:f7c4:dea8:ebcd%4]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 13:51:24 +0000
From: =?iso-8859-1?Q?S=F8ren_Andersen?= <san@skov.dk>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 1/2] python3-canmatrix: Add recipe
Thread-Topic: [meta-python][PATCH 1/2] python3-canmatrix: Add recipe
Thread-Index: AdvOQ8cAUr7pKifoQYOndZF0yXiXig==
Date: Mon, 26 May 2025 13:51:24 +0000
Message-ID: 
 <AM6PR0402MB34293F0DE182D6F5B7A8F999A665A@AM6PR0402MB3429.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skov.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR0402MB3429:EE_|AM9PR04MB8890:EE_
x-ms-office365-filtering-correlation-id: bc15e5f9-d9a6-4b21-b3fe-08dd9c5c6781
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?ziUKeOJhTjQx5r7ubN9lW+a7iwomtbMFp4HopP+twEt3NsS/4HPEVJCWhm?=
 =?iso-8859-1?Q?w9zrdkF9cclFdKBdbiotW+yXrFltWXk59QQdYcl6shtj6QQvX+yeNxJEWP?=
 =?iso-8859-1?Q?gn1EoTyKPkGcOZpwp4RwlzwMI7IfFxW0cYVBi8N3xbkp/hbU6I+szBG6lx?=
 =?iso-8859-1?Q?9YEK6X4n2LJiy2Hk/6GmHjK+gjFw8xSoYauD2zqA22pHHM6gT2UF2HlP38?=
 =?iso-8859-1?Q?AUMSuY4H3aj6dnbsbYgWnu2v9QLKynzD+1yKtG1bSw3ilzp7SenQ9KGMNi?=
 =?iso-8859-1?Q?SanS01fUxN+JTUkqVzTVvjY4Z2ek/6zbi/p+DHtZ6MNevN+kalEaMCVeLV?=
 =?iso-8859-1?Q?/Ji/4yoLaSDrCniXSfRzwNt18Y1yLA7NqHiqVSlTGp6R7N3J6KB8p2jEbr?=
 =?iso-8859-1?Q?41O6KPhk4LHoXvTW9hxPvdUjtFkpDXEO3/M6GeebskuEO8F4+7TzCiPMgc?=
 =?iso-8859-1?Q?sf5QfSwwBGGQXESH6tuyhhqHGztAakWadEhXzeLEPlU2qst1N4VgwfQ/Mn?=
 =?iso-8859-1?Q?uDF6NVFv74Ld3iGtylSkBV3FyNs2qljnMwaAfKkVZ4GMqXUVn13PwZJA/+?=
 =?iso-8859-1?Q?nHiL9S3x32iibp4WpCx0gC+i4jKfTRUi5qfF+p7wm6a5bR/hS7N6oVzBWD?=
 =?iso-8859-1?Q?0MbkviwcvI7l5MYVfZ5ZzqIBH9IEnbIBwIuIe+/2ZBTs169c/batLeOn6w?=
 =?iso-8859-1?Q?Xa3FYEdF97wK2xg3gmTHMRT+q30xEFTf/J83e6dynPpc7OGIZQ14zMvodo?=
 =?iso-8859-1?Q?3SeamXDO05xHwR1bNpp/FEhBhheQh72mp+IosE7lPDv8QmLvpIDqM+EhWW?=
 =?iso-8859-1?Q?PYzAuAxLS4X0sSfU4Ajb+o9cV8BPo6impjmBDFU4MqMKJwGilEDONF4M8b?=
 =?iso-8859-1?Q?qv545kKcqHmUdlN2uURkM5zi036VJjlvbcdMkmTOF2AYGHryqOVS4fzBTc?=
 =?iso-8859-1?Q?3ELeOPvTJ1OTELRiqJ9WHYQ8gxIWqoWiJGVnK9QalBXUZ1QG5Om+n/xb1j?=
 =?iso-8859-1?Q?epzGmFy2aaDqB4WifAow8/Vjwh3VOmYUestmKK+un+7Wm+FNiF53A890pj?=
 =?iso-8859-1?Q?s//tIzaPWEEqn3Hop/+rDGaNjCKP7HX1s62t/kg3MC15kLwfAt39WRi8Fo?=
 =?iso-8859-1?Q?HpPfQhjUB17vCWedZW/e/OLzX4CGN+qqukihADg7pD+dJ6Z3ZM1cSVskl8?=
 =?iso-8859-1?Q?NuLvfLXgkocSfSCx0b0SfHggSzwo3Znke1/aBtfbr0NpI9pwfdFnvaqqNS?=
 =?iso-8859-1?Q?CoXGAqIJ0C7y2G1LpFAgb0gK5QnX+tj+50BDKTrDt97EhOSVBO6oiTQzit?=
 =?iso-8859-1?Q?i93JWQEv6WKn1vXXnjw2tyrLLIltKde9BGbGTShshS/u5xXuCFrdWFq6n9?=
 =?iso-8859-1?Q?MYoHUtpdudCJR/jWAHDnZZp0gZ578+p+jwuC5uDSWfTG72fnxjlK/crcAN?=
 =?iso-8859-1?Q?aHuQUFm/Z7fX9eX2SET1A3He3z1ZmAIsQcpcPDI2Bq+UQGjZdabHJgRJOn?=
 =?iso-8859-1?Q?Qt/JRQwKRBd65Krwt+/pMy/BSsYOTLPO76Pp8HfqZpS/g9fdNoagbJVLvF?=
 =?iso-8859-1?Q?noOtlT0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR0402MB3429.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?4lJv9rrqSrtTF6smVeRKTmJ9bls7gT75bY6TUjB8G3AlYfm6wPGW08mcCw?=
 =?iso-8859-1?Q?iPT9wjWLOEGh8rOU4VUEky77v9hsJ9tsG6A5+X0g+lXTTw06X2jMQQTSDS?=
 =?iso-8859-1?Q?Zw4+fcSQ/JwEBaUc45IqO4WgAdkDB1Yk7tx3dP6LmNJ0YKvUfnwsC05CAd?=
 =?iso-8859-1?Q?A0qyaDSVtd51r2Dr9fm35d41xd8+gNuQbj8ZWZYDFEIKzX5cUlV2GMRgEf?=
 =?iso-8859-1?Q?qUdZzYAWIoaI0raCeICfLlOxOVrpGUHjFeTSg0K7KRqPnvhfeJ9JefOVmx?=
 =?iso-8859-1?Q?hLM3Ig3qrwBgGr+aqkMnlwn83OHdSP40bs+Xa3MoK6Q7sr1IG/xyennF1W?=
 =?iso-8859-1?Q?6EYaae/GDPvhTkbNoOY5VbVN+T6HrL7X4cIvVrbexaJQHWfW95z8xIyApj?=
 =?iso-8859-1?Q?JKKvOXQDyFtxuUyP+j4oAR5eRCp+Y/n544ZPC2DrioGPI35nIsOZZlkQ51?=
 =?iso-8859-1?Q?a2C6M9idx8EfqKp6WK11DVrEse9lAki03Ld2g0X6cHY+REjwTTw6YDZj9Q?=
 =?iso-8859-1?Q?pHeYiN3VFdK5nskXb7Aq5V5AiZk+Gkz5jTkC+ff3d9xvDVNW/SnKcilCn6?=
 =?iso-8859-1?Q?Iis9Sq/7Y3G4Mm0Su2IIMMUM/qk72UuyKo+jmAAWpQhKyfBh2b7vL6VjEt?=
 =?iso-8859-1?Q?ScpLFVb1zm1NO7sgYo/iGrm/lNEPWpGg0EFQVKLSeo1ao5z3gh1VKShEuR?=
 =?iso-8859-1?Q?VlW2t+aXa8eKw2gHCMq7XKyZTYoJuereGIXcIZpHZqR00QHRX3cR/6e8ls?=
 =?iso-8859-1?Q?4t8PIPX5BU/U6z4h4HqFg0gF2FNdtrfaZHNBQAuyTHw9jRAZkZM5lR9NXC?=
 =?iso-8859-1?Q?m3VKTxNtDjw4FWdYNQ+AvaiwQBsXnmq8rg/vO3IZPWsKxU6sHjwAjnGeSe?=
 =?iso-8859-1?Q?d9DKKOULsP9vmdVzFH1qK12m+PlNs5aByc+p8WEuPwHk/rICcmVHY8dMkw?=
 =?iso-8859-1?Q?68fpMyngJLjiiL38acoU2OyAEtvru5aI8g/tk0EpDqrs8fN2OkIXz0bMa6?=
 =?iso-8859-1?Q?KDBkKjyJKs1v2fEVxtZ86awOBwF+2/0M2AP9XIZOvWYb+qu833ca4fLUB/?=
 =?iso-8859-1?Q?rW8wRdlqG+YkjSxFsgGjlxrf1kyNB2P8bRiS12+ErfUr+pTWPFHZDROqik?=
 =?iso-8859-1?Q?ICVjJtU6HTCi30CO7BI9yUzV8LfxUW8nmknyxkAkUsh6UBH4LJ088d4uBo?=
 =?iso-8859-1?Q?gf/6jbm4yEHYDK5N5a1WOKRwm0fJ3K6qzdMM/MqFazcO/vlUj1mmeAnfl8?=
 =?iso-8859-1?Q?d+x1cB0qMIKX3YRvprQ+QfXzI4VX5brdqd1e9BZTpV9Z1oYlSesusCpdS+?=
 =?iso-8859-1?Q?nmZ7BA8RnC12KGwLXbM4hH5c0JeZww1cWibcFQwJ+r8VlGSqoraO8Hew5t?=
 =?iso-8859-1?Q?Zy3YtuVnluZvXACphPtc6sIs+JAz7B5dgetegjEQGE7NA2qmRTAj+9k7BE?=
 =?iso-8859-1?Q?dsn0zmhSeF56VBAX2dUCc+O/qv04iVZUxFp6xNvKX6LyhxRKGm4VMfIMdT?=
 =?iso-8859-1?Q?PQlssZA7s5U902SkgCjP8iJpi1Tfrg7urrv5akGp+YNrmuTqwK9UmhXNjs?=
 =?iso-8859-1?Q?wZtzaES6JjQMlz24rqHTich/j1SWgg8cPnQ3jjP8UM2YPFiYhQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: skov.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3429.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc15e5f9-d9a6-4b21-b3fe-08dd9c5c6781
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 13:51:24.3482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2bb8f3d2-db94-422a-b8ad-e4a4aa412414
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /gKSZCHYK+4yDwtNNVJwVlAYESwEaSD0CQus8HVBHNcTitEaiDYBA4pEvh5qFQBv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8890
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 13:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117628

python3-canmatrix is needed for python3-canopen

Signed-off-by: S=F8ren Andersen <san@skov.dk>
---
 .../recipes-devtools/python/python3-canmatrix_1.2.bb   | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-canmatrix_1=
.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-canmatrix_1.2.bb b=
/meta-python/recipes-devtools/python/python3-canmatrix_1.2.bb
new file mode 100644
index 0000000000..e78606a142
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-canmatrix_1.2.bb
@@ -0,0 +1,10 @@
+SUMMARY =3D "Canmatrix is a python package to read and write several CAN (=
Controller Area Network) database formats."
+HOMEPAGE =3D "https://github.com/Phynix/yamlloader"
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbb3bdbe015537f08812c87d93670ea1=
b"
+
+SRC_URI[sha256sum] =3D "19d5ba3fd69974bd41985b90198503bfde6ae3639dfc8ce6a2=
f7a0338787dbf7"
+
+PYPI_PACKAGE =3D "canmatrix"
+
+inherit pypi python_setuptools_build_meta


