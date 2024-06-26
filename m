Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2E0C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 07:28:28 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.127])
 by mx.groups.io with SMTP id smtpd.web10.20227.1719386904128421130
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 00:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=U0FYPgBe;
 spf=pass (domain: navimatix.de, ip: 40.107.103.127, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqwbHhpmRgiGINBRAMFHFafh1gMpGSGp2BIXX/d0dwWyjQH1NquqVkVdlrvYA5t/E/Vs1boKuttyGQbdE/GQmzo+JKzWaIH1SLW+GHvfTs983+4AkJqqSiXsLOcqW+dDY6PZR87Rrc5+QyDyURcy6hH20LI0FlGSFgIVcmCcNnBrzAV/YTxLU4KTPwGT9EISvjYgA4HOsuO6rDXrb/+1m/DnbMHODrzHjbkDVanN4B0Bl4u8pWTwMnyJDUrF23ewqRGqaxptwFX4aBlizQka6sAsEYlW5sBAtQGf0YrkAXxqyI25Zox7kxy6rv+nrX78+X0lEQzAqPBOmQJ8onU6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nV5ol59QArbe7sNLhWSn5eO1AmXkjjeDydOXtMYghfU=;
 b=VZGaBbRGPsQsSUVIPTtjyfY3WtriVeCf4ScKiunWFjxOuXpI4HFWjfE/CWRYLmEoxI7sv3QH5JT+1eWF6Ax6CYSAJ2O24+Q+Rj4n46kaIOL7jn3tOegxwu09UBXLTxDbZl+djI5ZfqRR+izU2LJZ4kc83e/EmZ/pbIfC0608M4bC2zGZOuXps1Rq0wlB98vcm53eV+k+2FdFvPd5Nr5oQ79Aety/+9aNAINDnKZqnIP8f1e5XSdsr7r3Bv6ZSyQSAsnyV+rtUtE2JhbRsPOFVQe9gNuN6uZkpRqa/oZyHWg9ibKO30q1PbvgKUC7TGPBqbTvNGmxDYofBQzakg4iqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nV5ol59QArbe7sNLhWSn5eO1AmXkjjeDydOXtMYghfU=;
 b=U0FYPgBeW3FUZFVki4fcgC20CcGFSBIXkEXAmI3dYiJOoww281tduUGtQeT9yxTX5BbodcPQ/7c9JTTQKGKwCSqjacEalONQ2ECGk7bmlW12rMjvHdcJdcwfVqFn6WB8e4KBvUrJgfgUXGuX4oXUJnJOYSdXLyQRhNtFIN9HBsg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by VI2PR01MB11383.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:271::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 07:28:19 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 07:28:18 +0000
From: joerg.sommer@navimatix.de
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-multimedia][PATCH] bluealsa: upgrade 4.0.0+git -> 4.2.0
Date: Wed, 26 Jun 2024 09:28:09 +0200
Message-ID: <b749b3d6caa6aadb7505462366c9f15fb4f143ad.1719386889.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0478.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::12) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|VI2PR01MB11383:EE_
X-MS-Office365-Filtering-Correlation-Id: 033a7a50-7f86-4ce7-a168-08dc95b18cfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230038|1800799022|376012|52116012|366014|38350700012;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Iwk2z8ZCtFDNWhSHYaaE5Eitrr4ehi0dSsM/4PVKDCZnaVOgb7c4PDNLhiC2?=
 =?us-ascii?Q?Tj2j4Ajjh7M9R1h2pabpMxQAtaInaZ843/KUjzNd+mdGj/NcHzrWvRISMes4?=
 =?us-ascii?Q?uHl6S5tDyivprGBSBEONaVwoSicgfuTmfO1TpURZP3FuaQEh+YXdtYIIlMMW?=
 =?us-ascii?Q?dKEQDlVQlDnpyxjpCV78hNALJPZh5X/YeH4N6/ovcWNJPQrnf3Pk09mfMf8K?=
 =?us-ascii?Q?LfcYDy4vPMwns5F6o29dv2LxcBuUbZ9pR9cE4NZdp/rwK3IkwokbZ0O4msIn?=
 =?us-ascii?Q?gbsUYu3t8Go99OdrsNmOqDiPJb80+vRWQ4FT9UL5JyUCICecM7CbWKFeHu/o?=
 =?us-ascii?Q?ZH4BBKMWP7JyBHR9S5rSpeYIXEhZGESLi7WyJyRzxSeCyHFuY48bSGstrM3W?=
 =?us-ascii?Q?4u505+EdChwm6vQOFC9X82XHBS0/YESFnMOb1huRLaEVU5B8NXvMYC+5zj5O?=
 =?us-ascii?Q?YpqFRiY9zrZgtRuJC4DelB7pValCb4Qc2uHYQfwyxZNLveFa383uoxI4oDps?=
 =?us-ascii?Q?ZV9hnU3GXy1Hx/ZBc/Xhy2dknBfFx8AF2n+Upn2cNygGRSJ/p9tIbUUwG7dB?=
 =?us-ascii?Q?m8NzbOR2mwS6lYcTQGWYEU4e1P/hYU+Xl4KwkyfDFLB3M+qpcUNtJpg8Vtu3?=
 =?us-ascii?Q?2kXp51N8T74CSRPHCYC/9YGeL5KRoNwK8MxrN//U+uGiMiwGHH7Y+fwXKGEe?=
 =?us-ascii?Q?mWTuh+SYclLDDblzZqkD8JXJeYCeSIS2f9UqmG8QnmYQSOAwmOLOy+9zhYBw?=
 =?us-ascii?Q?6pqnOMQ+ocmEm5/B3GRCyDQmRsYqY8vEhPe0pJYDkwxaaaQnqg7LpnYxSAyW?=
 =?us-ascii?Q?mEDW2Tv10G8ldCOfaa4M7pd4uuVeYnD0qkDI6eb8Z1csYoAF37VOTe10Pzqb?=
 =?us-ascii?Q?yENF2mWL0FbWhKiDAiwHNA//HFXZOp1igpKN1jkeUGvIhQT2e3qEG/DOZte4?=
 =?us-ascii?Q?sOeNcwv+JIGXAWsI5ZmXJgBj/Jl7twIevibpya7omoBynr8N8gstClykCNL7?=
 =?us-ascii?Q?a8CHfpLSq0705aGxd+OmRCcSzYuHAYw3XwiV9r9UWwtQEGLrU+yliqcrZpF6?=
 =?us-ascii?Q?Lqy1gFS7g7LWsckaASIZG+xTQrnsdKC6nt55mnBwRxOH5ChyGYQFnT4IE7vZ?=
 =?us-ascii?Q?KahEQ6GtvqmMwy+aFQriz2Iy2AfgqOq1FE81hLGE0Pgnm7K6K2XGudguIGob?=
 =?us-ascii?Q?ngMBxDrz+sTRShb8OQcfUo3iyh50bfZNoAv4PePquBpnPCzH/EDXkJpXWvq4?=
 =?us-ascii?Q?ul9PQs+E4eOYoGw/jT+gHa3LlNwUNl1QlZ9wYxL1ovASM1RZsQsdTyWxMbjp?=
 =?us-ascii?Q?O0nn9x3mYYBLLam595H9oCzC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230038)(1800799022)(376012)(52116012)(366014)(38350700012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v+gOu2oZNyUf1eAULfh7rKOosY/nkEw9hyK/AvvBUDNXhQ/Nf2CzqMhzOlxw?=
 =?us-ascii?Q?qQ1rX3kpMb7SfDJdIGDW70k68YiNxkaE9LemHYVv+FClWgAGgN2PpPDlsmBK?=
 =?us-ascii?Q?CL2FwC8GmFTl+aAjxpi/w0NKljKlFqFx2QptFK8dZAHmMBGsD7GE0wCMpxJJ?=
 =?us-ascii?Q?zMEVD4Lq+7XEoRahppWsXJ9wmpuaiH2FteK1xdB0/XNV2SwJSaMVNEE/6Yz2?=
 =?us-ascii?Q?Bb/3oucm+mHwelwihiCbRwYpdmUc9s6Otso5jyBWp0m7jhMiNnWzrvOB0TcF?=
 =?us-ascii?Q?TQspGw2f4IM/Lr9GHCaHuZLI4WrO5GXhfiiKTO97He3fSQ4H5AkPolBe77nn?=
 =?us-ascii?Q?3oGZXP7jDi6zy8dExkIWj9ikPUF6mxZt8DdzG7GU2oUJ9nFmErscB6gl7uVX?=
 =?us-ascii?Q?ra0OkKIXSEvF8TPt+1zYVI72UWYLI14Qky7Rc5MpYOcD32Nt8EcByNpo13nT?=
 =?us-ascii?Q?cc3u13c/Y0zFP2oHPBzJhaeOPK9VPIEImjecg7wlaxWMYjzNYhWdbmq1Slqq?=
 =?us-ascii?Q?cAWoAKfdzCF1cSnQeZE1O+JohBIO7tDxhOr87mOjrL0D4gx9+rPWt9wKpobJ?=
 =?us-ascii?Q?61uIfFYc7iPPrhQK3yvnHWjoZKh5blHyFU+5SJnriC8uqGYmRltTO9ndjkBU?=
 =?us-ascii?Q?qfMX5fYRslWg5tw+hSRyxLOztPaa8TttGUm2hhemxwxLIWbO9f81rRV4oeF2?=
 =?us-ascii?Q?ocGmE3AEQMF547oicRqWm/uSZFi+tlqUQqH7ocfHIQp0ETdY1a0QJTw4BfKc?=
 =?us-ascii?Q?r3bBLfKBuIgEZxj0WVZDO4FIwlwvpQrHzPsU2ilQALpYQ2HzgTqSbXGJlsCx?=
 =?us-ascii?Q?rE1Aqptm1eG6Tqrl+xqPuYvsbyZ9wkZJM/bnrVsswCCXX3a2v5GdUkGj+Lku?=
 =?us-ascii?Q?OgJR/NYvhWMWVggBocvDhObFkJUMlJmBrCIc4HNrR4y7ye91VyjFKosToUBN?=
 =?us-ascii?Q?nc/aKhzc6AjupqpydUidSTqpfWdSEGKzho1yqGnvWKCjlARe3h4LVRVQov/w?=
 =?us-ascii?Q?I1OZ0Krg8mPwC15l33IUuPbdPBuwTS2hT7O+r5XcxgVwrMXhrwmey5tVYrb9?=
 =?us-ascii?Q?KTFwah5/trM143eTHJl7d1mLF4XWKLHXFRphs0uG3u17aONuW2D9vNDr48FA?=
 =?us-ascii?Q?5qr3CmvdWZLwbSXzjzwnoLuH6HznPLc9z4nfMzlaRaauwmgeQX0BgLiVGaOA?=
 =?us-ascii?Q?+7TZRc8fynDGwR5xpn8VQUFDqKAArXQ1Qk/ZN56air8YDoydUMC6sKunj7dm?=
 =?us-ascii?Q?Ap6aJa0kE6aBx9+5VoVzZIXxQhA2eqjM/Mn7GSyMQPLM6C7dr8EQcvXB8yZx?=
 =?us-ascii?Q?fKDzoq3Qo0stJxuuwR2mpiQ/amLBUoRhBk/D2LPuzSeB7TtyjBWjf9zHtMyW?=
 =?us-ascii?Q?xV5mX90pbU2T4j8BByCmxe6t9z76hCklLDQ8DS+VhH+lAjj+RJc3CYYQQjD+?=
 =?us-ascii?Q?Aw6hbsECMgvHtJYUbvm/bAU79GCwgQSyM3r24/kBi8fIH5oMBXw0g8pox5cy?=
 =?us-ascii?Q?Es9cafS0LCbHNKPL/qVA49EvUzrXvz+j3PAy5YLbGVFWvyOouTMPCxx5owj9?=
 =?us-ascii?Q?VO49+RyoN0GCO2c1bpOYIhxP/S5Ano8490fLaoX8wYDD+VYC8GS6R3RFVIig?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 033a7a50-7f86-4ce7-a168-08dc95b18cfc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 07:28:18.7876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +SBVOn5dA3xe+M0YHeEP0F4hqDNK24B0AwW374yrsARIkol0tIiluLPNPWynDK8a7+4MDf6ugEmO6NwXkX3/IFaeaDZc96UpsWZoNpiysJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR01MB11383
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 07:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111082

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

The change in the license file was the update of the year in the copyright
line.

glib-2.0-native is required to have gdbus-codegen at build time.

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../{bluealsa_git.bb =3D> bluealsa_4.2.0.bb}    | 29 +++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)
 rename meta-multimedia/recipes-multimedia/bluealsa/{bluealsa_git.bb =3D> b=
luealsa_4.2.0.bb} (70%)

diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb b/=
meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.2.0.bb
similarity index 70%
rename from meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
rename to meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.2.0.bb
index 5007c88ff..47ebda6ed 100644
--- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
+++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.2.0.bb
@@ -1,22 +1,30 @@
 SUMMARY =3D "Bluetooth Audio ALSA Backend"
+DESCRIPTION =3D "\
+    BlueALSA is a replacement for BlueZ >=3D 5, with which one can achieve=
 the \
+    same Bluetooth audio profile support as with PulseAudio, but with fewe=
r \
+    dependencies and at a lower level in the software stack. It is designe=
d \
+    specifically for use on small, low-powered, dedicated audio or audio/v=
isual \
+    systems where the high-level audio management features of PulseAudio o=
r \
+    PipeWire are not required. \
+"
 HOMEPAGE =3D "https://github.com/Arkq/bluez-alsa"
+BUGTRACKER =3D "https://github.com/arkq/bluez-alsa/issues"
 SECTION =3D "libs"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8449a4f133a93f6254b496d4fb476e8=
3"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D143bc4e73f39cc5e89d6e096ac0315b=
a"
+
+DEPENDS +=3D "alsa-lib bluez5 dbus glib-2.0-native sbc"
=20
 SRC_URI =3D "git://github.com/Arkq/bluez-alsa.git;protocol=3Dhttps;branch=
