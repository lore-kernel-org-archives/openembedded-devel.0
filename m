Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD7DCD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 12:31:50 +0000 (UTC)
Received: from de-smtp-delivery-123.mimecast.com (de-smtp-delivery-123.mimecast.com [194.104.111.123])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11005.1779280220199385706
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 05:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@non.se.com header.s=mimecast20240503 header.b=JJuzYEMw;
 spf=pass (domain: non.se.com, ip: 194.104.111.123, mailfrom: felix.piedallu@non.se.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=non.se.com;
	s=mimecast20240503; t=1779280218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=atG5hBJ1OM4FTTUh4pWOYthkfqxWISLPtZRPV4eyrG4=;
	b=JJuzYEMwG6t6yBHxdHhCUkdn/p23VEW81M8QKb5zv8WqL6cx/PMDBZRq6/z0fHoo0Sg2sA
	YLrsLvxCAOxD7az8tqS7e3Hi3/O99e33KOipwEPQuG1ewRPnYkkdJYB64oyXLspng2XzRP
	zU6V/MsHUYGBspBP7YuUx3YVlWCKekGIVfrY44ZJ1iwgsIAnlZRqcprGilaPktrYZGF4Ci
	8BCC8EeZ1wP6Zgaqrmy/+OsH3IpvJ6MW7f1Z9xSVExZpVqBmo/trrmUUbPzJRqv/LGsAti
	MbefIgmeAN9rVtPGcuygOpchUvdDQV5/zPdD5Ns93sVICvUDGbL3kpvV0Td4hg==
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010012.outbound.protection.outlook.com
 [52.101.84.12]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-2-d2OKVjegOKuFI8E3UEYtow-1; Wed, 20 May 2026 14:24:05 +0200
X-MC-Unique: d2OKVjegOKuFI8E3UEYtow-1
X-Mimecast-MFC-AGG-ID: d2OKVjegOKuFI8E3UEYtow_1779279845
Received: from GVXPR04MB10432.eurprd04.prod.outlook.com
 (2603:10a6:150:1e0::17) by AS8PR04MB8962.eurprd04.prod.outlook.com
 (2603:10a6:20b:42d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Wed, 20 May
 2026 12:24:03 +0000
Received: from GVXPR04MB10432.eurprd04.prod.outlook.com
 ([fe80::b697:7b78:fe36:bc1b]) by GVXPR04MB10432.eurprd04.prod.outlook.com
 ([fe80::b697:7b78:fe36:bc1b%4]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 12:24:03 +0000
From: Felix Piedallu <felix.piedallu@non.se.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] lvm2: Do not install sbin/dmvdostats to sysroot
Thread-Topic: [meta-oe][PATCH] lvm2: Do not install sbin/dmvdostats to sysroot
Thread-Index: AQHc6FNkV7syS5sk/UumDjGU2lhRPg==
Date: Wed, 20 May 2026 12:24:03 +0000
Message-ID: <GVXPR04MB10432611A3D1366A242AC4037BE012@GVXPR04MB10432.eurprd04.prod.outlook.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_57443d00-af18-408c-9335-47b5de3ec9b9_Enabled=True;MSIP_Label_57443d00-af18-408c-9335-47b5de3ec9b9_SiteId=6e51e1ad-c54b-4b39-b598-0ffe9ae68fef;MSIP_Label_57443d00-af18-408c-9335-47b5de3ec9b9_SetDate=2026-05-20T12:24:03.283Z;MSIP_Label_57443d00-af18-408c-9335-47b5de3ec9b9_Name=General;MSIP_Label_57443d00-af18-408c-9335-47b5de3ec9b9_ContentBits=1;MSIP_Label_57443d00-af18-408c-9335-47b5de3ec9b9_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR04MB10432:EE_|AS8PR04MB8962:EE_
x-ms-office365-filtering-correlation-id: b6af95de-c7fd-463c-fa9f-08deb66aae0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|11063799006|38070700021|56012099003|18002099003
x-microsoft-antispam-message-info: TnDGkwPO2Ggf8AiCeQf5RS7sjb1a+hxfkh2f+RiLneI1u3ToNwztZMClOeYtQeAD5+VOF/5PcEM4GRTxog2rmMsT3OIG3fBd2MHse8bWvthETJIG8kCnIPXDdx+xSGwpiomZvOTz1wpJHqEbRCHubUTv0lwOgIff1w2kBdi4up8t64K9bP5z4Lr+v3CQkwh9YE2VBRH4fWbhfwqPvzRlBi8ZAFc9yH91AxeNPqhSkbpceVToBkKlTE+fWRLDvMxLYt1l4l+WVOJ+DLtokbhAdMdd7+Qw8yhxZulrldsUy/wQ2SyjSWzybBLsCIoYEjOyNPU7ExTdYRIp3SaQgbanE9CK5Q6Vvh99Ja/MhcJojh13HWQmaFiy7P2wrCREbauGD7RudxayZDucVPVECx+iveFjodGYm0d9Xqs3iOHVNgocFVVxIhDQNY05yN3I5mNGeOFiC4lKtUkDfYZJ376Agw8n+3DRegfv2Xs9EbAyENXRZ3KaCp/n97jmJ8YtoCs6BsDC+ZolQHPAraQRge155b9vZGP6D29txmsEQvLbrEGnbvmbkS7e/v5f5AHxah+w5Tx/289U+hDoUDDZ0/mWKlt9UcnH9G0banQUbBNavl09ZzRjk5u0m4PXITST2aq7+M9TT4E29fhLtdIVmobnzfZzubUwIqLOhL6xPxwxEUiICMQmHNCBQmPyPcmFAC1Aul9p+3WosxWJfNGnYS2x9+dWbEnMzE+4SZFEEvqdExQ5lfY2ZQ/ivn6QtEiFHa32
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10432.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VZDkPfX0ZnD0Y0sTMaLxUFHi9HcvZDaF7tjnH7l1pyuA29CInpE1bMWM5J?=
 =?iso-8859-1?Q?HASr7ATP+zezfzDCCVJNXgr/4ql5AWAhQtk4t3ZOX1hEd/5bIyR/3aCUOr?=
 =?iso-8859-1?Q?tY1JvybUbB9fETohFr/B26QZ0mefCer7otKsfRIR2teOBKyXFxjY3okiP2?=
 =?iso-8859-1?Q?b7rZR50RbpMdAKUsmTcClCzdx+5Yl+sVP/TkGXLnlnWTWxDSKTrgE/Cjs9?=
 =?iso-8859-1?Q?I0vhPh30Adwyd7qlGW607V03w16HhFxEj+dx0Ck4T0o6HMdMdqxjDKi97i?=
 =?iso-8859-1?Q?mAQRWZBZ7fVP+TSe2BsZ3n5UdarLZgyb7SZcUU6GQD/80jJ6wNegQ1vrGZ?=
 =?iso-8859-1?Q?phRdEAMvc+11OFTB/zB8lIEheq6fQs9mj68O4EqhcWDsYVzjHum3+796WS?=
 =?iso-8859-1?Q?n2k0bHZijbOE4+TMkKDQpQVnpxW1AT3yBICvYaq3Ma872Tj/GKGMP7NhSm?=
 =?iso-8859-1?Q?geH6C1X9JvwRjUelAq3P3MuvKl+cK0YXZUu2sz73LdJMLfZ3EO1ZN22Bg3?=
 =?iso-8859-1?Q?SDsdrpniCz+FHKBZc74jpkbf8hqtfhOxzBsYFIjS8ANCylHviAdI3M5GjJ?=
 =?iso-8859-1?Q?XcEpI0JOnUyU4XHMNqKMXO6cIT3JjIKIMEeXO1dhvDqSJHjOr2MNNQXepX?=
 =?iso-8859-1?Q?BGkWPWoVJpb6YTQxLkzuaMytPlb7ohRiBEWdLtosMgG8QIG/tEP9ZnlXz8?=
 =?iso-8859-1?Q?/6kgAeZAu0+s8+sSqEBfG3rP42BdOB3ggYx+QCtkVbPX51/devCvFIOPgk?=
 =?iso-8859-1?Q?4vH2B6Otk4DxSxzGhI38H/LppPXkCPgBuMRNPuM0vyOmYrzJ75NWkPlS6m?=
 =?iso-8859-1?Q?kBwpf0bspH8J7kPTwHn6eelazVNzsyZpRTfK+ZFVZTXULUPlO8SV/Qp3yV?=
 =?iso-8859-1?Q?bsU8gV4j4TFS6utaWcu9kVlg69NNqD1wPf1jIzysx74FYhgmLe6nMb7ONu?=
 =?iso-8859-1?Q?OrazbEks3NbfWtUGfvPX4mVryHxM0pfXM1WOq7N+FToeIDmNTKQCiFiYoC?=
 =?iso-8859-1?Q?3OokN+rcFVnabcFCjLRl3eC5f5J5NM3kR/OlrRlvhRh421Jm+444r2pPjY?=
 =?iso-8859-1?Q?gRb7toOPcmswBAfzhGuzKYZbHmcpagPJb/M5U03rt0QKnevg2VPKaULac0?=
 =?iso-8859-1?Q?ZDuoKAO3G8NqO34QkDhI5fa/GT5c/4FNSddIAskFSHVtB03VBlc6PRT93s?=
 =?iso-8859-1?Q?gUZzVNpKJ8Iq392zWZO5UdRLiW2LNfUI3pGHQ1IXmwc4vRJASgvro4453C?=
 =?iso-8859-1?Q?6+BxPyS7sdpq4NWLjdfGQG2ZcRvgiyM+rVoYIRIzT98xqZhhHLej1q086h?=
 =?iso-8859-1?Q?eTiVtKBwq8u2yi37JU8l0mOZrF5Iga7ayVAoaA6AAlVLXsG+2SiBIyE5VQ?=
 =?iso-8859-1?Q?ZiJBK+pZbxaXJRG61XKt3+K/D+JQ+3HmOp9SEguBLeYQVtxIQqDpc1iIn6?=
 =?iso-8859-1?Q?L/wymxyxbIyfoFCvjpB6kFO3svj+5Py49A14vLzf9pHXUQQ1Ca4rqI5pGi?=
 =?iso-8859-1?Q?0qpSXFMXb2XHzxoNlfgyWCT6M+DN0ZuwbUN08wumHLcjDBXSGlkIbLnTyW?=
 =?iso-8859-1?Q?Sm6pL6JNWxqSoFwrvXPRnb2PaoyVzbdeF0HyA6XKXpobS7F3xEFsEpLchO?=
 =?iso-8859-1?Q?ueuWdy+CKzJ8RabOk3mEO4NDzms1jSep0OYeYJu1HcEnpkb23LW9byb67Y?=
 =?iso-8859-1?Q?eDhxcF8fAMgAUm6a+72lP7AG4Db7w820W5WC5tvqbxMbr3JrViu7Cwiidi?=
 =?iso-8859-1?Q?WuRIiEOha8tB7OIck0bD145exBfMLWtBqAgKp/sf2qN0+9?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: r2604sp8PhOaHFYd5Ml5MuAemFthvbl+NAH5vAR6y53VdKDoG5goAPOPwbUT+0apm40aUIxum0XLTrwGJN7B0hm2VYhxlkvC944sI/PJOQhYFdMI9Ex5zCFnOa/LPBEdquZzElZQZhneVzT0jff2QsLn67q2CiKf8te1hAvZSkzWFv7HOUKqBOl/UB0crhOq8vOD2tL8DO+eTgBYF0tI2cfGkWvXIOrJHwJ6tQ31ocvgGQdXFF8zGWVWq9RgR10rydwrDCFLVjn/1cneZBuAdHWycSYmxgNQ5SG/hH3hnkdtDNT0UfzYwvAL9111I3DJzv+ChA4NhDMhcgvmzdvvrA==
X-OriginatorOrg: non.se.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10432.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6af95de-c7fd-463c-fa9f-08deb66aae0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 12:24:03.4973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6e51e1ad-c54b-4b39-b598-0ffe9ae68fef
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RnBVzu9EFL7IJ6vLzwMGayx4udq+EDc6UJjQHOQ0hdJNHy3vg1NsEujuQA6r45wBPmuCNZj6ddaeJuF+2GIeOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8962
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h308JyGaU11g-SbMntF1MXW6cR1FQNl2ModAYWAQUXk_1779279845
X-Mimecast-Originator: non.se.com
Content-Language: fr-FR
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 12:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127116

Version 1.02.214 of lvm2 installs this executable as an alias=0Ato dmsetup =
vdostats.=0A=0AThis conflicts with the executable installed by libdevmapper=
.=0A=0ARemove this binary from the sysroot, just like dmsetup and dmstats.=
=0A=0ASigned-off-by: F=E9lix Pi=E9dallu <felix.piedallu@non.se.com>=0A---=
=0Alvm2-native now installs the binary dmvdostats. It is an=0Aalias to dmse=
tup vdostats.=0A=0AThis conflicts with the same binary (or symlink) provide=
d=0Aby libdevmapper.=0A=0AWe shall remove this binary from the sysroot just=
 like=0Admsetup and dmstats.=0A---=0A meta-oe/recipes-support/lvm2/lvm2.bb =
| 1 +=0A 1 file changed, 1 insertion(+)=0A=0Adiff --git a/meta-oe/recipes-s=
upport/lvm2/lvm2.bb b/meta-oe/recipes-support/lvm2/lvm2.bb=0Aindex 4bdf5f37=
fb..d993d0a76b 100644=0A--- a/meta-oe/recipes-support/lvm2/lvm2.bb=0A+++ b/=
meta-oe/recipes-support/lvm2/lvm2.bb=0A@@ -109,6 +109,7 @@ remove_libdevmap=
per_sysroot_preprocess() {=0A     rm -f ${SYSROOT_DESTDIR}${libdir}/libdevm=
apper.so* \=0A        ${SYSROOT_DESTDIR}${sbindir}/dmsetup \=0A        ${SY=
SROOT_DESTDIR}${sbindir}/dmstats \=0A+       ${SYSROOT_DESTDIR}${sbindir}/d=
mvdostats \=0A        ${SYSROOT_DESTDIR}${includedir}/libdevmapper.h \=0A  =
      ${SYSROOT_DESTDIR}${libdir}/pkgconfig/devmapper.pc=0A }=0A=0A---=0Aba=
se-commit: f8787b56f3d67142ab97cc4886afe31fac8b51bc=0Achange-id: 20260519-u=
pstream-dmvdostats-d76f03e2c745=0A=0ABest regards,=0A--=0AF=E9lix Pi=E9dall=
u <felix.piedallu@non.se.com>


