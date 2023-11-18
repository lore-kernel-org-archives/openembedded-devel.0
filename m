Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D56C2BB3F
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 09:52:52 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.5850.1700301170794627526
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Nov 2023 01:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MNasOH1F;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5401bab7525so3963985a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 01:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700301169; x=1700905969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HS/esOZh1v3erYsUurhrQaLjkxPnfsUb48CmCn+kP6I=;
        b=MNasOH1FYnn3Smh3RN+GupDSL5KlM1gyqHAGKh80W/yQADzH2ajM6q9FXX5sPh6xru
         3VT5ZGl1GKEYFaL0+v6LZAq7fnbgCKQ3bcrZ95Gn00J97LN6lWIhRFYcc2z3TCiKLEm+
         NGRivF86DYrFhWnl5l6yIvqoHF8Y/2C5VdIh/ue91lWT+Z8UL6k3o5ePMsGi6lpWAX9h
         LLJzHXJZye002tpVh0yRC6VYN8yqKKXXrKxUDoIO6IYdNl/5Mf667d7AfAFtRESSzZmJ
         0SRImzNgmIK8lN3L2gdvE1vAOVBdiw4rEvDV7lqUywpqJqR5g4h/816D3NTTXcNld92P
         G0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700301169; x=1700905969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HS/esOZh1v3erYsUurhrQaLjkxPnfsUb48CmCn+kP6I=;
        b=QDHWud2EpDpZI4k5lE6jwSE63pe96y5vA5K7QeobCL57OwC2bWyQri/T8gfjzSHpra
         OGiEkeBqkKLVpp94C7AWgVQe1uNh1yuKBD1ZtM6ukPgYXs7j6OHRyebCuhWM40f/+p6w
         fFzhlp7jqFWnoYE/Md1muOo7jDgOI8zO/zt1IeujpVdJLaiMDAE2JPtZo+cvhMnynigQ
         AybaIQfBFHRg+GhWrpgBkOhzKVjvjnfiwPmv1jQzlHT8BQww2ITCl+NH/wQxcYjfJgKz
         t0iYCdFdXjEKCM9pUoj7z5T0ihUlrLtzYPC65ZlJ+KmcvtjmVqTplF44/DvhReC9aj3V
         2Ogw==
X-Gm-Message-State: AOJu0Yxxvq0rrUDb7tfRemZBOkpVSXAnvGydKKk/VkDBqP0P249XNZb3
	cJ5XVfUXlBv/RnjZtsmnYoVxCxktW8VASA==
X-Google-Smtp-Source: AGHT+IGsiPceqIIK5B0e8dqJ+C7suGNYZkT5H9LKkXFVhwX1pjwJMrMfNycD6/auQhL0bLuT6uVYtg==
X-Received: by 2002:aa7:d409:0:b0:543:caf4:e5bc with SMTP id z9-20020aa7d409000000b00543caf4e5bcmr1299416edq.1.1700301168304;
        Sat, 18 Nov 2023 01:52:48 -0800 (PST)
Received: from localhost.localdomain ([176.33.67.108])
        by smtp.gmail.com with ESMTPSA id t8-20020a05640203c800b005402748cf29sm1537553edw.50.2023.11.18.01.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 01:52:47 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] ledmon: upgrade 0.93 -> 0.97
Date: Sat, 18 Nov 2023 12:52:25 +0300
Message-Id: <20231118095225.222275-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 09:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106883

* Added 0001-fix-build-with-clang.patch to fix build error caused by missing 'value' initializer

* License changed GPL-2.0-only -> LGPL-2.0-only

  - LIC_FILES_CHKSUM changed COPYING -> COPYING.LIB for LGPL-2.0-only
  - Changed license headers in required source files.
  - Changed copyright years to 2022 in modified files.

* 0001-Don-t-build-with-Werror-to-fix-compile-error.patch removed because fixed in the new version.

* libpci was added as depends following this error -> configure: error: Package requirements (libpci) were not met: No package 'libpci' found

* pkgconfig added as inherit following this error -> PKG_PROG_PKG_CONFIG: command not found

