Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99686CD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 07:53:06 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15155.1781077983946404955
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2026 00:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hlK/o1bB;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6162; q=dns/txt;
  s=iport01; t=1781077984; x=1782287584;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j3EV18/DiQaQ1N9NilvCePKZcJk67EJ2kTsrcogPJCM=;
  b=hlK/o1bBq1IvgOD7HFbPeL/8ABlrhj6F/gHTMvgzGHE8/WG3PKSu2+V1
   EiWMTXahx9a44A+FTuveVQRuAIdyiF3CNkzZa/uZbrkZecKSGffqk+4Ax
   gK0o1VKiK9xTFgy7bOXWk07wy4Zq8Am3v8veyV7QB1rJ8kSlpOLoNLY7s
   r1m32pQWFeh7plP4tuhdC1swYTdt4Y8X5X6tANoRWygmiLWigZZyxIgvN
   bfM0NdIUa/XdJmNWI980cAfu8W01c2BZ5lutTvLJDShKuHjUGncIJdpQA
   /a0gzw55+Uxb1GZXp8OkB0hGaljssyxHWCtFZ4KwNNsAkHyt+q9yuhYEx
   A==;
X-CSE-ConnectionGUID: vxMNokKSTaO3wx0JOCd+RQ==
X-CSE-MsgGUID: yHp0qMfFRDmGoxLc2KqR3g==
X-IPAS-Result: =?us-ascii?q?A0BFAgDbFilq/4v/Ja1aHgEBCxIMggULgld0X0JJA5ZIg?=
 =?us-ascii?q?RadCIF+DwEBAQ9EDQQBAYUGjTwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECATUBGAEtLAMBAlojIYMCAYJzAgERBrF+GjeCL?=
 =?us-ascii?q?IEBgygBPwJDUNsrAQsUAQWBM4U/iB5bGAGEegInGxuBcoEVgnJ2gQV3ZQICG?=
 =?us-ascii?q?IEehm0EgiJ6EoFdHoViiRJIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QwbBwWBSoE3aIEChRAjHwM5gRWBeoEoZ2kVMDVsAwsYDUgRLDcUGwQ+bgeMO?=
 =?us-ascii?q?hcPgjgBehMBCiGCLJM4B5I3oQ8KKIN0jCGVOhozqmsLmHyOCokPjUCEaIFoP?=
 =?us-ascii?q?IFZcBWDIglKGQ+OLQsLg2CFE8M2JDUCAQEHAy8BAQcCBw4DC4FokAGBfAEB?=
IronPort-Data: A9a23:mWI8oaIE934a4D2rFE+RgZQlxSXFcZb7ZxGr2PjKsXjdYENShDdTy
 TZNXjjXbv+DZWT9eNwiPIuy8kxQucWAzNE2GgQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnR0
 T/Oi5eHYgH9hWcsajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1wHGQQOo47wdp+JjpR5
 aQ6DxsBLSq60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBV7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2N0Wojx5nYj/7DLolhPqzhmH8ehVTqUmeouw85G27IAlZjOm3YIqKI4HWLSlTtle4v
 jrf2mrXOD0fG9uP7THf0WuW3eCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:1V3Vwq713x3Kuj3lzQPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:hDTleWwr4JhF7KHFNwigBgUKCuUDdX7+90vZBBSnGT5Lb5aZCmWprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AQ4Oj2g0DKFi5WDMh4jqfiwcbwDUj8oS2UFkon7s?=
 =?us-ascii?q?8l8yrMjxUMG2+lQ7sTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,197,1774310400"; 
   d="scan'208";a="492887154"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jun 2026 07:53:02 +0000
Received: from sjc-ads-10443.cisco.com (sjc-ads-10443.cisco.com [171.70.96.196])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id BD474180007F0;
	Wed, 10 Jun 2026 07:53:02 +0000 (GMT)
Received: by sjc-ads-10443.cisco.com (Postfix, from userid 1839047)
	id 5FF22CC1282; Wed, 10 Jun 2026 00:53:02 -0700 (PDT)
From: "Shubham Pushpkar -X (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)" <spushpka@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Shubham Pushpkar <spushpka@cisco.com>
Subject: [meta-OE] [scarthgap] [PATCH 1/5] jq: Fix CVE-2026-40612
Date: Wed, 10 Jun 2026 00:52:49 -0700
Message-Id: <20260610075253.1676404-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10443.cisco.com [171.70.96.196];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.96.196, sjc-ads-10443.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 07:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127509

From: Shubham Pushpkar <spushpka@cisco.com>

The upstream fix [3] is for a newer jq codebase. Debian has already
backported this fix in jq 1.8.1-6. Use the Debian patch [1], which fixes
this CVE as tracked in Debian bug #1136445 [2].

