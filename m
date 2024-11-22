Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1B2E6918A
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 18:57:58 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.46])
 by mx.groups.io with SMTP id smtpd.web10.32172.1732301876759778434
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 10:57:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=JppoaBcZ;
 spf=pass (domain: axis.com, ip: 40.107.22.46, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkBWdLafERopJv/P7EbBqTwNEuxhnL/UlanysYruxOqD27bIlSXg6KEfTEs6TFgDYk+K5c2GnGUpt1iq+vhkUYVbhoJawGVCftLavBDvQaIiLko/ncC9mQEHoTkF1fHZIf6ONo1kc//Y3C9Kt4mEi3UK6wpfJiRkWrpwX8Ch+6DgTXZrG+OG0Cq5PINJfmopxAW45g7DiEimz46pQN9Ci4upCmQQ+LKh3rbqXew8K5STizKoqVhPG7oOhS0ahmJuNpJx0sVy1nxyyRJfQ7t/T+sO5ry5QiodHiSPLMGzv4xGJ/cAvkc/LYGwoh0ZLIt37X9upQkLjSxLKWUJqq/IhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6o4spSnsXxAWRPRbvk0EKAo7ZfE2Nv7DR/m2INKDMXo=;
 b=fZ6ETKdkE/pD8CGfGoncgXNix0wr7+rIG5IVZW+WouHxM0/eb1LcJAebQQh541Cg3K+vuPoDvEmxtF6DjT3fCsxU8H2zoGe1u+3j/N9WXYRjCVLb7G/NJmgIIYuBq1C6EIKcfI20yCulXjGJy1SJAluhrMNn96Ss6e7+CAgPnuNdlzQk4p3FBaQgCdepsCy5P7Pa6vem5a5YoVz8SeR8iOik0AMRQc4XyoFAWM5szLIks6L+tm579acbx8nmRqn4WQE9rFMFRUVrWN9IIGa0u1ShCQ33XFRopeyHA5/97SmaH2dzC6fj641b2QrmlHqneS3rqdvgIQT96pSXuG8IZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6o4spSnsXxAWRPRbvk0EKAo7ZfE2Nv7DR/m2INKDMXo=;
 b=JppoaBcZDCvHSH3uudFITkDQv7p+FzWxUMjy4Hah2ghG25GWPv5Ow1losFK2xCF544YL4Au1nt1mOLWuw0na1/cwZPvFVcjFcsvBjRprJmpYsvQRVXSBi9i2Xfkvfe0MIjCmtNZJz1eFkQeHRjJIL2TPtKyhTxknlVdjtm2okPA=
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com (2603:10a6:20b:63d::6)
 by PAVPR02MB9428.eurprd02.prod.outlook.com (2603:10a6:102:306::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 18:57:52 +0000
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb]) by AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb%7]) with mapi id 15.20.8158.021; Fri, 22 Nov 2024
 18:57:52 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Markus Volk <f_l_k@t-online.de>, Khem Raj <raj.khem@gmail.com>
Subject: RE: [oe] [meta-oe][styhead][PATCH 79/90] cryptsetup: fix udev
 PACKAGECONFIG
Thread-Topic: [oe] [meta-oe][styhead][PATCH 79/90] cryptsetup: fix udev
 PACKAGECONFIG
Thread-Index: AQHbL5Ebf2/5zMzXYUe8AktAxgChGLLDu/Kw
Date: Fri, 22 Nov 2024 18:57:52 +0000
Message-ID: 
 <AS8PR02MB10201D7B22FBADEA23A776364EF232@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
 <20241105143638.2301245-80-akuster808@gmail.com>
