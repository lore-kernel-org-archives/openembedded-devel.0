Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1596F5A8B6
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 19:18:04 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1557.1776712677656976786
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 12:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=EfkI338r;
 spf=pass (domain: axis.com, ip: 52.101.69.34, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+F1tpV+PZlUbQWnI12D0dzOpUqR1ZQP+emFqFOSVVRG7gx6hIGjh1nXaLG9Hmt/meq/H5QbOynepNI3DPcxcC5CdHAlyLKDEG3TY+ogD5n5nfBAPQwVKL1BF8s2hdGPyHMkVj4xRMWbbsTDX0r2L/eWn8sa9V9CUsgAWv0l/BMQGD55K9EpUW+9n+PJ/sOmqQMo8I8gqttUD82nwxX/yY43t61szs+yvzD69ICnxdEALevYmkyeYe7kk60+d8S/4ClmJ5phuqE7YFXTi0EXJMCzVajjq1qHHCMQC8a7Te2MhhVWNdW/aavuBV/tAkovOno3BhCJezLcHhR72j01xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNK5XJT1B08FqcShuEuH0xudSoXSUNpXbnPvxgoER4s=;
 b=OhqRLQ3K0+K9N+Q3O60WOQELQYb66tHbWI3JRwMJjuATbVp25hTBbxNbFMxf9uubRbJNny8AMFKOfUy0SBLBK8k88zuHWYbtkOAXoEQ7DhSlqM6bewRUFmBp2pAv6ArXdzFs/+ssW6h/5F/Z+oIJCXYNATaY1cDzRLW06w1TanN505PoGc5zmCCY3ek7WHEZTD29KhG7zCAJcjV0TkTmzi5skJIAHOj26fzcXmjI8mK+bywblYlNPtkOaZvyR1CtmkWdsAnUTAEiX3yEXdlUEsY1FvjfK+8rCPpajf+EGCHk9AsCp1NTBbkEpNTfCYm/VUx0OPvNrBmwyNCq0j56uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNK5XJT1B08FqcShuEuH0xudSoXSUNpXbnPvxgoER4s=;
 b=EfkI338rzHSSTXicZoU4BqXb3hxwKEsDNJmw7jGb/b5aeOqH80sSExfaXJTpoRG/HpA8LOlgBfE83vI0IyvBYWZyQ7Ylgl/g1p1dfmZP7SySRCk0YeYjYHhFj4BiEbzx70tq8+JjSnGqH//vtvFGRc5WnFJ4x8sWKfM9is4RVaM=
Received: from CWLP265CA0441.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b7::7)
 by DU5PR02MB10728.eurprd02.prod.outlook.com (2603:10a6:10:521::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 19:17:52 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:400:1b7:cafe::23) by CWLP265CA0441.outlook.office365.com
 (2603:10a6:400:1b7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 19:17:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 19:17:52 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Mon, 20 Apr
 2026 21:17:52 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 20 Apr
 2026 21:17:51 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 20 Apr 2026 21:17:51 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id C319D2953
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 21:17:51 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id BA91D120504; Mon, 20 Apr 2026 21:17:51 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] ceres-solver: Improve the build configuration
Date: Mon, 20 Apr 2026 21:17:47 +0200
Message-ID: <20260420191747.1836991-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8D:EE_|DU5PR02MB10728:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b824d3-9230-4b0e-da93-08de9f1184c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	K2OmaCbYKX4rll2Vi9YC0z42Ues4euNdihrduYua4ESEJZUkTfgErM+VY46UCllnca+2L6wJGWdRkfX+Ji+QSTPbzf+Qpwq+t8B9OhJCzPVXY6UKmKQkrWz9KkxBBhoaejmOZEI6WfF7XgFujeIpBMZWkQAXR34DzogNxNKKQZpat1r64s2ETYSmbCpANvN90P4iudmv1iGuwlI1IGxbtmvu7dD0KVRU7rEpfP0W+rMcEaFUIoWFTPqjv1RQS71wi0NNhZjDj431Wzcxg0Smu3cLsRJfFsoj5hQazrp4ACMfe2KZMvi9uFD6Z6O/Vi8AcguAaXw2GZqYFGpvTVH+xUe0/Hs+i/kh4sM1UKb/2CP5TCVBQjUiAolpsT/TptolCGgkqkWW/0PZ49Ho2WBivKUvlFafcE1msBr77HI7qT3IMhXxlr5CHb5zgVotU/1d2p1k/4Rrn6w7Rn5+ejd8qlpePNLZE9s1mE+mRykvVmUxvSD7BC3GRQD6wacKxnwZeIGxxpFc+s5uHGdpKXCGZKNDCzJuRMrBg3y302wdm2DXcfMQ/uzX9kmIY+NZqM5+Ki+M03+/Wrra/L+yhq9fRQbjs8tP4BkaQR0d2OjuSxd4PY0K+XWV1FpLGnSCLKPFIMOg96W6uvtRyP+m3FE/u7ZwIScws+alKgkb2UkO8lhIIoIFvadbRb6/4wStWFGVUCGeFq00BWoAVndaB9XrVA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kc+UwlxcBLVwFPVvmBT08dBYBGmSy0ZZlIUNBQHV+3kUfqKKxq0O0dT4nUtbCEifNrbM/njGf+izJ7tnbQQVSsV5oJbXIq7XLUuX5W8KEjHpNiI2HWNkyJpN1nh+PbKWrTnB9FBEO3YiYZjAhIIk2SR99B+BEhu6E0vmN51Cx/Wv/BlbC9w3HXlZMLAZAFXJz3BMeQUo7tQk18IhLqDPGiD7Al4VPyqa1qjE7i/xh472zf71zbl0HLsBZA5Ga7//tLMSdacSrzpKgDLxbNVDn4qC8jJjVXLWpPgYs4E2EC6ZyAIdv1/HCCHqtxMBbk6N52QLUgjYOxlGd3yTOgMCWL0wnGq6QuBK6l9EC3a6GfwAXnSwIX2V4kj5M1ANTOTy/t/XZ5LboDNEqleGvczBJQwMsvRtAYEmeyqKzPXlMfBt+dQb/XBPs1dPKe9zHWzE
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 19:17:52.3639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b824d3-9230-4b0e-da93-08de9f1184c7
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10728
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 19:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126520

