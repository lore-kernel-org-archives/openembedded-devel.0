Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37960.1795594131451078698
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Os+jsc7D;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1ae58d17cd9so5794302c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594131; x=1796198931; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LKnnmWbwYPOwbeWdHvv0LW0EX2z341lG4B/g3r12/U4=;
        b=Os+jsc7DkPZAd+kuFuuA1YA+5QiWnytmTcevDlAUkQNTjBqTR0n+TquKRuCpHVm9YL
         Lz85lfeJZC7B9JL47N07UyFBGX+KimAj44IilnwYS/J99Cc2maf2AP9/knh/PRz1EBIV
         xV9+jdXy4pcXVmKiXTbdbicy3N79Ozthtzg1BmuZs+BFKfYJ3BMPqXWRTB8GkYX1/Ndk
         0yn5v6ZCWZDHI/JWdTDq4GmJBaQ2i5a85J+ulp61aq5Ne9fD7HsRODkYCjs70mcIX56d
         b7N8/EK7G9WC/suhHiJVtNZBLUVhugJ9iCswTb/y85cpEsLP0S9SMcAD7jcQ9VBMebTe
         gyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594131; x=1796198931;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKnnmWbwYPOwbeWdHvv0LW0EX2z341lG4B/g3r12/U4=;
        b=JN1bWKgNLprGB5R2GB2agQcZqr262ZyX64o6Gwjk4ZQGSg3E+lk+ob2hGmBM9br8AP
         evUD6iB7G9EjD8NesLtTQcnix3SYtJtq1cDNqN4kxmI3ybbV6gc5J/rm/4EsO6+yuTtO
         aq9lSL3S5Pyt5/C+FvNjXViC6fGraKJIVT5VEpTSp31vxDAfFGKZebgriq2r5mglDtsv
         dIsetvliV8EmCETvsJATviTz9YcPQHaMW40kGV7Ej7k1jEWVTzQA8P68bx1J6IiHFO7O
         bh6bTyKaZnpOKkwCNNlhKV9XYv5L3zvKWZvI8Dwrja6jAu3LwXtVAOqyoiA64yUrK3ad
         EzLA==
X-Gm-Message-State: APuU4Z8Z9SLtDlNXeLLDFEA/hG95l7Mbx3iMRHNp8movq5tJsZuusRQc
	x0FFVDJ7+XT1vv0bEhkcn8XjeV2UrLsX6qyAPtPljQyE6AsxhVJJkfMiyDyvWCG5
X-Gm-Gg: AZFdTZfKCTaEnkqn6uHAYRvcV50FoYqZpV3awWvqG+BSV9RmSxNBnMNJclnWbf3AKHt
	YkdBL7WFGXOE8dP9EolZ5XFWZOKaDMbRgBHX1/aj9ddBHW/8XoMnqh1G5R15ympT+NYN8Pich4m
	3IZzl3aLEImO641+w8cRVfQUskaQqdg+4eYMTDNPKEoD0wodqoYYq1F4d++O+JZk6XYs3PIBjsW
	027NBDOTq17aasExOi+BxoDvt7rBYTbRfS5uAKv+AsWaRrOk/83F5wSlgEJae2zT8933fzSamqv
	LaYy+n/Eza8L4Hmg0NkvlnnanXbeMkq664gy++7agNEHgimaSzutP9kNBuqKq/K1q2wkkWqXzOo
	uKvNVXZXUJhkaKA2jSaTp6zvdNEzfwKMB69g2Fh0TKApdZMl1RZhAnVC1cQqAmKB+Y6kBjWv6i5
	ztFYvsu08Uv2ryXucTmEZO88E4anubRGWrzroMVg5toI9FHyvzI3M3IwvZ74ZhFjx9zs04z5VsR
	4/KAK9XeMlg/OCaLmRUoluN961nKn6iAKW4j5B5eY7gyQp0ChVrbaIFsZZfKx4qzIQk9PWzBnr0
	Z13BC1R4+OkxLWTk+Ouc7l+HBsU1u8HlKzmHlFdkYDJUSGiAuBe3NFkudh2WeCG40yy0Af3w3d8
	ktFR/RwK1/Ts2lzX4sst7D1rGXa2Gc0SmXkc/YoWg0u2YiRnIVarNcQ89tYAGu9dlu5SvjFu2aN
	yQWwF06RonWyUBfrFdN9pvRd4HH0jgKMzZPWSu8Eunoi9TluZo2S8r+lwtH+0OOT21gYMuNsGAv
	/9mBSZJZ9oyy9jEUFaytqCSHhyxumP1NyEhCCMxk6wJFpaIcWVBB4qtTDatfN3tZ4lpdt7HpnO7
	ok8L2w==