In-Reply-To: <20241105143638.2301245-80-akuster808@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|PAVPR02MB9428:EE_
x-ms-office365-filtering-correlation-id: 670750db-dae4-4407-3b17-08dd0b27911f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Y4AU9emNQlj5Y2OxFUEubfASRLQkxpfjq6qcq0FKt0Nc719WcDetmuQdHIQ3?=
 =?us-ascii?Q?xGxHly1m6XYIrJOO8jykJkOd7pEU9gN6RVSF4bDkh2ZxoAlHvTWZrjWntkyO?=
 =?us-ascii?Q?VkyrlMZ62PtGOXjsEjvdZc/mqcj2biXbsHpOjTSaZ+T04dJXMt5v05d+gZ10?=
 =?us-ascii?Q?As4LLthqiwg7qN0YfxMe3uBTu0YkkMhbzFQoKzjZXOJLyFTLKGQ4BcoCFLU+?=
 =?us-ascii?Q?JZim0IkklPs8w1z/AOeFPv+CLLS+Tv/NAsRX1eEMZGIFkHFMvCdIPZereKjQ?=
 =?us-ascii?Q?hXLY3EUYWcgTECwbEeQr/YdguSnoCbBUp3AA9m09FjSXFaNh3dsz0RtLIVup?=
 =?us-ascii?Q?yWreJp7NOw4gnVMkNzt/DsBGjoFStaU6Um61y2Qz/eJJs9aCfgHrwbKyTOTF?=
 =?us-ascii?Q?If91g90ZymgCDo5lHcEfxo8GQEkGdmdjRvK715Uy8MiXIoB2cFgulA5Ht2gc?=
 =?us-ascii?Q?6P+fiUNr3W7AOsBoXslFKsKzRspAWwznKobo9SxNdCbzIRdmQtGZL4vDluT+?=
 =?us-ascii?Q?+feLd7alsK4Ue7U3gYeX5VEiG7/oojiaxKI4atoUQYq/3+FV/ONDzLQwDQ1U?=
 =?us-ascii?Q?9bESBa8yWpyMVSl2NX7U0D4GQiq4NT4R6c8k/8FQXSgP90TE2h4tqejUFpaw?=
 =?us-ascii?Q?x+KA6TCGT4UDYJBvc97ZPaarFPn0YyemhVVJ1S3BLN2g7IhwRQzhgHQDMKPS?=
 =?us-ascii?Q?+dF/jMVF1hsNJ6qq4ygPCmsd2tTkEoSbBA5sFodFPj1oI1Qd0KXzMZLaXwok?=
 =?us-ascii?Q?Gas+dJBhPz2V2EK7gVfrEYN5PKCZKoZWDHrz5x/NMY0YNafhYEWxQ8VY7Foc?=
 =?us-ascii?Q?MD6J2/wPbQNrNpPScWSkuyQr1zIjesz/5J0MpG3Qax7HupFRIvsbIZxOkcB/?=
 =?us-ascii?Q?1yfum7RSHWd1wNqM30l72OtJLYM6wCs+JkNSTEkZEOeAs2/SLpWjA6k6UYfc?=
 =?us-ascii?Q?AH51WLOwW3CqTWxVgI5QIdyNDRKLKLmAb9vsohUXCPh1J475cYC2X081roos?=
 =?us-ascii?Q?BwQ35QLzsvRf3wWjrWx4yv+IvJ1ywakCW320GGS8G+bUmNXcoAG0e3M9XNJt?=
 =?us-ascii?Q?MrQMmwt0jf3LY6PNsFt6hMzXRF3lZ1h7dlU/yZSHiqbZFDSd5XRXmzaVJPhf?=
 =?us-ascii?Q?KekuPL4qzdAnHvmhfIY+R1nnCXhbysz7baz3UYVPtTfvaf2K7LQ6i7LoVYm1?=
 =?us-ascii?Q?Oz7NCA4g1XnsADbN1L+FPxmp4xx3PZ3/FDT9GDH63Sep0dFvZuTUgkQD00Pq?=
 =?us-ascii?Q?F2eFKb3Q6+fvZ3BvtOCwulCyAFQEuDu4YT3tGNHphMXVDmGm7/Op1HYF6eAw?=
 =?us-ascii?Q?ISsf0Ht/OZvZVLklq/YvjtS8?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?aXXhj5Qmd+rTbC5rbkiPkyk7LM7P8rJXHAZROBjULNKOSzhXJWpSnaaNPXdt?=
 =?us-ascii?Q?y2adaRpTqXBPJN7g6GFmocx4ZGtT1ZqJ3fv90vEI5bwCdn9bjzCvIewfr7Uq?=
 =?us-ascii?Q?xfv561VQTkZLE2owg2Gz0rwnhRFnB2yaBQ5qv04BCvkRnDL52mmZePK2qTQN?=
 =?us-ascii?Q?hYe58HgWWTwDtGZxcb5I8shigrRaR2NO+tv305LOorvmXwV84twkna+Y1nPO?=
 =?us-ascii?Q?3hSWKsM1rvbnt7/b8NMOgICJ5q31o1g+whRsJ6c0oh5+x6p25eO9kkBjuTsA?=
 =?us-ascii?Q?mXkGnOWUiOUdte9rVDCIeYhQ9mDmPKiWy1WLv96QZitPd4AVp2NkvQXVSp5R?=
 =?us-ascii?Q?CJy1Mp+e4WW4O+3srHgnlSe14y7zb/VS3OvO8yKTFrgK65kf+M3k76AW82EF?=
 =?us-ascii?Q?nXIcCjqx3XfFvI+fZv/GF4sbEcZN1poeiX/JmgzBuc33YkXQdJIUAJgWd6Oc?=
 =?us-ascii?Q?w5BjvHVBrjtm0XZDQKT9oRwBdUqDw0AmSkszd66rHl1ZvyVetYnf6NkjHug/?=
 =?us-ascii?Q?8d53uArjKwaa0Ov6NAuQvuQG856ONwPuOuHQTdUri2D87vt+kcUrQyGmIgdz?=
 =?us-ascii?Q?LsL1suSV2XiP/bOxK64R3kOzlSMQL0ee4JVEXYvIk2JflH1dqXJ6K7lvi33B?=
 =?us-ascii?Q?rWMLDUZ6mY8kISt0X1RbOJm0jhrCCAox8cIyXp7bo4bWg7rdfgFbLc6An0Rw?=
 =?us-ascii?Q?UPNRFF+JiBsUXY6L6iornN/raU4oPcSXyHRssB9uX9CTfvcY5i8UkNi9jnrK?=
 =?us-ascii?Q?+2oJIBWtlFiovAwFlTLuX698uND5ufPFsZDtmX6Zpg9t9CtBo3+hBjuZFT5k?=
 =?us-ascii?Q?fcS/eOI3DF3VfLpNs0HwXBqWkO2wr4HIXJjg10sNwoBHw8yOYJs8Ev3/oDOa?=
 =?us-ascii?Q?PcKLP7WayHhHr9pJXWbuJdjYmb7f1ObGojFT9bf7Rlfef6OxNBrzrOaME2XE?=
 =?us-ascii?Q?sGI4RePAX5l1zKj3yWbc3/y2jeWkyRj0D5Pd+Bo8QlirbMnv1g0ErgSxlYgg?=
 =?us-ascii?Q?lBy8BR7zRP+5lfeEreKCXGA+jRpiW2MhdmthvepivAIa+k4xkR7sV/dG2OGi?=
 =?us-ascii?Q?iQjUqqQf8wg3B5PJffOkSvpQXCKRwR8e863QOZmF+So0/A8Qu4mMXCw/mBaV?=
 =?us-ascii?Q?yE5TTfaGLwDbaopwpnTLZBhUbvAvAXEzLVtbAiaLKjDbrg3EwNES3AqqOO5l?=
 =?us-ascii?Q?jwAjweWYbEQbWVvT0IpgItDSCgk2FYVtlv/CPylZOtivyAXCooVXkfRYqGYg?=
 =?us-ascii?Q?xusicUDq9sYk0qdl7HaUxYy/cyK9M3zloOhu2aURfjzDCrGCh8sQA89bTwOQ?=
 =?us-ascii?Q?rZ2MNGsWwPDwf6YAu0DRL0wAmrqSmkfsMzUQ0tSQwd+tdE7TgGF4HijesU+S?=
 =?us-ascii?Q?B7ZV6IWcffQCIjIoBnSZBcr3K+ZB6xBQ1HLmMTQ+jUaccNmBhZtBVHaW6QEy?=
 =?us-ascii?Q?PemKlkD52m+H9Ir04nL5RPeRdZZviyQBJ6M5taKaKjt8opIvrfrSwZCtLwgt?=
 =?us-ascii?Q?EYuIl/49w5U8M8AG17gbNpWham3JsMMzpAnFXXepcBonYJ9uqBGtYg3RQGDt?=
 =?us-ascii?Q?j5DoD3J2PvhdJCrkAgw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670750db-dae4-4407-3b17-08dd0b27911f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 18:57:52.2583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ti4Ywjjj9dFs11xAbXfMUe9WCgd3IEM10bdnI4ClpUmmmPlXOzOxV/R8cKKNwYY3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9428
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 18:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114005

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Armin Kuster
> Sent: den 5 november 2024 15:36
> To: openembedded-devel@lists.openembedded.org
> Cc: Markus Volk <f_l_k@t-online.de>; Khem Raj <raj.khem@gmail.com>
> Subject: [oe] [meta-oe][styhead][PATCH 79/90] cryptsetup: fix udev PACKAG=
ECONFIG
>=20
> From: Markus Volk <f_l_k@t-online.de>
>=20
> This commit removed the lvm2-udevrules package.
> [https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&i=
d=3Dc37c867e1adddd6fa39cf3f3d4c6688ea6dc825a]

