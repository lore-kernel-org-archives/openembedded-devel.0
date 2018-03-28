Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 86278780A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 06:42:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2S6gD1A024515
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Mar 2018 23:42:13 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 27 Mar 2018 23:42:13 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Mar 2018 02:41:58 -0400
Message-ID: <1522219318-137024-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] efivar: refresh the patches
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
X-List-Received-Date: Wed, 28 Mar 2018 06:42:13 -0000
Content-Type: text/plain

fixes

WARNING: efivar-0.31-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch allow-multi-definitions-for-native.patch
patching file Make.rules
Hunk #1 succeeded at 20 with fuzz 2.

Now at patch allow-multi-definitions-for-native.patch
Now at patch 0003-efivar-fix-for-cross-compile.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...dp.h-Add-Wunknown-attributes-when-using-clang.patch | 17 +++++++++--------
 .../efivar/0001-efivar-fix-for-cross-compile.patch     | 11 ++++-------
 ...ids-Do-not-use-__bswap_constant_-16-32-macros.patch |  6 ++----
 .../efivar/0003-efivar-fix-for-cross-compile.patch     | 14 ++++++--------
 .../efivar/allow-multi-definitions-for-native.patch    | 15 ++++++++++++---
 .../efivar/fix-compile-failure-with-host-gcc-4.6.patch | 11 ++++++-----
 meta-oe/recipes-bsp/efivar/efivar/musl-strndupa.patch  | 18 +++++++++++++-----
 7 files changed, 52 insertions(+), 40 deletions(-)

diff --git a/meta-oe/recipes-bsp/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch b/meta-oe/recipes-bsp/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch
index 1b8815e..b4ce132 100644
--- a/meta-oe/recipes-bsp/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch
+++ b/meta-oe/recipes-bsp/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch
@@ -1,4 +1,4 @@
-From 3d43c5efdb632da5d7387dcadce4e87b83929c64 Mon Sep 17 00:00:00 2001
+From d65c325dd8681edf2ee3332eeb0a547229c7ffb5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 24 Aug 2017 15:54:47 -0700
 Subject: [PATCH] efivar-dp.h: Add -Wunknown-attributes when using clang
@@ -7,15 +7,16 @@ change !dp check to a comparision against NULL to silent clang warning
 nonnull parameter 'dp' will evaluate to 'true' on first encounter
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- src/include/efivar/efivar-dp.h | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
+ src/include/efivar/efivar-dp.h | 5 +++++
+ 1 file changed, 5 insertions(+)
 
