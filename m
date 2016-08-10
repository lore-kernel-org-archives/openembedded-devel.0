Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D3D50771FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:50:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7A9oLlS012872
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Aug 2016 02:50:21 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 10 Aug 2016 02:50:21 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Aug 2016 17:49:50 +0800
Message-ID: <20160810094950.7396-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.2.368.g08bb350
MIME-Version: 1.0
Subject: [meta-oe][PATCH] efivar: 0.23 -> 0.24
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
X-List-Received-Date: Wed, 10 Aug 2016 09:50:23 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade efivar from 0.23 to 0.24. Enable full native build at same
time and add patch to fix compile error of "multiple definition of
`efi_set_variable'".

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../allow-multi-definitions-for-native.patch       | 23 ++++++++++++++++++++++
 .../efivar/{efivar_0.23.bb => efivar_0.24.bb}      | 17 ++++++++--------
 2 files changed, 31 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/allow-multi-definitions-for-native.patch
 rename meta-oe/recipes-extended/efivar/{efivar_0.23.bb => efivar_0.24.bb} (76%)

diff --git a/meta-oe/recipes-extended/efivar/efivar/allow-multi-definitions-for-native.patch b/meta-oe/recipes-extended/efivar/efivar/allow-multi-definitions-for-native.patch
new file mode 100644
index 0000000..87f5555
--- /dev/null
+++ b/meta-oe/recipes-extended/efivar/efivar/allow-multi-definitions-for-native.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Pending
+
+It fails to create .so file when build efivar-native:
+
+| lib.o:(*IND*+0x0): multiple definition of `efi_set_variable'
+| lib.o:lib.c:(.text+0xa0): first defined here
+
+Add link option '-z muldefs' to fix it.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/Make.rules b/Make.rules
+index d9c0609..874bce0 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -20,6 +20,7 @@ include $(TOPDIR)/Make.version
+ 	$(CCLD) $(ccldflags) $(CPPFLAGS) $(SOFLAGS) \
+ 	  -Wl,-soname,$@.$(MAJOR_VERSION) \
+ 	  -Wl,--version-script=$(MAP) \
++	  -Wl,-z,muldefs \
+ 	  -o $@ $^ $(LDLIBS)
+ 
+ %.o : %.c
diff --git a/meta-oe/recipes-extended/efivar/efivar_0.23.bb b/meta-oe/recipes-extended/efivar/efivar_0.24.bb
similarity index 76%
rename from meta-oe/recipes-extended/efivar/efivar_0.23.bb
rename to meta-oe/recipes-extended/efivar/efivar_0.24.bb
index 5879031..35412b6 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.23.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.24.bb
@@ -5,18 +5,21 @@ HOMEPAGE = "https://github.com/rhinstaller/efivar"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 
-DEPENDS_class-target = "popt efivar-native"
+DEPENDS = "popt"
+DEPENDS_append_class-target = " efivar-native"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRCREV = "7367d78281fa3ce390e10c7c9f4608c58e7a6d3d"
-SRC_URI = "git://github.com/rhinstaller/efivar.git"
+SRCREV = "963cb2e5adc145fe00717f94e382f2973f80e753"
+SRC_URI = "git://github.com/rhinstaller/efivar.git \
+           file://0002-disable-static-build.patch \
+"
 SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch \
-                                file://0002-disable-static-build.patch \
                                 file://0003-efivar-fix-for-cross-compile.patch \
                                 file://0004-fix-unknow-option-for-gold-linker.patch \
                               "
 SRC_URI_append_class-native = " file://fix-compile-failure-with-host-gcc-4.6.patch \
+                                file://allow-multi-definitions-for-native.patch \
                               "
 
 S = "${WORKDIR}/git"
@@ -28,15 +31,11 @@ do_compile_prepend() {
     sed -i -e s:-Werror::g ${S}/gcc.specs
 }
 
-do_compile_class-native() {
-    oe_runmake -C src makeguids
-}
-
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
 
-do_install_class-native() {
+do_install_append_class-native() {
     install -D -m 0755 ${B}/src/makeguids ${D}${bindir}/makeguids
 }
 
-- 
2.9.2.368.g08bb350


