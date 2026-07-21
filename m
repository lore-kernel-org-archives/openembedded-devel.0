Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFD4C4452D
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 09:39:47 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18897.1784626783041452144
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 02:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SOCWrO7f;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4176; q=dns/txt;
  s=iport01; t=1784626783; x=1785836383;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vhya5kcETAqgdZAZ5tY+jO1XVhC6NS1O6Zbi/WjnQpI=;
  b=SOCWrO7fS9APkHDvvrsKbvuJTqZiF/Wnsfvr15ckqFPLZXxes7IF1yMn
   LREdo5N9TdwuNRvYu4/KcchPut47NeaubLCW/+WHdr7oDjVJvbgE0muUB
   7wrMx5cQdd1xpg9KigPGY/2MQuRml04KqL7CoCCakF0dmrhTyUYzm0G9R
   9qpdpALALxNHYKKES3i0HRVhVPqCJ6E8FpOW33BL51K9FqrKPeXVrr7tL
   s8wTHNwKkT6ICOESrbtH5Hp931JQxyKtsHqvDZK1QM8eGgp28GUyMU88L
   RRblQTJij+oJDRUhYLSxl+43WPw3Ap3f+6ZrJzFqJ+CVqAwhTJd9Lhk3D
   A==;
X-CSE-ConnectionGUID: SBUn9hPHQPqmBWIaX4dAjg==
X-CSE-MsgGUID: Am3LWHSjREaOqyOQyYhKhg==
X-IPAS-Result: =?us-ascii?q?A0BLAgAGPV9q/4z/Ja1aglmCV3ReQ0kDhFSRcwOBE50Ig?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhQUCjVcCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWgECAQMjDwEYAS0QHAMBAgMCJgICKyMIEAmDAgGCdAMRv?=
 =?us-ascii?q?kcaN3qBMoEBgygBgVTbLgELFAEFgQUuhT+DHQGFAlwYAYR8JxsbgXKBFYJzd?=
 =?us-ascii?q?oEFgVwCgSeEFIJqBIIiehKBWh6QEUiBAhwDWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XNFgbBwWBHYE6gQKEdCMfAzl/gS91SnctaQESF4EmghICgTsCTgMLG?=
 =?us-ascii?q?A1IESw3FBkEPQFuB41bI4I/AYEOASsXghWldqEPCiiDdYwhlToaM6psC5h9j?=
 =?us-ascii?q?gqWUIRpgWg8gVlwFYMiCUoZD444g2vOWicyAgkDLwEBBwIHAQwBAwuBaJAAg?=
 =?us-ascii?q?X4BAQ?=
IronPort-Data: A9a23:QFhtqqp1EliulcclbVKYzgxFGsFeBmJIZBIvgKrLsJaIsI4StFCzt
 garIBnUP6uCZGagfd9yat63oBwOu5bWnNE1QAI4/ys9FXwRpOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8ko35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0t1dPGcf9
 cQ4EQgUazq8puuGnL6SSOY506zPLOGzVG8ekmtrwTecCbMtRorOBv2Ro9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUPrSn8/w7pX7WzFbpVacpLs+y2PS1wd2lrPqNbI5f/TXHJ4Pxh3G/
 j2uE2LRKxRBEOO/8ji/33uLn/7opDLKWKESG+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aJ
 0EK9y4Gqakp6FftScHwWRC9qnOIshMQHd1KHIUHBBql0KHY5UOdQ2MDVDMEMIdgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaY0D58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:zEg0sqNkm5e2N8BcTh+jsMiBIKoaSvp037Dk7S9MoHtuA6qlfq
 GV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFeaTN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn9E4sLxKDwNeOGAbqBJb6
 ah2g==
