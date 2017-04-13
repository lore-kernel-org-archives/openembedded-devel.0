Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8080A77E78
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:37 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g2so13465165pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7FmhtNtTooyDm+assupmhyLvAmZaaZUkWgVe7OnSAKY=;
	b=j9z3z9fZ+qH7DJaopqH5TBw3RWlzBxJmxyAELHSXJvyMV2TphwFtAVvn19PsKX3lyp
	iMbxT8SFBdi7R9Gthzl2YUhpbNlPdKe3SEfLcg9WcXbh0Bnm8F/dtTuLqCKS5VtBrN0D
	dUxKnxTzNXu5uclR4HendaQ8mIfbiprgxgk5xbtxOR3E/saAcvcr0YnBGm+L7B7hkhjH
	wGu2DKblsglGIvRkqk9eP8i0OiKP801EBFJatrD/D5KzisCvW+/KddjhxveeIuynNFuh
	fgLNJ94FYgAS+Gdisivsy1jOmynKl9wHuudMvYm8I585YgpHCfYqEwzcnQR8/+llmEVx
	1u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7FmhtNtTooyDm+assupmhyLvAmZaaZUkWgVe7OnSAKY=;
	b=f2U8PXMMe7i3Llch8iVFyWCjZmgCvqp0KA7ZKgcdy5NxlJzlS65usioqLjqQK/2BHV
	Msi8E4b1qYDGSwaXZO6pTqq3TZA7O/4DEghQ1uf29EDHZl1jRFfu3YXX4ks7ZNFkSB93
	ibQkQCKvEcHFaMo8KLY430srXsqoAEqXBR8HTY2lbNm0Up9DVX0UN132tgei99tnhf/H
	rzJS7MaLtoBv+PdI6gC7BLopxBRKN2x6728cZouAJmxdOcz9BHPTzynS8yhk6EzUg1S5
	5/D9aTUA2I/VW7ejU6ebPWw6bo22HXnbWF9fxqULDXvWBncbcNpf+qWqZ3A5XA8Kpo5z
	JSsQ==
X-Gm-Message-State: AN3rC/7ssRvOwWGSQej3kfMdgmx8w90LazuGY8mHRXNyxr+u5SR5gOJX
	b4Klr1GTXWrKIQ==
X-Received: by 10.84.193.129 with SMTP id f1mr5408076pld.97.1492116099007;
	Thu, 13 Apr 2017 13:41:39 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:40:51 -0700
Message-Id: <20170413204106.30679-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-oe][ 14/29] lcdproc: Upgrade to 0.5.8
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:37 -0000

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


