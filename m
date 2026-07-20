Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EBEC4452D
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:59:49 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3711.1784570388797419872
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Fpj/dAHQ;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4201; q=dns/txt;
  s=iport01; t=1784570389; x=1785779989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AwoVMrYVh2rBXaIpCyvDCgHaPuM6NwSuNZs++kDm6cQ=;
  b=Fpj/dAHQOJu4LUUvYqWOn5OMzV39FiXNDszvkxFy63ar+QjpnlNOYqcN
   XB2ooKEQsrJV949/t5QLTV5LIyezMvy1jT5rUc2I2QAI1CorDn+p78Iam
   HQRFAaDYv9eVVu14d2DEahIk8s8lTTvk5+uxOZJk6fRtwoXalZfPf6fmq
   GcvXF3p7aBlQfNeABBEDVV3gO8c+VGrsTiyz05xEsj9+dWaqxzV5BKzDz
   mYxYPbxu1FBejJkc+z5hw8gVi3pmsD553GbWFBcBXyKCsx7I7QdNYT2va
   hKSRf/2o1xL02u/xblrrFouBQlB/XLRA6VGBE+WxZAoR9IyZZRRX4nJzJ
   Q==;
X-CSE-ConnectionGUID: 1KaBMv0hTvaAmQIOh5KE9A==
X-CSE-MsgGUID: MBm4QakRTqO1iRY/XY7HMA==
X-IPAS-Result: =?us-ascii?q?A0BLAgCzYF5q/5L/Ja1aglmCV3ReQ0kDhFSRdoETnQiBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKNUwImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBAyMPARgBLRAcAwECAwImAgIrIwgQCYMCAYJ0AxG7f?=
 =?us-ascii?q?HqBMoEBgygBgVTbLgELFAEFgQUuhT+DHQGFAlwYAYR8JxsbgXKBFYJzdoEFg?=
 =?us-ascii?q?VwChTuCagSCIoEMgVoej3RIgQIcA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?zRYGwcFgR2BOoEChHQjHwM5f4EvdUp3LWkBEheBJoISAoE7Ag4DCxgNSBEsN?=
 =?us-ascii?q?xQZBD0BbgeNQCOCQIEOASsXghWldqEPCiiDdYwhlToaM4VbpRELmH2LN4JTl?=
 =?us-ascii?q?lCEaYFoPIFZcBWDIglKGQ+OOINrzlonMgIJAy8BAQcCBwEMAQMLgWiRfgEB?=
IronPort-Data: A9a23:PcOxVqgICnJoG2Ms9BLfQ0isX161MBEKZh0ujC45NGQN5FlHY01je
 htvWzjVOfyOM2CgL9wjPdjnp08BsMOGzoRlSwY6qS80QytjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPjb8E0HUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVB2e9dJH8W9
 cAGIRkIVzGkh7+V7eOSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgl/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9J4XQH54NxRbBz
 o7A10HTB00jPd+l9SOiq3OWt6j/rHzbfatHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YQLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:x4+/va2CU1OhWyzyl+eiLAqjBGwkLtp133Aq2lEZdPWaSKOlfq
 eV7ZImPH7P+VEssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCZgguVxehZhOOIqQEIWReOk9K1vp
 0PT0ERMrHN5HFB/L/HCXGDYrUd6ejC1ry0juHDyHooZwRrZ6Z8qzpdMG+gYzVLrM0sP+tCKH
 JajfA33AadRQ==
X-Talos-CUID: 9a23:MOTLcWCG4esV0gf6E3BE/WQxBJglTmPU5XLpAmi4VEVEGZTAHA==
X-Talos-MUID: 9a23:4QXFvgUVmeK7H2rq/BrGgW1bPcRS372JUUE3oNI2ipakEAUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,175,1779148800"; 
   d="scan'208";a="512230381"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 17:59:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id ED1B318000204;
	Mon, 20 Jul 2026 17:59:47 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 9678DCAEF79; Mon, 20 Jul 2026 10:59:47 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [meta-OE][wrynose][PATCH 3/3] jq: Fix CVE-2026-54679
Date: Mon, 20 Jul 2026 10:59:41 -0700
Message-Id: <20260720175941.2521378-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720175941.2521378-1-dkelaiya@cisco.com>
References: <20260720175941.2521378-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 17:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128286

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix for CVE-2026-54679 as referenced
in [2], using the upstream commit identified in [1].

