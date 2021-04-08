Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.244.1617899779777803115
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fyqv8/tg;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id l12-20020a9d6a8c0000b0290238e0f9f0d8so2876388otq.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KaPy1UbiaVQHjPLgNkonJyY9B19nfildcJ770mJRoUM=;
        b=fyqv8/tgDHmnutuRddnoDQkhiDK6+NzoEeyXkJDRe6OyC3JXUYJqB88uLkxKQ0j+wG
         k+1mwvad9i61caTaz24xNv4SvpTDD945A6TkD8fpBmZWgEq4WoQbXn2QZldbnpRBJlmd
         WW2GEVhdS42catkFEpJI9Ij0gi02NlO/BEOsTvN+0jLJ59dVK/bwVK1m45zhWTz9P24/
         n3l+6/gYEN4TZ1Sf7ZbnPiKTZzmudUr5nEN8tgxAyPVjGrf+AMtIRVCF7pfdTgDiwy9I
         aSfX2EHUQx7LAqU5fivmu4EIO+4aU49jWqd9XaMOypFwAjke2Yksl2mYZrWW3eQyz8vZ
         fxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KaPy1UbiaVQHjPLgNkonJyY9B19nfildcJ770mJRoUM=;
        b=peFyCByMk5iNRQXkvCq3koNvctFTvb/Om//hDi85vQfX1SwKZMWgpjWLrHR2ksXTcY
         X/CNQnWr+ENLDsDvtguj0GTV5pfvdyXDEj9kSwNPXoSD3l17h2E3fiNvTbdtkoyQRZOW
         JeCbQvoPRVI87o+tjIxdyCIPmOh72vcG3trOn4vBfq18DsuIJqPrWKxQ8Q5PBaL/d8Kn
         3H7IWeZbzf/Sqg7RIeOqRHomMBxugUgVTC6w+avNY5HfKBaKndbp9zP0zeJtadwcnous
         znh69dmwpdEfQWpXeQF7WPRBf5109iGyutAygUjh4i1DNe323mLWNnG8WQZDF0VxkGLX
         wHwA==
X-Gm-Message-State: AOAM530T4pZ1iv4ZnILrstTyxKojy5hw1TuXYxI2iSnY6gCGUzfrdvB6
	A59oijzCkXpCtKNPQjDpf33jl7gQ9aA=
X-Google-Smtp-Source: ABdhPJxQS7vOkcF0nB1oCjmDMh+pqNoc5oiSxlaGSqsgLveY4M6kSJ6bNLkzQJh9kSgpeOjP26iX3Q==
X-Received: by 2002:a05:6830:1d70:: with SMTP id l16mr8459962oti.148.1617899778767;
        Thu, 08 Apr 2021 09:36:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:18 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 03/64] flashrom: recipe cleanup
Date: Thu,  8 Apr 2021 09:35:10 -0700
Message-Id: <6c3f5fc45cd7860c41130fa7f1bf470bd7de71c4.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Ross Burton <ross@burtonini.com>

Use Meson to build instead of the bare Makefiles, as the Meson build also
generates pkgconfig files which are needed fwupd.

Add PACKAGECONFIG options for the platform dependencies (libpci, libusb,
libftdi).  Add a patch to the meson.build to ensure that these options
work as intended.

Fix LICENSE, as this is GPLv2-or-later.

Replace 0001-typecast-enum-conversions-explicitly.patch with upstreamed
patch.

Drop 0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch as
this is only needed for the Makefile build.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 401364d06f5d6519ded3d1588c8e27c2310a2b08)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...or-last-line-only-from-preprocessed-.patch | 57 ----------------
 ...typecast-enum-conversions-explicitly.patch | 66 ++++++------------
 .../flashrom/flashrom/meson-fixes.patch       | 68 +++++++++++++++++++
 meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb  | 15 ++--
 4 files changed, 96 insertions(+), 110 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch
 create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch
