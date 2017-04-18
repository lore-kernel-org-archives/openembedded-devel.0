Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7C02871D5D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:14 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a188so133821pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7FmhtNtTooyDm+assupmhyLvAmZaaZUkWgVe7OnSAKY=;
	b=E62zKubKgRPPmvJcyoVD3ChGvvTSLDTkUARRxujSkjzZqG/F4YjHg5hJxEBvDX+WU6
	ZMJ9JMvhj+lFBQp4VB4bKw8Q1V6f0+N6u5z5s+GYrBQO6HcFet4460oB2bu8iErRDcrx
	h9iDe8niuC4QkVbisA+7tCf5ZKGgMkUOS0yMeWy0GYyES6R3YavxYqK7Pa0uFJPmgMSU
	VS3ZJCLHSf4wxr8Ra/XxpJW0IUjf9G6zsPtK0ONFX3lLhKV1wjxLoQ93Y0ytMTqZwxN7
	/uQUo/gmYaAKZPnWe3fnmlzmTE8zPqqGL5jjHbaa6mtl+LWD/ruR9Y7QTEBJyJXK7YbI
	2oTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7FmhtNtTooyDm+assupmhyLvAmZaaZUkWgVe7OnSAKY=;
	b=apet9uexNXB0VZPsRjREyiF7NDRuUw6iOyHvfTO/Y0UHgyPhmYgzm27dHQs3ySCV/E
	wyYh9YNfbRMT8sUrT8RzHvEzA56UB+O+lhlKa58rRNIcFUUbob2NM4EVcm7Q8Ucs6afU
	PcLbLjUXYXDJ34BE73wWgXc1RAsdeBF4jajXEIxyGQgoSi9zuMgNssBZJA8YuaMCTq2A
	uHF2355SyEtrdLCeC3DOzLl47dVHirUWHOADuRx+Db6VYPxpxwa/TMSTiikoQ1cZG8uz
	rXZ9tVSVVuLAluYHXM3+zgdzgsM+92uJ0fNO0by9LI26XmYsAu5AXW6uHc+I7fhz8br4
	F6WQ==
X-Gm-Message-State: AN3rC/4Qv4GzUZzsH9E9EguSYnraoSuRj42Eoz7Z6BUsJviteFfAx5O2
	bC34E27ynqEWQggC
X-Received: by 10.98.223.200 with SMTP id d69mr19792748pfl.100.1492539735285; 
	Tue, 18 Apr 2017 11:22:15 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:25 -0700
Message-Id: <20170418182142.27253-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-oe][ 15/32] lcdproc: Upgrade to 0.5.8
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:14 -0000

Use github to fetch from
Unify inc file back into main recipe
README is now called README.md so adjust the lic checksum

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-asm-ioctl.h-explicitly.patch      | 43 ++++++++++++++++++++++
 meta-oe/recipes-extended/lcdproc/lcdproc_0.5.6.bb  | 23 ------------
 .../lcdproc/{lcdproc5.inc => lcdproc_git.bb}       | 32 ++++++++++++----
 3 files changed, 68 insertions(+), 30 deletions(-)
 create mode 100644 meta-oe/recipes-extended/lcdproc/lcdproc/0001-include-asm-ioctl.h-explicitly.patch
 delete mode 100644 meta-oe/recipes-extended/lcdproc/lcdproc_0.5.6.bb
 rename meta-oe/recipes-extended/lcdproc/{lcdproc5.inc => lcdproc_git.bb} (70%)

diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc/0001-include-asm-ioctl.h-explicitly.patch b/meta-oe/recipes-extended/lcdproc/lcdproc/0001-include-asm-ioctl.h-explicitly.patch
new file mode 100644
index 000000000..abdedad5d
--- /dev/null
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc/0001-include-asm-ioctl.h-explicitly.patch
@@ -0,0 +1,43 @@
+From b5ca64c7398d516e9845d849e8306df7ac024bc4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 11 Apr 2017 13:59:34 -0700
+Subject: [PATCH] include asm/ioctl.h explicitly
+
+Needed for _IOC* defines
+
+helps compiling with musl where this file is
+not included indirectly
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ server/drivers/hd44780-pifacecad.c | 1 +
+ server/drivers/hd44780-spi.c       | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/server/drivers/hd44780-pifacecad.c b/server/drivers/hd44780-pifacecad.c
+index 43db19c..e2798ad 100644
+--- a/server/drivers/hd44780-pifacecad.c
++++ b/server/drivers/hd44780-pifacecad.c
+@@ -54,6 +54,7 @@
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
++#include <asm/ioctl.h>
+ #include <stdint.h>
+ #include <linux/spi/spidev.h>
+ 
+diff --git a/server/drivers/hd44780-spi.c b/server/drivers/hd44780-spi.c
+index 5f94333..8a4015b 100644
+--- a/server/drivers/hd44780-spi.c
++++ b/server/drivers/hd44780-spi.c
+@@ -29,6 +29,7 @@
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
++#include <asm/ioctl.h>
+ #include <stdint.h>
+ #include <linux/spi/spidev.h>
+ 
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.6.bb b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.6.bb
deleted file mode 100644
index f57e9dfc6..000000000
--- a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.6.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require lcdproc5.inc
-
-SRC_URI[md5sum] = "df4f5c2c7285eaf6979b9c7768b4877f"
-SRC_URI[sha256sum] = "bd2f43c30ff43b30f43110abe6b4a5bc8e0267cb9f57fa97cc5e5ef9488b984a"
-
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[g15] = ",,libg15 g15daemon libg15render,"
-PACKAGECONFIG[hid] = "--enable-libhid,--disable-libhid,libhid"
-
-LCD_DRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'g15', '', ',!g15', d)}"
-
-do_install_append () {
-    # binaries
-    install -D -m 0755 clients/lcdvc/lcdvc ${D}${sbindir}/lcdvc
-
-    # configuration files
-    install -D -m 0644 ${S}/clients/lcdvc/lcdvc.conf ${D}${sysconfdir}/lcdvc.conf
-}
-
-PACKAGES =+ "lcdvc"
-CONFFILES_lcdvc = "${sysconfdir}/lcdvc.conf"
-FILES_lcdvc = "${sysconfdir}/lcdvc.conf ${sbindir}/lcdvc"
-
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc b/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
similarity index 70%
rename from meta-oe/recipes-extended/lcdproc/lcdproc5.inc
rename to meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
index 680f558fa..96bc826fd 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
@@ -7,20 +7,32 @@ LICENSE = "GPLv2+"
 DEPENDS = "ncurses lirc"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
-                    file://README;beginline=60;md5=637e042cdd3671ba00e78b58ede45d3b"
+                    file://README.md;beginline=107;md5=5c927ce1742d6d5cddc45b7ad6230f75"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/lcdproc/${BP}.tar.gz"
+BASEPV = "0.5.8"
+PV = "${BASEPV}+git${SRCPV}"
+SRCREV = "f5156e2e41bb418f14761afea22eee8efb49fb85"
+SRC_URI = "git://github.com/lcdproc/lcdproc;branch=lcdproc-${BASEPV} \
+           file://0001-include-asm-ioctl.h-explicitly.patch \
+           "
 
-inherit autotools update-rc.d
+S = "${WORKDIR}/git"
 
-LCD_DRIVERS ?= "all"
+inherit autotools pkgconfig update-rc.d
+
+LCD_DRIVERS ?= "all,!irman,!svga"
 LCD_DEFAULT_DRIVER ?= "curses"
 
 PACKAGECONFIG ??= "usb"
 PACKAGECONFIG[usb] = "--enable-libusb,--disable-libusb,virtual/libusb0"
 PACKAGECONFIG[ftdi] = "--enable-libftdi,--disable-libftdi,libftdi"
+PACKAGECONFIG[g15] = ",,libg15 g15daemon libg15render,"
+PACKAGECONFIG[hid] = "--enable-libhid,--disable-libhid,libhid"
+PACKAGECONFIG[png] = "--enable-libpng,--disable-libpng,libpng"
+
+LCD_DRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'g15', '', ',!g15', d)}"
 
-EXTRA_OECONF = "--enable-drivers=${LCD_DRIVERS}"
+EXTRA_OECONF = "--enable-drivers='${LCD_DRIVERS}'"
 
 do_install () {
     # binaries
@@ -46,9 +58,14 @@ do_install () {
     for i in server/drivers/*.so; do
         install -m 0644 $i ${D}${libdir}/lcdproc/
     done
+    # binaries
+    install -D -m 0755 clients/lcdvc/lcdvc ${D}${sbindir}/lcdvc
+
+    # configuration files
+    install -D -m 0644 ${S}/clients/lcdvc/lcdvc.conf ${D}${sysconfdir}/lcdvc.conf
 }
 
-PACKAGES =+ "lcdd"
+PACKAGES =+ "lcdd lcdvc"
 
 RRECOMMENDS_${PN} = "lcdd"
 
@@ -58,6 +75,8 @@ FILES_lcdd = "${sysconfdir}/LCDd.conf \
 
 CONFFILES_lcdd = "${sysconfdir}/LCDd.conf"
 CONFFILES_${PN} = "${sysconfdir}/lcdproc.conf"
+CONFFILES_lcdvc = "${sysconfdir}/lcdvc.conf"
+FILES_lcdvc = "${sysconfdir}/lcdvc.conf ${sbindir}/lcdvc"
 
 # Driver packages
 
@@ -78,4 +97,3 @@ python populate_packages_prepend() {
 }
 
 PACKAGES_DYNAMIC += "^lcdd-driver-.*"
-
-- 
2.12.2


