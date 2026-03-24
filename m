Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE0CF54AD0
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 15:40:10 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.411.1774366806094286044
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 08:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector2 header.b=skYA13H0;
 spf=pass (domain: de.bosch.com, ip: 52.101.83.65, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5rEDPBImeRdP/NLjbmUW8BsAOwAFI3LZCAqsqtAVnjExbBkClutl3sbYIPHWL7PdPBzdYD4OFtjwkRiVEpD0hf4iGtlJxV4vT4Fd8ImrDHaikNu5rE5seK3Dh4QFajAT9TaZorPmv7XfOSRg+tDQ1DUarDR5GVQyNlXSfNdHC+1hnXNuSHiyG83Tzl/zFdv7a6vZBCtdoagl5k8c7gq1UysGWFAkYCxhnPtd0FjVuAo9l0aSo3wBfDYWWHeWj6D5bayUTEPpppBPm3/Qt1bvYUsvBYRVFkk7zVTyKNovqVpAycSwlM0c2Ctu+2VekfWSe1Xvm/06e0Bim6ZxrOOJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VO6vnuhlkocPm02OWoIbOmFv4RUtB+P36VqhgXbkiM=;
 b=GQyXbUqgQ8Fl3le+J54YVOOtKTNSPz6+15LJDRYhClaIbiCxEDycxKr6FDOfWAPJ4W+7zudBOZ/d9rblAHqN5bACPygO3mgiWU9+gRS18Chl4Gs/XSdzuSuu0D/xu22XDU8vTvApp8wX9FNB9SbHhgCyDKqEaJAr8mmfn7avUa/6CCgnSyDc6r1zSa4cYsefZwSHH2nP5zxSwclPM9ZyBuPtnyz6f3kss4e6SVCPmTH9V+108ujA+6T1Iz8tiPSm/WJZ0uGkETgwrQxzhoWEynaKDuCTunIDoT5pDwJRF2dCnLNSDOUdbd+rzkNhZolBeJOj4Lr3kFvxYq9KvroRPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VO6vnuhlkocPm02OWoIbOmFv4RUtB+P36VqhgXbkiM=;
 b=skYA13H0AikvcpUungilpkAtZMxlMvrTdlzVeQlcEPRp+70JV+SmPhO97bG07blaYWTVtvvdKThcoDO4Yr55tpPuELvTDqZ7gQSxR5H4IAdpHbNualyBT6za/Va28oEZabU5Lempd5+qL+i9rbhFOjv7jf68UMUvHF8rSdscgrbbtLVqU6YbSAQdEOKIQUYAAW/sV19Ezov4/r2p3FJtYwwdmCREUxZJBZyX/8wV97LVgJ2lcDpPhfZX53eZv2q/KkXuxYtfbGHpXgOnh2ZqNYYN3bYQj2ue+7mVkw3joyPIdFf3scbnHd7BlOZvVgtAnfbiSSmySb68sowDXLDb4A==
Received: from DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:338::11)
 by AS4PR10MB6256.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:58f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 15:40:01 +0000
Received: from DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5dd6:d284:1ca8:ee9f]) by DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5dd6:d284:1ca8:ee9f%4]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 15:40:00 +0000
From: "Jonas Mark (BT-EL/ESW1)" <mark.jonas@de.bosch.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>
CC: Khem Raj <raj.khem@gmail.com>, "Simoes Ricardo (BT-EL/ESW2)"
	<Ricardo.Simoes@pt.bosch.com>, "Jonas Mark (BT-EL/ESW1)"
	<Mark.Jonas@de.bosch.com>
Subject: AW: [meta-oe][PATCH] libgpiod-1: Inherit python3targetconfig
Thread-Topic: [meta-oe][PATCH] libgpiod-1: Inherit python3targetconfig
Thread-Index: AQHcu6EhR9rbJs6MHk6+ZDl1AKp6X7W9z+Sw
Date: Tue, 24 Mar 2026 15:40:00 +0000
Message-ID: 
 <DB9PR10MB53548C3E8FD18A4D17FA6E4EAD48A@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