deleted file mode 100644
index 7a8be837462..00000000000
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 3c078497e506bd6acb406da5cde7ce20e8896353 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 23 Jul 2020 14:13:59 -0700
-Subject: [PATCH] Makefile: Check for last line only from preprocessed output
-
-This started to fail with glibc 2.32 since glibc added additional
-attributes to functions in signal.h therefore existing regexp started to
-fail as it is not able to handle these functions e.g.
-
-extern int siginterrupt (int __sig, int __interrupt) __attribute__ ((__nothrow__ , __leaf__))
-  __attribute__ ((__deprecated__ ("Use sigaction with SA_RESTART instead")));
-
-grep -v '^\#' | grep '"' | cut -f 2 -d'"'
-bit outside of fd_set selected
-Use sigaction with SA_RESTART instead
-arm
-
-So changing it to
-tail -1 | grep '"' | cut -f 2 -d'"'
-arm
-
-Produces the expected result, this was hidden until now
-
-Upstream-Status: Submitted [https://review.coreboot.org/c/flashrom/+/43770]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Change-Id: I123a046e142d54632f12d54e2aa09b0928c02b91
----
- Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 803529f..3795681 100644
---- a/Makefile
-+++ b/Makefile
-@@ -106,7 +106,7 @@ endif
- # IMPORTANT: The following line must be placed before TARGET_OS is ever used
- # (of course), but should come after any lines setting CC because the line
- # below uses CC itself.
--override TARGET_OS := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E os.h 2>/dev/null | grep -v '^\#' | grep '"' | cut -f 2 -d'"'))
-+override TARGET_OS := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E os.h 2>/dev/null | tail -1 | grep '"' | cut -f 2 -d'"'))
- 
- ifeq ($(TARGET_OS), Darwin)
- override CPPFLAGS += -I/opt/local/include -I/usr/local/include
-@@ -460,8 +460,8 @@ endif
- # IMPORTANT: The following line must be placed before ARCH is ever used
- # (of course), but should come after any lines setting CC because the line
- # below uses CC itself.
--override ARCH := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E archtest.c 2>/dev/null | grep -v '^\#' | grep '"' | cut -f 2 -d'"'))
--override ENDIAN := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E endiantest.c 2>/dev/null | grep -v '^\#'))
-+override ARCH := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E archtest.c 2>/dev/null | tail -1 | grep '"' | cut -f 2 -d'"'))
-+override ENDIAN := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E endiantest.c 2>/dev/null | tail -1))
- 
- # Disable the internal programmer on unsupported architectures (everything but x86 and mipsel)
- ifneq ($(ARCH)-little, $(filter $(ARCH),x86 mips)-$(ENDIAN))
--- 
-2.27.0
-
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch
index 7ac53650f2c..f2302dbcc38 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch
@@ -1,69 +1,45 @@
-From 8a236330f2af56bde21e9f69208ea3e59f529f0c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Mar 2020 17:02:30 -0700
-Subject: [PATCH] typecast enum conversions explicitly
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-clang complains like below
+From 3a0c1966e4c66f91e6e8551e906b6db38002acb4 Mon Sep 17 00:00:00 2001
+From: Angel Pons <th3fanbus@gmail.com>
+Date: Wed, 27 May 2020 12:15:51 +0200
+Subject: [PATCH] libflashrom.c: Use casts on enum conversions
 
-libflashrom.c:191:43: error: implicit conversion from enumeration type 'const enum test_state' to different enumeration type 'enum flashrom_test_state' [-Werror,-Wenum-conversion]
-                        supported_boards[i].working = binfo[i].working;
-                                                    ~ ~~~~~~~~~^~~~~~~
-libflashrom.c:229:46: error: implicit conversion from enumeration type 'const enum test_state' to different enumeration type 'enum flashrom_test_state' [-Werror,-Wenum-conversion]
-                        supported_chipsets[i].status = chipset[i].status;
-                                                     ~ ~~~~~~~~~~~^~~~~~
+This allows flashrom to build with GCC 10.
 
-However these enums are exactly same so they can be typecasted
-
-libflashrom.h
-
-/** @ingroup flashrom-query */
-enum flashrom_test_state {
-        FLASHROM_TESTED_OK  = 0,
-        FLASHROM_TESTED_NT  = 1,
-        FLASHROM_TESTED_BAD = 2,
-        FLASHROM_TESTED_DEP = 3,
-        FLASHROM_TESTED_NA  = 4,
-};
-
-flash.h
-
-enum test_state {
-          OK = 0,
-          NT = 1, /* Not tested */
-          BAD,    /* Known to not work */
-          DEP,    /* Support depends on configuration (e.g. Intel flash descriptor) */
-          NA,     /* Not applicable (e.g. write support on ROM chips) */
-  };
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Change-Id: I2166cdf3681452631ef8e980face2924e9a6c81a
+Signed-off-by: Angel Pons <th3fanbus@gmail.com>
+Reviewed-on: https://review.coreboot.org/c/flashrom/+/41775
+Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
+Reviewed-by: HAOUAS Elyes <ehaouas@noos.fr>
 ---
- libflashrom.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ libflashrom.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/libflashrom.c b/libflashrom.c
-index 0dec22e..7956685 100644
+index ab7e364..c20d9c7 100644
 --- a/libflashrom.c
 +++ b/libflashrom.c
