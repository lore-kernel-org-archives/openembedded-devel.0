Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E13C07E8C
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:28 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2754.1713318085926072046
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QVxW5gmh;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318087; x=1744854087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0sH6v9XVF1kUu7oKVK7MG7ADttQsSinXJF+E4T7Z7VA=;
  b=QVxW5gmhbaFVHXFe6F4ujQLBcz3XEjAevuLxa6Ef6I3OdFzuT0xhsQ+i
   x2veEbdvYFMAsIY4m7iSMNqT7comg4dpz+qoDjzDewcQ439QQLuTbL0PQ
   rmQTZu8THEQMZJBtWhUMa4ZSnov+/gzYMeezxjCyJn+Ia/EBmvX4L7zJ6
   XkIaNR7UZAPQBscNI0zifJI58qoZlTHbVcc6+jYg5IczUslyQauan4f5U
   nctsEQql+f+ypV3XgdlHcmM9eNb5/ocQTxifnkMbA5Oab2/59ctvowbw5
   xYNXU1/3cUH/vJMT6R8bEwLkihdrN+ViBbefSWFFhxXPEOZNc1HJ5TC2N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="143393374"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="143393374"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:25 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 11249E4EB0
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A680D595C
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C605E20097E61
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 724FE1A0002;
	Wed, 17 Apr 2024 09:41:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/49] makedumpfile: upgrade 1.7.4 -> 1.7.5
Date: Wed, 17 Apr 2024 09:40:25 +0800
Message-Id: <1713318061-17128-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--5.094800-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yTo39wOA02LhpxAd6mi1Ga0wAYdq1VTXo3MI
	apaDo9OKmC+wH+KoDcqX9moRF8wW94grKnsJ1GRgP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEPXc
	ag8UDUcUi+t+0AiFaYrVnVnu9zwYNxBNI9kTkfyDjpxdo/JwVm5iQDIJsDspXaGL2D7wHkbUjL8
	WDWZGeou0B0MT8S0EkgDLqnrRlXrZ8nn9tnqel2DsAVzN+Ov/s+u17LeMKsIEl8QBm47LDM/FG1
	/HZ1nD10saZLUFHtx3sIC7NTroKrA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109998

From: Wang Mingyu <wangmy@fujitsu.com>

0001-makedumpfile-replace-hardcode-CFLAGS.patch
refreshed for 1.7.5

Changelog:
============
-Support for kernels up to v6.8 (x86_64)
-Support for printk caller_id by --dump-dmesg option
-ppc64: get vmalloc start address from vmcoreinfo
-ppc64: read cur_mmu_type from vmcoreinfo
-add PRINTK_CALLER id support to --dump-dmesg option
-s390x: uncouple virtual and physical address spaces
-s390x: fix virtual vs physical address confusion

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-makedumpfile-replace-hardcode-CFLAGS.patch    | 10 ++++++----
 .../{makedumpfile_1.7.4.bb => makedumpfile_1.7.5.bb}   |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.7.4.bb => makedumpfile_1.7.5.bb} (97%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index 15ced551d..96a996f61 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -1,4 +1,4 @@
-From 71b5a3905d5cd0feca88a0d61d7657ba5296a052 Mon Sep 17 00:00:00 2001
+From 6d16911316cb576db0239f607e60918a222e4436 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Sun, 24 Apr 2022 17:25:33 +0800
 Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
@@ -20,9 +20,11 @@ Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
 Rebase to 1.7.1
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- Makefile | 42 ++++++++++++++++++++++--------------------
- 1 file changed, 22 insertions(+), 20 deletions(-)
+ Makefile | 40 +++++++++++++++++++++-------------------
+ 1 file changed, 21 insertions(+), 19 deletions(-)
 
+diff --git a/Makefile b/Makefile
+index 71d8548..22acdd5 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -8,12 +8,6 @@ ifeq ($(strip $CC),)
@@ -126,7 +128,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  	@sed -e "s/@DATE@/$(DATE)/" \
  	     -e "s/@VERSION@/$(VERSION)/" \
  	     $(VPATH)makedumpfile.8.in > $(VPATH)makedumpfile.8
-@@ -120,7 +122,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(
+@@ -120,7 +122,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
  	     $(VPATH)makedumpfile.conf.5.in > $(VPATH)makedumpfile.conf.5
  
  eppic_makedumpfile.so: extension_eppic.c
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.4.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb
similarity index 97%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.4.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb
index b016d5da4..85b44c494 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.4.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPL-2.0-only"
 
 SRCBRANCH ?= "master"
-SRCREV = "3bc3b3e3be33a9aa040e654f055912063e576c1b"
+SRCREV = "c266469347d49287be38059d45e7aaa454db9cb2"
 
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools = "perl ${PN}"
-- 
2.34.1


