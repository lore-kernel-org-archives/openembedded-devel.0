Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA374CEB2FE
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 06:31:37 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.78])
 by mx.groups.io with SMTP id smtpd.web11.75385.1727764292842084039
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 23:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ScDDx/qE;
 spf=pass (domain: axis.com, ip: 40.107.21.78, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+5ly1rw//eBnwJf3diItA4JDVbZ8XrojLzUSxx1zARAp9OxalE5aS8IGFARlQqNW8Dvy4fVHhqLhUtwuzOUgH1bxtR5hD2A89gItt+au9uX5bwJz3EWcDLelK1k6SVhddrGcYraKwm20NuhyHAhBI7tiGJVlkuedSwkfbYca+L6xjSp5X+Mc6sq7ghcC0vI/0C2Uw9IdM+1zoHOJJd21m06+g4om0YYyVntUlhiVttunDbE4g4ba8CQfthVE9CUm7me31vzLI0UqgtB6QC5JnMHa2uFj4AoHRxnL/5CD3n/EH1k5eECLYhUiQExVwhujDZt8LmjkHGiImiYNJEpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjWBWLdzkCBrdmLSmdhBa6FCyfRWoXCXl//2OrJLAqU=;
 b=f8qskBCrdWaU9DDMfDwsoZUtojEng8QZncjxKYJiiLw+0Ss3hSSPpjstIQkHpKdeZXSp2PxeI9dvX7VmmPGoosHkpmLG68i1BXq/mTX7xfoQGSgiGFOdm3+JhVfJ8BTC4oRkWxa3xGeLxGaDurdXDg36CAmmFDy0LywD2HmKb3jOercnUVxcl3EUIpykh6RMpEksvv2/hoIbP62mkhY3MfHHU2qr+riLGQLk0Sf9Fk8zC2LSPd3+PLzYHVqvb4vBdAkg1eUW+sfc1kzwPOTN9Dd+ONFdvFF5R2zSJ2PiiV5ouPMuKEC9K4UqEfMPN+Dm0rFVziGVMz7bKBYt5KITiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=bestguesspass action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjWBWLdzkCBrdmLSmdhBa6FCyfRWoXCXl//2OrJLAqU=;
 b=ScDDx/qEXm+sZWhKehczYoPCY1EwRIajNHQM2TgAYr4+dgR/2pVJHawyH1nTYn4CZwmygjvyxGEyW93diR/uCLAu2GD5HIauxKPEcIwj9fldIX3qyyL95U7Gi1ReQEMVpWojP1g1JQ0X58/S/HPZJqVzam0704DH9/HnLQprwcY=
Received: from DUZPR01CA0350.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::22) by DU0PR02MB8715.eurprd02.prod.outlook.com
 (2603:10a6:10:3ef::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 06:31:27 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::cd) by DUZPR01CA0350.outlook.office365.com
 (2603:10a6:10:4b8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27 via Frontend
 Transport; Tue, 1 Oct 2024 06:31:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Tue, 1 Oct 2024 06:31:25 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Oct
 2024 08:31:25 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Oct
 2024 08:31:25 +0200
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 1 Oct 2024 08:31:25 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id E35A41B2
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Oct 2024 08:31:24 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 4916VO8L1835408
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 1 Oct 2024 08:31:24 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 4916VOha1835405
	for openembedded-devel@lists.openembedded.org; Tue, 1 Oct 2024 08:31:24 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] abseil-cpp: Do not leak -Wnon-virtual-dtor into the .pc files
