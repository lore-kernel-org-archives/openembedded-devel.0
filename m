Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEC8E77180
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 17:31:28 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web10.1145.1734111086568440982
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Dec 2024 09:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ZNBU8fZL;
 spf=pass (domain: axis.com, ip: 40.107.20.59, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSo2/GVhyOxXtoH/HrA6el2RUYOghzFq0gy70PIPpfHghEGJzZ3zWqYpv8jVp0uS0ZovzA8eRVyXPCiXFnixd9Th/jPqi6O6wcdeJo2Lfzi2wbMfSwtJFMh1Mk/GcHpnd+XzeeCDUWvt+PfDiZwOVYKa9etNvH+o1fySXiwDg6YKf2YjPh8PJnk4h3N8hJLfjDk6342NYUdSuAVVEoJmcoMGk9T4jVxNNt4JLRPEFZ/I2yLhlK9mEqMDCTmnx4Ig+igkX96oxa7InJO0MtvCPpSGik6AKLdxYiBo252agLXlKxT3Ar4ddUoWamNWy1iocZ4k0XNR5EYSh8wmAFxlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n41H7xgAgP9xzfS4uiEe6TcwPS9COZYbkzTFojnZwuU=;
 b=I5eHMB2Ns3vvk6IcHpvGjgrXLzMf4LpyETVDd1C6RdKzIm3AcolJoRYhSXGFjx7oWfLDttqGVem7S+JzsBSt01YPIMseyKwdpO2KIP1uWJV3T6W5N7/MnEpvCgRSRel6mpEYWCEu2iBl/LOQyPyOQDx7rfxBT429VoHdhR5VTOQJ/CVobJH0TXqYgr4AAKRuLxUYIgMqUrCQCI3q/76yhs8dWJgFlOYf86QPKSrxXD12DQAR6miingtNELEEdy6/rge4te7FEVQjk+e/1cZwHQ4QX4US/I73mPgxDE83zr75dgacmsFlrJl1kxbtx6/HBlMHVR6eiy2Z8gYRjMjsdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n41H7xgAgP9xzfS4uiEe6TcwPS9COZYbkzTFojnZwuU=;
 b=ZNBU8fZLrRPdbgh6uZm6FpymSAlc7RIim+bi0RAtd1wkuoi4XDOeJor3wxo6yAPUWDnjb2nezE9xLF3zP4JC63g0XF14Q1MR6fEYvMpGOxS8YA8AMKeywbplHM8qKlWtuVMwKTemNavzpeyF6n0XNgv5eFC9XdQTVjTIEJ/bQeU=
Received: from DUZPR01CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::20) by VI0PR02MB10612.eurprd02.prod.outlook.com
 (2603:10a6:800:210::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 17:31:21 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::31) by DUZPR01CA0045.outlook.office365.com
 (2603:10a6:10:468::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.17 via Frontend Transport; Fri,
 13 Dec 2024 17:31:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 17:31:20 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 18:31:19 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 18:31:19 +0100
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id DE9161AA
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Dec 2024 18:31:19 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 4BDHVJNH2533239
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Dec 2024 18:31:19 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 4BDHVJ8R2533238
	for openembedded-devel@lists.openembedded.org; Fri, 13 Dec 2024 18:31:19 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [styhead][meta-oe][PATCH] abseil-cpp: Do not leak -Wnon-virtual-dtor into the .pc files
Date: Fri, 13 Dec 2024 18:31:17 +0100
Message-ID: <20241213173117.2533193-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFC:EE_|VI0PR02MB10612:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a7de6b-0e3b-4d29-03ee-08dd1b9bf536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BT2DQFQoXwbdKM0MQpn0f9ng3sP52292Yh6lTO8yLjT5qdU29zDv1yn3Uzuf?=
 =?us-ascii?Q?gCRrTfCaG/4pDYD2i1REPxLWwy/vdvj7irX0luNu9k4wpDr1gQpqsM1FusqX?=
 =?us-ascii?Q?1Z1neqB/O4JHdI3z5QrW4l+Ft2Sr0cM7hZAP5uwdhzonOpwS6PmE7d+LdFNo?=
 =?us-ascii?Q?LLVZk6QCaykovDQ40OcYyqumQjc9x1iIQf0b+PYc61QzCWZ7zWzCdGZZ9J2J?=
 =?us-ascii?Q?IqbHyT3bP/XNFvT1DtPCG6dngDDRrc0RCYe9/xeE/G1saHpE4OlkWnB4WYNW?=
 =?us-ascii?Q?lTusRzSzSESBtIeBPT8CyjSse+tBNy1lAHGr497WVqjhasjpmMY7Io0XPEEu?=
 =?us-ascii?Q?579QIbWfWjPKTO4sMzlDEKVer7DmgJIWs6J/XJHJWDAcQUpUKIQktw9f70Rf?=
 =?us-ascii?Q?3Xm1uVo/KSH9B/P36c1s1OLHCPYpOBTS1urOHApmHeS0cJBEtD082a20iyOS?=
 =?us-ascii?Q?9kbxP4ZQoosJN/UV0pVcOxI8SjiUE9LnXf3uA3CjzmopCmHo9DoyjCJT7Cq1?=
 =?us-ascii?Q?stcLBzXskBWHhttVTMG7yE7C13CIDrWzkIDxcTeD8Y5tzFAuRFpLQCl+GHi4?=
 =?us-ascii?Q?hQqClExdxjF7D6zDmtBsHUWwZ2F328VhceM5jRLrHSeNjOZCkpO5ssaaH9I7?=
 =?us-ascii?Q?IGXQSXjONPHVb2jQHX5mcQ9Rtx5Uv1BSos7F9Z7cv14ju8qlvtzH5+1qD142?=
 =?us-ascii?Q?lyYD3s8RShML3HtUUYZ5jlnKJPVNE1w9lRRXFNZ0reJcWIxGmMu4L7i6+qkg?=
 =?us-ascii?Q?lZzM1XA2bSBbrj5On7v7u3eAtx4cDEXGCzwXzidweUgbQLAFZoRn8shDsAnd?=
 =?us-ascii?Q?zinSd4U4ZdJ/Umg4hp53TV2AlibhpIUn5vKeNLZLeBHPDxq/0jOkV+a3zRcP?=
 =?us-ascii?Q?t4IL4Wdy42Ke75m693CnwLxQT/PM1rFSNMeEtIC0mLB7mX3Vv08vUtKy2TPC?=
 =?us-ascii?Q?S5o2J01qu/Errudt6e65jfMWs8q8IphpUmefr3ihmXlsMfj278MQSxn4a9y5?=
 =?us-ascii?Q?dMhNRc0ys1GufiNI/GK3XDBqZPVC/AFKIvGxFPFWN+3Cos2jzdV0Ruy/z5fV?=
 =?us-ascii?Q?rDS0QGYXwqF7sDt645N9cr4mr36ByqfYwFfRwzZ2wS4V4st64gDILVl8X6Xk?=
 =?us-ascii?Q?+cT85XAXjGzhGaZSrRz2E67oZHk0cDBqB139bhBzR5vVq3bBkivfqB+sERFl?=
 =?us-ascii?Q?+neHCDOEzEjgYiL6kqmY8j0J3z7D6qPaamB5sdp/9TbkdxO0U1cUJAusAvaz?=
 =?us-ascii?Q?NmJs+UeqzX0c3csobZ7Y267Hhi2ez2UDwta4QpXUe5gYx9G0Ajk+o2Au8/qn?=
 =?us-ascii?Q?dSXyHSK/9vHdvVOMwB2A5ASU7c3//1KnlvOQkOXdGmJIIe3IsPJZjxz+jQ3+?=
 =?us-ascii?Q?ge8QYjT9vyxiClr48gxVJJ5gMJpbLIEz/yp9VT43dc8xmZwtixST0YJncN0k?=
 =?us-ascii?Q?jDJrNh8+ZZ/Dpo+x3g5nrEF2FwNJIJaZ?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 17:31:20.3535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a7de6b-0e3b-4d29-03ee-08dd1b9bf536
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10612
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Dec 2024 17:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114313

The -Wnon-virtual-dtor flag was unintentionally added to the .pc files,
which causes problems when abseil is used by C code:

  cc1: error: command-line option '-Wnon-virtual-dtor' is valid for
  C++/ObjC++ but not for C [-Werror]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...-virtual-dtor-in-the-flags-are-neede.patch | 30 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_20240722.0.bb       |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don=
-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-matc=
h-Wnon-virtual-dtor-in-the-flags-are-neede.patch b/meta-oe/recipes-devtools=
/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-=
neede.patch
new file mode 100644
index 000000000..9a4fc0b43
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-=
virtual-dtor-in-the-flags-are-neede.patch
@@ -0,0 +1,30 @@
+From 9cb5e5d15c142e5cc43a2c1db87c8e4e5b6d38a5 Mon Sep 17 00:00:00 2001
+From: Derek Mauro <dmauro@google.com>
+Date: Mon, 5 Aug 2024 07:35:05 -0700
+Subject: [PATCH] Don't match -Wnon-virtual-dtor in the "flags are needed t=
o
+ suppress warnings in headers". It should fall through to the "don't impos=
e
+ our warnings on others" case. Do this by matching on "-Wno-*" instead of
+ "-Wno*".
+
+Fixes #1737
+
+PiperOrigin-RevId: 659548798
+Change-Id: I49d7ba7ddcd7be30f946fca90ba9be467181e854
+Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/9cb=
5e5d15c142e5cc43a2c1db87c8e4e5b6d38a5]
+---
+ CMake/AbseilHelpers.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMake/AbseilHelpers.cmake b/CMake/AbseilHelpers.cmake
+index b177e590..3c4c92fe 100644
+--- a/CMake/AbseilHelpers.cmake
++++ b/CMake/AbseilHelpers.cmake
+@@ -195,7 +195,7 @@ function(absl_cc_library)
+         # specified platform. Filter both of them out before the successo=
r
+         # reaches the "^-m" filter.
+         set(skip_next_cflag ON)
+-      elseif(${cflag} MATCHES "^(-Wno|/wd)")
++      elseif(${cflag} MATCHES "^(-Wno-|/wd)")
+         # These flags are needed to suppress warnings that might fire in =
our headers.
+         set(PC_CFLAGS "${PC_CFLAGS} ${cflag}")
+       elseif(${cflag} MATCHES "^(-W|/w[1234eo])")
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb b=
/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
index f44a5d908..d9634b2b0 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D=
${BRANCH};protocol=3Dhttps \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://0003-Remove-neon-option-from-cross-compilation.patch \
            file://0004-abseil-ppc-fixes.patch \
+           file://0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-need=
e.patch \
           "
=20
 S =3D "${WORKDIR}/git"

