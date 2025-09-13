Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06722CAC587
	for <webhook@archiver.kernel.org>; Sat, 13 Sep 2025 10:22:18 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.2535.1757758932926894830
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Sep 2025 03:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DyWNIpKh;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b0418f6fc27so466524466b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 03:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757758931; x=1758363731; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=amsaIKI4WmCH8lKYn1E8zNgzCMB/l2sQdI7IX5XBvEI=;
        b=DyWNIpKhp5CVA4voj+Nruni4WMOBs0O5yn3FQj8Z/7Nr9Y3keIyZTXtmNK5YW03bkR
         9ZWKbaXt1MzxZkcuZKxlzDdp52P+n5yWKGBrlVOmbq00r92M43UQr7eWLThXb4fAA7Ud
         QdGYrWm2TIlWRqsJgBbOJ4STv9gvinv8Yp5EIpMDgkukmUgXDaF3it4A/Cen/YZdRO/i
         5TTmguMx1h7kwd/EQ99BqBaSzdT+pfaIk5EaArrpg2U6pW3m1QaWm5PJ2kCgQAq2ca/y
         wEQAu3gIyYVo3nzb7pF8AbJBFgSAshdBwGK8f7FTU0jFj9OVaJexbkm19uxW+1I00UNG
         XBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757758931; x=1758363731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=amsaIKI4WmCH8lKYn1E8zNgzCMB/l2sQdI7IX5XBvEI=;
        b=i1f5B1WbW7biDpIL9nvvvZFhiMNzOAgATYZqsYYyhEW/yCLAWnPomeeh6/PeH+zqm9
         AxtfT643eYXDnb9ao2R/guhnJWvjS2/tApunbcYiUUFmSfano6WOuVZ2vUMwREq0sQbh
         Yx02rbjbL4tg4rp2RYmTbbXhmdeSwPBbj0FSdcG5GQMPlQp7zY0ftc+SXL1dMRDFlooy
         nwiRKCJRDbY5Ih6mfxEihjQw9DFhPpS5GkTLaZibP4o4+/r/zC6eUMdY2aMvpqDqeUph
         artD2Rli9ct997GFgW9O73viHV9xSbuPb/L4UhjpUGD41/3tK5paU6HNlmEONqTBTJyB
         56hQ==
X-Gm-Message-State: AOJu0Yy7IIrPxgkcOy1wWCdJnmo7qgvWKLjyb/N9f4jJY+AwmNc3c8AP
	xwpNvryDsWCO9banP+ZDd1CpEosuQzsMjTzA9kasWzb3kfghoNUVUjuTfi9Hdg==
X-Gm-Gg: ASbGncuY85RGZonzQXPdvMx24KyoukDdeuEFjiSEBVtGhH9bvmex/8ubZjf74QN4bet
	GhV4g0vfxVmwZoZN5Q4HIW1CkbkBshSIfzIzBu5/nRoceVh4JqLLunYHGc0ldC7M50vf847oaEI
	ndycJr0OsLAraDBrRdwi8kmoxymlj5AXqSFhZHz/8QQYB1tZesG/5hmhA7Thi9yZIrwB/UnsbOm
	di3WEqSwQ59PGDnMOXd0LpnZwhRLmKT3xUcjIrYg1yByIWu1AU9+B1n02dAQw7t1ci5/8hL/Qyd
	AU7hpQbWw32h/smdq2yc/8OPFWG7etFpdsUWjxhiykJWBTa3JRctHhlhHJkMO1OJGbgrZGOc8uI
	GvD0CWATZ8KfTcRLv8+wr
X-Google-Smtp-Source: AGHT+IFtIcTh51nrHhF1Jj0xnaQP5wOaLJqFTcgpMaofajXPPH3CKtiNjFEDdSRrAf2qG0p8Y0dbyQ==
X-Received: by 2002:a17:907:9623:b0:b04:7ef0:9dd6 with SMTP id a640c23a62f3a-b07c3675db7mr584691766b.55.1757758930957;
        Sat, 13 Sep 2025 03:22:10 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07df92dea6sm148857466b.26.2025.09.13.03.22.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 03:22:09 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] ledmon: upgrade 0.97 -> 1.1.0
Date: Sat, 13 Sep 2025 12:22:08 +0200
Message-ID: <20250913102208.2110642-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 10:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119383

Dropped 0001-fix-build-with-clang.patch, because it was independently
submitted to upstream, and it is included in this release.

This update also fixes building for x86 platform.

Changelog:
https://github.com/intel/ledmon/blob/main/CHANGELOG.md

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
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