Date: Tue, 1 Oct 2024 08:31:17 +0200
Message-ID: <20241001063117.1835370-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885F:EE_|DU0PR02MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb85158-05f0-4bb4-a12e-08dce1e2acb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0a4I9QK3HzbQ7ePdLR2K8WwzqbIMWIus1csTqmJ+e8VKJ+xa3bJqVWGsSMTI?=
 =?us-ascii?Q?GA1dKvSqw96U1AEkkeq8TBSUYO1wjqM4agE23afhqHabJMKeohZgWY2VUNd6?=
 =?us-ascii?Q?A4wDmlaTmBrcfD8nzeK6HOou7mMWI1yXphZS49SGoNKPu9P9JA3PoHYYOTuM?=
 =?us-ascii?Q?SZ9lfyMpnd+l8PI6hDRsJhiSUMykeBFN1aZ69odNs+SDLvO+tDTMDJ+a7/+p?=
 =?us-ascii?Q?PawjMzwWRtUaJXb5C3SdMdz/oNCdf/B6znh9KL9c57FMpArOt1yq1UlVkbCy?=
 =?us-ascii?Q?NgTVoXApBcBfAG7MLMtA4TgtocUPnd/mF4TR+voczrUeegJVrG16Jvuzm6OZ?=
 =?us-ascii?Q?7UqsXuyZmuIgMzoBTPh9Ow53yIhqVbMquxH4lNIIFvL/uQs5UG/P+cRB66Ea?=
 =?us-ascii?Q?RKaPZFTWw+lAURXiBRICEOg8yHa2yVm+BjwLigX+FyIBKpSM4LJNhKsYLNoS?=
 =?us-ascii?Q?t3gDAzNXm6Un4bAT5VdJyDELBAZnb2/3TvpD66ZsH4jeCNOcCQdafVXv8Y8b?=
 =?us-ascii?Q?nGUrfYkGiCVUv5PUxF+zljniTZIw1/k2Sa+NxWH+lurwGLqnnUdVB/qc+vTR?=
 =?us-ascii?Q?5E8YjWtRTs9D4RoH4BEKR3muHVOZo57rG5RNA8WhhmbKf6pT2RUNx9H2g19R?=
 =?us-ascii?Q?IyxAZ68I2oYodxbOSPX52Jbo8qVcQ93NMpdbKCLZ8sV3pbtXHsLIwQSU/JNE?=
 =?us-ascii?Q?6Pp/mp8AJByb3qPjHpgLrvaDgfHK+Ac5Y+f48/R0lwL7BtjGYrOqjLHaWjX9?=
 =?us-ascii?Q?rFaOI6y+LBscqgqOFcT9MYjbHuikBIMVzMkC2JSJFCyz/cxLtlqbQYosLyzu?=
 =?us-ascii?Q?CWOaKb0H4rE8hdiSdF9P+VGPEBXPYp68WP2DDTp7jDvL9s+5vWkSiSiHXmVG?=
 =?us-ascii?Q?xgE7BdmIlBSuxNnnO6ES/h+mWzNzSi2vqU+e3HdXG2CbsF7Tvyube0uVV5Wi?=
 =?us-ascii?Q?hAbNKqfgPwi3uDCDm8O3vK5zgzgyC0o02kZDndN0JtsSZ7KyvUlLYOA7m0on?=
 =?us-ascii?Q?HAqDuivLRtDJZu531sCelfHtj968AxjhF1vJ40v42vgOC0cj7UfWJ4z5k0yc?=
 =?us-ascii?Q?EBYgDnOJw7VURuCf29/CF4vDK/ypdo2ii2Y3BE0MXzmbEwFkYV/xeT4Jckkg?=
 =?us-ascii?Q?/WPjuqZhQmSsbuHbrX65ElFw8wnIT+wW398e5xrTbQl9YxLJsfi0gd7KH6S8?=
 =?us-ascii?Q?espn6zY9lAqSAALcxgWqV5ryK3ObmQh0oWZULPLYCQNE5SgUe/gasxPEYPnU?=
 =?us-ascii?Q?JRRIL9aBLOLfbDwzvx8x/KWFevCnqX2xY/hyrYbgSccAFBdkvmGyh6rjT/fY?=
 =?us-ascii?Q?RMOMYPIgKvQrG5mS04UIcz0jLPZ9jsWF1pkM98czdiqu1pe0Ri7yWyicjdha?=
 =?us-ascii?Q?GP1sZ55loGFldiWQWSdbcBvP5ZxoFz8lnWmBRMQh2huP3MU7NMMvjQS6q41Y?=
 =?us-ascii?Q?O8Nj0dAi4kzqbQ2HvgVTZdK820LUPTEs?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 06:31:25.5691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb85158-05f0-4bb4-a12e-08dce1e2acb9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8715
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 06:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112629

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
index 0000000000..9a4fc0b43f
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
index f44a5d9082..d9634b2b04 100644
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

