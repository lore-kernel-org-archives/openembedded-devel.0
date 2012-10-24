Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TRAHV-00048B-Gv
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 01:22:37 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so753802wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 16:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/KVehdfMuw5bfmZwqKpXIBmUCtY+LvyyvckOWo1E4dU=;
	b=cb3WyEZjGm08b9Jo99fSo2KBiijC6h3E1gbGrqXfIMl2N0ya2an19XJrA+cUISbmWU
	/2atmEt/2ehaIrxY7G45hRSSHpIKZoM+ZuRn6gP311/p7cumcULltf7Pv5KaI7OpaRCD
	Wk13fN7AHxj2H8+EwMIKQmqv6voJzlkPAuuq/wMaf3FPTDsjoW5WeXPXI/weIlozA7jw
	G613IhoZScuWePsmP1c3dIfaqhI2jffgBm1mPOZNDWp9H/h+42tn6c2fyflflXhUuWge
	ymzFpFG7cVLTqrUc54mJa/vJGdHILAY3zf29KcPApQuiuPrvDF8wtpTmuAQ3rO0/6O6/
	9Eqg==
Received: by 10.216.206.152 with SMTP id l24mr9940369weo.66.1351120149642;
	Wed, 24 Oct 2012 16:09:09 -0700 (PDT)
Received: from mizar.localdomain
	(host16-250-dynamic.2-87-r.retail.telecomitalia.it. [87.2.250.16])
	by mx.google.com with ESMTPS id k20sm6796025wiv.11.2012.10.24.16.09.04
	(version=SSLv3 cipher=OTHER); Wed, 24 Oct 2012 16:09:05 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2012 01:08:55 +0200
