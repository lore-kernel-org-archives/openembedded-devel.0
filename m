Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6319CAC5BB
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 02:47:54 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.61])
 by mx.groups.io with SMTP id smtpd.web10.4677.1758941271122697183
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 19:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=FkxZ2FHO;
 spf=pass (domain: axis.com, ip: 52.101.69.61, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXDf5NrdRAb7ujtma9/szZFuVvch3TH+QeZgJoegZ6gUEoMJV+NW68Yr6Spy51ZTvZE5WO6CjT+WDBGrD1qWCV2DL7cUEwHg18jGG3OTc2QQfCPHatLp2djyCioe2PdnbJB944oNuc0IrS7NBxT/Xu97cNmkyQOljezXrnOrenG3qQ2nakKCAX/+syGI1QHyt5fkRxgsfKS+txFgRocIUzUVIzdS6zYUSx/rIAekUHCjGc8WaO6ITFwk2SO/Hhw44OAmapF2E0zazX0HOgmhg/d/x9dwPDoG154NZAQ9C1eoBazbHW0KmmoOlPE9VGPdZwzcqWgUcnJozDpudzBNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCZRG1YUh3kWsIF62+pkHr/FfXu21CXiwaIqUBPtUdI=;
 b=r41RZ2Vk4O/u0l0mM51fpVigTMq8aRYa2QxAySF9he1ss+uOBZLqz9BLfPs5kXyieLeB/F0NrPS8Cd4+gH6PtHdudl9kBwC1fYIn/7jioegNxwVlBuoB9wLCP7AMMUZ04HqdCy0Gq4GCQRMH98GLJSsGGk00HQPrASot2lJEJXeVtuN/ItJjciKQ0rd4Z5UP1V1u+DfN9F2tVc2walxKO/TGbZNRA3BSnw/58ywU9ztR9gs+IjxiISf0BmZyyoRtbdD7pxRaptkpIvkIXq3lo0AKM3RbpDGCUohTZqpk0jJ+dzE0moVpZok0jKddz2Jk0kYeJGE0tykLaglqKFnpJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCZRG1YUh3kWsIF62+pkHr/FfXu21CXiwaIqUBPtUdI=;
 b=FkxZ2FHO9R9nTf8KKUFKdhQy5PT5KsDUTkDEdlFN8CzYmX5dfqAeXYimq+w85mFWQrx82kHbgb+IHSkrvArkBLk4sLrdzj/gC/Q+B34VMy+UwuIFA+4WFrtu9tkJM9JeYfpv6YAiFpKHDCofsZnrbpfuSRcxEfnsnTlnzYOnPq8=
Received: from CWLP123CA0144.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:87::36)
 by PA1PR02MB11618.eurprd02.prod.outlook.com (2603:10a6:102:558::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Sat, 27 Sep
 2025 02:47:46 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:401:87:cafe::97) by CWLP123CA0144.outlook.office365.com
 (2603:10a6:401:87::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.14 via Frontend Transport; Sat,
 27 Sep 2025 02:47:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9160.9 via Frontend Transport; Sat, 27 Sep 2025 02:47:46 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Sat, 27 Sep
 2025 04:47:45 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Sat, 27 Sep
 2025 04:47:45 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sat, 27 Sep 2025 04:47:45 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id F186084C
	for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 04:47:44 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 129DD12014E; Sat, 27 Sep 2025 04:47:44 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] opencv: Support building for native