[1] https://github.com/jqlang/jq/commit/46d1da30944ce93dd671ac72b6513fc0eb747837
[2] https://github.com/jqlang/jq/security/advisories/GHSA-29gj-222p-j7vx

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../jq/jq/CVE-2026-54679.patch                | 77 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-54679.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-54679.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-54679.patch
new file mode 100644
index 0000000000..b4bcff8c75
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-54679.patch
@@ -0,0 +1,77 @@
+From 3750f018d4ecdcccdd11edc4830efb7adc511123 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Tue, 16 Jun 2026 14:31:14 +0900
+Subject: [PATCH 3/3] Tighten string length bounds and propagate invalid jv in
+ implode
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The bound added in CVE-2026-32316 (e47e56d22) still allowed
+`sizeof(jvp_string) + (currlen + len) * 2 + 1` to wrap `size_t` on
+32-bit platforms. Tighten the threshold so the final allocation
+fits in 32-bit `size_t`.
+
+Also break out of `jv_string_implode` and `f_string_implode` once
+`jv_string_append_codepoint` returns an invalid `jv`; otherwise the
+next iteration triggers the assertion in `jvp_string_ptr` (or
+invokes undefined behavior under `-DNDEBUG`).
+
+Fixes CVE-2026-54679.
+
+CVE: CVE-2026-54679
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/46d1da30944ce93dd671ac72b6513fc0eb747837]
+
+Co-authored-by: Dirk Müller <dirk@dmllr.de>
+(cherry picked from commit 46d1da30944ce93dd671ac72b6513fc0eb747837)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/builtin.c | 1 +
+ src/jv.c      | 5 +++--
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/builtin.c b/src/builtin.c
+index 0463fca..eb91ac7 100644
+--- a/src/builtin.c
++++ b/src/builtin.c
+@@ -1396,6 +1396,7 @@ static jv f_string_implode(jq_state *jq, jv a) {
+     if (nv < 0 || nv > 0x10FFFF || (nv >= 0xD800 && nv <= 0xDFFF))
+       nv = 0xFFFD; // U+FFFD REPLACEMENT CHARACTER
+     s = jv_string_append_codepoint(s, nv);
++    if (!jv_is_valid(s)) break;
+   }
+ 
+   jv_free(a);
+diff --git a/src/jv.c b/src/jv.c
+index 4f48f04..76c70c2 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1194,7 +1194,7 @@ static uint32_t jvp_string_remaining_space(jvp_string* s) {
+ static jv jvp_string_append(jv string, const char* data, uint32_t len) {
+   jvp_string* s = jvp_string_ptr(string);
+   uint32_t currlen = jvp_string_length(s);
+-  if ((uint64_t)currlen + len >= INT_MAX) {
++  if ((uint64_t)currlen + len >= INT_MAX - sizeof(jvp_string) / 2) {
+     jv_free(string);
+     return jv_invalid_with_msg(jv_string("String too long"));
+   }
+@@ -1369,7 +1369,7 @@ jv jv_string_repeat(jv j, int n) {
+   }
+   int len = jv_string_length_bytes(jv_copy(j));
+   int64_t res_len = (int64_t)len * n;
+-  if (res_len >= INT_MAX) {
++  if ((uint64_t)res_len >= INT_MAX - sizeof(jvp_string) / 2) {
+     jv_free(j);
+     return jv_invalid_with_msg(jv_string("Repeat string result too long"));
+   }
+@@ -1454,6 +1454,7 @@ jv jv_string_implode(jv j) {
+     if (nv < 0 || nv > 0x10FFFF || (nv >= 0xD800 && nv <= 0xDFFF))
+       nv = 0xFFFD; // U+FFFD REPLACEMENT CHARACTER
+     s = jv_string_append_codepoint(s, nv);
++    if (!jv_is_valid(s)) break;
+   }
+ 
+   jv_free(j);
+-- 
+2.53.0
+
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index 4bf8292ac0..b213e21c57 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${
            file://CVE-2026-44777.patch \
            file://CVE-2026-43895.patch \
            file://CVE-2026-49839.patch \
+           file://CVE-2026-54679.patch \
            "
 
 inherit autotools ptest
-- 
2.35.6


