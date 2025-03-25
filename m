Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAD4C3600D
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:09 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.61524.1742893323169219465
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DKxBUaKD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893326; x=1774429326;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Hkt6azGHYyyRn6S7CJ3VLSlcvmaBREOe0GVPwlZlYGY=;
  b=DKxBUaKDI/9ZeaJNTlqaDkZRyKR/C3IBLscsULo/w15BNOxAfPNdmbm8
   wVoTUKxVmSVm/m6OgkxwlwAqIpSR8zWHcfNEbMy5AL/LKYj0+scKyBzWa
   XxJOORlmCAS5lJuAvKtmfkYtyWycFxOngIqck9VNT+71IjvzRk7RMzA5c
   AEw/RkjpyXN+PUmMoYG5rHwlLTkTbU+Es1okPuF0uN0ArDvk0zqMzkATX
   I4n4RChvxjegsfJYG+hBIwaYP2Pk8NEwP0vPeKl8pERJhcSSBwtN4+8G9
   SVCdnqSnMF99at0rTBr2AXCgB+TtV1d8z+t87BtgaZZVmdStUWlS7hbZs
   Q==;
X-CSE-ConnectionGUID: 9e8Z0xAbQaKsXzF5dvxSwg==
X-CSE-MsgGUID: WvG7GYy5RV+lRVRjOe58wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="196914817"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="196914817"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:05 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D7690E8523
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 93996CF7EE
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:00 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2955F1A0078;
	Tue, 25 Mar 2025 17:02:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/45] flashrom: upgrade 1.4.0 -> 1.5.1
Date: Tue, 25 Mar 2025 17:01:11 +0800
Message-Id: <1742893312-3809-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116228

From: Wang Mingyu <wangmy@fujitsu.com>

0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch
0001-linux_mtd-fix-build-with-clang-19.patch
removed since they're included in 1.5.1

