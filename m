Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0062C7E6B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 17:50:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45TXXl2CMLz5Q
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 19:50:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560966615;
	bh=iV9lyycAR3zZePZDKbI0ntNGG/4lOLkQZsmj0zEMcM8=;
	h=From:To:Subject:Date:From;
	b=q+7d1w9B7V973tPilPwhRJeXLBaodFW0Aur9TIaqdV8+HgBk8vMBTPDpq8vcv/vrV
	SL+2EjwtP7L+S2ypMy8EIV1Uj6YlxmQ1nl7TpNfjJYF46Cog+kfalPFr4vPxUk5I0h
	BtICw4BDPj62wwvnsYSBWqOAItGgl7noO+0vdar6ISaEpfddFOas/JxW3HQAuWtHny
	KgAd+wc37OSwCsj3DInfJDwwkwjPTvXI9tI7Nd51bUvvfkLDe3osQ+DiB4SuUIaikz
	v3Ada2d7G7CY//qF8/e58LGrMxYA8fTCMNMJajZzQOSrGa6yxcRm623tvdgN5QYMJl
	GY2/ziL6k0cJGw234Fn0tR6Xqwe4fK2g+n7lz2avI4WA4h75eiBo5ePUZCdHZ7Ks1o
	IpROTaXXu0BvIcvTo0HGgCbdsKjuv1ACKsrXYnrDcafsVijgR+XOq++vjzQK12CB5X
	E+oXth3YXNW0WhDifJ5vcgSTKi7Gdqulc+s2XW9SD5sQ2Jg3YxuNVi4IXJoNOQjwrw
	h2hCub1w23lW78G/X9cUK9hbf2rDxHcMFXHRraqflBB49wpsUKXxyIgLLXN9TL1/TD
	t8Xeb3reFD6yEsHI+qPsKQjeS53otUlUNVfntbemqet+yGsNdCgldi5VDbNHwV/fdx
	UkUFaZUEewxhP6HNqSXtkpyE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2019 20:50:12 +0300
Message-Id: <20190619175012.10984-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] efivar: Remove, was moved to oe-core
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
X-List-Received-Date: Wed, 19 Jun 2019 17:50:15 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../0001-efivar-fix-for-cross-compile.patch   | 32 --------------
 ...04-fix-unknow-option-for-gold-linker.patch | 35 ---------------
 .../allow-multi-definitions-for-native.patch  | 36 ----------------
 meta-oe/recipes-bsp/efivar/efivar_37.bb       | 43 -------------------
 4 files changed, 146 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
 delete mode 100644 meta-oe/recipes-bsp/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
 delete mode 100644 meta-oe/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch
 delete mode 100644 meta-oe/recipes-bsp/efivar/efivar_37.bb

