Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A25C3ABA6
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.35400.1745311776746154296
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jvISbE/u;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311777; x=1776847777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=akQ9zE9Y3z/ZX8fOkMQ0YUkKFJO5dfsMkMDxsG9XZ4k=;
  b=jvISbE/u2gTeyVqnEJ+DORATF67JQ49D6ir4e7FkXJACmYqDYGoWL4Wu
   xrDHwnJpNu009Iw2puhSv1tuohADt/tLVDT1IrKj3mRylBslWecz0Ab7j
   v4xyZ+PARa9b1CJEM98RaGRdgV75MqDZW6lNZiex4DBWwz2/qibpX3pIZ
   lupcgnuKxTA3lcJpJsuzU/Z43S/rHQLcb1jEltkynHfPH18kGp3V6wziw
   Dzdju3li3m0F2CeqhRb9m8v6S5NN+ZsFbTlN+ECTiIFrAmDbOo52e9rSB
   MhzxjfIDgbGxSMpHfsQ6cTpXJpZy7tBM9RWTacpgKwx9NoVaNPC0pZGsi
   g==;
X-CSE-ConnectionGUID: 4DgTIdzqQtGRBtb/qJAIuA==
X-CSE-MsgGUID: F8pi9uwlQu+ENnq5nIVWKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="197342737"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="197342737"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:35 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D235E0765
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C18ED3F2D
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:32 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A55991A009B;
	Tue, 22 Apr 2025 16:49:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/30] python3-greenlet: upgrade 3.1.1 -> 3.2.0
Date: Tue, 22 Apr 2025 16:49:08 +0800
Message-Id: <1745311761-1912-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117033

From: Wang Mingyu <wangmy@fujitsu.com>

0001-slp_switch-Implement-for-RISCV32.patch
removed since it's included in 3.2.0

Changelog:
============
- Remove support for Python 3.7 and 3.8.
- Add untested, community supported implementation for RiscV 32.
- Make greenlet build and run on Python 3.14a7. It will not build on earlier 3.14 alpha releases, and may not build on later 3.14 releases.
- Packaging: Use PEP 639 license expressions and include license files.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...001-slp_switch-Implement-for-RISCV32.patch | 48 -------------------
 ...let_3.1.1.bb => python3-greenlet_3.2.0.bb} |  4 +-
 2 files changed, 1 insertion(+), 51 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-greenlet/0001-slp_switch-Implement-for-RISCV32.patch
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.1.1.bb => python3-greenlet_3.2.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet/0001-slp_switch-Implement-for-RISCV32.patch b/meta-python/recipes-devtools/python/python3-greenlet/0001-slp_switch-Implement-for-RISCV32.patch
deleted file mode 100644
index 83877d3860..0000000000
--- a/meta-python/recipes-devtools/python/python3-greenlet/0001-slp_switch-Implement-for-RISCV32.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 524fd7244cfec4ec6760e52001c9a41d1913066e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 6 Apr 2025 20:54:08 -0700
-Subject: [PATCH] slp_switch: Implement for RISCV32
-
-Changed data types from long to int for fp variable
-stackref pointer and stsizediff variable
-
-Changed the load instruction from ld (64-bit load) to lw (32-bit load)
-
-Upstream-Status: Submitted [https://github.com/python-greenlet/greenlet/pull/439]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/greenlet/platform/switch_riscv_unix.h | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/src/greenlet/platform/switch_riscv_unix.h b/src/greenlet/platform/switch_riscv_unix.h
-index e74f37a..32ca78c 100644
---- a/src/greenlet/platform/switch_riscv_unix.h
-+++ b/src/greenlet/platform/switch_riscv_unix.h
-@@ -11,9 +11,14 @@
- static int
- slp_switch(void)
- {
--  long fp;
-   int ret;
-+#if __riscv_xlen == 32
-+  long fp;
-   long *stackref, stsizediff;
-+#else
-+  int fp;
-+  int *stackref, stsizediff;
-+#endif
-   __asm__ volatile ("" : : : REGS_TO_SAVE);
-   __asm__ volatile ("mv %0, fp" : "=r" (fp) : );
-   __asm__ volatile ("mv %0, sp" : "=r" (stackref) : );
-@@ -28,7 +33,11 @@ slp_switch(void)
-       SLP_RESTORE_STATE();
-   }
-   __asm__ volatile ("" : : : REGS_TO_SAVE);
-+#if __riscv_xlen == 32
-+  __asm__ volatile ("lw fp, %0" : : "m" (fp));
-+#else
-   __asm__ volatile ("ld fp, %0" : : "m" (fp));
-+#endif
-   __asm__ volatile ("mv %0, zero" : "=r" (ret) : );
-   return ret;
- }
diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.1.1.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.2.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.2.0.bb
index b45edac12d..e0b8008d43 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.2.0.bb
@@ -4,10 +4,8 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "4ce3ac6cdb6adf7946475d7ef31777c26d94bccc377e070a7986bd2d5c515467"
+SRC_URI[sha256sum] = "1d2d43bd711a43db8d9b9187500e6432ddb4fafe112d082ffabca8660a9e01a7"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI += "file://0001-slp_switch-Implement-for-RISCV32.patch"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


