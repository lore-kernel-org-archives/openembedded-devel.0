Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE72CD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 07:53:26 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15157.1781077999667368099
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2026 00:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RNnFDoDj;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3653; q=dns/txt;
  s=iport01; t=1781077999; x=1782287599;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aAsSmxGVONmFE4Dv9W1x5cvggflVP1Hoi6Jsso4mQKU=;
  b=RNnFDoDjMgP/0EBEfRckWn4zShboCodmXoF0zAw8+gQoN8dtyivPiS0N
   bAQYmGD3OZjr3i+eBG9+0mEbu10k24tAzGQjOfZB+jXLH1TsS28MZZwDo
   wgsBvResCkpDVyJ09vCD7MVDbBcZt6xwhnlMFDHnLcg8kEDO4JV2UOFEB
   qS5qgJDcJgGrciXr7/OLQge+Io/nHe8FL4IEBI2YiXTiojViQ4QDBsS/r
   HTSfERHtysuha6XQi4MdCwWphfEelosg2JOL+3ktcjG6o1vI6aVNCBzt/
   tdasPwlgSKuI4R6F9qQvrW5/QCWwq6YgSpH0ZJE8Fp1ftWpXdVM5SrkTk
   A==;
X-CSE-ConnectionGUID: mKO0ntpNRRi/CgN9dngmig==
X-CSE-MsgGUID: +hnuxRocSq2JkRejmbvuzw==
X-IPAS-Result: =?us-ascii?q?A0BHAgBbFilq/4v/Ja1aglmCV3RfQkmWTp4bgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQYCjToCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GWgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnMCAREGsXgaN4F5M4EBg?=
 =?us-ascii?q?ygBPwJDUNsrAQsUAQWBM4U/iB5bGAGEegInGxuBcoEVg2iBBXdlAgIYiAsEg?=
 =?us-ascii?q?iJ6EoFdHoViiRJIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBS?=
 =?us-ascii?q?oE3aIEChRAjHwM5gRWBeoEoZ2kVMDVsAwsYDUgRLDcUGwQ+bgeMOhcPgjh7E?=
 =?us-ascii?q?wErqCKhDwoog3SMIZU6GjOqawuYfI4Klk+EaIFoPIFZcBWDIglKGQ+OLQsLg?=
 =?us-ascii?q?2CFE8M3JDUCAQEHMgEBBwIHDgMLgWiRfQEB?=
IronPort-Data: A9a23:ZMCHa6mXmqopDOeoQJVxvhHo5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOX2/SaPrfMGumeIskYIWy8hsB75aGn4U1SgVvqC8xQltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZG31GONgWYubDpKsvrb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYg73b5xHXloz
 8YZbxsCSEGPge2zwb3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaz/7C7pm9AusrmLnbiZYsFGcjaE2+GPUigd21dABNfKJK4XWGJsKwhjwS
 mTuvGT/HwEgM9ek0GCn8UihhOrFgz7pR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmQHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:s03XYah6wBPyklhRQ7kSoQgT5nBQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfD5HZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: 9a23:Pmbnc25C3M5mGTe8ONss8W0zQsY5alvn9naXCECeWGpvR7iURgrF
X-Talos-MUID: 9a23:/hq6sAjKxjdPEML0LhnJ3cMpd8du/rSUD0s2iM8kuPOJNyl6JSqPk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,197,1774310400"; 
   d="scan'208";a="491456746"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jun 2026 07:53:18 +0000
Received: from sjc-ads-10443.cisco.com (sjc-ads-10443.cisco.com [171.70.96.196])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 9A4E918000211;
	Wed, 10 Jun 2026 07:53:18 +0000 (GMT)
Received: by sjc-ads-10443.cisco.com (Postfix, from userid 1839047)
	id 47222CC1282; Wed, 10 Jun 2026 00:53:18 -0700 (PDT)
