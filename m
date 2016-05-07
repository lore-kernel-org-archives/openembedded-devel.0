Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFD18731AF
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 May 2016 07:01:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4771XB6027990
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 7 May 2016 00:01:33 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 7 May 2016 00:01:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 7 May 2016 03:01:25 -0400
Message-ID: <cf648238ca6dcbe681a6d62a454ae5326bb7c34f.1462603608.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1462603608.git.hongxu.jia@windriver.com>
References: <cover.1462603608.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: koen.kooi@linaro.org
Subject: [PATCH 1/3] efivar: update to 0.23
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
X-List-Received-Date: Sat, 07 May 2016 07:01:35 -0000
Content-Type: text/plain

From: Koen Kooi <koen.kooi@linaro.org>

Upstream removed the use of the nvme headers completely,
so no more conflicts. Also drop gcc options patch, ubuntu
12.04 is too old to support in meta-oe/master.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../efivar/0001-efivar-fix-for-cross-compile.patch | 28 +++++----
 .../efivar/efivar/0002-disable-static-build.patch  | 33 ++++++++++
 ...ptions-not-supported-by-lower-version-gcc.patch | 71 ----------------------
 .../efivar/{efivar_0.21.bb => efivar_0.23.bb}      | 27 ++++----
 4 files changed, 62 insertions(+), 97 deletions(-)
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
 delete mode 100644 meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch
 rename meta-oe/recipes-extended/efivar/{efivar_0.21.bb => efivar_0.23.bb} (46%)

diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
index 4bd7d95..6f6ca64 100644
--- a/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
+++ b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
@@ -1,31 +1,35 @@
-From 7036e8b0dca61432970789e5397b6fb02b362c2b Mon Sep 17 00:00:00 2001
+From 9a3c480af653b37e62d1be04d49fe7a60a80168f Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 25 Sep 2015 18:14:31 +0800
-Subject: [PATCH] efivar: fix for cross compile
+Subject: [PATCH 1/2] efivar: fix for cross compile
 
 It builds and calls elf file makeguids to generate a header file which
 doesn't work for cross compile. Fix it.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Upstream-Status: Pending
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  src/Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 6eac858..ef4eb1d 100644
+index 5fc7887..1829d22 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -65,8 +65,8 @@ makeguids.o : makeguids.c
- makeguids : makeguids.o fakeguid.o
- 	$(CC) $(cflags) -o $@ $^ -ldl
- 
+@@ -29,8 +29,8 @@ all : deps $(TARGETS)
+ ./guid-symbols.c : include/efivar/efivar-guids.h
+ ./guids.bin : include/efivar/efivar-guids.h
+ ./names.bin : include/efivar/efivar-guids.h
 -include/efivar/efivar-guids.h : makeguids guids.txt
--	./makeguids guids.txt guids.bin names.bin guid-symbols.S $@
+-	./makeguids guids.txt guids.bin names.bin \
 +include/efivar/efivar-guids.h : guids.txt
-+	makeguids guids.txt guids.bin names.bin guid-symbols.S $@
++	makeguids guids.txt guids.bin names.bin \
+ 		guid-symbols.c include/efivar/efivar-guids.h
  
- guidlist.o : guids.S include/efivar/efivar-guids.h
- 	$(CC) $(cflags) -c -o guidlist.o guids.S
+ makeguids : CPPFLAGS+=-DEFIVAR_BUILD_ENVIRONMENT
 -- 
-2.6.0.rc2.10.gf4d9753
+2.4.3
 
