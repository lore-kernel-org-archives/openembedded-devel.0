Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF49C54FB3
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 20:55:00 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.0])
 by mx.groups.io with SMTP id smtpd.web10.35392.1748811292202614961
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Jun 2025 13:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=MRNLbxwz;
 spf=pass (domain: axis.com, ip: 52.101.65.0, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxwO426bczMMczZ+lVxvNZ14vvQxCdBtynq5SFhvJy9pFM/RtSAJPLKRh/j1M8IdLFUbd4LNWDmGSJ3nO3GoQKnCo40mb3Vac/2IzpUQyoxhqAoXWmiDlhIZX2mG80TB1Pg4/ZSYAi2lPYyBrg7vqk3iQ2IDXpxeMmdqQwSST1iDARq23AfH4kyDhVZEhNSPyf4tS+eUBVn1ifRgdMQzaVl1gHq6K7n5iXa5TK9YHnhcGWxxHST1IILFrwEIzYQabl0YdziXNBFWkd/m+zB5cS8PdQllp0c3nIYQ8O6MrYUKfOlTbALiwwZbwKPFL1JXIHlgBUlD2WVUaV8VLMddCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fl29y3tuEczNZEz1hToiRtukUVlY/CFOiCkj+OUJRhw=;
 b=ih1SC3EIGvbr/uwdGzwDHMeXm9C0Alg+KNJgzX/+jU/jzYs5Pa/085+FGYiOfpYcRn5zW1moScdIPv4I99YLuH8AM+CYYtgLOLzcn7d/3zLJf6qOntWWU2lTDuQMqn/4xgV8wnH1vKH014ZjiJRlSi/TXS+LyL7SK9XO2JZXziUWCZX6hXiOp8dUDMryu/R+tJDuYPkmBgQnQ+yJKiQTA0/XwmbhxuJJOf5cZXxCxDqvsZ+064S1S283Db8/mxogOCEYiEVj/ld1e07Y144hyFYZwjbKX3xZqAU7ceGA9lQm7Y4AHfOmUipVPpN/QhyasPNBdGXhTjdcyXuBXXgdgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fl29y3tuEczNZEz1hToiRtukUVlY/CFOiCkj+OUJRhw=;
 b=MRNLbxwzrjIA4Ov0T6Ui102T0FK4bclDkbJ6sPuFi281uPeyfRpb/p0L74xIVxex2jJa5tu2ZMz3prhqzNGwWqd9THbxCP9qZQriIynbJJqBmfIg3Mgvpr0HukpmDRISVVfXL6MkoJRar24K5yW6iWRmr4zND9R7/dhlOGnf6x8=
Received: from DB7PR03CA0085.eurprd03.prod.outlook.com (2603:10a6:10:72::26)
 by DB9PR02MB9732.eurprd02.prod.outlook.com (2603:10a6:10:459::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.23; Sun, 1 Jun
 2025 20:54:46 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:72:cafe::30) by DB7PR03CA0085.outlook.office365.com
 (2603:10a6:10:72::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.21 via Frontend Transport; Sun,
 1 Jun 2025 20:54:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Sun, 1 Jun 2025 20:54:45 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sun, 1 Jun
 2025 22:54:45 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sun, 1 Jun 2025 22:54:45 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 6C6EDA77
	for <openembedded-devel@lists.openembedded.org>; Sun,  1 Jun 2025 22:54:45 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 67C4312038E; Sun,  1 Jun 2025 22:54:45 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] abseil-cpp: Backport a patch to build code that uses C++17 with GCC 15
Date: Sun, 1 Jun 2025 22:54:33 +0200
Message-ID: <20250601205433.550936-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|DB9PR02MB9732:EE_
X-MS-Office365-Filtering-Correlation-Id: 7210483a-b47a-44f7-271e-08dda14e8a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YOAGnDoN4oMYZ8PCbCHNY62X2noUksunpnd3CIzgRth054MwmLZvh1kjldrm?=
 =?us-ascii?Q?ZnJFZMFy2Knt+gJf1ND9VZQv0+vdmDgP84SoM44tYBcWYP0cnU1kucxvSwnZ?=
 =?us-ascii?Q?uYATcrBEahfC22oi9CMFC4wrWNCpBd67NTgMlk+YBDIu2iv5nBHmwv3/B/Kt?=
 =?us-ascii?Q?2xZXOiDn2x23yb/T1MXpUzbVyLdYSxJ91QYB6Tv6eptHytyJY8iwOIY2Mv6U?=
 =?us-ascii?Q?vfWJveRahT8E5RydSt6M9BtK/tk+coQs7teUO7oyAKHMUZMCDV+r+e/zheMr?=
 =?us-ascii?Q?q+7QYHuIGGe1AqKS0UvW9JzealqZsRxXz5VnfrcjHLm1BFBaOawJRJRlOoML?=
 =?us-ascii?Q?OwDQhU3r6WbUu1mzgKe81chLQPF2UtyE8KHoI8SCSfzB4U0pjVVmsnf8Enay?=
 =?us-ascii?Q?2der9d9buZ7pTIMrxvt6c88v07P6DgDwNmx04TX9xIfZVwHLadKlpdlBv/oF?=
 =?us-ascii?Q?pATM3UmW04FsuCZtGPqBcyLmRlXNJO0hXqY8e2xOvabPINcXVwydlGzId6re?=
 =?us-ascii?Q?18rFIL5w0k/Wpva2fgPbbt7smn/jSIm2nj77586CLUIYwK+xkOKNXDXKUhXE?=
 =?us-ascii?Q?kJZTlzee8GLCTTHJ8WjxG2r4iYqjA7PLCJD/2pvDWrMoMUyAMjsFayXECwTP?=
 =?us-ascii?Q?JMLIOpcY7irKvzWF1wUSeQGgr6mceKGBF4yvylmqkB2igBjfW6QnzDkV6U0J?=
 =?us-ascii?Q?YLi5BM0RiPOinoxSJeBySkFLpCKTxtj2I16gSseOze5af02AqcVQLYJ4Vrm7?=
 =?us-ascii?Q?gHwEueSTfOZySWXHBJqt+i4yeqRxNofVuBTo/QRb1xnl6xeAv+j8/N/Qe2Vb?=
 =?us-ascii?Q?JSO/B1uAjOqv3v6TP9st9AaWjZ4ootindkSkFdDkX2xKQPYwv2fZ539DuEQi?=
 =?us-ascii?Q?Ih8e0uw5a7vPjv5R7cQzQdLh3JUD2hkIXhuj6SLavSCd4Zq6UykMxQHWBu8F?=
 =?us-ascii?Q?RJZDy3LOOgngEDzYLCoT+MJzkGRLNdWYC4kUCxe5Zd/q6qSKU5x+QWZ0I8rI?=
 =?us-ascii?Q?OSqk3liZg3cyM5ChA6zWaFeD4NNz7CkJN+Nh2rX17r/TqLNKA5/sBxDCz7DL?=
 =?us-ascii?Q?66aC7Atg3DrL0FV7DWZ5qu9VfmflF8Hmg3mtRlJZA3N2lio58GxPYOItijqU?=
 =?us-ascii?Q?NzTApjCkuUkuuLwc+tyF6mmCZPzuASbi0iGZNfdctedGG/UiaTnQBXJLoyl0?=
 =?us-ascii?Q?ZyarOKOh06cvGUFfCQPhGyDcRFJHKqFbJYoJFHvL7kAy2z63vImESWot/lXi?=
 =?us-ascii?Q?7WmQZF8fmcPRtLKqDESuZaR8rVujzD2PxGaC0TDyi7xZjs7hvOukJCf0hZM1?=
 =?us-ascii?Q?+y7FOMVHIiU9wgNunXe13zVyv6kndS/tdxM/iPePMkp8GBNRSWt2d+nVwnZz?=
 =?us-ascii?Q?M5E9dy/sYwlvESsuP+SsffBO4G9FMLUmrGsxhrK5Ja/bCUDKZR8XMjee1CPO?=
 =?us-ascii?Q?PMkAA0SVQJq2m972NZDAV9GWA7Kcs0gdnusbl44gMb8/G7eFWQDErJbChmfx?=
 =?us-ascii?Q?bnu+xNYrs/Jx+aRsHrZfUmbp/Y+gYYgGtqY1?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2025 20:54:45.8222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7210483a-b47a-44f7-271e-08dda14e8a72
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB9732
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Jun 2025 20:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117695

GCC 15 seems to be confused about when the <version> header was
introduced (C++20) and expects it to be used with C++17.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...g-that-ciso646-is-deprecated-in-C-17.patch | 43 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_20250127.1.bb       |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Fix=
-GCC15-warning-that-ciso646-is-deprecated-in-C-17.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Fix-GCC15-=
warning-that-ciso646-is-deprecated-in-C-17.patch b/meta-oe/recipes-devtools=
/abseil-cpp/abseil-cpp/0005-Fix-GCC15-warning-that-ciso646-is-deprecated-in=
-C-17.patch
new file mode 100644
index 0000000000..7fe9ab4708
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Fix-GCC15-warning=
-that-ciso646-is-deprecated-in-C-17.patch
@@ -0,0 +1,43 @@
+From aa102147cdfff3aa971e61038a6455bff6828350 Mon Sep 17 00:00:00 2001
+From: Derek Mauro <dmauro@google.com>
+Date: Tue, 29 Apr 2025 06:23:36 -0700
+Subject: [PATCH] Fix GCC15 warning that <ciso646> is deprecated in C++17
+
+PiperOrigin-RevId: 752709743
+Change-Id: I4d6b52bca913d888818e1380268089743b03ca2b
+Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/5f3=
435aba00bcd7f12062d2e8e1839b4eaf1a575]
+---
+ absl/hash/internal/hash.h | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/absl/hash/internal/hash.h b/absl/hash/internal/hash.h
+index f4a0d785..6937f413 100644
+--- a/absl/hash/internal/hash.h
++++ b/absl/hash/internal/hash.h
+@@ -26,13 +26,25 @@
+=20
+ #include "absl/base/config.h"
+=20
++// GCC15 warns that <ciso646> is deprecated in C++17 and suggests using
++// <version> instead, even though <version> is not available in C++17 mod=
e prior
++// to GCC9.
++#if defined(__has_include)
++#if __has_include(<version>)
++#define ABSL_INTERNAL_VERSION_HEADER_AVAILABLE 1
++#endif
++#endif
++
+ // For feature testing and determining which headers can be included.
+-#if ABSL_INTERNAL_CPLUSPLUS_LANG >=3D 202002L
++#if ABSL_INTERNAL_CPLUSPLUS_LANG >=3D 202002L || \
++    ABSL_INTERNAL_VERSION_HEADER_AVAILABLE
+ #include <version>
+ #else
+ #include <ciso646>
+ #endif
+=20
++#undef ABSL_INTERNAL_VERSION_HEADER_AVAILABLE
++
+ #include <algorithm>
+ #include <array>
+ #include <bitset>
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.1.bb b=
/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.1.bb
index 5368dfaada..39c3b0b6db 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.1.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D=
${BRANCH};protocol=3Dhttps \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://0003-Remove-neon-option-from-cross-compilation.patch \
            file://0004-abseil-ppc-fixes.patch \
+           file://0005-Fix-GCC15-warning-that-ciso646-is-deprecated-in-C-1=
7.patch \
            "
=20
 S =3D "${WORKDIR}/git"