-Index: git/src/include/efivar/efivar-dp.h
-===================================================================
---- git.orig/src/include/efivar/efivar-dp.h
-+++ git/src/include/efivar/efivar-dp.h
-@@ -783,9 +783,14 @@ extern int efidp_append_instance(const_e
+diff --git a/src/include/efivar/efivar-dp.h b/src/include/efivar/efivar-dp.h
+index 3a509b7..c140e8d 100644
+--- a/src/include/efivar/efivar-dp.h
++++ b/src/include/efivar/efivar-dp.h
+@@ -783,9 +783,14 @@ extern int efidp_append_instance(const_efidp dp, const_efidp dpi, efidp *out);
   * though older or other compilers might just ignore that attribute if they
   * don't support it.  Ugh.
   */
diff --git a/meta-oe/recipes-bsp/efivar/efivar/0001-efivar-fix-for-cross-compile.patch b/meta-oe/recipes-bsp/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
index 6f6ca64..251e50c 100644
--- a/meta-oe/recipes-bsp/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
+++ b/meta-oe/recipes-bsp/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
@@ -1,7 +1,7 @@
-From 9a3c480af653b37e62d1be04d49fe7a60a80168f Mon Sep 17 00:00:00 2001
+From a9115d9e6f0f62d6bb735ce3698858d1f89f8d73 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 25 Sep 2015 18:14:31 +0800
-Subject: [PATCH 1/2] efivar: fix for cross compile
+Subject: [PATCH] efivar: fix for cross compile
 
 It builds and calls elf file makeguids to generate a header file which
 doesn't work for cross compile. Fix it.
@@ -16,10 +16,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 5fc7887..1829d22 100644
+index 0c16597..dcc7fc8 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -29,8 +29,8 @@ all : deps $(TARGETS)
+@@ -40,8 +40,8 @@ abicheck : $(patsubst %.so,%.abicheck,$(LIBTARGETS))
  ./guid-symbols.c : include/efivar/efivar-guids.h
  ./guids.bin : include/efivar/efivar-guids.h
  ./names.bin : include/efivar/efivar-guids.h
@@ -30,6 +30,3 @@ index 5fc7887..1829d22 100644
  		guid-symbols.c include/efivar/efivar-guids.h
  
  makeguids : CPPFLAGS+=-DEFIVAR_BUILD_ENVIRONMENT
--- 
-2.4.3
-
diff --git a/meta-oe/recipes-bsp/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch b/meta-oe/recipes-bsp/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch
index 73a7721..2a6eb06 100644
--- a/meta-oe/recipes-bsp/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch
+++ b/meta-oe/recipes-bsp/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch
@@ -1,4 +1,4 @@
-From 98b33d4193998687aa3a78c097f7bd4c393e0c85 Mon Sep 17 00:00:00 2001
+From dd4291265b7b3d7d7ffa1d8adf32781ae25dbfeb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Jul 2017 00:29:42 -0700
 Subject: [PATCH] makeguids: Do not use __bswap_constant_{16|32} macros
@@ -6,6 +6,7 @@ Subject: [PATCH] makeguids: Do not use __bswap_constant_{16|32} macros
 not available on musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/makeguids.c | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
@@ -32,6 +33,3 @@ index da2f5f7..daf821a 100644
  #endif\n\
  """);
  
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-bsp/efivar/efivar/0003-efivar-fix-for-cross-compile.patch b/meta-oe/recipes-bsp/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
index 3f43f2a..83105fe 100644
--- a/meta-oe/recipes-bsp/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
+++ b/meta-oe/recipes-bsp/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
@@ -1,4 +1,4 @@
-From 7ead29ca6bb5e280ae07551cc3521281ecf73682 Mon Sep 17 00:00:00 2001
+From dea4a55714249b2734a36701120fd22c91c64ec2 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sat, 7 May 2016 02:06:47 -0400
 Subject: [PATCH] Makefile: fix efivar.pc not found
@@ -20,17 +20,18 @@ It fixes efivar.pc not found:
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  src/Makefile | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index c7a0ca3..ad9c427 100644
+index dcc7fc8..691aa8a 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -78,7 +78,9 @@ install : all
- 		ln -fs $(x).$(VERSION) $(DESTDIR)$(libdir)/$(x).$(MAJOR_VERSION);\
- 		ln -fs $(x).$(VERSION) $(DESTDIR)$(libdir)/$(x); )
+@@ -94,7 +94,9 @@ install : all
+ 		ln -fs $(x).1.$(VERSION) $(DESTDIR)$(libdir)/$(x) ;\
+ 		)
  	$(INSTALL) -d -m 755 $(DESTDIR)$(PCDIR)
 -	$(foreach x, $(PCTARGETS), $(INSTALL) -m 644 $(x) $(DESTDIR)$(PCDIR) ;)
 +	$(foreach x, $(PCTARGETS), $(INSTALL) -m 644 $(TOPDIR)/src/$(x).in $(DESTDIR)$(PCDIR)/$(x) ;\
@@ -39,6 +40,3 @@ index c7a0ca3..ad9c427 100644
  	$(INSTALL) -d -m 755 $(DESTDIR)$(includedir)/efivar
  	$(foreach x, $(wildcard $(TOPDIR)/src/include/efivar/*.h), $(INSTALL) -m 644 $(x) $(DESTDIR)$(includedir)/efivar/$(notdir $(x));)
  	$(INSTALL) -d -m 755 $(DESTDIR)$(bindir)
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch b/meta-oe/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch
index 87f5555..f88af1f 100644
--- a/meta-oe/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch
+++ b/meta-oe/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch
@@ -1,3 +1,8 @@
+From c801dcb03d42eb533a9bead0b397d7ce4fc5a6fe Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 10 Aug 2016 17:49:50 +0800
+Subject: [PATCH] allow multi definitions for native
+
 Upstream-Status: Pending
 
 It fails to create .so file when build efivar-native:
@@ -8,16 +13,20 @@ It fails to create .so file when build efivar-native:
 Add link option '-z muldefs' to fix it.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 ---
+ Make.rules | 1 +
+ 1 file changed, 1 insertion(+)
+
 diff --git a/Make.rules b/Make.rules
-index d9c0609..874bce0 100644
+index 88b9aa7..799332f 100644
 --- a/Make.rules
 +++ b/Make.rules
 @@ -20,6 +20,7 @@ include $(TOPDIR)/Make.version
  	$(CCLD) $(ccldflags) $(CPPFLAGS) $(SOFLAGS) \
- 	  -Wl,-soname,$@.$(MAJOR_VERSION) \
+ 	  -Wl,-soname,$@.1 \
  	  -Wl,--version-script=$(MAP) \
 +	  -Wl,-z,muldefs \
  	  -o $@ $^ $(LDLIBS)
  
- %.o : %.c
+ %.abixml : %.so
diff --git a/meta-oe/recipes-bsp/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch b/meta-oe/recipes-bsp/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
index e3fa2e1..dbc9a57 100644
--- a/meta-oe/recipes-bsp/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
+++ b/meta-oe/recipes-bsp/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
@@ -1,4 +1,4 @@
-From 1361225abbaba878960f970df39a4570bbc39553 Mon Sep 17 00:00:00 2001
+From 3edce6a0019bcb90febc1f654b5b2e2bad5c59bd Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 26 May 2016 21:50:01 -0400
 Subject: [PATCH] fix compile failure with older host gcc (<=4.6)
@@ -16,14 +16,15 @@ and directly remove -Wmaybe-uninitialized and -flto.
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  gcc.specs | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: git/gcc.specs
-===================================================================
---- git.orig/gcc.specs
-+++ git/gcc.specs
+diff --git a/gcc.specs b/gcc.specs
+index 45d43d1..f1c6944 100644
+--- a/gcc.specs
++++ b/gcc.specs
 @@ -2,13 +2,13 @@
  + -D_GNU_SOURCE
  
diff --git a/meta-oe/recipes-bsp/efivar/efivar/musl-strndupa.patch b/meta-oe/recipes-bsp/efivar/efivar/musl-strndupa.patch
index fc8f8c8..5864ac6 100644
--- a/meta-oe/recipes-bsp/efivar/efivar/musl-strndupa.patch
+++ b/meta-oe/recipes-bsp/efivar/efivar/musl-strndupa.patch
@@ -1,9 +1,17 @@
-Taken from void linux
+From 8000b9afc858472912aace985004b44f8eb467e0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 18 Aug 2017 09:49:49 -0700
+Subject: [PATCH] support musl
 
-Index: git/src/linux.c
-===================================================================
---- git.orig/src/linux.c
-+++ git/src/linux.c
+Upstream-Status: Pending
+---
+ src/linux.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/linux.c b/src/linux.c
+index 34ed479..1304f2b 100644
+--- a/src/linux.c
++++ b/src/linux.c
 @@ -40,6 +40,10 @@
  #include <efivar.h>
  #include <efiboot.h>
-- 
2.8.1


