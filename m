Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.3493.1618693600421624426
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bjqHnx3/;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id p67so15683902pfp.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1ocuGBUlD/hnTRxqM5uDz/WgmfEowrtGSEsUGb6aouM=;
        b=bjqHnx3/lgTcizFu3Mzj/yh2PW6n+Pyr2DIOeguvtbwgdx0JBZq8OhFTxZb+GTXlzn
         sdF4P8icaLoPT5mHPIy0DfbFBYM2nxSjZNUvcohiO21u/0UqQfxG8oGavBhlrt/yhSaH
         DwdQCvpsfHkTFORBfXzS9N0dpVbBE+EYzL/5sDLmvO3YmTNSpNBU+ne3Sj8FPdIddoCt
         UvJ5Av9M3Qxxenr0U+0FM+Jt/hzBbSJXMo1EltyXIJZLDjVDVQdMJMImUrX3yuxgB3+C
         yVKAF2E2zTxuBwK6PvaWdHG6bzNjPQx/j2CGd89L72AeMxz5W8ollJ6zMRUC2WT6Wegk
         DLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1ocuGBUlD/hnTRxqM5uDz/WgmfEowrtGSEsUGb6aouM=;
        b=nAJTqlRZ1lRj0ghck3kl5DwEBW6BFZTWVMIws0JixVcyab0hgAg7r5hoyEUjOXrehf
         zqWE6Pwp57FY9PFBsCPqFc5vCTXulr3jB94oF31cgNlcu8YxkalxbdVGqYBEcLePiPq7
         LbHbhf9ib3RhSOLEryuCVTq8525avpvhUAnI4SHikyrOjsq9KtWW774xpvGS23SSOfMN
         fm01Ds+ZYRmGGuh4OaLIQ9mH3I7r+gPSD4CzmharI78cHlGYivSky1EcQjuE3VMkTFTq
         ljj2O5k3Du7d3E8sbLIa1aWYYyecohYpPhAJFSL4hAPzDtmOZ2NrSWsHsVVSN9pgmaRY
         N37A==
X-Gm-Message-State: AOAM532cSbgbOxzGIIVZetx/VqoMQHD1YqpZB6VFdi3ye+PIHtvPluid
	ubu1aJgpVYOuUZci8sq28U3llTsjJUFInw==
X-Google-Smtp-Source: ABdhPJw/rf+5TExPl7uvJMTZkt1pIm9ExKLStSxojYXq5pFTAAgVgTkaHEEXxR/rWf2UoJDzMreqYA==
X-Received: by 2002:aa7:904b:0:b029:250:991e:315 with SMTP id n11-20020aa7904b0000b0290250991e0315mr13217051pfo.70.1618693599449;
        Sat, 17 Apr 2021 14:06:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:39 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 41/50] fwts: upgrade to 21.03.00
Date: Sat, 17 Apr 2021 14:05:50 -0700
Message-Id: <dd632f78e6dfcc40148c6f8f1f30c772bfadc268.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Ross Burton <ross@burtonini.com>

Rebase the musl patches.

Drop json-c dependency as this is no longer used.

Drop FILES_${PN}-dbg packaging as this happens magically now.

Drop -Wno-error CFLAGS as we patch out -Werror entirely.

Add dtc RDEPENDS as this is needed at runtime.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b7b0bcb4fed0477ee22066b387c0f49eaa5dc262)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...d-correct-printf-qualifier-for-off_t.patch | 20 ++++++----
 ....h-instead-of-deprecated-sys-poll.h.patch} | 12 +++---
 ...ch => 0003-Remove-Werror-from-build.patch} | 18 ++++++---
 ...__SWORD_TYPE-if-not-defined-by-libc.patch} | 12 +++---
 ...ZE.patch => 0005-Undefine-PAGE_SIZE.patch} | 10 +++--
 ...t-to-fix-pointer-to-int-cast-issues.patch} | 37 ++++++++-----------
 .../{fwts_20.07.00.bb => fwts_21.03.00.bb}    | 18 ++++-----
 7 files changed, 69 insertions(+), 58 deletions(-)
 rename meta-oe/recipes-test/fwts/fwts/{0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch => 0002-Include-poll.h-instead-of-deprecated-sys-poll.h.patch} (81%)
 rename meta-oe/recipes-test/fwts/fwts/{0001-Remove-Werror-from-build.patch => 0003-Remove-Werror-from-build.patch} (74%)
 rename meta-oe/recipes-test/fwts/fwts/{0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch => 0004-Define-__SWORD_TYPE-if-not-defined-by-libc.patch} (79%)
 rename meta-oe/recipes-test/fwts/fwts/{0003-Undefine-PAGE_SIZE.patch => 0005-Undefine-PAGE_SIZE.patch} (83%)
 rename meta-oe/recipes-test/fwts/fwts/{0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch => 0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch} (64%)
 rename meta-oe/recipes-test/fwts/{fwts_20.07.00.bb => fwts_21.03.00.bb} (65%)

diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-for-off_t.patch b/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-for-off_t.patch
index c2d679aabc3..0d73d731090 100644
--- a/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-for-off_t.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-for-off_t.patch
@@ -1,16 +1,15 @@
-From 613e5cfe7751068062cc92f83870e436669fc0a8 Mon Sep 17 00:00:00 2001
+From ee787b53d734cd952c170c9303d213d3dd18a86f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 8 Jun 2017 16:49:50 -0700
-Subject: [PATCH] Add correct printf qualifier for off_t
+Subject: [PATCH 1/6] Add correct printf qualifier for off_t
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
- src/bios/ebda_region/ebda_region.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
+ src/bios/ebda_region/ebda_region.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/src/bios/ebda_region/ebda_region.c b/src/bios/ebda_region/ebda_region.c
-index 16c39357..ad6d635c 100644
+index b70ced10..947a24bd 100644
 --- a/src/bios/ebda_region/ebda_region.c
 +++ b/src/bios/ebda_region/ebda_region.c
 @@ -83,9 +83,9 @@ static int ebda_test1(fwts_framework *fw)
@@ -25,14 +24,19 @@ index 16c39357..ad6d635c 100644
  			(entry->end_address - entry->start_address) / 1024,
  			memory_map_name,
  			entry->start_address,
-@@ -93,8 +93,8 @@ static int ebda_test1(fwts_framework *fw)
+@@ -93,9 +93,9 @@ static int ebda_test1(fwts_framework *fw)
  	} else
  		fwts_failed(fw, LOG_LEVEL_MEDIUM,
  			"EBDAMappedNotReserved",
 -			"EBDA region mapped at 0x%lx but not reserved in the %s table.",
 -			ebda_addr, memory_map_name);
+-
 +			"EBDA region mapped at 0x%jdx but not reserved in the %s table.",
 +			(intmax_t)ebda_addr, memory_map_name);
- 		
++		
  	return FWTS_OK;
  }
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch b/meta-oe/recipes-test/fwts/fwts/0002-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
similarity index 81%
rename from meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
rename to meta-oe/recipes-test/fwts/fwts/0002-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
index 4baefe4a4c0..82379331ecc 100644
--- a/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0002-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
@@ -1,19 +1,18 @@
-From ed988c27efde5355c3ba9d0de8a14a4a40f798cc Mon Sep 17 00:00:00 2001
+From 1575b5ce3ecb8709806908061f689315553b40c7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 6 Jun 2017 07:25:09 -0700
-Subject: [PATCH] Include poll.h instead of deprecated sys/poll.h
+Subject: [PATCH 2/6] Include poll.h instead of deprecated sys/poll.h
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/lib/src/fwts_ipmi.c   | 3 ++-
  src/lib/src/fwts_pipeio.c | 2 +-
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/src/lib/src/fwts_ipmi.c b/src/lib/src/fwts_ipmi.c
-index a4c8a511..e298969e 100644
+index ca7c55bb..0b16bec3 100644
 --- a/src/lib/src/fwts_ipmi.c
 +++ b/src/lib/src/fwts_ipmi.c
 @@ -18,10 +18,11 @@
@@ -30,7 +29,7 @@ index a4c8a511..e298969e 100644
  #include <linux/ipmi.h>
  
 diff --git a/src/lib/src/fwts_pipeio.c b/src/lib/src/fwts_pipeio.c
-index 3b3cfaff..289564d1 100644
+index 716297c4..37752297 100644
 --- a/src/lib/src/fwts_pipeio.c
 +++ b/src/lib/src/fwts_pipeio.c
 @@ -30,9 +30,9 @@
@@ -44,3 +43,6 @@ index 3b3cfaff..289564d1 100644
  #include <sys/types.h>
  #include <sys/wait.h>
  #include <errno.h>
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.patch b/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch
similarity index 74%
rename from meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.patch
rename to meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch
index 93a42213bbb..906ec99a9d0 100644
--- a/meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch
@@ -1,16 +1,17 @@
-From 475979cf5c1af978f4e8409666365ec75b3320ea Mon Sep 17 00:00:00 2001
+From 7317aba872f2bcf052a7db9fa3c7a7ce3c55dc6b Mon Sep 17 00:00:00 2001
 From: Benjamin Berg <bberg@redhat.com>
 Date: Mon, 21 Aug 2017 10:34:40 +0200
