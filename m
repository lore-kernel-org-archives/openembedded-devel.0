Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3333CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 07:57:14 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.7186.1758700633614999675
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 00:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NOgv/Fl8;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-42575d46250so28356305ab.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 00:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758700633; x=1759305433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTpG5knluwe/LKD2Y0ZMKkYH+tJZ7LzdNnYAbjHYyQw=;
        b=NOgv/Fl8/sz0IuwFVjZxC/Jv7rZkdC9rV1sSfniQWbVd9qMXs5cXe2jHKOadodhq15
         d0Sh7Nt31o4wktZeyc/YjJsAJYMmxvqKzP9VaQuJi8k4M4xV/OeuW0efEkEWRWz0ESIV
         0BfdMxPvAtV+XPE+Qadiqky+dBiyB9Ivt4ukuhU/8w1BPOH8pCvsgE1O1phMRg7AAHob
         wK94e69iG9L45EgIlqCIU0Cf3Xd5J/3ZZH5/Y2zpUvlZCOXrh7itEyBR/yEoNaAa9rUD
         3KdjdEhYZxeloA35dBISY/3aR6wwpCySF7ZCTKUgoj7pEA3u2NCsMyp75QJQEbNma4rx
         MNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758700633; x=1759305433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lTpG5knluwe/LKD2Y0ZMKkYH+tJZ7LzdNnYAbjHYyQw=;
        b=iLAXGTaq4qt6HwBb93j+8ygYkUhHZjaZogZKslMI8FABgWT7I/LD9AMOGpOOxIUn06
         pP1zJGffuAavqfVK4d8n3vGAtqtMgw9kmKeXG0+j5FvqRA6deaV0U1JmkCVn1MEhuwWf
         gD1UonJoMoOdYm3+yOuxBCyrTyX/LjVxSxXTu/uBMAA5SYm4OWH8OHqktmOWXSRW34EE
         VhHez6iqm+MAfOKcdtJrJ4idcGg7A9jFPw2ZAMxLF+NwWV9mNpcGO1Aadws4ThsE5vSi
         PYKBUUSIVcOpTFNqI5NTmOb4TijDLixaj4WkF6798prGVqkj2FOifxgUj2ECOhPvuOaX
         cixg==
X-Gm-Message-State: AOJu0Yyfual+qcsWSHYWKo245y9PjHOwi0uc82eFJpTI14SVXjcdxSzN
	GRzHxDZFRFEnJy5N/ykcNDLKqNHFmwnxxl08faxap9zQ8WXJGiaBs7d6k/YOSg==
X-Gm-Gg: ASbGncsGn0eVIKYkuCy/PcVJ9EKa4P3ijy3QysouOCVQCooqs7nRuK7lhSiIswQV5yZ
	1sHYowiaAgh8fH9gH9nfGmBvqm2IfBd40ui0yIOTDBrS2maC+c6C8FAdSvTFcf0nWO7k5ZUpWOi
	vx51KROSXp8nxvcEB+R9wQG0pIP3so4j5ez0eQcmIa6833kgVrYvDg1z/X2N65y2AL0cbTXK5K8
	LK1Go7qGdo7ymd7HcbfCYOe52gIo9OGZiMDWuwIG/yv7w20+GXfr9zuzgYLQYLvR4SiNJnlE8Ty
	8Oj+ldUUazw5ZNR5EoAZaCDVT/uUVD9V1IpgboeO+xTF3QoC4gPsefCjHeiLZD+11a7eHO3YrCE
	a2opx5+6MQLN1b0dcveagROrj8bkJrFPoMFpEpXZqw5ZUD2HsIuln
X-Google-Smtp-Source: AGHT+IEaidrzdSxegSAImEj2giPyk8XQWebGjp5eQkVGle9VhY/AiC9X5scAIhqOqgIQnrr6/8dNGg==
X-Received: by 2002:a05:6e02:216f:b0:424:771:418e with SMTP id e9e14a558f8ab-42581eb55d0mr91105745ab.30.1758700632667;
        Wed, 24 Sep 2025 00:57:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.216.253])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-55dba4465f4sm3203576173.37.2025.09.24.00.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 00:57:12 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 5/6] ledmon: upgrade 0.97 -> 1.1.0
Date: Wed, 24 Sep 2025 19:56:42 +1200
Message-ID: <20250924075643.2047506-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
References: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 07:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119760

From: Gyorgy Sarvari <skandigraun@gmail.com>

Dropped 0001-fix-build-with-clang.patch, because it is included in this release.

