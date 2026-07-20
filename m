Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC82C4451B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 06:03:01 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2930.1784527374968657415
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2026 23:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=Bh1kzp1V;
 spf=pass (domain: navimatix.de, ip: 52.101.65.93, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzBFtsL4JI/5+QjuedJbB6I1x1hXLaShs/ej6Ci9GiZ1muX1wKtzebKNRRxzSr5ybf+SYDjCQ9kko9FbvgHgiWMqGv++B3GVhi2c9TAsLCK3gkYmlKN643BydemmpW+6B4fOhsnhTGq1qyessx5d21hYTYQLQ0llhJqHLx8zaA8yKm8uVDFchhoIkjXWl5L4IwK5eQD6QrBhrt1m0l58hzZc2Gx/LZbAzO/SxMS1QjOzRIXBf/YCT4QW5n3uDkMSb0hbIOKEHb8SiAkRaJ0Zn9lE2GlTcFu2EIx+MeXmVg8yhKdMytrGR5lVa+UEw4OoAKUUCXn4l2653KUJ4xsVEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41O36a1Mj74twGslK64MaxQaFEb+hmmEfAgYRfxgC6Y=;
 b=JQe/50Qx81McTBZDp+tA5Ev/T06V5AYWpgNu9/+vUGGMUnAghKi/vt8OVCmkS3S2LRo1Eow0bG6W7ltcSyWpBEipwwHgI2mFi2saSG0uJorimbP6Q21GKpcEhQILnkHKKmif/HDRdleYgkVj6cgKwtqV4feNZHdp0P5++WrxawV40XPYXA3jegCcqtTj4nM9ky86xXpNdW0ewsKbegCHah206vrn5fFF2V54fUivPIpuwQ7q7kfoQKC9uN6tVSSfiEMhS53JW0X5YDKysNiuQvgMFmCd+6fKVqpacWVyiMyCPexDJaeuD/nJ4n3PbZnfn5GEh44I8x76uwIk2cSagg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41O36a1Mj74twGslK64MaxQaFEb+hmmEfAgYRfxgC6Y=;
 b=Bh1kzp1VY5WtdyziGTqytcAOs8xUMoZ15vsd3yL7RWBZvvTfCc9YoxbypLyjgS2yLPJOAp/LYTsPsz4tp3yjmDWv6nS35ubz8OqlKpucpXEUs/AC0LSGO6WXMc66VJYXJhuK3SZdXIgGnwKmnlvHH7JUkUnV5AdY7xR5mxyX8kQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GV1PR01MB11312.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:20a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 06:02:50 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0223.011; Mon, 20 Jul 2026 06:02:50 +0000
Date: Mon, 20 Jul 2026 08:02:49 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] zsh: Update 5.9.1 -> 5.9.2
Message-ID: <10d6635828b06b4e2f30e466d747f2e32df94ae0.1784527310.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <ccc9289f95924943d5fba4f4be27e6c558652390.1784270036.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ccc9289f95924943d5fba4f4be27e6c558652390.1784270036.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0220.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::9) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GV1PR01MB11312:EE_
X-MS-Office365-Filtering-Correlation-Id: e3483951-e508-4493-da9a-08dee6248791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	3NpWqEuiJxW9oDPiaybaC4knTu0wO+iSnl3QAFWMyZh4uFyeYt4gSS6gTlGAPRE4kqaF6e2GK/PZGLkWqDfYP4VBdBCAe5P5URkVyvvIizq4WNEVcoLoiH2S0XzuAUvspqMBK1L4J62gZZS5ZzFFJYG1pL3zqAaEA7u/UmkPA1DtslAje88D4EqiJ5Ub+UDQwePi4kqjlp3AqvltZwK1swF8C5DkW9V+vu5DyCUS38L6+NKT9oD+994hcvOKO6G9Qz5KstlY4tJ2pWyL6UcwnmN4elSDFCeVroZxF1/qbL0bobOuuuX0CI6MD3eJz+bjS5d/kcChHivsy3lx0Q6fuiAfTIVx/UYpj5fPA3J4a7IllcvJvuK+ixXgvj889LHewoFS5DyARXYFVMb4WuiF6XQI8dZ2tdRhM61QnL2FmpDZ3fZ+ATwGhexuSUcl8huE74wnV+blwKvacS2D8b+8pl3thkg9qNcakbYAfb7z8xqHV+oFYq8QrT9GbL+2n4och2XZhehGjp4+J/TanaWRPbJ7Sf65YkEbVyn7XX3df8B34DrG5Em4eLrpGVPBaxmQNNamq3RuLNKWtqIEvZaSz/MF3zCAzcpoxkuUck4wbFg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MOwpMrQVurmeiXadKHji4jw8NghdH5L2Z3MLuZ61b+GGBlmwpo2DMkMPXkbv?=
 =?us-ascii?Q?9lrrc56Nz7EyyligPyrvU1yrIDmqf7SeU2IKLrJrLJ0sO25MZfoTZItiAq45?=
 =?us-ascii?Q?q/hAZcMmbMNmsoGvk0aHWucAaRTB3GXNfRRcftpZopC3Cm8va1UwMYQuElXO?=
 =?us-ascii?Q?yuFPWuVYyVKdUZgkXkHxYmnNuJ2CcQCRysxAMba29slV98AD/0l/qUFLImQN?=
 =?us-ascii?Q?GwW2zRFD3lvl+f46JhMDuWp5vyzWxRxbFKATX6glitP+nS3uwYUDJSXOJ8LT?=
 =?us-ascii?Q?YnmYWrAm3JVBGei2bCc1ajgTdAWULiskUJTYWLTv20cMnQJVNkjB4eT7SukQ?=
 =?us-ascii?Q?hNXNGclLGmK45T4S1yKeeg3GuGQaT8hj//1HD87Pdy9z0XjSEdF/XxK7Ee0x?=
 =?us-ascii?Q?yQptsN0svk9cJY8W1IhVG0n9jEbJg07qp9XD/K79ghcvnzS3utVFfe7wVa69?=
 =?us-ascii?Q?WT0xoXOGDMdpDvFIbT0pUlxu9tuP4Ll8tRkh3VjaSiH2PRRpT1zH5BPivqY/?=
 =?us-ascii?Q?qjys79LA4d9HNPPj/0Pbm4v8xoWuHrns7ttt+IdHz7m51Okn82puF+cDqoGO?=
 =?us-ascii?Q?LU6Jc851GaIp17zG77GvXf3RX3vtCGPA8KehYMCt8TRN8IQhkvpiDI5Sw0jc?=
 =?us-ascii?Q?cWTQnVwhs92/4rQVOfMJHcwqtpF50DMS5bwdIGWkm1ghOoj0l7QMxJKQZwdq?=
 =?us-ascii?Q?19NGAZ+EDCADOXL/wZKdz12edlaGKdJIk1p05l72/KRk/SKs5WH1LgfuImRn?=
 =?us-ascii?Q?Ihz1xDcpHg+kChwVW2vSm/xZ65KvokEf3uKVYIJKieb3BuUS1lcfGBmWzE6w?=
 =?us-ascii?Q?VyJwanh4rubxeIVV5k88m1kiV1mHJ+bu6hvyi/O9NCMtqNsUPcznt76XIEaK?=
 =?us-ascii?Q?NuCM+ZLBQW85/AXrO9JZ2vazY7+hvKUduuzpVjo1w0rv0eOT5qhfu0z/9ZgO?=
 =?us-ascii?Q?0J9YznWivT3zw0QsFY5EmfJDLNHKo8EW1tDg5ls0YuT2HkXuIknldJYkJu9h?=
 =?us-ascii?Q?FrH2bDPgKpHjrmWr9GaoBlVCkUIgQurA4kdXmcl2unVYOrBR8JhXhz9kQu0V?=
 =?us-ascii?Q?T+afdZOUnxqt8r5P3y8NwD+WeKOYx4ljfMNeO7aqNRXEOSpmokARIr1A5mKc?=
 =?us-ascii?Q?RZYsb+4ZqFTXSkPhoWZzg0jrKkObBmNQdsEg+rusBv8qScuLq0QetnR8eagk?=
 =?us-ascii?Q?C97s3Pj1kTHt1JioMYrSduDOy5ZsoFxcvnqCyQrA55+QK3+vJYtmSHlOVA+K?=
 =?us-ascii?Q?vsJ97SDnmOmQORH6V1lfGJXR+nFDeXtLFm5oyceoWvSI4pGrMgH1vbXPohUI?=
 =?us-ascii?Q?MR3B4Kl77l9qydOI/T4eKkjcM+hK4lkZRVGjDeEwV7RwX9pjfMkQeXDesYca?=
 =?us-ascii?Q?+E79cyu11jeBzxjqMHnTjpcoiuICwRE0TNWgTW0+YmIdb+KwB4ZHL+XSRCbV?=
 =?us-ascii?Q?KY0sjtdYTiAnHOgMhwGGxt4sDTIL2lt9igpUs5VLFxUWZeusGpoDNFvalGB1?=
 =?us-ascii?Q?LY0GEdxG8v6yTEX19OqWbOI936OvjBlwRaPfvJu80ABkHGthboDtCCGkCoew?=
 =?us-ascii?Q?7+Ku57Aq3MoIctV3aa78JU15j2wUfH9qdclnfOAyoMU4WCOVZkg7KdUn4+/F?=
 =?us-ascii?Q?63qNjEWQgbVJ4QB7sxaQ+XEjO0I7cBOlFVYMmTN6BFQAApEZ/8jLmf7bwOrC?=
 =?us-ascii?Q?F901g0RnKPxsMvW59+NAwV5SC46/bTtvLHVTwPyStpbR1cFztfmNY1Jy6w9U?=
 =?us-ascii?Q?H6FzccmyJRkv4iOz6uI5yjlSKIautkM=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e3483951-e508-4493-da9a-08dee6248791
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:02:50.2204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6QLpYPrGOZ39/8PspTJVP7U3+eTpiGl4aJSuDQMra38Hk5lQ04Xc1X0BNRyux2XvpONWCB8jTU58M8MNWdO1eNZnoSlWPuHJz5QimcXH0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR01MB11312
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 06:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128274

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Changelog https://zsh.sourceforge.io/releases.html

* Only minor changes.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
Changes since v1:

* update sha256sum

 meta-oe/recipes-shells/zsh/{zsh_5.9.1.bb =3D> zsh_5.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-shells/zsh/{zsh_5.9.1.bb =3D> zsh_5.9.2.bb} (95%)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.1.bb b/meta-oe/recipes-shel=
ls/zsh/zsh_5.9.2.bb
similarity index 95%
rename from meta-oe/recipes-shells/zsh/zsh_5.9.1.bb
rename to meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
index a62526dbb2..04225a24a2 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.9.1.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D1a4c4cda3e8096=
d2fd483ff2f4514fec"
 DEPENDS =3D "ncurses bison-native libcap libpcre2 gdbm groff-native"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.x=
z"
-SRC_URI[sha256sum] =3D "5d20bec03f981dc4e9a09ec245e7415388ff641f79c5c5c416=
b5042e58d8280d"
+SRC_URI[sha256sum] =3D "36fa734374b44783582cec09bcd67822e2f992c779ec1624ab=
5596df078d2f81"
=20
 inherit autotools gettext update-alternatives manpages
=20
--=20
2.53.0