diff --git a/meta-oe/recipes-bsp/efivar/efivar/0001-efivar-fix-for-cross-compile.patch b/meta-oe/recipes-bsp/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
deleted file mode 100644
index 251e50c90..000000000
--- a/meta-oe/recipes-bsp/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a9115d9e6f0f62d6bb735ce3698858d1f89f8d73 Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Fri, 25 Sep 2015 18:14:31 +0800
-Subject: [PATCH] efivar: fix for cross compile
-
-It builds and calls elf file makeguids to generate a header file which
-doesn't work for cross compile. Fix it.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-Upstream-Status: Pending
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- src/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 0c16597..dcc7fc8 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -40,8 +40,8 @@ abicheck : $(patsubst %.so,%.abicheck,$(LIBTARGETS))
- ./guid-symbols.c : include/efivar/efivar-guids.h
- ./guids.bin : include/efivar/efivar-guids.h
- ./names.bin : include/efivar/efivar-guids.h
--include/efivar/efivar-guids.h : makeguids guids.txt
--	./makeguids guids.txt guids.bin names.bin \
-+include/efivar/efivar-guids.h : guids.txt
-+	makeguids guids.txt guids.bin names.bin \
- 		guid-symbols.c include/efivar/efivar-guids.h
- 
- makeguids : CPPFLAGS+=-DEFIVAR_BUILD_ENVIRONMENT
diff --git a/meta-oe/recipes-bsp/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch b/meta-oe/recipes-bsp/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
deleted file mode 100644
index 96d0c6b3b..000000000
--- a/meta-oe/recipes-bsp/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From b3d35e7dd27a755df5acbe050837885914dbb28b Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 10 May 2016 11:34:50 -0400
-Subject: [PATCH]  fix unknow option for gold linker
-
-- Revert the following patch, since oe-core work with gcc 5
-...
-commit 3055a3797f16693dfdd855fa68bc57fd900dc408
-Author: Peter Jones <pjones@redhat.com>
-Date:   Mon Feb 15 14:15:40 2016 -0500
-
-    Make gcc.specs work with gcc 6 / binutils 2.26
-
-    Apparently binutils 2.26 gets real picky about "ld -PIC" vs "ld -fPIC".
-
-    Signed-off-by: Peter Jones <pjones@redhat.com>
-...
-
-- Remove unknown option '--add-needed'
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- gcc.specs | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: git/gcc.specs
-===================================================================
---- git.orig/gcc.specs
-+++ git/gcc.specs
-@@ -14,4 +14,4 @@
- + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings -Wl,-static -static -Wl,-z,relro,-z,now}
- 
- *link:
--+ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib-undefined --add-needed -z now --build-id %{!static:%{!shared:-pie}} %{shared:-z relro} %{static:%<pie}
-++ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib-undefined -z now --build-id %{!static:%{!shared:-pie}} %{shared:-z relro} %{static:%<pie}
diff --git a/meta-oe/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch b/meta-oe/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch
deleted file mode 100644
index 043b07a65..000000000
--- a/meta-oe/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From c10368b397483a2fc7b493c099d8416d902f8cd8 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 31 Jul 2018 14:18:35 +0800
-Subject: [PATCH] allow multi definitions for native
-
-Upstream-Status: Pending
-
-It fails to create .so file when build efivar-native:
-
-| lib.o:(*IND*+0x0): multiple definition of `efi_set_variable'
-| lib.o:lib.c:(.text+0xa0): first defined here
-
-Add link option '-z muldefs' to fix it.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Make.rules | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Make.rules b/Make.rules
-index 042585b..257ba45 100644
---- a/Make.rules
-+++ b/Make.rules
-@@ -20,6 +20,7 @@ include $(TOPDIR)/Make.version
- 	$(CCLD) $(ccldflags) $(CPPFLAGS) $(SOFLAGS) \
- 	  -Wl,-soname,$@.1 \
- 	  -Wl,--version-script=$(MAP) \
-+	  -Wl,-z,muldefs \
- 	  -o $@ $^ $(LDLIBS)
- 	ln -vfs $@ $@.1
- 
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-bsp/efivar/efivar_37.bb b/meta-oe/recipes-bsp/efivar/efivar_37.bb
deleted file mode 100644
index 4b458dedd..000000000
--- a/meta-oe/recipes-bsp/efivar/efivar_37.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-SUMMARY = "Tools to manipulate UEFI variables"
-DESCRIPTION = "efivar provides a simple command line interface to the UEFI variable facility"
-HOMEPAGE = "https://github.com/rhinstaller/efivar"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
-
-DEPENDS = "popt"
-DEPENDS_append_class-target = " efivar-native"
-
-inherit pkgconfig
-
-COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
-
-SRCREV = "c1d6b10e1ed4ba2be07f385eae5bceb694478a10"
-SRC_URI = "git://github.com/rhinstaller/efivar.git \
-           file://allow-multi-definitions-for-native.patch \
-           "
-SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch \
-                                ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'file://0004-fix-unknow-option-for-gold-linker.patch', '', d)} \
-                              "
-
-S = "${WORKDIR}/git"
-
-do_compile_prepend() {
-    sed -i -e s:-Werror::g ${S}/gcc.specs
-}
-
-do_compile_class-native() {
-    oe_runmake -C src makeguids CC_FOR_BUILD="${BUILD_CC}"
-}
-
-do_install() {
-    oe_runmake install DESTDIR=${D}
-}
-
-do_install_class-native() {
-    install -D -m 0755 ${B}/src/makeguids ${D}${bindir}/makeguids
-}
-
-BBCLASSEXTEND = "native"
-
-RRECOMMENDS_${PN}_class-target = "kernel-module-efivarfs"
-- 
2.17.1


