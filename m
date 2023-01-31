Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0ECC64EC5
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 01:52:10 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.2769.1675129930078881545
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jan 2023 17:52:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mhEj4irJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id pj3so6956pjb.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 17:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39yj+Djuh/t1toFK32myOTYcK2fRsoRvCshTT35zcrc=;
        b=mhEj4irJMyuqarGl6jEK0eXD6qqs7b6iRiEa3qbt9fo7ajXCQ4Qjua7sUpAQS02IrE
         blURcI2KAvXiRk4V0no6l7J3FBmMLmmgch+usqytFA0RByQU44/shQH3tEXTyI/7J/Gr
         6gccxgtT3l4F6c+Tqkg5M/Dn/t7ryi+7ALxJwV1QeO9nWb3SOwXIw5zyoIsSSl+EG6Rl
         ppQ6LCBASeE7DUPVSeaFNY7dh/f31BfwrygLgDX07oUKnkrdHwdB5a4SGxI9RiSW57B/
         OTcNQ1U7uSebtdnthh7YCW1I3MM31NOik1laVFbLZEcOsGi8hQ4cn6ZhE5fCeM1o78Dm
         S2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39yj+Djuh/t1toFK32myOTYcK2fRsoRvCshTT35zcrc=;
        b=pdcYLASFHD/wmaMUbLTxdQi2Yar2k7yUCJcnHdeoQaUAIPIt5X0axOqp/w9zELmvfz
         ++uVqSEHn/D2IRdY4YZTunIzLosBAOP3VaKAaATwNgIjSChxXHQ+vHb/yDpKELh4or6t
         Dfw066muNo7vB4f1YhehO3salfWr5XNUJF+e0F7FbDqkT920L2wsZjyebfc6Kzhm321b
         evvELtQi0b45FNOyC2uFE0styl6dPG2Rcxqi98KQygbYYiNp7eI7x5yQqtDRRCTHA+hT
         47HK+T0b/81mS6sMvipHDbB5YfhgbIE7SWf4WrJEbXG8ksNFZRXvEO+QW6/WadulyfTq
         VzMA==
X-Gm-Message-State: AFqh2kriyVGqDQWbUgw0qKEdjM4td0HJIpl5L72UzPkWPHfclAfHRhS5
	ZYc6HBsAR3ivJMinTa5bjY5ljjRtcFrTIg==
X-Google-Smtp-Source: AMrXdXvnqIUX/rKdl7J1bVc8ffp580NDWWiXyzP+0sD13seX1C5nkuMNlZ7et0N35C8zNSRh8g2EEA==
X-Received: by 2002:a17:90a:4bc2:b0:229:7b29:54ac with SMTP id u2-20020a17090a4bc200b002297b2954acmr52946326pjl.35.1675129929176;
        Mon, 30 Jan 2023 17:52:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id mj8-20020a17090b368800b0021900ba8eeesm10096859pjb.2.2023.01.30.17.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 17:52:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 8/8] lcdproc: Update to latest tip of trunk
Date: Mon, 30 Jan 2023 17:52:00 -0800
Message-Id: <20230131015200.3862532-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131015200.3862532-1-raj.khem@gmail.com>
References: <20230131015200.3862532-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 01:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100869

Drop patches already present in trunk as of now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-compilation-with-GCC-10.x.patch  | 39 ---------------
 ...ld-fix-port-internal-make-dependenci.patch | 33 -------------
 ...ude-limits.h-for-PATH_MAX-definition.patch | 41 ----------------
 .../0003-Fix-non-x86-platforms-on-musl.patch  | 49 -------------------
 .../recipes-extended/lcdproc/lcdproc_git.bb   |  9 +---
 5 files changed, 2 insertions(+), 169 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-compilation-with-GCC-10.x.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0002-Include-limits.h-for-PATH_MAX-definition.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-compilation-with-GCC-10.x.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-compilation-with-GCC-10.x.patch