Date: Sat, 27 Sep 2025 04:47:42 +0200
Message-ID: <20250927024742.1485096-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927024742.1485096-1-pkj@axis.com>
References: <20250927024742.1485096-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000048:EE_|PA1PR02MB11618:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e1c6b9-4e7d-4b71-8345-08ddfd703d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9HQX161L5LVFHcQArUSyORoLOjHMkfPUR4x/UAP9wm8F1zBs7txd+GsOQrcL?=
 =?us-ascii?Q?Yl690qrl3hYsFFMskloFCsrCagyfQGdik2FASQrgY3Tk+nNdUcxp3qh7EDYB?=
 =?us-ascii?Q?Sj9ocmTzah7a+gXmpzwg2dbQC/c0c9CVR7fNngfLLn/JM4n/96llLINrZAFs?=
 =?us-ascii?Q?+8Q0j7PZaLd+6q2N7Uc9Y096QLxvE6Ckg2cR5DX+FYH2yTyLXRmRbM5TTlnO?=
 =?us-ascii?Q?JxmEljy69lsR65aIIjx7qURs7eOam9Ld+a/giHJBbWCVY4bXSvwfvUH0wF+E?=
 =?us-ascii?Q?eA4idu9xhWvUfkZsMuYVerMhv5LaZCqu4gRW/LahSa9tTcLsSfZtiFudXiWt?=
 =?us-ascii?Q?LYbP3GqRNOM55fDIWnYyqI8Ak875nMgNF03yn/2jBclr1Q+UolMDnfThZJ4J?=
 =?us-ascii?Q?mQuu3RE2Nm9kJVBoC7KTors9Vk46OAiI3rgqU0QhEr1eygTohuCTkiUIk79q?=
 =?us-ascii?Q?bfhzG5IqpXBCc8lDehNF9vkdcJ0aElHyU/esFIl2yODiErWZ+iSFKncPz1ri?=
 =?us-ascii?Q?Sy/PzYhjrEybqY5OfURyrokrXw1VJ11H5jPQl3/JryaLuh2RoMVHIO4ZGlTd?=
 =?us-ascii?Q?rBVIG08e3Iw4/eKL9W8hXmDNxnXbNiwpa/gIm+3peYgti5X020Dioppbe3UR?=
 =?us-ascii?Q?a7tcGBSUFasDSi6lQHX5kp6Jii+fmqwiKS02/82UdRq6lDwbgfEhSZCMTuCG?=
 =?us-ascii?Q?z3p1pL4Q9XDPiIRAsEapQUAmbrQ43JEes0HTR5nFop/9YfM5b5HfLH9RFO+d?=
 =?us-ascii?Q?6YI0hRENJoqZ1Qt0NKer+Sg18YeIqJAKRyj3jmlTyPOdIwAQIpl03f6XGcM5?=
 =?us-ascii?Q?6Zq/0gMYrBN2bqYrN/6TSbUVfK5GMDYMPj4AdR4w5OGbUC1s8poa/FvmUpJm?=
 =?us-ascii?Q?SivbkUiU3LXudlGwUazt6AZ/l3G8dmM+glECy0GflVx7+6e5usIHymJIQ9Kl?=
 =?us-ascii?Q?4w7vHHBZq5/6vOlOaPvNytqnhxHzL6Mgyg5st6L6wsW4KO3YcsvYG6MiOQoJ?=
 =?us-ascii?Q?DaRhm0EEqzTxmjLY8D5FGmzzGiYyusxc1kWXj5TLEOf4ZCxupl3kOtXJO9n9?=
 =?us-ascii?Q?f0kaPnE2HO0ukwYuL8KNfyIDmBfzPQTc4CvUFPAerrgVh9NCveDgVhNn4ary?=
 =?us-ascii?Q?1LhSTS4vd7YRGh3LMjGQNn8YbtT1ewLNE4w0NuzFdcEXqJPZdazol6I1KGsj?=
 =?us-ascii?Q?7LY/nWxxuJptShGvDc3lI78ZK1XJxYGO4U+gQ5KXwl8aw0pkGC2ujLGSdktY?=
 =?us-ascii?Q?vCKtRI75zhL7vsbsqJHdbw3foSawv0WX/HMMOLF+5r8lZLV4mSI/heiCMyYw?=
 =?us-ascii?Q?ExvC8CogTvRWPnJ7p9nwxFPJS8wRf/cSGXHedFz4/3yyljSfvF5Qrr2Q2bR6?=
 =?us-ascii?Q?bhqZJ1PykSSzbg32JKPgmc3M8cyeq0FH2EZqdFElmELMRDNFqRNLPBMazFe+?=
 =?us-ascii?Q?LX8O2gu0B/V7Ek+WbcRvOKLhdL4y38OyXdq/Yz0dTNhYeSerPkphIjlyvBfi?=
 =?us-ascii?Q?QB3djsQlAcZqjIf+PTBwyhOFNfMFtwWI5Mtcj1HTR6PkeVCrxcuEi1ZUX2uT?=
 =?us-ascii?Q?Vzx/Uqo1XP3TJp16QXw=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 02:47:46.4744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e1c6b9-4e7d-4b71-8345-08ddfd703d6c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11618
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 02:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119949

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/reci=
pes-support/opencv/opencv_4.12.0.bb
index d1ab87b06f..27499caa92 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
@@ -200,11 +200,6 @@ do_install:append() {
         mv ${D}/usr/lib/* ${D}/${libdir}/
         rm -rf ${D}/usr/lib
     fi
-    # remove build host path to improve reproducibility
-    if [ -f ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake ]; then
-        sed -e 's@${STAGING_DIR_HOST}@@g' \
-            -i ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake
-    fi
     # remove setup_vars_opencv4.sh as its content is confusing and useless
     if [ -f ${D}${bindir}/setup_vars_opencv4.sh ]; then
         rm -rf ${D}${bindir}/setup_vars_opencv4.sh
@@ -222,3 +217,13 @@ do_install:append() {
         mv ${D}/${bindir}/shape ${D}/${bindir}/opencv_shape
     fi
 }
+
+do_install:append:class-target() {
+    # remove build host path to improve reproducibility
+    if [ -f ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake ]; then
+        sed -e 's@${STAGING_DIR_HOST}@@g' \
+            -i ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake
+    fi
+}
+
+BBCLASSEXTEND =3D "native"

