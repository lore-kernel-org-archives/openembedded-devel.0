Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FF0CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 00:31:32 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.24])
 by mx.groups.io with SMTP id smtpd.web11.791.1758673888921298025
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 17:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=imnA64a2;
 spf=pass (domain: axis.com, ip: 52.101.69.24, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lu1dv7btQq4Zic921eSaMiyPOKgVOl92D+VwTH+HFPQ7VBQJxQhpgamnO9hemjNEI8WwFKkaHqdT5C5XYosQckGvuv14V8rFbsXQsfxQVuE0xQmU7HaYg6SsfAW1OsAcafUB9KRLd5uMzzy7uEjkN/Va1bIkzBJ2O/dABl97tX0MXCtAqKgKyrMevI1/gxMvjwFBTvIZrbBQpzqAvVb0MuTVs85Kno4Hc3uauqAvtYuuA9Kge8Re0VY4BE3Qbb278l17pLA0/3t67kY2m0n+WbTI27l0QJVLj0MNdu0mscS8XZATkBjyJ+2hPX7dDxHvhE/b10m2Lxc1l9sR1Vhm2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnnBlWRCyjeX0na15f3Pj88kK8+BSiSVAgwAoc7C/jg=;
 b=JYo8zLYM7Y8pzE4oE36SrLWRklJPBvC4cgIN1UA3nmt+lVjMGgOjS8jLU8a7evTdCMQq7/BFwEHciGtdshBJ2dGKhctyOm8JLaj0mo6zh5AskAxBpAq+JFjYOpRE74ySubizue5woFro23yjkS//ldiPXHiEXxsRkWOMigLsHgSWGyyuk7C5V8QiU9VY14je5+w6Rb/eWSrxjbF7z+njDOVNlh7agDR6uGGOepaqsaBUMKAopYe96MXdo5dGBltBk5WYoFkxEF4OcugxHRnkCiwOkHspW4+6COGTBQ5n8958QTZENFpSuwJKrXAh8Es6e+AAMNApkLUlwAv0KAe1Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnnBlWRCyjeX0na15f3Pj88kK8+BSiSVAgwAoc7C/jg=;
 b=imnA64a2YcfeSxsQr/51/70IqAVvi0sXPktduyjifqBsVS6RrgxeVQjMAkQNNEjIOvsTf+Mmt0ArzUIsV5jPSTthYwE9PaLTN9Le8cY0a2EjQ/uhFtIrlEvS2BGPY4yhnKbAwGJAu/C1yc0BYfVVVVig1LXXasdHCujKCHkhnaU=
Received: from AM0PR08CA0020.eurprd08.prod.outlook.com (2603:10a6:208:d2::33)
 by AM7PR02MB6355.eurprd02.prod.outlook.com (2603:10a6:20b:1c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 00:31:24 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:208:d2:cafe::d5) by AM0PR08CA0020.outlook.office365.com
 (2603:10a6:208:d2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Wed,
 24 Sep 2025 00:31:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9160.9 via Frontend Transport; Wed, 24 Sep 2025 00:31:23 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 24 Sep
 2025 02:31:23 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 24 Sep 2025 02:31:23 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 6B8C32988
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 02:31:23 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 94AE7120371; Wed, 24 Sep 2025 02:31:22 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] hostapd: Backport a patch to build SAE-PK correctly
Date: Wed, 24 Sep 2025 02:31:19 +0200
Message-ID: <20250924003119.515634-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A796:EE_|AM7PR02MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 0334bd77-1d46-441c-c4c2-08ddfb01b0ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HpMKUiROgKAe+b6Q7Vu0lUN9GD/CR7Xg0DHtqxGWS3GeO0bCM4jCHmx75/JE?=
 =?us-ascii?Q?G5od5VFy70d2rKkf6Vk7PmrzAI+G0P9zke8V0hYEYrVzVzQ7TlSz4cc0Xwff?=
 =?us-ascii?Q?B3hyfOYPGCalep8XqTOgs6Pz9FXgIOVt7wvtn0WcT1YWDmxjIvgye3/LZOUL?=
 =?us-ascii?Q?kmBZn7HLHZy+uvm2lAF9lX5agVByMeL5Zj+VSLW1B0d514AZ8bad8a7prMjL?=
 =?us-ascii?Q?2tahkNUoCHABh9e6Qn2SzsUD/GqvIUS06FqdVgugN1piMNJVLGu3Os1fYMQ2?=
 =?us-ascii?Q?b0dPzhEaJ9L3ZwoHsPwZUn+oTn9/Ju7f2BtqQxtDSIaXBaSCHEEA5oIok5pp?=
 =?us-ascii?Q?6GxEsbYEoepvakIr5rUtZ5L9TStIvmsI6f7OG2+KZ8g3fI1f4h3Ub5EI5/4u?=
 =?us-ascii?Q?erEM22nJUutuy6JlfUm9c7aL48PssxMuku+8tXVQjjbh6lvEq8Lo17xuW+3S?=
 =?us-ascii?Q?z4fVuBmO3bcksKbz0dBTj1o5SznV/kYVqfiJVRmd6canJzbLVeYsOqk3qCy1?=
 =?us-ascii?Q?kzTn7kOBH344UEhg6oNnVxPmvJYu4nsbRJrYdYhsynR/IXkEPbgAqZjAF98P?=
 =?us-ascii?Q?ZVmd3xb5KdsZdpN7fjsD3xnlCaHBcLqb97k8saoH/mJp5/vfX5MFCaKQYwjZ?=
 =?us-ascii?Q?scEq1Q6qXveMlxzo5zMAwaz7wsiWsE0hCFDVB3KpK9DF+c5nS9R1BB8u0Gqh?=
 =?us-ascii?Q?am8j+kiqgFxAYVqMRi5FYKMar8yakrEnCzEeDxjTN9OQAeTGrXho/ddJ8N5V?=
 =?us-ascii?Q?8utyspIXFj491GdhEjSTJr/8uJVUXDJdYYzr8Flc1i651TxSswu7mlTObJbM?=
 =?us-ascii?Q?Fc5EWZZWsAC6DdQSrzRlrfUqZKGDIktBrSIeJjDY0twAhvaVZTQFLH+G3M6E?=
 =?us-ascii?Q?EQMS4XLYe0QofEUKZWedcrtrTIZOf6WmQhgierjNELpUI3GUOclfTjhdaYDK?=
 =?us-ascii?Q?bDSi8jPyI8IH9lb4vheJCOdiKLTR9ciM03wgnCqchC7bXqBVHZmYe6hWKyW+?=
 =?us-ascii?Q?758lxK/1om5fIGTk28t0FGfEx6MUfjDrDWrYpwL6LhwgrZvf2cyALN/6SY1l?=
 =?us-ascii?Q?cE/LD4j/7VhcY//EdxxNmeqf3e47mK1zfApm0reZQOdj/g4X6LhzqfN4Ke65?=
 =?us-ascii?Q?PmxWZQSqPXJiOGRtgZpMmaLLM6aC1VXUgKAbejPuofmLBAY21CJ2lzytrBjk?=
 =?us-ascii?Q?lVo3n5tB/6FxCzSyVHIrUu2Oopf1nSkmfpKC9F0+WV0dckTuNVzolhWApEha?=
 =?us-ascii?Q?uZaWUZGAWQF9Rs7/USag95UPRP+bpx9U8NrLZZgyjGJBhdtQaDvAkEN4VkSV?=
 =?us-ascii?Q?M7fMfcWVo7i419l0jlm3GfnkOqJJrvWWJ7SIqgrT0Gh83ec7TPPSwno3wSrZ?=
 =?us-ascii?Q?KuTlvg/axliOQYGM6qeSyj5BkdgRxb/rq8/fscDlvlWmPS/YReQcT3ldonXd?=
 =?us-ascii?Q?onSWl0311msKppHiA2rh7Gvf/Y9fZwdpyO2jIem1aRIDQzkVt8e0uA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 00:31:23.8104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0334bd77-1d46-441c-c4c2-08ddfb01b0ef
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6355
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 00:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119739

SAE-PK needs base64_decode(), but if no other feature is enabled that
needs base64 support, then it is missing.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...e64-for-hostapd-CONFIG_SAE_PK-builds.patch | 40 +++++++++++++++++++
 .../hostapd/hostapd_2.11.bb                   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-Inclu=
de-base64-for-hostapd-CONFIG_SAE_PK-builds.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base=
64-for-hostapd-CONFIG_SAE_PK-builds.patch b/meta-oe/recipes-connectivity/ho=
stapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch
new file mode 100644
index 0000000000..e790e8e0f2
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-=
hostapd-CONFIG_SAE_PK-builds.patch
@@ -0,0 +1,40 @@
+From 430bc89b9a29537d9d22bb42406f3d14072a01d4 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sun, 22 Dec 2024 18:53:12 +0200
+Subject: [PATCH] Include base64 for hostapd CONFIG_SAE_PK builds
+
+CONFIG_SAE_PK=3Dy needs base64 functionality, so set NEED_BASE64
+automatically for it.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=3D430b=
c89b9a29537d9d22bb42406f3d14072a01d4]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ hostapd/Android.mk | 1 +
+ hostapd/Makefile   | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/hostapd/Android.mk b/hostapd/Android.mk
+index e6c2fbf18..6e0d77d28 100644
+--- a/hostapd/Android.mk
++++ b/hostapd/Android.mk
+@@ -260,6 +260,7 @@ OBJS +=3D src/common/sae.c
+ ifdef CONFIG_SAE_PK
+ L_CFLAGS +=3D -DCONFIG_SAE_PK
+ NEED_AES_SIV=3Dy
++NEED_BASE64=3Dy
+ OBJS +=3D src/common/sae_pk.c
+ endif
+ NEED_ECC=3Dy
+diff --git a/hostapd/Makefile b/hostapd/Makefile
+index fa0d366a8..c3419c10e 100644
+--- a/hostapd/Makefile
++++ b/hostapd/Makefile
+@@ -299,6 +299,7 @@ OBJS +=3D ../src/common/sae.o
+ ifdef CONFIG_SAE_PK
+ CFLAGS +=3D -DCONFIG_SAE_PK
+ NEED_AES_SIV=3Dy
++NEED_BASE64=3Dy
+ OBJS +=3D ../src/common/sae_pk.o
+ endif
+ NEED_ECC=3Dy
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb b/meta-oe=
/recipes-connectivity/hostapd/hostapd_2.11.bb
index 693afe6c53..daaf2dcd55 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
@@ -8,6 +8,7 @@ DEPENDS =3D "libnl openssl"
=20
 SRC_URI =3D " \
     http://w1.fi/releases/hostapd-${PV}.tar.gz \
+    file://0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch \
     file://defconfig \
     file://init \
     file://hostapd.service \