Message-Id: <1351120135-10992-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-initramfs][PATCH] klibc: upgrade from 2.0.1 to 2.0.2
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
X-List-Received-Date: Wed, 24 Oct 2012 23:22:37 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-devtools/klibc/klcc-cross_2.0.1.bb     |   27 ----
 .../recipes-devtools/klibc/klcc-cross_2.0.2.bb     |   27 ++++
 .../klibc/klibc-2.0.1/klcc_prefix.patch            |   24 ----
 .../klibc/klibc-2.0.1/klibc-config-eabi.patch      |   14 --
 .../klibc/klibc-2.0.1/klibc-linux-libc-dev.patch   |   23 ---
 .../klibc/klibc-2.0.1/prefix.patch                 |   14 --
 .../klibc/klibc-2.0.1/staging.patch                |  144 --------------------
 .../klibc/klibc-2.0.1/use-env-for-perl.patch       |   25 ----
 .../klibc/klibc-2.0.2/klcc_prefix.patch            |   24 ++++
 .../klibc/klibc-2.0.2/klibc-config-eabi.patch      |   14 ++
 .../klibc/klibc-2.0.2/klibc-linux-libc-dev.patch   |   22 +++
 .../klibc/klibc-2.0.2/prefix.patch                 |   14 ++
 .../klibc/klibc-2.0.2/staging.patch                |  144 ++++++++++++++++++++
 .../klibc/klibc-2.0.2/use-env-for-perl.patch       |   25 ++++
 .../klibc/klibc-static-utils_2.0.1.bb              |   16 --
 .../klibc/klibc-static-utils_2.0.2.bb              |   16 ++
 .../recipes-devtools/klibc/klibc-utils_2.0.1.bb    |   16 --
 .../recipes-devtools/klibc/klibc-utils_2.0.2.bb    |   16 ++
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |    4 +-
 .../recipes-devtools/klibc/klibc_2.0.1.bb          |   28 ----
 .../recipes-devtools/klibc/klibc_2.0.2.bb          |   28 ++++
 21 files changed, 332 insertions(+), 333 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.1.bb
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/klcc_prefix.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/klibc-config-eabi.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/klibc-linux-libc-dev.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/prefix.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/staging.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/use-env-for-perl.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klcc_prefix.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-config-eabi.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/prefix.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/use-env-for-perl.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.1.bb
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.2.bb
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.1.bb
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc_2.0.1.bb
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.1.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.1.bb
deleted file mode 100644
index 56456f7..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.1.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-PR = "${INC_PR}.0"
-
-require klibc.inc
-
-export KLCC_INST = "${STAGING_DIR_TARGET}/lib/klibc"
-
-SRC_URI += "file://klcc_prefix.patch \
-            file://use-env-for-perl.patch"
-
-DEPENDS = "klibc"
-
-FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
-
-inherit cross
-
-do_configure () {
-        :
-}
-
-do_compile() {
-        oe_runmake klcc
-}
-
-do_install() {
-        install -d ${D}${base_bindir}
-        install -m 0755 klcc/klcc ${D}${base_bindir}/${TARGET_PREFIX}klcc
-}
diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb
new file mode 100644
index 0000000..56456f7
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb
@@ -0,0 +1,27 @@
+PR = "${INC_PR}.0"
+
+require klibc.inc
+
+export KLCC_INST = "${STAGING_DIR_TARGET}/lib/klibc"
+
+SRC_URI += "file://klcc_prefix.patch \
+            file://use-env-for-perl.patch"
+
+DEPENDS = "klibc"
+
+FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
+
+inherit cross
+
+do_configure () {
+        :
+}
+
+do_compile() {
+        oe_runmake klcc
+}
+
+do_install() {
+        install -d ${D}${base_bindir}
+        install -m 0755 klcc/klcc ${D}${base_bindir}/${TARGET_PREFIX}klcc
+}
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/klcc_prefix.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/klcc_prefix.patch
deleted file mode 100644
index a4a0026..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/klcc_prefix.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Patch was imported from the OpenEmbedded git server
-(git://git.openembedded.org/openembedded)
-as of commit id a29bf15b9c9c0d15f96c254b2ed830e104ae3436
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
-Index: klibc-1.5.19/klcc/Kbuild
-===================================================================
---- --- klibc-1.5.19.orig/klcc/Kbuild	2010-07-07 14:07:48.000000000 +0200
-+++ --- klibc-1.5.19./klcc/Kbuild	2010-08-18 23:39:23.000000000 +0200
-@@ -22,10 +22,10 @@
- 	$(Q)echo 'EMAIN=$(KLIBCEMAIN)' >> $@
- 	$(Q)echo 'BITSIZE=$(KLIBCBITSIZE)' >> $@
- 	$(Q)echo 'VERSION=$(shell cat $(srctree)/usr/klibc/version)' >> $@
--	$(Q)echo 'prefix=$(INSTALLDIR)' >> $@
--	$(Q)echo 'bindir=$(INSTALLDIR)/$(KCROSS)bin' >> $@
--	$(Q)echo 'libdir=$(INSTALLDIR)/$(KCROSS)lib' >> $@
--	$(Q)echo 'includedir=$(INSTALLDIR)/$(KCROSS)include' >> $@
-+	$(Q)echo 'prefix=$(KLCC_INST)' >> $@
-+	$(Q)echo 'bindir=$(KLCC_INST)/$(KCROSS)bin' >> $@
-+	$(Q)echo 'libdir=$(KLCC_INST)/$(KCROSS)lib' >> $@
-+	$(Q)echo 'includedir=$(KLCC_INST)/$(KCROSS)include' >> $@
- 
- 
- # Generate klcc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/klibc-config-eabi.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/klibc-config-eabi.patch
deleted file mode 100644
index 316c80a..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/klibc-config-eabi.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Patch was imported from the OpenEmbedded git server
-(git://git.openembedded.org/openembedded)
-as of commit id b6764cf32ec93547531130dca364fb95e1c495f4
-Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
-
-diff -Nur klibc-1.5/defconfig klibc-1.5p/defconfig
---- klibc-1.5/defconfig	2007-03-04 02:52:10.000000000 +0100
-+++ klibc-1.5p/defconfig	2008-02-08 19:24:22.337127756 +0100
-@@ -5,4 +5,4 @@
- CONFIG_REGPARM=y
- # ARM options
- # CONFIG_KLIBC_THUMB is not set
--# CONFIG_AEABI is not set
-+CONFIG_AEABI=y
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/klibc-linux-libc-dev.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/klibc-linux-libc-dev.patch
deleted file mode 100644
index 3c55e14..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/klibc-linux-libc-dev.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-commit 43adf69062254fb4f8d4d11fb5fe36a60ae25d5a
-Author: Ben Hutchings <ben@decadent.org.uk>
-Date:   Sun Mar 14 18:41:56 2010 +0000
-
-    Taken from debian "Fix klibc Debian specific build trouble"
-
-Index: klibc-2.0~rc2/scripts/Kbuild.install
-===================================================================
---- klibc-2.0~rc2.orig/scripts/Kbuild.install	2012-02-11 18:50:21.000000000 +0000
-+++ klibc-2.0~rc2/scripts/Kbuild.install	2012-02-11 19:04:52.000000000 +0000
-@@ -95,8 +95,11 @@
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
--	$(Q)$(MAKE) -C $(KLIBCKERNELSRC) ARCH=$(KLIBCARCH) INSTALL_HDR_PATH=$(INSTALLROOT)$(INSTALLDIR)/$(KCROSS) headers_install
-+	$(Q)for x in $(KLIBCKERNELSRC)/include/asm $(KLIBCKERNELSRC)/include/asm* $(KLIBCKERNELSRC)/include/linux $(KLIBCKERNELSRC)/include/mtd; do \
-+		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
-+	done
- 	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
-+	$(Q)chmod -R a+rX $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
- 	$(Q)$(install-data) $(srctree)/klcc/klcc.1 $(INSTALLROOT)$(mandir)/man1/$(KCROSS)klcc.1
- 	$(Q)$(install-bin) $(objtree)/klcc/$(KCROSS)klcc $(INSTALLROOT)$(bindir)
- 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/prefix.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/prefix.patch
deleted file mode 100644
index 6f5ff0d..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/prefix.patch
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
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/staging.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/staging.patch
deleted file mode 100644
index 03955f2..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/staging.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-Patch was imported from the OpenEmbedded git server
-(git://git.openembedded.org/openembedded)
-as of commit id eefb99a313bbcc8f34c8b32bf0c5aa2dd2580735
-Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
-
-Minor edits following upstream changes
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
-Index: klibc-1.5.24/scripts/Kbuild.install
-===================================================================
---- a/scripts/Kbuild.install	2011-07-27 15:50:53.000000000 +0200
-+++ b/scripts/Kbuild.install	2011-08-01 00:03:03.000000000 +0200
-@@ -88,13 +88,10 @@
- header:
- 	$(Q)echo "  INSTALL headers + man pages to $(INSTALLROOT)$(INSTALLDIR)"
- 	$(Q)mkdir -p $(INSTALLROOT)$(bindir)
--	$(Q)mkdir -p $(INSTALLROOT)$(mandir)/man1
--	$(Q)mkdir -p $(INSTALLROOT)$(SHLIBDIR)
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)
- 	$(Q)-rm -rf $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
--	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
- 	$(Q)for x in $(KLIBCKERNELSRC)/include/asm $(KLIBCKERNELSRC)/include/asm* $(KLIBCKERNELSRC)/include/linux $(KLIBCKERNELSRC)/include/mtd; do \
- 		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
- 	done
-@@ -103,7 +100,6 @@
- 	done
- 	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
- 	$(Q)chmod -R a+rX $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
--	$(Q)$(install-data) $(srctree)/klcc/klcc.1 $(INSTALLROOT)$(mandir)/man1/$(KCROSS)klcc.1
- 	$(Q)$(install-bin) $(objtree)/klcc/$(KCROSS)klcc $(INSTALLROOT)$(bindir)
- 
- footer: header
-
-Index: klibc-1.5.24/usr/dash/Kbuild
-===================================================================
---- a/usr/dash/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/dash/Kbuild	2011-08-01 00:07:56.000000000 +0200
-@@ -92,5 +92,3 @@
- $(obj)/syntax.h: $(obj)/syntax.c
- 	$(Q):
- 
--# Targets to install
--install-y := sh.shared
-
-Index: klibc-1.5.24/usr/gzip/Kbuild
-===================================================================
---- a/usr/gzip/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/gzip/Kbuild	2011-08-01 00:06:39.000000000 +0200
-@@ -21,5 +21,3 @@
- # Cleaning
- targets := gzip gzip.g gunzip zcat
- 
--# Targets to install
--install-y := gzip gunzip zcat
-
-Index: klibc-1.5.24/usr/kinit/fstype/Kbuild
-===================================================================
---- a/usr/kinit/fstype/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/fstype/Kbuild	2011-08-01 00:09:12.000000000 +0200
-@@ -21,5 +21,3 @@
- # Cleaning
- clean-dirs := static shared
- 
--# install binary
--install-y := $(shared-y)
-
-Index: klibc-1.5.24/usr/kinit/ipconfig/Kbuild
-===================================================================
---- a/usr/kinit/ipconfig/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/ipconfig/Kbuild	2011-08-01 00:10:52.000000000 +0200
-@@ -27,5 +27,3 @@
- # Cleaning
- clean-dirs := static shared
- 
--# install binary
--install-y := $(shared-y)
-
-Index: klibc-1.5.24/usr/kinit/Kbuild
-===================================================================
---- a/usr/kinit/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/Kbuild	2011-08-01 00:20:18.000000000 +0200
-@@ -33,5 +33,3 @@
- subdir- := fstype ipconfig nfsmount resume run-init
- 
- 
--# install binary
--install-y := kinit kinit.shared
-
-Index: klibc-1.5.24/usr/kinit/nfsmount/Kbuild
-===================================================================
---- a/usr/kinit/nfsmount/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/nfsmount/Kbuild	2011-08-01 00:12:52.000000000 +0200
-@@ -23,5 +23,3 @@
- 
- clean-dirs := static shared
- 
--# Install binary
--install-y := $(shared-y)
-
-Index: klibc-1.5.24/usr/kinit/resume/Kbuild
-===================================================================
---- a/usr/kinit/resume/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/resume/Kbuild	2011-08-01 00:13:51.000000000 +0200
-@@ -26,5 +26,3 @@
- # Cleaning
- clean-dirs := static shared
- 
--# install binary
--install-y := $(shared-y)
-
-Index: klibc-1.5.24/usr/kinit/run-init/Kbuild
-===================================================================
---- a/usr/kinit/run-init/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/run-init/Kbuild	2011-08-01 00:14:41.000000000 +0200
-@@ -25,5 +25,3 @@
- # Cleaning
- clean-dirs := static shared
- 
--# install binary
--install-y := $(shared-y)
-
-Index: klibc-1.5.24/usr/klibc/Kbuild
-===================================================================
---- a/usr/klibc/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/klibc/Kbuild	2011-08-01 00:18:11.000000000 +0200
-@@ -177,5 +177,3 @@
- 	          $(INSTALLROOT)$(INSTALLDIR)/$(KLIBCCROSS)lib))
- 	$(Q)$(install-lib) $(obj)/klibc-$(SOLIBHASH).so \
- 	                      $(INSTALLROOT)$(INSTALLDIR)/$(KLIBCCROSS)lib
--	$(Q)$(install-lib) $(obj)/klibc-$(SOLIBHASH).so \
--	                      $(INSTALLROOT)$(SHLIBDIR)
-
-Index: klibc-1.5.24/usr/utils/Kbuild
-===================================================================
---- a/usr/utils/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/utils/Kbuild	2011-08-01 00:19:13.000000000 +0200
-@@ -72,5 +72,3 @@
- # Clean deletes the static and shared dir
- clean-dirs := static shared
- 
--# install only install the shared binaries
--install-y := $(shared-y) shared/reboot shared/poweroff
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/use-env-for-perl.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/use-env-for-perl.patch
deleted file mode 100644
index eac128c..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.1/use-env-for-perl.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Patch was imported from the OpenEmbedded git server
-(git://git.openembedded.org/openembedded)
-as of commit id 676cbb54d42c89a4832871064cfcb7ee2ad372ee
-
-klcc-cross: Add patch to use /usr/bin/env perl
-Certain configurations (such as autobuilders) may build in very
-deep paths (that are longer than the #! mechanism allows) which
-makes it unsafe to use the direct path for perl.  In our case we know
-that /usr/bin/env perl will always return ours (if it has been built).
-
-Signed-off-by: Tom Rini <tom_rini@mentor.com>
-
-Index: klibc-1.5.20/klcc/makeklcc.pl
-===================================================================
---- a/klcc/makeklcc.pl
-+++ b/klcc/makeklcc.pl
-@@ -26,7 +26,7 @@ sub pathsearch($) {
-     return undef;
- }
- 
--print "#!${perlpath}\n";
-+print "#!/usr/bin/env perl\n";
- 
- open(KLIBCCONF, "< $klibcconf\0")
-     or die "$0: cannot open $klibcconf: $!\n";
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klcc_prefix.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klcc_prefix.patch
new file mode 100644
index 0000000..a4a0026
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klcc_prefix.patch
@@ -0,0 +1,24 @@
+Patch was imported from the OpenEmbedded git server
+(git://git.openembedded.org/openembedded)
+as of commit id a29bf15b9c9c0d15f96c254b2ed830e104ae3436
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+Index: klibc-1.5.19/klcc/Kbuild
+===================================================================
+--- --- klibc-1.5.19.orig/klcc/Kbuild	2010-07-07 14:07:48.000000000 +0200
++++ --- klibc-1.5.19./klcc/Kbuild	2010-08-18 23:39:23.000000000 +0200
+@@ -22,10 +22,10 @@
+ 	$(Q)echo 'EMAIN=$(KLIBCEMAIN)' >> $@
+ 	$(Q)echo 'BITSIZE=$(KLIBCBITSIZE)' >> $@
+ 	$(Q)echo 'VERSION=$(shell cat $(srctree)/usr/klibc/version)' >> $@
+-	$(Q)echo 'prefix=$(INSTALLDIR)' >> $@
+-	$(Q)echo 'bindir=$(INSTALLDIR)/$(KCROSS)bin' >> $@
+-	$(Q)echo 'libdir=$(INSTALLDIR)/$(KCROSS)lib' >> $@
+-	$(Q)echo 'includedir=$(INSTALLDIR)/$(KCROSS)include' >> $@
++	$(Q)echo 'prefix=$(KLCC_INST)' >> $@
++	$(Q)echo 'bindir=$(KLCC_INST)/$(KCROSS)bin' >> $@
++	$(Q)echo 'libdir=$(KLCC_INST)/$(KCROSS)lib' >> $@
++	$(Q)echo 'includedir=$(KLCC_INST)/$(KCROSS)include' >> $@
+ 
+ 
+ # Generate klcc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-config-eabi.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-config-eabi.patch
new file mode 100644
index 0000000..316c80a
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-config-eabi.patch
@@ -0,0 +1,14 @@
+Patch was imported from the OpenEmbedded git server
+(git://git.openembedded.org/openembedded)
+as of commit id b6764cf32ec93547531130dca364fb95e1c495f4
+Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
+
+diff -Nur klibc-1.5/defconfig klibc-1.5p/defconfig
+--- klibc-1.5/defconfig	2007-03-04 02:52:10.000000000 +0100
++++ klibc-1.5p/defconfig	2008-02-08 19:24:22.337127756 +0100
+@@ -5,4 +5,4 @@
+ CONFIG_REGPARM=y
+ # ARM options
+ # CONFIG_KLIBC_THUMB is not set
+-# CONFIG_AEABI is not set
++CONFIG_AEABI=y
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch
new file mode 100644
index 0000000..28efcfd
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/klibc-linux-libc-dev.patch
@@ -0,0 +1,22 @@
+commit 43adf69062254fb4f8d4d11fb5fe36a60ae25d5a
+Author: Ben Hutchings <ben@decadent.org.uk>
+Date:   Sun Mar 14 18:41:56 2010 +0000
+
+    Taken from debian "Fix klibc Debian specific build trouble"
+    Adapted for klibc_2.0.2
+
+Index: klibc-2.0~rc2/scripts/Kbuild.install
+===================================================================
+--- klibc-2.0~rc2.orig/scripts/Kbuild.install	2012-02-11 18:50:21.000000000 +0000
++++ klibc-2.0~rc2/scripts/Kbuild.install	2012-02-11 19:04:52.000000000 +0000
+@@ -95,7 +95,9 @@
+ 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
+ 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
+ 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
+-	$(Q)$(MAKE) -C $(KLIBCKERNELSRC) ARCH=$(KLIBCARCH) INSTALL_HDR_PATH=$(INSTALLROOT)$(INSTALLDIR)/$(KCROSS) headers_install
++	$(Q)for x in $(KLIBCKERNELSRC)/include/asm $(KLIBCKERNELSRC)/include/asm* $(KLIBCKERNELSRC)/include/linux $(KLIBCKERNELSRC)/include/mtd; do \
++		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
++	done
+ 	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
+ 	$(Q)chmod -R a+rX $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
+ 	$(Q)$(install-data) $(srctree)/klcc/klcc.1 $(INSTALLROOT)$(mandir)/man1/$(KCROSS)klcc.1
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/prefix.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/prefix.patch
new file mode 100644
index 0000000..6f5ff0d
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/prefix.patch
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
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch
new file mode 100644
index 0000000..03955f2
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/staging.patch
@@ -0,0 +1,144 @@
+Patch was imported from the OpenEmbedded git server
+(git://git.openembedded.org/openembedded)
+as of commit id eefb99a313bbcc8f34c8b32bf0c5aa2dd2580735
+Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
+
+Minor edits following upstream changes
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+Index: klibc-1.5.24/scripts/Kbuild.install
+===================================================================
+--- a/scripts/Kbuild.install	2011-07-27 15:50:53.000000000 +0200
++++ b/scripts/Kbuild.install	2011-08-01 00:03:03.000000000 +0200
+@@ -88,13 +88,10 @@
+ header:
+ 	$(Q)echo "  INSTALL headers + man pages to $(INSTALLROOT)$(INSTALLDIR)"
+ 	$(Q)mkdir -p $(INSTALLROOT)$(bindir)
+-	$(Q)mkdir -p $(INSTALLROOT)$(mandir)/man1
+-	$(Q)mkdir -p $(INSTALLROOT)$(SHLIBDIR)
+ 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)
+ 	$(Q)-rm -rf $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
+ 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
+ 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
+-	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
+ 	$(Q)for x in $(KLIBCKERNELSRC)/include/asm $(KLIBCKERNELSRC)/include/asm* $(KLIBCKERNELSRC)/include/linux $(KLIBCKERNELSRC)/include/mtd; do \
+ 		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
+ 	done
+@@ -103,7 +100,6 @@
+ 	done
+ 	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
+ 	$(Q)chmod -R a+rX $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
+-	$(Q)$(install-data) $(srctree)/klcc/klcc.1 $(INSTALLROOT)$(mandir)/man1/$(KCROSS)klcc.1
+ 	$(Q)$(install-bin) $(objtree)/klcc/$(KCROSS)klcc $(INSTALLROOT)$(bindir)
+ 
+ footer: header
+
+Index: klibc-1.5.24/usr/dash/Kbuild
+===================================================================
+--- a/usr/dash/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/dash/Kbuild	2011-08-01 00:07:56.000000000 +0200
+@@ -92,5 +92,3 @@
+ $(obj)/syntax.h: $(obj)/syntax.c
+ 	$(Q):
+ 
+-# Targets to install
+-install-y := sh.shared
+
+Index: klibc-1.5.24/usr/gzip/Kbuild
+===================================================================
+--- a/usr/gzip/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/gzip/Kbuild	2011-08-01 00:06:39.000000000 +0200
+@@ -21,5 +21,3 @@
+ # Cleaning
+ targets := gzip gzip.g gunzip zcat
+ 
+-# Targets to install
+-install-y := gzip gunzip zcat
+
+Index: klibc-1.5.24/usr/kinit/fstype/Kbuild
+===================================================================
+--- a/usr/kinit/fstype/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/kinit/fstype/Kbuild	2011-08-01 00:09:12.000000000 +0200
+@@ -21,5 +21,3 @@
+ # Cleaning
+ clean-dirs := static shared
+ 
+-# install binary
+-install-y := $(shared-y)
+
+Index: klibc-1.5.24/usr/kinit/ipconfig/Kbuild
+===================================================================
+--- a/usr/kinit/ipconfig/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/kinit/ipconfig/Kbuild	2011-08-01 00:10:52.000000000 +0200
+@@ -27,5 +27,3 @@
+ # Cleaning
+ clean-dirs := static shared
+ 
+-# install binary
+-install-y := $(shared-y)
+
+Index: klibc-1.5.24/usr/kinit/Kbuild
+===================================================================
+--- a/usr/kinit/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/kinit/Kbuild	2011-08-01 00:20:18.000000000 +0200
+@@ -33,5 +33,3 @@
+ subdir- := fstype ipconfig nfsmount resume run-init
+ 
+ 
+-# install binary
+-install-y := kinit kinit.shared
+
+Index: klibc-1.5.24/usr/kinit/nfsmount/Kbuild
+===================================================================
+--- a/usr/kinit/nfsmount/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/kinit/nfsmount/Kbuild	2011-08-01 00:12:52.000000000 +0200
+@@ -23,5 +23,3 @@
+ 
+ clean-dirs := static shared
+ 
+-# Install binary
+-install-y := $(shared-y)
+
+Index: klibc-1.5.24/usr/kinit/resume/Kbuild
+===================================================================
+--- a/usr/kinit/resume/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/kinit/resume/Kbuild	2011-08-01 00:13:51.000000000 +0200
+@@ -26,5 +26,3 @@
+ # Cleaning
+ clean-dirs := static shared
+ 
+-# install binary
+-install-y := $(shared-y)
+
+Index: klibc-1.5.24/usr/kinit/run-init/Kbuild
+===================================================================
+--- a/usr/kinit/run-init/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/kinit/run-init/Kbuild	2011-08-01 00:14:41.000000000 +0200
+@@ -25,5 +25,3 @@
+ # Cleaning
+ clean-dirs := static shared
+ 
+-# install binary
+-install-y := $(shared-y)
+
+Index: klibc-1.5.24/usr/klibc/Kbuild
+===================================================================
+--- a/usr/klibc/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/klibc/Kbuild	2011-08-01 00:18:11.000000000 +0200
+@@ -177,5 +177,3 @@
+ 	          $(INSTALLROOT)$(INSTALLDIR)/$(KLIBCCROSS)lib))
+ 	$(Q)$(install-lib) $(obj)/klibc-$(SOLIBHASH).so \
+ 	                      $(INSTALLROOT)$(INSTALLDIR)/$(KLIBCCROSS)lib
+-	$(Q)$(install-lib) $(obj)/klibc-$(SOLIBHASH).so \
+-	                      $(INSTALLROOT)$(SHLIBDIR)
+
+Index: klibc-1.5.24/usr/utils/Kbuild
+===================================================================
+--- a/usr/utils/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/utils/Kbuild	2011-08-01 00:19:13.000000000 +0200
+@@ -72,5 +72,3 @@
+ # Clean deletes the static and shared dir
+ clean-dirs := static shared
+ 
+-# install only install the shared binaries
+-install-y := $(shared-y) shared/reboot shared/poweroff
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/use-env-for-perl.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/use-env-for-perl.patch
new file mode 100644
index 0000000..eac128c
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/use-env-for-perl.patch
@@ -0,0 +1,25 @@
+Patch was imported from the OpenEmbedded git server
+(git://git.openembedded.org/openembedded)
+as of commit id 676cbb54d42c89a4832871064cfcb7ee2ad372ee
+
+klcc-cross: Add patch to use /usr/bin/env perl
+Certain configurations (such as autobuilders) may build in very
+deep paths (that are longer than the #! mechanism allows) which
+makes it unsafe to use the direct path for perl.  In our case we know
+that /usr/bin/env perl will always return ours (if it has been built).
+
+Signed-off-by: Tom Rini <tom_rini@mentor.com>
+
+Index: klibc-1.5.20/klcc/makeklcc.pl
+===================================================================
+--- a/klcc/makeklcc.pl
++++ b/klcc/makeklcc.pl
+@@ -26,7 +26,7 @@ sub pathsearch($) {
+     return undef;
+ }
+ 
+-print "#!${perlpath}\n";
++print "#!/usr/bin/env perl\n";
+ 
+ open(KLIBCCONF, "< $klibcconf\0")
+     or die "$0: cannot open $klibcconf: $!\n";
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.1.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.1.bb
deleted file mode 100644
index 484134e..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-PR = "${INC_PR}.0"
-
-KLIBC_UTILS_VARIANT = "static"
-KLIBC_UTILS_PKGNAME = "klibc-static-utils"
-
-FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
-
-do_install() {
-        :
-}
-
-PACKAGES_${PN} = "${PN}"
-FILES_${PN} = ""
-
-require klibc-utils.inc
-require klibc.inc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.2.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.2.bb
new file mode 100644
index 0000000..484134e
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.2.bb
@@ -0,0 +1,16 @@
+PR = "${INC_PR}.0"
+
+KLIBC_UTILS_VARIANT = "static"
+KLIBC_UTILS_PKGNAME = "klibc-static-utils"
+
+FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
+
+do_install() {
+        :
+}
+
+PACKAGES_${PN} = "${PN}"
+FILES_${PN} = ""
+
+require klibc-utils.inc
+require klibc.inc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.1.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.1.bb
deleted file mode 100644
index 37cab84..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-PR = "${INC_PR}.0"
-
-KLIBC_UTILS_VARIANT = "shared"
-KLIBC_UTILS_PKGNAME = "klibc-utils"
-
-FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
-
-do_install() {
-        :
-}
-
-PACKAGES_${PN} = "${PN}"
-FILES_${PN} = ""
-
-require klibc-utils.inc
-require klibc.inc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb
new file mode 100644
index 0000000..37cab84
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb
@@ -0,0 +1,16 @@
+PR = "${INC_PR}.0"
+
+KLIBC_UTILS_VARIANT = "shared"
+KLIBC_UTILS_PKGNAME = "klibc-utils"
+
+FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
+
+do_install() {
+        :
+}
+
+PACKAGES_${PN} = "${PN}"
+FILES_${PN} = ""
+
+require klibc-utils.inc
+require klibc.inc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 07b8e1a..a95706e 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8
 # debugsources.list: No such file or directory:
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-INC_PR = "r1"
+INC_PR = "r0"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_armeb = 'arm'
@@ -21,7 +21,7 @@ KLIBC_ARCH_i586 = 'i386'
 KLIBC_ARCH_i686 = 'i386'
 KLIBC_ARCH_pentium = 'i386'
 
-SRCREV = "1a6f222b01cead2ec48556203f0e200107eb4c2f"
+SRCREV = "f05ff116bb9edbbb81d82fa47b78e630ce878470"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git;protocol=git"
 
 SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch"
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.1.bb b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.1.bb
deleted file mode 100644
index 8eaab2c..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.1.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-PR = "${INC_PR}.0"
-
-export INST = "${D}"
-
-do_install() {
-
-        oe_runmake install
-
-        # the crosscompiler is packaged by klcc-cross
-        # remove klcc
-        rm ${D}${base_bindir}/klcc
-        # remove now empty dir
-        rmdir ${D}${base_bindir}
-
-        install -d ${D}${base_libdir}
-        install -m 755 usr/klibc/klibc-*.so ${D}${base_libdir}
-        (cd  ${D}${base_libdir}; ln -s klibc-*.so klibc.so)
-
-}
-
-PACKAGES = "libklibc libklibc-staticdev libklibc-dev"
-FILES_libklibc = "${base_libdir}/klibc-*.so"
-FILES_libklibc-staticdev = "${base_libdir}/klibc/lib/libc.a"
-FILES_libklibc-dev = "${base_libdir}/klibc.so \
-                      ${base_libdir}/klibc/lib/* \
-                      ${base_libdir}/klibc/include/* \
-                      "
-require klibc.inc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb
new file mode 100644
index 0000000..8eaab2c
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb
@@ -0,0 +1,28 @@
+PR = "${INC_PR}.0"
+
+export INST = "${D}"
+
+do_install() {
+
+        oe_runmake install
+
+        # the crosscompiler is packaged by klcc-cross
+        # remove klcc
+        rm ${D}${base_bindir}/klcc
+        # remove now empty dir
+        rmdir ${D}${base_bindir}
+
+        install -d ${D}${base_libdir}
+        install -m 755 usr/klibc/klibc-*.so ${D}${base_libdir}
+        (cd  ${D}${base_libdir}; ln -s klibc-*.so klibc.so)
+
+}
+
+PACKAGES = "libklibc libklibc-staticdev libklibc-dev"
+FILES_libklibc = "${base_libdir}/klibc-*.so"
+FILES_libklibc-staticdev = "${base_libdir}/klibc/lib/libc.a"
+FILES_libklibc-dev = "${base_libdir}/klibc.so \
+                      ${base_libdir}/klibc/lib/* \
+                      ${base_libdir}/klibc/include/* \
+                      "
+require klibc.inc
-- 
1.7.8.6



