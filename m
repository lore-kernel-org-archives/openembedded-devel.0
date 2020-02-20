Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 111826132B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 17:52:41 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id s144so3338642wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 09:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FaDwtZFrKOtuBvKAcCE8S2bQp7xEQa6/xsEHJqIgcW4=;
	b=NgBxuPLjW1zFrC0qZhZ+xhpNNtfQ/3U42R0pNa3tM/Zc0wJQTvAvMiPyiUd4pkVxgo
	O35/t5/9smWFMZ1q3t/52BEsNFoEEmMIovE3mW3OtkJB2YHuEpq7m8qgiwo0YTG7x6Nm
	4mU4MQ7RklLaq48nQcjg+9vqFN3FyiNPQ01s4lOTojqqYK4lgZvI6MrfONW2o3fzCErn
	BD6Axl90rb8DKM5feY1TypuSYJEMcCLXolPC/R5Npt5eJRtrmsB/QUFCMlYhxNw3g6AJ
	k2LhRaHK0k90O8d/VlKyuCWzy6rRJssDIi3URKdxJWz9ONcySx7yKoORwq/SGS/cSpnT
	08+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FaDwtZFrKOtuBvKAcCE8S2bQp7xEQa6/xsEHJqIgcW4=;
	b=Zxui2Rk3WgtLfuBEq8+ZVuaXMVAOlEH8QwHKM2re8uGMd08lGtp4q3cEajqa37QJNn
	yIg8XGps4VpyRdU0wHO3ws1JxPvM4lGu0b6ssUfFcQHu9F5DtCjSdr3Q5NHCEKQYciIH
	9MyHb3UX40zWcooi/rekvc/mOhtypYZYKjcqlaR2xq0isLKMQoMbbrYXz6WRjWmdSg5o
	0TJsQz7H7ag6iH4SJJhSzwD3N1jmorTB0zrDiApyTOMdAjHTLk+WJBlAkaDaRBidmxNH
	aQSs5MW/tmE9tDkWkd36Jhc2yGEjLdeacSsSjDiH7QUnwn7587osf4J04oBr4dkGy/ID
	41xA==
X-Gm-Message-State: APjAAAV4w7k+CrMsYNj0fTBVk8Pkw8xU2nE3/Re87VWtiE8HsNhBl7dA
	9Cza0J6hJO2ZOz+LTLTKT4nwxs4N
X-Google-Smtp-Source: APXvYqxM4EcikwHbnVwDvP8BaQkytOe6oG9ffqVl+l8OQsK3nRYb4rPujVgI4DwSh5ulk/Z3CCaBtQ==
X-Received: by 2002:a1c:5441:: with SMTP id p1mr5956969wmi.161.1582221161099; 
	Thu, 20 Feb 2020 09:52:41 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id v5sm324071wrv.86.2020.02.20.09.52.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 09:52:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Feb 2020 18:52:35 +0100
Message-Id: <20200220175235.367-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200220175235.367-1-Martin.Jansa@gmail.com>
References: <20200220175235.367-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] s3c24xx-gpio, s3c64xx-gpio, sjf2410-linux-native, usbpath, wmiconfig: remove old recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Feb 2020 17:52:42 -0000
Content-Transfer-Encoding: 8bit

