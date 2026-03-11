Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B7BFCC9DA
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 08:55:29 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16478.1773219322452592013
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 01:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=YaIL7JK1;
 spf=pass (domain: siemens.com, ip: 52.101.66.11, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqvvaU6tVObL7l0fGt7UTae0KzBG2iKfstHGURSCvnDib4wR44YCzjGcd4HXfcR0wSzjC2FpxAruzavaplcomGyjl3ixVWwyQTCNly0FJW4A75gk7dvsdFh4yxg7UYXoj1yF0CC/3CKKjJIurg9HSzfpSFEfq2hsvVTCZ78Lh7KdHOXLLjUt6IaQGJzWc2PnAtknwFIMi1guXmsPnOsSa4aQ3THTEC9lkOdvQ/JdSRl4q+ypIawsdgEAPMZku7VHViruIZ4plIklw4nM4lBWCDFeIiLKTyuUkTyndfuSmUvlCwrvEr48UURI7N9e76EUq42FMipxsAQrQO9ygLn/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rq+Z+qSTlQj3fx9LplFKEvuYMzHs9FEAvuc88Fqu8Z4=;
 b=bH4Gd9fLnRXZRJWl/yiAqTTr6tfjMyZlICKKpmQjyLr8q8lvDN1dFWoJvLplCoBaZJF479wpyOSc+ch3Elc/0nBci7LmZPafu9/9xfkVGxsuC9pPHkqvuS24wJskS5tji15DHVeEcnmFS6J/VabdK45B/X9uboPg3GYxtTgWDiGAslMZaHWsk5gcUT/WHK7cIIY4by108IvGmfmTdX1YIsOscxFzsUJ+gnYn+gWNfud98khNUa021ujEVlVLZDKlu/yR2B5sTENKydD5jA3M9jDcGS9TCZ8+Q6X6Amc5xQQDkF+yqkYWeO/pgqZJWIEY0VPI69CTxxd7/oCK5d4yBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rq+Z+qSTlQj3fx9LplFKEvuYMzHs9FEAvuc88Fqu8Z4=;
 b=YaIL7JK1Aah7gCf2BnZstl8zp1rDLTk4QSaifMVyY4lYijj2rBWozjVOKlfC1OskBBd4Iu3kFgIXAKPjDPLttktV4b4wWwYZs5XQLxr/4c1hMN2dXfo7MAZjylkLdHZEE+jygfUHfetLz7UKkRQleydqLSu5whcTMApFFg78WxRAyLKR73v76krGRVjApehIwUm1RGIOp5Z9ctqs2uk8kAisOV59IBhaS2rIWsZ2kiCAfymuy0mHSA0+6doaUgdEkDVMGuWVuDDLxlKFC87yPHvQpk/CAsPzpiFUOqayRalXXgTHPU6YCPMp2PnUEyjSReHPqnLN4l6+Mya0Dyq9tA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM7PR10MB3685.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:13d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 08:55:18 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 08:55:18 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "gijs.peskens@munisense.com" <gijs.peskens@munisense.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] libssh: upgrade 0.13.3 -> 0.11.4
Thread-Topic: [oe] [meta-oe][PATCH] libssh: upgrade 0.13.3 -> 0.11.4
Thread-Index: AQHcsTAusok8DkAACUilToocueCgcLWo/X6AgAAJbpA=
Date: Wed, 11 Mar 2026 08:55:18 +0000
Message-ID: 
 <AS1PR10MB569747886A276932FC8A3767FD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260311082153.258506-1-gijs.peskens@munisense.com>
 <20260311082153.258506-2-gijs.peskens@munisense.com>
