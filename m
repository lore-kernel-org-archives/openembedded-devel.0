Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB38CD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 07:53:36 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14955.1781078012974119322
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2026 00:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=M15YHwl9;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4779; q=dns/txt;
  s=iport01; t=1781078013; x=1782287613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tlfYYyxVuu2wMAHYu+ccQeAo6pRB0Sr6GwZJGtZW06k=;
  b=M15YHwl9neru4dVzFAloqcpfPO8jmxiFezuS1aFgTK9dO+3RtBwRkesB
   uVcrJeWOQV6LFA6jb51b5bDyUmyr1H8Wiqz1K7lzEFT7zEoKeQmdiTICc
   7Dd36nz+jtxWHyy1f5Z1GXYxX2HBJMdbklxVvylYoc+tzmhrsdSU6yRBW
   FOioSYkXEyDqTt2ECOiLJAf37VenrTFb3N1NkoGl5xnD0yg3kUE4+Vfat
   D24rG8w5/H8OngWV54l9UUYgifc7+aki5kbMdCaQ002nY/cjnbuAEXi/w
   UXwgOMRhtlJqF4Zb9P99LwNzIm8yUWxv7b934qeP9K/1DOKCMBpAr6za1
   g==;
X-CSE-ConnectionGUID: QALtXqYwRdaTtAPX0WWyOQ==
X-CSE-MsgGUID: HH0rmxquQSm6HBEu5ZPkXg==
X-IPAS-Result: =?us-ascii?q?A0BHAgBiFylq/4z/Ja1aHgEBCxIMggULgld0X0JJA5ZIA?=
 =?us-ascii?q?54bgX4PAQEBD0QNBAEBhQYCjToCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECAQMyARgBLRAcAwECLysjCBmDAgGCcwIBEQayA?=
 =?us-ascii?q?ho3giyBAYMoAT8CQ1DbKwELFAEFgTOFP4geWxgBhHoCJxsbgXKBFYE7gi2BB?=
 =?us-ascii?q?XdlAgIYgR6GbQSCInoSgV0ehWKJEkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDBsHBYFKgTdogQKFECMfAzmBFYF6gShnaRUwNWwDCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB4w6Fw+COAF6EwEKIYFDaaV2oQ8KKIN0jCGVOhozqmsLmHyOCokPjUCEa?=
 =?us-ascii?q?IFoPIFZcBWDIglKGQ+OOINrhRPDNiQ1AgEBBwMvAQEHAgcOAwuBaJABgXwBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:EHo+yqn1Eaulj9CcvYWgfnbo5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXCGyDOfiPYGrwfo0laI6/pk5QvJeAyNEwTVZp/H1nEltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZG31GONgWYubDpKsvrb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbQx3vpHGFBRz
 /ARFCwkViDbuN2n54vuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYj/7C7pm9AusrmLnbiZYsFGcjaE2+GPUigd21dABNfKJK4bWH5wNxhfwS
 mTu30ShGBQKLcGm8j/b0liBm7L9pSDLV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmUHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:wlnMtqrmZ8URnSGsF+KtH2kaV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: 9a23:b01tGG0Fq3/4RmBf4KBn17xfI+kBbk3E/WjqL0aEFU9ReOWqdk63wfYx
X-Talos-MUID: 9a23:9vc7QwiZxlvuYN9rxJ0SucMpFOcw+aG+EV00qpBYm+OpKHFCAzStg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,197,1774310400"; 
   d="scan'208";a="492421009"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jun 2026 07:53:32 +0000
Received: from sjc-ads-10443.cisco.com (sjc-ads-10443.cisco.com [171.70.96.196])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id E770F180005A2;
	Wed, 10 Jun 2026 07:53:31 +0000 (GMT)
Received: by sjc-ads-10443.cisco.com (Postfix, from userid 1839047)
	id 94EBBCC1282; Wed, 10 Jun 2026 00:53:31 -0700 (PDT)
From: "Shubham Pushpkar -X (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)" <spushpka@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Shubham Pushpkar <spushpka@cisco.com>
Subject: [meta-OE] [scarthgap] [PATCH 5/5] jq: Fix CVE-2026-43896
Date: Wed, 10 Jun 2026 00:52:53 -0700
Message-Id: <20260610075253.1676404-5-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260610075253.1676404-1-spushpka@cisco.com>
References: <20260610075253.1676404-1-spushpka@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10443.cisco.com [171.70.96.196];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.96.196, sjc-ads-10443.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 07:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127513

From: Shubham Pushpkar <spushpka@cisco.com>

The upstream fix [3] is for a newer jq codebase. Debian has already
backported this fix in jq 1.8.1-7. Use the Debian patch [1], which fixes
this CVE as tracked in Debian bug #1136445 [2].

