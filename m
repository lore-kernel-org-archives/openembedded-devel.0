Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3015C6BD87
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 23:11:39 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so550849eak.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5orNaKext0xDkXklZKRUfM0giYTpAhr5EXsSYo0DXzs=;
	b=BXUcoFAymfoXn7ZZkQklGh4m/IOtV1JaU5JJyhs1OZV6pTB3Vld9lnn68H/B9QkUl8
	Rqagfbpcog6g5zmx6ZBwZiuyy9124HlMS8IE+YQtjPc1Ft6ZLcgkdQzaxtogHhNpXTAr
	FgeffzBtHg0LMMnaC41YEako4dBG24SJ4+itx2Xe80jDqWhOa6yxbsld4SmBZkuYpxMF
	8G9j+Co/+gHyUG2flbBQws3BuAFEeSsAgtpRiG8ywTAQ//WdYLuY2kA6YB2KjSwpv1SD
	oJkEM6dSnEPAPdxlqvBYk6VPpqYDdhwJyM06r/11s1u2y0sD2X2wHQdsazjnmrmDqmA1
	HM3Q==
X-Received: by 10.14.9.72 with SMTP id 48mr7347344ees.42.1377817899600;
	Thu, 29 Aug 2013 16:11:39 -0700 (PDT)
Received: from mizar.localdomain
	(host202-221-dynamic.17-79-r.retail.telecomitalia.it.
	[79.17.221.202])
	by mx.google.com with ESMTPSA id a6sm49952754eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 16:11:39 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Aug 2013 01:11:29 +0200
Message-Id: <713c1595c331edd780a13d832612a1d8e6add25b.1377817383.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1377817383.git.andrea.adami@gmail.com>
References: <cover.1377817383.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1377817383.git.andrea.adami@gmail.com>
References: <cover.1377817383.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 1/3] klibc_2.0.2: refactor recipe to respect exec_prefix
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 23:11:39 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../klibc/klibc-2.0.2/klibc-linux-libc-dev.patch   |  2 +-
 .../klibc/klibc-2.0.2/prefix.patch                 | 14 --------------
 .../klibc/klibc-2.0.2/staging.patch                |  2 +-
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |  4 +++-
 .../recipes-devtools/klibc/klibc_2.0.2.bb          | 22 ++++++++++------------
 5 files changed, 15 insertions(+), 29 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/prefix.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch
index 28efcfd..2043064 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch
@@ -14,7 +14,7 @@ Index: klibc-2.0~rc2/scripts/Kbuild.install
  	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
  	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
 -	$(Q)$(MAKE) -C $(KLIBCKERNELSRC) ARCH=$(KLIBCARCH) INSTALL_HDR_PATH=$(INSTALLROOT)$(INSTALLDIR)/$(KCROSS) headers_install
-+	$(Q)for x in $(KLIBCKERNELSRC)/include/asm $(KLIBCKERNELSRC)/include/asm* $(KLIBCKERNELSRC)/include/linux $(KLIBCKERNELSRC)/include/mtd; do \
++	$(Q)for x in ../../../include/asm ../../../include/asm-generic ../../../include/linux ../../../include/mtd; do \
 +		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
 +	done
  	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/prefix.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/prefix.patch
deleted file mode 100644
index 6f5ff0d..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/prefix.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: klibc-1.5.24/Makefile
-===================================================================
---- a/Makefile	2011-07-27 15:50:53.000000000 +0200
-+++ b/Makefile	2011-08-01 00:47:56.000000000 +0200
-@@ -39,7 +39,7 @@
- export PERL       := perl
- 
- # Location for installation
--export prefix      = /usr
-+export prefix      = $(INST)
- export bindir      = $(prefix)/bin
- export libdir      = $(prefix)/lib
- export mandir      = $(prefix)/man
-
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch
index 03955f2..400864b 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch
@@ -21,7 +21,7 @@ Index: klibc-1.5.24/scripts/Kbuild.install
  	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
  	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
 -	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
- 	$(Q)for x in $(KLIBCKERNELSRC)/include/asm $(KLIBCKERNELSRC)/include/asm* $(KLIBCKERNELSRC)/include/linux $(KLIBCKERNELSRC)/include/mtd; do \
+ 	$(Q)for x in ../../../include/asm ../../../include/asm-generic ../../../include/linux ../../../include/mtd; do \
  		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
  	done
 @@ -103,7 +100,6 @@
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 4d5f6c4..5f05c9f 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -37,7 +37,6 @@ SRC_URI_append_linux-uclibceabi = " file://klibc-config-eabi.patch \
 "
 
 SRC_URI += "file://klibc-linux-libc-dev.patch \
-            file://prefix.patch \
             file://staging.patch \
 "
 
@@ -46,6 +45,9 @@ S = "${WORKDIR}/git"
 EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'CROSS_COMPILE=${TARGET_PREFIX}' \
                 'KLIBCKERNELSRC=${STAGING_DIR_TARGET}${exec_prefix}' \
+                'prefix=${exec_prefix}' \
+                'INSTALLROOT=${D}' \
+                'SHLIBDIR=${libdir}' \
 "
 
 do_configure () {
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb
index 9c2590e..4244cf2 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb
@@ -1,27 +1,25 @@
 PR = "${INC_PR}.0"
 
-export INST = "${D}"
-
 do_install() {
     oe_runmake install
 
     # the crosscompiler is packaged by klcc-cross
     # remove klcc
-    rm ${D}${base_bindir}/klcc
+    rm ${D}${bindir}/klcc
     # remove now empty dir
-    rmdir ${D}${base_bindir}
+    rmdir ${D}${bindir}
 
-    install -d ${D}${base_libdir}
-    install -m 755 usr/klibc/klibc-*.so ${D}${base_libdir}
-    (cd  ${D}${base_libdir}; ln -s klibc-*.so klibc.so)
+    install -d ${D}${libdir}
+    install -m 755 usr/klibc/klibc-*.so ${D}${libdir}
+    (cd  ${D}${libdir}; ln -s klibc-*.so klibc.so)
 }
 
 PACKAGES = "libklibc libklibc-staticdev libklibc-dev"
-FILES_libklibc = "${base_libdir}/klibc-*.so"
-FILES_libklibc-staticdev = "${base_libdir}/klibc/lib/libc.a"
-FILES_libklibc-dev = "${base_libdir}/klibc.so \
-                      ${base_libdir}/klibc/lib/* \
-                      ${base_libdir}/klibc/include/* \
+FILES_libklibc = "${libdir}/klibc-*.so"
+FILES_libklibc-staticdev = "${libdir}/klibc/lib/libc.a"
+FILES_libklibc-dev = "${libdir}/klibc.so \
+                      ${libdir}/klibc/lib/* \
+                      ${libdir}/klibc/include/* \
 "
 require klibc.inc
 SUMMARY = "klibc, a small C library for use with initramfs"
-- 
1.8.1.5