References: <20260324151508.2702-1-mark.jonas@de.bosch.com>
In-Reply-To: <20260324151508.2702-1-mark.jonas@de.bosch.com>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR10MB5354:EE_|AS4PR10MB6256:EE_
x-ms-office365-filtering-correlation-id: 4c0143d8-5b29-4c62-f163-08de89bb9c55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7053199007|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 6kcM2fuOo9dYErMmvoRPUBe9SenCebuLxLvaa5bfiZodN2wAlEhVX4FkdK/3imbHYWtleMlCEzDu0VXaWmX4Dx7lmYD++XaD2go1lQ4jtKzTcn0CZILyQbqjwwFe0XN6QlzJxuuOQy7ieotLxdrNrQ9uuhNMpTOLd6Gz6eeQh1Uuq8KRd1pTPUiktXIpdnSPBrnMD7yFcq76slaBr0YQ15l/cVfbvN/m2FOShPOCLZ456az2yZ47xvIvk8fKI9xXsBu3Nm+ljCy8fE39SMvYM9YReHcjgbH8CmJMz1QwuIQ8P1i5sDLDm+4d2cowSjpIX2L/9+Renew9JPrOIMFvPCafyHcZgfAbUxdi2swXh/n9yFa/LLRDE2YB3IuSjjqlA8Ou/orBZaeKas/RBiN6ZbYpvNIGjhAFMwrhXmaPbOlAM5cV1QmdHJpl5DijRdDW+O2TnbFYdy7H98VHvgLOw02WJeDOSI7xLnSWlxrg8xK4i3Rdsj9abUXSJHDHw/ypvYNHBmsklKW5FFZ05Z9PoO5f48qhikKMUsmxdruWncWLMyAUJKuR7T3dOH9RnBJOY9urzTZBA3uIuRXaEDnPbU7UzzwmTQKfb2Z0MCKV6jjkMQBKHdYe3tfxG9/vi0UWnWzUAwZtZIayeB1nmos83eTChZ9DDNnjgxDWvJL6/lVZgIwpGy88tpa7pcscyvdKPH/gCDnoDUOV+oKrsNQNGgsjw29RS3GlzQd4lnoNA3viT34O7SnvDtT7/lw8b1hgwLdeZwd+8yczD9+RDeemjU9qsV10D/60Q0HTcyUsshY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?8oIW0ffjyaMBXg+/QgH2cwuPWU8/0UtGr6cJBjSb/H0sfQIJK+UlE/Y/63?=
 =?iso-8859-1?Q?DD99RgbP4KGOKPyZ8foSNa8z+ApPI2awXVWOmd5W4/rbbvSQm165ZTF+7R?=
 =?iso-8859-1?Q?d7+q1Rt4vepMWyiuOzh3rB3vz8U0YseJl3kMNofT/Hm398/BY9TUbK0N++?=
 =?iso-8859-1?Q?zoczulnwocmDlzXzRRji48C1RIF/eHFBm0PVoJHU9N2Toa0v8XMsVx/ebH?=
 =?iso-8859-1?Q?6UeXMLrwzVLALlWv1x8SjNLNuJDZP/A5Y08CUl3wlR0oSL9yQEU0v9vEKs?=
 =?iso-8859-1?Q?UU33xRIKI7fxSd6tXy2vDq7lei0ra5PdQqKcH1Mbs2FY/jtv4RcdyoAlao?=
 =?iso-8859-1?Q?YhyIl6TRmjtK6aKMsLvuKLQG1rWeWq6VZLosJKMGxIMfX4NohFmsqHGSrM?=
 =?iso-8859-1?Q?D2AA86MFD13CfyCHSUd/TQwWP0q3SGmekW+vmII5UqoQukR6EhYIuNjHrm?=
 =?iso-8859-1?Q?XWLMz4f+QVhAK8jv9ImtdVENUPUk1r3l88v/CPgiK4O84p5eh7CrHrDXH1?=
 =?iso-8859-1?Q?CsiJADSUXcAcJ3T4gEFMY9CphXKaFPZUiyjYOhJ7L2+Ndi8o3ovID+5wW4?=
 =?iso-8859-1?Q?8ij3fxW5CrYa9P0U+rnOmI0hjQOS7Ds8XlW11Z7Iumsvx+oGKv2kS9iO+/?=
 =?iso-8859-1?Q?kUn26d6gb/tGIMl/dnQyCXjDaWym8ndWaOG1LvFBL10EX5QrClZ2Mq07aA?=
 =?iso-8859-1?Q?Nk+eJH1i1ZAGcHFIt6Sr0M5kOCOBBvqIzRttxDeVP7Qi+JBYzIJDK0CvHr?=
 =?iso-8859-1?Q?bx0XU6nlqWcxr4rGFzNzjbZsiuyX4a4SgannQwHTW/Lbu2VGmHYXWwXh0Z?=
 =?iso-8859-1?Q?EamBseTIi70TkS7mRDHagQqYggCKESlmFijP3MSdPcEx8c/m/eud8neTZn?=
 =?iso-8859-1?Q?ig440/3kwqDEDQVVbKt5ftn95hhRNv1y9ref4BLxhfQxA8kXeGSRuglTvX?=
 =?iso-8859-1?Q?Saak3rPivIHfgAEc6uY6kdPNvMl2eOteSJRLSeeLaXqUNvbQDZcrSa9vYi?=
 =?iso-8859-1?Q?PhLCyYT/41BUnaKNXhiYuoyZoEeTVCueTi0YpBSS1mx+c03qukmeohOuca?=
 =?iso-8859-1?Q?vVvU9kE7CLHOPCUOUge+3BEjr5lnaYG4wu6bCI+OlOP9O7j/zVkoAz0ncc?=
 =?iso-8859-1?Q?uK0neFXgS6/O98SEdOTxxZ0i6qlksN86zVcBndEEb9KUifAVErr5xXS8hA?=
 =?iso-8859-1?Q?3IuP94NmNOo9HAk6slvLSmk8G8uZNqCl/q+If8CJfDONDn7/KQvkuqmYVr?=
 =?iso-8859-1?Q?oaOV/1+/MGdyIBU/TZ1Jyf9YRZb/QRXzDokC262jHVu0l+i+VOdBxOMbph?=
 =?iso-8859-1?Q?h0TwG3iOK4dWJhOP3X2YwRYJMyG0jjQP0gm/2Z6R89L/RR9lDBwRCbOZXO?=
 =?iso-8859-1?Q?RgvRn1V2llsWfl2CDM39vAWZBmn9L/fcku8/v8kNRVX/85PeJQMCSla1R6?=
 =?iso-8859-1?Q?9kc8/0cmMALUcMeD878dKHRtQRWMIhem2qioe0L/mWS+wQqrgs3eSBf8TD?=
 =?iso-8859-1?Q?tGdOrejOgQ4cYIx7SHGAy3JeJRhF448bVeoJEm8qHErr9xGYegT9T5TpGY?=
 =?iso-8859-1?Q?npDTguheuSKTEiu98aoUDAVh8DUC+tvcBdVSzs2AcBjkrMR/YhSW04FcfF?=
 =?iso-8859-1?Q?vUl//Mj1I7D8Qxxutv6MhNIZFQ/2C+dfO5KR7v1ApVV6+2dNukUsO+XXyR?=
 =?iso-8859-1?Q?CH6L6Ch7FnlKkfLV8W6lEYWy8N6/EGBXPld3auvVKpoxFyYb8EQ3o69wbt?=
 =?iso-8859-1?Q?Vh9y5dseH/cj8yiMuGD9lAQq2FOAsGmoxv5uQn+3xJSuP7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0143d8-5b29-4c62-f163-08de89bb9c55
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 15:40:00.6989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9xUn7bFTkGUjnSfMhLmQQFPCeUZ9vQy4M4eUFGjP3RBQ48AUvq+JAYxOr8oSEsmy4HxgMBoR7pe7ADIopfVaAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6256
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 15:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125577

