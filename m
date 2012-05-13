Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SThwO-0006jU-H4
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 01:11:04 +0200
Received: from mizar.localdomain (87.9.251.174) by smtp207.alice.it
	(8.6.023.02) id 4F05A6650ECB4D45; Mon, 14 May 2012 01:01:06 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 May 2012 01:01:00 +0200
Message-Id: <1336950061-12068-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][meta-initramfs][PATCH] klibc_1.5.26: now build against linux-libc-headers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 13 May 2012 23:11:04 -0000

* add install-patch creating symlinks as done by debian
* extra add the mtd headers
* refresh patches (split out prefix.patch)
* recipe is now not machine-specific anymore
* bump INC_PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-devtools/klibc/klcc-cross_1.5.26.bb    |    2 +-
 .../klibc/klibc-1.5.26/klibc-linux-libc-dev.patch  |   23 ++++++++++++++++++++
 .../klibc/klibc-1.5.26/prefix.patch                |   14 ++++++++++++
 .../klibc/klibc-1.5.26/staging.patch               |   23 ++++++-------------
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |   13 ++++++-----
 .../recipes-devtools/klibc/klibc_1.5.26.bb         |   16 +-------------
 6 files changed, 53 insertions(+), 38 deletions(-)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/klibc-linux-libc-dev.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/prefix.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.26.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.26.bb
index ad7c07e..5a6739d 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.26.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.26.bb
@@ -14,7 +14,7 @@ FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
 # ${TARGET_PREFIX}klcc is just a
 # perl wrapper around gcc-cross
 # so give it the same arch and path
-PACKAGE_ARCH = "${TUNE_PKGARCH}"
+#PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
 inherit cross
 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/klibc-linux-libc-dev.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/klibc-linux-libc-dev.patch
new file mode 100644
index 0000000..3c55e14
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/klibc-linux-libc-dev.patch
@@ -0,0 +1,23 @@
+commit 43adf69062254fb4f8d4d11fb5fe36a60ae25d5a
+Author: Ben Hutchings <ben@decadent.org.uk>
+Date:   Sun Mar 14 18:41:56 2010 +0000
+
+    Taken from debian "Fix klibc Debian specific build trouble"
+
+Index: klibc-2.0~rc2/scripts/Kbuild.install
+===================================================================
+--- klibc-2.0~rc2.orig/scripts/Kbuild.install	2012-02-11 18:50:21.000000000 +0000
++++ klibc-2.0~rc2/scripts/Kbuild.install	2012-02-11 19:04:52.000000000 +0000
+@@ -95,8 +95,11 @@
+ 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
+ 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
+ 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
+-	$(Q)$(MAKE) -C $(KLIBCKERNELSRC) ARCH=$(KLIBCARCH) INSTALL_HDR_PATH=$(INSTALLROOT)$(INSTALLDIR)/$(KCROSS) headers_install
++	$(Q)for x in $(KLIBCKERNELSRC)/include/asm $(KLIBCKERNELSRC)/include/asm* $(KLIBCKERNELSRC)/include/linux $(KLIBCKERNELSRC)/include/mtd; do \
++		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
++	done
+ 	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
++	$(Q)chmod -R a+rX $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
+ 	$(Q)$(install-data) $(srctree)/klcc/klcc.1 $(INSTALLROOT)$(mandir)/man1/$(KCROSS)klcc.1
+ 	$(Q)$(install-bin) $(objtree)/klcc/$(KCROSS)klcc $(INSTALLROOT)$(bindir)
+ 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/prefix.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/prefix.patch
new file mode 100644
index 0000000..6f5ff0d
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/prefix.patch
@@ -0,0 +1,14 @@
+Index: klibc-1.5.24/Makefile
+===================================================================
+--- a/Makefile	2011-07-27 15:50:53.000000000 +0200
++++ b/Makefile	2011-08-01 00:47:56.000000000 +0200
+@@ -39,7 +39,7 @@
+ export PERL       := perl
+ 
+ # Location for installation
+-export prefix      = /usr
++export prefix      = $(INST)
+ export bindir      = $(prefix)/bin
+ export libdir      = $(prefix)/lib
+ export mandir      = $(prefix)/man
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/staging.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/staging.patch
index cedd5e6..03955f2 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/staging.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/staging.patch
@@ -6,25 +6,11 @@ Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
 Minor edits following upstream changes
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 
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
 Index: klibc-1.5.24/scripts/Kbuild.install
 ===================================================================
 --- a/scripts/Kbuild.install	2011-07-27 15:50:53.000000000 +0200
 +++ b/scripts/Kbuild.install	2011-08-01 00:03:03.000000000 +0200
