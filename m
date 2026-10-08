Return-Path: <t.schmelzer@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9929CA6012
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 10:06:56 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.135])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12205.1791454009876727164
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2026 03:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=J1bcqQGz;
 spf=pass (domain: phytec.de, ip: 40.107.130.135, mailfrom: t.schmelzer@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grZL54emSXa7aYAyQg2FTN6WipwMamsNixeaT9zQSJDXGDja+kPwalPbmquuCCTHdUzJ4vjWGYUjFjUhut47q0v2DztzYHFwdsuW4bQGO6r/yjLNRQV03gcEcNHywQ97h60pxYbhqLgxStqPyYhIf7Eam9azJCb7SiNwTipKb3sXV7mx9cEv/GCByefu9pzJjk3pPtuWYV7ONLrJedXXxebwSKd2Vo4s6vgyvRlmztiKslTsrVj6Yag1ccXO5idjcwln6H60vaqGJedi41YSCgzWg3TWbUhBU8MgHzAxnz3ylcNoYCiP+i7EbNC0kdY2fcPGVyyyEHGU3s0GtKFTZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGXhh+y0GrkP0bGc8nshubOmBgQnICFRj9kQEZx2g2w=;
 b=PIKVR5beZXTua9vCFvADtXVdIXPh5carEuZ0aE12BPGg5Ga8L5uI21Z11tT23hLJemrSQJtnR25SnWjrRQJJbwe5aG0/yFikMN59zNYQlgFeaD+yQ1V4ViHhGXNuy9Vq0uA3f05n4LGRgacdXiN2eTAkiovF1T4/WL4HAOO3vN4pXyY1jdfT5EJeaKTfm4STonmP24b7hA2oB4N54z8XsIJQnkyIM+mYELDN3i8X9MjTkGsoaDhAgjhzPOu/8Lr9/xSMpo4asTZiJB1Ppv5RntcW73sugc+nVtg7q9qKe1ZxuPn9vw7/P5yg3AXaGxORU28HQX2tZj0m+m7SoEBHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGXhh+y0GrkP0bGc8nshubOmBgQnICFRj9kQEZx2g2w=;
 b=J1bcqQGz55TbjfN3OfrRMjngVHou4dGiYkML55/cRtupsn3HxZNPMPNm7rW8Eg9dq+SGsfIxZP4Zr+uRhKkS5zQ3Rpqc7Sea3N8UReXNEgx6id9SAhZSvXBR0S9DD22E0K8/GPQARR2Pe0+KXwurRn6IJiE6gbPpizLkxgVLC0Zk0say9QIvUMC7C40HUOQQzwDJI79uc1TtsvT7RuYirhD00cI16CI+MDbsR+FlVjM52+9lWgwSzQrNnN/Vok4YVtZcyW2cyYRKWI24hb5Y47LTFKBaDeRupXFHfC+EkwqkNdScT6tXDRFUFEczzuNxAH+VI7TgGOtsfiw/a8Pgkw==
Received: from DUZPR01CA0345.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::28) by MI9P195MB976633.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:290:8b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 10:06:43 +0000
Received: from MAD0EPF000008BA.eurprd04.prod.outlook.com
 (2603:10a6:10:4b8:cafe::59) by DUZPR01CA0345.outlook.office365.com
 (2603:10a6:10:4b8::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 10:06:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 MAD0EPF000008BA.mail.protection.outlook.com (10.167.241.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 10:06:43 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 12:06:41 +0200
From: Thorsten Schmelzer <t.schmelzer@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <upstream@lists.phytec.de>
Subject: [meta-oe][PATCH 2/5] lvgl: Update defconfig
Date: Thu, 8 Oct 2026 12:06:23 +0200
Message-ID: <20261008100626.2259941-3-t.schmelzer@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008100626.2259941-1-t.schmelzer@phytec.de>
References: <20261008100626.2259941-1-t.schmelzer@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BA:EE_|MI9P195MB976633:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc23c22-2007-4887-8205-08df2523dadb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|42112799006|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	YGNFq/dZ50jcAtCBRMLEpuZBL8z4xPyyoju9yGn5XgDy56nRUryEadL/ouk7adTn8l4y8nqYqFlfN+wvSOX0mLITPuSF4aZDanY6jp4Jzg3IfVcHjjv25sL7yjDZrYUkwm8Z7u6mdmJ6/Bst6VakJUKNgda+ZvxcM2O/Cs++f7tiUR3JDXBlmXffYcSspqEG1OwfHu+VShF/RCMZY0EbIm9Xmce8gs5BHB9KRrWDFS70cx4MClX5P327vr0lfo+ImhPx5bspjVqZCT5TP9L67pUw0i2UIuPx65e7wBcSuRwPh3NXI3qZr5XVIPO2w3QRJJ+x5+oCkYnPGVqiJlihPJsqcNRf90o71LbEynRG7utuwxNJpUzmK6UWyI9Sajq1SKUT3FBObmAklc4gWR1Mrm7VxT+X+PaG/dbl/xgh2OM5iignQmu32VKWEsklnrmEeXAuxqv+puqB9fviD08PVWca+TcAu9jotgwPGIXaZSHbHEq2reWhfIQ+qViVjs02QK9uM89Jnq69aVCbjwGdCLERFSDdtonxMIxlCXZRImsBxB511J7EGVUTu/kxtvO6dq0OUM2uwzON4aUMMehJGuIYVbbuLxavaW0rEhrNUVzUNQnvC+DG90dXZKr3xvLDdd6h6y+ZDXrG1sMYUU/7OiWxVTBuRu6qo4fFQ2eu9bZTWW4kxrp+Hu3863/qvxWNead4Qh23GWWWseuuoc727g==
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(42112799006)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Mk0DaGdDtJdOTgkCuLqyAti+7gbfHzlyYAJaqaLlqLeDMEc5kZt44mb8CGYqHTLUZzh1rYXzyuf3TAcOwe9by3IlsRAPzhNyOiVnnB7m9IeKASyYuzAkfHYw4K3JnjGZmPv85DwYrbm2I7oarlWLv3ITQ/eiyPvDfPHHWVmT7l5MWYO0V3TpEl0At8j/1JVnCPRr+vvflyQKMWaevSzgE2f7WWJlJvS1A4hNfxGnoQATP2EPac/zDsMyZyxF7vRoJpy/SUBkRT6DYIS7w5OphfWjWw9hglWZG7siQuveVqlaxLS4DolBqRvS6XMT69sl3wpc0blkyMva4Ywn511KfWQbPC20sBQH3iabhF9fpuybJ4zg4TTdBieIqQu6c2b1bsn7LUF9RWUq/mfi97SnaA9RvWRUd9jinLfV25gfaWGYgaqXzrW6DQlxC4+ybRkP
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:06:43.5034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc23c22-2007-4887-8205-08df2523dadb
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	MAD0EPF000008BA.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9P195MB976633
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2026 10:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130664

Update the defconfig to use Linux default settings. Settings are taken
from the linux.defconfig from the source repository. This includes the
following changes:
- use libc based malloc, string, sprintf. Using libc based memory
  allocation eliminates the risk that the lvgl application runs out of
  memory because of fixed internal memory size.
- use OS based pthread implementation
- set refresh period to 16 ms (60 FPS max)
- increase LV_DRAW_LAYER_SIMPLE_BUF_SIZE and
  CONFIG_LV_DRAW_THREAD_STACK_SIZE

Signed-off-by: Thorsten Schmelzer <t.schmelzer@phytec.de>
---
 meta-oe/recipes-graphics/lvgl/files/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/files/defconfig b/meta-oe/recipe=
s-graphics/lvgl/files/defconfig
index 088b2369e957..3d0260f1f451 100644
--- a/meta-oe/recipes-graphics/lvgl/files/defconfig
+++ b/meta-oe/recipes-graphics/lvgl/files/defconfig
@@ -1,3 +1,10 @@
+CONFIG_LV_USE_CLIB_MALLOC=3Dy
+CONFIG_LV_USE_CLIB_STRING=3Dy
+CONFIG_LV_USE_CLIB_SPRINTF=3Dy
+CONFIG_LV_OS_PTHREAD=3Dy
 CONFIG_LV_COLOR_DEPTH_32=3Dy
+CONFIG_LV_DEF_REFR_PERIOD=3D16
+CONFIG_LV_DRAW_LAYER_SIMPLE_BUF_SIZE=3D262144
+CONFIG_LV_DRAW_THREAD_STACK_SIZE=3D65536
 # CONFIG_LV_BUILD_EXAMPLES is not set
 # CONFIG_LV_BUILD_DEMOS is not set