In-Reply-To: <20260311082153.258506-2-gijs.peskens@munisense.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ecd9fa84-db80-4a12-b230-da9df3f06b91;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-11T08:54:20Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM7PR10MB3685:EE_
x-ms-office365-filtering-correlation-id: 3abb7797-1175-4f48-7472-08de7f4beb8f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 
 Hli7Vlq6i8PL8xgoQ8TO7u2Hw1cLiZU7qeHgoq4oKmBbPXfKSRTpyOMoj0m2eDKblU9dTbzr1D/jLPyRK/Q87viSnNl1eBV98JWOQUcYJojv0nQ8Rk4ADgnKE+yZT3Z/BGdlnYmQz73n3Gy+DPn0gCO5j6wEeRN4Dpz2st8hrf/UvBlljcljXFVjnjXQD2Lfw7x2fWh8ACAqf8/ZLrswoyPOinubcvXkLh8+5A3jy8H9eztK3ci49aHaV02O7452cHOqjm6IS94QgVuQrZWY+Nmw/N2GmUWvtYLyhS6vRGhsi7Ks5rAE5swW08MFnFxg7diik98ufSuxdgj0aoJfuEkFzwRV0fk2vrbftTKlbeLtedpnA4sR33xj8wAiIqXVapNoqBPJYCllL5Z8zT1el/X2lyvDGaclNuHZ3fsqa0b5bBuyoc4bYxYzmgnTik54J5UzU8X56EvbIR1Gys/yZBA3Sm/HvIS4CaQclMW1MMpKpa8SNG+aFcs4L/NzO89h/TA2SHAY0Ws98htQVKxlJJ1BwBrs3AdzKxCNJ3XTUSK84lAtxFV3OJuAcs6CateD602aHtgGrIytnYEZRtFoDRhbnmX7M+a/4dS9N+hiJb3zRIqBk+rBou80J7Sm5tubcKrR4pAc3lzbiqEpKaz6Yn2X6mP//Lt91Lx/7YNyIZAVcxHnIQg5LeDfKRfo1JZ/vGIGP6RRyeZUDlmpYFWjYSZYTzGCy+I8sIgC+JFwvkn3dpYwXDocWKG3Fmxm7r7cBuIkbTmwCkr/RmI66U46c7Lzr7A4WGdQkrPmZxK51Xg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?bFCzDBrzjPJv18vHgWs2pbwmJT1xFr7P5yIfzq5w/xIjdmjjclC8T3+OVogH?=
 =?us-ascii?Q?KmuIsRRpIWd2bw9cmPWAiULpjY/wvtLBVGopf+Gl+oIo9yL4GKJgMVBLHnhP?=
 =?us-ascii?Q?H2gYRTwdOzkMLt4g51Ee5bHRmo5c6dsSvxh2XmC/uI5lzCJtd9sJsDWclxVA?=
 =?us-ascii?Q?VBtHzdiVqq5p2wTfQGjQPK22iZOmprFTG6Nb1maBbjZsdC8kE9YEwvJrbT5z?=
 =?us-ascii?Q?eV/SqwEtYyl/z4BxPg2euRhxWw46HirAsvD2q8pFWgSC5tpV2avlmu2qPItw?=
 =?us-ascii?Q?O262zUDSeoHB0T/unFbrNSHp3MtMhZTDXkQexx8awMutaL4UL4lhtR6C9EIE?=
 =?us-ascii?Q?hkyK0bpXLcskAL+IKfEz3cfwMUO/HPH8EJwTvHdPZ6uuDfNP6n8hMhJ6/RS1?=
 =?us-ascii?Q?iytmkHVLSHdsn1AOUazPhA1o0Yb8W3ZXLgPkXu4sTAI9ctEefV1VpA6DuCDy?=
 =?us-ascii?Q?wtWSW6onoeKZOKj/OUnhgk/OUSzbcvyqGSbngRYBttZa8g8RNtrUP7h0gG19?=
 =?us-ascii?Q?kNUZgB7x3ieyEg+qlOb+TCexAmBYfIs1CwpVOZiU9rNkyEQNnTxuwBOxUIRd?=
 =?us-ascii?Q?MTwKc9Q+zXsT3lJ50UxcxLne9UJxb2Gc6kljMfI6VZa/r8Q3AoJFez7pIUSm?=
 =?us-ascii?Q?zjCvQqav57AZj4KV4MMYNU/DcJ2ogNVeRr+Ukh0U88ne7DK+Xd6EkZuaFjWT?=
 =?us-ascii?Q?PqOSPt43QRRWhzcJBKGH1KiPg//7vZbm5REM0u33m90KpqgG6xP/a864ZWEy?=
 =?us-ascii?Q?ZORX28S929eHDCpZYQt4pPoLWXbYd7GSRPyW3hJpEMKWJVRJtl3nvFJ7iard?=
 =?us-ascii?Q?uxKnxEgEOu6XcC0WoxndNITeRbOanDIVSIcVRs3DPPRAg4ahwUFT+Tonayo9?=
 =?us-ascii?Q?zUdFQPH2FACiUokZI0Wn7d/NWGcf2FExGxb9tPRBs3CHnVdF6ZbGz0S9s5Pc?=
 =?us-ascii?Q?HezHpzU+TkstLiotP8ZMNM4e0ZNI0YD7MxN6ZsmFlqGuEc6RozC/PPsNU/Cf?=
 =?us-ascii?Q?2XwJnSJJGMq362yZh+mdd+fmeK/6mi09sswwdvb3hI2k6gOB8qN+8efRDT+U?=
 =?us-ascii?Q?Os7KrnYVIzUT1T99vVSWetkCmYXyzMEQo+S1Jpn2fybySwY+Ad1nJIlukSve?=
 =?us-ascii?Q?/UdGpDHnAfUZ8fCvUAdlxX8ai0eF/hAjvWb8mtzMui4eXOUsbnEhZX3VDM2T?=
 =?us-ascii?Q?M/19HSWn2zBTOqSJ4s45S+X7yqJD1lUgGxL1BKvpcUrJXnwqGwwDSiJAk/7t?=
 =?us-ascii?Q?ijlTKjurQWXZia1ZzZX6Y+rqQH7auCYQKdqADXAcvWrkpwVEoCLUmtsI4NGf?=
 =?us-ascii?Q?LhXzSbTvrT9rD5kVKLW9L+awowIXgaJO7tSuDl+D66XqXoYyeeeWsotDiXzq?=
 =?us-ascii?Q?w7cxxuQXCdztvcgB+6Hgk2jzgpJOf6oCBSSqw/gU9updMeVlqFcV3BHzWF6a?=
 =?us-ascii?Q?b4eeEGmb42lcAD4/rT6gM6eUCLnppXylMmBtudQKayrkA4jO1X9V0tlS3B2J?=
 =?us-ascii?Q?Gg8nRPC/0PnpCf0SJrMp6CRImeW1l/ytO/jmiDrgYHDtQmhYieuYzEVf9PKf?=
 =?us-ascii?Q?FrpMXaGFQTdXl5jNjyYFYDW1mfWQut6ZuP2X7zSai+dkCZ6S4T2vXfLeyaSr?=
 =?us-ascii?Q?goLFnBAOoKZqQqNcFDetYGgh1YPVlkBV8TtDH/vz7ZBNyQs0DQ05BLxPU2dZ?=
 =?us-ascii?Q?SbDqyCzFZ3lqORfoK5gIreRTK95mTpSFrb4HROtRoA8t0f3YsfHlqs1L1n6Z?=
 =?us-ascii?Q?Wcroi03H+w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3abb7797-1175-4f48-7472-08de7f4beb8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 08:55:18.3547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +KCRTJyi8aK/saE9M59puWY5MpQoOLXPBtsx5+QqI/t6ko9mD80EkPtFLGvznko4X52AJwjzohgWeSK+JVxqeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3685
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 08:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125072



> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Gijs Peskens via
> lists.openembedded.org
> Sent: Wednesday, March 11, 2026 9:21
> To: openembedded-devel@lists.openembedded.org
> Cc: Gijs Peskens <gijs.peskens@munisense.com>
> Subject: [oe] [meta-oe][PATCH] libssh: upgrade 0.13.3 -> 0.11.4

Typo in version - 0.13.3 should be 0.11.3

>=20
> Signed-off-by: Gijs Peskens <gijs.peskens@munisense.com>
> ---
>  .../libssh/{libssh_0.11.3.bb =3D> libssh_0.11.4.bb}              | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libssh/{libssh_0.11.3.bb =3D> libssh_0.11=
.4.bb}
> (92%)
>=20
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/re=
cipes-
> support/libssh/libssh_0.11.4.bb
> similarity index 92%
> rename from meta-oe/recipes-support/libssh/libssh_0.11.3.bb
> rename to meta-oe/recipes-support/libssh/libssh_0.11.4.bb
> index 5928581312..fd4631cc55 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
> @@ -13,7 +13,7 @@ SRC_URI =3D
> "git://git.libssh.org/projects/libssh.git;protocol=3Dhttps;branch=3Dstabl=
e
>=20
>  SRC_URI:append:toolchain-clang =3D " file://0001-CompilerChecks.cmake-dr=
op-
> Wunused-variable-flag.patch"
>=20
> -SRCREV =3D "301d0e16dfa8a5cac1cff956b6880ca90eb82864"
> +SRCREV =3D "ca9c055d7c78ce357346ac7c2b14047568d47aa1"
>=20
>=20
>  inherit cmake ptest
> @@ -50,3 +50,4 @@ BBCLASSEXTEND =3D "native nativesdk"
>=20
>  CVE_STATUS[CVE-2025-5987] =3D "fixed-version: The vulnerability was fixe=
d in
> 0.11.2"
>  CVE_STATUS[CVE-2025-5318] =3D "fixed-version: The vulnerability was fixe=
d in
> 0.11.2"
> +CVE_STATUS[CVE-2026-3731] =3D "fixed-version: The vulnerability was fixe=
d in
> 0.11.4"

This should not be added, NVD has this CVE marked correctly as <=3D 0.11.3

> --
> 2.43.0