Hi Bartosz,

I am sorry, I used an outdated email address of yours. I hope I got it righ=
t this time.

Cheers,
Mark

> -----Urspr=FCngliche Nachricht-----
> Von: Jonas Mark (BT-EL/ESW1) <mark.jonas@de.bosch.com>
> Gesendet: Dienstag, 24. M=E4rz 2026 16:15
> An: openembedded-devel@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>; Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org>; Simoes Ricardo (BT-EL/ESW2)
> <ricardo.simoes@pt.bosch.com>; Jonas Mark (BT-EL/ESW1)
> <mark.jonas@de.bosch.com>
> Betreff: [meta-oe][PATCH] libgpiod-1: Inherit python3targetconfig
>=20
> From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
>=20
> Inherit python3targetconfig so that cross python3-config is used
> instead of native.
>=20
> This fixes the below error when building on a 64 bit host for a 32 bit
> target:
>=20
> | In file included from /workspaces/yocto/build/tmp/work/core2-32-
> poky-linux/libgpiod/1.6.5/recipe-sysroot-
> native/usr/include/python3.14/Python.h:72,
> |                  from ../../../sources/libgpiod-
> 1.6.5/bindings/python/gpiodmodule.c:8:
> | /workspaces/yocto/build/tmp/work/core2-32-poky-
> linux/libgpiod/1.6.5/recipe-sysroot-
> native/usr/include/python3.14/pyport.h:429:2: error: #error "LONG_BIT
> definition appears wrong for platform (bad gcc/glibc config?)."
> |   429 | #error "LONG_BIT definition appears wrong for platform (bad
> gcc/glibc config?)."
> |       |  ^~~~~
>=20
> Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
> b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
> index 009cf9897a..583648a6a3 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
> @@ -10,6 +10,7 @@ SRC_URI[sha256sum] =3D
> "ae280f697bf035a1fb780c9972e5c81d0d2712b7ab6124fb3fba24619d
>  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}-1.x:"
>=20
>  inherit python3native
> +inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3',
> +'python3targetconfig', '', d)}
>=20
>  PACKAGECONFIG[tests] =3D "--enable-tests,--disable-tests,kmod udev
> glib-2.0 catch2"
>  PACKAGECONFIG[python3] =3D "--enable-bindings-python,--disable-
> bindings-python,python3"
> --
> 2.34.1