-@@ -88,16 +88,12 @@
+@@ -88,13 +88,10 @@
  header:
  	$(Q)echo "  INSTALL headers + man pages to $(INSTALLROOT)$(INSTALLDIR)"
  	$(Q)mkdir -p $(INSTALLROOT)$(bindir)
@@ -35,8 +21,13 @@ Index: klibc-1.5.24/scripts/Kbuild.install
  	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
  	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
 -	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
- 	$(Q)$(MAKE) -C $(KLIBCKERNELSRC) ARCH=$(KLIBCARCH) INSTALL_HDR_PATH=$(INSTALLROOT)$(INSTALLDIR)/$(KCROSS) headers_install
+ 	$(Q)for x in $(KLIBCKERNELSRC)/include/asm $(KLIBCKERNELSRC)/include/asm* $(KLIBCKERNELSRC)/include/linux $(KLIBCKERNELSRC)/include/mtd; do \
+ 		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
+ 	done
+@@ -103,7 +100,6 @@
+ 	done
  	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
+ 	$(Q)chmod -R a+rX $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
 -	$(Q)$(install-data) $(srctree)/klcc/klcc.1 $(INSTALLROOT)$(mandir)/man1/$(KCROSS)klcc.1
  	$(Q)$(install-bin) $(objtree)/klcc/$(KCROSS)klcc $(INSTALLROOT)$(bindir)
  
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 195f089..f89af9d 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -1,4 +1,4 @@
-DEPENDS = "virtual/kernel perl-native"
+DEPENDS = "linux-libc-headers perl-native"
 SECTION = "libs"
 DESCRIPTION = "klibc is intended to be a minimalistic libc subset for \
 use with initramfs.  It is deliberately written for small size, \
@@ -6,13 +6,11 @@ minimal entaglement, and portability, not speed."
 LICENSE = "BSD-3-Clause & GPL-2.0 & MIT & Zlib"
 LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8b"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 # Prevents do_package failures with:
 # debugsources.list: No such file or directory:
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_armeb = 'arm'
@@ -30,9 +28,11 @@ SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch"
 SRC_URI_append_linux-uclibceabi = " file://klibc-config-eabi.patch"
 
 SRC_URI += "file://fstype-sane-vfat-and-jffs2-for-1.5.patch \
+            file://klibc-linux-libc-dev.patch \
             file://modprobe.patch \
             file://dash_readopt.patch \
             file://wc.patch \
+            file://prefix.patch \
             file://staging.patch \
             file://kernel_3.2__aligned_u64.patch  \
             "
@@ -41,9 +41,10 @@ S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'CROSS_COMPILE=${TARGET_PREFIX}' \
-                'KLIBCKERNELSRC=${STAGING_KERNEL_DIR}' \
+                'KLIBCKERNELSRC=${STAGING_DIR_TARGET}/${exec_prefix}' \
                 "
 
 do_configure () {
-        ln -sf ${STAGING_KERNEL_DIR} linux
+
+        ln -sf "${STAGING_DIR_TARGET}/${exec_prefix}" linux
 }
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_1.5.26.bb b/meta-initramfs/recipes-devtools/klibc/klibc_1.5.26.bb
index c583fdc..101ba55 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc_1.5.26.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc_1.5.26.bb
@@ -2,23 +2,9 @@ PR = "${INC_PR}.0"
 
 export INST = "${D}"
 
-do_compile_prepend() {
-
-    # after kernel 3.1 the headers are moved in /generated
-    if [ ! -e ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/bitsperlong.h ]
-    then
-        ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/bitsperlong.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/bitsperlong.h
-        ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/errno.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/errno.h
-        ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/ioctl.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/ioctl.h
-        ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/poll.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/poll.h
-        ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/resource.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/resource.h
-    fi
-
-}
-
 do_install() {
 
-        oe_runmake install
+        oe_runmake DESTDIR="${D}" install
 
         # the crosscompiler is packaged by klcc-cross
         # remove klcc
-- 
1.7.3.4