X-Received: by 2002:a05:7300:6da7:b0:376:77e6:a66 with SMTP id 5a478bee46e88-385704509cdmr24616462eec.16.1795594130671;
        Wed, 25 Nov 2026 00:08:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 55/55] bcu: Go back to the 1.1.x series and upgrade to 1.1.131
Date: Wed, 25 Nov 2026 00:07:11 -0800
Message-ID: <20261125080732.2419614-61-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133058
Content-Type: text/plain; charset="utf-8"

The 1.1.128 -> 1.2.1 upgrade picked the bcu_1.2.1 tag, which is a 2023
commit ("try win build") that is on no branch, so it was a downgrade.
Upstream releases are the 1.1.x tags on master; 1.1.131 is the latest.

Notable changes since 1.1.128:
- S32N79-RDB RCON, GPIO, PAC1934 power rail and SA56004 temperature
  sensor support, and i.MX FRDM board support
- FT4232 ports can be used as GPIO
- Fix ttyUSB devices disappearing after use on Linux
- PAC193x VBUS conversion and PCA9847/PAC193x I2C error handling fixes

bcu no longer has the https upgrade code, so drop the curl and openssl
dependencies together with the vendored-libcurl patch. CMakeLists.txt
now requires CMake 3.5, so CMAKE_POLICY_VERSION_MINIMUM is not needed.
Refresh the shebang patch from the upstream pull request, and backport
the upstream fix for the -Wincompatible-pointer-types error in bcu.c
that GCC 14+ and clang treat as an error.

Set PE so 1.1.131 upgrades 1.2.1 in package feeds, track branch=master
again, and limit the upstream check to 1.1.x tags so the stray tag is
ignored.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...akeLists-do-not-use-vendored-libcurl.patch | 40 -------------------
 .../0001-Fix-error-on-ubuntu-25-builds.patch  | 40 +++++++++++++++++++
 ...01-create_version_h.sh-Add-a-shebang.patch | 22 +++++-----
 .../bcu/{bcu_1.2.1.bb => bcu_1.1.131.bb}      | 16 ++++----
 4 files changed, 59 insertions(+), 59 deletions(-)
 delete mode 100644 meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch
 create mode 100644 meta-oe/recipes-support/bcu/bcu/0001-Fix-error-on-ubuntu-25-builds.patch
 rename meta-oe/recipes-support/bcu/{bcu_1.2.1.bb => bcu_1.1.131.bb} (60%)