* Add a PACKAGECONFIG for glog. If it is disabled, then miniglog, which
  is provided by ceres-solver, will be used instead.
* Disable CUDA and gflags. They are not expected to be found, but this
  makes it explicit.
* Disable building tests and examples as they are not used anyway.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../ceres-solver/ceres-solver_2.2.0.bb             | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb b/m=
eta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
index 0a8f237180..5368bdeeb4 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
@@ -3,12 +3,11 @@ HOMEPAGE =3D "http://ceres-solver.org/"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3585a26c9cd9ec0cb36a7d65542878c=
a"
=20
-DEPENDS =3D "libeigen glog"
+DEPENDS =3D "libeigen"
=20
 SRC_URI =3D "git://github.com/ceres-solver/ceres-solver.git;branch=3Dmaste=
r;protocol=3Dhttps"
 SRCREV =3D "85331393dc0dff09f6fb9903ab0c4bfa3e134b01"
=20
-
 inherit cmake
=20
 do_configure:prepend() {
@@ -19,6 +18,14 @@ do_configure:prepend() {
     touch ${S}/.git/hooks/commit-msg 2>/dev/null || :
 }
=20
+EXTRA_OECMAKE +=3D " \
+    -DBUILD_BENCHMARKS=3DOFF \
+    -DBUILD_EXAMPLES=3DOFF \
+    -DBUILD_TESTING=3DOFF \
+    -DGFLAGS=3DOFF \
+    -DUSE_CUDA=3DOFF \
+"
+
 # We don't want path to eigen3 in ceres-solver RSS to be
 # used by components which use CeresConfig.cmake from their
 # own RSS
@@ -27,11 +34,12 @@ do_configure:prepend() {
 # ceres-solver/1.14-r0/packages-split/ceres-solver-dev/usr/lib/cmake/Ceres=
/CeresConfig.cmake:    set(glog_DIR ceres-solver/1.14-r0/recipe-sysroot/usr=
/lib/cmake/glog)
 SSTATE_SCAN_FILES +=3D "*.cmake"
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "glog"
=20
 # suitesparse* recipes will be in meta-ros layer
 PACKAGECONFIG[suitesparse] =3D "-DSUITESPARSE=3DON,-DSUITESPARSE=3DOFF,sui=
tesparse-config suitesparse-amd suitesparse-camd suitesparse-colamd suitesp=
arse-ccolamd suitesparse-cholmod suitesparse-metis suitesparse-spqr"
 PACKAGECONFIG[cxsparse] =3D "-DCXSPARSE=3DON,-DCXSPARSE=3DOFF,suitesparse-=
cxsparse"
+PACKAGECONFIG[glog] =3D "-DMINIGLOG=3DOFF,-DMINIGLOG=3DON,glog"
 PACKAGECONFIG[lapack] =3D "-DLAPACK=3DON,-DLAPACK=3DOFF,lapack"
=20
 # Only a static library and headers are created

