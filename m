Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA1BF94CC5
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 05:42:40 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70589.1776836548404273127
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2026 22:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=3Xs0ZHuX;
 spf=pass (domain: navimatix.de, ip: 52.101.65.91, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAwLj8KVgKiEWiiXsP6gvEhR0M3oFOfkZUKF8UOEUK8sHZR0d/r9XrdSIYrL8UG3VGaDtrrzJkjiIn9W5TJ+LFu4FGoINXj6q49+FLOQpHNKiGOH10LhHMCOkChIIO9AOpjaS0a87k9RdukjTLGV5OPVng9//Dw/OBB/FYZQvwwnONWMN44F4rbAcYrg/Vp21ATrcxpKpHG4DE3p5EBP3wWIo0AD33Uo0X85Z7iUVPaFzLkpkPrEIUoWFe7PR7clIStzJO8YCcYrdUP8unpLMwkh4S1WqwLR3XZ0umCijwjvUNFhoZ5TPdYMILqkSaW1ky1xMKYi4WI771AVTEfE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vg3EavwlDDwVu1yPrOBCQ6cThPiHYp/jt99LpltfTmc=;
 b=GPzHHdMrxnbQRersoZhSO2aIUsVrGzYfavXteEERgy4e2Xx2gKl2ij5JAbRzOfAEfJwo766/fg0q5baeiZ8cxjJX04watS5bnxltBKacUBV97cZ1kvY291DDSB48e9br4pOLSdpsIZGFd6f+R4Y9maNsXzKhwoimGhsiLz5mQZrdI/EKstrtzF1Jp77Faz4Z4vJC3iND+YS/SdwJf9Q6bwCEqtku/2fTWYyj7wXt7HOCklkacFYK3Wy/6cIshL44xXzckK+T36afzB7UmMw/9Gr6n6UrNxARP2YYKd7FxxhX5qnF3GD28itOTv+Ux/8oH3oztZ9LoB0hWPqar5sn4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vg3EavwlDDwVu1yPrOBCQ6cThPiHYp/jt99LpltfTmc=;
 b=3Xs0ZHuXb/3sLFIOiYZHJrLa1vjNucZO6nhqaWi9Hgg+2IfxguwxDt6pBOupVuPHX6k5gks5NQZ4/876OI/oMft5tPFMGPreE65kE2bOLxYjQdh0ynEVKYDmMDKiR3PxoEVTEHwP4WytFki5fKDVQ04fa/PJu/EiXSyX1WZul78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from AMDPR01MB11848.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:716::14) by PAXPR01MB9411.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:2c2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 05:42:23 +0000
Received: from AMDPR01MB11848.eurprd01.prod.exchangelabs.com
 ([fe80::bd09:997f:d01a:43f0]) by
 AMDPR01MB11848.eurprd01.prod.exchangelabs.com ([fe80::bd09:997f:d01a:43f0%5])
 with mapi id 15.20.9846.016; Wed, 22 Apr 2026 05:42:23 +0000
Date: Wed, 22 Apr 2026 07:42:22 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] framebuffer-vncserver: New recipe for VNC server for
 framebuffer
