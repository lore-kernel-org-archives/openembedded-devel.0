Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B3BD58B13
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 07:41:35 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.105])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24822.1773560490675477775
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 00:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=wdMmR367;
 spf=pass (domain: navimatix.de, ip: 52.101.84.105, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2NJqTnbbpORN6jSduRx9yq6EvQHNq6xBbqi7MvsFd8X0B5dgQYrtyxwrFceHqY6nN2RkuVe2e0FjhfzjbPqw4UdHgmivj/0p1yZjy0bvqDv7/mr2vp+TpQuT/n68EdNwNvGJkURkAShWGKJdvdkAyiHrOeVXw561rVUcKQCWxd00sy3nKcnOgBTzHd2VRN1LXR5qTzBrE6lytbnZdjOj3ymQRLo169vC56AbhZJrm/a/E2kdZlJwKMvxrvJr3x94kiUD6/d8oa3K2d6sQi1r3OxVC/w9Yn5ZSUYkuGNTaBZXfhBkiF0kETCnor/mA/kHLFnTfkQZCtAgoAWDCZi4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DytG8G0NVfaeZ75NoKM0HSQ3uJKsYW3QlxdotkJfNR0=;
 b=P45051FGy2RfEyJKYscYoj9/OpBkH4JsEMp0L2nBe51GqffQZTZJADl5tASLc83sUrKQyQ0JXm+DNchlB0+kjIO0o33hQcjx4zoG8252X1Q2pnBzWVFgWdleIEqLrqzW4ZRnXZyNCO//IK/mh4pl73y1Vn5xaf+qdJAEzsqvv+20sWz9Nd27lm4mNxMF1xZgM1Yz6O3FtbDY7wHthYJyVzOGbG6lSCnZjqsJU3eXmZjtc1cx8nRPe8hnjdwggHny9QL2YTUf76agLde608Brvyk49Qt8QyFHlpkd5B3HIBRFa0LYQ+6dYAbeZD1fI66MWVTKBuVedH+hOgtHFE8Tww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DytG8G0NVfaeZ75NoKM0HSQ3uJKsYW3QlxdotkJfNR0=;
 b=wdMmR367TuUUai8QcAdO67W3NuRAkn75SMntvd7E9PsORkrvvYA3DiQHt+61CBnSytKK37jtXYeJFAXN52V4nmUcK+tDCn9jPwM17hOWyi7eEgHgL50Cdq3u0QdwclB75QchL1NjA/0D6oZtOn8sjSMgbflklJo0ykOehfMdF9U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by MATPR01MB12568.eurprd01.prod.exchangelabs.com
 (2603:10a6:250:4b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sun, 15 Mar
 2026 07:41:33 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9700.018; Sun, 15 Mar 2026 07:41:18 +0000
Date: Sun, 15 Mar 2026 08:41:24 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, ankur.tyagi85@gmail.com, 
	joerg.sommer@navimatix.de
CC: ankur.tyagi85@gmail.com, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] multimedia/fswebcam: New recipe for a webcam image grabber
Message-ID: <ff39c456c34a262e291c78f44bd63c061cdfaa25.1773560429.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <CADySD0HOEst_1e+s_FgULQ_TJmh7B3Cj+nS9tR5f3u0q4Ec37g@mail.gmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CADySD0HOEst_1e+s_FgULQ_TJmh7B3Cj+nS9tR5f3u0q4Ec37g@mail.gmail.com>
X-ClientProxiedBy: BE1P281CA0404.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::29) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|MATPR01MB12568:EE_
X-MS-Office365-Filtering-Correlation-Id: 023178de-6e63-4acb-f12c-08de82663e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Pxltjol3FM8lCsKpGg9RpU9Y9VQGGRQaKqxMKeYJV/JqkyZvvL7r75W2Bizv68ONFkyP++JyklIy5dW1cQtdIZRddixP0xFG/0uWsTJJI+RgNNo7t9OThRvMs9aL+ASN9sx/Vtmz8a49t/X3FLVsQC11wAZ749quPAGVoVVSS2mHTYC9OMpULRBP+irwf6axrG61iyuza/eDxyl4hO9zqo1SvwhL1a0NNcjkc0qK3SyfmrhiAWn05gRtMexxlcW+4g9tiMxurrbcmdgiNBl7ewW+5JnaRJqRg7J5E4Gjl1WJAVZHT0wy40JMkspekpPUP3HAuJo1KFOZG7f/2j6xdhzPnXagr9KrmN9U99eikJ5m+oLRNqw/ph7+WikN8g4lCZOz3M45fuqrMbPX7o6Noo6/aicK27gdsz6zWXHH4yv83O2KD0WkP/WvITSfQZK7ZDLvapLegcTu61FAPBUPMFs71o0wszyva6rd6UJVZSCV1b7C2D4xsfSViQxFR4PV/IbBpiEbUfN2NHcMTWrizm8CQMnjltp3q1IuPP298VvwXzWheZPYv6Nvm1wKVhWwaIRoiY5NK06QPVi/NI1TICtTj2cHxbntRQKncnLUvonaQxC3aFon8uQMw5fftwE6Zx2bhPSXYcqSrATXqsKZD1RYwvf4aLxDxfYjs/qcLDyzF0KPya7jxL6TKa3hDpcz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kkS7lEM8tggm4xy3vlh6qZ0yoClllFiOsgV+9npX8vidCk4VEJpzd5Arwwty?=
 =?us-ascii?Q?XZD/3W0MYZ8FtbqJEigOAUjRZlyuQu5ZK+IOjzgqD3qTtROKiYjxs2ZL7O9P?=
 =?us-ascii?Q?4+5SAhVJYS1QRZ3Pwm0kAlV6eBCn8WU+tIQYCBWdNSreQ64kEmUsHEmFhJuA?=
 =?us-ascii?Q?lR0oMqWRlssAhHPo4JQAURmk7qFGEDkOh7o+NKB0EaQbX0jX5uLq0XMJQkai?=
 =?us-ascii?Q?MFv+XFuRczzsgCtDrHhS5ocfxHb1uRUwxz5GV+sTMFVT+/0zBnZBmkv/gN3N?=
 =?us-ascii?Q?iEKCEMHbxb/UXBkAdS3iOXUJbXmwSK9hr2rNVL+1EPOXubjPtZtGcNM14oe7?=
 =?us-ascii?Q?oHoIULKcW5kPPHsUJD+CkzoYxETj/E734RFWQ+s+mnNavI+thMXZyE3vfTvh?=
 =?us-ascii?Q?iGqpsgMSLFdPwJYUPSbrayciKOpcl1WH7I93W0h/JozoMWaLfZ8Lw1fUMawm?=
 =?us-ascii?Q?hiwuHgrNmA2lpXx33KWiuQ1nPh1eLME/0Ep+sa4LG1KI53RusYaM3ygFnUHX?=
 =?us-ascii?Q?WNaXlj6qaENppFCDVmg7gKP4JJnIctuVKVeXqEmlTVvIueTAcW+sAT3rTd6Z?=
 =?us-ascii?Q?uOLL0rufRD0er4VylhcAVGWct5IavRz3/a/cWtEKkiJbK9+jfyw/8uiCjAmV?=
 =?us-ascii?Q?gW8ABlqtTKetZ/R4YXmLZoRKP+W8PbeoDV9b6fNjo9iRKpwtV0QM+pi6Eh3S?=
 =?us-ascii?Q?1tAglmFSy4rSyL5vrbCkI0lERHtPyqevtcBMJQ6DCswGQbrDLbU88pmrY7bp?=
 =?us-ascii?Q?x8/BZ5kWsPFHt5pnGT+FiFtdfU45c91ran5170rIF4TzqEEhlBSgiLrZBTB5?=
 =?us-ascii?Q?0Z2/EXeuk71fDqwyxxy0csS6V0Rt/nIf0KRSi7uYTUuE1F7Ka9MMH95FcHp0?=
 =?us-ascii?Q?q8YCK4GfeCXkXQYnJufufNynuYyTUU75yZMHTGG5MZu9dtls9IvqLvkXPxgY?=
 =?us-ascii?Q?jXe+eYXMg73P4zGH2gKEwmPxcS83TOr4OuF/xPCgyWZzRRrAPPNF8BMOpdeO?=
 =?us-ascii?Q?LnzSgoPVyXMtOpKI25mS0bNtrjbROALYRlj/ZuZrg8xIfGHoNa2BFOEU/twa?=
 =?us-ascii?Q?uYjOWHAL8I2k7NtbvanEeQ9iJyeXB5Ych8hKJnZRccod2jmlhYZwzXagOe6f?=
 =?us-ascii?Q?qAA109EHsrCCNkwJ6+wF1iD7ZiMcvUaV3Uj0QGTzgffHv66UdbzVpHyndXpp?=
 =?us-ascii?Q?cqYDYltwO/q1llzX3R8C/7P1urrcYqh0O05rm9Z7kJpTNYAWusdtpOfmAJr6?=
 =?us-ascii?Q?s/Xskb16B4KPoUurf95jQ8o9Rjh0HgrgM9mvSfxn+I+PGjIoRgrWVeY+MSa1?=
 =?us-ascii?Q?qoa9dawjmkeZQcLwIezXIiVzrHk6gB26I6SqE1mph30cvsQvscnrYOMod7GH?=
 =?us-ascii?Q?Tqx+4HuxS3VJEKcvEa80F7NN8V4pKYwKHTp2jxOmc1Y5Vsud79RU26cHKXDp?=
 =?us-ascii?Q?GMfehbdhoPFTPnm9ahp5U58z9eniXlunLnyIh6Gph0K5goF6p1vS2arfoZVM?=
 =?us-ascii?Q?rCUNE+vnsx90+3N2P+bcGclmLry4x/BxI8PaNLVybFlinbwhuknSU7aKrTVS?=
 =?us-ascii?Q?m1dyXleyHEJqSYkjXYEYjjleobj3EJJGQ6sF56VOyNZysI1faJ6D2nnA5s2O?=
 =?us-ascii?Q?vo3id1o6iYkeMLB/BhfgXc434hzw3qLH50KfZTk/h49VkbvNYcm1llZh2AnQ?=
 =?us-ascii?Q?fkDdbtfvEV6D1VNF8mAZfK5N0N0QRrGnm2ZRWdfkf3JCVGlXAjJFtBMzfDuG?=
 =?us-ascii?Q?l08uQgFlg3yoZ6kDWETHHziX5SJuGcM=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 023178de-6e63-4acb-f12c-08de82663e9f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2026 07:41:18.3977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhZgN/jaHNVrQjFKihkFQJInP+oQg0/8ibtRPhv6t6k8JBZyRci/9ydUjddx9FJahnQevq8Ts22Mpe/oWGrpbABN2ooas4vGvMJJHU5uxh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MATPR01MB12568
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 07:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125216

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Taken from
https://github.com/linux4sam/meta-atmel/blob/master/recipes-multimedia/fswe=
bcam/fswebcam_git.bb
and amended.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
Changes since v1:

  * added tag=3D${PV} to SRC_URI

 .../fswebcam/fswebcam_20200725.bb             | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20=
200725.bb

diff --git a/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20200725.=
bb b/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20200725.bb
new file mode 100644
index 0000000000..bdda35df40
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20200725.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "Webcam image grabber and manipulation application"
+DESCRIPTION =3D "\
+    fswebcam captures images from a V4L1/V4L2 compatible device or file, \
+    averages them to reduce noise and draws a caption using the GD Graphic=
s \
+    Library which also handles compressing the image to PNG or JPEG. The \
+    resulting image is saved to a file or sent to stdio where it can be pi=
ped \
+    to something like ncftpput or scp. \
+"
+HOMEPAGE =3D "http://www.sanslogic.co.uk/fswebcam/"
+BUGTRACKER =3D "https://codeberg.org/fsphil/fswebcam/issues"
+SECTION =3D "graphics"
+
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D393a5ca445f6965873eca0259a17f83=
3"
+
+DEPENDS =3D "gd"
+
+SRC_URI =3D "git://github.com/fsphil/fswebcam.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3D${PV}"
+SRCREV =3D "db35d4bbd336885a44f017ff142bc9523dbdce3c"
+
+inherit autotools-brokensep
--=20
2.53.0