From: "Shubham Pushpkar -X (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)" <spushpka@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Shubham Pushpkar <spushpka@cisco.com>
Subject: [meta-OE] [scarthgap] [PATCH 3/5] jq: Fix CVE-2026-41257
Date: Wed, 10 Jun 2026 00:52:51 -0700
Message-Id: <20260610075253.1676404-3-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260610075253.1676404-1-spushpka@cisco.com>
References: <20260610075253.1676404-1-spushpka@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10443.cisco.com [171.70.96.196];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.96.196, sjc-ads-10443.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 07:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127511

From: Shubham Pushpkar <spushpka@cisco.com>

The upstream fix [3] is for a newer jq codebase. Debian has already
backported this fix in jq 1.8.1-6. Use the Debian patch [1], which fixes
this CVE as tracked in Debian bug #1136445 [2].

[1] https://sources.debian.org/src/jq/1.8.1-7/debian/patches/CVE-2026-41257.patch
[2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1136445
[3] https://github.com/jqlang/jq/commit/01b3cded76daacbfddb7f8763700b0803bcb5c6f

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 .../jq/jq/CVE-2026-41257.patch                | 57 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41257.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-41257.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-41257.patch
new file mode 100644
index 0000000000..9eb3ea2576
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-41257.patch
@@ -0,0 +1,57 @@
+From a525b86330b4b8889e0329249b8d2e04f9640a2a Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Fri, 24 Apr 2026 22:09:44 +0900
+Subject: [PATCH] Fix signed-int overflow in `stack_reallocate`
+
+This fixes CVE-2026-41257.
+
+CVE: CVE-2026-41257
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/01b3cded76daacbfddb7f8763700b0803bcb5c6f]
+
+(cherry picked from commit 01b3cded76daacbfddb7f8763700b0803bcb5c6f)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ src/exec_stack.h | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/src/exec_stack.h b/src/exec_stack.h
+index 2a063e8..159c56e 100644
+--- a/src/exec_stack.h
++++ b/src/exec_stack.h
+@@ -2,8 +2,10 @@
+ #define EXEC_STACK_H
+ #include <stddef.h>
+ #include <stdint.h>
++#include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <limits.h>
+ #include "jv_alloc.h"
+
+ /*
+@@ -81,15 +83,19 @@ static stack_ptr* stack_block_next(struct stack* s, stack_ptr p) {
+ }
+
+ static void stack_reallocate(struct stack* s, size_t sz) {
+-  int old_mem_length = -(s->bound) + ALIGNMENT;
+-  char* old_mem_start = (s->mem_end != NULL) ? (s->mem_end - old_mem_length) : NULL;
++  size_t old_mem_length = (size_t)(-(s->bound)) + ALIGNMENT;
++  char* old_mem_start = s->mem_end != NULL ? s->mem_end - old_mem_length : NULL;
+
+-  int new_mem_length = align_round_up((old_mem_length + sz + 256) * 2);
++  size_t new_mem_length = align_round_up((old_mem_length + sz + 256) * 2);
++  if (new_mem_length > INT_MAX) {
++    fprintf(stderr, "jq: error: cannot allocate memory\n");
++    abort();
++  }
+   char* new_mem_start = jv_mem_realloc(old_mem_start, new_mem_length);
+   memmove(new_mem_start + (new_mem_length - old_mem_length),
+             new_mem_start, old_mem_length);
+   s->mem_end = new_mem_start + new_mem_length;
+-  s->bound = -(new_mem_length - ALIGNMENT);
++  s->bound = -(int)(new_mem_length - ALIGNMENT);
+ }
+
+ static stack_ptr stack_push_block(struct stack* s, stack_ptr p, size_t sz) {
+--
+2.44.4
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index c50ffc4cbe..917196d7b5 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://CVE-2026-39979.patch \
     file://CVE-2026-40612.patch \
     file://CVE-2026-41256.patch \
+    file://CVE-2026-41257.patch \
     "
 SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 
-- 
2.35.6


