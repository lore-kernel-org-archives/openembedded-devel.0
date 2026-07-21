Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5166AC4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 09:39:47 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18898.1784626783101135656
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 02:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=azTNCJbs;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15631; q=dns/txt;
  s=iport01; t=1784626783; x=1785836383;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gmu9TpR3zusxB0RL4hYrsyLhzHBWQIGc8rDrRAkzM3I=;
  b=azTNCJbsElc5aYZrEvwL+CNQuPdaBAHFAQ2pO5S9t8v4rbKeV6n/rrym
   ta21jpXIcSurHcajajCIGo3tPmpqCxpNCWZKPPfKViz/Fn/2QBvoTt3j9
   ZYekiQ7Ei+/NbN//NdmLBstvYqbWQg4+4TZG8scXEuL8hi0cOtUsTyNxe
   TjvhHeMd9tYjhtrrKJxQJXbsJFkU6bTYAFmU8G4Kcg4CjKvx6lc6vB/ht
   iTUFiMLub9VwoU4Ps8HsQMSniGeTw2eJc9hLA7h86Q7QcEC8c9+EnKr8R
   7V3wWjSsigG/F8+LE7mSA6D9NrfPASpmGyUCa4pXpDxfAevefORP9yJbp
   A==;
X-CSE-ConnectionGUID: wrluRPMVTiqNaCUXZnTEUw==
X-CSE-MsgGUID: aywpx5ZeQLacZ3CLnUfM5Q==
X-IPAS-Result: =?us-ascii?q?A0BIAgB+PV9q/43/Ja1aglmCV3ReQ0kDlkcDgROdCIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo1XAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxG+Oho3gXkzg?=
 =?us-ascii?q?QGDKAGBVNsuAQsUAQWBM4U/iCBcGAGEfCcbG4FygRWCc3aBBYFcAoglBIIie?=
 =?us-ascii?q?hKBWh6Eb4seSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BL?=
 =?us-ascii?q?oEChG4jHwM5f4EvdUp3LWkBEheBJoIUgToCTgMLGA1IESw3FBkEPm4HjVAjg?=
 =?us-ascii?q?iAZBwEwXQEKCRiBBRVqKByTG5I/oQ8KKIN1jCGVOhozqmwLmH2OCokPjUGEa?=
 =?us-ascii?q?YFoPIFZcBWDIglKGQ+OLQsLg2DOWicyAgkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:mJ6swqk849GJLPw77RnUwKXo5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbCmmGbv3bNzb2Ktx/OY6/9EIF7ZOEydBmTlY5pSkyFVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsfvb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZIC/vtNOURwy
 f0BDjkmUyCxgd6b/a3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMifBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYz/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKII4bbHJ0KxxbwS
 mTu9nXmGgFHBtGm7TOOwCmHounykwamYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmIHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:HrEvQ6+JfNMWG63a79Vuk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: 9a23:gu13yGxPPd3QMZhQnJV5BgULAMQ4SEX48kvROmmxIltZerupZGKPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AC3mokw2+F8odjIDmJUjm+oEQBjUj6rWxEFBQo5g?=
 =?us-ascii?q?/n8CPB3dbHzGgghHqe9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,176,1779148800"; 
   d="scan'208";a="512910718"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2026 09:39:42 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id F087D1800018F;
	Tue, 21 Jul 2026 09:39:41 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 9A922CAEF79; Tue, 21 Jul 2026 02:39:41 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [meta-OE][scarthgap][PATCH 2/4] jq: Fix CVE-2026-47770
Date: Tue, 21 Jul 2026 02:39:36 -0700
Message-Id: <20260721093938.3983571-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260721093938.3983571-1-dkelaiya@cisco.com>
References: <20260721093938.3983571-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 09:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128346

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix for CVE-2026-47770 as referenced
in [2], using the upstream commit identified in [1].

[1] https://github.com/jqlang/jq/commit/7122866869960b55cea3646bc91334ef55787831
[2] https://github.com/jqlang/jq/security/advisories/GHSA-3pgx-frr7-3jxp

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../jq/jq/CVE-2026-47770.patch                | 449 ++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   1 +
 2 files changed, 450 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