=3Dmaster"
=20
-SRCREV =3D "dd05a1baa261b94da9ba977b5e3392c8b4dc7a5e"
-PV =3D "4.0.0+git"
+SRCREV =3D "261f184f41f7bf572051e5f124d687ade185a46e"
=20
-S  =3D "${WORKDIR}/git"
-
-DEPENDS +=3D "alsa-lib bluez5 dbus glib-2.0 sbc"
+S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D "aplay cli hcitop ${@bb.utils.filter('DISTRO_FEATURES'=
, 'systemd', d)}"
-PACKAGECONFIG[a2dpconf]  =3D "--enable-a2dpconf,--disable-a2dpconf"
-PACKAGECONFIG[aac]  =3D "--enable-aac,--disable-aac,fdk-aac"
+PACKAGECONFIG[a2dpconf] =3D "--enable-a2dpconf,--disable-a2dpconf"
+PACKAGECONFIG[aac] =3D "--enable-aac,--disable-aac,fdk-aac"
 PACKAGECONFIG[aplay] =3D "--enable-aplay,--disable-aplay"
 PACKAGECONFIG[cli] =3D "--enable-cli,--disable-cli"
 PACKAGECONFIG[coverage] =3D "--with-coverage,--without-coverage,lcov-nativ=
e"
@@ -25,8 +33,10 @@ PACKAGECONFIG[debug-time] =3D "--enable-debug-time,--dis=
able-debug-time"
 PACKAGECONFIG[faststream] =3D "--enable-faststream,--disable-faststream"
 PACKAGECONFIG[hcitop] =3D "--enable-hcitop,--disable-hcitop,libbsd ncurses=
