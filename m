Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C0FCCF9EF
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:18:23 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.25])
 by mx.groups.io with SMTP id smtpd.web10.691.1761362299462055315
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=UdSUIsUj;
 spf=pass (domain: axis.com, ip: 52.101.83.25, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmKDVPLtrYAPdvMzGQaTCYD/Y/Lowqor4XMesd8UV9kdBoXHCwxUUiEpKikq5APpevQqHOV3RdAevhBojf/aNu49fDa5IWIXnz9E5Chz0tKYx37VyFYIATfraPgmoNQlBV8CZ113wB5Z9Yk29pXo/Ec97fo0dz3uxNRC7mqh49cvmtI5O0Drup0tCnO1JUanP6Ur2jEfFXkTXc3iHnqs1QBwMmWWahoXszzksiwEMdgWdmpl37pJPmOTn91TXoJI9RLYQDUcRKTq1ObV0dWRpvs5T2PVmlF7KdUljbsnRmA+SBWFC1BOa0z8oCv7rytW3c/Ff91wuVJganhtqbiyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIZQrPtY8KRtm7C7QTZizC/CRxIp9AOGrERJL0qcO6I=;
 b=wahck76AiNfIqj+Xvo9Odhoj4C+12R2T5lNDs5Ey6i0+ik8I95pPD/gKS7BdPmWGZ+Ob5ksoCyKJ7iVbehLhSSTlM8w/ClBdgomWL2jVHHEcObOcwOpyV0QxNoNPyN5ZcnZ2e29Q4Pu+r3Zkb5aOOtkWx+hGAomMY8/jibIiv3Kp05L86cUOW/auaACQ1V2s2322SKlr4/3Y2DoZT5mh1hbvRnwx6QW/JYjCqI8+p5nYH2UxGGkepjMDiS9g/04rma6ZsGlaVPV8qe+tBhUtIlI0Kbz29D9T6YwKJ0o3mc9sGVCl0bHk91LKFNwcKF8j8sJl6kwfLoKfZxccrEhS2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIZQrPtY8KRtm7C7QTZizC/CRxIp9AOGrERJL0qcO6I=;
 b=UdSUIsUjTK+inQkv/1FlGTtt+0Uq9HMaLDWHS3zRr6lav5D1k8JbX1TdmaZVqspW6bJLc2QyAtNQw+tTlbNmKaCFvenEy5vKSwjKhYm8RJsqgU+WD+ncPU4jvbEsW5+61imSpXQxMIy6NceC14XNMIMXChAm385qBUb86JJp9L0=
Received: from DU7P251CA0024.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::11)
 by AMDPR02MB11552.eurprd02.prod.outlook.com (2603:10a6:20b:73d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Sat, 25 Oct
 2025 03:18:14 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::91) by DU7P251CA0024.outlook.office365.com
 (2603:10a6:10:551::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.15 via Frontend Transport; Sat,
 25 Oct 2025 03:18:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9253.7 via Frontend Transport; Sat, 25 Oct 2025 03:18:13 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sat, 25 Oct
 2025 05:18:13 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Sat, 25 Oct
 2025 05:18:13 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Sat, 25 Oct 2025 05:18:13 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 2D3BB292
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 05:18:13 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id E17EB1200DD; Sat, 25 Oct 2025 05:18:11 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/9] python3-kconfiglib: Move to meta-oe
Date: Sat, 25 Oct 2025 05:17:41 +0200
Message-ID: <20251025031748.2728416-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025031748.2728416-1-pkj@axis.com>
References: <20251025031748.2728416-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|AMDPR02MB11552:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf9dac1-7532-4e34-a780-08de1375221a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CRD50UffuSED1vLCzCknt27Hyp2hLr1fo/1SlwsKCDoaD7OtEO7PCwa5L/n2?=
 =?us-ascii?Q?PFhNRk/Wr1ZNssWES70xQmMQpdmOgOcNzn8KeE7SeMcqJM9mMnBPeD848Kan?=
 =?us-ascii?Q?ngm3VRzxB+7VvpH4AM4/Zx267B7CHmrvVCt4FUFiTJ7vUPHNYTSWsn7F7uce?=
 =?us-ascii?Q?wa1MRCstGAHXABsi5in4GCKOoslXl4OZV86ys9aSYRWhdEkK7PbHQMP0nKOe?=
 =?us-ascii?Q?0FthRiGaaCsidp/fBkfCY7cKz21hAixElEaE842UkmrSwpRoVv4OgdvvvVKD?=
 =?us-ascii?Q?XP9HlzxyRZ6Xo4RleKefcf8+SskUW7sW4w/FnksZM89Qs3GgbWLc635hNpho?=
 =?us-ascii?Q?00Afib7eBm+hMRjXrUQ8Mj39tqsYjScrgx+ge35rKI4JNjcm4+4AFhEZpVGX?=
 =?us-ascii?Q?tRK5/TexjxBbwLWNUo60x8fProxcS1DOo0e60OQIJRppIm2rDyC1rgqUj0DA?=
 =?us-ascii?Q?1sA7cVraHsrp6T31t6JzXYgi6Ta2n8cZMuwOYYxv/zznnF6QiyN4P5S4cWFr?=
 =?us-ascii?Q?xRTITfzdgqCaMIi+F32mGxrHBQu5y8Rju3sXodH1RZ7Sev+VDZUAENE+CjGe?=
 =?us-ascii?Q?wKaK9n180uZDaeQSjdMdxYioPqH8Lua2O9oyHo04al+6eGNjr1RCGvYGK8m6?=
 =?us-ascii?Q?SN9bdaamunNseD9tRo1URB7h95XufRaZPZtYXiHY84iixxJxpen32SXAUIxf?=
 =?us-ascii?Q?gTr2tyeB6T7Gg1lfBK3MOs9Biy/U6ZiK4fa/0fuox1rCQd+8ZYmi67VRzBNF?=
 =?us-ascii?Q?LHm6s0wHkdl//ZKDVk+PXBH2VlJeJAez5/kupJi6bGmKk+FZBQGKLvFHn/Hw?=
 =?us-ascii?Q?HLKt6ziVwrkRQtq/NAGPUD+LFJvjX/Tuq9Z38qi3xnnVGjsicbqAhM6m7Nlv?=
 =?us-ascii?Q?y+0xfU/Ae5GeYdwfcsKkARjWH5yyODF1p70RkaJPntlMOISHmz2YuHPYnGKH?=
 =?us-ascii?Q?wnzE/e3a3WRRuq8kIIhoe7NrZxqzjkHaMKVmgO7C3B2oLR1MmVhOx1Uv5r+e?=
 =?us-ascii?Q?Lk5iyEzMQweifnwLPr+Hwk8mG9yD7X0mYMlc0U2eitz2rCJX+W9Fd9FifVVq?=
 =?us-ascii?Q?YhaZzEi6bbMeTT++ouFRN+GAug7ZVkdbqPAvOJTkRxvibMvNQTZdDMtISzXE?=
 =?us-ascii?Q?3sn058jgoIMKSxxPLv5myODy7gDQrfsyPpg/iFxKECaKspfRItiAbdgXYdtC?=
 =?us-ascii?Q?BpoX2Gssoie63lyankVWUpUYDW8iqlEL4uWhWOe53WCNiuuMBcFeILhwvvwA?=
 =?us-ascii?Q?ce+XhKlPa7HuGMTSf3w9AXYF50zCs5zVd2ZsMIxq81LLMAAMcvW7QvRNM6fj?=
 =?us-ascii?Q?Yaw79+HFhoZPLzkWMsumMbjTn0OPT9Ytvw0b2BMFI6SDd/a3Ohgqxz/bga8b?=
 =?us-ascii?Q?/Erjyv9l1c7mcdtGnyYUmiY/T/Ak9lU7iDVx4EPWMpd67QX+aLOLXGM2FLJG?=
 =?us-ascii?Q?/KIWhIPKVfR2cpvyy24hiUiXQvNcrq00LolZZTzuuwvvg51Fc2xOk5dtW39N?=
 =?us-ascii?Q?2iqdTO35LEqlAGREiqAyfFN8VHGYfaExwt/LcE6lmKOjZGaWqMmYEqKTRw9B?=
 =?us-ascii?Q?Q1P0CRglNtO/CNS2/0I=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 03:18:13.6939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf9dac1-7532-4e34-a780-08de1375221a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR02MB11552
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120977

It will be needed by lvgl.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb       | 1 +
 .../recipes-devtools/python/python3-kconfiglib_14.1.0.bb         | 0
 .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 -
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename {meta-python =3D> meta-oe}/recipes-devtools/python/python3-kconfigl=
ib_14.1.0.bb (100%)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index b331fbebe1..0458662f97 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -280,6 +280,7 @@ RDEPENDS:packagegroup-meta-oe-devtools =3D "\
     protobuf-c \
     pugixml \
     python3-distutils-extra \
+    python3-kconfiglib \
     python3-pcpp \
     python3-pycups \
     rapidjson \
diff --git a/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.=
bb b/meta-oe/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.b=
b
rename to meta-oe/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pytho=
n.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 21b79b9c50..9b06096d1d 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -210,7 +210,6 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
     python3-jsonref \
     python3-jsonschema \
     python3-jstyleson \
-    python3-kconfiglib \
     python3-keras-applications \
     python3-keras-preprocessing \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 opengl", "python3-kivy", =
"", d)} \

