Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122A6CD6E45
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 07:24:52 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5201.1780039244923236644
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2026 00:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Y5/Mkyk7;
 spf=pass (domain: axis.com, ip: 40.107.159.53, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2nDMkaBOTcKYW+rXsV7xKzG3fW1WInTcgLQfHdlppE/7XjnE7jZ09pxGlBa9nHYSleO0x3nprTa6LSawB4padNgdM6addyndXnAVIHwjpENsVKf0TyrcqIikFU3lY1oLMfb8KK8xjXZOX4FptyNT46xczMV+vIgRHvlYO7TuJdNNMiK09qX+QCnmdWK6jUqLl73bcqW4NRne6tcgyIy4MmGH1Ajur0hSKYsq5ijiqheputh6lhsJqjltUnKZzQQIgtsp4fqjoBuYcHfum/7MBt+u8tEBEvnjfrkeZm57Z2DDBEMKG7nFvU8Kc4U2MquumXo7ChUetu/qqaccxrL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkJuH6DmtdDV4cyBqjOmkSTvSSLoECA23PMoOyjcLtI=;
 b=HEfBQrqE2ClSE6wLjjhe8GxEDl27nU9RDgTqyO+vJznTThdKmbjiuOy+K7CfDp9CyDVDgZo4GXb/JlkxnQznLyhLgc4E4U22FZYJVWJbERvtikZZvats/QFE0f/0vVA+C+YF3+7oXvsfUFUcviEzs37EyMl3Y/78hujMz1P0uiZJ/HQIlanmyYMKF9KaetWyaOKQRDfGdVJLwBt3x/spG7pDxX0oG2X3HOKPKJheNYxBjkYRSFrSfU23LNOOsZCmK7TZg+h/c0pnlh7XDJ+Ltg2hOpWlwsPjOmdG8r3I3UF+WVNb/S9kh9Br+VQ0sGcC7mWJEuXiuBtmRKnawWHOCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkJuH6DmtdDV4cyBqjOmkSTvSSLoECA23PMoOyjcLtI=;
 b=Y5/Mkyk7rPjLpV7vYOtaysbjWkeCOamFbJTJK0qLwn+3PnXDMpzxfFCMlfg9/cVg2MquIfNrNKZEEgpQ7qH5hVx4TaiEf4c4BIbDJdQ1gU/BgqZ4t3haculybMMdPsUvO/MBjMoKh+AaEDKV20+NUpQu5Wqm2iE1OJMwjBkiIy0=
Received: from DUZPR01CA0224.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::20) by DU4PR02MB11786.eurprd02.prod.outlook.com
 (2603:10a6:10:63b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 07:05:32 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::a8) by DUZPR01CA0224.outlook.office365.com
 (2603:10a6:10:4b4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.14 via Frontend Transport; Fri, 29
 May 2026 07:05:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 07:05:31 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 29 May
 2026 09:05:31 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 29 May 2026 09:05:31 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 45BA389E;
	Fri, 29 May 2026 09:05:31 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id 42A9B857CC0; Fri, 29 May 2026 09:05:31 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [meta-oe][PATCH] jq: patch CVE-2026-47770
Date: Fri, 29 May 2026 09:05:22 +0200
Message-ID: <20260529070522.3737233-1-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFE:EE_|DU4PR02MB11786:EE_
X-MS-Office365-Filtering-Correlation-Id: 3425df22-50b3-4898-2800-08debd50ac30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|13003099007|56012099006|6133799003|3023799007|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	oCD6YGqrb4Z/V2KjIneAreGK9tnun0AlIpjBVKAmy9+7ar3vV+Fp90emt9xszt/+vv4d8EHj2sa3PFMjdQM0XFEUPhHO0tuNxkzxGPPqQ3Vy2Bw537rJrBZc0Ggdr8JaXqQVQFrYtJC1wbroaONbUHs/xcjdTS78bDyxRKcUMWaMYbj47xe+7OTY1g+J6kANR6Fc0DdIU9n4xyoMZc1vbKhZMEM0FCYI6Xdh93CxXUGcOzLAHW4hWPFo06XTbE2pvcAFK79HHLA6IsJcVlIxk65BHLhUo4UADmBd6xQ/jW1XzmiUSjUKqZwhZTwTKz/07uPfVfJmXcIEOtYIg5zQ6ramyL5y6m5y7CilmqInneOumtzio7B8L5SZtPGa6SY/GDzgDwyzf+wvVh+/vg9gTeGG1zMvn1YCo+fyTNNRklkJ1gn/JJsYbDu6j5TaXovFcf6mbjN8cCTN0EZ1day+Uvk7fVrJA3G5eEv+LZXqzjZWxof6UBFFADlK0WkthvLzlSDBLMmvMGp0CVHeZ/8+eOVz6DgP+NPbkGDrE0iK3nbUatRsTJ3/BVI8ReXS2WKWYDF1fJ7Dg1SjU6FB9Mtqygu4xHtLsBzrEoS7iW6Y7sqoTtzlWjWf25yp3U3QkBTlN7jBQ+7YtZ99sBXK8j84bue7XwNzgMTRO3Fr4w2zwfUTSxwYnps18cez+ZDUf3sFQxclQCstWvnvc4GueHaCRCzzyL+sROC8UPyiotc/Fxc=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(13003099007)(56012099006)(6133799003)(3023799007)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8YQa7mXTA1BqJ9+Fx1G9KiPZ0/veEdaNcMpDMOuqHKf3EHorAuVg9I+WoxCTpBzZK+V2FQJS/22OAYHb7NU+aFdVu38A3YFYp4HCjQx2RvUkcoOxy5HtiJVBZiidIvEe2z/tuh4ztNnYpem+6O6SlNpFlkUkRbdADyXUBGBzyG5v0jcFxw3lWJRZaHhJGm26fdepb3eG6P7Sa8toE63/bXneI9shmIPP4AGA5G9DoEkHhJZBamjoVKFEXiEycKNFQhvc+o0VZ12zs8yHx5k7aEejr3HBug9dPx589cHcmN9/i/UMOkFZzRcGTMdFrpnbNLNqzETkR8yQNLzdfGBpZZb38TrgzAbemDPUDw5ZiKwgCMPfD9IruxH5m+DRmqjNVuTjTADLvD2VVI7jkWCp6oiCBdAT1Gsu+/a/MXneJyU0X5QCLiuoHgsqehgSMNIh
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 07:05:31.6573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3425df22-50b3-4898-2800-08debd50ac30
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11786
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 07:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127282

From: Anton Skorup <anton@skorup.se>

This patch adds the upstream patch for CVE-2026-47770.

Details: https://ubuntu.com/security/CVE-2026-47770
Reference: https://github.com/jqlang/jq/commit/7122866869960b55cea3646bc913=
34ef55787831
Signed-off-by: Anton Skorup <anton.skorup@axis.com>
---
 .../jq/jq/CVE-2026-47770.patch                | 483 ++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |   1 +
 2 files changed, 484 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-47770.patch
new file mode 100644
index 0000000000..2c1eb04f76
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
@@ -0,0 +1,483 @@
+From b4d48d83e7fe19a31824822da1393a367a59b7ba Mon Sep 17 00:00:00 2001
+From: Yu-Fu Fu <yufu@yfu.tw>
+Date: Fri, 22 May 2026 04:07:16 -0700
+Subject: [PATCH] Guard deep structural equality and comparison recursion
+ (#3539)
+
+jv_equal and jv_cmp overflows the C stack on deeply nested
+input. Cap recursion at 10000 with -1 / INT_MIN sentinels;
+operators that compose user expressions surface this as
+"Equality check too deep" / "Comparison too deep".
+
+Fixes CVE-2026-47770.
+
+Change-Id: I11794879105850d5e3cd48943b1ad31bfdd2d23a
+---
+ src/builtin.c |  36 +++++++++++++++--
+ src/jv.c      |  46 +++++++++++++++++-----
+ src/jv_aux.c  | 105 ++++++++++++++++++++++++++++++++++++++++++--------
+ tests/jq.test |  40 +++++++++++++++++++
+ 4 files changed, 198 insertions(+), 29 deletions(-)
+
+diff --git a/src/builtin.c b/src/builtin.c
+index ac56f9f..ac25f90 100644
+--- a/src/builtin.c
++++ b/src/builtin.c
+@@ -295,7 +295,15 @@ jv binop_minus(jv a, jv b) {
+     jv_array_foreach(a, i, x) {
+       int include =3D 1;
+       jv_array_foreach(b, j, y) {
+-        if (jv_equal(jv_copy(x), y)) {
++        int equal =3D jv_equal(jv_copy(x), y);
++        if (equal < 0) {
++          jv_free(out);
++          jv_free(x);
++          jv_free(a);
++          jv_free(b);
++          return jv_invalid_with_msg(jv_string("Equality check too deep")=
);
++        }
++        if (equal) {
+           include =3D 0;
+           break;
+         }
+@@ -379,11 +387,17 @@ jv binop_mod(jv a, jv b) {
+ #undef dtoi
+=20
+ jv binop_equal(jv a, jv b) {
+-  return jv_bool(jv_equal(a, b));
++  int r =3D jv_equal(a, b);
++  if (r < 0)
++    return jv_invalid_with_msg(jv_string("Equality check too deep"));
++  return jv_bool(r);
+ }
+=20
+ jv binop_notequal(jv a, jv b) {
+-  return jv_bool(!jv_equal(a, b));
++  int r =3D jv_equal(a, b);
++  if (r < 0)
++    return jv_invalid_with_msg(jv_string("Equality check too deep"));
++  return jv_bool(!r);
+ }
+=20
+ enum cmp_op {
+@@ -395,6 +409,8 @@ enum cmp_op {
+=20
+ static jv order_cmp(jv a, jv b, enum cmp_op op) {
+   int r =3D jv_cmp(a, b);
++  if (r =3D=3D INT_MIN)
++    return jv_invalid_with_msg(jv_string("Comparison too deep"));
+   return jv_bool((op =3D=3D CMP_OP_LESS && r < 0) ||
+                  (op =3D=3D CMP_OP_LESSEQ && r <=3D 0) ||
+                  (op =3D=3D CMP_OP_GREATEREQ && r >=3D 0) ||
+@@ -845,6 +861,12 @@ static jv f_bsearch(jq_state *jq, jv input, jv target=
) {
+   while (start < end) {
+     int mid =3D start + (end - start) / 2;
+     int result =3D jv_cmp(jv_copy(target), jv_array_get(jv_copy(input), m=
id));
++    if (result =3D=3D INT_MIN) {
++      jv_free(answer);
++      jv_free(input);
++      jv_free(target);
++      return jv_invalid_with_msg(jv_string("Comparison too deep"));
++    }
+     if (result =3D=3D 0) {
+       answer =3D jv_number(mid);
+       break;
+@@ -1136,6 +1158,14 @@ static jv minmax_by(jv values, jv keys, int is_min)=
 {
+   for (int i=3D1; i<jv_array_length(jv_copy(values)); i++) {
+     jv item =3D jv_array_get(jv_copy(keys), i);
+     int cmp =3D jv_cmp(jv_copy(item), jv_copy(retkey));
++    if (cmp =3D=3D INT_MIN) {
++      jv_free(item);
++      jv_free(values);
++      jv_free(keys);
++      jv_free(retkey);
++      jv_free(ret);
++      return jv_invalid_with_msg(jv_string("Comparison too deep"));
++    }
+     if ((cmp < 0) =3D=3D (is_min =3D=3D 1)) {
+       jv_free(retkey);
+       retkey =3D item;
+diff --git a/src/jv.c b/src/jv.c
+index f701b46..e079d08 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -912,16 +912,20 @@ static jv* jvp_array_write(jv* a, int i) {
+   }
+ }
+=20
+-static int jvp_array_equal(jv a, jv b) {
++static int jvp_equal(jv a, jv b, int depth);
++
++static int jvp_array_equal(jv a, jv b, int depth) {
+   if (jvp_array_length(a) !=3D jvp_array_length(b))
+     return 0;
+   if (jvp_array_ptr(a) =3D=3D jvp_array_ptr(b) &&
+       jvp_array_offset(a) =3D=3D jvp_array_offset(b))
+     return 1;
+   for (int i=3D0; i<jvp_array_length(a); i++) {
+-    if (!jv_equal(jv_copy(*jvp_array_read(a, i)),
+-                  jv_copy(*jvp_array_read(b, i))))
+-      return 0;
++    int r =3D jvp_equal(jv_copy(*jvp_array_read(a, i)),
++                      jv_copy(*jvp_array_read(b, i)),
++                      depth);
++    if (r <=3D 0)
++      return r;
+   }
+   return 1;
+ }
+@@ -1071,7 +1075,14 @@ jv jv_array_indexes(jv a, jv b) {
+   int alen =3D jv_array_length(jv_copy(a));
+   for (int ai =3D 0; ai < alen; ++ai) {
+     jv_array_foreach(b, bi, belem) {
+-      if (!jv_equal(jv_array_get(jv_copy(a), ai + bi), belem))
++      int equal =3D jv_equal(jv_array_get(jv_copy(a), ai + bi), belem);
++      if (equal < 0) {
++        jv_free(res);
++        jv_free(a);
++        jv_free(b);
++        return jv_invalid_with_msg(jv_string("Equality check too deep"));
++      }
++      if (!equal)
+         idx =3D -1;
+       else if (bi =3D=3D 0 && idx =3D=3D -1)
+         idx =3D ai;
+@@ -1828,7 +1839,7 @@ static int jvp_object_length(jv object) {
+   return n;
+ }
+=20
+-static int jvp_object_equal(jv o1, jv o2) {
++static int jvp_object_equal(jv o1, jv o2, int depth) {
+   int len2 =3D jvp_object_length(o2);
+   int len1 =3D 0;
+   for (int i=3D0; i<jvp_object_size(o1); i++) {
+@@ -1837,7 +1848,8 @@ static int jvp_object_equal(jv o1, jv o2) {
+     jv* slot2 =3D jvp_object_read(o2, slot->string);
+     if (!slot2) return 0;
+     // FIXME: do less refcounting here
+-    if (!jv_equal(jv_copy(slot->value), jv_copy(*slot2))) return 0;
++    int r =3D jvp_equal(jv_copy(slot->value), jv_copy(*slot2), depth);
++    if (r <=3D 0) return r;
+     len1++;
+   }
+   return len1 =3D=3D len2;
+@@ -2032,7 +2044,16 @@ int jv_get_refcnt(jv j) {
+  * Higher-level operations
+  */
+=20
+-int jv_equal(jv a, jv b) {
++#ifndef MAX_EQUAL_DEPTH
++#define MAX_EQUAL_DEPTH (10000)
++#endif
++
++static int jvp_equal(jv a, jv b, int depth) {
++  if (depth > MAX_EQUAL_DEPTH) {
++    jv_free(a);
++    jv_free(b);
++    return -1;
++  }
+   int r;
+   if (jv_get_kind(a) !=3D jv_get_kind(b)) {
+     r =3D 0;
+@@ -2048,13 +2069,13 @@ int jv_equal(jv a, jv b) {
+       r =3D jvp_number_equal(a, b);
+       break;
+     case JV_KIND_ARRAY:
+-      r =3D jvp_array_equal(a, b);
++      r =3D jvp_array_equal(a, b, depth + 1);
+       break;
+     case JV_KIND_STRING:
+       r =3D jvp_string_equal(a, b);
+       break;
+     case JV_KIND_OBJECT:
+-      r =3D jvp_object_equal(a, b);
++      r =3D jvp_object_equal(a, b, depth + 1);
+       break;
+     default:
+       r =3D 1;
+@@ -2066,6 +2087,11 @@ int jv_equal(jv a, jv b) {
+   return r;
+ }
+=20
++// Returns 1 if equal, 0 if not equal, or -1 if the comparison is too dee=
p
++int jv_equal(jv a, jv b) {
++  return jvp_equal(a, b, 0);
++}
++
+ int jv_identical(jv a, jv b) {
+   int r;
+   if (a.kind_flags !=3D b.kind_flags
+diff --git a/src/jv_aux.c b/src/jv_aux.c
+index 594a21f..a39f1f1 100644
+--- a/src/jv_aux.c
++++ b/src/jv_aux.c
+@@ -16,6 +16,24 @@ static double jv_number_get_value_and_consume(jv number=
) {
+   return value;
+ }
+=20
++#ifndef MAX_CMP_DEPTH
++#define MAX_CMP_DEPTH (10000)
++#endif
++
++struct sort_cmp_state {
++  int too_deep;
++};
++
++#ifdef _MSC_VER
++static __declspec(thread) struct sort_cmp_state sort_cmp_state;
++#else
++#ifdef HAVE___THREAD
++static __thread struct sort_cmp_state sort_cmp_state;
++#else
++static struct sort_cmp_state sort_cmp_state;
++#endif
++#endif
++
+ static jv parse_slice(jv j, jv slice, int* pstart, int* pend) {
+   // Array slices
+   jv start_jv =3D jv_object_get(jv_copy(slice), jv_string("start"));
+@@ -471,8 +489,7 @@ static jv delpaths_sorted(jv object, jv paths, int sta=
rt) {
+     int delkey =3D jv_array_length(jv_array_get(jv_copy(paths), i)) =3D=
=3D start + 1;
+     jv key =3D jv_array_get(jv_array_get(jv_copy(paths), i), start);
+     while (j < jv_array_length(jv_copy(paths)) &&
+-           jv_equal(jv_copy(key), jv_array_get(jv_array_get(jv_copy(paths=
), j), start)))
+-      j++;
++           jv_equal(jv_copy(key), jv_array_get(jv_array_get(jv_copy(paths=
), j), start)) =3D=3D 1);
+     // if i <=3D entry < j, then entry starts with key
+     if (delkey) {
+       // deleting this entire key, we don't care about any more specific =
deletions
+@@ -606,7 +623,13 @@ jv jv_keys(jv x) {
+   }
+ }
+=20
+-int jv_cmp(jv a, jv b) {
++static int jvp_cmp(jv a, jv b, int depth) {
++  if (depth > MAX_CMP_DEPTH) {
++    jv_free(a);
++    jv_free(b);
++    return INT_MIN;
++  }
++
+   if (jv_get_kind(a) !=3D jv_get_kind(b)) {
+     int r =3D (int)jv_get_kind(a) - (int)jv_get_kind(b);
+     jv_free(a);
+@@ -621,14 +644,13 @@ int jv_cmp(jv a, jv b) {
+   case JV_KIND_FALSE:
+   case JV_KIND_TRUE:
+     // there's only one of each of these values
+-    r =3D 0;
+     break;
+=20
+   case JV_KIND_NUMBER: {
+     if (jvp_number_is_nan(a)) {
+-      r =3D jv_cmp(jv_null(), jv_copy(b));
++      r =3D jvp_cmp(jv_null(), jv_copy(b), depth);
+     } else if (jvp_number_is_nan(b)) {
+-      r =3D jv_cmp(jv_copy(a), jv_null());
++      r =3D jvp_cmp(jv_copy(a), jv_null(), depth);
+     } else {
+       r =3D jvp_number_cmp(a, b);
+     }
+@@ -652,7 +674,9 @@ int jv_cmp(jv a, jv b) {
+       }
+       jv xa =3D jv_array_get(jv_copy(a), i);
+       jv xb =3D jv_array_get(jv_copy(b), i);
+-      r =3D jv_cmp(xa, xb);
++      r =3D jvp_cmp(xa, xb, depth + 1);
++      if (r =3D=3D INT_MIN)
++        break;
+       i++;
+     }
+     break;
+@@ -661,13 +685,14 @@ int jv_cmp(jv a, jv b) {
+   case JV_KIND_OBJECT: {
+     jv keys_a =3D jv_keys(jv_copy(a));
+     jv keys_b =3D jv_keys(jv_copy(b));
+-    r =3D jv_cmp(jv_copy(keys_a), keys_b);
++    r =3D jvp_cmp(jv_copy(keys_a), keys_b, depth + 1);
+     if (r =3D=3D 0) {
+       jv_array_foreach(keys_a, i, key) {
+         jv xa =3D jv_object_get(jv_copy(a), jv_copy(key));
+         jv xb =3D jv_object_get(jv_copy(b), key);
+-        r =3D jv_cmp(xa, xb);
+-        if (r) break;
++        r =3D jvp_cmp(xa, xb, depth + 1);
++        if (r !=3D 0)
++          break;
+       }
+     }
+     jv_free(keys_a);
+@@ -680,6 +705,11 @@ int jv_cmp(jv a, jv b) {
+   return r;
+ }
+=20
++// Returns <0, 0, >0 if a is less than, equal to, or greater than b, or
++// INT_MIN if the comparison is too deep
++int jv_cmp(jv a, jv b) {
++  return jvp_cmp(a, b, 0);
++}
+=20
+ struct sort_entry {
+   jv object;
+@@ -687,19 +717,32 @@ struct sort_entry {
+   int index;
+ };
+=20
++static void sort_entry_array_free(struct sort_entry* entries, int start, =
int n) {
++  for (int i =3D start; i < n; i++) {
++    jv_free(entries[i].key);
++    jv_free(entries[i].object);
++  }
++  jv_mem_free(entries);
++}
++
+ static int sort_cmp(const void* pa, const void* pb) {
+   const struct sort_entry* a =3D pa;
+   const struct sort_entry* b =3D pb;
+   int r =3D jv_cmp(jv_copy(a->key), jv_copy(b->key));
++  if (r =3D=3D INT_MIN) {
++    sort_cmp_state.too_deep =3D 1;
++    return 0;
++  }
+   // comparing by index if r =3D=3D 0 makes the sort stable
+   return r ? r : (a->index - b->index);
+ }
+=20
+-static struct sort_entry* sort_items(jv objects, jv keys) {
++static struct sort_entry* sort_items(jv objects, jv keys, int *too_deep) =
{
+   assert(jv_get_kind(objects) =3D=3D JV_KIND_ARRAY);
+   assert(jv_get_kind(keys) =3D=3D JV_KIND_ARRAY);
+   assert(jv_array_length(jv_copy(objects)) =3D=3D jv_array_length(jv_copy=
(keys)));
+   int n =3D jv_array_length(jv_copy(objects));
++  *too_deep =3D 0;
+   if (n =3D=3D 0) {
+     jv_free(objects);
+     jv_free(keys);
+@@ -713,7 +756,13 @@ static struct sort_entry* sort_items(jv objects, jv k=
eys) {
+   }
+   jv_free(objects);
+   jv_free(keys);
++  sort_cmp_state.too_deep =3D 0;
+   qsort(entries, n, sizeof(struct sort_entry), sort_cmp);
++  if (sort_cmp_state.too_deep) {
++    sort_entry_array_free(entries, 0, n);
++    *too_deep =3D 1;
++    return NULL;
++  }
+   return entries;
+ }
+=20
+@@ -722,7 +771,10 @@ jv jv_sort(jv objects, jv keys) {
+   assert(jv_get_kind(keys) =3D=3D JV_KIND_ARRAY);
+   assert(jv_array_length(jv_copy(objects)) =3D=3D jv_array_length(jv_copy=
(keys)));
+   int n =3D jv_array_length(jv_copy(objects));
+-  struct sort_entry* entries =3D sort_items(objects, keys);
++  int too_deep =3D 0;
++  struct sort_entry* entries =3D sort_items(objects, keys, &too_deep);
++  if (too_deep)
++    return jv_invalid_with_msg(jv_string("Comparison too deep"));
+   jv ret =3D jv_array();
+   for (int i=3D0; i<n; i++) {
+     jv_free(entries[i].key);
+@@ -737,13 +789,24 @@ jv jv_group(jv objects, jv keys) {
+   assert(jv_get_kind(keys) =3D=3D JV_KIND_ARRAY);
+   assert(jv_array_length(jv_copy(objects)) =3D=3D jv_array_length(jv_copy=
(keys)));
+   int n =3D jv_array_length(jv_copy(objects));
+-  struct sort_entry* entries =3D sort_items(objects, keys);
++  int too_deep =3D 0;
++  struct sort_entry* entries =3D sort_items(objects, keys, &too_deep);
++  if (too_deep)
++    return jv_invalid_with_msg(jv_string("Comparison too deep"));
+   jv ret =3D jv_array();
+   if (n > 0) {
+     jv curr_key =3D entries[0].key;
+     jv group =3D jv_array_append(jv_array(), entries[0].object);
+     for (int i =3D 1; i < n; i++) {
+-      if (jv_equal(jv_copy(curr_key), jv_copy(entries[i].key))) {
++      int equal =3D jv_equal(jv_copy(curr_key), jv_copy(entries[i].key));
++      if (equal < 0) {
++        jv_free(curr_key);
++        jv_free(group);
++        sort_entry_array_free(entries, i, n);
++        jv_free(ret);
++        return jv_invalid_with_msg(jv_string("Equality check too deep"));
++      }
++      if (equal) {
+         jv_free(entries[i].key);
+       } else {
+         jv_free(curr_key);
+@@ -765,11 +828,21 @@ jv jv_unique(jv objects, jv keys) {
+   assert(jv_get_kind(keys) =3D=3D JV_KIND_ARRAY);
+   assert(jv_array_length(jv_copy(objects)) =3D=3D jv_array_length(jv_copy=
(keys)));
+   int n =3D jv_array_length(jv_copy(objects));
+-  struct sort_entry* entries =3D sort_items(objects, keys);
++  int too_deep =3D 0;
++  struct sort_entry* entries =3D sort_items(objects, keys, &too_deep);
++  if (too_deep)
++    return jv_invalid_with_msg(jv_string("Comparison too deep"));
+   jv ret =3D jv_array();
+   jv curr_key =3D jv_invalid();
+   for (int i =3D 0; i < n; i++) {
+-    if (jv_equal(jv_copy(curr_key), jv_copy(entries[i].key))) {
++    int equal =3D jv_equal(jv_copy(curr_key), jv_copy(entries[i].key));
++    if (equal < 0) {
++      jv_free(curr_key);
++      sort_entry_array_free(entries, i, n);
++      jv_free(ret);
++      return jv_invalid_with_msg(jv_string("Equality check too deep"));
++    }
++    if (equal) {
+       jv_free(entries[i].key);
+       jv_free(entries[i].object);
+     } else {
+diff --git a/tests/jq.test b/tests/jq.test
+index 5013bce..f35ef94 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -2560,3 +2560,43 @@ null
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
++
++# regression test for CVE-2026-43896
++reduce range(10000) as $_ ({}; {a: .}) as $x | $x * $x | length
++null
++1
++
++try (reduce range(10001) as $_ ({}; {a: .}) as $x | $x * $x) catch .
++null
++"Object merge too deep"
++
++# regression test for deep structural equality recursion
++try ((reduce range(10001) as $_ ([]; [.])) as $x | (reduce range(10001) a=
s $_ ([]; [.])) as $y | $x =3D=3D $y) catch .
++null
++"Equality check too deep"
++
++# regression tests for deep ordering comparisons
++try ((reduce range(10001) as $_ ([]; [.])) as $x | [$x, $x] | sort) catch=
 .
++null
++"Comparison too deep"
++
++try ((reduce range(10001) as $_ ([]; [.])) as $x | [$x, $x] | unique) cat=
ch .
++null
++"Comparison too deep"
++
++try ((reduce range(10001) as $_ ({}; {a: .})) as $x | [$x, $x] | sort) ca=
tch .
++null
++"Comparison too deep"
++
++try ((reduce range(10001) as $_ ({}; {a: .})) as $x | [$x, $x] | unique) =
catch .
++null
++"Comparison too deep"
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index 026f6bfa71..7665ba2511 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-33947.patch \
            file://CVE-2026-33948.patch \
            file://CVE-2026-39979.patch \
+           file://CVE-2026-47770.patch \
            "
=20
 inherit autotools ptest
--=20
2.43.0


