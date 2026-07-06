Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63B6C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 15:21:10 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153652.1783351263394279974
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 08:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JsbCHawa;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3596; q=dns/txt;
  s=iport01; t=1783351263; x=1784560863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=75qGaASrlARYeIegzsRE5uBXucunh95KuhfW8tlYZZ0=;
  b=JsbCHawazel7wubV6rUsjbBUVSHqDhdO/yQ3kSo4DMSKWqQMiDUOBBzn
   idJAZgd0rawobarYOEOpYHB8o2kB3eQWoc2HdwcTxEYD8zxGd4cFbRiKa
   hFDnvERj8+5gTzmWbEw6s9iWJat++bOXK2QFaoavs0yLe2r/hSWUT3y88
   OeHAXuTZvCt5XYR5Db90mdCJryxtQGC4M7bNz6EoQ25yCzKmKGwo9a1JG
   HDcAcvHUPrbGo5qrF7dXtcd+k9Kd4HwSyj1IWiFsOwKaqiuGlX/XsO3xd
   nq7qrqBdmdBP4cIDswHx8mEfK6AeNAOAIw0zJURFfWF39JtcORODSZqoN
   Q==;
X-CSE-ConnectionGUID: vHR2agLPR2Wxr5q9SDzyqA==
X-CSE-MsgGUID: ZpMaUO34Tu6KsK3NyQ+6SA==
X-IPAS-Result: =?us-ascii?q?A0BHAgDSxktq/5H/Ja1aHgEBCxIMggULgld0X0JJlk6eG?=
 =?us-ascii?q?4F+DwEBAQ9EDQQBAYUGAo1NAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NhloBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJzAgERBrlXg?=
 =?us-ascii?q?XkzgQGDKAE/AkNQ2ywBCxQBBYEzhT+IH1sYAYR6AicbG4FygRWDaYEFd2UCA?=
 =?us-ascii?q?hiICwSCIoEMgVoejydIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbB?=
 =?us-ascii?q?wWBHYFrgQKEeSMfAzl/gTB1SnktgQIBEh4KgVKBKQMLGA1IESw3FBsEPm4Hj?=
 =?us-ascii?q?HsXD4I9exMBK6gioQ8KKIN1jCGVOhozhVulEQuYfYs3glOWUIRogWg8gVlwF?=
 =?us-ascii?q?YMiCUoZD44tCwuDYIUTyUckNQIBAQcyAQEHAgcOAwuBaJF9AQE?=
IronPort-Data: A9a23:SLgAb6iRRyGZDeq9OLQl03xaX161MBEKZh0ujC45NGQN5FlHY01je
 htvUGCGb62JazDxKdx3aNm090gHvJaHztIyGldsqCg0RXhjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPrd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUG2twtCG5qz
 cZCFyAXMwnSvM6k0auSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbE+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgp/5JEWxI9EglHkayBDqEqWrII84nPYy0p6172F3N/9J4TXGJgNxBbAz
 o7A11bhJxgnE4fD9Sfb0WmP3cnepGClY6tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YRLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:pp/vDKEh9R/kn5YlpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHPxOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3ATkIn4mvlOSgJcQfNbUiUUkZ/6Is7UkeHxXj0G3X?=
 =?us-ascii?q?iNnZzFaTEcnOC6bpNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ANuYShQ64PkxLxhLHgU/DOZJgxoxa+4GnNWdWzak?=
 =?us-ascii?q?b5eqfFndWKg7e0g+eF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,149,1779148800"; 
   d="scan'208";a="505550280"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Jul 2026 15:21:02 +0000
Received: from sjc-ads-8093.cisco.com (sjc-ads-8093.cisco.com [171.68.208.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 75B93180005B3;
	Mon,  6 Jul 2026 15:21:02 +0000 (GMT)
Received: by sjc-ads-8093.cisco.com (Postfix, from userid 1839047)
	id 23788CBEF99; Mon,  6 Jul 2026 08:21:02 -0700 (PDT)
From: "Shubham Pushpkar -X (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)" <spushpka@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Shubham Pushpkar <spushpka@cisco.com>
Subject: [meta-OE] [wrynose] [PATCH 3/6] jq: Fix CVE-2026-41257
Date: Mon,  6 Jul 2026 08:20:17 -0700
Message-ID: <20260706152022.873284-3-spushpka@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260706152022.873284-1-spushpka@cisco.com>
References: <20260706152022.873284-1-spushpka@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8093.cisco.com [171.68.208.131];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.208.131, sjc-ads-8093.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 15:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128047

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
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
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
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index 3e83464f0b..d45d88951c 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${
            file://CVE-2026-47770.patch \
            file://CVE-2026-40612.patch \
            file://CVE-2026-41256.patch \
+           file://CVE-2026-41257.patch \
            "
 
 inherit autotools ptest
-- 
2.44.1