deleted file mode 100644
index cd8a69c3fb..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-compilation-with-GCC-10.x.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 9b07f6a472c24f5e1b65746756764391be0d55e4 Mon Sep 17 00:00:00 2001
-From: Harald Geyer <harald@ccbib.org>
-Date: Mon, 10 Feb 2020 13:15:10 +0100
-Subject: [PATCH] Fix compilation with GCC >= 10.x
-
-Starting with GCC >= 10.x, -fno-common is used as default
-instead of -fcommon. This patch fixes the compilation.
-
-Closes: #148
-
-Upstream-Status: Backport
-Suggested-by: Conrad Kostecki <conrad@kostecki.com>
-Signed-off-by: Harald Geyer <harald@ccbib.org>
----
- clients/lcdproc/iface.c | 1 +
- clients/lcdproc/iface.h | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
---- a/clients/lcdproc/iface.c
-+++ b/clients/lcdproc/iface.c
-@@ -32,6 +32,7 @@
- #define UNSET_INT -1
- #define UNSET_STR "\01"
- 
-+IfaceInfo iface[MAX_INTERFACES];
- 
- static int iface_count = 0;	/* number of interfaces */
- static char unit_label[10] = "B";	/* default unit label is Bytes */
---- a/clients/lcdproc/iface.h
-+++ b/clients/lcdproc/iface.h
-@@ -18,7 +18,7 @@
- /** max number of interfaces in multi-interface mode */
- #define MAX_INTERFACES 3
- 
--IfaceInfo iface[MAX_INTERFACES];	/* interface info */
-+extern IfaceInfo iface[MAX_INTERFACES];	/* interface info */
- 
- /** Update screen content */
- int iface_screen(int rep, int display, int *flags_ptr);
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch
deleted file mode 100644
index f6a7956db2..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a20feee4963bc38975fbaf44bbe85a31825f59db Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 6 Apr 2019 17:28:28 -0700
-Subject: [PATCH 1/3] Fix parallel build (fix port-internal make dependencies)
- on many cores
-
-Upstream-Status: Submitted [https://github.com/lcdproc/lcdproc/pull/142]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- server/drivers/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/server/drivers/Makefile.am b/server/drivers/Makefile.am
-index e08f2b2d..4fd2e3f1 100644
---- a/server/drivers/Makefile.am
-+++ b/server/drivers/Makefile.am
-@@ -47,11 +47,11 @@ CwLnx_LDADD =        libLCD.a libbignum.a
- futaba_LDADD =       @LIBUSB_LIBS@ @LIBUSB_1_0_LIBS@ libLCD.a
- g15_LDADD =          @LIBG15@
- glcd_LDADD =         libLCD.a @GLCD_DRIVERS@ @FT2_LIBS@ @LIBPNG_LIBS@ @LIBSERDISP@ @LIBUSB_LIBS@ @LIBX11_LIBS@
--glcd_DEPENDENCIES =  @GLCD_DRIVERS@ glcd-glcd-render.o
-+glcd_DEPENDENCIES =  @GLCD_DRIVERS@ glcd-glcd-render.o libLCD.a
- glcdlib_LDADD =      @LIBGLCD@
- glk_LDADD =          libbignum.a
- hd44780_LDADD =      libLCD.a @HD44780_DRIVERS@ @HD44780_I2C@ @LIBUSB_LIBS@ @LIBFTDI_LIBS@ @LIBUGPIO@ libbignum.a
--hd44780_DEPENDENCIES = @HD44780_DRIVERS@ @HD44780_I2C@
-+hd44780_DEPENDENCIES = @HD44780_DRIVERS@ @HD44780_I2C@ libLCD.a libbignum.a
- i2500vfd_LDADD =     @LIBFTDI_LIBS@
- imon_LDADD =         libLCD.a libbignum.a
- imonlcd_LDADD =      libLCD.a
--- 
-2.24.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0002-Include-limits.h-for-PATH_MAX-definition.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0002-Include-limits.h-for-PATH_MAX-definition.patch
deleted file mode 100644
index eb866bf10a..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0002-Include-limits.h-for-PATH_MAX-definition.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From d447a05ee560ba5894d2ed4cd93d0475c2f3c08e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 17 Dec 2019 17:39:32 -0800
-Subject: [PATCH 2/3] Include <limits.h> for PATH_MAX definition
-
-musl libc exposes the missing include
-
-Upstream-Status: Submitted [https://github.com/lcdproc/lcdproc/pull/142]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- server/drivers/hidraw_lib.c  | 1 +
- server/drivers/linux_input.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/server/drivers/hidraw_lib.c b/server/drivers/hidraw_lib.c
-index 49b03f20..3b51f279 100644
---- a/server/drivers/hidraw_lib.c
-+++ b/server/drivers/hidraw_lib.c
-@@ -8,6 +8,7 @@
- #include <dirent.h>
- #include <errno.h>
- #include <fcntl.h>
-+#include <limits.h>
- #include <stdlib.h>
- #include <string.h>
- #include <sys/ioctl.h>
-diff --git a/server/drivers/linux_input.c b/server/drivers/linux_input.c
-index 5b914d4c..6fcfc591 100644
---- a/server/drivers/linux_input.c
-+++ b/server/drivers/linux_input.c
-@@ -5,6 +5,7 @@
- 
- #include <dirent.h>
- #include <errno.h>
-+#include <limits.h>
- #include <stdint.h>
- #include <stdio.h>
- #include <stdlib.h>
--- 
-2.24.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch
deleted file mode 100644
index eed9ceee5e..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 7fd144f101fa5c9316d3468ed26f55629afe1305 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 17 Dec 2019 17:55:54 -0800
-Subject: [PATCH 3/3] Fix non x86 platforms on musl
-
-Musl only specifies in/outb for x86/x86. Use the fallback path in case
-musl is used.
-
-This should fail compilation during the linking stage but for some reason
-does not. Will do if -Werror=implicit-function-declaration is specified.
-
-Original here: https://github.com/openwrt/packages/blob/master/utils/lcdproc/patches/110-in-outb.patch
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- server/drivers/port.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/server/drivers/port.h
-+++ b/server/drivers/port.h
-@@ -94,7 +94,7 @@ static inline int port_deny_multiple(uns
- /*  ---------------------------- Linux ------------------------------------ */
- /*  Use ioperm, inb and outb in <sys/io.h> (Linux) */
- /*  And iopl for higher addresses of PCI LPT cards */
--#if defined HAVE_IOPERM
-+#if HAVE_INB
- 
- /* Glibc2 and Glibc1 */
- # ifdef HAVE_SYS_IO_H
-@@ -333,7 +333,7 @@ static inline int port_deny_multiple (un
- 	return i386_set_ioperm(port, count, 0);
- }
- 
--#else
-+#elif defined(__x86__) && defined(__x86_64__)
- 
- /*  ------------------------- Everything else ----------------------------- */
- /*  Last chance! Use /dev/io and i386 ASM code (BSD4.3 ?) */
---- a/configure.ac
-+++ b/configure.ac
-@@ -144,6 +144,7 @@ AC_CHECK_LIB(i386, i386_get_ioperm,
- 		[])]
- )
- 
-+AC_CHECK_FUNCS(inb)
- AC_CHECK_FUNCS(iopl)
- AC_CHECK_FUNCS(ioperm)
- AC_CHECK_HEADERS(sys/io.h)
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
index 76a931666d..4cae4947f2 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
@@ -10,13 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
                     file://README.md;beginline=107;md5=5db392f043253a2d64b1737068ce6b58"
 
 PV = "0.5.9+git${SRCPV}"
-SRCREV = "3a3d622d9bb74c44fa67bc20573751a207514134"
-SRC_URI = "git://github.com/lcdproc/lcdproc;branch=master;protocol=https \
-           file://0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch \
-           file://0002-Include-limits.h-for-PATH_MAX-definition.patch \
-           file://0003-Fix-non-x86-platforms-on-musl.patch \
-           file://0001-Fix-compilation-with-GCC-10.x.patch \
-           "
+SRCREV = "0e2ce9b9c46c47363436f9ee730f7c71bf455f0f"
+SRC_URI = "git://github.com/lcdproc/lcdproc;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.1


