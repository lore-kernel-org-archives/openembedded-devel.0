Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F095BC28B30
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 13:52:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.34367.1741778375658255018
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 04:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=hJigaCnb;
 spf=pass (domain: 9elements.com, ip: 209.85.128.42, mailfrom: naresh.solanki@9elements.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so39200165e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 04:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1741778374; x=1742383174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rXmxl7+GLhH0gQY+K7P03YejOUhiC3cgihFu2sKSnz4=;
        b=hJigaCnbmXxefomZ5Bi5ojNNnCLOacT2S31XAMxZMaNDIr8EEGpQIPlU2u+TTgD1VL
         8e8J3bi/q9q9m40nGG858cNaBt2MZgdTl6aFcZ71rAaGNuRiciwL8mN0ASd3IJNltZui
         hj47wkvBSMzGI2EGttB8aGikY2c9E/j5Ex/Ez/+YMR3TFZZqJOcIbH3P20YMbDMinbu7
         TAf9t2W/631JzKB5wTz5dH1IcvcaL7HwGBQFcFkicHWjy6uwLPlwqvtgpqCUhJJoIFnN
         olnSyLxDib2estKq1D/SHmzv2WIRmT0UXW5l2d3V9Hu3noxg1+72nChydvUTjoN4gQES
         Pipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778374; x=1742383174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXmxl7+GLhH0gQY+K7P03YejOUhiC3cgihFu2sKSnz4=;
        b=YaH0/wFPJFiE7T2t9ZBatZ6X5dOvm01qvYApORh2ZTLKju8+ItIufo9eQQ3RE3Qoou
         b7wbcYS9iCcFkc4DkemtcAJrY43DAdweD9ZBo0alt7L58kCrn6+g5SVJ/kiQws6sd+Na
         HbEuMniOOQCO/dcbBNOeBF2zJvSlkizA+EKWlFu1025IBlmfrXPxutv7jpMrOzkCawMO
         t0bRRuSg8RCJ5K/ZVZ7ivcWfqYIXmvOQ0V/bfG4ZPpdLn9kuhCEt1/WaPdOVw3rbrGBv
         IkTqmO9DD22OwCw78Ui3Czufjj9bIGcBPYmKsOY8vUZrn1znf19bZhtdSNoZerOc950o
         M7hQ==
X-Gm-Message-State: AOJu0Yyj+xfvKNionHezdUJF8Ne9vczy+I1Nyyo5grbDM5eGZjXq+8E9
	eC+j6SvGk/38vSE8unur/e+IoIUEPfve2vQtioQg4Tg/KwlXJ+Jkn79tktfTUg5dcrNrhI90ROQ
	4wIc=
X-Gm-Gg: ASbGncvlm92KTKKwXio0j6CE1m7ZksLtoICP/CmB47CmxK4VCfW/wyqTcMtjER0K6S4
	/RZYdZ/iZ9mSllA8XDqiSQtegysqYdbpfuDDHym636bJlBi1jVcTX+NYtB5qfgYFXw6OTn4sKbZ
	6dmqHs8VjdkKyzI0zAcXzxI0vK7cZk8PSanD5rwTO6AsXJSU7vNxJoFLbLIOW2WSJ8IihzYPL4f
	1H6hyP3um/F60t4mcoJqXK54wmmhS6gZh6alhV6xAjVRLHJtJhf7okPxlIWAPwZCZ+Yvauvbr9U
	MT3hjXcCiObRVBXQZNmaOeawjDqa0BoVb1IWDfq23yy5wWHGB4NayCIO0hq4WAYxIXKm9qWLTth
	pllEyxFNqayQ8la8jYwjMSj4qN9SnJex1gB6n7MjRdGWrC6P+wbE=
X-Google-Smtp-Source: AGHT+IGcgvmbyodvcoPpbCUAdgD/v+nV+RfP03rhPaBlbH974jQPsIIB5qDTf/peFKrAMdaa/Dyfew==
X-Received: by 2002:a05:600c:1c06:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-43d01bd1c94mr73802535e9.2.1741778373413;
        Wed, 12 Mar 2025 04:19:33 -0700 (PDT)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0195casm21190414f8f.53.2025.03.12.04.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 04:19:32 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: openembedded-devel@lists.openembedded.org,
	linux-kernel@vger.kernel.org
Cc: "Signed-off-by: Patrick Rudolph" <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>
Subject: [meta-oe][PATCH] meta-openembedded: flashrom: Update to v1.4.0
Date: Wed, 12 Mar 2025 16:49:15 +0530
Message-ID: <20250312111915.2970032-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 13:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115922

From: "Signed-off-by: Patrick Rudolph" <patrick.rudolph@9elements.com>

Flashrom Release note:
https://www.flashrom.org/release_notes/v_1_4.html

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Tested-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 ...SCV-as-non-memory-mapped-I-O-archite.patch | 54 ++++++---------
 ...ess-use-__asm__-as-is-done-elsewhere.patch | 52 --------------
 ...-meson-Add-options-pciutils-ftdi-usb.patch | 48 +++++++++++++
 .../flashrom/flashrom/meson-fixes.patch       | 68 -------------------
 .../{flashrom_1.2.1.bb => flashrom_1.4.0.bb}  | 10 +--
 5 files changed, 74 insertions(+), 158 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-hwaccess-use-__asm__-as-is-done-elsewhere.patch
 create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
 delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch
 rename meta-oe/recipes-bsp/flashrom/{flashrom_1.2.1.bb => flashrom_1.4.0.bb} (74%)

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch
index e481c5a161..58f1aa4d43 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch
@@ -1,44 +1,30 @@
-From 2c777126765b4095bf481d5cfe4a21470374d940 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 30 Mar 2021 15:12:09 -0700
-Subject: [PATCH] flashrom: Mark RISCV as non memory-mapped I/O architecture
+From bf5a30ef30818973eb2cfac792b80c642df8a721 Mon Sep 17 00:00:00 2001
+From: Patrick Rudolph <patrick.rudolph@9elements.com>
+Date: Mon, 14 Oct 2024 11:01:37 +0200
+Subject: [PATCH 1/2] flashrom: Mark RISCV as non memory-mapped I/O
+ architecture
 
-Upstream-Status: Submitted [https://review.coreboot.org/c/flashrom/+/51960]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Change-Id: I55c4e8529d36f0850dd56441c3fb8602c5d889fd
+Upstream-Status: Inactive-Upstream
+
+Change-Id: I46d7ede7af61e7fca631e1d465100e65c6ddeee9
+Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
 ---
- Makefile   | 2 +-
- hwaccess.h | 4 ++++
- 2 files changed, 5 insertions(+), 1 deletion(-)
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 6d37d55..203e04b 100644
+index 97f56b83..08e4c595 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -559,7 +559,7 @@ endif
- # Disable all drivers needing raw access (memory, PCI, port I/O) on
- # architectures with unknown raw access properties.
+@@ -372,7 +372,7 @@ endif
+ # Additionally disable all drivers needing raw access (memory, PCI, port I/O)
+ # on architectures with unknown raw access properties.
  # Right now those architectures are alpha hppa m68k sh s390
--ifneq ($(ARCH),$(filter $(ARCH),x86 mips ppc arm sparc arc))
-+ifneq ($(ARCH),$(filter $(ARCH),x86 mips ppc arm sparc arc riscv))
- ifeq ($(CONFIG_RAYER_SPI), yes)
- UNSUPPORTED_FEATURES += CONFIG_RAYER_SPI=yes
- else
-diff --git a/hwaccess.h b/hwaccess.h
-index 5602c15..e79988a 100644
---- a/hwaccess.h
-+++ b/hwaccess.h
-@@ -295,6 +295,10 @@ int libpayload_wrmsr(int addr, msr_t msr);
- 
- /* Non memory mapped I/O is not supported on ARC. */
- 
-+#elif IS_RISCV
-+
-+/* Non memory mapped I/O is not supported on RISCV. */
-+
- #else
+-ifneq ($(ARCH), $(filter $(ARCH), x86 mips ppc arm sparc arc e2k))
++ifneq ($(ARCH), $(filter $(ARCH), x86 mips ppc arm sparc arc e2k riscv))
+ $(call mark_unsupported,$(DEPENDS_ON_RAW_MEM_ACCESS))
+ endif
  
- #error Unknown architecture, please check if it supports PCI port IO.
 -- 
-2.31.1
+2.46.2
 
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-hwaccess-use-__asm__-as-is-done-elsewhere.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-hwaccess-use-__asm__-as-is-done-elsewhere.patch
deleted file mode 100644
index f3316aa264..0000000000
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-hwaccess-use-__asm__-as-is-done-elsewhere.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 3334dd4e9fc34c79c3925c3c24869939d8955f21 Mon Sep 17 00:00:00 2001
-From: Rosen Penev <rosenp@gmail.com>
-Date: Sat, 18 Jul 2020 12:16:00 -0700
-Subject: [PATCH] hwaccess: use __asm__ as is done elsewhere
-
-Fixes compilation under powerpc platform. Made the change for the SPARC
-platform as well.
-
-../hwaccess.c: In function 'sync_primitive':
-../hwaccess.c:74:2: warning: implicit declaration of function 'asm'
- [-Wimplicit-function-declaration]
-   74 |  asm("eieio" : : : "memory");
-      |  ^~~
-../hwaccess.c:74:13: error: expected ')' before ':' token
-   74 |  asm("eieio" : : : "memory");
-
-Upstream-Status: Submitted [https://github.com/flashrom/flashrom/pull/155]
-Signed-off-by: Rosen Penev <rosenp@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- hwaccess.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/hwaccess.c b/hwaccess.c
-index 48ccb34..2a39989 100644
---- a/hwaccess.c
-+++ b/hwaccess.c
-@@ -71,18 +71,18 @@ static inline void sync_primitive(void)
-  * See also https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/memory-barriers.txt
-  */
- #if IS_PPC // cf. http://lxr.free-electrons.com/source/arch/powerpc/include/asm/barrier.h
--	asm("eieio" : : : "memory");
-+	__asm__ ("eieio" : : : "memory");
- #elif IS_SPARC
- #if defined(__sparc_v9__) || defined(__sparcv9)
- 	/* Sparc V9 CPUs support three different memory orderings that range from x86-like TSO to PowerPC-like
- 	 * RMO. The modes can be switched at runtime thus to make sure we maintain the right order of access we
- 	 * use the strongest hardware memory barriers that exist on Sparc V9. */
--	asm volatile ("membar #Sync" ::: "memory");
-+	__asm__ volatile ("membar #Sync" ::: "memory");
- #elif defined(__sparc_v8__) || defined(__sparcv8)
- 	/* On SPARC V8 there is no RMO just PSO and that does not apply to I/O accesses... but if V8 code is run
- 	 * on V9 CPUs it might apply... or not... we issue a write barrier anyway. That's the most suitable
- 	 * operation in the V8 instruction set anyway. If you know better then please tell us. */
--	asm volatile ("stbar");
-+	__asm__ volatile ("stbar");
- #else
- 	#error Unknown and/or unsupported SPARC instruction set version detected.
- #endif
--- 
-2.32.0
-
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
new file mode 100644
index 0000000000..bc43f17e9a
--- /dev/null
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
@@ -0,0 +1,48 @@
+From 3ea99c117aa4c7a3502c93e4e4df50b3623e46c3 Mon Sep 17 00:00:00 2001
+From: Patrick Rudolph <patrick.rudolph@9elements.com>
+Date: Tue, 15 Oct 2024 10:42:05 +0200
+Subject: [PATCH 2/2] meson: Add options pciutils, ftdi, usb
+
+The options have been dropped in favor of an array option called programmer.
+Since this doesn't integrate well into yocto add back the old options.
+
+Upstream-Status: Inappropriate Just to fix yocto build system
+
+Change-Id: Ib697b9f7cc7fc553cfdeb75ae9d49a367badd286
+Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
+---
+ meson.build       | 6 +++---
+ meson_options.txt | 3 +++
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index ae56b26c..21093a7f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -151,9 +151,9 @@ systems_serial     = [ 'linux', 'openbsd', 'freebsd', 'dragonfly', 'netbsd', 'da
+ 
+ cpus_port_io = [ 'x86', 'x86_64' ]
+ 
+-group_ftdi   = get_option('programmer').contains('group_ftdi')
+-group_pci    = get_option('programmer').contains('group_pci')
+-group_usb    = get_option('programmer').contains('group_usb')
++group_ftdi   = get_option('programmer').contains('group_ftdi') or get_option('ftdi')
++group_pci    = get_option('programmer').contains('group_pci') or get_option('pciutils')
++group_usb    = get_option('programmer').contains('group_usb') or get_option('usb')
+ group_i2c    = get_option('programmer').contains('group_i2c')
+ group_serial = get_option('programmer').contains('group_serial')
+ group_jlink  = get_option('programmer').contains('group_jlink')
+diff --git a/meson_options.txt b/meson_options.txt
+index 8a04114d..ae722509 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -25,3 +25,6 @@ option('ni845x_search_path', type : 'string', value : 'C:\Program Files (x86)\Na
+ option('delay_minimum_sleep_us', type : 'integer', min : 0, value : 100000,
+        description : 'Minimum time in microseconds to suspend execution for (rather than polling) when a delay is required.'
+                    + ' Larger values may perform better on machines with low timer resolution, at the cost of increased power.')
++option('pciutils', type : 'boolean', value : false, description : 'Select programmer group pci')
++option('usb', type : 'boolean', value : false, description : 'Select programmer group usb')
++option('ftdi', type : 'boolean', value : false, description : 'Select programmer group ftdi')
+-- 
+2.46.2
+
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch b/meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch
deleted file mode 100644
index e45236ee07..0000000000
--- a/meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Add a ftdi option alongside USB and PCI to control the external dependency, and
-ensure that the build is successful in all combinations of options.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/meson.build b/meson.build
-index 375089c..0df9d69 100644
---- a/meson.build
-+++ b/meson.build
-@@ -91,6 +91,8 @@ else
-   config_digilent_spi = false
-   config_developerbox_spi = false
-   config_pickit2_spi = false
-+  config_stlinkv3_spi = false
-+  config_usbblaster_spi = false
- endif
- 
- # some programmers require libpci
-@@ -118,6 +120,21 @@ else
-   config_satasii = false
- endif
- 
-+# some programmers require libftdi
-+if get_option('ftdi')
-+  deps += dependency('libftdi1')
-+else
-+  config_ft2232_spi = false
-+  config_usbblaster_spi = false
-+endif
-+
-+if not (target_machine.cpu_family() == 'x86' or target_machine.cpu_family() == 'x86_64')
-+  config_satamv = false
-+  config_nic3com = false
-+  config_rayer_spi = false
-+  config_nicrealtek = false
-+endif
-+
- # set defines for configured programmers
- if config_atahpt
-   srcs += 'atahpt.c'
-@@ -163,7 +180,6 @@ endif
- if config_ft2232_spi
-   srcs += 'ft2232_spi.c'
-   cargs += '-DCONFIG_FT2232_SPI=1'
--  deps += dependency('libftdi1')
-   cargs += '-DHAVE_FT232H=1'
- endif
- if config_gfxnvidia
-@@ -216,6 +232,7 @@ endif
- if config_nicintel
-   srcs += 'nicintel.c'
-   cargs += '-DCONFIG_NICINTEL=1'
-+  need_raw_access = true
- endif
- if config_nicintel_eeprom
-   srcs += 'nicintel_eeprom.c'
-diff --git a/meson_options.txt b/meson_options.txt
-index ea87311..b6b842d 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -1,5 +1,6 @@
- option('pciutils', type : 'boolean', value : true, description : 'use pciutils')
- option('usb', type : 'boolean', value : true, description : 'use libusb1')
-+option('ftdi', type : 'boolean', value : true, description : 'use libftdi')
- 
- option('config_atahpt', type : 'boolean', value : false, description : 'Highpoint (HPT) ATA/RAID controllers')
- option('config_atapromise', type : 'boolean', value : false, description : 'Promise ATA controller')
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.1.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.4.0.bb
similarity index 74%
rename from meta-oe/recipes-bsp/flashrom/flashrom_1.2.1.bb
rename to meta-oe/recipes-bsp/flashrom/flashrom_1.4.0.bb
index b2592d294b..b650e15872 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.1.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.4.0.bb
@@ -3,12 +3,12 @@ LICENSE = "GPL-2.0-or-later"
 HOMEPAGE = "http://flashrom.org"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.bz2 \
-           file://meson-fixes.patch \
+SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.xz \
            file://0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch \
-           file://0001-hwaccess-use-__asm__-as-is-done-elsewhere.patch \
+           file://0002-meson-Add-options-pciutils-ftdi-usb.patch \
            "
-SRC_URI[sha256sum] = "89a7ff5beb08c89b8795bbd253a51b9453547a864c31793302296b56bbc56d65"
+
+SRC_URI[sha256sum] = "eb0eb3e61a57fd1926c66f08664cf04a96f92cee23b600cf563087c2178d70d8"
 
 S = "${WORKDIR}/flashrom-v${PV}"
 
@@ -18,3 +18,5 @@ PACKAGECONFIG ??= "pci usb ftdi"
 PACKAGECONFIG[pci] = "-Dpciutils=true,-Dpciutils=false,pciutils"
 PACKAGECONFIG[usb] = "-Dusb=true,-Dusb=false,libusb"
 PACKAGECONFIG[ftdi] = "-Dftdi=true,-Dftdi=false,libftdi"
+
+EXTRA_OEMESON="-Dbash_completion=disabled -Dtests=disabled"
-- 
2.42.0