* I don't   expect anyone nowadays actually using these recipes which I've
  imported from meta-smartphone in 2011.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |   8 +-
 .../0001-ppt.c-Do-not-include-sys-io.h.patch  |  28 -
 .../samsung-soc-utils/s3c24xx-gpio_git.bb     |  21 -
 .../samsung-soc-utils/s3c64xx-gpio_git.bb     |  21 -
 .../sjf2410-linux-native_git.bb               |  39 --
 .../usbpath/usbpath/configure.patch           |  11 -
 .../recipes-support/usbpath/usbpath_git.bb    |  21 -
 ...0001-makefile-Pass-CFLAGS-to-compile.patch |  26 -
 ...02-fix-err-API-to-have-format-string.patch | 656 ------------------
 .../wmiconfig/wmiconfig_git.bb                |  24 -
 10 files changed, 4 insertions(+), 851 deletions(-)
 delete mode 100644 meta-oe/recipes-support/samsung-soc-utils/files/0001-ppt.c-Do-not-include-sys-io.h.patch
 delete mode 100644 meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_git.bb
 delete mode 100644 meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_git.bb
 delete mode 100644 meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_git.bb
 delete mode 100644 meta-oe/recipes-support/usbpath/usbpath/configure.patch
 delete mode 100644 meta-oe/recipes-support/usbpath/usbpath_git.bb
 delete mode 100644 meta-oe/recipes-support/wmiconfig/wmiconfig/0001-makefile-Pass-CFLAGS-to-compile.patch
 delete mode 100644 meta-oe/recipes-support/wmiconfig/wmiconfig/0002-fix-err-API-to-have-format-string.patch
 delete mode 100644 meta-oe/recipes-support/wmiconfig/wmiconfig_git.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index bad4aa769e..a8040fb799 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -251,13 +251,13 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     multipath-tools nano neon nmon numactl onig openct openldap \
     opensc wbxml2 p910nd pcsc-lite picocom libotr pidgin \
     pngcheck poco poppler poppler-data portaudio-v19 pps-tools \
-    pv pxaregs raptor2 rdfind read-edid rsnapshot s3c24xx-gpio s3c64xx-gpio \
-    sjf2410-linux-native satyr sdparm pty-forward-native serial-forward \
+    pv pxaregs raptor2 rdfind read-edid rsnapshot \
+    satyr sdparm pty-forward-native serial-forward \
     sg3-utils sharutils smem spitools srecord ssiapi stm32flash \
     syslog-ng system-config-keyboard tbb thin-provisioning-tools tokyocabinet \
     tree uhubctl unixodbc uriparser usb-modeswitch \
