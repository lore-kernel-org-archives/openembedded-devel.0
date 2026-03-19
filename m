Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F701088E6D
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 03:15:21 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3138.1773890119598165184
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 20:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Fm7LwFAD;
 spf=pass (domain: axis.com, ip: 52.101.83.61, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKeM5O/0WqECiXaLRHaUX7R2vDlOHLqAipGqNgFSnMBEZ/S3A6Qp+vs7XuM/aNvVBKbTCjI2H/OxLptCkv8qt22UbHh80X9aIlP+diLlbnKcobgNaPdzgpzIVVOAslY1PwpI3JYY79NLQHLKr7Rc9KEJdjajuTCzY0u4eSaXQvDAAONQ0Q+cMJF7pR1x5jhpnlYizl1x5tsxmQwb9KHgMDXCknQqayelh15/9yVJxTO1C44LoxNCDvoqvMswGlX5YdFVCgx4OjMK7xSTXjeuc64S3p7pePfYWHSZGpXo2ptoGjBzyzcslJqfFeaReWqWCOlkO6fMmH8dKVxzk2VQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79FkZ7aUG8gzUmRfqndSBM/3AEWlyDneqx8/XLcpku8=;
 b=V6Dw3E3t2M0WUAlsjKxV4gtqKUsH/d6sLVLj14OJsNwavSgIpKAHeuqKIeLz1rGE3nRlsEqdPy5UL3/eRqQ1QhzQvEBY+LXC6lMyAJaNEf/n2CQWOn4C9NGV6bAlEgIP4Ez09qVmCB0kKPN6h3y2y657NPFUBNJVNHS2VqCDCYNI8hUu49hQEL5IHPFkoAcvtqIHBJnd6vAV3bTwH3Xbp2SrTIEnQLRvheOsGcbzI1VlBwktrDFVfHkSHnvPrwAEzm7T+qnSoGlnH/ovXS8bjh3hRdMt6iavBMNmXU5m50Sl9Am2TDs71OVFzGjZXE2Z48y12AkQ0n3ONd0b1WX5sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79FkZ7aUG8gzUmRfqndSBM/3AEWlyDneqx8/XLcpku8=;
 b=Fm7LwFADkha8BgGBB0eCkEUlBP/2m9UAFKL4k0CczG9M3nqV2d3yCbcJGJYq2ihN6gdau0gUqFPy4dpk9LypneWEuPVtdfP4tF9dN4q2SXrWLqFcD7aniwTDYAfwWHD2pIbZN5YNBwUcL1p0q0W/Qc495/H0uBj8mQaRg9nMYXs=
Received: from AM9P192CA0016.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::21)
 by DB4PR02MB8463.eurprd02.prod.outlook.com (2603:10a6:10:378::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 03:15:14 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:20b:21d:cafe::38) by AM9P192CA0016.outlook.office365.com
 (2603:10a6:20b:21d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 03:15:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 03:15:13 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 19 Mar
 2026 04:15:13 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 19 Mar 2026 04:15:13 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 2CD922BF3
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 04:15:13 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 4C3E312089F; Thu, 19 Mar 2026 04:15:13 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCHv2] liboauth2: Backport a patch to build with glibc 2.43
Date: Thu, 19 Mar 2026 04:15:05 +0100
Message-ID: <20260319031505.1635356-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AF:EE_|DB4PR02MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: dfddaf4b-16c6-4c4d-a61b-08de8565bcb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FoawI96OXwRjIKgphNjuohgPMm6NxqExWajSOdEt/OaWaIkJw8Z+cu1hIKu/40ethbbyGMWC7xs0zZWH6eiKC+XBkv3tvfSrDbCX27FVdJdrl5wELd/HY2NW2QI+gavaKQvtuSIHocAwYZ0ZDqVEwJaFuIGNTYv8F8Qkrw2e3Di06ZbInNmql+4MbngcTssXlRclaGFu5472pb5E5e1uVhOZLxKBi8dg6iLjgQ5Z1dS0g6rWIW+MSw3dJWfqWxQ/bNBNEOPYXedSKtcg2pUVGXzFSlx6z7Ka2bhNVfz4gv1T3Kxq2dK/o1kl7MQii+OqwyqaScbDKdFzoAP835umvyeLSJSU8YYwgJ19wCfarwFY7aU7hXdOpVzREmkPsAgGORMEkNourQq87C0KuD/+V1vJDXf03TCaFwqWUO6kkgXpGclMiXBgPQzZV0WYDdLLAHmOpE+dmUPlc2834BH/uofWEs0E/LYso9iR75wjup8FzCOcvktdX1Ox14PPRIXjJyDXox2VVehDdBhNOqGpySaiVIVFv1VmpfvF3OLP0f6qTpiQw7P91bi7Z2mC4QUtVSNdpyVM47gA5t26ofFfq560JgvjrElL28prBWikoLtrReAddn97YSuUtyjm9h6SZJHq25fvGpVGxFZcjQT7U+UgprG58/XxAwabUHFHSIsmQMq9dhvrs5FekgSVymwBhC76XYJ02hPj5/uIuGcI3hdsQbYyiGw+a6KJnjrkDhU=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+SkyQWmv0SR8aQdVixKppKoz+sjAos3YNaXnMydl6sZth8uMPvp7EIWXxT4YRNHbK5cIVLsCaOe2P3ldFJfRh7xDpmXJVMHhWtSaLYu5X7ppgO0qMcXwrU8hGL/apdAqpEmqJZGrWFOVuZtsJ345XGnQmgQXoJYxzV8CiTNXMU4aRWPiKLbYjAj/OspASV0mj4SoVY3xF6TmTNyoXA7V8TidByRNVaeNO+p2tsoP5zrGubcPSiPFX02I+z3Sm8Xrr1hPNtiBlVNVRPxZFPZiEqxH3Rb5Q05L0bqD32hEzpVA25DA6x51+pbzXFEn4luMHpAo97Q8W9GngERMrFWIbogFWgR/Gv6JcF9/EEH359eQdz5BrOhujKfln0Z4WGGA752lBk3IpzJtir8zvjKorMdnYOPcUpEMZ7LEsLHPZMKUsdoRoacZyGc4oiO1U9Vg
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 03:15:13.6735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfddaf4b-16c6-4c4d-a61b-08de8565bcb1
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8463
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 03:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125372