The change below is broken unless commit c37c867e1adddd6fa39cf3f3d4c6688ea6=
dc825a=20
referenced above is also backported to Styhead, which it probably should be=
.

>=20
> Align accordingly to avoid error at do_rootfs
>=20
> Error:
>  Problem 1: package udisks2-2.10.1-r0.corei7_64 from oe-repo requires lib=
blockdev.so.3()(64bit), but none of the providers can be installed
>   - package udisks2-2.10.1-r0.corei7_64 from oe-repo requires libbd_utils=
.so.3()(64bit), but none of the providers can be installed
>   - package udisks2-2.10.1-r0.corei7_64 from oe-repo requires libblockdev=
 >=3D 3.2.0, but none of the providers can be installed
>   - package gvfs-1.56.0-r0.corei7_64 from oe-repo requires udisks2, but n=
one of the providers can be installed
>   - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcrypt=
setup.so.12()(64bit), but none of the providers can be installed
>   - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcrypt=
setup.so.12(CRYPTSETUP_2.0)(64bit), but none of the providers can be instal=
led
>   - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcrypt=
setup.so.12(CRYPTSETUP_2.4)(64bit), but none of the providers can be instal=
led
>   - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcrypt=
setup.so.12(CRYPTSETUP_2.7)(64bit), but none of the providers can be instal=
led
>   - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires cryptset=
up >=3D 2.7.5, but none of the providers can be installed
>   - conflicting requests
>   - nothing provides lvm2-udevrules needed by cryptsetup-2.7.5-r0.corei7_=
64 from oe-repo
>  Problem 2: package gvfs-1.56.0-r0.corei7_64 from oe-repo requires udisks=
2, but none of the providers can be installed
>   - package udisks2-2.10.1-r0.corei7_64 from oe-repo requires libblockdev=
.so.3()(64bit), but none of the providers can be installed
>   - package udisks2-2.10.1-r0.corei7_64 from oe-repo requires libbd_utils=
.so.3()(64bit), but none of the providers can be installed
>   - package udisks2-2.10.1-r0.corei7_64 from oe-repo requires libblockdev=
 >=3D 3.2.0, but none of the providers can be installed
