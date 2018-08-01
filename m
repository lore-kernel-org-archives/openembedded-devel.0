Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B68BC78D63
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 07:11:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w717BjTx022183
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2018 00:11:45 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 00:11:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 1 Aug 2018 15:21:32 +0800
Message-ID: <1c6a3bcf7c4d2d70876bbaee00b4704732f9307a.1533107855.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533107855.git.hongxu.jia@windriver.com>
References: <cover.1533107855.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/16] efivar: 0.31 -> 0.36
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
X-List-Received-Date: Wed, 01 Aug 2018 07:11:44 -0000
Content-Type: text/plain

- Drop obsolete patches
  0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch
  musl-strndupa.patch
  0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch
  0003-efivar-fix-for-cross-compile.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-Add-Wunknown-attributes-when-using-clang.patch | 33 -----------------
 ...Do-not-use-__bswap_constant_-16-32-macros.patch | 35 ------------------
 .../efivar/0003-efivar-fix-for-cross-compile.patch | 42 ----------------------
 .../allow-multi-definitions-for-native.patch       | 14 +++++---
 .../recipes-bsp/efivar/efivar/musl-strndupa.patch  | 25 -------------
 .../efivar/{efivar_0.31.bb => efivar_0.36.bb}      | 11 ++----
 6 files changed, 11 insertions(+), 149 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch
 delete mode 100644 meta-oe/recipes-bsp/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch
 delete mode 100644 meta-oe/recipes-bsp/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
 delete mode 100644 meta-oe/recipes-bsp/efivar/efivar/musl-strndupa.patch
 rename meta-oe/recipes-bsp/efivar/{efivar_0.31.bb => efivar_0.36.bb} (72%)

