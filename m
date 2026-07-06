Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3807C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 15:20:50 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152657.1783351247339948657
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 08:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OPbKvnyn;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5299; q=dns/txt;
  s=iport01; t=1783351247; x=1784560847;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f3IJ5P4pplTvk+TcBZaissHlwTn84WkGbdL+943v9tw=;
  b=OPbKvnynUq6f1cxr5s0t3xydjD3MKq0cbNf7aoWcCKB8qAjh1aA6L+JM
   6QRjddv4rD5CEut5p2GfNU8BKpqgDyVn7yAI/kcErKQzK1Lfxm+2pDXEu
   eH5sUESWHuonUzfrfg5sMepqHkqzm7q4ZllVZfVrh0RmMRbHKjxt7K8mZ
   GkT1dxMqe/jgu+PZL6lfI5GMNrNX8JirfPRSLQ1z+zGKcs+8QuW78BKKX
   rWAEV01GNBkbFrb6+iFg11jYjre+b/rF0FBAEyKpXEvJdqYuoUuQov6YA
   RaD9UKKUsZkM6gYoEvgos7fr0IrCZju5xJFYDwEw3Btxk6uAitZTdqSYl
   A==;
X-CSE-ConnectionGUID: L3iDz5SZR4GxTPeIWWHKFw==
X-CSE-MsgGUID: a86rYdAKREqL73UPU0p6Xg==
X-IPAS-Result: =?us-ascii?q?A0BXAADCxktq/4z/Ja1aHQEBAQEJARIBBQUBgX4GAQsBg?=
 =?us-ascii?q?lZ0X0JJA5ZIgRadCIF+DwEBAQ9EDQQBAYUGjU8CJjYHDgECBAMCAwEBAQEBA?=
 =?us-ascii?q?QEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECATUBGAEbEiwDAQJaIyGDAgGCc?=
 =?us-ascii?q?wIBEQa5RIIsgQGDKAE/AkNQ2ywBCxQBBYEzAYU+iB9bGAGEegInGxuBcoEVg?=
 =?us-ascii?q?nN2gQV3ZQICGIEehm0EgiKBDIFaHo8nSIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EMGwcFgR2Ba4EChHkjHwM5f4EwdUp5LYECARIeCoFSgSkDCxgNS?=
 =?us-ascii?q?BEsNxQbBD5uB4x7Fw+CPQGBDQErgiyTOAeSN6EPCiiDdYwhlToaM4VbpRELm?=
 =?us-ascii?q?H2LN4JTiQ+NQYRogW8FMIFZcBWDIglKGQ+OLQsLg2CFE8lHJDUCAQEHAy8BA?=
 =?us-ascii?q?QcCBw4DC4FokAGBfAEB?=
IronPort-Data: A9a23:llRqiquMLMRvUvBtNlykCO7GFufnVAZfMUV32f8akzHdYApBsoF/q
 tZmKT3VPvaPYmqjKdhzb4zg8kNUu8OGnNc3SFZoriwwFngRgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3b9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw3r12LXMTz
 s4idB8dUiiOpt2J4JGVVbw57igjBJGD0II3oHpsy3TdSP0hW52GG/6M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtPYH49tL/Aan3XaCVFs1KNpqMf6GnIxws327/oWDbQUoHSGJUMzh/I/
 goq+UzwUk8ABdC26gCo61bz3dL3oHvjBrIdQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZM5ottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:ML7fX65xqewAOVKfjwPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBEDjexPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:dJXLtWw6SIagTli0zur5BgUwQcEJYCDm/k2MDF+EMWtId4K1anGPrfY=
X-Talos-MUID: 9a23:EDYgbATtMghfTYNeRXTl1G94BctBwJ6DEWRSyqg+hpGcaxx/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,149,1779148800"; 
   d="scan'208";a="505818180"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Jul 2026 15:20:46 +0000
Received: from sjc-ads-8093.cisco.com (sjc-ads-8093.cisco.com [171.68.208.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 43CEA180001F3;
	Mon,  6 Jul 2026 15:20:46 +0000 (GMT)
Received: by sjc-ads-8093.cisco.com (Postfix, from userid 1839047)
	id DE6DACBEF99; Mon,  6 Jul 2026 08:20:45 -0700 (PDT)
From: "Shubham Pushpkar -X (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)" <spushpka@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Shubham Pushpkar <spushpka@cisco.com>
Subject: [meta-OE] [wrynose] [PATCH 1/6] jq: Fix CVE-2026-40612
Date: Mon,  6 Jul 2026 08:20:15 -0700
Message-ID: <20260706152022.873284-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8093.cisco.com [171.68.208.131];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.208.131, sjc-ads-8093.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 15:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128045

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
 .../jq/jq/CVE-2026-40612.patch                | 127 ++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patch
new file mode 100644
index 0000000000..f7cae01e21
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patch
@@ -0,0 +1,127 @@
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
+- Dropped the duplicate tests/jq.test hunk because Wrynose already carries
+  the same regression coverage in existing CVE-2026-47770.patch.
+
+(cherry picked from commit d1a12569d91641135976a8536776a4a329c02cc2)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ src/builtin.c |  5 ++++-
+ src/jv.c      | 40 +++++++++++++++++++++++++++-------------
+ 2 files changed, 32 insertions(+), 13 deletions(-)
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
+--
+2.44.4
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index 7665ba2511..9f0fcf8cb5 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${
            file://CVE-2026-33948.patch \
            file://CVE-2026-39979.patch \
            file://CVE-2026-47770.patch \
+           file://CVE-2026-40612.patch \
            "
 
 inherit autotools ptest
-- 
2.44.1