-@@ -188,7 +188,7 @@ struct flashrom_board_info *flashrom_supported_boards(void)
+@@ -188,7 +188,8 @@ struct flashrom_board_info *flashrom_supported_boards(void)
  		for (; i < boards_known_size; ++i) {
  			supported_boards[i].vendor = binfo[i].vendor;
  			supported_boards[i].name = binfo[i].name;
 -			supported_boards[i].working = binfo[i].working;
-+			supported_boards[i].working = (enum flashrom_test_state)binfo[i].working;
++			supported_boards[i].working =
++				(enum flashrom_test_state) binfo[i].working;
  		}
  	} else {
  		msg_gerr("Memory allocation error!\n");
-@@ -226,7 +226,7 @@ struct flashrom_chipset_info *flashrom_supported_chipsets(void)
+@@ -226,7 +227,8 @@ struct flashrom_chipset_info *flashrom_supported_chipsets(void)
  			supported_chipsets[i].chipset = chipset[i].device_name;
  			supported_chipsets[i].vendor_id = chipset[i].vendor_id;
  			supported_chipsets[i].chipset_id = chipset[i].device_id;
 -			supported_chipsets[i].status = chipset[i].status;
-+			supported_chipsets[i].status = (enum flashrom_test_state)chipset[i].status;
++			supported_chipsets[i].status =
++				(enum flashrom_test_state) chipset[i].status;
  	  }
  	} else {
  		msg_gerr("Memory allocation error!\n");
 -- 
 2.25.1
-
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch b/meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch
new file mode 100644
index 00000000000..e45236ee07c
--- /dev/null
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch
@@ -0,0 +1,68 @@
+Add a ftdi option alongside USB and PCI to control the external dependency, and
+ensure that the build is successful in all combinations of options.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/meson.build b/meson.build
+index 375089c..0df9d69 100644
+--- a/meson.build
++++ b/meson.build
+@@ -91,6 +91,8 @@ else
+   config_digilent_spi = false
+   config_developerbox_spi = false
+   config_pickit2_spi = false
++  config_stlinkv3_spi = false
++  config_usbblaster_spi = false
+ endif
+ 
+ # some programmers require libpci
+@@ -118,6 +120,21 @@ else
+   config_satasii = false
+ endif
+ 
++# some programmers require libftdi
++if get_option('ftdi')
++  deps += dependency('libftdi1')
++else
++  config_ft2232_spi = false
++  config_usbblaster_spi = false
++endif
++
++if not (target_machine.cpu_family() == 'x86' or target_machine.cpu_family() == 'x86_64')
++  config_satamv = false
++  config_nic3com = false
++  config_rayer_spi = false
++  config_nicrealtek = false
++endif
++
+ # set defines for configured programmers
+ if config_atahpt
+   srcs += 'atahpt.c'
+@@ -163,7 +180,6 @@ endif
+ if config_ft2232_spi
+   srcs += 'ft2232_spi.c'
+   cargs += '-DCONFIG_FT2232_SPI=1'
+-  deps += dependency('libftdi1')
+   cargs += '-DHAVE_FT232H=1'
+ endif
+ if config_gfxnvidia
+@@ -216,6 +232,7 @@ endif
+ if config_nicintel
+   srcs += 'nicintel.c'
+   cargs += '-DCONFIG_NICINTEL=1'
++  need_raw_access = true
+ endif
+ if config_nicintel_eeprom
+   srcs += 'nicintel_eeprom.c'
+diff --git a/meson_options.txt b/meson_options.txt
+index ea87311..b6b842d 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1,5 +1,6 @@
+ option('pciutils', type : 'boolean', value : true, description : 'use pciutils')
+ option('usb', type : 'boolean', value : true, description : 'use libusb1')
++option('ftdi', type : 'boolean', value : true, description : 'use libftdi')
+ 
+ option('config_atahpt', type : 'boolean', value : false, description : 'Highpoint (HPT) ATA/RAID controllers')
+ option('config_atapromise', type : 'boolean', value : false, description : 'Promise ATA controller')
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
index 66ae34af948..4e0b2d4a8c6 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
@@ -1,21 +1,20 @@
 DESCRIPTION = "flashrom is a utility for identifying, reading, writing, verifying and erasing flash chips"
-LICENSE = "GPLv2"
+LICENSE = "GPLv2+"
 HOMEPAGE = "http://flashrom.org"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-DEPENDS = "pciutils libusb libusb-compat"
-
 SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.bz2 \
            file://0001-typecast-enum-conversions-explicitly.patch \
-           file://0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch \
+           file://meson-fixes.patch \
            "
 SRC_URI[md5sum] = "7f8e4b87087eb12ecee0fcc5445b4956"
 SRC_URI[sha256sum] = "e1f8d95881f5a4365dfe58776ce821dfcee0f138f75d0f44f8a3cd032d9ea42b"
 
 S = "${WORKDIR}/flashrom-v${PV}"
 
-inherit pkgconfig
+inherit meson pkgconfig
 
-do_install() {
-    oe_runmake PREFIX=${prefix} DESTDIR=${D} install
-}
+PACKAGECONFIG ??= "pci usb ftdi"
+PACKAGECONFIG[pci] = "-Dpciutils=true,-Dpciutils=false,pciutils"
+PACKAGECONFIG[usb] = "-Dusb=true,-Dusb=false,libusb"
+PACKAGECONFIG[ftdi] = "-Dftdi=true,-Dftdi=false,libftdi"
-- 
2.17.1