new file mode 100644
index 0000000000..7b6fc72a99
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
@@ -0,0 +1,449 @@
+From 0f31d6f32040ed421d8ccb694aaf767865972e88 Mon Sep 17 00:00:00 2001
+From: Yu-Fu Fu <yufu@yfu.tw>
+Date: Fri, 22 May 2026 04:07:16 -0700
+Subject: [PATCH 2/2] Guard deep structural equality and comparison recursion
+ (#3539)
+
+jv_equal and jv_cmp overflows the C stack on deeply nested
+input. Cap recursion at 10000 with -1 / INT_MIN sentinels;
+operators that compose user expressions surface this as
+"Equality check too deep" / "Comparison too deep".
+
+Fixes CVE-2026-47770.
+
+CVE: CVE-2026-47770
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/7122866869960b55cea3646bc91334ef55787831]
+
+Backport Changes:
+- Omitted the newer f_bsearch C helper.
+  jq 1.7.1 neither contains nor registers this helper.
+  Adding it would introduce unrelated newer functionality.
+- Omitted the newer jv_unique C helper.
+  jq 1.7.1 has no matching helper or declaration.
+  Adding the entire function was unnecessary for the target.
+- Preserved jv_array_indexes iterator ownership.
+  jq 1.7.1 frees belem after each comparison.
+  Passing a copy prevents a double-free on the normal path.
+- Preserved the jq 1.7.1 delpaths_sorted loop.
+  The target uses a while loop instead of the newer do-while form.
+  Only the equality sentinel handling was needed.
+- Kept existing empty-array handling in sort_items().
+  The newer empty-array block was context, not part of the fix.
+  Only too_deep initialization was required.
+
+(cherry picked from commit 7122866869960b55cea3646bc91334ef55787831)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/builtin.c | 30 +++++++++++++++--
+ src/jv.c      | 47 +++++++++++++++++++++------
+ src/jv_aux.c  | 90 +++++++++++++++++++++++++++++++++++++++++++--------
+ tests/jq.test | 22 +++++++++++++
+ 4 files changed, 163 insertions(+), 26 deletions(-)
+
+diff --git a/src/builtin.c b/src/builtin.c
+index 378be02..08a8a98 100644
+--- a/src/builtin.c
++++ b/src/builtin.c
+@@ -336,7 +336,15 @@ jv binop_minus(jv a, jv b) {
+     jv_array_foreach(a, i, x) {
+       int include = 1;
+       jv_array_foreach(b, j, y) {
+-        if (jv_equal(jv_copy(x), y)) {
++        int equal = jv_equal(jv_copy(x), y);
++        if (equal < 0) {
++          jv_free(out);
++          jv_free(x);
++          jv_free(a);
++          jv_free(b);
++          return jv_invalid_with_msg(jv_string("Equality check too deep"));
++        }
++        if (equal) {
+           include = 0;
+           break;
+         }
+@@ -431,11 +439,17 @@ jv binop_mod(jv a, jv b) {
+ #undef dtoi
+ 
+ jv binop_equal(jv a, jv b) {
+-  return jv_bool(jv_equal(a, b));
++  int r = jv_equal(a, b);
++  if (r < 0)
++    return jv_invalid_with_msg(jv_string("Equality check too deep"));
++  return jv_bool(r);
+ }
+ 
+ jv binop_notequal(jv a, jv b) {
+-  return jv_bool(!jv_equal(a, b));
++  int r = jv_equal(a, b);
++  if (r < 0)
++    return jv_invalid_with_msg(jv_string("Equality check too deep"));
++  return jv_bool(!r);
+ }
+ 
+ enum cmp_op {
+@@ -447,6 +461,8 @@ enum cmp_op {
+ 
+ static jv order_cmp(jv a, jv b, enum cmp_op op) {
+   int r = jv_cmp(a, b);
++  if (r == INT_MIN)
++    return jv_invalid_with_msg(jv_string("Comparison too deep"));
+   return jv_bool((op == CMP_OP_LESS && r < 0) ||
+                  (op == CMP_OP_LESSEQ && r <= 0) ||
+                  (op == CMP_OP_GREATEREQ && r >= 0) ||
+@@ -1065,6 +1081,14 @@ static jv minmax_by(jv values, jv keys, int is_min) {
+   for (int i=1; i<jv_array_length(jv_copy(values)); i++) {
+     jv item = jv_array_get(jv_copy(keys), i);
+     int cmp = jv_cmp(jv_copy(item), jv_copy(retkey));
++    if (cmp == INT_MIN) {
++      jv_free(item);
++      jv_free(values);
++      jv_free(keys);
++      jv_free(retkey);
++      jv_free(ret);
++      return jv_invalid_with_msg(jv_string("Comparison too deep"));
++    }
+     if ((cmp < 0) == (is_min == 1)) {
+       jv_free(retkey);
+       retkey = item;
+diff --git a/src/jv.c b/src/jv.c
+index a68b171..fe27168 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -891,16 +891,20 @@ static jv* jvp_array_write(jv* a, int i) {
+   }
+ }
+ 
+-static int jvp_array_equal(jv a, jv b) {
++static int jvp_equal(jv a, jv b, int depth);
++
++static int jvp_array_equal(jv a, jv b, int depth) {
+   if (jvp_array_length(a) != jvp_array_length(b))
+     return 0;
+   if (jvp_array_ptr(a) == jvp_array_ptr(b) &&
+       jvp_array_offset(a) == jvp_array_offset(b))
+     return 1;
+   for (int i=0; i<jvp_array_length(a); i++) {
+-    if (!jv_equal(jv_copy(*jvp_array_read(a, i)),
+-                  jv_copy(*jvp_array_read(b, i))))
+-      return 0;
++    int r = jvp_equal(jv_copy(*jvp_array_read(a, i)),
++                      jv_copy(*jvp_array_read(b, i)),
++                      depth);
++    if (r <= 0)
++      return r;
+   }
+   return 1;
+ }
+@@ -1050,7 +1054,15 @@ jv jv_array_indexes(jv a, jv b) {
+   jv_array_foreach(a, ai, aelem) {
+     jv_free(aelem);
+     jv_array_foreach(b, bi, belem) {
+-      if (!jv_equal(jv_array_get(jv_copy(a), ai + bi), jv_copy(belem)))
++      int equal = jv_equal(jv_array_get(jv_copy(a), ai + bi), jv_copy(belem));
++      if (equal < 0) {
++        jv_free(res);
++        jv_free(belem);
++        jv_free(a);
++        jv_free(b);
++        return jv_invalid_with_msg(jv_string("Equality check too deep"));
++      }
++      if (!equal)
+         idx = -1;
+       else if (bi == 0 && idx == -1)
+         idx = ai;
+@@ -1782,7 +1794,7 @@ static int jvp_object_length(jv object) {
+   return n;
+ }
+ 
+-static int jvp_object_equal(jv o1, jv o2) {
++static int jvp_object_equal(jv o1, jv o2, int depth) {
+   int len2 = jvp_object_length(o2);
+   int len1 = 0;
+   for (int i=0; i<jvp_object_size(o1); i++) {
+@@ -1791,7 +1803,8 @@ static int jvp_object_equal(jv o1, jv o2) {
+     jv* slot2 = jvp_object_read(o2, slot->string);
+     if (!slot2) return 0;
+     // FIXME: do less refcounting here
+-    if (!jv_equal(jv_copy(slot->value), jv_copy(*slot2))) return 0;
++    int r = jvp_equal(jv_copy(slot->value), jv_copy(*slot2), depth);
++    if (r <= 0) return r;
+     len1++;
+   }
+   return len1 == len2;
+@@ -2007,7 +2020,16 @@ int jv_get_refcnt(jv j) {
+  * Higher-level operations
+  */
+ 
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
+   if (jv_get_kind(a) != jv_get_kind(b)) {
+     r = 0;
+@@ -2023,13 +2045,13 @@ int jv_equal(jv a, jv b) {
+       r = jvp_number_equal(a, b);
+       break;
+     case JV_KIND_ARRAY:
+-      r = jvp_array_equal(a, b);
++      r = jvp_array_equal(a, b, depth + 1);
+       break;
+     case JV_KIND_STRING:
+       r = jvp_string_equal(a, b);
+       break;
+     case JV_KIND_OBJECT:
+-      r = jvp_object_equal(a, b);
++      r = jvp_object_equal(a, b, depth + 1);
+       break;
+     default:
+       r = 1;
+@@ -2041,6 +2063,11 @@ int jv_equal(jv a, jv b) {
+   return r;
+ }
+ 
++// Returns 1 if equal, 0 if not equal, or -1 if the comparison is too deep
++int jv_equal(jv a, jv b) {
++  return jvp_equal(a, b, 0);
++}
++
+ int jv_identical(jv a, jv b) {
+   int r;
+   if (a.kind_flags != b.kind_flags
+diff --git a/src/jv_aux.c b/src/jv_aux.c
+index 0855053..75497c5 100644
+--- a/src/jv_aux.c
++++ b/src/jv_aux.c
+@@ -15,6 +15,24 @@ static double jv_number_get_value_and_consume(jv number) {
+   return value;
+ }
+ 
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
+   jv start_jv = jv_object_get(jv_copy(slice), jv_string("start"));
+@@ -471,7 +489,7 @@ static jv delpaths_sorted(jv object, jv paths, int start) {
+     int delkey = jv_array_length(jv_array_get(jv_copy(paths), i)) == start + 1;
+     jv key = jv_array_get(jv_array_get(jv_copy(paths), i), start);
+     while (j < jv_array_length(jv_copy(paths)) &&
+-           jv_equal(jv_copy(key), jv_array_get(jv_array_get(jv_copy(paths), j), start)))
++           jv_equal(jv_copy(key), jv_array_get(jv_array_get(jv_copy(paths), j), start)) == 1)
+       j++;
+     // if i <= entry < j, then entry starts with key
+     if (delkey) {
+@@ -602,7 +620,13 @@ jv jv_keys(jv x) {
+   }
+ }
+ 
+-int jv_cmp(jv a, jv b) {
++static int jvp_cmp(jv a, jv b, int depth) {
++  if (depth > MAX_CMP_DEPTH) {
++    jv_free(a);
++    jv_free(b);
++    return INT_MIN;
++  }
++
+   if (jv_get_kind(a) != jv_get_kind(b)) {
+     int r = (int)jv_get_kind(a) - (int)jv_get_kind(b);
+     jv_free(a);
+@@ -617,14 +641,13 @@ int jv_cmp(jv a, jv b) {
+   case JV_KIND_FALSE:
+   case JV_KIND_TRUE:
+     // there's only one of each of these values
+-    r = 0;
+     break;
+ 
+   case JV_KIND_NUMBER: {
+     if (jvp_number_is_nan(a)) {
+-      r = jv_cmp(jv_null(), jv_copy(b));
++      r = jvp_cmp(jv_null(), jv_copy(b), depth);
+     } else if (jvp_number_is_nan(b)) {
+-      r = jv_cmp(jv_copy(a), jv_null());
++      r = jvp_cmp(jv_copy(a), jv_null(), depth);
+     } else {
+       r = jvp_number_cmp(a, b);
+     }
+@@ -648,7 +671,9 @@ int jv_cmp(jv a, jv b) {
+       }
+       jv xa = jv_array_get(jv_copy(a), i);
+       jv xb = jv_array_get(jv_copy(b), i);
+-      r = jv_cmp(xa, xb);
++      r = jvp_cmp(xa, xb, depth + 1);
++      if (r == INT_MIN)
++        break;
+       i++;
+     }
+     break;
+@@ -657,13 +682,14 @@ int jv_cmp(jv a, jv b) {
+   case JV_KIND_OBJECT: {
+     jv keys_a = jv_keys(jv_copy(a));
+     jv keys_b = jv_keys(jv_copy(b));
+-    r = jv_cmp(jv_copy(keys_a), keys_b);
++    r = jvp_cmp(jv_copy(keys_a), keys_b, depth + 1);
+     if (r == 0) {
+       jv_array_foreach(keys_a, i, key) {
+         jv xa = jv_object_get(jv_copy(a), jv_copy(key));
+         jv xb = jv_object_get(jv_copy(b), key);
+-        r = jv_cmp(xa, xb);
+-        if (r) break;
++        r = jvp_cmp(xa, xb, depth + 1);
++        if (r != 0)
++          break;
+       }
+     }
+     jv_free(keys_a);
+@@ -676,6 +702,11 @@ int jv_cmp(jv a, jv b) {
+   return r;
+ }
+ 
++// Returns <0, 0, >0 if a is less than, equal to, or greater than b, or
++// INT_MIN if the comparison is too deep
++int jv_cmp(jv a, jv b) {
++  return jvp_cmp(a, b, 0);
++}
+ 
+ struct sort_entry {
+   jv object;
+@@ -683,19 +714,32 @@ struct sort_entry {
+   int index;
+ };
+ 
++static void sort_entry_array_free(struct sort_entry* entries, int start, int n) {
++  for (int i = start; i < n; i++) {
++    jv_free(entries[i].key);
++    jv_free(entries[i].object);
++  }
++  jv_mem_free(entries);
++}
++
+ static int sort_cmp(const void* pa, const void* pb) {
+   const struct sort_entry* a = pa;
+   const struct sort_entry* b = pb;
+   int r = jv_cmp(jv_copy(a->key), jv_copy(b->key));
++  if (r == INT_MIN) {
++    sort_cmp_state.too_deep = 1;
++    return 0;
++  }
+   // comparing by index if r == 0 makes the sort stable
+   return r ? r : (a->index - b->index);
+ }
+ 
+-static struct sort_entry* sort_items(jv objects, jv keys) {
++static struct sort_entry* sort_items(jv objects, jv keys, int *too_deep) {
+   assert(jv_get_kind(objects) == JV_KIND_ARRAY);
+   assert(jv_get_kind(keys) == JV_KIND_ARRAY);
+   assert(jv_array_length(jv_copy(objects)) == jv_array_length(jv_copy(keys)));
+   int n = jv_array_length(jv_copy(objects));
++  *too_deep = 0;
+   struct sort_entry* entries = jv_mem_calloc(n, sizeof(struct sort_entry));
+   for (int i=0; i<n; i++) {
+     entries[i].object = jv_array_get(jv_copy(objects), i);
+@@ -704,7 +748,13 @@ static struct sort_entry* sort_items(jv objects, jv keys) {
+   }
+   jv_free(objects);
+   jv_free(keys);
++  sort_cmp_state.too_deep = 0;
+   qsort(entries, n, sizeof(struct sort_entry), sort_cmp);
++  if (sort_cmp_state.too_deep) {
++    sort_entry_array_free(entries, 0, n);
++    *too_deep = 1;
++    return NULL;
++  }
+   return entries;
+ }
+ 
+@@ -713,7 +763,10 @@ jv jv_sort(jv objects, jv keys) {
+   assert(jv_get_kind(keys) == JV_KIND_ARRAY);
+   assert(jv_array_length(jv_copy(objects)) == jv_array_length(jv_copy(keys)));
+   int n = jv_array_length(jv_copy(objects));
+-  struct sort_entry* entries = sort_items(objects, keys);
++  int too_deep = 0;
++  struct sort_entry* entries = sort_items(objects, keys, &too_deep);
++  if (too_deep)
++    return jv_invalid_with_msg(jv_string("Comparison too deep"));
+   jv ret = jv_array();
+   for (int i=0; i<n; i++) {
+     jv_free(entries[i].key);
+@@ -728,13 +781,24 @@ jv jv_group(jv objects, jv keys) {
+   assert(jv_get_kind(keys) == JV_KIND_ARRAY);
+   assert(jv_array_length(jv_copy(objects)) == jv_array_length(jv_copy(keys)));
+   int n = jv_array_length(jv_copy(objects));
+-  struct sort_entry* entries = sort_items(objects, keys);
++  int too_deep = 0;
++  struct sort_entry* entries = sort_items(objects, keys, &too_deep);
++  if (too_deep)
++    return jv_invalid_with_msg(jv_string("Comparison too deep"));
+   jv ret = jv_array();
+   if (n > 0) {
+     jv curr_key = entries[0].key;
+     jv group = jv_array_append(jv_array(), entries[0].object);
+     for (int i = 1; i < n; i++) {
+-      if (jv_equal(jv_copy(curr_key), jv_copy(entries[i].key))) {
++      int equal = jv_equal(jv_copy(curr_key), jv_copy(entries[i].key));
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
+diff --git a/tests/jq.test b/tests/jq.test
+index 6d1518d..018d2d0 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -2172,3 +2172,25 @@ null
+ try ((reduce range(10001) as $_ ({}; {a: .})) as $x | $x * $x) catch .
+ null
+ "Object merge too deep"
++
++# regression test for deep structural equality recursion
++try ((reduce range(10001) as $_ ([]; [.])) as $x | (reduce range(10001) as $_ ([]; [.])) as $y | $x == $y) catch .
++null
++"Equality check too deep"
++
++# regression tests for deep ordering comparisons
++try ((reduce range(10001) as $_ ([]; [.])) as $x | [$x, $x] | sort) catch .
++null
++"Comparison too deep"
++
++try ((reduce range(10001) as $_ ([]; [.])) as $x | [$x, $x] | unique) catch .
++null
++"Comparison too deep"
++
++try ((reduce range(10001) as $_ ({}; {a: .})) as $x | [$x, $x] | sort) catch .
++null
++"Comparison too deep"
++
++try ((reduce range(10001) as $_ ({}; {a: .})) as $x | [$x, $x] | unique) catch .
++null
++"Comparison too deep"
+-- 
+2.44.4
+
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index 2f08f583cc..f13548ddd3 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://CVE-2026-43894.patch \
     file://CVE-2026-43896.patch \
     file://CVE-2026-43895.patch \
+    file://CVE-2026-47770.patch \
     "
 SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 
-- 
2.35.6


