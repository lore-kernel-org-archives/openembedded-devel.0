Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08702CAC58E
	for <webhook@archiver.kernel.org>; Sat, 13 Sep 2025 10:25:58 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.2534.1757759149328839759
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Sep 2025 03:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l9ju5+eO;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b079c13240eso441484866b.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 03:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757759148; x=1758363948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1lP8hIjBYt1H7vaBLsjZHodwhCaTYhC+Of2QnRcuxo=;
        b=l9ju5+eOr6zjI8aG4AEiARWsQMPERW/jjX1FnODiJczbfL0m46PHqxr5fMC+e66YRG
         19JPQJ/Lk4iSvRbO3oIPFb+moI5Q7+RY4rkWOdJeQQ9Ly39N4F2A2k6HZ5yFK5AC9Gdd
         Pb+2vblqYWuafig8hqSy0iPq643mWIYp2pOpDtpbSHzcDRKVqV84IhzWjNKtfgB279kT
         0KtJhPXJ45UeiP1ud6A9BYj18lz1u5FCmweULVCJGxsQXTzdGLbGknZEHbdUiKrB+KPN
         Yd9ALVly7dTS8oOLzJlLAZxhdRXWXzNOv8HilGmv0J2EIqDH+ZUTSaDhuM+1XPzYXKjm
         HVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757759148; x=1758363948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1lP8hIjBYt1H7vaBLsjZHodwhCaTYhC+Of2QnRcuxo=;
        b=lEQQK9j01wwAL1+SgErFpbqjrgtPwiprcR2TQUvs1r84fC3i3AP+NGbSIAeRTcLlWq
         Jri/0bUKU3ZXwY+OmRSvctFB6zFLplyFAVqu3qhbRa0ITiM+E4CLW3OWdTgO9WslzOuz
         gH+Kze2jl/luG9ilKwD6wYf38/99rybQudGpTDCWxA/4RBoTgR9dyzEQJtnZGLsltSd0
         6iz4sMnMtgsZVWgAuG1pd9R+nObOU5glwZQ4ubL+Li+gDLG4ycCgc0JwmDdB/szG3Ho1
         WX8pKVSpXW3M1BRVvleGMTD7kkpkDRCtt3glKGG+fNQA6iVwslBH77+OFDPo2wWK5j3T
         zmGQ==
X-Gm-Message-State: AOJu0YwS8+lyB5A4Ea5TG/8oxWnJKj5afIvviCkWbSGFdxsapppmLHuB
	wxKixurMAQYWgh8jKoEYPSRimr6TrIElCV6jXT+IZzszLSyekCSFPS3yWoG54w==
X-Gm-Gg: ASbGnctq4jhCud2XnJv1TzPQnMWhQC+QSIxWepSwFo/y4saLEepV/+ba1hud2KefJGJ
	QJ9Yzgi5fhXOV8ZFPCn32I5ch0C6jYdTjF88lGDNCvICmLaGLYycAnRKf4cbBfBLfPZzqcYmKa/
	5ek3AApZu81fnGwz8DWyewtYzoDZBM5iNT4oStyjMJfYfbFk2DAMR5vljD5UQCkuWm5l3D/k+sM
	Wnof1UtNfuX1FLB3YeqKSkq9l3xJlxDRKIRdHty7zsGalxToJDPE2+tKUZw1Xxu+fj32/02fIYB
	DZhSsVlcW1QmuW6sGJcDzdV8Bl2ZJNRvk3unsDYIjhnKqoel0L/7vy4xTzgQmFwWtAS4ODTGVW+
	NNdL5/Lc61cYR7h0ydIQEuOcXImikqnk=
X-Google-Smtp-Source: AGHT+IGpwOA3fcT0wLsIIO9JJHxpdkvMG5clv5+EW5A8T8lTN90X7Xop7/gEvyPq53CwwZyyeat9MA==
X-Received: by 2002:a17:906:6a10:b0:afe:e4d2:6d6d with SMTP id a640c23a62f3a-b07c35b8bf3mr616946666b.16.1757759147459;
        Sat, 13 Sep 2025 03:25:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec81dfa51sm4636541a12.52.2025.09.13.03.25.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 03:25:47 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] ledmon: upgrade 0.97 -> 1.1.0
Date: Sat, 13 Sep 2025 12:25:46 +0200
Message-ID: <20250913102546.2142093-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 10:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119384

Dropped 0001-fix-build-with-clang.patch, because it is included in this release.

This update also fixes building for x86 platform.

Changelog:
https://github.com/intel/ledmon/blob/main/CHANGELOG.md

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: revised commit message, otherwise identical to v1

 .../ledmon/0001-fix-build-with-clang.patch    | 90 -------------------
 ...nclude-sys-select.h-and-sys-types.h.patch} | 27 ++----
 .../{ledmon_0.97.bb => ledmon_1.1.0.bb}       |  9 +-
 3 files changed, 13 insertions(+), 113 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch
 rename meta-oe/recipes-bsp/ledmon/ledmon/{0002-include-sys-select.h-and-sys-types.h.patch => 0001-include-sys-select.h-and-sys-types.h.patch} (56%)
 rename meta-oe/recipes-bsp/ledmon/{ledmon_0.97.bb => ledmon_1.1.0.bb} (81%)

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
similarity index 81%
rename from meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
rename to meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb
index ff3b29406b..25f638be5d 100644
--- a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
+++ b/meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb
@@ -8,17 +8,16 @@ HOMEPAGE = "https://github.com/intel/ledmon"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "sg3-utils udev pciutils"
+DEPENDS = "autoconf-archive-native sg3-utils udev pciutils"
 
 inherit autotools systemd pkgconfig
 
 SYSTEMD_SERVICE:${PN} = "ledmon.service"
 
-SRC_URI = "git://github.com/intel/ledmon;branch=master;protocol=https \
-	   file://0002-include-sys-select.h-and-sys-types.h.patch \
-	   file://0001-fix-build-with-clang.patch"
+SRC_URI = "git://github.com/intel/ledmon;branch=master;protocol=https;tag=v${PV} \
+	   file://0001-include-sys-select.h-and-sys-types.h.patch"
 
-SRCREV = "b0edae14e8660b80ffe0384354038a9f62e2978d"
+SRCREV = "f70201d255b667de00f15880e99732699df6dce0"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 COMPATIBLE_HOST:libc-musl = "null"