diff --git a/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch b/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
new file mode 100644
index 0000000..951b159
--- /dev/null
+++ b/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
@@ -0,0 +1,33 @@
+From 126e0d3c1ad74cf5b0abe9e98ec444bcc3c83159 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen.kooi@linaro.org>
+Date: Fri, 4 Mar 2016 14:53:55 +0100
+Subject: [PATCH 2/2] disable static build
+
+Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
+
+Upstream-Status: Inappropriate [meta-oe specific]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ src/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 1829d22..c7a0ca3 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -8,9 +8,9 @@ include $(TOPDIR)/Make.defaults
+ 
+ LIBTARGETS=libefivar.so libefiboot.so
+ STATICLIBTARGETS=libefivar.a libefiboot.a
+-BINTARGETS=efivar efivar-static
++BINTARGETS=efivar
+ PCTARGETS=efivar.pc efiboot.pc
+-TARGETS=$(LIBTARGETS) $(STATICLIBTARGETS) $(BINTARGETS) $(PCTARGETS)
++TARGETS=$(LIBTARGETS) $(BINTARGETS) $(PCTARGETS)
+ 
+ LIBEFIBOOT_SOURCES = crc32.c creator.c disk.c gpt.c linux.c loadopt.c
+ LIBEFIBOOT_OBJECTS = $(patsubst %.c,%.o,$(LIBEFIBOOT_SOURCES))
+-- 
+2.4.3
+
diff --git a/meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch b/meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch
deleted file mode 100644
index 7f04b19..0000000
--- a/meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-gcc options '-Wmaybe-uninitialized' and '-std=gnu11' are not recognized by gcc
-whose version is lower than 4.6, such as on Ubuntu 12.04. Drop them for backward
-compatible.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-diff --git a/Make.defaults b/Make.defaults
-index cc2baa9..118ae56 100644
---- a/Make.defaults
-+++ b/Make.defaults
-@@ -10,10 +10,9 @@ CFLAGS	?= -O2 -g
- 
- ARCH = $(shell uname -m)
- clang_cflags =
--gcc_cflags = -Wmaybe-uninitialized
- cflags	:= $(CFLAGS) \
- 	-Werror -Wall -Wsign-compare -Wstrict-aliasing \
--	-std=gnu11 -fshort-wchar -fPIC \
-+	-fshort-wchar -fPIC \
- 	-fvisibility=hidden \
- 	-D_GNU_SOURCE -I${TOPDIR}/src/include/efivar/ \
- 	$(if $(filter $(CC),clang),$(clang_cflags),) \
-diff --git a/src/guid.h b/src/guid.h
-index 9542ee1..0817991 100644
---- a/src/guid.h
-+++ b/src/guid.h
-@@ -31,7 +31,8 @@ static inline int
- real_isspace(char c)
- {
- 	char spaces[] = " \f\n\r\t\v";
--	for (int i = 0; spaces[i] != '\0'; i++)
-+	int i;
-+	for (i = 0; spaces[i] != '\0'; i++)
- 		if (c == spaces[i])
- 			return 1;
- 	return 0;
-@@ -59,7 +60,8 @@ check_sanity(const char *text, size_t len)
- static inline int
- check_segment_sanity(const char *text, size_t len)
- {
--	for(unsigned int i = 0; i < len; i++) {
-+	unsigned int i;
-+	for(i = 0; i < len; i++) {
- 		if (text[i] >= '0' && text[i] <= '9')
- 			continue;
- 		/* "| 0x20" is tolower() without having to worry about
-diff --git a/src/makeguids.c b/src/makeguids.c
-index e9acf15..7e16cb2 100644
---- a/src/makeguids.c
-+++ b/src/makeguids.c
-@@ -150,7 +150,8 @@ main(int argc, char *argv[])
- 
- 	fprintf(header, "#ifndef EFIVAR_GUIDS_H\n#define EFIVAR_GUIDS_H 1\n\n");
- 
--	for (unsigned int i = 0; i < line-1; i++) {
-+	unsigned int i, j;
-+	for (i = 0; i < line-1; i++) {
- 		if (!strcmp(outbuf[i].symbol, "efi_guid_zero"))
- 			fprintf(symout, "\t.globl %s\n"
- 					"\t.data\n"
-@@ -176,7 +177,7 @@ main(int argc, char *argv[])
- 			fprintf(symout, "efi_guid_empty:\n");
- 
- 		uint8_t *guid_data = (uint8_t *) &outbuf[i].guid;
--		for (unsigned int j = 0; j < sizeof (efi_guid_t); j++)
-+		for (j = 0; j < sizeof (efi_guid_t); j++)
- 			fprintf(symout,"\t.byte 0x%02x\n", guid_data[j]);
- 
- 		fprintf(symout, "%s_end:\n", outbuf[i].symbol);
diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb b/meta-oe/recipes-extended/efivar/efivar_0.23.bb
similarity index 46%
rename from meta-oe/recipes-extended/efivar/efivar_0.21.bb
rename to meta-oe/recipes-extended/efivar/efivar_0.23.bb
index f7a4d55..b41be03 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.23.bb
@@ -7,33 +7,32 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 
 DEPENDS_class-target = "popt efivar-native"
 
-SRCREV = "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
+SRCREV = "01abee43d6d6e755f56a4135ab5aa0bfad609ce2"
 SRC_URI = "git://github.com/rhinstaller/efivar.git"
-SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch"
-SRC_URI_append_class-native = " file://efivar-drop-options-not-supported-by-lower-version-gcc.patch"
+SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch \
+                                file://0002-disable-static-build.patch \
+                              "
 
 S = "${WORKDIR}/git"
 
-do_install() {
-    oe_runmake install DESTDIR=${D}
+# Setting CROSS_COMPILE breaks pkgconfig, so just set AR
+EXTRA_OEMAKE = "AR=${TARGET_PREFIX}gcc-ar"
+
+do_compile_prepend() {
+    sed -i -e s:-Werror::g ${S}/gcc.specs
 }
 
 do_compile_class-native() {
     oe_runmake -C src makeguids
 }
 
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
 do_install_class-native() {
     install -D -m 0755 ${B}/src/makeguids ${D}${bindir}/makeguids
 }
 
 BBCLASSEXTEND = "native"
 
-# See
-# http://lists.openembedded.org/pipermail/openembedded-core/2016-February/116564.html
-# http://lists.openembedded.org/pipermail/openembedded-core/2016-February/116571.html
-# http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105802.html
-# http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105786.html
-# but it's still broken:
-# http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105825.html
-# http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105830.html
-PNBLACKLIST[efivar] ?= "BROKEN: linux.c:27:30: fatal error: linux/nvme_ioctl.h: No such file or directory"
-- 
2.8.1


