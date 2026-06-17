Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1DCCD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 06:14:28 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9051.1781674252668973822
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 22:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=XRnktjJM;
 spf=pass (domain: axis.com, ip: 52.101.65.17, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsJg7DGdnC0DugQ5lzMS5vQ4Dw/kNp3KmwOWLcxZhanchKqucrQsa7qp561tcyvXff9otuWu/runQjTDLzDIlmTr8bpKX5TvrVsDBl2xZC/WhW0FFJ01IxMpUVHWDBI2ryTP/GEgRUcp5UTdP5u9HstFPb6BVnSt8ZKe/JkNPqyXQeL4qnwzhrXSNeAZsfpuerz5Agem8RlB+WwN8/RbxFWI0PLeIZ8TZ0DoN/0mwkW2mRPFrckfxycC9jGn2Ux85sc3YKouuQC2HykM5uP17etcHHmL3056GQAMrDaD8YKuIbW0NjJjXqyG31sQYReWea2Uh/o7r4yc9V4W2fKCKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjYcZCYoPFqTrenIBrWKaqvwKzzwy5n5bfrrHpB0Kyw=;
 b=h3oxENbwVPoyLK3T32P/x0+MGb0IsHA5ebcXPCa2XbIOE8Wn8AxhvHG7TCW1QmwAavVnWs9KHFXL6TJ6pnR0qFIdDVQP3RtFlLzSGBXvzaeer7HjA6X/Wbms76nW+HLbBUeLVGsMiMfSdskLODToaKp1U5vJQCCGDEe01SkAz1KPwM0kwz1SG39Sp5AO4VqTxWoK9fTgG7eyFefIIAIB7P2RSAHYlR+ulrwb0pDlND5O8fYpt7fRujomPlsFojUkgWQB4nm552td+ARufFfJAeaDsWZmbB7wCZ+Dv9LOhOf+EDtJvqMcxvfx8zDQH0iHsUx7ttETL3inZ4UF80najA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjYcZCYoPFqTrenIBrWKaqvwKzzwy5n5bfrrHpB0Kyw=;
 b=XRnktjJMnCgE876Z+7pxVzyNxWEWb4AtWVn9yFOmCklHOz7IuuMXvW65L2t5EV07W4nhxrFVheQFAbQ9jx+jRTfHKMCvnvuKR2OV6/v3yB9CCrduZ5ftszM6pvk1V+2pUAnJYwjKbvwfV4VlZpkfytNWiispUOVO5o16JKdFX+E=
Received: from CWLP265CA0504.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::23)
 by DBBPR02MB10556.eurprd02.prod.outlook.com (2603:10a6:10:53c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 05:30:47 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:400:18b:cafe::a9) by CWLP265CA0504.outlook.office365.com
 (2603:10a6:400:18b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 05:30:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 05:30:46 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 17 Jun
 2026 07:30:46 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 17 Jun
 2026 07:30:46 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 17 Jun 2026 07:30:46 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 5BF72551;
	Wed, 17 Jun 2026 07:30:46 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id 5ACCB8461E6; Wed, 17 Jun 2026 07:30:46 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [meta-oe][PATCHv2 6/8] jq: patch CVE-2026-40612
Date: Wed, 17 Jun 2026 07:30:38 +0200
Message-ID: <20260617053040.990143-6-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617053040.990143-1-antonsk@axis.com>
References: <20260617053040.990143-1-antonsk@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000042:EE_|DBBPR02MB10556:EE_
X-MS-Office365-Filtering-Correlation-Id: ad29c753-776e-4adf-6309-08decc3195a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|56012099006|11063799006|6133799003|22082099003|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	w8OT2IqZMFPt2D01wvQklevzRqViv2PW6Hp9M9TH8TUlThUQb3Si9GFWldGFbrOGWG9IuVVBfuIKGlbUadI93WkDHMhAxZpEYzXgIqtzw6VoB/fze3p/8kxcji6y/NDZEmlUw9uN0hAI9IX/I0RCqbRYK9U67JfCl1okNj4PHoj+do6VuHQ5llLNNWpAJcxgdYI0vaMbBHYvcPBI6FRw74cZlY6F28N9Cs3a36ZYg5dN0LDxCSrhbAY3rZOv5rEjCg6hGvQlHzBbgJ+4K+ACmNwJj8nl3rZY99Eb6rIIgx6mTpAq8vfW6M4O157FDL1P1/QFMAtapviKE4UIW5syVXMfkpwgWeNruWCIHbWhXEbFHwSiTf7ikZYtniiJPw/jRgvTkGDkAnFx9mBp9WQCiCg5CBEmd3eC84Kgvkb7D+M/TTP2Nvelah7yiCmeQWbHugq1iZqNmGnHB85iB2rMQrJ/O2mSVVfKlYOMDLiNNqDRyhPSG9Smc6NGOHUgGX5fv5GaNIMFDCqwz2Tv6XHadv1Mc3Wbc7TWYkxrriNqxc/zCgT+REVlM+AtKuV981ONJTFCToXM7RWF3nA+WhR2gZUfptRzJKi36y9Le3DjdcYhvprtxsw9+CkjKBX+cRzfcES5Ie2o9a4IN7oyT0cVweHYRUX3hD6flHz5a/aF/Vzd3oU2EegtcwMRuNNOqSPXD+erEUTKxhhBB8msEcgfJOdLnJti256+0OVgRwgSYxE=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	w202XEZnqDziAtxdhBkM2VWyX92OPsOSzIH+/expJJB2eFnPSlm4fG78RNKQlU5EoXUz5kErkeTfOcywYeajkgZ0XM2EF4xcyCNaAjlrVlpxK5ceDaFUuXnsDASNcqvBVrGs/aKqo2FvvCqNjwSGrm8Hzr0V2k9J2Qc3LB4Mww0PY9odWI7zHeEOqfEAP/IQOVBvqEPlwji/lVaGw6Kp91iluBMKriB/5qKU6DaRuO3ZEAMve9rZRixvAnGlOUdmpV3yB5lZRpLszhCMBFHrXvzVX71iLWxlK/uQgSgfQ1b7HKyqumCrAcuu0oq62UuSVdutkaBYhpyyNiPEyVh3jkIaJ81FkMXBo4j0VD1uDx77rQuqMRdeYTan+ij4rPpzhGy9LstEXYI48UIxWAOp8+mJHC4cdkD6xhcEcyMNEiiASLhhz21SnzTlW03FrYNY
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:30:46.9049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad29c753-776e-4adf-6309-08decc3195a9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10556
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 06:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127632

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
index 9af7e00f3b..aff33589b9 100644
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