"
 PACKAGECONFIG[libunwind] =3D "--with-libunwind,--without-libunwind,libunwi=
nd"
+PACKAGECONFIG[midi] =3D "--enable-midi,--disable-midi"
 PACKAGECONFIG[mp3lame] =3D "--enable-mp3lame,--disable-mp3lame,lame"
 PACKAGECONFIG[mpg123] =3D "--enable-mpg123,--disable-mpg123,mpg123,mpg123"
+PACKAGECONFIG[msbc] =3D "--enable-msbc,--disable-msbc,spandsp"
 PACKAGECONFIG[ofono] =3D "--enable-ofono,--disable-ofono,ofono"
 PACKAGECONFIG[payloadcheck] =3D "--enable-payloadcheck,--disable-payloadch=
eck"
 PACKAGECONFIG[rfcomm] =3D "--enable-rfcomm,--disable-rfcomm"
@@ -37,7 +47,8 @@ PACKAGECONFIG[upower] =3D "--enable-upower,--disable-upow=
er,,upower"
=20
 inherit autotools pkgconfig systemd
=20
-EXTRA_OECONF =3D " \
+# These proprietary codecs are not available in Yocto
+EXTRA_OECONF =3D "\
     --disable-aptx \
     --disable-lc3plus \
     --disable-ldac \
--=20
2.34.1