[1] https://sources.debian.org/src/jq/1.8.1-7/debian/patches/CVE-2026-43896.patch
[2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1136445
[3] https://github.com/jqlang/jq/commit/532ccea6080ed6758f39fe9f6208a44b665023d2

Reference:
https://github.com/jqlang/jq/security/advisories/GHSA-mg96-6h3q-g846

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 .../jq/jq/CVE-2026-43896.patch                | 97 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patch
new file mode 100644
index 0000000000..e9e6529372
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patch
@@ -0,0 +1,97 @@
+From 532ccea6080ed6758f39fe9f6208a44b665023d2 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Tue, 5 May 2026 22:44:02 +0900
+Subject: [PATCH] Limit recursive object merge depth to prevent stack overflow
+
+This fixes CVE-2026-43896.
+
+CVE: CVE-2026-43896
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/532ccea6080ed6758f39fe9f6208a44b665023d2]
+
+Backport Changes:
+- Adapted the tests/jq.test hunk context to apply after the existing
+  jq 1.7.1 CVE regression tests in the scarthgap patch stack.
+- The upstream regression test used `reduce ... as $x` without wrapping
+  the `reduce` expression in parentheses. jq 1.7.1 parses that form as a
+  syntax error before the test can run.
+- Wrapped the `reduce range(...) ...` expression in an extra set of
+  parentheses so jq 1.7.1 first builds the nested object, then binds that
+  result to `$x` for the object merge depth-limit check.
+
+(cherry picked from commit 532ccea6080ed6758f39fe9f6208a44b665023d2)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ src/jv.c      | 25 +++++++++++++++++++++++--
+ tests/jq.test |  9 +++++++++
+ 2 files changed, 32 insertions(+), 2 deletions(-)
+
+diff --git a/src/jv.c b/src/jv.c
+index 34573b8..b112757 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1884,16 +1884,33 @@ jv jv_object_merge(jv a, jv b) {
+   return a;
+ }
+
+-jv jv_object_merge_recursive(jv a, jv b) {
++#ifndef MAX_OBJECT_MERGE_DEPTH
++#define MAX_OBJECT_MERGE_DEPTH (10000)
++#endif
++
++static jv jvp_object_merge_recursive(jv a, jv b, int depth) {
+   assert(JVP_HAS_KIND(a, JV_KIND_OBJECT));
+   assert(JVP_HAS_KIND(b, JV_KIND_OBJECT));
+
++  if (depth > MAX_OBJECT_MERGE_DEPTH) {
++    jv_free(a);
++    jv_free(b);
++    return jv_invalid_with_msg(jv_string("Object merge too deep"));
++  }
++
+   jv_object_foreach(b, k, v) {
+     jv elem = jv_object_get(jv_copy(a), jv_copy(k));
+     if (jv_is_valid(elem) &&
+         JVP_HAS_KIND(elem, JV_KIND_OBJECT) &&
+         JVP_HAS_KIND(v, JV_KIND_OBJECT)) {
+-      a = jv_object_set(a, k, jv_object_merge_recursive(elem, v));
++      jv merged = jvp_object_merge_recursive(elem, v, depth + 1);
++      if (!jv_is_valid(merged)) {
++        jv_free(k);
++        jv_free(a);
++        jv_free(b);
++        return merged;
++      }
++      a = jv_object_set(a, k, merged);
+     } else {
+       jv_free(elem);
+       a = jv_object_set(a, k, v);
+@@ -1904,6 +1921,10 @@ jv jv_object_merge_recursive(jv a, jv b) {
+   return a;
+ }
+
++jv jv_object_merge_recursive(jv a, jv b) {
++  return jvp_object_merge_recursive(a, b, 0);
++}
++
+ /*
+  * Object iteration (internal helpers)
+  */
+diff --git a/tests/jq.test b/tests/jq.test
+index 86bfc56..a258c11 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -2633,3 +2633,12 @@ true
+ try ((reduce range(10001) as $_ ([]; [.])) as $x | $x | contains($x)) catch .
+ null
+ "Containment check too deep"
++
++# regression test for CVE-2026-43896
++(reduce range(10000) as $_ ({}; {a: .})) as $x | $x * $x | length
++null
++1
++
++try ((reduce range(10001) as $_ ({}; {a: .})) as $x | $x * $x) catch .
++null
++"Object merge too deep"
+--
+2.44.4
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index 54fa9f096d..2fc47ef92c 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://CVE-2026-41256.patch \
     file://CVE-2026-41257.patch \
     file://CVE-2026-43894.patch \
+    file://CVE-2026-43896.patch \
     "
 SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 
-- 
2.35.6