0002-meson-Add-options-pciutils-ftdi-usb.patch
refreshed for 1.5.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...SCV-as-non-memory-mapped-I-O-archite.patch | 30 --------------
 ...01-linux_mtd-fix-build-with-clang-19.patch | 39 -------------------
 ...-meson-Add-options-pciutils-ftdi-usb.patch | 13 ++++---
 .../{flashrom_1.4.0.bb => flashrom_1.5.1.bb}  |  4 +-
 4 files changed, 8 insertions(+), 78 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch
 delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-linux_mtd-fix-build-with-clang-19.patch
 rename meta-oe/recipes-bsp/flashrom/{flashrom_1.4.0.bb => flashrom_1.5.1.bb} (75%)

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch
deleted file mode 100644
index 58f1aa4d43..0000000000
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From bf5a30ef30818973eb2cfac792b80c642df8a721 Mon Sep 17 00:00:00 2001
-From: Patrick Rudolph <patrick.rudolph@9elements.com>
-Date: Mon, 14 Oct 2024 11:01:37 +0200
-Subject: [PATCH 1/2] flashrom: Mark RISCV as non memory-mapped I/O
- architecture
-
-Upstream-Status: Inactive-Upstream
-
-Change-Id: I46d7ede7af61e7fca631e1d465100e65c6ddeee9
-Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 97f56b83..08e4c595 100644
---- a/Makefile
-+++ b/Makefile
-@@ -372,7 +372,7 @@ endif
- # Additionally disable all drivers needing raw access (memory, PCI, port I/O)
- # on architectures with unknown raw access properties.
- # Right now those architectures are alpha hppa m68k sh s390
--ifneq ($(ARCH), $(filter $(ARCH), x86 mips ppc arm sparc arc e2k))
-+ifneq ($(ARCH), $(filter $(ARCH), x86 mips ppc arm sparc arc e2k riscv))
- $(call mark_unsupported,$(DEPENDS_ON_RAW_MEM_ACCESS))
- endif
- 
--- 
-2.46.2
-
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-linux_mtd-fix-build-with-clang-19.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-linux_mtd-fix-build-with-clang-19.patch
deleted file mode 100644
index 46bd0bba44..0000000000
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-linux_mtd-fix-build-with-clang-19.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 615fae91dafdb89f0f8418129918dbb7ff879cf6 Mon Sep 17 00:00:00 2001
-From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
-Date: Thu, 24 Oct 2024 17:51:29 +0200
-Subject: [PATCH] linux_mtd: fix build with clang >= 19
-
-Starting with version 19, clang issues a warning when using `strlen()`
-for initializing a static array's size. This causes the build to fail as
-the project also sets `-Werror`.
-
-This is fixed by using `sizeof()` instead, which is guaranteed to be
-evaluated at compilation time and therefore not triggering the
-problematic warning.
-
-Upstream-Status: Backport [https://github.com/flashrom/flashrom/commit/34b1a6aa57e910c0b5a518e8a0cab6841c7efaee]
-
-Change-Id: If470a65702e9ae08e4303123a0014e53a1fee56e
-Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
-Reviewed-on: https://review.coreboot.org/c/flashrom/+/84856
-Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
-Reviewed-by: Maximilian Brune <maximilian.brune@9elements.com>
-Reviewed-by: Anastasia Klimchuk <aklm@chromium.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- linux_mtd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/linux_mtd.c b/linux_mtd.c
-index eea0cf2..0cb2330 100644
---- a/linux_mtd.c
-+++ b/linux_mtd.c
-@@ -49,7 +49,7 @@ static int read_sysfs_string(const char *sysfs_path, const char *filename, char
- 	int i;
- 	size_t bytes_read;
- 	FILE *fp;
--	char path[strlen(LINUX_MTD_SYSFS_ROOT) + 32];
-+	char path[sizeof(LINUX_MTD_SYSFS_ROOT) + 31];
- 
- 	snprintf(path, sizeof(path), "%s/%s", sysfs_path, filename);
- 
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
index bc43f17e9a..8dfed855b4 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
@@ -16,10 +16,10 @@ Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
  2 files changed, 6 insertions(+), 3 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index ae56b26c..21093a7f 100644
+index 6c8d3d3..61b794d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -151,9 +151,9 @@ systems_serial     = [ 'linux', 'openbsd', 'freebsd', 'dragonfly', 'netbsd', 'da
+@@ -150,9 +150,9 @@ systems_serial     = [ 'linux', 'openbsd', 'freebsd', 'dragonfly', 'netbsd', 'da
  
  cpus_port_io = [ 'x86', 'x86_64' ]
  
@@ -33,16 +33,17 @@ index ae56b26c..21093a7f 100644
  group_serial = get_option('programmer').contains('group_serial')
  group_jlink  = get_option('programmer').contains('group_jlink')
 diff --git a/meson_options.txt b/meson_options.txt
-index 8a04114d..ae722509 100644
+index 87456a9..570b152 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -25,3 +25,6 @@ option('ni845x_search_path', type : 'string', value : 'C:\Program Files (x86)\Na
- option('delay_minimum_sleep_us', type : 'integer', min : 0, value : 100000,
+@@ -24,4 +24,7 @@ option('ni845x_search_path', type : 'string', value : 'C:\Program Files (x86)\Na
+ option('delay_minimum_sleep_us', type : 'integer', min : 0, value : 100,
         description : 'Minimum time in microseconds to suspend execution for (rather than polling) when a delay is required.'
                     + ' Larger values may perform better on machines with low timer resolution, at the cost of increased power.')
 +option('pciutils', type : 'boolean', value : false, description : 'Select programmer group pci')
 +option('usb', type : 'boolean', value : false, description : 'Select programmer group usb')
 +option('ftdi', type : 'boolean', value : false, description : 'Select programmer group ftdi')
+ option('rpmc', type : 'feature', value : 'auto', description : 'Support for Replay Protected Monotonic Counter (RPMC) commands as specified by JESD260')
 -- 
-2.46.2
+2.43.0
 
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.4.0.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb
similarity index 75%
rename from meta-oe/recipes-bsp/flashrom/flashrom_1.4.0.bb
rename to meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb
index 6c5d05f2d0..9a8e81bae3 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.4.0.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb
@@ -4,12 +4,10 @@ HOMEPAGE = "http://flashrom.org"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.xz \
-           file://0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch \
            file://0002-meson-Add-options-pciutils-ftdi-usb.patch \
-           file://0001-linux_mtd-fix-build-with-clang-19.patch \
            "
 
-SRC_URI[sha256sum] = "eb0eb3e61a57fd1926c66f08664cf04a96f92cee23b600cf563087c2178d70d8"
+SRC_URI[sha256sum] = "1f934b076ed49eace203655ec249fc7861a6b8e87fe4aef732e47b6e485b6293"
 
 S = "${WORKDIR}/flashrom-v${PV}"
 
-- 
2.43.0