Changelog:

It can be followed here: https://github.com/intel/ledmon/releases

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...ild-with-Werror-to-fix-compile-error.patch | 30 -------
 .../ledmon/0001-fix-build-with-clang.patch    | 90 +++++++++++++++++++
 .../ledmon/{ledmon_git.bb => ledmon_0.97.bb}  | 18 ++--
 3 files changed, 98 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
 create mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch
 rename meta-oe/recipes-bsp/ledmon/{ledmon_git.bb => ledmon_0.97.bb} (71%)

diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
deleted file mode 100644
index 09f4993a2..000000000
--- a/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Subject: [PATCH] Don't build with -Werror to fix compile error.
-
-|   550 |  _dump_sgpio_amd(&amd_reg->amd);
-|       |                  ^~~~~~~~~~~~~
-| amd_sgpio.c: In function '_write_amd_register':
-| amd_sgpio.c:558:18: error: taking address of packed member of 'struct amd_register' may result in an unaligned pointer value [-Werror=address-of-packed-member]
-
-Upstream-Status: Submitted
-https://github.com/intel/ledmon/pull/48/commits
-
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7bc20f8..7e01bd5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -22,7 +22,6 @@ AX_AM_CFLAGS_ADD([-Werror=format-truncation=1])
- AX_AM_CFLAGS_ADD([-Werror=shift-negative-value])
- AX_AM_CFLAGS_ADD([-Werror=alloca])
- AX_AM_CFLAGS_ADD([-Werror=missing-field-initializers])
--AX_AM_CFLAGS_ADD([-Werror])
- AX_AM_CFLAGS_ADD([-Werror=format-signedness])
- 
- AC_SUBST([AM_CFLAGS])
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch
new file mode 100644
index 000000000..f1e1d6f78
--- /dev/null
+++ b/meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch
@@ -0,0 +1,90 @@
+From 28fd86fb4e18af181174176530a80672de4449d2 Mon Sep 17 00:00:00 2001
+From: alperak <alperyasinak1@gmail.com>
+Date: Sat, 18 Nov 2023 12:27:17 +0300
+Subject: [PATCH] fix build with clang
+
+struct ibpi2value is a structure which contains 2 unsigned integers.  In
+a number of cases the code was not initializing a value for the last value
+in the pair in struct ibpi2value ibpi_to_attention.  This was raised when
+using clang compiler.
+
+vmdssd.c:49:27: error: missing field 'value' initializer
+[-Werror,-Wmissing-field-initializers]
+        {LED_IBPI_PATTERN_UNKNOWN}
+
+dellssd.c:74:27: error: missing field 'value' initializer
+[-Werror,-Wmissing-field-initializers]
+        {LED_IBPI_PATTERN_UNKNOWN}
+
+amd_ipmi.c:57:27: error: missing field 'value'
+initializer [-Werror,-Wmissing-field-initializers]
+        {LED_IBPI_PATTERN_UNKNOWN}
+
+npem.c:76:27: error: missing field 'value'
+initializer [-Werror,-Wmissing-field-initializers]
+        {LED_IBPI_PATTERN_UNKNOWN}
+
+Upstream-Status: Submitted [https://github.com/intel/ledmon/pull/179]
+Signed-off-by: alperak <alperyasinak1@gmail.com>
+---
+ src/amd_ipmi.c | 2 +-
+ src/dellssd.c  | 2 +-
+ src/npem.c     | 2 +-
+ src/vmdssd.c   | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/amd_ipmi.c b/src/amd_ipmi.c
+index 726f77d..ad36e9e 100644
+--- a/src/amd_ipmi.c
++++ b/src/amd_ipmi.c
+@@ -53,7 +53,7 @@ const struct ibpi2value ibpi2amd_ipmi[] = {
+ 	{IBPI_PATTERN_FAILED_ARRAY, 0x45},
+ 	{IBPI_PATTERN_REBUILD, 0x46},
+ 	{IBPI_PATTERN_HOTSPARE, 0x47},
+-	{IBPI_PATTERN_UNKNOWN}
++	{IBPI_PATTERN_UNKNOWN, 0}
+ };
+ 
+ #define MG9098_CHIP_ID_REG	0x63
+diff --git a/src/dellssd.c b/src/dellssd.c
+index 3c10ec7..7f02ea1 100644
+--- a/src/dellssd.c
++++ b/src/dellssd.c
+@@ -71,7 +71,7 @@ static const struct ibpi2value ibpi2ssd[] = {
+ 	{IBPI_PATTERN_FAILED_DRIVE, BP_FAULT | BP_ONLINE},
+ 	{IBPI_PATTERN_LOCATE, BP_IDENTIFY | BP_ONLINE},
+ 	{IBPI_PATTERN_LOCATE_OFF, BP_ONLINE},
+-	{IBPI_PATTERN_UNKNOWN}
++	{IBPI_PATTERN_UNKNOWN, 0}
+ };
+ 
+ #define DELL_OEM_NETFN                      0x30
+diff --git a/src/npem.c b/src/npem.c
+index c21276d..3499169 100644
+--- a/src/npem.c
++++ b/src/npem.c
+@@ -72,7 +72,7 @@ const struct ibpi2value ibpi_to_npem_capability[] = {
+ 	{IBPI_PATTERN_FAILED_DRIVE, PCI_NPEM_FAIL_CAP},
+ 	{IBPI_PATTERN_LOCATE, PCI_NPEM_LOCATE_CAP},
+ 	{IBPI_PATTERN_LOCATE_OFF, PCI_NPEM_OK_CAP},
+-	{IBPI_PATTERN_UNKNOWN}
++	{IBPI_PATTERN_UNKNOWN, 0}
+ };
+ 
+ static struct pci_access *get_pci_access()
+diff --git a/src/vmdssd.c b/src/vmdssd.c
+index 51af591..9c63d90 100644
+--- a/src/vmdssd.c
++++ b/src/vmdssd.c
+@@ -45,7 +45,7 @@ struct ibpi2value ibpi_to_attention[] = {
+ 	{IBPI_PATTERN_REBUILD, ATTENTION_REBUILD},
+ 	{IBPI_PATTERN_LOCATE_OFF, ATTENTION_OFF},
+ 	{IBPI_PATTERN_ONESHOT_NORMAL, ATTENTION_OFF},
+-	{IBPI_PATTERN_UNKNOWN}
++	{IBPI_PATTERN_UNKNOWN, 0}
+ };
+ 
+ #define SYSFS_PCIEHP         "/sys/module/pciehp"
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb b/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
similarity index 71%
rename from meta-oe/recipes-bsp/ledmon/ledmon_git.bb
rename to meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
index dbfd1e7bc..d431fd9a8 100644
--- a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
+++ b/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
@@ -5,28 +5,26 @@ DESCRIPTION = "The utilities are designed primarily to be used on storage server
 "
 HOMEPAGE = "https://github.com/intel/ledmon"
 
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-"
+LICENSE = "LGPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "sg3-utils udev"
+DEPENDS = "sg3-utils udev pciutils"
 
-inherit autotools systemd
+inherit autotools systemd pkgconfig
 
 SYSTEMD_SERVICE:${PN} = "ledmon.service"
 
-# 0.93
 SRC_URI = "git://github.com/intel/ledmon;branch=master;protocol=https \
-           file://0002-include-sys-select.h-and-sys-types.h.patch \
-           file://0001-Don-t-build-with-Werror-to-fix-compile-error.patch \
-          "
+	   file://0002-include-sys-select.h-and-sys-types.h.patch \
+	   file://0001-fix-build-with-clang.patch"
 
-SRCREV = "1d72f9cb5c9163b2ecdf19709935720e65f5b90e"
+SRCREV = "b0edae14e8660b80ffe0384354038a9f62e2978d"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 COMPATIBLE_HOST:libc-musl = "null"
 
 S = "${WORKDIR}/git"
+
 EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}' CFLAGS='${CFLAGS}'"
 
 # The ledmon sources include headers in ${S}/config to build but not in CFLAGS. 
-- 
2.25.1


