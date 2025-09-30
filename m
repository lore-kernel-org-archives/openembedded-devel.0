Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AC3CCA474
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 07:18:50 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.31])
 by mx.groups.io with SMTP id smtpd.web11.10619.1759303126342870518
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 00:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=CvzXRa+k;
 spf=pass (domain: axis.com, ip: 52.101.65.31, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CV05CydInzyr+hUMxOmKw2fhKKC72DI6ZxzmYNW+aO442ysnNlQv1wH1folxysz6KFcUjjMXl4FvNGoeGcU2P4oV5qHjjD9a+RI6W32CAww4NoYZcnxLQ+sz7dnXoHqDBjmyPZ54YhZ1x/KBM2XX5gXSlP4TCzXeztqdZN5IC/VAeJ1gJ8t88caQptVGEsatf1viqBQTU6TnjBs+xkL+5o+fBk+fxGmvvQXQ36sGWshStt/yCuWJt+ww9+MR8bbtPbDM8vJWS9iZYjMJSh68VzVCazlvioTBSlW6hXjUAoXv7Cad90YE865mP9YeLn0DEJWKWB7vit8V1sF/U6EmvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjiJ+DKHn2zipSGRp+Wu3g6IDoy6E3JtPZ7/wZ/CA8g=;
 b=X1NSSxPmCyPBx7yw9OUZqmTcGj2xV0kg2TFkOnThfeOHTHky6qA8pMAVnk+pJGyOSoQRYyqjzCeeEJ+gM7D2noR17QGZ5zjb+4akC7pDba7cTcfb/SG2jyJ53hAfldlAseRNoFS9WW2lK/ux/q1lq7T5JHaZlEw5Fu+Guit4ohLCr10S3ImbpxLaYQsOdDJMsvtH7nHMYIgf1nM16JvFH7nJ6WzqEzzBOeVPdJOstgPwXK0kk9D/MsmdViRbgmDIcaZSkT6VRes0srn+GmJsDPt7JbGxtLnLXKMgpbCvK7yX6evNCL1j3zy6EcTsNz37GRZUIAi8n5cDmL7BpTwXRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjiJ+DKHn2zipSGRp+Wu3g6IDoy6E3JtPZ7/wZ/CA8g=;
 b=CvzXRa+kSkmIwkCThctHFZrHow9Q7RT4DZDpMWkSoDuRnakdtSfziJtp7YJBMThZqW72vWKV9FwMXrUBYsm3d+QjjV5pWUSr2W0HpmKb2oGgNU+A9yqLgJ9klB43Qso+WkUwmB+exFkBBXErKN1QQ1gqpFEJK18JEXp3LDWJDTU=
Received: from DUZPR01CA0259.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::7) by DB9PR02MB9780.eurprd02.prod.outlook.com
 (2603:10a6:10:451::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 07:18:40 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::33) by DUZPR01CA0259.outlook.office365.com
 (2603:10a6:10:4b9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Wed,
 1 Oct 2025 07:19:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 07:18:39 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 30 Sep
 2025 21:46:22 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 30 Sep
 2025 21:46:22 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 30 Sep 2025 21:46:22 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 81426AFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 21:46:22 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 90B8D129303; Tue, 30 Sep 2025 21:46:21 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][walnascar][PATCH 2/2] opencv: Support building for native