-Subject: [PATCH] Remove -Werror from build
+Subject: [PATCH 3/6] Remove -Werror from build
 
 Upstream-Status: Pending
-
 ---
  src/Makefile.am           | 2 +-
  src/lib/src/Makefile.am   | 2 +-
  src/utilities/Makefile.am | 2 +-
  3 files changed, 3 insertions(+), 3 deletions(-)
 
+diff --git a/src/Makefile.am b/src/Makefile.am
+index a26a197b..70a28174 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -14,7 +14,7 @@ AM_CPPFLAGS = \
@@ -22,6 +23,8 @@ Upstream-Status: Pending
  	-Wno-address-of-packed-member			\
  	-Wfloat-equal -Wmissing-declarations		\
  	-Wno-long-long -Wredundant-decls -Wshadow	\
+diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
+index 55c52b41..b85d0101 100644
 --- a/src/lib/src/Makefile.am
 +++ b/src/lib/src/Makefile.am
 @@ -25,7 +25,7 @@ AM_CPPFLAGS = \
@@ -33,6 +36,8 @@ Upstream-Status: Pending
  	-Wno-address-of-packed-member
  
  pkglib_LTLIBRARIES = libfwts.la
+diff --git a/src/utilities/Makefile.am b/src/utilities/Makefile.am
+index ecc25f0a..129c1036 100644
 --- a/src/utilities/Makefile.am
 +++ b/src/utilities/Makefile.am
 @@ -16,7 +16,7 @@
@@ -42,5 +47,8 @@ Upstream-Status: Pending
 -AM_CPPFLAGS = -Wall -Werror -Wextra -DDATAROOTDIR=\"$(datarootdir)\" \
 +AM_CPPFLAGS = -Wall -Wextra -DDATAROOTDIR=\"$(datarootdir)\" \
  	`pkg-config --silence-errors --cflags json` \
- 	`pkg-config --silence-errors --cflags json-c`
- 
+ 	`pkg-config --silence-errors --cflags json-c` \
+ 	-I../lib/include
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch b/meta-oe/recipes-test/fwts/fwts/0004-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
similarity index 79%
rename from meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
rename to meta-oe/recipes-test/fwts/fwts/0004-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
index b45e46a3d92..83d1cbbfe07 100644
--- a/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0004-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
@@ -1,7 +1,7 @@
-From 1112e51d240a206bdcf253878ef1f4963b92da8a Mon Sep 17 00:00:00 2001
+From 9456f2f779d3ed4a134d55571d8bec78ad3b28c1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 6 Jun 2017 07:37:20 -0700
-Subject: [PATCH] Define __SWORD_TYPE if not defined by libc
+Subject: [PATCH 4/6] Define __SWORD_TYPE if not defined by libc
 
 __SWORD_TYPE is internal to glibc, therefore
 check and define it if needed e.g. on musl
@@ -9,16 +9,15 @@ check and define it if needed e.g. on musl
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/lib/src/fwts_uefi.c | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/src/lib/src/fwts_uefi.c b/src/lib/src/fwts_uefi.c
-index 544145fa..460b0b77 100644
+index 138f1164..13d9e36c 100644
 --- a/src/lib/src/fwts_uefi.c
 +++ b/src/lib/src/fwts_uefi.c
