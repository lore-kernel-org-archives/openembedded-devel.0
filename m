Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8701CCD98D2
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 07:12:12 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.148428.1781591287456937043
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 23:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=o3sKzfWx;
 spf=pass (domain: axis.com, ip: 52.101.70.23, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGfuC8Mssc7u07vj/Ug4HfmFlzSeMvEiwKvyGwMt8saQj2i+DbELy3F12Ssgce2l2ZO/AJwJCPoFXm+5Q0WeLeCjNB6WYKs4uOCea2RyzvR46h1s+brr53bS0rBWPhxPPddQYB7OqyByGgs48TuIfJ58aQxAwBYOAlSn+9e5jj4j7J0N1EbbFViLJ5904tX+6uMlU+XmSVVgc6YBHmsY6otZRAofTxcd2dwq845rOmm4jkAzhSFXsfZYBjDv5OBi8z4pEPNmJ4HRo53XmDHzVuHccHxXrKDMm5wMEZo6WSjlfjWmlkn+l+auV53pptf0f3p8sJZ08cdP/Rlwr7BWNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVjiq6kkqN+Ao9gZ84cwBJvksQrjhCjZkvF61hGkfAg=;
 b=neZAN81qaPvv78tO274GR4PCTE0hzRVZg4ruTZOLrKEYHE6gfwVdDzQyr0ZoQabEjmsrcXHo6WVFIszmT4UAsVjxZyHZDjxu/AQjIh8t38qfiJAyuNVbqCIjQLmlmbYCDDCB0TwiOggt8PEeIlicPhLGn4icaj/N6eqteoCJGzdRjLk4f7o7KflAKvfocf9y5ay9NyXaEejdrlYv7Uw41mZd9LSC/A/cx3PKFfi48a95LtsYyf0N4Edk81jb71PmzsCXA8CKc0eulVrq4cj/Uw+hFqVgtwrWyMc5loTwN8qEII+hEITdy/eqvx7ELwa1EuLWVSgbJfFHvXxY/f10Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVjiq6kkqN+Ao9gZ84cwBJvksQrjhCjZkvF61hGkfAg=;
 b=o3sKzfWxpVbGFouONkBBAIx3x9TgzyFQEbqIe7uqYDBdWrQeagot2ao1kphpXeDEVII15RNfZJDaVEo9X+ZH1Ru/Csxmj57IB/Zyzs5MYg8l6/8ay8c5Dt+c+m4OMz+p3oPgI2p1VM0l3/lMSoZeEt9T4IqQIfKkMKCkhjwK7cg=
Received: from CWLP265CA0431.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::7)
 by AS8PR02MB8613.eurprd02.prod.outlook.com (2603:10a6:20b:54b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 06:28:01 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:400:1d7:cafe::97) by CWLP265CA0431.outlook.office365.com
 (2603:10a6:400:1d7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 06:28:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 06:28:01 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 16 Jun
 2026 08:28:00 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 16 Jun 2026 08:28:00 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id B5CCE2480;
	Tue, 16 Jun 2026 08:28:00 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id B2C878461E6; Tue, 16 Jun 2026 08:28:00 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [PATCH 4/8] jq: patch CVE-2026-43896
Date: Tue, 16 Jun 2026 08:27:50 +0200
Message-ID: <20260616062754.748436-4-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616062754.748436-1-antonsk@axis.com>
References: <20260616062754.748436-1-antonsk@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C715:EE_|AS8PR02MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: 9049bc78-4028-473c-edae-08decb706a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|13003099007|22082099003|18002099003|11063799006|3023799007|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	GTH3UYJZvgHZrgICRkGyTwIAA4N067m68clb1e2jJWyT6fthpbAX1gAbXPUzbUydlc2X9eLPFuXbEMkX4ty15vJUOZ14nOS077JxI4ZUFDyahj2urE1N7P1V+HUBl7nSge4wGFfXhdRdkZbHrLW1qZm0MOCaplDB+2bAT2BLRIrrWvu1Q+vfJrybquOeiPbrxRgLdZXIfkGRNKcOKJwIpB1WJaGesdSuEQoYyZg0LFDZI0/x6mx8ZWdxgySTfYn97LKuBTVJljrroSZpsK5FllgUaNooS9GEOHChHNa7LS4gg4+cw/vngQQW60H9Yaf3DpfYM7fETBqEkmNt5pZyd3FhpZNjOq2+TirXqRJxY/avxTnLrjJ4rdd0YbHSpmmtrr5eSfC68Qe8OX8c1s11YDbUY5tUMT2uXcMM3Q07OpmPqOC2eijVZgvYtjWcVq94mzp15LwX37UUNRmsaQvuglgmu874ERFPwBFsdOC/MAAVoNtPL0lpekVdF21AgkD8uXE8I2uPUMVETuIQUtdnhstLrx6Ow2eUCu9cvuGZffVpMXoSHoPRTfsORRSdaeTVn+X53VEq3F85r44MKwCPgWgXR9EtxIgZkDdHFbbRlH3gVlK+t8sP2uA96jNcGZuzrpWIqTHGaPNV+QXgxoyeCUMOest4XZuT/lDLSrv21ts/RBk1nEHgYbFSAJrd1XmJJ8RkfltDu5tTvpsoitqsZiw1QgDHKfBBGqQ8jr00M9w=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(13003099007)(22082099003)(18002099003)(11063799006)(3023799007)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0AymU7UNQS01juJuaeyfMI8LNOZ6XZtSPne3tm3k1opE1jBcDEJjyAG1GVUyer8hgyJd/UyePX/mwGqaSPaNP1iFi+AsY9hR3GQ2LR62H/sDYDglA+DADhvWHfjX+GxERjisvRIOuhQNUtJ8Xm0ax2FxrOLtA1epX5Qh1PVPzalZ9X1LcUwQX+Xb64TMwTT65tIfg+ADjwtdzjOHRu21oKIDqbkFkVobLO4t6Nxe/H1a862rZVL799xkmW3xMugJt5HQIJA8AKIdz1+4Wf7BOG0KMbifyMmCta5lRbcZ8VfABohZ5Fn04Aousa/qkLlZREpzCsKazN9loK/7FNb7iY9Tht6W9mJ4AWV1tRMYJotjisii5pX5cwny4tuwZSoGczb1c10JM8bDeJhl50duK044kfRfYTYPMH3a2/F2eH6Ciy3QP9QCBLMiW3OGV2LF
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 06:28:01.3244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9049bc78-4028-473c-edae-08decb706a50
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8613
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 07:12:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127607

From: Anton Skorup <anton@skorup.se>

CVE details: https://www.cve.org/CVERecord?id=3DCVE-2026-43896

Signed-off-by: Anton Skorup <anton.skorup@axis.com>
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
index 2e6c3a3eea..082a827041 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-33948.patch \
            file://CVE-2026-39979.patch \
            file://CVE-2026-41256.patch \
+           file://CVE-2026-43896.patch \
            file://CVE-2026-44777.patch \
            file://CVE-2026-49389.patch \
            "
--=20
2.43.0