[1] https://sources.debian.org/src/jq/1.8.1-7/debian/patches/CVE-2026-40612.patch
[2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1136445
[3] https://github.com/jqlang/jq/commit/d1a12569d91641135976a8536776a4a329c02cc2

Reference:
https://github.com/jqlang/jq/security/advisories/GHSA-r7m6-x9c7-h69j

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 .../jq/jq/CVE-2026-40612.patch                | 153 ++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   1 +
 2 files changed, 154 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patch
new file mode 100644
index 0000000000..bcd9f2dbc0
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patch
@@ -0,0 +1,153 @@
+From f1a72c7b5eb9c9e99576b2ca8e59ab1f36a2a4e3 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Fri, 24 Apr 2026 22:02:24 +0900
+Subject: [PATCH] Limit the containment check depth
+
+This fixes CVE-2026-40612.
+
+CVE: CVE-2026-40612
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/d1a12569d91641135976a8536776a4a329c02cc2]
+
+Backport Changes:
+- The upstream regression test used `reduce ... as $x` without wrapping
+  the `reduce` expression in parentheses. jq 1.7.1 parses that form as a
+  syntax error before the test can run.
+- Wrapped the `reduce range(10001) ...` expression in an extra set of
+  parentheses so jq 1.7.1 first builds the nested array, then binds that
+  result to `$x` for the `contains($x)` depth-limit check.
+
+(cherry picked from commit d1a12569d91641135976a8536776a4a329c02cc2)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ src/builtin.c |  5 ++++-
+ src/jv.c      | 40 +++++++++++++++++++++++++++-------------
+ tests/jq.test | 11 ++++++++++-
+ 3 files changed, 41 insertions(+), 15 deletions(-)
+
+diff --git a/src/builtin.c b/src/builtin.c
+index 902490d..378be02 100644
+--- a/src/builtin.c
++++ b/src/builtin.c
+@@ -471,7 +471,10 @@ jv binop_greatereq(jv a, jv b) {
+ 
+ static jv f_contains(jq_state *jq, jv a, jv b) {
+   if (jv_get_kind(a) == jv_get_kind(b)) {
+-    return jv_bool(jv_contains(a, b));
++    int r = jv_contains(a, b);
++    if (r < 0)
++      return jv_invalid_with_msg(jv_string("Containment check too deep"));
++    return jv_bool(r);
+   } else {
+     return type_error2(a, b, "cannot have their containment checked");
+   }
+diff --git a/src/jv.c b/src/jv.c
+index 08ded35..5a2c3a2 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -914,19 +914,19 @@ static void jvp_clamp_slice_params(int len, int *pstart, int *pend)
+ }
+ 
+ 
+-static int jvp_array_contains(jv a, jv b) {
++static int jvp_contains(jv a, jv b, int depth);
++
++static int jvp_array_contains(jv a, jv b, int depth) {
+   int r = 1;
+   jv_array_foreach(b, bi, belem) {
+     int ri = 0;
+     jv_array_foreach(a, ai, aelem) {
+-      if (jv_contains(aelem, jv_copy(belem))) {
+-        ri = 1;
+-        break;
+-      }
++      ri = jvp_contains(aelem, jv_copy(belem), depth);
++      if (ri) break;
+     }
+     jv_free(belem);
+-    if (!ri) {
+-      r = 0;
++    if (ri <= 0) {
++      r = ri;
+       break;
+     }
+   }
+@@ -1794,7 +1794,7 @@ static int jvp_object_equal(jv o1, jv o2) {
+   return len1 == len2;
+ }
+ 
+-static int jvp_object_contains(jv a, jv b) {
++static int jvp_object_contains(jv a, jv b, int depth) {
+   assert(JVP_HAS_KIND(a, JV_KIND_OBJECT));
+   assert(JVP_HAS_KIND(b, JV_KIND_OBJECT));
+   int r = 1;
+@@ -1802,9 +1802,9 @@ static int jvp_object_contains(jv a, jv b) {
+   jv_object_foreach(b, key, b_val) {
+     jv a_val = jv_object_get(jv_copy(a), key);
+ 
+-    r = jv_contains(a_val, b_val);
++    r = jvp_contains(a_val, b_val, depth);
+ 
+-    if (!r) break;
++    if (r <= 0) break;
+   }
+   return r;
+ }
+@@ -2035,14 +2035,23 @@ int jv_identical(jv a, jv b) {
+   return r;
+ }
+ 
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
+   int r = 1;
+   if (jv_get_kind(a) != jv_get_kind(b)) {
+     r = 0;
+   } else if (JVP_HAS_KIND(a, JV_KIND_OBJECT)) {
+-    r = jvp_object_contains(a, b);
++    r = jvp_object_contains(a, b, depth + 1);
+   } else if (JVP_HAS_KIND(a, JV_KIND_ARRAY)) {
+-    r = jvp_array_contains(a, b);
++    r = jvp_array_contains(a, b, depth + 1);
+   } else if (JVP_HAS_KIND(a, JV_KIND_STRING)) {
+     int b_len = jv_string_length_bytes(jv_copy(b));
+     if (b_len != 0) {
+@@ -2058,3 +2067,8 @@ int jv_contains(jv a, jv b) {
+   jv_free(b);
+   return r;
+ }
++
++// Returns 1 (contained), 0 (not contained), or -1 (too deep)
++int jv_contains(jv a, jv b) {
++  return jvp_contains(a, b, 0);
++}
+diff --git a/tests/jq.test b/tests/jq.test
+index 4d57301..40d14d6 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -2153,4 +2153,13 @@ null
+ 
+ try delpaths([[range(10001) | 0]]) catch .
+ null
+-"Path too deep"
+\ No newline at end of file
++"Path too deep"
++
++# regression test for CVE-2026-40612
++reduce range(10000) as $_ ([]; [.]) | contains([[]])
++null
++true
++
++try ((reduce range(10001) as $_ ([]; [.])) as $x | $x | contains($x)) catch .
++null
++"Containment check too deep"
+-- 
+2.44.4
+
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index 98f06af3b9..b35e5579b2 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://CVE-2026-33947.patch \
     file://CVE-2026-33948.patch \
     file://CVE-2026-39979.patch \
+    file://CVE-2026-40612.patch \
     "
 SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 
-- 
2.35.6


