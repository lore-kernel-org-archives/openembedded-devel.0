Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 46A5062133
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2016 07:15:01 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p65so7888360wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2016 23:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=lDao7xZ0QFm0vc2BqDDZXI+o/gUS0q5o7fVmWAPSs+o=;
	b=aFIq9XNNDtmDJQ7WTfN8hWgwFQ2BNDlW5AynNj8ya1oDphUYumL/6bB4gr9Cf3mU0i
	+uz55yo3s39FkNFIApJmkM0FyLa3YMy3yQR/V3GwcRehpX4QdE7IbIYcW7OSyBIDNEMB
	mH3+iCz0FoHcFIwHfJaAbQiyTMViyD5jLSJts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lDao7xZ0QFm0vc2BqDDZXI+o/gUS0q5o7fVmWAPSs+o=;
	b=N5Ut6n8gROzb4mlqPevosVm4vc5om1rZS2TE9T+14kTaOSRK7o8MtYux0GXleY6Pr/
	I/+zqnsvpC74gaydM4buAKpAKWM97K322cAnpLmb0G1FGS/Bu9khckUICTJQxdIDWJTS
	xRLvFalBWi6DXcjWHePPkxsCl/LXtl5o0TD7lhh666CspXhQgM9d/n1iwtibynrohXfu
	2WSRcwQ40QPoHIL3OlTt5QpwglW8Z2MVN3CG3Ypxw9+WnCeB/VpRZ+mfbVhbHBO69kkl
	rt0yMC5Fwp+swRgNI3j4b5jD25S7M+rw9DPmwNjh71+N2NUOcy0ZP1EQsvRuHZ7CD/K8
	VILQ==
X-Gm-Message-State: AD7BkJJRTvSq+98JLK2TRLpVnVEcSDwe3hDQ7JCAafG7WhPnmuXKlv9rJkVWeCArMmoCaZDD
X-Received: by 10.28.172.194 with SMTP id v185mr3168862wme.21.1457075702285;
	Thu, 03 Mar 2016 23:15:02 -0800 (PST)
Received: from thinkpad.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by smtp.gmail.com with ESMTPSA id i2sm1904939wje.22.2016.03.03.23.15.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Mar 2016 23:15:00 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Mar 2016 08:14:54 +0100
Message-Id: <1457075695-17045-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH v2 1/2] efivar: update to 0.23
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
X-List-Received-Date: Fri, 04 Mar 2016 07:15:02 -0000

Upstream removed the use of the nvme headers completely, so no more conflicts. Also drop gcc options patch, ubuntu 12.04 is too old to support in meta-oe/master.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 .../efivar/0001-efivar-fix-for-cross-compile.patch | 21 +++----
 ...ptions-not-supported-by-lower-version-gcc.patch | 71 ----------------------
 meta-oe/recipes-extended/efivar/efivar_0.21.bb     | 39 ------------
 meta-oe/recipes-extended/efivar/efivar_0.23.bb     | 36 +++++++++++
 4 files changed, 45 insertions(+), 122 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch
 delete mode 100644 meta-oe/recipes-extended/efivar/efivar_0.21.bb
 create mode 100644 meta-oe/recipes-extended/efivar/efivar_0.23.bb

diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
index 4bd7d95..b02edd9 100644
--- a/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
+++ b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
@@ -12,20 +12,17 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
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
--- 
-2.6.0.rc2.10.gf4d9753
-
+ makeguids : CPPFLAGS+=-DEFIVAR_BUILD_ENVIRONMENT
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
diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
deleted file mode 100644
index f7a4d55..0000000
--- a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Tools to manipulate UEFI variables"
-DESCRIPTION = "efivar provides a simple command line interface to the UEFI variable facility"
-HOMEPAGE = "https://github.com/rhinstaller/efivar"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
-
-DEPENDS_class-target = "popt efivar-native"
-
-SRCREV = "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
-SRC_URI = "git://github.com/rhinstaller/efivar.git"
-SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch"
-SRC_URI_append_class-native = " file://efivar-drop-options-not-supported-by-lower-version-gcc.patch"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-    oe_runmake install DESTDIR=${D}
-}
-
-do_compile_class-native() {
-    oe_runmake -C src makeguids
-}
-
-do_install_class-native() {
-    install -D -m 0755 ${B}/src/makeguids ${D}${bindir}/makeguids
-}
-
-BBCLASSEXTEND = "native"
-
-# See
-# http://lists.openembedded.org/pipermail/openembedded-core/2016-February/116564.html
-# http://lists.openembedded.org/pipermail/openembedded-core/2016-February/116571.html
-# http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105802.html
-# http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105786.html
-# but it's still broken:
-# http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105825.html
-# http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105830.html
-PNBLACKLIST[efivar] ?= "BROKEN: linux.c:27:30: fatal error: linux/nvme_ioctl.h: No such file or directory"
diff --git a/meta-oe/recipes-extended/efivar/efivar_0.23.bb b/meta-oe/recipes-extended/efivar/efivar_0.23.bb
new file mode 100644
index 0000000..faffb79
--- /dev/null
+++ b/meta-oe/recipes-extended/efivar/efivar_0.23.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Tools to manipulate UEFI variables"
+DESCRIPTION = "efivar provides a simple command line interface to the UEFI variable facility"
+HOMEPAGE = "https://github.com/rhinstaller/efivar"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
+
+DEPENDS_class-target = "popt efivar-native"
+
+SRCREV = "01abee43d6d6e755f56a4135ab5aa0bfad609ce2"
+SRC_URI = "git://github.com/rhinstaller/efivar.git"
+SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch"
+
+S = "${WORKDIR}/git"
+
+# Setting CROSS_COMPILE breaks pkgconfig, so just set AR
+EXTRA_OEMAKE = "AR=${TARGET_PREFIX}gcc-ar"
+
+do_compile_prepend() {
+    sed -i -e s:-Werror::g ${S}/gcc.specs
+}
+
+do_compile_class-native() {
+    oe_runmake -C src makeguids
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+do_install_class-native() {
+    install -D -m 0755 ${B}/src/makeguids ${D}${bindir}/makeguids
+}
+
+BBCLASSEXTEND = "native"
+
-- 
2.4.3


