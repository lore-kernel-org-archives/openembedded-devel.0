Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FE7C27C78
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:11 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.9753.1717664826146966055
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NPRMQlAR;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664826; x=1749200826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=l2sLPQMh/jHYbd8YI20bR9apGVrf+x3/nO58MAxOCsQ=;
  b=NPRMQlARE/Tvj+B+4PZK8wRcl/8pqV5QzlIkWwVtBwPE62ZlrHMYHhp6
   s9TjzAlUivYt+P5GRLxuNKnlPIw8s7mk1vL0RjhFDM78IYyGDLkwUdN+2
   7U2+JLLnR7Lx3NNHLCKFuMk/AmaqmXi5t8Fnq4VwzDN8iHe6okGe24R/4
   oUa1azQRgAshjJy6GguV5Na2AcJPE0lhTBJrZPlSd/YA1bpHhKfZspIya
   BQeiOU7EQ/T0DocC1H5Fn8t82UX6ibtqLjz+Ia4xWwo2qMW569YhQl5SM
   PMs9Z8xmPcMiPk1QL2EzLbEjUl03Misjpqm9GsSV/ltPd6pPA7I/5JN3E
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="150175851"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="150175851"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:03 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D964ADAD2F
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 28744D3F03
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A930120081323
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 56C691A000A;
	Thu,  6 Jun 2024 17:07:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 25/36] libtracefs: upgrade 1.7.0 -> 1.8.0
Date: Thu,  6 Jun 2024 17:06:24 +0800
Message-Id: <1717664795-13902-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--15.663200-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yYTD+kPfkVnIlKvhkP88iXQPdZmyx8xAa3+j
	vhRCUKYAoHACC//CPR0Myw6hMrtYUIgrKnsJ1GRgv5rsfD7H2pk/xRB6OGnb2rKw8Hx0EGitKpT
	dEP51ULgpQhq6BtvY2QFd21k9Z8naL/tBTZzO5Q2VUcz8XpiS9DYvC/PFFfSAuBsk5njfgGwaee
	16b+bHiW2b1YypDn8H8QkMd8p6eWlLracwFf93Azz6L+U/pejxjQqhmdnoX5ejY8EXdBUdH/hTW
	E9k4RmGZRUjkVFROF5WYOlTl4TEyuJzPEoBEMUK3IFFT9wqfr0NVHotTvuv6wZZ8N3RvTMxo8WM
	kQWv6iXBcIE78YqRWo6HM5rqDwqtBkN97De7tFrSwWYuI3HXsFRADXV8tSS/PD7AnCImfnc77gj
	MbKKK0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110733

From: Wang Mingyu <wangmy@fujitsu.com>

0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
refreshed for 1.8.0

0001-tracefs-perf-Add-missing-headers-for-syscall-and-SYS.patch
removed since it's included in 1.8.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...not-preserve-ownership-in-cp-command.patch |  9 ++----
 ...-missing-headers-for-syscall-and-SYS.patch | 31 -------------------
 ...ibtracefs_1.7.0.bb => libtracefs_1.8.0.bb} |  3 +-
 3 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/libtracefs/libtracefs/0001-tracefs-perf-Add-missing-headers-for-syscall-and-SYS.patch
 rename meta-oe/recipes-kernel/libtracefs/{libtracefs_1.7.0.bb => libtracefs_1.8.0.bb} (86%)

diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch b/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
index 7ae0856f8..7eaf29e4c 100644
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
@@ -1,4 +1,4 @@
-From 6650d0e79eea330b53635574885208a138fef97e Mon Sep 17 00:00:00 2001
+From ab6f78bfd6811c648ee71663cfc4dc8be151a519 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 21 Dec 2022 22:50:56 -0800
 Subject: [PATCH] makefile: Do not preserve ownership in cp command
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 27d425c..3aea142 100644
+index 7f4f5c3..1ba7b9d 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -273,7 +273,7 @@ endif # DESTDIR = ""
+@@ -296,7 +296,7 @@ endif # DESTDIR = ""
  
  install_libs: libs install_pkgconfig
  	$(Q)$(call do_install,$(LIBTRACEFS_SHARED),$(libdir_SQ)); \
@@ -26,6 +26,3 @@ index 27d425c..3aea142 100644
  	$(Q)$(call do_install,$(src)/include/tracefs.h,$(includedir_SQ),644)
  	$(Q)$(call install_ld_config)
  
--- 
-2.39.0
-
diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-tracefs-perf-Add-missing-headers-for-syscall-and-SYS.patch b/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-tracefs-perf-Add-missing-headers-for-syscall-and-SYS.patch
deleted file mode 100644
index a24dd1315..000000000
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-tracefs-perf-Add-missing-headers-for-syscall-and-SYS.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From f539d96ef4a34ad23d33c552d1770ab429b0220e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 14 Jun 2023 00:24:36 -0700
-Subject: [PATCH] tracefs-perf: Add missing headers for syscall() and SYS_*
- defines
-
-These headers are needed to provide prototype definitions for functions
-e.g. close(), syscall(), getpagesize(), getpid()
-
-The issue is observed with clang-16+ compiler on musl systems
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-trace-devel/20230614072759.316154-1-raj.khem@gmail.com/T/#u]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/tracefs-perf.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/tracefs-perf.c b/src/tracefs-perf.c
-index 96d12cd..62c1508 100644
---- a/src/tracefs-perf.c
-+++ b/src/tracefs-perf.c
-@@ -1,4 +1,5 @@
--#include <asm/unistd.h>
-+#include <unistd.h>
-+#include <sys/syscall.h>
- #include <sys/mman.h>
- #include <signal.h>
- #include <linux/perf_event.h>
--- 
-2.41.0
-
diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.0.bb
similarity index 86%
rename from meta-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb
rename to meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.0.bb
index 9a408ba13..c90ac19fa 100644
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.0.bb
@@ -9,10 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
 SECTION = "libs"
 DEPENDS = "libtraceevent bison-native flex-native"
 
-SRCREV = "aebab37379d0fbadc702d64aca0fe5cf18676404"
+SRCREV = "67f3b2ab9f836e6c9c70c94db7aac3251119a263"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https \
            file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch \
-           file://0001-tracefs-perf-Add-missing-headers-for-syscall-and-SYS.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.34.1