>   - package gvfsd-trash-1.56.0-r0.corei7_64 from oe-repo requires libgvfs=
common.so()(64bit), but none of the providers can be installed
>   - package gvfsd-trash-1.56.0-r0.corei7_64 from oe-repo requires libgvfs=
daemon.so()(64bit), but none of the providers can be installed
>   - package gvfsd-trash-1.56.0-r0.corei7_64 from oe-repo requires gvfs >=
=3D 1.56.0, but none of the providers can be installed
>   - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcrypt=
setup.so.12()(64bit), but none of the providers can be installed
>   - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcrypt=
setup.so.12(CRYPTSETUP_2.0)(64bit), but none of the providers can be instal=
led
>   - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcrypt=
setup.so.12(CRYPTSETUP_2.4)(64bit), but none of the providers can be instal=
led
>   - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires libcrypt=
setup.so.12(CRYPTSETUP_2.7)(64bit), but none of the providers can be instal=
led
>   - package libblockdev-3.2.0-r0.corei7_64 from oe-repo requires cryptset=
up >=3D 2.7.5, but none of the providers can be installed
>   - conflicting requests
>   - nothing provides lvm2-udevrules needed by cryptsetup-2.7.5-r0.corei7_=
64 from oe-repo
> (try to add '--skip-broken' to skip uninstallable packages)
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 1ca8df16af411871e10f268064570146cdef54cb)
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb b/meta=
-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
> index 54b47ea3fd..60bf501eb9 100644
> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
> @@ -53,7 +53,7 @@ PACKAGECONFIG[veritysetup] =3D "--enable-veritysetup,--=
disable-veritysetup"
>  PACKAGECONFIG[luks2-reencryption] =3D "--enable-luks2-reencryption,--dis=
able-luks2-reencryption"
>  PACKAGECONFIG[integritysetup] =3D "--enable-integritysetup,--disable-int=
egritysetup"
>  PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux"
> -PACKAGECONFIG[udev] =3D "--enable-udev,--disable-udev,,udev lvm2-udevrul=
es"
> +PACKAGECONFIG[udev] =3D "--enable-udev,--disable-udev,,udev lvm2"

I also have a suspicion that this should depend on libdevmapper rather=20
than lvm2. However, we have udev support disabled for cryptsetup in our=20
environment so I cannot verify it.

>  PACKAGECONFIG[kernel_crypto] =3D "--enable-kernel_crypto,--disable-kerne=
l_crypto"
>  # gcrypt-pkbdf2 requries --with-crypto_backend=3Dgcrypt or the flag isn'=
t
>  # recognized.
> --
> 2.43.0

//Peter