-    usb-modeswitch-data usbpath uthash utouch-evemu utouch-frame \
-    vim vim-tiny websocketpp wmiconfig xdelta3 xdg-user-dirs xmlstarlet \
+    usb-modeswitch-data uthash utouch-evemu utouch-frame \
+    vim vim-tiny websocketpp xdelta3 xdg-user-dirs xmlstarlet \
     zbar zile \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geis toscoterm uim synergy utouch-mtview links-x11 fltk pidgin-otr", "", d)} \
     libcanberra \
diff --git a/meta-oe/recipes-support/samsung-soc-utils/files/0001-ppt.c-Do-not-include-sys-io.h.patch b/meta-oe/recipes-support/samsung-soc-utils/files/0001-ppt.c-Do-not-include-sys-io.h.patch
deleted file mode 100644
index 4e6c250415..0000000000
--- a/meta-oe/recipes-support/samsung-soc-utils/files/0001-ppt.c-Do-not-include-sys-io.h.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From fd244ae648789591f0fb79e74d2b8f6c5b15d6e8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 6 Aug 2019 00:47:14 +0000
-Subject: [PATCH] ppt.c: Do not include sys/io.h
-
-newer versions of glibc has removed it
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ppt.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/ppt.c b/ppt.c
-index 0bae2d0..0ef279f 100644
---- a/ppt.c
-+++ b/ppt.c
-@@ -5,7 +5,6 @@
- #else
- #include <unistd.h>
- #include <stdlib.h>
--#include <sys/io.h>
- #include <linux/parport.h>
- #include <linux/ppdev.h>
- #include <sys/ioctl.h>
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_git.bb b/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_git.bb
deleted file mode 100644
index 98573a062c..0000000000
--- a/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "A user-space tool to show and modify the state of GPIOs on the S3c24xx platform"
-SECTION = "console/utils"
-AUTHOR = "Werner Almesberger <werner@openmoko.org>"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://gpio.c;endline=12;md5=cfb91c686857b2e60852b4925d90a3e1"
-PV = "1.0+git${SRCPV}"
-
-SRCREV = "0bde889e6fc09a330d0e0b9eb9808b20b2bf13d1"
-SRC_URI = "git://github.com/openmoko/openmoko-svn.git;protocol=https;subpath=src/target/gpio"
-S = "${WORKDIR}/gpio"
-
-CLEANBROKEN = "1"
-
-do_compile() {
-    ${CC} ${CFLAGS} ${LDFLAGS} -o ${PN} gpio.c
-}
-
-do_install() {
-    install -d ${D}${sbindir}
-    install -m 0755 ${PN} ${D}${sbindir}
-}
diff --git a/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_git.bb b/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_git.bb
deleted file mode 100644
index 99781718c8..0000000000
--- a/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "A user-space tool to show and modify the state of GPIOs on the S3c64xx platform"
-SECTION = "console/utils"
-AUTHOR = "Werner Almesberger <werner@openmoko.org>"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://gpio-s3c6410.c;endline=12;md5=060cda1be945ad9194593f11d56d55c7"
-PV = "1.0+git${SRCPV}"
-
-SRCREV = "0bde889e6fc09a330d0e0b9eb9808b20b2bf13d1"
-SRC_URI = "git://github.com/openmoko/openmoko-svn.git;protocol=https;subpath=src/target/gpio"
-S = "${WORKDIR}/gpio"
-
-CLEANBROKEN = "1"
-
-do_compile() {
-    ${CC} ${CFLAGS} ${LDFLAGS} -o ${PN} gpio-s3c6410.c
-}
-
-do_install() {
-    install -d ${D}${sbindir}
-    install -m 0755 ${PN} ${D}${sbindir}
-}
diff --git a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_git.bb b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_git.bb
deleted file mode 100644
index 283740396b..0000000000
--- a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_git.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "JTAG utility to interface w/ a S3C2410 device"
-SECTION = "devel"
-AUTHOR = "Harald Welte <laforge@openmoko.org>"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://parport.c;endline=19;md5=b5681091b0fd8c5f7068835c441bf0c8"
-PV = "1.0+git${SRCPV}"
-
-SRCREV = "0bde889e6fc09a330d0e0b9eb9808b20b2bf13d1"
-SRC_URI = "git://github.com/openmoko/openmoko-svn.git;protocol=https;subpath=src/host/sjf2410-linux \
-    file://0001-ppt.c-Do-not-include-sys-io.h.patch \
-"
-S = "${WORKDIR}/sjf2410-linux"
-
-inherit native deploy
-
-CFLAGS += "-DLINUX_PPDEV"
-
-do_compile() {
-    oe_runmake
-}
-
-do_install() {
-    install -d ${D}/${bindir}
-    install -m 0755 sjf2410 ${D}/${bindir}
-}
-
-do_deploy() {
-    install -m 0755 sjf2410 ${DEPLOYDIR}/sjf2410-${PV}
-}
-
-addtask deploy before do_build after do_install
-
-do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
-# cleandirs should possibly be in deploy.bbclass but we need it
-do_deploy[cleandirs] = "${DEPLOYDIR}"
-# clear stamp-extra-info since MACHINE_ARCH is normally put there by
-# deploy.bbclass
-do_deploy[stamp-extra-info] = ""
-
diff --git a/meta-oe/recipes-support/usbpath/usbpath/configure.patch b/meta-oe/recipes-support/usbpath/usbpath/configure.patch
deleted file mode 100644
index 271e6a53ad..0000000000
--- a/meta-oe/recipes-support/usbpath/usbpath/configure.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-Index: usbpath/configure.ac
-===================================================================
---- usbpath.orig/configure.ac	2014-07-17 20:40:26.000000000 +0000
-+++ usbpath/configure.ac	2014-07-18 07:01:40.933474420 +0000
-@@ -1,5 +1,5 @@
- AC_INIT([usbpath],[0.1])
--AM_INIT_AUTOMAKE(AC_PACKAGE_NAME, AC_PACKAGE_VERSION)
-+AM_INIT_AUTOMAKE([foreign])
- 
- AC_PROG_CC
- AC_PROG_RANLIB
diff --git a/meta-oe/recipes-support/usbpath/usbpath_git.bb b/meta-oe/recipes-support/usbpath/usbpath_git.bb
deleted file mode 100644
index a3c75901fb..0000000000
--- a/meta-oe/recipes-support/usbpath/usbpath_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Convert the physical locations of a USB device to/from its number"
-AUTHOR = "Werner Almesberger <werner@openmoko.org>"
-SECTION = "console/utils"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://usbpath.c;endline=20;md5=0aa8c7d2af9110c78a99fbf9a504dc3f"
-DEPENDS = "virtual/libusb0"
-DEPENDS_class-native = "virtual/libusb0-native"
-
-BBCLASSEXTEND = "native"
-
-PV = "1.0+git${SRCPV}"
-
-SRCREV = "0bde889e6fc09a330d0e0b9eb9808b20b2bf13d1"
-SRC_URI = "git://github.com/openmoko/openmoko-svn.git;protocol=https;subpath=src/host/usbpath \
-    file://configure.patch \
-"
-S = "${WORKDIR}/usbpath"
-
-inherit autotools pkgconfig
-
-RDEPENDS_${PN} += "perl"
diff --git a/meta-oe/recipes-support/wmiconfig/wmiconfig/0001-makefile-Pass-CFLAGS-to-compile.patch b/meta-oe/recipes-support/wmiconfig/wmiconfig/0001-makefile-Pass-CFLAGS-to-compile.patch
deleted file mode 100644
index 90eff5bb0f..0000000000
--- a/meta-oe/recipes-support/wmiconfig/wmiconfig/0001-makefile-Pass-CFLAGS-to-compile.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 0378cbb323c662a565f7f3de2dee3d8a646e7bd1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 27 Jun 2017 09:32:42 -0700
-Subject: [PATCH 1/2] makefile: Pass CFLAGS to compile
-
-Set CC if not already set
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- host/tools/wmiconfig/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/host/tools/wmiconfig/Makefile b/host/tools/wmiconfig/Makefile
-index c6738c5..3253a7e 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,4 +1,4 @@
--CC :=$(ATH_CROSS_COMPILE_TYPE)gcc
-+CC ?= $(ATH_CROSS_COMPILE_TYPE)gcc
- 
- all:
--	$(CC) -Wall -DUSER_KEYS -g $(LDFLAGS) -I../../include -I../../../include -I../../wlan/include -I../../os/linux/include wmiconfig.c -o wmiconfig
-+	$(CC) -Wall -DUSER_KEYS -g $(CFLAGS) $(LDFLAGS) -I../../include -I../../../include -I../../wlan/include -I../../os/linux/include wmiconfig.c -o wmiconfig
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-support/wmiconfig/wmiconfig/0002-fix-err-API-to-have-format-string.patch b/meta-oe/recipes-support/wmiconfig/wmiconfig/0002-fix-err-API-to-have-format-string.patch
deleted file mode 100644
index f67f784c1f..0000000000
--- a/meta-oe/recipes-support/wmiconfig/wmiconfig/0002-fix-err-API-to-have-format-string.patch
+++ /dev/null
@@ -1,656 +0,0 @@
-From 909ebdde4ee2233d65de8fa01fde8e9a3bec12b7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 27 Jun 2017 09:33:26 -0700
-Subject: [PATCH 2/2] fix err() API to have format string
-
-Fixes errors with hardening flags
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- host/tools/wmiconfig/wmiconfig.c | 148 +++++++++++++++++++--------------------
- 1 file changed, 74 insertions(+), 74 deletions(-)
-
-diff --git a/host/tools/wmiconfig/wmiconfig.c b/host/tools/wmiconfig/wmiconfig.c
-index 21c9dcd..a6ec481 100644
---- a/wmiconfig.c
-+++ b/wmiconfig.c
-@@ -483,7 +483,7 @@ main (int argc, char **argv)
-     strcpy(ifname, ethIf);
-     s = socket(AF_INET, SOCK_DGRAM, 0);
-     if (s < 0) {
--        err(1, "socket");
-+        err(1, "%s", "socket");
-     }
- 
-     while (1) {
-@@ -1506,28 +1506,28 @@ main (int argc, char **argv)
-         ifr.ifr_data = (void *)filterCmd;
-         if (ioctl(s, AR6000_IOCTL_WMI_SETBSSFILTER, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_POWER_MODE:
-         ifr.ifr_data = (void *)pwrCmd;
-         if (ioctl(s, AR6000_IOCTL_WMI_SETPWR, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_PM_PARAMS:
-         ifr.ifr_data = (void *)pmParamCmd;
-         if (ioctl(s, AR6000_IOCTL_WMI_SET_PMPARAMS, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_IBSS_PM_CAPS:
-         ifr.ifr_data = (void *)adhocPmCmd;
-         if (ioctl(s, AR6000_IOCTL_WMI_SET_IBSS_PM_CAPS, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_ERROR_DETECTION:
-@@ -1535,7 +1535,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_GET_HB_CHALLENGE_RESP:
-@@ -1543,7 +1543,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
- #ifdef USER_KEYS
-@@ -1554,7 +1554,7 @@ main (int argc, char **argv)
- 
-             if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-             {
--                err(1, ifr.ifr_name);
-+                err(1, "%s", ifr.ifr_name);
-             }
- 
-             break;
-@@ -1575,7 +1575,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = (void *)sParamCmd;
-         if (ioctl(s, AR6000_IOCTL_WMI_SETSCAN, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_GET_VERSION:
-@@ -1586,7 +1586,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = (void *)revinfo;
-         if (ioctl(s, AR6000_IOCTL_WMI_GETREV, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         printf("Host Rev = 0x%x(%u.%u.%u.%u), Target Rev = 0x%x(%u.%u.%u.%u)\n",
-               revinfo->host_ver,
-@@ -1606,14 +1606,14 @@ main (int argc, char **argv)
-         ifr.ifr_data = (void *)listenCmd;
-         if (ioctl(s, AR6000_IOCTL_WMI_SETLISTENINT, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_BMISS_TIME:
-         ifr.ifr_data = (void *)bmissCmd;
-         if (ioctl(s, AR6000_IOCTL_WMI_SET_BMISS_TIME, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_RSSI_THRESHOLDS:
-@@ -1621,14 +1621,14 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_SNR_THRESHOLDS:
-         ifr.ifr_data = (void *)snrThresholdParam;
-         if (ioctl(s, AR6000_IOCTL_WMI_SET_SNRTHRESHOLD, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_CLR_RSSISNR:
-@@ -1636,7 +1636,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_LQ_THRESHOLDS:
-@@ -1644,7 +1644,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_CHANNEL:
-@@ -1693,18 +1693,18 @@ main (int argc, char **argv)
-  
-         if (ioctl(s, AR6000_IOCTL_WMI_SET_CHANNELPARAMS, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_SSID:
-         if (index > MAX_PROBED_SSID_INDEX) {
-             printf("num option for ssid command too large\n");
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-             break;
-         }
-         if (strlen((char *)ssid) > sizeof (ssidCmd->ssid)) {
-             printf("ssid name too large\n");
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-             break;
-         }
-         ssidCmd->entryIndex = index;
-@@ -1722,7 +1722,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = (void *)ssidCmd;
-         if (ioctl(s, AR6000_IOCTL_WMI_SET_PROBEDSSID, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_BADAP:
-@@ -1735,7 +1735,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = (void *)badApCmd;
-         if (ioctl(s, AR6000_IOCTL_WMI_SET_BADAP, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_CREATE_QOS:
-@@ -1794,7 +1794,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = (void *)crePStreamCmd;
-         if (ioctl(s, AR6000_IOCTL_WMI_CREATE_QOS, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_GET_TARGET_STATS:
-@@ -1807,7 +1807,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = (void *)&tgtStatsCmd;
-         if (ioctl(s, AR6000_IOCTL_WMI_GET_TARGET_STATS, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         printTargetStats(&(tgtStatsCmd.targetStats));
-         break;
-@@ -1815,7 +1815,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = (void *)pBitMask;
-         if (ioctl(s, AR6000_IOCTL_WMI_SET_ERROR_REPORT_BITMASK, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_DELETE_QOS:
-@@ -1824,7 +1824,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = (void *)delPStreamCmd;
-         if (ioctl(s, AR6000_IOCTL_WMI_DELETE_QOS, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_GET_QOS_QUEUE:
-@@ -1840,7 +1840,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = (void *)getQosQueueCmd;
-         if (ioctl(s, AR6000_IOCTL_WMI_GET_QOS_QUEUE, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
- 
-         printf("Active TSIDs \n");
-@@ -1855,7 +1855,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = (void *)ieInfo;
-         if (ioctl(s, AR6000_IOCTL_WMI_SET_ASSOC_INFO, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_AC_PARAMS:
-@@ -1871,14 +1871,14 @@ main (int argc, char **argv)
-         ifr.ifr_data = (void *)acParamsCmd;
-         if (ioctl(s, AR6000_IOCTL_WMI_SET_ACCESS_PARAMS, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_DISC_TIMEOUT:
-         ifr.ifr_data = (void *)discCmd;
-         if (ioctl(s, AR6000_IOCTL_WMI_SET_DISC_TIMEOUT, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-      case WMI_SET_ADHOC_BSSID:
-@@ -1887,7 +1887,7 @@ main (int argc, char **argv)
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
-             printf("fail to set adhoc bssid \n");
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_OPT_MODE:
-@@ -1895,7 +1895,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_OPT_SEND_FRAME:
-@@ -1903,7 +1903,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_BEACON_INT:
-@@ -1911,7 +1911,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_VOICE_PKT_SIZE:
-@@ -1919,7 +1919,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_MAX_SP:
-@@ -1927,7 +1927,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_GET_ROAM_TBL:
-@@ -1935,7 +1935,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_ROAM_CTRL:
-@@ -1943,7 +1943,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_POWERSAVE_TIMERS:
-@@ -1951,7 +1951,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_GET_POWER_MODE:
-@@ -1959,7 +1959,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         printf("Power mode is %s\n",
-                (getPowerMode->powerMode == MAX_PERF_POWER) ? "maxperf" : "rec");
-@@ -1969,7 +1969,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_GET_ROAM_DATA:
-@@ -1977,7 +1977,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_BT_STATUS:
-@@ -1985,7 +1985,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_BT_PARAMS:
-@@ -1993,7 +1993,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;   
-     case WMI_SET_RETRYLIMITS:
-@@ -2001,14 +2001,14 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_START_SCAN:
-         ((int *)buf)[0] = AR6000_XIOCTL_WMI_STARTSCAN;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_FIX_RATES:
-@@ -2031,14 +2031,14 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_GET_FIX_RATES:
-         ((int *)buf)[0] = AR6000_XIOCTL_WMI_GETFIXRATES;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         } else {
-             int i;
-             printf("Fix rate set index:");
-@@ -2057,7 +2057,7 @@ main (int argc, char **argv)
-         index--;
-         setAuthMode->mode = atoi(argv[index]);
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_REASSOC_MODE:
-@@ -2067,42 +2067,42 @@ main (int argc, char **argv)
-         index--;
-         setReassocMode->mode = atoi(argv[index]);
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_LPREAMBLE:
-         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_LPREAMBLE;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_RTS:
-         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_RTS;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_WMM:
-         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_WMM;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_TXOP:
-         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_TXOP;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case DIAG_READ:
-         ((int *)buf)[0] = AR6000_XIOCTL_DIAG_READ;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         printf("diagdata: 0x%x\n", *diagdata);
-         break;
-@@ -2110,7 +2110,7 @@ main (int argc, char **argv)
-         ((int *)buf)[0] = AR6000_XIOCTL_DIAG_WRITE;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_GET_RD:
-@@ -2118,7 +2118,7 @@ main (int argc, char **argv)
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0)
-         {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         else
-         {
-@@ -2139,14 +2139,14 @@ main (int argc, char **argv)
-         index--;
-         setKeepAlive->keepaliveInterval = atoi(argv[index]);
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_GET_KEEPALIVE:
-         ((int *)buf)[0] = AR6000_XIOCTL_WMI_GET_KEEPALIVE;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         printf("Keepalive interval is %d secs and AP is %s\n",
-                getKeepAlive->keepaliveInterval, (getKeepAlive->configured ?
-@@ -2156,63 +2156,63 @@ main (int argc, char **argv)
-         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_APPIE;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_MGMT_FRM_RX_FILTER:
-         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_MGMT_FRM_RX_FILTER;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_DBGLOG_CFG_MODULE:
-         ((int *)buf)[0] = AR6000_XIOCTL_DBGLOG_CFG_MODULE;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_DBGLOG_GET_DEBUG_LOGS:
-         ((int *)buf)[0] = AR6000_XIOCTL_DBGLOG_GET_DEBUG_LOGS;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_HOST_SLEEP_MODE:
-         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_HOST_SLEEP_MODE;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_WOW_MODE:
-         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_WOW_MODE;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_ADD_WOW_PATTERN:
-         ((int *)buf)[0] = AR6000_XIOCTL_WMI_ADD_WOW_PATTERN;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_DEL_WOW_PATTERN:
-         ((int *)buf)[0] = AR6000_XIOCTL_WMI_DEL_WOW_PATTERN;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_GET_WOW_LIST:
-         ((int *)buf)[0] = AR6000_XIOCTL_WMI_GET_WOW_LIST;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case DIAG_DUMP_CHIP_MEM:
-@@ -2225,7 +2225,7 @@ main (int argc, char **argv)
-                 ((int *)buf)[0] = AR6000_XIOCTL_DIAG_READ;
-                 ifr.ifr_data = buf;
-                 if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--                    err(1, ifr.ifr_name);
-+                    err(1, "%s", ifr.ifr_name);
-                 }
-                 printf("0x%04x:0x%04x\n", *diagaddr, *diagdata);
-             }
-@@ -2237,21 +2237,21 @@ main (int argc, char **argv)
-         index = optind - 1;
-         *connectCtrlFlags = strtoul(argv[index], NULL, 0);
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case DUMP_HTC_CREDITS:        
-         ((int *)buf)[0] = AR6000_XIOCTL_DUMP_HTC_CREDIT_STATE;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_AKMP_INFO:
-         ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_AKMP_PARAMS;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_PMKID_LIST:
-@@ -2259,7 +2259,7 @@ main (int argc, char **argv)
-             ((int *)buf)[0] = AR6000_XIOCTL_WMI_SET_PMKID_LIST;
-             ifr.ifr_data = buf;
-             if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--                err(1, ifr.ifr_name);
-+                err(1, "%s", ifr.ifr_name);
-             }
-         } else {
-             printf("No PMKIDs entered\n");
-@@ -2269,7 +2269,7 @@ main (int argc, char **argv)
-         ((int *)buf)[0] = AR6000_XIOCTL_WMI_GET_PMKID_LIST;
-         ifr.ifr_data = buf;
-         if (ioctl(s, AR6000_IOCTL_EXTENDED, &ifr) < 0) {
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     case WMI_SET_BSS_PMKID_INFO:
-@@ -2277,7 +2277,7 @@ main (int argc, char **argv)
-         iwr.u.data.length = sizeof(*pi_cmd);
-         if (ioctl(s, IEEE80211_IOCTL_ADDPMKID, &iwr) < 0) {
-             printf("ADDPMKID IOCTL Error\n");
--            err(1, ifr.ifr_name);
-+            err(1, "%s", ifr.ifr_name);
-         }
-         break;
-     default:
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-support/wmiconfig/wmiconfig_git.bb b/meta-oe/recipes-support/wmiconfig/wmiconfig_git.bb
deleted file mode 100644
index 23273caf8e..0000000000
--- a/meta-oe/recipes-support/wmiconfig/wmiconfig_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Atheros 6K Wifi configuration utility"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://wmiconfig.c;endline=19;md5=4394a56bca1c5b2446c9f8e406c82911"
-SECTION = "console/network"
-PV = "1.0+git${SRCPV}"
-
-SRCREV = "0bde889e6fc09a330d0e0b9eb9808b20b2bf13d1"
-SRC_URI = "git://github.com/openmoko/openmoko-svn.git;protocol=https;subpath=src/target/AR6kSDK.build_sw.18 \
-    file://0001-makefile-Pass-CFLAGS-to-compile.patch \
-    file://0002-fix-err-API-to-have-format-string.patch \
-"
-S = "${WORKDIR}/AR6kSDK.build_sw.18/host/tools/wmiconfig"
-
-CLEANBROKEN = "1"
-
-EXTRA_OEMAKE = "-e MAKEFLAGS="
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 wmiconfig ${D}${bindir}
-}
-
-- 
2.20.1