Message-ID: <51a38cc73cd03d404d69f8e0cea7137112c332de.1776836541.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::22) To AMDPR01MB11848.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:716::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMDPR01MB11848:EE_|PAXPR01MB9411:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e989f69-9dd3-4c97-e2c0-08dea031edb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9+8atHXskipuZswPP9Y+7evjBsrrQJRVbGbHMe95WS3fduPPXjr+MHSIbjtkc7qGjKp79IBZp1JM9jhUFBlv1baWRGO2iuivva7fwiIjHnRwfvdYAtQERUOuGvUPE4zYAuzXXtpOM5XZ+M9k2WiDLLmHymK8MubY5wGoulGdkFSMDtHcNNjI4fdL1XhxWkEJnQQQNxRfMlVbXx7BHZg3P1LKCtLL7iw2s7tgtQ5TwOtM4+hwTUVmYlVqZO8XTAxVlyZdst8Lg3y+wVkTiteAfGqezKzN9n8PQ10FdZAjtE4ornPcZwMXMCCvkHm6rgsaD+9ku7gchI5iPYJMdaByD1haRbXxrdXtrk115hjBPimT3ezVGKWMrcMGqR9xPmsW7SrJbyR7+WvE5vZJn49Q7f0j38xff4xYiJsYL+QwtZjU+KtXeLFQBpd5QH5KoIAqwOAmpVpexWiztatErS0IOCkaop1HnTLwviDm/g9P6ANw8PcYRfZBUVFIiWwv3nMMcsCh54y2jmyh6+QZuCLxr3UqNXRZozMjqv+TEXLg0jgoPIG2qwZ5/hHr9JthJ8KcBPow9XLTwQoRlvrXFYMldyYrrlS9xzNGV3ux6Ecb87oQwDHWya21vLdy01ov/CRkHKCU8rjLv/CoNla//qajTYzrVzuo/6ooutNY1dPVvu32DYdH/XKx851qdbKQuVX/9Ejc6UeINrI5AkzItA8G+SmzulKOAz1pLinJBDYj8ZI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMDPR01MB11848.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w+IYW5Cm1CIAeyFPicZbfo+7KBhtUBOSWGQmWtI+eVEHymP6Xo4BfNYRi8fG?=
 =?us-ascii?Q?yzqnI/811VEqwViA9aJ0R7e/cBv7k8OxaTLdqWIe53VkopwLTKfq0iLEDfB+?=
 =?us-ascii?Q?7meFnnsGr+F7n4avANF8VDe/f/OGcQs7cOjNLhGrUxtXnloHGHul0S+YuFmL?=
 =?us-ascii?Q?Hz/5UdtSroRaL7wDRHSZkSTeD0qoXnSRKf1ePCqmCIQwUBftMXI5gkov6aZM?=
 =?us-ascii?Q?n7WnPDaB7tQq3qNaGkPowl43dLen++5TxluejTtUG2eyks0B+U1GMTmqxnMu?=
 =?us-ascii?Q?QffbBJpNigrUUS5rhjlZI1r1/s9YtOPiY2uQjCM3XgnIl92HSiTFmPqL5OUV?=
 =?us-ascii?Q?cpXV5rIoR5cbp5Yu+azmLKG0nhmjEUuldNEMRnGyy78LlAzsrzc7HtTlRo3a?=
 =?us-ascii?Q?YFwPxPXF9KmH29Ai58T48mQ56YCpmTxQlTZbZGoG7EQmiS4Fe8leHp6hFFdr?=
 =?us-ascii?Q?6HU0adFsc6pyehQmH3M4pmE7u77MMsvgJIx5sMkXYVIWmZ+ABd+hWWTH6RCB?=
 =?us-ascii?Q?zywhbIeUQ+oe+imMttgpJBaGh07YD+GuJ+MwsviRM26rWJIOdtve2DSRX8d6?=
 =?us-ascii?Q?kR5boYdFyXnCONaHQgbISj5zIAxnJzwZYUVUNLp+7T16pUqDX99y1ji8mx/p?=
 =?us-ascii?Q?VDP230gwlKqB8jiq19CpImaM7mvQ8s8loFIX0gN6M/hMvtzfPrjiGy5n2KRh?=
 =?us-ascii?Q?qwLOGa66q1DfFMsC/gzDx/SdPOcItLdP2/weh5GyQPCV9ZsbiFIDSuALjZMz?=
 =?us-ascii?Q?vJCNl+lbnLRwgmG+5hDVYSKarbMzP5Vlbti/j2uiaLr96X3pb2rzdSfqtGvS?=
 =?us-ascii?Q?LdvZvPxR8yKcxA6t6wDfHBWGWoM99d6kxJc6zE4fULdklWcUUmSEyZLzjJFC?=
 =?us-ascii?Q?TFAs54iYDOmsX0UZXq2ItPGOCJiyb5buXw2EidzBevek2Im88iXKBnl2RucD?=
 =?us-ascii?Q?+luX/JdiCjYxi7rNgOMzgs9Ag0dXhd/RqN2zb5BPo73Mqdcsy4P1ntAO7xmL?=
 =?us-ascii?Q?KDh+XM7Rnl1H5fNB3hQVVtFfOVM45EPRwWJ1ALthGMtYIP4C5Nk0SsOWtmbm?=
 =?us-ascii?Q?jkjBXm7KTD6tHur38rivm19yA0hBk+KRtqeLbPyBxXPTcR/kQlF3AT24CzSq?=
 =?us-ascii?Q?DBc7B8tVrShCokSyyvgNi4yRJER4TnnwNhX0oUqeJYYT/qxKHNsNuMMyZkNh?=
 =?us-ascii?Q?PVY7YJlQultZyISxSmCj80GeGRIXiNJxw/sfWUUEa5IJHaijwxUoSM3apO5+?=
 =?us-ascii?Q?2IANrABJk626fumTtS8h0FVRHBWl+7CDaFHhnb1o/LmOIDA2QBqmQ9pcWQTc?=
 =?us-ascii?Q?5mQ7U5nPz4BaNDzm/nIfeNC0UfamqbBg2q79hzYJcP76rWaf/DZ2+bkzYq68?=
 =?us-ascii?Q?oirXxVfP2ZwcCwnxk/ontq2aWR7+MGk9wIaUhS87TFJrTJS55OaBeF6AdnRA?=
 =?us-ascii?Q?uDf1fTxaCxyHgPPPyQzlDnnVxfaJt7hAMtdyK9bdFkQEGFYiNlaDCwlCB85a?=
 =?us-ascii?Q?fsf/IGL52L03Zp/qcuWsVMDfporAWghKDhxXpIqBLjh5c4+5eMLukQ8mUoUZ?=
 =?us-ascii?Q?z0LF7PWaXvWWrwYk9mDiHBV1e7ZGtUKKaDT/E81WFeMvuue4ZM4DqNGtHENM?=
 =?us-ascii?Q?yKECGcUDKF+U6zZV1nb2R4Bh6/v3tTZPKQsLsbAHFSg5QwA/USA7XE+4AuVd?=
 =?us-ascii?Q?32GHkbsXTav8lbP2nnKRy5c4PtKO2yK3w/DASXzA4hIl01W91vPvFgSQzP0W?=
 =?us-ascii?Q?sqgOz13Xr2PMhAFs2AzN0GbfdqAs4iU=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e989f69-9dd3-4c97-e2c0-08dea031edb1