-@@ -59,6 +59,10 @@ typedef struct {
+@@ -63,6 +63,10 @@ typedef struct {
  #define UEFI_IFACE_SYSFS		(2)	/* sysfs */
  #define UEFI_IFACE_EFIVARS		(3)	/* efivar fs */
  
@@ -29,3 +28,6 @@ index 544145fa..460b0b77 100644
  /* File system magic numbers */
  #define PSTOREFS_MAGIC          ((__SWORD_TYPE)0x6165676C)
  #define EFIVARFS_MAGIC          ((__SWORD_TYPE)0xde5e81e4)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch b/meta-oe/recipes-test/fwts/fwts/0005-Undefine-PAGE_SIZE.patch
similarity index 83%
rename from meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
rename to meta-oe/recipes-test/fwts/fwts/0005-Undefine-PAGE_SIZE.patch
index 1d8c620efa2..319e0855c41 100644
--- a/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0005-Undefine-PAGE_SIZE.patch
@@ -1,7 +1,7 @@
-From 244e9551ab9bbc1dfa91d19cd472ef254a94ae41 Mon Sep 17 00:00:00 2001
+From 53b9f97fb7faed043134f2ab738347b20379d32f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 6 Jun 2017 07:39:28 -0700
-Subject: [PATCH] Undefine PAGE_SIZE
+Subject: [PATCH 5/6] Undefine PAGE_SIZE
 
 musl defines PAGE_SIZE and build complains
 of multiple definitions
@@ -9,13 +9,12 @@ of multiple definitions
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/lib/src/fwts_acpi_tables.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/lib/src/fwts_acpi_tables.c b/src/lib/src/fwts_acpi_tables.c
-index bdd224aa..58e982a6 100644
+index dc42a8bd..4fa1246a 100644
 --- a/src/lib/src/fwts_acpi_tables.c
 +++ b/src/lib/src/fwts_acpi_tables.c
 @@ -42,6 +42,7 @@
@@ -26,3 +25,6 @@ index bdd224aa..58e982a6 100644
  #define PAGE_SIZE	(4096)
  
  static fwts_acpi_table_info	tables[ACPI_MAX_TABLES];
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch b/meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
similarity index 64%
rename from meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
rename to meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
index bebbfa4ad10..eb8b0b78e85 100644
--- a/meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
@@ -1,25 +1,24 @@
-From 1848b8f8b9be500046ca5d632789a068d6151815 Mon Sep 17 00:00:00 2001
+From f723458eb649a9ad1d5d0e3dd6e801b284680fa7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 8 Jun 2017 16:50:59 -0700
-Subject: [PATCH] use intptr_t to fix pointer-to-int-cast issues
+Subject: [PATCH 6/6] use intptr_t to fix pointer-to-int-cast issues
 
 uintptr_t is guaranteed to be wide enough that
 converting a void* to uintptr_t and back again
 will yield the original pointer value
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/lib/src/fwts_acpi_tables.c | 4 ++--
  src/lib/src/fwts_mmap.c        | 2 +-
- src/lib/src/fwts_smbios.c      | 4 ++--
- 3 files changed, 5 insertions(+), 5 deletions(-)
+ src/lib/src/fwts_smbios.c      | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/src/lib/src/fwts_acpi_tables.c b/src/lib/src/fwts_acpi_tables.c
-index 58e982a6..6522032f 100644
+index 4fa1246a..7ef197cd 100644
 --- a/src/lib/src/fwts_acpi_tables.c
 +++ b/src/lib/src/fwts_acpi_tables.c
-@@ -156,7 +156,7 @@ static fwts_acpi_table_rsdp *fwts_acpi_get_rsdp(fwts_framework *fw, void *addr,
+@@ -173,7 +173,7 @@ static fwts_acpi_table_rsdp *fwts_acpi_get_rsdp(fwts_framework *fw, void *addr,
  		return NULL;
  	}
  
@@ -28,7 +27,7 @@ index 58e982a6..6522032f 100644
  		return NULL;
  
  	if (fwts_safe_memcpy(rsdp, mem, sizeof(fwts_acpi_table_rsdp)) != FWTS_OK) {
-@@ -455,7 +455,7 @@ static int fwts_acpi_load_tables_from_firmware(fwts_framework *fw)
+@@ -486,7 +486,7 @@ static int fwts_acpi_load_tables_from_firmware(fwts_framework *fw)
  	if ((rsdp = fwts_acpi_get_rsdp(fw, rsdp_addr, &rsdp_len)) == NULL)
  		return FWTS_ERROR;
  
@@ -38,10 +37,10 @@ index 58e982a6..6522032f 100644
  	/* Load any tables from XSDT if it's valid */
  	if (rsdp->xsdt_address) {
 diff --git a/src/lib/src/fwts_mmap.c b/src/lib/src/fwts_mmap.c
-index e28abf87..2180b2cc 100644
+index 2f2514f1..fbd946f4 100644
 --- a/src/lib/src/fwts_mmap.c
 +++ b/src/lib/src/fwts_mmap.c
-@@ -81,7 +81,7 @@ int fwts_munmap(void *mem, const size_t size)
+@@ -82,7 +82,7 @@ int fwts_munmap(void *mem, const size_t size)
  	off_t offset;
  
  	page_size = fwts_page_size();
@@ -51,24 +50,18 @@ index e28abf87..2180b2cc 100644
  	if (munmap((void *)((uint8_t *)mem - offset), size + offset) < 0)
  		return FWTS_ERROR;
 diff --git a/src/lib/src/fwts_smbios.c b/src/lib/src/fwts_smbios.c
-index e5b3c774..c8134926 100644
+index 8da572e9..04315bd3 100644
 --- a/src/lib/src/fwts_smbios.c
 +++ b/src/lib/src/fwts_smbios.c
-@@ -55,7 +55,7 @@ static void *fwts_smbios_find_entry_uefi(fwts_framework *fw, fwts_smbios_entry *
+@@ -78,7 +78,7 @@ static void *fwts_smbios_find_entry_uefi(
+ 	if ((addr = fwts_scan_efi_systab(smbios)) != NULL) {
  		fwts_smbios_entry *mapped_entry;
- 		const size_t size = sizeof(fwts_smbios_entry);
  
 -		if ((mapped_entry = fwts_mmap((off_t)addr, size)) != FWTS_MAP_FAILED) {
 +		if ((mapped_entry = fwts_mmap((uintptr_t)addr, size)) != FWTS_MAP_FAILED) {
  			if (fwts_safe_memcpy(entry, mapped_entry, size) == FWTS_OK) {
  				(void)fwts_munmap(mapped_entry, size);
  				*type  = FWTS_SMBIOS;
-@@ -91,7 +91,7 @@ static void *fwts_smbios30_find_entry_uefi(fwts_framework *fw, fwts_smbios30_ent
- 		fwts_smbios30_entry *mapped_entry;
- 		const size_t size = sizeof(fwts_smbios30_entry);
- 
--		if ((mapped_entry = fwts_mmap((off_t)addr, size)) != FWTS_MAP_FAILED) {
-+		if ((mapped_entry = fwts_mmap((uintptr_t)addr, size)) != FWTS_MAP_FAILED) {
- 			if (fwts_safe_memread(mapped_entry, size) == FWTS_OK) {
- 				*entry = *mapped_entry;
- 				(void)fwts_munmap(mapped_entry, size);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-test/fwts/fwts_20.07.00.bb b/meta-oe/recipes-test/fwts/fwts_21.03.00.bb
similarity index 65%
rename from meta-oe/recipes-test/fwts/fwts_20.07.00.bb
rename to meta-oe/recipes-test/fwts/fwts_21.03.00.bb
index 28565eb8caa..aa7d422f7ba 100644
--- a/meta-oe/recipes-test/fwts/fwts_20.07.00.bb
+++ b/meta-oe/recipes-test/fwts/fwts_21.03.00.bb
@@ -6,27 +6,27 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
 
 SRC_URI = "http://fwts.ubuntu.com/release/fwts-V${PV}.tar.gz;subdir=${BP} \
-           file://0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch \
-           file://0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch \
-           file://0003-Undefine-PAGE_SIZE.patch \
            file://0001-Add-correct-printf-qualifier-for-off_t.patch \
-           file://0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch \
-           file://0001-Remove-Werror-from-build.patch \
+           file://0002-Include-poll.h-instead-of-deprecated-sys-poll.h.patch \
+           file://0003-Remove-Werror-from-build.patch \
+           file://0004-Define-__SWORD_TYPE-if-not-defined-by-libc.patch \
+           file://0005-Undefine-PAGE_SIZE.patch \
+           file://0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch \
            "
-SRC_URI[sha256sum] = "4a8e0211b388efbcfcb6530297e9a924d0afa2d6db58e9db2f031129eda6d66f"
+SRC_URI[sha256sum] = "c22dcba2572e4237bf2fe9ab579e195cf051d3a99b2c07ab58f757cae02d24fb"
 
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|powerpc64).*-linux"
 
-DEPENDS = "libpcre json-c glib-2.0 dtc bison-native libbsd"
+DEPENDS = "libpcre glib-2.0 dtc bison-native libbsd"
 DEPENDS_append_libc-musl = " libexecinfo"
 
+# Use brokensep for now (https://github.com/ColinIanKing/fwts/issues/2)
 inherit autotools-brokensep bash-completion pkgconfig
 
-CFLAGS += "-I${STAGING_INCDIR}/json-c -Wno-error=unknown-pragmas"
 LDFLAGS_append_libc-musl = " -lexecinfo"
 
 FILES_${PN} += "${libdir}/fwts/lib*${SOLIBS}"
 FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/fwts/lib*a"
-FILES_${PN}-dbg += "${libdir}/fwts/.debug"
 
+RDEPENDS_${PN} += "dtc"
-- 
2.17.1

