Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EBDC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 15:21:20 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152673.1783351274179291127
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 08:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PsYEc8Vz;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3796; q=dns/txt;
  s=iport01; t=1783351274; x=1784560874;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BKxtySLc3Jh//rG2U3HJNO6USuM+2W9fC37G/QE2EKg=;
  b=PsYEc8Vz/h7Xg0l0QMRoaIiwQJkfC7VL5HTOwn6dtrPwG5MPkocfoilY
   TYJpch7uwIM0QrpnO8enki+akAHNcpBkB7wYFNqGC6jebM7TjjCp31344
   L1m65Me1Xa0s7qkb583AymU3feHpMm+eof0WaaCBjBbE51PlUUlP2ky5f
   KKlRii2+hD5wYggMvGdnZnRAkRmgVTHlLnw659ksD91kx94rTBCTx1uj0
   1p4OG6ve8APH0pXxDgMBUdgLzzEO17PvxDLpsIp7nQHnN4sqqggJ7SJIO
   o9P7t58hqmZpvtymVbEt9R15bQ8HUHJWs+icedbqkMsda0HgVHVR2FaYi
   w==;
X-CSE-ConnectionGUID: tuhW/0TvRbKIABdaui6h+Q==
X-CSE-MsgGUID: P7o+8/+sSyuA1IcwVEBdPg==
X-IPAS-Result: =?us-ascii?q?A0BHAgDSxktq/43/Ja1aHgEBCxIMggULgld0X0JJA5ZLn?=
 =?us-ascii?q?huBfg8BAQEPRA0EAQGFBgKNTQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAQIBAzIBGAEbEhAcAwECLysjCBmDAgGCcwIBEQa5V?=
 =?us-ascii?q?4IsgQGDKAE/AkNQ2ywBCxQBBYEzhT+IH1sYAYR6AicbG4FygRWDaYEFd2UCA?=
 =?us-ascii?q?hiBHoZtBIIigQyBWh6PJ0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBD?=
 =?us-ascii?q?BsHBYEdgWuBAoR5Ix8DOX+BMHVKeS2BAgESHgqBUoEpAwsYDUgRLDcUGwQ+b?=
 =?us-ascii?q?geMexcPgj2BDgErgUNppXahDwoog3WMIZU6GjOFW6URC5h9izeCU4kPjUGEa?=
 =?us-ascii?q?IFoPIFZcBWDIglKGQ+OOINrhRPJRyQ1AgEBBwMvAQEHAgcOAwuBaJABgXwBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:/w4EXK9ft+VyUukmrsRxDrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2pJCj/UOvzfZGf9L992bo+/pBkFvZHQz9A1SgBp+HhEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbTpKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kqII0nvb5LH1tE1
 t0xAjwEcxHdh6GPlefTpulE3qzPLeHxN48Z/3UlxjbDALN+HdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Qn1lQ/UPrSmM+znmTkcyVboXqepLE85C7YywkZPL3FbYKIJ4HSHpgI9qqej
 lqZ+CepRVIBD82C4GOk+W2Sq8XDpSyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBYCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:Hm+1v68hNGLgfJt6yrNuk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdg7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: 9a23:Dci8Vm/PMzo9rCs3ER6Vv1IJGv9iKkHD9n3zAmaSBW90SeOVCmbFrQ==
X-Talos-MUID: 9a23:nYJIEAleMjwYV7nzBoGsdnpaa8Ars+PtE3scjLxfmsKbCwFaNw+S2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,149,1779148800"; 
   d="scan'208";a="505550355"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Jul 2026 15:21:13 +0000
Received: from sjc-ads-8093.cisco.com (sjc-ads-8093.cisco.com [171.68.208.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 30346180005E5;
	Mon,  6 Jul 2026 15:21:13 +0000 (GMT)
Received: by sjc-ads-8093.cisco.com (Postfix, from userid 1839047)
	id D2152CBEF99; Mon,  6 Jul 2026 08:21:12 -0700 (PDT)
From: "Shubham Pushpkar -X (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)" <spushpka@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Shubham Pushpkar <spushpka@cisco.com>
Subject: [meta-OE] [wrynose] [PATCH 5/6] jq: Fix CVE-2026-43896
Date: Mon,  6 Jul 2026 08:20:19 -0700
Message-ID: <20260706152022.873284-5-spushpka@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260706152022.873284-1-spushpka@cisco.com>
References: <20260706152022.873284-1-spushpka@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8093.cisco.com [171.68.208.131];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.208.131, sjc-ads-8093.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 15:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128049

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
 .../jq/jq/CVE-2026-43896.patch                | 73 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patch
new file mode 100644
index 0000000000..4ff82cf05f
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patch
@@ -0,0 +1,73 @@
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
+- Dropped the duplicate tests/jq.test hunk because Wrynose already carries
+  the same regression coverage in existing CVE-2026-47770.patch.
+
+(cherry picked from commit 532ccea6080ed6758f39fe9f6208a44b665023d2)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ src/jv.c | 25 +++++++++++++++++++++++--
+ 1 file changed, 23 insertions(+), 2 deletions(-)
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
+--
+2.44.4
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index 62de3a4117..9d98fd81c3 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${
            file://CVE-2026-41256.patch \
            file://CVE-2026-41257.patch \
            file://CVE-2026-43894.patch \
+           file://CVE-2026-43896.patch \
            "
 
 inherit autotools ptest
-- 
2.44.1


