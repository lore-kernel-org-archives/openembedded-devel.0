Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C716CD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 07:12:12 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.148427.1781591286733951400
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 23:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=kjZsLm4j;
 spf=pass (domain: axis.com, ip: 40.107.159.68, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tztc4Qxu+4NbhnXjDUr6eazBpmqFYT3vmt4tmYs7pC1rNx1/DFxHgQHb7uYU2rHk+l/sYMeWg9SS02gNoJHcTtl+OTM1fymfuti83CxAjpC9nA/ZlHyiqH0cVSe6kX+BSnREdEt+Wh3J/LydtXYVhMWxgka/qAo017+fiHElqdz2Ujb+dwc74aoZ4Xygtr1pO7S/5eXakaG9ycobMlQXKgQMaQ334Gzycc/yLAgE2pox7ZzqoBXhmjNsk3SmQdY7CqWpIBpcT7Yt8Krmr9y6Do/uONk1b1eM0zb6gYJXdjEq8bPxvnmDB9nt/JRJSqnserd7XghYknFxDJa+9wxTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZLlbnjrG1X+KCjr1W8Y1OZBXQePgo4n1V9oVk69Wqs=;
 b=L+aWWzuI6UcsXlAsuSXXY2cWU36IbzTjrVIEMBtYEsDeWRfKEOBNK81jCl4VnqaTyu7nnmEuWkXnyYe2bWFtROLyLYGyktHw5sqmvDwQMZJgQMxzZi4TvYudHC96oyIGO4feiHO+ickJuv17T7FBPwKDsBsW7UpQmk1pTZBum106nnQcrzle2+whSAP4XChn/6CwNSydH6chA0WqP0ckHwF1hAIncKGTgW3cXDQGBr3UqnZLIgzJIoQ0IeQQtMHhXRyPS3xYbhhoQUiWcNjbIBfPSDP2RAcuV459aBSbvfgcStO+VzXwEoK8aA0mCY3cle870shbnBEOU/I30dxC8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZLlbnjrG1X+KCjr1W8Y1OZBXQePgo4n1V9oVk69Wqs=;
 b=kjZsLm4jN7WhXAiS5COHi4A93iIygp8A/9GzBl2JbIAbFBx2apTqADp39qCwHSLQC4GCLoLIx/WQiO9KsVA2O7/ELrDv/850Xn6zv01rBrFD+WINiV8fySWnx6Qg/PeLgjnQD/KkXkX65zAZQNj3lXXxwx+Z41lQZOwhdY0RgQw=
Received: from CWLP265CA0437.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::13)
 by PA1PR02MB11380.eurprd02.prod.outlook.com (2603:10a6:102:4f4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:28:02 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:400:1d7:cafe::42) by CWLP265CA0437.outlook.office365.com
 (2603:10a6:400:1d7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 06:28:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 06:28:02 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 16 Jun
 2026 08:28:01 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 16 Jun 2026 08:28:01 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 6E6D62480;
	Tue, 16 Jun 2026 08:28:01 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id 6B0F78461E6; Tue, 16 Jun 2026 08:28:01 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [PATCH 6/8] jq: patch CVE-2026-40612
Date: Tue, 16 Jun 2026 08:27:52 +0200
Message-ID: <20260616062754.748436-6-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616062754.748436-1-antonsk@axis.com>
References: <20260616062754.748436-1-antonsk@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C715:EE_|PA1PR02MB11380:EE_
X-MS-Office365-Filtering-Correlation-Id: 3498f16a-9caf-4934-9ea2-08decb706ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|13003099007|3023799007|22082099003|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	2AGkpA9lV2Zg7ji12GoUT/kx/eOO/fKug8ViNIcYwOlSmg7ogI5sLGWL6NwI4Znljfms+dCzimoWaDzzJZXOjrmDf0nikXCdsid6i4I3euI7BcU6Mq9ljOVmPJn3Sp/O29xgyX8pBLaVft1uQc1Q8nAGdKgFcA4OnM8hH3hfWrV8ZbZrXjUia3jjno5DGW/L/VIPF6kLYI/KO8dUM6mkd9612ren1hFgyoqsQAei44t7yRHII16R/rv8RjF0Y9QbNLSf6VtEVNF94rgdhdo5oPhorUnzVg6g0sbZDuolKpy+Pc+14RW+M4knDTHvPTR/bmTQmCNru4uoo3cXwXm266tN562BKfdJl6A8NzWlBtt4aeaUA8/5EyxluVC6i6PttKJi8P5G32ryWDKMam2NS3shlcMpJb3LER9ESFrVO+HUBRTA6woO1fegClakTxr0uMJnJamkIyIV9Z1TBjwQkrzjpo9oDZSVqhILgnIIi4g85ah4xyl+M+UJrQnCgNtuGUUfUFUFtK/YiFN3+ThygA57GtlDA1mUip7Ae8ig6bOJO1jROnjLRxrXKzrqojI6fi4147JABVQIukvsReL6iV1rmWR3qq0s7WK3heX6uvs7X7dh6gp+jny6zmMb8w8HSyWirKamIMp3YRme5m7DHAFsp63RQnKObarWEru5+8JhDeRIuHAF9f1BYLfUbbyLPjaHPdih66JxzQ+cVqD4BTk1zCjRqS1cAOhLL8EvDW4=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(13003099007)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dxxNFyHQZhryZMt2KNCrJH+XzhIZiX9NIFRc6bj0ILsQn+0ppJ5cUDV7rpuemJDEVVboAxjiVD3EQuKXm6N7L2cR9B7u7rd1/rW5VyP4JCTBERKcJRP/PtvNzi1qBtlJ4Q00UmZzmk0dxf7MRjvwiZND/LKP2fuknNTiMOUT1d/LNdsYqK5pP9hKbinYbJHrTLsSL/mcudXV2bZ3tgKkwBcjjzh1o1bRLGjrhwl9XPwf4mFp9+PpxmiXV0aO4nzZR6etlLnSk9afekZC/58g0tyUFSkwKw/ToRFuUAHHmDzmZgXCowQXb0bROSXGBpbxSzdnwtUJui2syg0wSPS5idMtphuk8fPzxLM4hqD8iLwguf7tr5IIsX8lLF8/aBuzF5EYdGSKsINS1R/F8n2eYrrAB49fMTQH+4Xb9WCE3shSL/tuorGfS4XVT+UycmCt
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:28:02.2274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3498f16a-9caf-4934-9ea2-08decb706ada
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11380
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 07:12:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127608

From: Anton Skorup <anton@skorup.se>

CVE details: https://www.cve.org/CVERecord?id=3DCVE-2026-40612

Signed-off-by: Anton Skorup <anton.skorup@axis.com>
---
 .../jq/jq/CVE-2026-40612.patch                | 136 ++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-40612.patch
new file mode 100644
index 0000000000..4078b8b10d
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patch
@@ -0,0 +1,136 @@
+From d1a12569d91641135976a8536776a4a329c02cc2 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Fri, 24 Apr 2026 22:02:24 +0900
+Subject: [PATCH] Limit the containment check depth
+
+This fixes CVE-2026-40612.
+
+Signed-off-by: Anton Skorup
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/d1a12569d91=
641135976a8536776a4a329c02cc2]
+---
+ src/builtin.c |  5 ++++-
+ src/jv.c      | 40 +++++++++++++++++++++++++++-------------
+ tests/jq.test |  9 +++++++++
+ 3 files changed, 40 insertions(+), 14 deletions(-)
+
+diff --git a/src/builtin.c b/src/builtin.c
+index d33e9fb162..2b2a2d40da 100644
+--- a/src/builtin.c
++++ b/src/builtin.c
+@@ -421,7 +421,10 @@ jv binop_greatereq(jv a, jv b) {
+=20
+ static jv f_contains(jq_state *jq, jv a, jv b) {
+   if (jv_get_kind(a) =3D=3D jv_get_kind(b)) {
+-    return jv_bool(jv_contains(a, b));
++    int r =3D jv_contains(a, b);
++    if (r < 0)
++      return jv_invalid_with_msg(jv_string("Containment check too deep"))=
;
++    return jv_bool(r);
+   } else {
+     return type_error2(a, b, "cannot have their containment checked");
+   }
+diff --git a/src/jv.c b/src/jv.c
+index 607ac174f7..4b18c00cf6 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -938,19 +938,19 @@ static void jvp_clamp_slice_params(int len, int *pst=
art, int *pend)
+ }
+=20
+=20
+-static int jvp_array_contains(jv a, jv b) {
++static int jvp_contains(jv a, jv b, int depth);
++
++static int jvp_array_contains(jv a, jv b, int depth) {
+   int r =3D 1;
+   jv_array_foreach(b, bi, belem) {
+     int ri =3D 0;
+     jv_array_foreach(a, ai, aelem) {
+-      if (jv_contains(aelem, jv_copy(belem))) {
+-        ri =3D 1;
+-        break;
+-      }
++      ri =3D jvp_contains(aelem, jv_copy(belem), depth);
++      if (ri) break;
+     }
+     jv_free(belem);
+-    if (!ri) {
+-      r =3D 0;
++    if (ri <=3D 0) {
++      r =3D ri;
+       break;
+     }
+   }
+@@ -1844,7 +1844,7 @@ static int jvp_object_equal(jv o1, jv o2) {
+   return len1 =3D=3D len2;
+ }
+=20
+-static int jvp_object_contains(jv a, jv b) {
++static int jvp_object_contains(jv a, jv b, int depth) {
+   assert(JVP_HAS_KIND(a, JV_KIND_OBJECT));
+   assert(JVP_HAS_KIND(b, JV_KIND_OBJECT));
+   int r =3D 1;
+@@ -1852,9 +1852,9 @@ static int jvp_object_contains(jv a, jv b) {
+   jv_object_foreach(b, key, b_val) {
+     jv a_val =3D jv_object_get(jv_copy(a), key);
+=20
+-    r =3D jv_contains(a_val, b_val);
++    r =3D jvp_contains(a_val, b_val, depth);
+=20
+-    if (!r) break;
++    if (r <=3D 0) break;
+   }
+   return r;
+ }
+@@ -2086,14 +2086,23 @@ int jv_identical(jv a, jv b) {
+   return r;
+ }
+=20
+-int jv_contains(jv a, jv b) {
++#ifndef MAX_CONTAINS_DEPTH
++#define MAX_CONTAINS_DEPTH (10000)
++#endif
++
++static int jvp_contains(jv a, jv b, int depth) {
++  if (depth > MAX_CONTAINS_DEPTH) {
++    jv_free(a);
++    jv_free(b);
++    return -1;
++  }
+   int r =3D 1;
+   if (jv_get_kind(a) !=3D jv_get_kind(b)) {
+     r =3D 0;
+   } else if (JVP_HAS_KIND(a, JV_KIND_OBJECT)) {
+-    r =3D jvp_object_contains(a, b);
++    r =3D jvp_object_contains(a, b, depth + 1);
+   } else if (JVP_HAS_KIND(a, JV_KIND_ARRAY)) {
+-    r =3D jvp_array_contains(a, b);
++    r =3D jvp_array_contains(a, b, depth + 1);
+   } else if (JVP_HAS_KIND(a, JV_KIND_STRING)) {
+     int b_len =3D jv_string_length_bytes(jv_copy(b));
+     if (b_len !=3D 0) {
+@@ -2109,3 +2118,8 @@ int jv_contains(jv a, jv b) {
+   jv_free(b);
+   return r;
+ }
++
++// Returns 1 (contained), 0 (not contained), or -1 (too deep)
++int jv_contains(jv a, jv b) {
++  return jvp_contains(a, b, 0);
++}
+diff --git a/tests/jq.test b/tests/jq.test
+index 0cd5198f8d..8094a5b6eb 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -2593,3 +2593,12 @@ null
+ try delpaths([[range(10001) | 0]]) catch .
+ null
+ "Path too deep"
++
++# regression test for CVE-2026-40612
++reduce range(10000) as $_ ([]; [.]) | contains([[]])
++null
++true
++
++try (reduce range(10001) as $_ ([]; [.]) as $x | $x | contains($x)) catch=
 .
++null
++"Containment check too deep"
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index bb4601b667..0653dcd1f1 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-33947.patch \
            file://CVE-2026-33948.patch \
            file://CVE-2026-39979.patch \
+           file://CVE-2026-40612.patch \
            file://CVE-2026-41256.patch \
            file://CVE-2026-41257.patch \
            file://CVE-2026-43896.patch \
--=20
2.43.0