X-MS-Exchange-CrossTenant-AuthSource: AMDPR01MB11848.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 05:42:23.7604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkdLNpxk9ueImiTOfUbv6ER3g70+3WrM3ZUoWcquz0uJv9SdQt/CEH+5/qe0Ee8rz6LpUvnzkouMQGTCbRPjkkSC0JTBy3Zbu5Z+ltvCbLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB9411
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 05:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126540

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../framebuffer-vncserver/cmake.patch         | 24 ++++++++++++++++
 .../framebuffer-vncserver_git.bb              | 28 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/framebuffer-vncserver/framebuf=
fer-vncserver/cmake.patch
 create mode 100644 meta-oe/recipes-graphics/framebuffer-vncserver/framebuf=
fer-vncserver_git.bb

diff --git a/meta-oe/recipes-graphics/framebuffer-vncserver/framebuffer-vnc=
server/cmake.patch b/meta-oe/recipes-graphics/framebuffer-vncserver/framebu=
ffer-vncserver/cmake.patch
new file mode 100644
index 0000000000..03673ce323
--- /dev/null
+++ b/meta-oe/recipes-graphics/framebuffer-vncserver/framebuffer-vncserver/=
cmake.patch
@@ -0,0 +1,24 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg@jo-so.de>
+Date: Tue, 21 Apr 2026 20:20:42 +0200
+Subject: [PATCH] CMakeLists: Raise minimum version to 3.10
+
+CMake 4 requires at least 3.5, but suggests 3.10.
+
+Signed-off-by: J=F6rg Sommer <joerg@jo-so.de>
+Upstream-Status: Submitted [https://github.com/ponty/framebuffer-vncserver=
/pull/30]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c8b8f90..d342734 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ PROJECT(framebuffer-vncserver)
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
++CMAKE_MINIMUM_REQUIRED(VERSION 3.10)
+=20
+=20
+ FILE(GLOB SOURCES src/*.c)
diff --git a/meta-oe/recipes-graphics/framebuffer-vncserver/framebuffer-vnc=
server_git.bb b/meta-oe/recipes-graphics/framebuffer-vncserver/framebuffer-=
vncserver_git.bb
new file mode 100644
index 0000000000..d7ce066cb2
--- /dev/null
+++ b/meta-oe/recipes-graphics/framebuffer-vncserver/framebuffer-vncserver_=
git.bb
@@ -0,0 +1,28 @@
+SUMMARY =3D "VNC server for Linux framebuffer devices"
+DESCRIPTION =3D "\
+    The goal is to access remote embedded Linux systems without X. Impleme=
nted \
+    features: remote display, touchscreen, keyboard, rotation. Not impleme=
nted: \
+    file transfer, ... \
+"
+HOMEPAGE =3D "https://github.com/ponty/framebuffer-vncserver"
+BUGTRACKER =3D "https://github.com/ponty/framebuffer-vncserver/issues"
+SECTION =3D "graphics"
+
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8264535c0c4e9c6c335635c4026a802=
2"
+
+DEPENDS =3D "libvncserver"
+
+SRC_URI =3D "\
+    git://github.com/ponty/framebuffer-vncserver.git;protocol=3Dhttps;bran=
ch=3Dmaster \
+    file://cmake.patch \
+"
+SRCREV =3D "1963e57bebfde420baeecbb2c6848a2382488413"
+
+inherit cmake systemd
+
+do_install:append() {
+    install -m 644 -D -t ${D}${systemd_system_unitdir} ${S}/fbvnc.service
+}
+
+SYSTEMD_SERVICE:${PN} =3D "fbvnc.service"
--=20
2.53.0


