Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FFDD6ACC4
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:33 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37587.1766048668519140903
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VrcA0fnn;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048668; x=1797584668;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yiJwMT5Fs1MvKW/xjywhnVVkEBNUma4792uF56DLvgY=;
  b=VrcA0fnndMvSk3HO+d9jG5FtDFP/Vsln1wlbYG2icqWU5P793Y+2lHl/
   ysJqMlD0pljpd+wfW7UzSWzc8vjTJG/6wGCnPPzf6H+Ibyv8sZYxejKAt
   ceJbWDK5kDPmAQH0I/H6Xm+lIn12Rr8W+C6eqevdOcK4Y5/iVYwZRrXme
   wAprPNgfv5NZLtP17VvbDsuDZzwQ/R6SPd7SLSJ6kE//SDYvEj3XBiWDa
   K2cyaNg0YQTzyCxGZ/3RtwUzX94+5EABiaEt+2DrOq2cV52WkEmjbbFYm
   UajedB235IOOwXoOEMUnZwHFfC1PM9BIcIX2VSkVLaBhrorbGTDC+bnB/
   A==;
X-CSE-ConnectionGUID: vQ0tTm5+QymO8S5HAveRFw==
X-CSE-MsgGUID: ibhk6t9lSwSWTj00g9MWGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="223709759"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="223709759"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:27 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id F37751C1734F
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:26 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id A282DC06D64
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2D96A101BB51;
	Thu, 18 Dec 2025 09:04:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 20/20] valkey: upgrade 9.0.0 -> 9.0.1
Date: Thu, 18 Dec 2025 17:03:46 +0800
Message-ID: <20251218090346.735-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122754

From: Wang Mingyu <wangmy@fujitsu.com>

0001-src-config.h-Enable-HAVE_ARM_NEON-on-AArch64.patch
removed since it's included in 9.0.1

Changelog:
===========
- Authenticate slot migration client on source node to internal user
- Bug fix: reset io_last_written on c->buf resize to prevent stale pointers
- Sentinel: fix regression requiring "+failover" ACL in failover path
- Cluster: Avoid usage of light weight messages to nodes with not ready bidirectional links
- Send duplicate multi meet packet only for node which supports it in mixed clusters
- Fix: LTRIM should not call signalModifiedKey when no elements are removed
- Fix build on some 32-bit ARM by only using NEON on AArch64
- Fix deadlock in IO-thread shutdown during panic
- Fix COMMANDLOG large-reply when using reply copy avoidance
- Fix CLUSTER SLOTS crash when called from module timer callback

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ig.h-Enable-HAVE_ARM_NEON-on-AArch64.patch | 31 -------------------
 .../{valkey_9.0.0.bb => valkey_9.0.1.bb}      | 22 ++++++-------
 2 files changed, 10 insertions(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/valkey/valkey/0001-src-config.h-Enable-HAVE_ARM_NEON-on-AArch64.patch
 rename meta-oe/recipes-extended/valkey/{valkey_9.0.0.bb => valkey_9.0.1.bb} (81%)

diff --git a/meta-oe/recipes-extended/valkey/valkey/0001-src-config.h-Enable-HAVE_ARM_NEON-on-AArch64.patch b/meta-oe/recipes-extended/valkey/valkey/0001-src-config.h-Enable-HAVE_ARM_NEON-on-AArch64.patch
deleted file mode 100644
index 464fa60ee5..0000000000
--- a/meta-oe/recipes-extended/valkey/valkey/0001-src-config.h-Enable-HAVE_ARM_NEON-on-AArch64.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b15bcea48132bb8e8c1c2a4a05860cd5b73db5fd Mon Sep 17 00:00:00 2001
-From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Tue, 25 Nov 2025 08:56:49 +0000
-Subject: [PATCH] src/config.h: Enable HAVE_ARM_NEON on AArch64
-
-Only enable HAVE_ARM_NEON on AArch64 because it supports vaddvq and
-all needed compiler intrinsics.
-
-Upstream-Status: Submitted [https://github.com/valkey-io/valkey/pull/2873]
-
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- src/config.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/config.h b/src/config.h
-index de0c24dcc..0c6b111a9 100644
---- a/src/config.h
-+++ b/src/config.h
-@@ -392,7 +392,7 @@ void setcpuaffinity(const char *cpulist);
- #endif
- 
- /* Check if we can compile ARM SIMD code */
--#if defined(__ARM_NEON) || defined(__ARM_NEON__)
-+#if defined(__aarch64__) && (defined(__ARM_NEON) || defined(__ARM_NEON__))
- #define HAVE_ARM_NEON 1
- #else
- #define HAVE_ARM_NEON 0
--- 
-2.47.3
-
diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.0.bb b/meta-oe/recipes-extended/valkey/valkey_9.0.1.bb
similarity index 81%
rename from meta-oe/recipes-extended/valkey/valkey_9.0.0.bb
rename to meta-oe/recipes-extended/valkey/valkey_9.0.1.bb
index 77f2551261..1f27224772 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.0.0.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.0.1.bb
@@ -6,18 +6,16 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=08b9159809d809e8aaa340a8387e693e"
 DEPENDS = "readline lua ncurses"
 
-SRC_URI = " \
-	git://github.com/valkey-io/valkey.git;branch=9.0;protocol=https \
-        file://valkey.conf \
-	file://init-valkey-server \
-	file://valkey.service \
-	file://lua-update-Makefile-to-use-environment-build-setting.patch \
-	file://oe-use-libc-malloc.patch \
-	file://0001-src-Do-not-reset-FINAL_LIBS.patch \
-	file://GNU_SOURCE-7.patch \
-	file://0001-src-config.h-Enable-HAVE_ARM_NEON-on-AArch64.patch \
-"
-SRCREV = "5018b12b0de2d2322a1bbf6b041c43740587c0f2"
+SRC_URI = "git://github.com/valkey-io/valkey.git;branch=9.0;protocol=https;tag=${PV} \
+           file://valkey.conf \
+           file://init-valkey-server \
+           file://valkey.service \
+           file://lua-update-Makefile-to-use-environment-build-setting.patch \
+           file://oe-use-libc-malloc.patch \
+           file://0001-src-Do-not-reset-FINAL_LIBS.patch \
+           file://GNU_SOURCE-7.patch \
+           "
+SRCREV = "ab3c953b80289d88991095f53c1235fc2f8b44d6"
 
 RPROVIDES:${PN} = "virtual-redis"
 
-- 
2.43.0