Date: Tue, 30 Sep 2025 21:46:19 +0200
Message-ID: <20250930194619.2348187-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930194619.2348187-1-pkj@axis.com>
References: <20250930194619.2348187-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B89:EE_|DB9PR02MB9780:EE_
X-MS-Office365-Filtering-Correlation-Id: d07e6921-282c-4359-ae38-08de00babed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6f5pfZc+ReXHVs/KP/cJ6bJRmdQGOE0HnCEMuCA+jPVAlpvnAUAufz/I7ixQ?=
 =?us-ascii?Q?PmArY9OAUUhXQU2FBZVgl06vJCxGtjvDT77HP9RpIIaVBMjcReVOSxMr5RtD?=
 =?us-ascii?Q?LZymwKmtxfaBNB7PhXS/IK/3nbgejSMdwXNlan3jXa8DgcRsAnZI4Sx1DEcX?=
 =?us-ascii?Q?Dhvge9YLu887d5FKwn9B9sCHs0zouIccM/Eh8TgmkPvKsccAsEIZi614f77X?=
 =?us-ascii?Q?IJntdbyM0XPRvLFFSZy7kkvZf5TMpECk2HS8yoKeJIOpB9GUlQDjgKTY6NaS?=
 =?us-ascii?Q?15SA+bd/aJw9gwgX2UUlFRgsZUJVKW2yADTBD62PQgQGZF1klvjXcbT2wTSz?=
 =?us-ascii?Q?QSMp8xnSDIMMlh9RUJ38kdJRThC6D/oH1cCEn8IQKiXFbVCjefU/BCNlY3Y0?=
 =?us-ascii?Q?IyVE8wY9BS7V9VApkKXh94Plt9Wk3QwTopoDf4oATA5Z1bnTnpregRCf2ur7?=
 =?us-ascii?Q?F79VkpGqaTaTDxeGmVFE/DlRuuh66/M/XaqhbJ/p1diz0xGuIyZqlrvcQrHY?=
 =?us-ascii?Q?wekCbWaAn5kmdR5kGbIFrLR1IHI8JMRzuhW+xFFqshss2JGl3pMQWTrwTSNE?=
 =?us-ascii?Q?QGUWfDav97j7yx+NRo+CCwiWXs0gorLOKHO7eH7ZLEa14VF9U880N/0ilgHl?=
 =?us-ascii?Q?gh//PgIfWkU5I90vCP29OzRGtv/jnVBszHXKrPvXaeYc27yMVxRThbqW+/BY?=
 =?us-ascii?Q?gL1pVr+AQnrx39xvZ2a9I9LHU59pQxDbli6GIHqF3yViMS1M7dKDiO/WXWdb?=
 =?us-ascii?Q?+Dc3J0w7YV5U+cszn0l1J6yYgMm6rVz8RNde0QF3Qi91+lxCovKu61zkOh+p?=
 =?us-ascii?Q?HFp7x4M2EL0E9CJIxJhdMJGujo0uUa11HuDeHib52UDVzwg69b0ay51DxRMI?=
 =?us-ascii?Q?73vNHevwpUPNYrKEUUERj7GhKlbRVZd2jqCrfCN9f4AHbCMOzoxiXahd0dir?=
 =?us-ascii?Q?j+n25q+PpCd0yy4ruB2FswNHcdQVgR8eAYjHOd3S1WS+GSResGFAnxGbRsjc?=
 =?us-ascii?Q?6RDeaGbWu8YSSvRFBkA3kbqbdPUQalS04RuomqHatISPx1XdyYJuFhVvUZdI?=
 =?us-ascii?Q?n+nABU/iws7ipY5JTcFuspjUKtuU3XRtTqo7BuqUlz/0tFjoJWa8bHvuRngq?=
 =?us-ascii?Q?ORzFmKeeJUl/Zs1X2uaAeMVGPf+6zPqJ1mvn//CoUVjkxJkTUk0jbnmylzMF?=
 =?us-ascii?Q?CgenrkopqMmap4bNs2aGEaO8/xUWdJTJQ5Oakv8pKxpN9sHY8i/2JXsU/wB3?=
 =?us-ascii?Q?Umb6r9jpDkO3YlH/IxY+Oiw0cfW5LvGDkSyzhpqDue0bUQLt6+krwS6AT+xR?=
 =?us-ascii?Q?nv+NpNn1mC3f+XxExGlPNui5i3BZGPWE/WVj3Vrn380yeC/eG/RNmfCs2djN?=
 =?us-ascii?Q?9wODlOMltKcSibutQkINWRGAoVtPHjYJljRsCb03R6O5tHWvXuubVWkey5YY?=
 =?us-ascii?Q?y4q7X/NNujO7bndU9I+BWi6XAk6jsIY+T2Hv+vaC7c7RZEvLa4MQumghC3EB?=
 =?us-ascii?Q?35eTcDUmQ+tQB9XS3SJBYrUl6nVWNPmmOEvgEBsPPMDVkQVYHm00MjdBP4At?=
 =?us-ascii?Q?Ml125g4W18sf9GdoHGk=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 07:18:39.7975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d07e6921-282c-4359-ae38-08de00babed1
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB9780
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 07:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120089

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/opencv/opencv_4.11.0.bb | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/reci=
pes-support/opencv/opencv_4.11.0.bb
index 61dc681a39..f063c1c35d 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
@@ -204,11 +204,6 @@ do_install:append() {
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
@@ -220,3 +215,13 @@ do_install:append() {
         fi
     done
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