X-Talos-CUID: 9a23:yvorV2HOrlkh2lSnqmJc3nMSS8AdUkTl1XL6HG6xOTplYb+aHAo=
X-Talos-MUID: 9a23:YgUFbApz32Oq/l497uwezxhnb+NXw5+sMm0EtowXnPCVBCxTOzjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,176,1779148800"; 
   d="scan'208";a="513203607"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2026 09:39:42 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 032D1180001C0;
	Tue, 21 Jul 2026 09:39:42 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id A2C73CAB20E; Tue, 21 Jul 2026 02:39:41 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [meta-OE][scarthgap][PATCH 4/4] jq: Fix CVE-2026-54679
Date: Tue, 21 Jul 2026 02:39:38 -0700
Message-Id: <20260721093938.3983571-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260721093938.3983571-1-dkelaiya@cisco.com>
References: <20260721093938.3983571-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 09:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128347

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix for CVE-2026-54679 as referenced
in [2], using the upstream commit identified in [1].

[1] https://github.com/jqlang/jq/commit/46d1da30944ce93dd671ac72b6513fc0eb747837
[2] https://github.com/jqlang/jq/security/advisories/GHSA-29gj-222p-j7vx

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../jq/jq/CVE-2026-54679.patch                | 74 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-54679.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-54679.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-54679.patch
new file mode 100644
index 0000000000..20689e83c6
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-54679.patch
@@ -0,0 +1,74 @@
+From c4f6b269e6d2178c74aac6e82c5285a90c9347a0 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Tue, 16 Jun 2026 14:31:14 +0900
+Subject: [PATCH] Tighten string length bounds and propagate invalid jv in
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
+Backport Changes:
+- Omitted the jv_string_repeat() bound change because this function is
+  not present in the Scarthgap jq source. The applicable
+  jvp_string_append(), jv_string_implode(), and f_string_implode()
+  security changes were retained unchanged.
+
+Co-authored-by: Dirk Müller <dirk@dmllr.de>
+(cherry picked from commit 46d1da30944ce93dd671ac72b6513fc0eb747837)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/builtin.c | 1 +
+ src/jv.c      | 3 ++-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/builtin.c b/src/builtin.c
+index 08a8a98..46b9077 100644
+--- a/src/builtin.c
++++ b/src/builtin.c
+@@ -1264,6 +1264,7 @@ static jv f_string_implode(jq_state *jq, jv a) {
+     if (nv < 0 || nv > 0x10FFFF || (nv >= 0xD800 && nv <= 0xDFFF))
+       nv = 0xFFFD; // U+FFFD REPLACEMENT CHARACTER
+     s = jv_string_append_codepoint(s, nv);
++    if (!jv_is_valid(s)) break;
+   }
+ 
+   jv_free(a);
+diff --git a/src/jv.c b/src/jv.c
+index fe27168..6f79693 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1175,7 +1175,7 @@ static uint32_t jvp_string_remaining_space(jvp_string* s) {
+ static jv jvp_string_append(jv string, const char* data, uint32_t len) {
+   jvp_string* s = jvp_string_ptr(string);
+   uint32_t currlen = jvp_string_length(s);
+-  if ((uint64_t)currlen + len >= INT_MAX) {
++  if ((uint64_t)currlen + len >= INT_MAX - sizeof(jvp_string) / 2) {
+     jv_free(string);
+     return jv_invalid_with_msg(jv_string("String too long"));
+   }
+@@ -1435,6 +1435,7 @@ jv jv_string_implode(jv j) {
+     if (nv < 0 || nv > 0x10FFFF || (nv >= 0xD800 && nv <= 0xDFFF))
+       nv = 0xFFFD; // U+FFFD REPLACEMENT CHARACTER
+     s = jv_string_append_codepoint(s, nv);
++    if (!jv_is_valid(s)) break;
+   }
+ 
+   jv_free(j);
+-- 
+2.44.4
+
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index 56ac5b2032..4327a25311 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -28,6 +28,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://CVE-2026-43895.patch \
     file://CVE-2026-47770.patch \
     file://CVE-2026-49839.patch \
+    file://CVE-2026-54679.patch \
     "
 SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 
-- 
2.35.6