diff --git a/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch b/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch
deleted file mode 100644
index 806b81188e..0000000000
--- a/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Subject: [PATCH] CMakeLists: do not use vendored libcurl
-
-Upstream-Status: Inappropriate [upstream ticket https://github.com/nxp-imx/bcu/issues/17]
-
-Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
-
-Update for 1.1.128
-Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
-
----
- CMakeLists.txt | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3475179..945c373 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -17,17 +17,17 @@ pkg_check_modules(LIBFTDI REQUIRED libftdi1)
- pkg_check_modules(LIBYAML REQUIRED yaml-0.1)
- pkg_check_modules(LIBOPENSSL REQUIRED openssl)
- pkg_check_modules(LIBUSB REQUIRED libusb-1.0)
-+pkg_check_modules(LIBCURL REQUIRED libcurl)
- project(bcu)
--include_directories(${LIBUSB_INCLUDE_DIRS} ${LIBFTDI_INCLUDE_DIRS}include ${PROJECT_SOURCE_DIR}/libftdi/src ${LIBYAML_INCLUDEDIR} ${PROJECT_SOURCE_DIR}/libcurl/include)
-+include_directories(${LIBUSB_INCLUDE_DIRS} ${LIBFTDI_INCLUDE_DIRS}include ${LIBYAML_INCLUDEDIR} ${LIBCURL_INCLUDE_DIRS})
- include_directories(${PROJECT_SOURCE_DIR})
- 
- message("operation system is ${CMAKE_SYSTEM}")
- if (LINUX)
-         add_executable(bcu bcu.c port.c chip.c board.c bcu_parser.c bcu_yaml.c bcu_https.c bcu_ftdi_eeprom.c)
--        link_directories(${LIBUSB_LIBRARY_DIRS} ${LIBFTDI_LIBRARY_DIRS} ${LIBYAML_LIBRARY_DIRS})
--        target_link_libraries (bcu ${LIBUSB_LIBRARIES} ${LIBFTDI_LIBRARIES} ${LIBYAML_LIBRARIES} ${PROJECT_SOURCE_DIR}/libcurl/build.bcu/lib/libcurl.a -lpthread -lssl -lcrypto -lm)
--        execute_process( COMMAND ${PROJECT_SOURCE_DIR}/create_version_h.sh ${PROJECT_SOURCE_DIR}
--                         COMMAND ${PROJECT_SOURCE_DIR}/build_libs.sh ${PROJECT_SOURCE_DIR})
-+        link_directories(${LIBUSB_LIBRARY_DIRS} ${LIBFTDI_LIBRARY_DIRS} ${LIBYAML_LIBRARY_DIRS} ${LIBCURL_LIBRARY_DIRS})
-+        target_link_libraries (bcu ${LIBUSB_LIBRARIES} ${LIBFTDI_LIBRARIES} ${LIBYAML_LIBRARIES} ${LIBCURL_LIBRARIES} -lpthread -lm)
-+        execute_process( COMMAND ${PROJECT_SOURCE_DIR}/create_version_h.sh ${PROJECT_SOURCE_DIR})
-         install(TARGETS bcu DESTINATION bin)
- elseif (MACOS)
-         add_executable(bcu_mac bcu.c port.c chip.c board.c bcu_parser.c bcu_yaml.c bcu_https.c bcu_ftdi_eeprom.c)
diff --git a/meta-oe/recipes-support/bcu/bcu/0001-Fix-error-on-ubuntu-25-builds.patch b/meta-oe/recipes-support/bcu/bcu/0001-Fix-error-on-ubuntu-25-builds.patch
new file mode 100644
index 0000000000..53ea3e74cb
--- /dev/null
+++ b/meta-oe/recipes-support/bcu/bcu/0001-Fix-error-on-ubuntu-25-builds.patch
@@ -0,0 +1,40 @@
+From 6ee0a2792ac66f6beb7c9082e3441b3fd4a96a5d Mon Sep 17 00:00:00 2001
+From: Costin Constantin <costin.constantin@nxp.com>
+Date: Mon, 12 Oct 2026 13:17:40 +0300
+Subject: [PATCH] Fix error on ubuntu 25+ builds
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix building on versions of Ubuntu greater than 25.04.
+The following error is encountered:
+bcu.c:930:41: error: passing argument 1 of ‘free_device_linkedlist_backward’
+from incompatible pointer type [-Wincompatible-pointer-types]
+
+Signed-off-by: Costin Constantin <costin.constantin@nxp.com>
+Upstream-Status: Backport [https://github.com/nxp-imx/bcu/commit/6ee0a2792ac66f6beb7c9082e3441b3fd4a96a5d]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ bcu.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/bcu.c b/bcu.c
+index d4219fb..bd8c2f1 100644
+--- a/bcu.c
++++ b/bcu.c
+@@ -1,5 +1,5 @@
+ /*
+-* Copyright 2019-2021 NXP.
++* Copyright 2019-2026 NXP.
+ *
+ * Redistribution and use in source and binary forms, with or without modification,
+ * are permitted provided that the following conditions are met:
+@@ -927,7 +927,7 @@ static void set_eeprom_boot_mode(struct options_setting* setting)
+ 	if (board->boot_configs[j].name == NULL) {
+ 		printf("set_boot_mode: No correct boot configuration provided for boot_mode %s!\n", board->boot_modes[i].name);
+ 	}
+-	free_device_linkedlist_backward(end_point);
++	free_device_linkedlist_backward(&end_point->device);
+ }
+ 
+ static void set_boot_mode(struct options_setting* setting)
diff --git a/meta-oe/recipes-support/bcu/bcu/0001-create_version_h.sh-Add-a-shebang.patch b/meta-oe/recipes-support/bcu/bcu/0001-create_version_h.sh-Add-a-shebang.patch
index d8d05eb794..8d4d7b45c8 100644
--- a/meta-oe/recipes-support/bcu/bcu/0001-create_version_h.sh-Add-a-shebang.patch
+++ b/meta-oe/recipes-support/bcu/bcu/0001-create_version_h.sh-Add-a-shebang.patch
@@ -1,18 +1,20 @@
-From 5cf6653144fe9b3dcb892f40cb919d4536711a5a Mon Sep 17 00:00:00 2001
+From 6c6767f5ea8db86370c53174dec3b3067a7be449 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Mon, 23 Nov 2026 19:28:03 -0800
+Date: Tue, 24 Nov 2026 19:51:05 -0800
 Subject: [PATCH] create_version_h.sh: Add a shebang
 
 CMake runs this script directly through execute_process(). Without a
-"#!" line the kernel cannot execute it, and CMake 4.5 reports
-"exec format error" and carries on, so version.h is never created
-and the build fails with:
+"#!" line the kernel cannot execute it, and CMake 4.x reports
+"exec format error" and carries on, so version.h is never created and
+the build fails with:
 
-  bcu.c:58:10: fatal error: 'version.h' file not found
+  bcu.c:61:10: fatal error: version.h: No such file or directory
 
-Add a /bin/sh shebang so the script can be run directly.
+Add a /bin/sh shebang so the script can be run directly, as the macOS
+path already does by running it through sh. Tested with CMake 4.5.1 on
+Linux: version.h is generated and bcu builds.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/nxp-imx/bcu/pull/42]
 AI-Generated: Uses Claude Code
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
@@ -20,11 +22,11 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/create_version_h.sh b/create_version_h.sh
-index e777359..0b6ed65 100755
+index c3f86f7..ac688dc 100755
 --- a/create_version_h.sh
 +++ b/create_version_h.sh
 @@ -1,3 +1,4 @@
 +#!/bin/sh
  echo creating ${1}/version.h
  
- if [ "${APPVEYOR_BUILD_VERSION}" = "" ];
+ if [ "${CI_BUILD_VERSION}" = "" ];
diff --git a/meta-oe/recipes-support/bcu/bcu_1.2.1.bb b/meta-oe/recipes-support/bcu/bcu_1.1.131.bb
similarity index 60%
rename from meta-oe/recipes-support/bcu/bcu_1.2.1.bb
rename to meta-oe/recipes-support/bcu/bcu_1.1.131.bb
index 3a1e80ece5..ab7fcd18e2 100644
--- a/meta-oe/recipes-support/bcu/bcu_1.2.1.bb
+++ b/meta-oe/recipes-support/bcu/bcu_1.1.131.bb
@@ -9,20 +9,18 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=884d48c2aa7b82e1ad4a33909fab24b6"
 
-SRC_URI = "git://github.com/nxp-imx/bcu;protocol=https;nobranch=1;tag=${BPN}_${PV} \
-           file://0001-CMakeLists-do-not-use-vendored-libcurl.patch \
+SRC_URI = "git://github.com/nxp-imx/bcu;protocol=https;branch=master;tag=${BPN}_${PV} \
+           file://0001-Fix-error-on-ubuntu-25-builds.patch \
            file://0001-create_version_h.sh-Add-a-shebang.patch \
            "
-SRCREV = "1c79dcf115bcf2c8ad632dadbc749c5e25c52cb1"
+SRCREV = "a6625496b140e9e7a738c59e75bb163d3edd6f09"
 
-UPSTREAM_CHECK_GITTAGREGEX = "^bcu_(?P<pver>\d+(\.\d+)+)$"
+# bcu_1.2.1 is a stray 2023 tag outside master; releases are 1.1.x
+PE = "1"
+UPSTREAM_CHECK_GITTAGREGEX = "^bcu_(?P<pver>1\.1\.\d+)$"
 
-
-DEPENDS = "curl libyaml libusb1 openssl libftdi"
+DEPENDS = "libyaml libusb1 libftdi"
 
 inherit cmake pkgconfig
 
-# CMakeLists.txt still declares cmake_minimum_required(VERSION 3.4)
-EXTRA_OECMAKE += "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
-
 BBCLASSEXTEND = "native nativesdk"