Also remove PV. There is no need to set PV since the version is in the
recipe file name.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Removed PV.

 .../0002-Fix-use-of-strchr-with-new-GCC.patch | 33 +++++++++++++++++++
 .../liboauth2/liboauth2_2.2.0.bb              |  2 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/liboauth2/liboauth2/0002-Fix-us=
e-of-strchr-with-new-GCC.patch

diff --git a/meta-oe/recipes-support/liboauth2/liboauth2/0002-Fix-use-of-st=
rchr-with-new-GCC.patch b/meta-oe/recipes-support/liboauth2/liboauth2/0002-=
Fix-use-of-strchr-with-new-GCC.patch
new file mode 100644
index 0000000000..65340e806a
--- /dev/null
+++ b/meta-oe/recipes-support/liboauth2/liboauth2/0002-Fix-use-of-strchr-wi=
th-new-GCC.patch
@@ -0,0 +1,33 @@
+From 0dcba079907d559550ee8d9a201d26203bb8aebd Mon Sep 17 00:00:00 2001
+From: Alexander Bokovoy <abokovoy@redhat.com>
+Date: Wed, 7 Jan 2026 11:41:37 +0200
+Subject: [PATCH] Fix use of strchr with new GCC
+
+According to C specification, 7.28.5.1, strchr() is a generic function
+and its string argument's type is promoted to the result. So if it is
+const char*, the result will be const char* as well.
+
+gcc in Fedora Rawhide (15.2.1 20251111 or later) implements this
+conformance, resulting in a compilation fail with
+-Werror=3Ddiscarded-qualifiers.
+
+Signed-off-by: Alexander Bokovoy <abokovoy@redhat.com>
+Upstream-Status: Backport [https://github.com/OpenIDC/liboauth2/commit/0dc=
ba079907d559550ee8d9a201d26203bb8aebd]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ src/jose.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/jose.c b/src/jose.c
+index fbaf661..a3441c8 100644
+--- a/src/jose.c
++++ b/src/jose.c
+@@ -993,7 +993,7 @@ char *oauth2_jose_jwt_header_peek(oauth2_log_t *log,
+ {
+ 	char *input =3D NULL, *result =3D NULL;
+ 	json_t *json =3D NULL;
+-	char *p =3D NULL;
++	const char *p =3D NULL;
+ 	size_t result_len;
+ 	char *rv =3D NULL;
+=20
diff --git a/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb b/meta-oe=
/recipes-support/liboauth2/liboauth2_2.2.0.bb
index 31d7aec69d..5b1ecd23dd 100644
--- a/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
+++ b/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe701=
4dce33e26468ba93"
 SRC_URI =3D " \
     git://github.com/OpenIDC/liboauth2;protocol=3Dhttps;branch=3Dmaster;ta=
g=3Dv${PV} \
     file://0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch \
+    file://0002-Fix-use-of-strchr-with-new-GCC.patch \
     "
=20
-PV =3D "2.2.0"
 SRCREV =3D "12571b6d6568c2db7d5f080f60ecb55795c0db19"
=20
 DEPENDS =3D "libpcre2 jansson curl openssl cjose"