This update also fixes building for x86 platform.

Changelog:
https://github.com/intel/ledmon/blob/main/CHANGELOG.md

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 219f5c96cc744c73b732ddfb7c62d0448aa565ae)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ledmon/0001-fix-build-with-clang.patch    | 90 -------------------
 ...nclude-sys-select.h-and-sys-types.h.patch} | 27 ++----
 .../{ledmon_0.97.bb => ledmon_1.1.0.bb}       | 10 +--
 3 files changed, 13 insertions(+), 114 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch
 rename meta-oe/recipes-bsp/ledmon/ledmon/{0002-include-sys-select.h-and-sys-types.h.patch => 0001-include-sys-select.h-and-sys-types.h.patch} (56%)
 rename meta-oe/recipes-bsp/ledmon/{ledmon_0.97.bb => ledmon_1.1.0.bb} (79%)

diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch
deleted file mode 100644
index f1e1d6f780..0000000000
--- a/meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 28fd86fb4e18af181174176530a80672de4449d2 Mon Sep 17 00:00:00 2001
-From: alperak <alperyasinak1@gmail.com>
-Date: Sat, 18 Nov 2023 12:27:17 +0300
-Subject: [PATCH] fix build with clang
-
-struct ibpi2value is a structure which contains 2 unsigned integers.  In
-a number of cases the code was not initializing a value for the last value
-in the pair in struct ibpi2value ibpi_to_attention.  This was raised when
-using clang compiler.
-
-vmdssd.c:49:27: error: missing field 'value' initializer
-[-Werror,-Wmissing-field-initializers]
-        {LED_IBPI_PATTERN_UNKNOWN}
-
-dellssd.c:74:27: error: missing field 'value' initializer
-[-Werror,-Wmissing-field-initializers]
-        {LED_IBPI_PATTERN_UNKNOWN}
-
-amd_ipmi.c:57:27: error: missing field 'value'
-initializer [-Werror,-Wmissing-field-initializers]
-        {LED_IBPI_PATTERN_UNKNOWN}
-
-npem.c:76:27: error: missing field 'value'
-initializer [-Werror,-Wmissing-field-initializers]
-        {LED_IBPI_PATTERN_UNKNOWN}
-
-Upstream-Status: Submitted [https://github.com/intel/ledmon/pull/179]
-Signed-off-by: alperak <alperyasinak1@gmail.com>
----
- src/amd_ipmi.c | 2 +-
- src/dellssd.c  | 2 +-
- src/npem.c     | 2 +-
- src/vmdssd.c   | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/amd_ipmi.c b/src/amd_ipmi.c
-index 726f77d..ad36e9e 100644
---- a/src/amd_ipmi.c
-+++ b/src/amd_ipmi.c
-@@ -53,7 +53,7 @@ const struct ibpi2value ibpi2amd_ipmi[] = {
- 	{IBPI_PATTERN_FAILED_ARRAY, 0x45},
- 	{IBPI_PATTERN_REBUILD, 0x46},
- 	{IBPI_PATTERN_HOTSPARE, 0x47},
--	{IBPI_PATTERN_UNKNOWN}
-+	{IBPI_PATTERN_UNKNOWN, 0}
- };
- 
- #define MG9098_CHIP_ID_REG	0x63
-diff --git a/src/dellssd.c b/src/dellssd.c
-index 3c10ec7..7f02ea1 100644
---- a/src/dellssd.c
-+++ b/src/dellssd.c
-@@ -71,7 +71,7 @@ static const struct ibpi2value ibpi2ssd[] = {
- 	{IBPI_PATTERN_FAILED_DRIVE, BP_FAULT | BP_ONLINE},
- 	{IBPI_PATTERN_LOCATE, BP_IDENTIFY | BP_ONLINE},
- 	{IBPI_PATTERN_LOCATE_OFF, BP_ONLINE},
--	{IBPI_PATTERN_UNKNOWN}
-+	{IBPI_PATTERN_UNKNOWN, 0}
- };
- 
- #define DELL_OEM_NETFN                      0x30
-diff --git a/src/npem.c b/src/npem.c
-index c21276d..3499169 100644
---- a/src/npem.c
-+++ b/src/npem.c
-@@ -72,7 +72,7 @@ const struct ibpi2value ibpi_to_npem_capability[] = {
- 	{IBPI_PATTERN_FAILED_DRIVE, PCI_NPEM_FAIL_CAP},
- 	{IBPI_PATTERN_LOCATE, PCI_NPEM_LOCATE_CAP},
- 	{IBPI_PATTERN_LOCATE_OFF, PCI_NPEM_OK_CAP},
--	{IBPI_PATTERN_UNKNOWN}
-+	{IBPI_PATTERN_UNKNOWN, 0}
- };
- 
- static struct pci_access *get_pci_access()
-diff --git a/src/vmdssd.c b/src/vmdssd.c
-index 51af591..9c63d90 100644
---- a/src/vmdssd.c
-+++ b/src/vmdssd.c
-@@ -45,7 +45,7 @@ struct ibpi2value ibpi_to_attention[] = {
- 	{IBPI_PATTERN_REBUILD, ATTENTION_REBUILD},
- 	{IBPI_PATTERN_LOCATE_OFF, ATTENTION_OFF},
- 	{IBPI_PATTERN_ONESHOT_NORMAL, ATTENTION_OFF},
--	{IBPI_PATTERN_UNKNOWN}
-+	{IBPI_PATTERN_UNKNOWN, 0}
- };
- 
- #define SYSFS_PCIEHP         "/sys/module/pciehp"
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0002-include-sys-select.h-and-sys-types.h.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-include-sys-select.h-and-sys-types.h.patch
similarity index 56%
rename from meta-oe/recipes-bsp/ledmon/ledmon/0002-include-sys-select.h-and-sys-types.h.patch
rename to meta-oe/recipes-bsp/ledmon/ledmon/0001-include-sys-select.h-and-sys-types.h.patch
index 75bf2b4f5e..833f38a042 100644
--- a/meta-oe/recipes-bsp/ledmon/ledmon/0002-include-sys-select.h-and-sys-types.h.patch
+++ b/meta-oe/recipes-bsp/ledmon/ledmon/0001-include-sys-select.h-and-sys-types.h.patch
@@ -9,16 +9,19 @@ sys/types.h is needed for ssize_t
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Adapted to latest release - sys/types.h is already included in the project.
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 ---
  src/dellssd.c | 1 +
- src/utils.h   | 1 +
- 2 files changed, 2 insertions(+)
+ 1 file changed, 1 insertion(+)
 
-diff --git a/src/dellssd.c b/src/dellssd.c
+diff --git a/src/lib/dellssd.c b/src/lib/dellssd.c
 index 7b8d431..e97fe45 100644
---- a/src/dellssd.c
-+++ b/src/dellssd.c
-@@ -27,6 +27,7 @@
+--- a/src/lib/dellssd.c
++++ b/src/lib/dellssd.c
+@@ -13,6 +13,7 @@
  #include <unistd.h>
  
  #include <sys/ioctl.h>
@@ -26,18 +29,6 @@ index 7b8d431..e97fe45 100644
  #include <linux/ipmi.h>
  
  #if _HAVE_DMALLOC_H
-diff --git a/src/utils.h b/src/utils.h
-index 720447a..c106529 100644
---- a/src/utils.h
-+++ b/src/utils.h
-@@ -21,6 +21,7 @@
- #define _UTILS_H_INCLUDED_
- 
- #include <getopt.h>
-+#include <sys/types.h>
- #include "config_file.h"
- #include "stdlib.h"
- #include "stdint.h"
 -- 
 2.21.0
 
diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb b/meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb
similarity index 79%
rename from meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
rename to meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb
index 23a49a7d1b..eba5428856 100644
--- a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
+++ b/meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb
@@ -8,18 +8,16 @@ HOMEPAGE = "https://github.com/intel/ledmon"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "sg3-utils udev pciutils"
+DEPENDS = "autoconf-archive-native sg3-utils udev pciutils"
 
 inherit autotools systemd pkgconfig
 
 SYSTEMD_SERVICE:${PN} = "ledmon.service"
 
-SRC_URI = "git://github.com/intel/ledmon;branch=master;protocol=https \
-	   file://0002-include-sys-select.h-and-sys-types.h.patch \
-	   file://0001-fix-build-with-clang.patch \
-	   file://Correct-get_uint64.patch"
+SRC_URI = "git://github.com/intel/ledmon;branch=master;protocol=https;tag=v${PV} \
+	   file://0001-include-sys-select.h-and-sys-types.h.patch"
 
-SRCREV = "b0edae14e8660b80ffe0384354038a9f62e2978d"
+SRCREV = "f70201d255b667de00f15880e99732699df6dce0"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 COMPATIBLE_HOST:libc-musl = "null"