diff --git a/meta-oe/recipes-bsp/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch b/meta-oe/recipes-bsp/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch
deleted file mode 100644
index b4ce132..0000000
--- a/meta-oe/recipes-bsp/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From d65c325dd8681edf2ee3332eeb0a547229c7ffb5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 24 Aug 2017 15:54:47 -0700
-Subject: [PATCH] efivar-dp.h: Add -Wunknown-attributes when using clang
-
-change !dp check to a comparision against NULL to silent clang warning
-nonnull parameter 'dp' will evaluate to 'true' on first encounter
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/include/efivar/efivar-dp.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/include/efivar/efivar-dp.h b/src/include/efivar/efivar-dp.h
-index 3a509b7..c140e8d 100644
---- a/src/include/efivar/efivar-dp.h
-+++ b/src/include/efivar/efivar-dp.h
-@@ -783,9 +783,14 @@ extern int efidp_append_instance(const_efidp dp, const_efidp dpi, efidp *out);
-  * though older or other compilers might just ignore that attribute if they
-  * don't support it.  Ugh.
-  */
-+#pragma GCC diagnostic push
- #if defined(__GNUC__) && __GNUC__ >= 6
- #pragma GCC diagnostic ignored "-Wnonnull-compare"
- #endif
-+#if defined(__clang__)
-+#pragma GCC diagnostic ignored "-Wunknown-attributes"
-+#pragma GCC diagnostic ignored "-Wpointer-bool-conversion"
-+#endif
- 
- static inline int16_t
- __attribute__((__artificial__))
diff --git a/meta-oe/recipes-bsp/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch b/meta-oe/recipes-bsp/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch
deleted file mode 100644
index 2a6eb06..0000000
--- a/meta-oe/recipes-bsp/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From dd4291265b7b3d7d7ffa1d8adf32781ae25dbfeb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 15 Jul 2017 00:29:42 -0700
-Subject: [PATCH] makeguids: Do not use __bswap_constant_{16|32} macros
-
-not available on musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/makeguids.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/makeguids.c b/src/makeguids.c
-index da2f5f7..daf821a 100644
---- a/src/makeguids.c
-+++ b/src/makeguids.c
-@@ -155,13 +155,13 @@ main(int argc, char *argv[])
- #if BYTE_ORDER == BIG_ENDIAN\n\
- #define cpu_to_be32(n) (n)\n\
- #define cpu_to_be16(n) (n)\n\
--#define cpu_to_le32(n) (__bswap_constant_32(n))\n\
--#define cpu_to_le16(n) (__bswap_constant_16(n))\n\
-+#define cpu_to_le32(n) ((uint32_t) ((n)>>24 | (n)>>8&0xff00 | (n)<<8&0xff0000 | (n)<<24))\n\
-+#define cpu_to_le16(n) ((uint16_t) ((n)<<8 | (n)>>8))\n\
- #else\n\
- #define cpu_to_le32(n) (n)\n\
- #define cpu_to_le16(n) (n)\n\
--#define cpu_to_be32(n) (__bswap_constant_32(n))\n\
--#define cpu_to_be16(n) (__bswap_constant_16(n))\n\
-+#define cpu_to_be32(n) ((uint32_t) ((n)>>24 | (n)>>8&0xff00 | (n)<<8&0xff0000 | (n)<<24))\n\
-+#define cpu_to_be16(n) ((uint16_t) ((n)<<8 | (n)>>8))\n\
- #endif\n\
- """);
- 
diff --git a/meta-oe/recipes-bsp/efivar/efivar/0003-efivar-fix-for-cross-compile.patch b/meta-oe/recipes-bsp/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
deleted file mode 100644
index 83105fe..0000000
--- a/meta-oe/recipes-bsp/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From dea4a55714249b2734a36701120fd22c91c64ec2 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sat, 7 May 2016 02:06:47 -0400
-Subject: [PATCH] Makefile: fix efivar.pc not found
-
-It fixes efivar.pc not found:
-...
-| install -d -m 755 efivar/0.23-r0/image/usr/lib/pkgconfig/
-| install -m 644 efivar.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
-;  install -m 644 efiboot.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
-;
-| install: cannot stat 'efivar.pc': No such file or directory
-| install: cannot stat 'efiboot.pc': No such file or directory
-| make[1]: *** [install] Error 1
-| make[1]: Leaving directory `efivar/0.23-r0/git/src'
-| make: *** [install] Error 2
-| ERROR: oe_runmake failed
-...
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- src/Makefile | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index dcc7fc8..691aa8a 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -94,7 +94,9 @@ install : all
- 		ln -fs $(x).1.$(VERSION) $(DESTDIR)$(libdir)/$(x) ;\
- 		)
- 	$(INSTALL) -d -m 755 $(DESTDIR)$(PCDIR)
--	$(foreach x, $(PCTARGETS), $(INSTALL) -m 644 $(x) $(DESTDIR)$(PCDIR) ;)
-+	$(foreach x, $(PCTARGETS), $(INSTALL) -m 644 $(TOPDIR)/src/$(x).in $(DESTDIR)$(PCDIR)/$(x) ;\
-+		sed -i -e "s:@@LIBDIR@@:$(libdir):g" -e "s:@@VERSION@@:$(VERSION):g" \
-+			$(DESTDIR)$(PCDIR)/$(x); )
- 	$(INSTALL) -d -m 755 $(DESTDIR)$(includedir)/efivar
- 	$(foreach x, $(wildcard $(TOPDIR)/src/include/efivar/*.h), $(INSTALL) -m 644 $(x) $(DESTDIR)$(includedir)/efivar/$(notdir $(x));)
- 	$(INSTALL) -d -m 755 $(DESTDIR)$(bindir)
diff --git a/meta-oe/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch b/meta-oe/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch
index f88af1f..043b07a 100644
--- a/meta-oe/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch
+++ b/meta-oe/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch
@@ -1,6 +1,6 @@
-From c801dcb03d42eb533a9bead0b397d7ce4fc5a6fe Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Wed, 10 Aug 2016 17:49:50 +0800
+From c10368b397483a2fc7b493c099d8416d902f8cd8 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 31 Jul 2018 14:18:35 +0800
 Subject: [PATCH] allow multi definitions for native
 
 Upstream-Status: Pending
@@ -14,12 +14,13 @@ Add link option '-z muldefs' to fix it.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  Make.rules | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/Make.rules b/Make.rules
-index 88b9aa7..799332f 100644
+index 042585b..257ba45 100644
 --- a/Make.rules
 +++ b/Make.rules
 @@ -20,6 +20,7 @@ include $(TOPDIR)/Make.version
@@ -28,5 +29,8 @@ index 88b9aa7..799332f 100644
  	  -Wl,--version-script=$(MAP) \
 +	  -Wl,-z,muldefs \
  	  -o $@ $^ $(LDLIBS)
+ 	ln -vfs $@ $@.1
  
- %.abixml : %.so
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-bsp/efivar/efivar/musl-strndupa.patch b/meta-oe/recipes-bsp/efivar/efivar/musl-strndupa.patch
deleted file mode 100644
index 5864ac6..0000000
--- a/meta-oe/recipes-bsp/efivar/efivar/musl-strndupa.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 8000b9afc858472912aace985004b44f8eb467e0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 18 Aug 2017 09:49:49 -0700
-Subject: [PATCH] support musl
-
-Upstream-Status: Pending
----
- src/linux.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/linux.c b/src/linux.c
-index 34ed479..1304f2b 100644
---- a/src/linux.c
-+++ b/src/linux.c
-@@ -40,6 +40,10 @@
- #include <efivar.h>
- #include <efiboot.h>
- 
-+#if !defined(__GLIBC__)
-+#define strndupa(x,s) strncpy(alloca(strlen(x)+1),x,s)
-+#endif
-+
- #include "dp.h"
- #include "linux.h"
- #include "util.h"
diff --git a/meta-oe/recipes-bsp/efivar/efivar_0.31.bb b/meta-oe/recipes-bsp/efivar/efivar_0.36.bb
similarity index 72%
rename from meta-oe/recipes-bsp/efivar/efivar_0.31.bb
rename to meta-oe/recipes-bsp/efivar/efivar_0.36.bb
index 9d4cdc9..dfb46c2 100644
--- a/meta-oe/recipes-bsp/efivar/efivar_0.31.bb
+++ b/meta-oe/recipes-bsp/efivar/efivar_0.36.bb
@@ -12,15 +12,11 @@ inherit pkgconfig
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRCREV = "11324799c68193116e1dd5f94b416591bd324f90"
+SRCREV = "ef3449223ecd1e7b1098c523d66b2f960fe839ea"
 SRC_URI = "git://github.com/rhinstaller/efivar.git \
            file://allow-multi-definitions-for-native.patch \
-           file://0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch \
-           file://musl-strndupa.patch \
-           file://0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch \
            "
 SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch \
-                                file://0003-efivar-fix-for-cross-compile.patch \
                                 ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'file://0004-fix-unknow-option-for-gold-linker.patch', '', d)} \
                               "
 SRC_URI_append_class-native = " file://fix-compile-failure-with-host-gcc-4.6.patch \
@@ -28,15 +24,12 @@ SRC_URI_append_class-native = " file://fix-compile-failure-with-host-gcc-4.6.pat
 
 S = "${WORKDIR}/git"
 
-# Setting CROSS_COMPILE breaks pkgconfig, so just set AR
-EXTRA_OEMAKE = "AR=${TARGET_PREFIX}gcc-ar"
-
 do_compile_prepend() {
     sed -i -e s:-Werror::g ${S}/gcc.specs
 }
 
 do_compile_class-native() {
-    oe_runmake -C src makeguids
+    oe_runmake -C src makeguids CC_FOR_BUILD=${BUILD_CC}
 }
 
 do_install() {
-- 
2.7.4


