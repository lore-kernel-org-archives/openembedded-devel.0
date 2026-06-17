Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9996CD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 06:14:38 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8941.1781674254867389422
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 22:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Nxs27rlc;
 spf=pass (domain: axis.com, ip: 40.107.130.23, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNqr+PpaaBDg9hGBYuyys0Pk7ABaY8FmLVlWeLRcfrtdXjivldj9ueJdkM/tn6t5CWmp8/Ie0Y86AfjF/uhJyfIUZ9MtvQWOAQQ2U1trt7T9PV0sisQyMY40XckOUBRppVP12KlQgG5sX06KAcPPD1LNj6DruVwj1LqfhbETBJJooMjBXuNFBEHT4C+OM9Rdag/ffNEUJSK46tSiq66oX0hOBFPOKSgcTvNWyQp8gxm9xSqNi9rVPonfPYAkdqOwEGhyHRoR7xyihx7BFnd/+P8oEF4b8WLkvcBaL92lCt19phia+YqRsKv7ZUzIR2uX3iIEUTUh6jRWI12zMmQHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otj5ho+rWamRTjMABCdLm6/e3QH6IB6w0XttjnGUkHQ=;
 b=zRUyuywl3Lv+/fIQ5OGB42YhLHX6WDj04rBPmaRbo9rjQkOzXR5lkC7bIUjlosfe0JPnp/HwSb9CQbTdk7TmBqjZG8lA8GYO5XwvgrYy8RF4niZ4YVdwPHDo4mOV0ke7kVe8VrMjFbzeavLnd57FYSEZLDLxVbqJpUqytOdRurw2lbE7PPCoLclbbT3rnm3TcCUB9N3EyrUMnNZdlvGWt/7RUYj5sMxdTav6c3ouTPMW68zKFYVBSNVtvIonLwCrLmXQG1Cz1mtquV6ON0UkzhGlHHEms+XHhNRCImM4mg+ig1zYBoMre1qOMu715/GoDts0Ps3GZn03xwQkv1TQPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otj5ho+rWamRTjMABCdLm6/e3QH6IB6w0XttjnGUkHQ=;
 b=Nxs27rlcfOqahWbZMiWYOzrTApKDYz6+1YK7xBQKyfsTTq8D8dNuuJfr+m6Llh+5pYwB8dnQkU+rmbQrgKlGREpa16zHEG8Sm3irDqKHbs6dYXkks6Iq6/p3h/yTkVI700Ah5IS0UmtWQgC/Num5mDFQxPXUCI/9u5VZEWIJzGk=
Received: from DB8PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:10:110::18)
 by AS1PR02MB7968.eurprd02.prod.outlook.com (2603:10a6:20b:48e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 05:30:45 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::3b) by DB8PR04CA0008.outlook.office365.com
 (2603:10a6:10:110::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 05:30:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 17 Jun 2026 05:30:45 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 17 Jun
 2026 07:30:44 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 17 Jun 2026 07:30:44 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id EAC832ACF;
	Wed, 17 Jun 2026 07:30:44 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id E57DB8461E6; Wed, 17 Jun 2026 07:30:44 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [meta-oe][PATCHv2 4/8] jq: patch CVE-2026-43896
Date: Wed, 17 Jun 2026 07:30:36 +0200
Message-ID: <20260617053040.990143-4-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617053040.990143-1-antonsk@axis.com>
References: <20260617053040.990143-1-antonsk@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E9:EE_|AS1PR02MB7968:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c21c11-9512-4918-43fc-08decc3194ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|6133799003|56012099006|3023799007|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	kNC90pizjZtbj/2IdK/EVAtK/K1OQk9kd8fsxOuJUNhnYhEcCPqGeIiE+yBEk4QXWYIFpCRMXRzumhX2Xj+kYR4/xoUIn1ZnGRBUyUnax6MaUkaZVKqyV5NRjmBDS3/+fXPTWRxITRCh/dLf8BiohLF0v/pTI1sfVukTlx7hC+Q+YjtUaZPrPYMd/F9TlBqbTf7LMxV6srO3fP4/u72J4qACcB8gqA8+Li8IOKKhiUPrBGEiZlaz3VBLueS7IdOVAVXNdXxr1HKdLwAg4LmLOUerWxagt/zpBg+Xxt3C0rEn4py89OS3C1mRUE1uSInfSLZ7WUWloK4JqfjTjRaHBmj+moCIs43cN0egM6TlwyOpBW0ZQB7kwXGpAR7gP/qzS8lHPwQOAn4BGvMPHSAXQV2CyXzzZbYdfeCgoN3wBo6LmRWu+MuivxmECdjysXiWkBArj+vma4xqRNHpC7RgUGgx7gUa88soRcTEU9Cfl9UR280Blvh/nW0B2TYCnAB/LzbVwjVhTwV2gfhDc6TFdJQbQ2+URNHV40svWv52OiMQz7E8CfnxlbuskggBrloL00zOzc1xfR8ulncdJWTG1WraaWD3qRfp5gB3oBhxjXDS3ny71A1XJEv2MbKGodU1bDMla4BScPTJjdmmbvWXlyFVl38aoJNX4DV+NhPLBXwljoxEo+im6k1U1BOEQcDNtFhHyufUiFnlCG19B+rvY9f1cLKzJGJn3cG5a4cX6JM=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(6133799003)(56012099006)(3023799007)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	r+ioESaY7bci/R5HR8PgqPLkLd1C73/RUhGv+eTXLSIpM7y4uD2sIoycnohW45FswEd3yW8osI8tNr/1Bv4WnwRyU3IIVvz3zM1fy+BkeBvZH1+7Hecv4pAfkDz8KDpLczj66gb0Kl1nwMHOtTyHqK91YfgQ3XbgYYRm6tnwniZLQmp0QWS/EaiqnR8/qy4HwVtmdHGtg+gLILKFQQH3Y99cQrndoXX3IwGlcx6EZ7eW/QARpNke+i0pWCXzTK/hYUgfq4txVeMZgCJL1kQM5cMFCWCAQryOmpCnDK/LYZ/5KYR7g2Zvhay/9taz4G+q2pAQQs34x+uaKvtT+OrLR15MgdOM/PHSuCfIhctnVbGveQ2RtXgtsPsnV8u/ougQD4FtZSlbM7PvyFM8ai/EC4/nGFQbUwbocRK2nH+A2F0TscQQsE+upSYtNSPseCYO
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:30:45.4421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c21c11-9512-4918-43fc-08decc3194ca
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB7968
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 06:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127634

From: Anton Skorup <anton@skorup.se>

CVE details: https://www.cve.org/CVERecord?id=3DCVE-2026-43896

Signed-off-by: Anton Skorup <anton.skorup@axis.com>
---
v2
 * Rebased on master-next
---
 .../jq/jq/CVE-2026-43896.patch                | 82 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-43896.patch
new file mode 100644
index 0000000000..318c86a121
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patch
@@ -0,0 +1,82 @@
+From 532ccea6080ed6758f39fe9f6208a44b665023d2 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Tue, 5 May 2026 22:44:02 +0900
+Subject: [PATCH] Limit recursive object merge depth to prevent stack overf=
low
+
+This fixes CVE-2026-43896.
+
+Signed-off-by: Anton Skorup <anton.skorup@axis.com>
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/532ccea6080=
ed6758f39fe9f6208a44b665023d2]
+---
+ src/jv.c      | 25 +++++++++++++++++++++++--
+ tests/jq.test |  9 +++++++++
+ 2 files changed, 32 insertions(+), 2 deletions(-)
+
+diff --git a/src/jv.c b/src/jv.c
+index feb68d1a1c..84fafef666 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1899,16 +1899,33 @@ jv jv_object_merge(jv a, jv b) {
+   return a;
+ }
+=20
+-jv jv_object_merge_recursive(jv a, jv b) {
++#ifndef MAX_OBJECT_MERGE_DEPTH
++#define MAX_OBJECT_MERGE_DEPTH (10000)
++#endif
++
++static jv jvp_object_merge_recursive(jv a, jv b, int depth) {
+   assert(JVP_HAS_KIND(a, JV_KIND_OBJECT));
+   assert(JVP_HAS_KIND(b, JV_KIND_OBJECT));
+=20
++  if (depth > MAX_OBJECT_MERGE_DEPTH) {
++    jv_free(a);
++    jv_free(b);
++    return jv_invalid_with_msg(jv_string("Object merge too deep"));
++  }
++
+   jv_object_foreach(b, k, v) {
+     jv elem =3D jv_object_get(jv_copy(a), jv_copy(k));
+     if (jv_is_valid(elem) &&
+         JVP_HAS_KIND(elem, JV_KIND_OBJECT) &&
+         JVP_HAS_KIND(v, JV_KIND_OBJECT)) {
+-      a =3D jv_object_set(a, k, jv_object_merge_recursive(elem, v));
++      jv merged =3D jvp_object_merge_recursive(elem, v, depth + 1);
++      if (!jv_is_valid(merged)) {
++        jv_free(k);
++        jv_free(a);
++        jv_free(b);
++        return merged;
++      }
++      a =3D jv_object_set(a, k, merged);
+     } else {
+       jv_free(elem);
+       a =3D jv_object_set(a, k, v);
+@@ -1919,6 +1936,10 @@ jv jv_object_merge_recursive(jv a, jv b) {
+   return a;
+ }
+=20
++jv jv_object_merge_recursive(jv a, jv b) {
++  return jvp_object_merge_recursive(a, b, 0);
++}
++
+ /*
+  * Object iteration (internal helpers)
+  */
+diff --git a/tests/jq.test b/tests/jq.test
+index 8094a5b6eb..9a80341f52 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -2602,3 +2602,12 @@ true
+ try (reduce range(10001) as $_ ([]; [.]) as $x | $x | contains($x)) catch=
 .
+ null
+ "Containment check too deep"
++
++# regression test for CVE-2026-43896
++reduce range(10000) as $_ ({}; {a: .}) as $x | $x * $x | length
++null
++1
++
++try (reduce range(10001) as $_ ({}; {a: .}) as $x | $x * $x) catch .
++null
++"Object merge too deep"
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index 2634fd52a2..b0779b389e 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-33948.patch \
            file://CVE-2026-39979.patch \
            file://CVE-2026-41256.patch \
+           file://CVE-2026-43896.patch \
            file://CVE-2026-47770.patch \
            file://CVE-2026-44777.patch \
            file://CVE-2026-49389.patch \
--=20
2.43.0


