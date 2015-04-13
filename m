Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4C3996AC23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 07:27:55 +0000 (UTC)
Received: by widdi4 with SMTP id di4so60854922wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 00:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B3lx5ydN03Fwmyl09QQ0l2U9bBXatUOEnThYm/lKCUc=;
	b=Sa9SE+k6mN4e/UIBYNI651lrEl4jKqtFBchgVsnzs9Z3h1D7rAxxdtPbhPDm3A4Uvs
	G1d6Wq8Ei2d0T45Ez7NPTyfpkG9073lq4LAy0O4W6BVpU/TsijOUWInYvBZeXLbAiMZW
	l/pXlTLKV+Qdvt62RnLELhE0WPyN838K3LKOMtuBc54+uC2kpEklW1f0NKiLLEPiXVcM
	zaShpKmePWZqQ47GWa/L/15+mdsOqGKZmMXY45hgnb74z3jQVWEFYPnMrNvA7prdOIiA
	QJkJatJk6pamT4xn3SvAWil1CjVL38gMvI/zQLHaCL7VnR1gFzwkzVICy8nLrjKMjPkB
	hbrQ==
X-Received: by 10.180.85.9 with SMTP id d9mr19495213wiz.28.1428910076803;
	Mon, 13 Apr 2015 00:27:56 -0700 (PDT)
Received: from localhost.localdomain (pD9F9B569.dip0.t-ipconnect.de.
	[217.249.181.105]) by mx.google.com with ESMTPSA id
	i10sm10139643wja.40.2015.04.13.00.27.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Apr 2015 00:27:53 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Apr 2015 09:27:35 +0200
Message-Id: <1428910057-23647-6-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
In-Reply-To: <1428910057-23647-5-git-send-email-sven.ebenfeld@gmail.com>
References: <1428910057-23647-1-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-2-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-3-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-4-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-5-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH v2 5/7] openjdk-7: Remove OpenJDK 25b30 and IcedTea 2.3.12
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
X-List-Received-Date: Mon, 13 Apr 2015 07:27:57 -0000

We now have OpenJDK 75b13, so the old version should not be required anymore.

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../openjdk/openjdk-7-25b30/build-hacks.patch      |  60 ----
 .../openjdk-7-25b30/cacao-arm-ucontext.patch       |  24 --
 .../openjdk/openjdk-7-25b30/cacao-libtoolize.patch |  12 -
 .../openjdk-7-25b30/cacao-loadavg-makefile.patch   |  13 -
 .../openjdk/openjdk-7-25b30/cacao-loadavg.patch    |  27 --
 .../openjdk/openjdk-7-25b30/cacao-update.patch     |  63 ----
 .../openjdk/openjdk-7-25b30/fix-checksums.patch    |  13 -
 .../openjdk-7-25b30/fix_hotspot_crosscompile.patch |  51 ---
 ...cedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch |  19 --
 .../icedtea-corba-parallel-make.patch              |  31 --
 .../openjdk-7-25b30/icedtea-crosscompile-fix.patch | 363 ---------------------
 .../openjdk-7-25b30/icedtea-fix-xrender.patch      |  13 -
 .../icedtea-hotspot-dlvsym-uclibc.patch            |  16 -
 .../icedtea-hotspot-glibc-version.patch            |  23 --
 .../openjdk-7-25b30/icedtea-hotspot-isfinte.patch  |  15 -
 .../openjdk-7-25b30/icedtea-hotspot-isnanf.patch   |  13 -
 .../openjdk-7-25b30/icedtea-hotspot-loadavg.patch  |  28 --
 .../openjdk-7-25b30/icedtea-jdk-iconv-uclibc.patch |  39 ---
 .../icedtea-jdk-nio-use-host-cc.patch              |  73 -----
 .../icedtea-jdk-powerpc-atomic64.patch             |  65 ----
 .../icedtea-jdk-ppc64-jvm-cfg.patch                |  41 ---
 .../icedtea-jdk-remove-unused-backtrace.patch      |  41 ---
 .../icedtea-jdk-unpack-uclibc.patch                |  10 -
 .../openjdk-7-25b30/icedtea-launcher-stdc++.patch  |  13 -
 .../openjdk-7-25b30/icedtea-libnet-renaming.patch  | 188 -----------
 ...njdk-remove-currency-data-generation-expi.patch |  25 --
 .../openjdk-7-25b30/icedtea-remove_werror.patch    |  16 -
 .../icedtea-shark-arm-linux-cpu-detection.patch    | 113 -------
 .../openjdk-7-25b30/icedtea-unbreak-float.patch    |  18 -
 ...edtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch |  13 -
 .../openjdk-7-25b30/icedtea-zero-hotspotfix.patch  |  37 ---
 recipes-core/openjdk/openjdk-7-25b30/jvm.cfg       |  43 ---
 .../remove-sun.misc.Perf-debug-code.patch          |  47 ---
 recipes-core/openjdk/openjdk-7-release-25b30.inc   | 137 --------
 recipes-core/openjdk/openjdk-7_25b30-2.3.12.bb     |  36 --
 35 files changed, 1739 deletions(-)
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/build-hacks.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/cacao-arm-ucontext.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/cacao-libtoolize.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/cacao-loadavg-makefile.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/cacao-loadavg.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/cacao-update.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/fix-checksums.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/fix_hotspot_crosscompile.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-corba-parallel-make.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-fix-xrender.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-dlvsym-uclibc.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-glibc-version.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-isfinte.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-isnanf.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-loadavg.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-iconv-uclibc.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-nio-use-host-cc.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-powerpc-atomic64.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-ppc64-jvm-cfg.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-remove-unused-backtrace.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-unpack-uclibc.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-launcher-stdc++.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-libnet-renaming.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-openjdk-remove-currency-data-generation-expi.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-remove_werror.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-shark-arm-linux-cpu-detection.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-unbreak-float.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/jvm.cfg
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/remove-sun.misc.Perf-debug-code.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-release-25b30.inc
 delete mode 100644 recipes-core/openjdk/openjdk-7_25b30-2.3.12.bb

diff --git a/recipes-core/openjdk/openjdk-7-25b30/build-hacks.patch b/recipes-core/openjdk/openjdk-7-25b30/build-hacks.patch
deleted file mode 100644
index bf68037..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/build-hacks.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Index: icedtea-2.3.12/Makefile.am
-===================================================================
---- icedtea-2.3.12.orig/Makefile.am	2013-07-26 18:17:45.499466367 +0000
-+++ icedtea-2.3.12/Makefile.am	2013-07-30 21:04:46.761410713 +0000
-@@ -471,6 +471,12 @@
- 	JAVAC="" \
- 	JAVA_HOME="" \
- 	JDK_HOME="" \
-+	OE_CFLAGS="$(OE_CFLAGS)" \
-+	OE_CPPFLAGS="$(OE_CPPFLAGS)" \
-+	OE_CXXFLAGS="$(OE_CXXFLAGS)" \
-+	OE_LDFLAGS="$(OE_LDFLAGS)" \
-+	OE_LAUNCHER_LDFLAGS="$(OE_LAUNCHER_LDFLAGS)" \
-+        DISTRIBUTION_ID="$(DIST_ID)" \
- 	QUIETLY="" \
- 	ANT_RESPECT_JAVA_HOME="TRUE" \
- 	DISTRIBUTION_ID="$(DIST_ID)" \
-@@ -2028,7 +2034,11 @@
- if BUILD_JAMVM
- 	cd jamvm/jamvm && \
- 	./autogen.sh --with-java-runtime-library=openjdk7 \
--	  --prefix=$(abs_top_builddir)/jamvm/install ; \
-+	  --prefix=$(abs_top_builddir)/jamvm/install \
-+	  --host=$(host_alias) \
-+	  --build=$(build_alias) \
-+	  --target=$(target_alias)  \
-+	  --with-libtool-sysroot=${ALT_FREETYPE_LIB_PATH} ; \
- 	$(MAKE) ; \
- 	$(MAKE) install
- 	mkdir -p $(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/server
-@@ -2093,6 +2103,7 @@
- 	  --host=$(host_alias) \
- 	  --build=$(build_alias) \
- 	  --target=$(target_alias) \
-+	  --with-libtool-sysroot=${ALT_FREETYPE_LIB_PATH} \
- 	  --prefix=$(abs_top_builddir)/cacao/install \
- 	  --with-java-runtime-library=openjdk7 \
- 	  --with-java-runtime-library-prefix=$(abs_top_builddir)/openjdk \
-@@ -2160,7 +2171,7 @@
- # configure script arguments, quoted in single quotes
- CONFIGURE_ARGS = @CONFIGURE_ARGS@
- ADD_ZERO_CONFIGURE_ARGS = \
--	--with-jdk-home=$(BUILD_OUTPUT_DIR)/j2sdk-image \
-+	--with-jdk-home=$(abs_top_builddir)/bootstrap/jdk1.6.0 \
- 	--disable-bootstrap --enable-zero
- if ADD_SHARK_BUILD
- ADD_ZERO_CONFIGURE_ARGS += \
-Index: icedtea-2.3.12/javac.in
-===================================================================
---- icedtea-2.3.12.orig/javac.in	2013-07-24 21:33:57.224612327 +0000
-+++ icedtea-2.3.12/javac.in	2013-07-30 19:41:56.240277496 +0000
-@@ -77,5 +77,7 @@
-     my @CLASSPATH = ('@ECJ_JAR@');
-     push @CLASSPATH, split /:/, $ENV{"CLASSPATH"} if exists $ENV{"CLASSPATH"};
-     $ENV{"CLASSPATH"} = join ':', @CLASSPATH;
--    exec '@JAVA@', 'org.eclipse.jdt.internal.compiler.batch.Main', @ecj_parms, @ecj_args;
-+    # Compiling hotspot-tools consumes tons of memory and exceeds any default
-+    # limits for jamvm and cacao.
-+    exec '@JAVA@', '-Xmx1024m', 'org.eclipse.jdt.internal.compiler.batch.Main', @ecj_parms, @ecj_args;
- }
diff --git a/recipes-core/openjdk/openjdk-7-25b30/cacao-arm-ucontext.patch b/recipes-core/openjdk/openjdk-7-25b30/cacao-arm-ucontext.patch
deleted file mode 100644
index c21fcf1..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/cacao-arm-ucontext.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Index: cacao-a567bcb7f589/src/vm/jit/arm/linux/md-os.c
-===================================================================
---- cacao-a567bcb7f589/src/vm/jit/arm/linux/md-os.c	2013-01-26 21:30:54.206581090 +0100
-+++ cacao-a567bcb7f589/src/vm/jit/arm/linux/md-os.c	2013-01-26 21:31:34.406991316 +0100
-@@ -28,19 +28,7 @@
- 
- #include <stdint.h>
- 
--#define ucontext broken_glibc_ucontext
--#define ucontext_t broken_glibc_ucontext_t
- #include <ucontext.h>
--#undef ucontext
--#undef ucontext_t
--
--typedef struct ucontext {
--   unsigned long     uc_flags;
--   struct ucontext  *uc_link;
--   stack_t           uc_stack;
--   struct sigcontext uc_mcontext;
--   sigset_t          uc_sigmask;
--} ucontext_t;
- 
- #define scontext_t struct sigcontext
- 
diff --git a/recipes-core/openjdk/openjdk-7-25b30/cacao-libtoolize.patch b/recipes-core/openjdk/openjdk-7-25b30/cacao-libtoolize.patch
deleted file mode 100644
index 484cb10..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/cacao-libtoolize.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: icedtea6/Makefile.am
-===================================================================
---- icedtea6.orig/Makefile.am	2011-12-21 22:58:23.000000000 +0100
-+++ icedtea6/Makefile.am	2011-12-21 23:00:21.405887186 +0100
-@@ -1922,6 +1922,7 @@
- if BUILD_CACAO
- if !USE_SYSTEM_CACAO
- 	cd cacao/cacao && \
-+	rm -f libtool && \
- 	./autogen.sh && \
- 	$(ARCH_PREFIX) ./configure \
- 	  --host=$(host_alias) \
diff --git a/recipes-core/openjdk/openjdk-7-25b30/cacao-loadavg-makefile.patch b/recipes-core/openjdk/openjdk-7-25b30/cacao-loadavg-makefile.patch
deleted file mode 100644
index 81ac590..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/cacao-loadavg-makefile.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: icedtea-2.1.4/Makefile.am
-===================================================================
---- icedtea-2.1.4.orig/Makefile.am	2013-01-26 18:20:55.152561203 +0100
-+++ icedtea-2.1.4/Makefile.am	2013-01-26 18:41:07.637992206 +0100
-@@ -1994,6 +1994,8 @@
- if BUILD_CACAO
- if !USE_SYSTEM_CACAO
- 	cd cacao/cacao && \
-+	patch -p1 -N < $(abs_top_srcdir)/patches/cacao-loadavg.patch && \
-+        patch -p1 -N < $(abs_top_srcdir)/patches/cacao-arm-ucontext.patch && \
- 	rm -f libtool && \
- 	./autogen.sh && \
- 	$(ARCH_PREFIX) ./configure \
diff --git a/recipes-core/openjdk/openjdk-7-25b30/cacao-loadavg.patch b/recipes-core/openjdk/openjdk-7-25b30/cacao-loadavg.patch
deleted file mode 100644
index 0fc1a81..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/cacao-loadavg.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Index: cacao-cff92704c4e0/src/vm/os.hpp
-===================================================================
---- cacao-cff92704c4e0/src/vm/os.hpp	2011-12-08 13:40:45.000000000 +0100
-+++ cacao-cff92704c4e0/src/vm/os.hpp	2011-12-20 11:42:36.985633921 +0100
-@@ -425,7 +425,21 @@
- #if defined(HAVE_GETLOADAVG)
- 	return ::getloadavg(loadavg, nelem);
- #else
--# error getloadavg not available
-+        FILE *LOADAVG;
-+        double avg[3] = { 0.0, 0.0, 0.0 };
-+        int i, res = -1;;
-+
-+        if ((LOADAVG = fopen("/proc/loadavg", "r"))) {
-+                fscanf(LOADAVG, "%lf %lf %lf", &avg[0], &avg[1], &avg[2]);
-+                res = 0;
-+                fclose(LOADAVG);
-+        }
-+
-+        for (i = 0; (i < nelem) && (i < 3); i++) {
-+                loadavg[i] = avg[i];
-+        }
-+
-+        return res;
- #endif
- }
- 
diff --git a/recipes-core/openjdk/openjdk-7-25b30/cacao-update.patch b/recipes-core/openjdk/openjdk-7-25b30/cacao-update.patch
deleted file mode 100644
index cd6cdbf..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/cacao-update.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-
-# HG changeset patch
-# User Andrew John Hughes <gnu_andrew@member.fsf.org>
-# Date 1366807128 -3600
-# Node ID e562523c5037d8c6097afa00cc2932a959037a61
-# Parent  d4e0f297cf8fb7a4e457d5bef8f0290623cf8b05
-Update CACAO to latest tip.
-
-2013-04-24  Andrew John Hughes  <gnu.andrew@member.fsf.org>
-
-	* patches/cacao/jsig.patch:
-	Removed.
-	* Makefile.am:
-	(CACAO_VERSION): Bump to current tip.
-	(CACAO_SHA256SUM): Likewise.
-	(ICEDTEA_PATCHES): Drop unneeded jsig patch.
-	* NEWS: Updated.
-
-diff -r d4e0f297cf8f -r e562523c5037 Makefile.am
---- a/Makefile.am	Wed Apr 24 10:24:40 2013 +0100
-+++ b/Makefile.am	Wed Apr 24 13:38:48 2013 +0100
-@@ -18,8 +18,8 @@
- LANGTOOLS_SHA256SUM = c412b61b095154fee4c45dc133f2baca3100fecd48b742f80da49a52ec473b02
- OPENJDK_SHA256SUM = 44c3e4a130fe4b76c1ba977ae2251884cefa774b82a24c4415b64395aef9594c
- 
--CACAO_VERSION = a567bcb7f589
--CACAO_SHA256SUM = d49f79debc131a5694cae6ab3ba2864e7f3249ee8d9dc09aae8afdd4dc6b09f9
-+CACAO_VERSION = e215e36be9fc
-+CACAO_SHA256SUM = 4966514c72ee7ed108b882d9b6e65c3adf8a8f9c2dccb029f971b3c8cb4870ab
- CACAO_BASE_URL = http://icedtea.classpath.org/download/drops/cacao
- CACAO_URL = $(CACAO_BASE_URL)/$(CACAO_VERSION).tar.gz
- CACAO_SRC_ZIP = cacao-$(CACAO_VERSION).tar.gz
-@@ -266,7 +266,6 @@
- if BUILD_CACAO
- ICEDTEA_PATCHES += \
- 	patches/cacao/launcher.patch \
--	patches/cacao/jsig.patch \
- 	patches/cacao/memory.patch
- else
- if USING_CACAO
-diff -r d4e0f297cf8f -r e562523c5037 patches/cacao/jsig.patch
---- a/patches/cacao/jsig.patch	Wed Apr 24 10:24:40 2013 +0100
-+++ /dev/null	Thu Jan 01 00:00:00 1970 +0000
-@@ -1,18 +0,0 @@
--diff -Nru cacao.orig/Makefile.am cacao/Makefile.am
----- cacao.orig/cacao/src/cacao/Makefile.am	2008-08-04 17:51:28.000000000 +0100
--+++ cacao/cacao/src/cacao/Makefile.am	2010-05-11 10:29:35.000000000 +0100
--@@ -96,12 +96,12 @@
-- 	$(mkdir_p) $(prefix)/jre/lib/$(JAVA_ARCH)/server
-- 	$(LN_S) -f $(libdir)/libjvm.so $(prefix)/jre/lib/$(JAVA_ARCH)/server
-- 	$(ECHO) $(ECHO_N) > $(prefix)/jre/lib/$(JAVA_ARCH)/server/Xusage.txt
---	$(ECHO) $(ECHO_N) > $(prefix)/jre/lib/$(JAVA_ARCH)/server/libjsig.so
--+	$(ECHO) $(ECHO_N) > $(prefix)/jre/lib/$(JAVA_ARCH)/libjsig.so
-- 
-- uninstall-local:
-- 	rm -f $(prefix)/jre/lib/$(JAVA_ARCH)/server/libjvm.so
-- 	rm -f $(prefix)/jre/lib/$(JAVA_ARCH)/server/Xusage.txt
---	rm -f $(prefix)/jre/lib/$(JAVA_ARCH)/server/libjsig.so
--+	rm -f $(prefix)/jre/lib/$(JAVA_ARCH)/libjsig.so
-- endif
-- 
-- 
-
diff --git a/recipes-core/openjdk/openjdk-7-25b30/fix-checksums.patch b/recipes-core/openjdk/openjdk-7-25b30/fix-checksums.patch
deleted file mode 100644
index bb05b3b..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/fix-checksums.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: icedtea-2.3.12/Makefile.am
-===================================================================
---- icedtea-2.3.12.orig/Makefile.am	2013-07-29 13:18:15.437439600 +0000
-+++ icedtea-2.3.12/Makefile.am	2013-07-29 13:18:40.921456562 +0000
-@@ -16,7 +16,7 @@
- JAXWS_SHA256SUM = b149c1fab323a586eae9b4459ccd929f0db8b35769e42dd7f4fbadc48b803dab
- JDK_SHA256SUM = badbbf50c820325ffe592762a2eff3414df71e286460b75716a2100d7f6f2aa0
- LANGTOOLS_SHA256SUM = b9e2e3c97393f566b0c4dc2b0ca826bfb3b3841f5522a850b82d1ff23745839b
--OPENJDK_SHA256SUM = 7bc64e2285b5bfefeb6a3900729c58beb2f04f2c57184a4fe48341c5087c3f61
-+OPENJDK_SHA256SUM = d1132bdde0e19d8e4d2516213bce7aa50b4b6d1ab04a82bf7a0440d6184db842
- 
- CACAO_VERSION = a567bcb7f589
- CACAO_SHA256SUM = d49f79debc131a5694cae6ab3ba2864e7f3249ee8d9dc09aae8afdd4dc6b09f9
diff --git a/recipes-core/openjdk/openjdk-7-25b30/fix_hotspot_crosscompile.patch b/recipes-core/openjdk/openjdk-7-25b30/fix_hotspot_crosscompile.patch
deleted file mode 100644
index 8d2d045..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/fix_hotspot_crosscompile.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Index: icedtea-2.1/acinclude.m4
-===================================================================
---- icedtea-2.1.orig/acinclude.m4
-+++ icedtea-2.1/acinclude.m4
-@@ -909,6 +909,21 @@ AC_DEFUN([IT_WITH_PROJECT],
-   AM_CONDITIONAL([USE_JDK7], test x"${project}" = "xjdk7")
- ])
- 
-+AC_DEFUN([AC_CHECK_WITH_CC_FOR_BUILD],
-+[
-+  AC_MSG_CHECKING(for compiler used for subsidiary programs)
-+  AC_ARG_WITH([cc-for-build],
-+              [AS_HELP_STRING(--with-cc-for-build,specify the compiler for subsidiary (helper) programs)],
-+  [
-+    CC_FOR_BUILD="${withval}"
-+  ],
-+  [
-+    CC_FOR_BUILD="\$(CC)"
-+  ])
-+  AC_MSG_RESULT(${CC_FOR_BUILD})
-+  AC_SUBST(CC_FOR_BUILD)
-+])
-+
- AC_DEFUN([IT_WITH_GCJ],
- [
-   AC_MSG_CHECKING([whether to compile ecj natively])
-Index: icedtea-2.1/configure.ac
-===================================================================
---- icedtea-2.1.orig/configure.ac
-+++ icedtea-2.1/configure.ac
-@@ -18,6 +18,8 @@ AC_PREFIX_DEFAULT([bootstrap])
- AC_PROG_CC
- AC_PROG_CXX
- 
-+AC_CHECK_WITH_CC_FOR_BUILD
-+
- IT_FIND_TOOL([MAKE], [make])
- IT_FIND_TOOL([GZIP], [gzip])
- IT_FIND_TOOL([ANT], [ant])
-Index: icedtea-2.1/Makefile.am
-===================================================================
---- icedtea-2.1.orig/Makefile.am
-+++ icedtea-2.1/Makefile.am
-@@ -416,6 +416,7 @@ ICEDTEA_ENV = \
- 	JAVAC="" \
- 	JAVA_HOME="" \
- 	JDK_HOME="" \
-+	CC_FOR_BUILD="$(CC_FOR_BUILD)" \
- 	OE_CFLAGS="$(OE_CFLAGS)" \
- 	OE_CPPFLAGS="$(OE_CPPFLAGS)" \
- 	OE_CXXFLAGS="$(OE_CXXFLAGS)" \
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch
deleted file mode 100644
index fb48879..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-From: Mario Domenech Goulart <mario@ossystems.com.br>
-Organization: O.S. Systems Software LTDA.
-
-Upstream-Status: Pending
----
---- openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2015-03-30 13:43:43.433168285 -0300
-+++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2015-03-30 13:45:57.601833592 -0300
-@@ -388,9 +388,9 @@
-  *        7: The default directories, normally /lib and /usr/lib.
-  */
- #if defined(AMD64) || defined(_LP64) && (defined(SPARC) || defined(PPC) || defined(S390))
--#define DEFAULT_LIBPATH "/usr/lib64:/lib64:/lib:/usr/lib"
-+#define DEFAULT_LIBPATH "/usr/lib64:/lib64:/lib:/usr/lib:/usr/lib64/jni:/usr/lib/jni"
- #else
--#define DEFAULT_LIBPATH "/lib:/usr/lib"
-+#define DEFAULT_LIBPATH "/lib:/usr/lib:/usr/lib/jni"
- #endif
- 
- #define EXTENSIONS_DIR  "/lib/ext"
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-corba-parallel-make.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-corba-parallel-make.patch
deleted file mode 100644
index 3e2893c..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-corba-parallel-make.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-diff --git openjdk/corba/make/Makefile openjdk/corba/make/Makefile
-index d81c66c..4f750e8 100644
---- openjdk/corba/make/Makefile
-+++ openjdk/corba/make/Makefile
-@@ -134,7 +134,7 @@ default: all
- #----- classes.jar
- 
- CLASSES_JAR = $(LIB_DIR)/classes.jar
--$(CLASSES_JAR):
-+$(CLASSES_JAR): build
- 	$(MKDIR) -p $(@D)
- 	$(BOOT_JAR_CMD) -cf $@ -C $(CLASSES_DIR) .
- 
-@@ -144,6 +144,7 @@ SRC_ZIP_FILES = $(shell $(FIND) $(SRC_CLASSES_DIR) \( -name \*-template \) -prun
- 
- SRC_ZIP = $(LIB_DIR)/src.zip
- $(SRC_ZIP): $(SRC_ZIP_FILES)
-+	$(MKDIR) -p $(@D)
- 	abs_src_zip=`cd $(@D) ; pwd`/$(@F) ; \
- 	( cd $(SRC_CLASSES_DIR) ; $(FIND) . \( -name \*-template \) -prune -o -type f -print | $(ZIP) -q $$abs_src_zip -@ ) ; \
- 	( cd $(GENSRC_DIR) ; $(FIND) . -type f -print | $(ZIP) -q $$abs_src_zip -@ ) ;
-@@ -153,7 +154,8 @@ $(SRC_ZIP): $(SRC_ZIP_FILES)
- BIN_ZIP_FILES = $(BUILD_DIR)/lib/orb.idl $(BUILD_DIR)/lib/ir.idl
- 
- BIN_ZIP = $(LIB_DIR)/bin.zip
--$(BIN_ZIP): $(BIN_ZIP_FILES)
-+$(BIN_ZIP): build $(BIN_ZIP_FILES)
-+	$(MKDIR) -p $(@D)
- 	abs_bin_zip=`cd $(@D) ; pwd`/$(@F) ; \
- 	( cd $(BUILD_DIR) ; $(FIND) lib -name "*.idl" -print | $(ZIP) -q $$abs_bin_zip -@ ) ;
- 
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch
deleted file mode 100644
index 0c6aac4..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch
+++ /dev/null
@@ -1,363 +0,0 @@
-diff --git openjdk/corba/make/common/shared/Platform.gmk openjdk/corba/make/common/shared/Platform.gmk
-index fb575fa..e0426ad 100644
---- openjdk/corba/make/common/shared/Platform.gmk
-+++ openjdk/corba/make/common/shared/Platform.gmk
-@@ -152,9 +152,13 @@ ifeq ($(SYSTEM_UNAME), Linux)
-   OS_NAME = linux
-   OS_VERSION := $(shell uname -r)
-   # Arch and OS name/version
--  mach := $(shell uname -m)
--  ifneq (,$(wildcard /usr/bin/dpkg-architecture))
--    mach := $(shell (dpkg-architecture -qDEB_BUILD_ARCH_CPU 2>/dev/null || echo $(mach)) | sed 's/powerpc$$/ppc/;s/hppa/parisc/')
-+  ifdef CROSS_COMPILE_ARCH
-+    mach := $(CROSS_COMPILE_ARCH)
-+  else
-+    mach := $(shell uname -m)
-+    ifneq (,$(wildcard /usr/bin/dpkg-architecture))
-+      mach := $(shell (dpkg-architecture -qDEB_BUILD_ARCH_CPU 2>/dev/null || echo $(mach)) | sed 's/powerpc$$/ppc/;s/hppa/parisc/')
-+    endif
-   endif
-   archExpr = case "$(mach)" in \
-                 i[3-9]86) \
-diff --git openjdk/hotspot/make/linux/makefiles/build_vm_def.sh openjdk/hotspot/make/linux/makefiles/build_vm_def.sh
-index ea81ff6..68b0d71 100644
---- openjdk/hotspot/make/linux/makefiles/build_vm_def.sh
-+++ openjdk/hotspot/make/linux/makefiles/build_vm_def.sh
-@@ -1,10 +1,12 @@
- #!/bin/sh
- 
- # If we're cross compiling use that path for nm
--if [ "$CROSS_COMPILE_ARCH" != "" ]; then 
--NM=$ALT_COMPILER_PATH/nm
--else
--NM=nm
-+if [ "$NM" == "" ]; then
-+  if [ "$CROSS_COMPILE_ARCH" != "" ]; then 
-+    NM=$ALT_COMPILER_PATH/nm
-+  else
-+    NM=nm
-+  fi
- fi
- 
- $NM --defined-only $* \
-diff --git openjdk/hotspot/make/linux/makefiles/gcc.make openjdk/hotspot/make/linux/makefiles/gcc.make
-index 6fe5191..765fc6d 100644
---- openjdk/hotspot/make/linux/makefiles/gcc.make
-+++ openjdk/hotspot/make/linux/makefiles/gcc.make
-@@ -164,7 +164,7 @@ CFLAGS_WARN/DEFAULT = $(WARNINGS_ARE_ERRORS) $(ACCEPTABLE_WARNINGS)
- CFLAGS_WARN/BYFILE = $(CFLAGS_WARN/$@)$(CFLAGS_WARN/DEFAULT$(CFLAGS_WARN/$@)) 
- 
- # The flags to use for an Optimized g++ build
--OPT_CFLAGS += -O3
-+OPT_CFLAGS += $(OE_CFLAGS)
- 
- # Hotspot uses very unstrict aliasing turn this optimization off
- OPT_CFLAGS += -fno-strict-aliasing
-@@ -208,15 +208,7 @@ LFLAGS += -Wl,-relax
- endif
- 
- # Enable linker optimization
--LFLAGS += -Xlinker -O1
--
--# If this is a --hash-style=gnu system, use --hash-style=both
--#   The gnu .hash section won't work on some Linux systems like SuSE 10.
--_HAS_HASH_STYLE_GNU:=$(shell $(CC) -dumpspecs | grep -- '--hash-style=gnu')
--ifneq ($(_HAS_HASH_STYLE_GNU),)
--  LDFLAGS_HASH_STYLE = -Wl,--hash-style=both
--endif
--LFLAGS += $(LDFLAGS_HASH_STYLE)
-+LFLAGS += $(OE_LDFLAGS)
- 
- # Use $(MAPFLAG:FILENAME=real_file_name) to specify a map file.
- MAPFLAG = -Xlinker --version-script=FILENAME
-diff --git openjdk/hotspot/make/linux/makefiles/launcher.make openjdk/hotspot/make/linux/makefiles/launcher.make
-index 0c102ea..f4dfbf6 100644
---- openjdk/hotspot/make/linux/makefiles/launcher.make
-+++ openjdk/hotspot/make/linux/makefiles/launcher.make
-@@ -50,8 +50,8 @@ ifeq ($(LINK_INTO),AOUT)
-   LIBS_LAUNCHER             += $(STATIC_STDCXX) $(LIBS)
- else
-   LAUNCHER.o                 = launcher.o
--  LFLAGS_LAUNCHER           += -L `pwd`
--  LIBS_LAUNCHER             += -l$(JVM) $(LIBS)
-+  LFLAGS_LAUNCHER           += -L `pwd` $(OE_LAUNCHER_LDFLAGS) $(OE_LDFLAGS)
-+  LIBS_LAUNCHER             += -l$(JVM) $(LIBS) -lstdc++
- endif
- 
- LINK_LAUNCHER = $(LINK.CC)
-diff --git openjdk/hotspot/make/linux/makefiles/vm.make openjdk/hotspot/make/linux/makefiles/vm.make
-index b0ffd9a..4e8c47c 100644
---- openjdk/hotspot/make/linux/makefiles/vm.make
-+++ openjdk/hotspot/make/linux/makefiles/vm.make
-@@ -292,6 +292,7 @@ ifeq ($(SHARK_BUILD), true)
-   LIBS_VM   += $(LLVM_LIBS)
- endif
- 
-+LFLAGS_VM += $(OE_LDFLAGS)
- LINK_VM = $(LINK_LIB.CC)
- 
- # rule for building precompiled header
-diff --git openjdk/jdk/make/common/Defs-linux.gmk openjdk/jdk/make/common/Defs-linux.gmk
-index 69e1177..dc7f8e6 100644
---- openjdk/jdk/make/common/Defs-linux.gmk
-+++ openjdk/jdk/make/common/Defs-linux.gmk
-@@ -165,35 +165,13 @@ ifeq ($(ENABLE_FULL_DEBUG_SYMBOLS),1)
-   endif
- endif
- 
--#
--# Default optimization
--#
--
--ifndef OPTIMIZATION_LEVEL
--  ifeq ($(PRODUCT), java)
--    OPTIMIZATION_LEVEL = HIGHER
--  else
--    OPTIMIZATION_LEVEL = LOWER
--  endif
--endif
--ifndef FASTDEBUG_OPTIMIZATION_LEVEL
--  FASTDEBUG_OPTIMIZATION_LEVEL = LOWER
--endif
--
--CC_OPT/NONE     = 
--CC_OPT/LOWER    = -O2
--CC_OPT/HIGHER   = -O3
--CC_OPT/HIGHEST  = -O3
--
--CC_OPT          = $(CC_OPT/$(OPTIMIZATION_LEVEL))
--
- # For all platforms, do not omit the frame pointer register usage. 
- #    We need this frame pointer to make it easy to walk the stacks.
- #    This should be the default on X86, but ia64 and amd64 may not have this
- #    as the default.
- CFLAGS_REQUIRED_alpha   += -mieee -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_amd64   += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
--CFLAGS_REQUIRED_arm     += -D_LITTLE_ENDIAN
-+CFLAGS_REQUIRED_arm     += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_hppa    +=
- CFLAGS_REQUIRED_i586    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_ia64    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
-@@ -283,7 +261,7 @@ ifeq ($(ENABLE_FULL_DEBUG_SYMBOLS),1)
-   endif
- endif
- 
--CFLAGS_OPT      = $(CC_OPT)
-+CFLAGS_OPT      = $(OE_CFLAGS)
- CFLAGS_DBG      = $(DEBUG_FLAG)
- CFLAGS_COMMON += $(CFLAGS_REQUIRED)
- 
-@@ -359,7 +337,7 @@ LDFLAGS_COMMON  += $(LDFLAGS_DEFS_OPTION)
- #
- # -L paths for finding and -ljava
- #
--LDFLAGS_OPT     = -Xlinker -O1
-+LDFLAGS_OPT     = $(OE_LDFLAGS)
- LDFLAGS_COMMON += -L$(LIBDIR)/$(LIBARCH)
- LDFLAGS_COMMON += -Wl,-soname=$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
- 
-diff --git openjdk/jdk/make/common/shared/Platform.gmk openjdk/jdk/make/common/shared/Platform.gmk
-index c23e96e..484afca 100644
---- openjdk/jdk/make/common/shared/Platform.gmk
-+++ openjdk/jdk/make/common/shared/Platform.gmk
-@@ -159,9 +159,9 @@ ifeq ($(SYSTEM_UNAME), Linux)
-     mach := $(CROSS_COMPILE_ARCH)
-   else
-     mach := $(shell uname -m)
--  endif
--  ifneq (,$(wildcard /usr/bin/dpkg-architecture))
--    mach := $(shell (dpkg-architecture -qDEB_BUILD_ARCH_CPU 2>/dev/null || echo $(mach)) | sed 's/powerpc$$/ppc/;s/hppa/parisc/')
-+    ifneq (,$(wildcard /usr/bin/dpkg-architecture))
-+      mach := $(shell (dpkg-architecture -qDEB_BUILD_ARCH_CPU 2>/dev/null || echo $(mach)) | sed 's/powerpc$$/ppc/;s/hppa/parisc/')
-+    endif
-   endif
-   archExpr = case "$(mach)" in \
-                 i[3-9]86) \
-diff --git openjdk/jdk/make/java/nio/Makefile openjdk/jdk/make/java/nio/Makefile
-index cd336a2..1e5f8e5 100644
---- openjdk/jdk/make/java/nio/Makefile
-+++ openjdk/jdk/make/java/nio/Makefile
-@@ -934,8 +934,12 @@ else
- $(SCH_GEN)/SocketOptionRegistry.java: $(GENSOR_EXE)
- 	$(prep-target)
- 	NAWK="$(NAWK)" SH="$(SH)" $(SH) -e addNotices.sh "$(SOR_COPYRIGHT_YEARS)" > $@
-+ifdef CROSS_COMPILE_ARCH
-+	$(QEMU) $(GENSOR_EXE) >> $@
-+else
- 	$(GENSOR_EXE) >> $@
- endif
-+endif
- #
- # Generated sun.nio.cs SingleByte classes
- #
-@@ -969,8 +973,12 @@ else
- $(SFS_GEN)/UnixConstants.java: $(GENUC_EXE)
- 	$(prep-target)
- 	NAWK="$(NAWK)" SH="$(SH)" $(SH) -e addNotices.sh "$(GENUC_COPYRIGHT_YEARS)" > $@
-+ifdef CROSS_COMPILE_ARCH
-+	$(QEMU) $(GENUC_EXE) >> $@
-+else
- 	$(GENUC_EXE) >> $@
- endif
-+endif
- 
- GENSC_SRC = $(PLATFORM_SRC)/native/sun/nio/fs/genSolarisConstants.c
- 
-@@ -991,7 +999,11 @@ else
- $(SFS_GEN)/SolarisConstants.java: $(GENSC_EXE)
- 	$(prep-target)
- 	NAWK="$(NAWK)" SH="$(SH)" $(SH) -e addNotices.sh "$(GENSC_COPYRIGHT_YEARS)" > $@
-+ifdef CROSS_COMPILE_ARCH
-+	$(QEMU) $(GENSC_EXE) >> $@
-+else
- 	$(GENSC_EXE) >> $@
- endif
-+endif
- 
- .PHONY: sources 
-diff --git openjdk/jdk/make/sun/awt/mawt.gmk openjdk/jdk/make/sun/awt/mawt.gmk
-index b6e0d99..edc530e 100644
---- openjdk/jdk/make/sun/awt/mawt.gmk
-+++ openjdk/jdk/make/sun/awt/mawt.gmk
-@@ -151,22 +151,6 @@ else
- #endif
- 
- LIBXTST = -lXtst
--ifeq ($(PLATFORM), linux)
--   ifeq ($(ARCH_DATA_MODEL), 64)
--   # XXX what about the rest of them?
--        LIBXT = -lXt
--    else
--    # Allows for builds on Debian GNU Linux, X11 is in a different place 
--       LIBXT = $(firstword $(wildcard $(OPENWIN_LIB)/libXt.a) \
--                        $(wildcard /usr/lib/libXt.a))
--       LIBSM = $(firstword $(wildcard $(OPENWIN_LIB)/libSM.a) \
--                        $(wildcard /usr/lib/libSM.a))
--       LIBICE = $(firstword $(wildcard $(OPENWIN_LIB)/libICE.a) \
--                         $(wildcard /usr/lib/libICE.a))
--       LIBXTST = $(firstword $(wildcard $(OPENWIN_LIB)/libXtst.a) \
--                         $(wildcard /usr/lib/libXtst.a))
--   endif
--endif
- 
- # Use -lXmu for EditRes support
- LIBXMU_DBG	= -lXmu
-@@ -181,7 +165,7 @@ ifneq (,$(findstring $(PLATFORM), linux macosx))
- OTHER_CFLAGS += -DMLIB_NO_LIBSUNMATH
- # XXX what is this define below? Isn't it motif-related?
- OTHER_CFLAGS += -DXMSTRINGDEFINES=1
--OTHER_LDLIBS =  $(LIBXMU) $(LIBXTST) -lXext $(LIBXT) $(LIBSM) $(LIBICE) -lX11 -lXi
-+OTHER_LDLIBS =  $(LIBXMU) $(LIBXTST) -lXext -lXt -lSM -lICE -lXi -lX11
- endif
- 
- endif
-@@ -230,12 +214,6 @@ else
-   CPPFLAGS += -I$(PLATFORM_SRC)/native/common/deps/fontconfig2
- endif
- 
--ifndef HEADLESS
--CPPFLAGS += -I$(OPENWIN_HOME)/include 
--LDFLAGS  += -L$(OPENWIN_LIB)
--
--endif # !HEADLESS
--
- CPPFLAGS += -I$(SHARE_SRC)/native/$(PKGDIR)/debug \
-             -I$(SHARE_SRC)/native/$(PKGDIR)/../font \
-             -I$(PLATFORM_SRC)/native/$(PKGDIR)/../font \
-@@ -269,12 +247,6 @@ LDFLAGS  += -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
- endif # !HEADLESS
- endif # PLATFORM
- 
--ifeq ($(PLATFORM), linux)
--  # Checking for the X11/extensions headers at the additional location
--  CPPFLAGS += -I$(firstword $(wildcard $(OPENWIN_HOME)/include/X11/extensions) \
--                        $(wildcard /usr/include/X11/extensions))
--endif
--
- ifeq ($(PLATFORM), macosx))
-   CPPFLAGS += -I$(OPENWIN_HOME)/include/X11/extensions \
-               -I$(OPENWIN_HOME)/include 
-diff --git openjdk/jdk/make/sun/xawt/Makefile openjdk/jdk/make/sun/xawt/Makefile
-index 53d31f3..183c063 100644
---- openjdk/jdk/make/sun/xawt/Makefile
-+++ openjdk/jdk/make/sun/xawt/Makefile
-@@ -198,20 +198,6 @@ else
-   CPPFLAGS += -I$(PLATFORM_SRC)/native/common/deps/glib2
- endif
- 
--ifeq ($(PLATFORM), linux)
--  ifndef CROSS_COMPILE_ARCH
--    # Allows for builds on Debian GNU Linux, X11 is in a different place 
--    # This should really be handled at a higher-level so we don't have to
--    # work-around this when cross-compiling
--    CPPFLAGS += -I/usr/X11R6/include/X11/extensions \
--                -I/usr/include/X11/extensions \
--                -I$(OPENWIN_HOME)/include 
--  else
--    CPPFLAGS += -I$(OPENWIN_HOME)/include/X11/extensions \
--                -I$(OPENWIN_HOME)/include 
--  endif
--endif
--
- # We have some odd logic here because some Solaris 10 updates
- # have a render.h file that suggests gradients are supported, but
- # the Xrender.h doesn't have the corresponding type definitions.
-@@ -292,16 +278,10 @@ ifeq ($(ARCH_DATA_MODEL), 32)
- SIZERS = $(SIZER).32
- SIZERS_C = $(SIZER_32_C)
- SIZES = $(WRAPPER_GENERATOR_DIR)/sizes.32
--ifdef CROSS_COMPILE_ARCH
--CFLAGS_32 = -m32
--endif
- else # !32
- SIZERS = $(SIZER).64
- SIZERS_C = $(SIZER_64_C)
- SIZES = $(WRAPPER_GENERATOR_DIR)/sizes.64
--ifdef CROSS_COMPILE_ARCH
--CFLAGS_64 = -m64
--endif
- endif # 32
- endif # !macosx
- endif # solaris
-@@ -337,15 +321,11 @@ WRAPPER_GENERATOR_TEMPDIR=$(TEMPDIR)/sun/awt/X11/generator
- WRAPPER_GENERATOR_CLASS=$(WRAPPER_GENERATOR_TEMPDIR)/WrapperGenerator.class 
- XLIBTYPES=$(PLATFORM_SRC)/classes/sun/awt/X11/generator/xlibtypes.txt
- 
--ifndef CROSS_COMPILE_ARCH
- SIZERS_CC = $(CC)
--else
--SIZERS_CC = $(HOST_CC)
--endif
- 
- $(SIZERS): $(SIZERS_C) 
- 	$(prep-target)
--	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -o $@ $(SIZER)$(suffix $@).c
-+	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -fuse-ld=bfd -o $@ $(SIZER)$(suffix $@).c
- 
- $(WRAPPER_GENERATOR_CLASS): $(WRAPPER_GENERATOR_JAVA)
- 	$(prep-target)
-@@ -358,6 +334,16 @@ $(SIZERS_C): $(WRAPPER_GENERATOR_CLASS) $(XLIBTYPES)
- 	    $(SIZER_DIR) $(XLIBTYPES) "sizer" $(subst .,,$(suffix $(basename $@)))
- 
- $(SIZES): $(SIZERS)
-+ifdef CROSS_COMPILE_ARCH
-+	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
-+	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
-+	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
-+	    $(CHMOD) +w $@;\
-+	else	\
-+	    $(ECHO) GENERATING $@; \
-+	    $(QEMU) $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
-+	fi
-+else
- 	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
- 	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
- 	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
-@@ -366,6 +352,7 @@ $(SIZES): $(SIZERS)
- 	    $(ECHO) GENERATING $@; \
- 	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
- 	fi
-+endif
- 	@if [ "$(DOCOMPARE)$(suffix $@)" = "true.64" ]; then \
- 	    $(ECHO) COMPARING $@ and $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
- 	    $(DIFF) $@ $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-fix-xrender.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-fix-xrender.patch
deleted file mode 100644
index 4bd8b2c..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-fix-xrender.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: openjdk/jdk/src/solaris/native/sun/java2d/x11/XRSurfaceData.c
-===================================================================
---- openjdk.orig/jdk/src/solaris/native/sun/java2d/x11/XRSurfaceData.c	2011-10-19 16:56:03.014276748 +0200
-+++ openjdk/jdk/src/solaris/native/sun/java2d/x11/XRSurfaceData.c	2011-10-19 16:57:19.942658211 +0200
-@@ -29,7 +29,7 @@
- #include "X11SurfaceData.h"
- 
- /*#include <xcb/xcb.h>*/
--#include <Xrender.h>
-+#include <X11/extensions/Xrender.h>
- 
- #ifndef RepeatNone  /* added in 0.10 */
- #define RepeatNone    0
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-dlvsym-uclibc.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-dlvsym-uclibc.patch
deleted file mode 100644
index 657f722..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-dlvsym-uclibc.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Index: openjdk/hotspot/src/os/linux/vm/os_linux.cpp
-===================================================================
---- openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2011-12-20 19:15:05.000000000 +0100
-+++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2011-12-20 19:18:22.411503442 +0100
-@@ -2593,10 +2593,7 @@
- // If we are running with earlier version, which did not have symbol versions,
- // we should use the base version.
- void* os::Linux::libnuma_dlsym(void* handle, const char *name) {
--  void *f = dlvsym(handle, name, "libnuma_1.1");
--  if (f == NULL) {
--    f = dlsym(handle, name);
--  }
-+  void *f = dlsym(handle, name);
-   return f;
- }
- 
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-glibc-version.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-glibc-version.patch
deleted file mode 100644
index faa90ea..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-glibc-version.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Index: icedtea6-1.8/build/openjdk/hotspot/src/os/linux/vm/os_linux.cpp
-===================================================================
---- openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 22:22:13.696298239 +0200
-+++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 22:24:15.308790737 +0200
-@@ -49,7 +49,6 @@
- # include <string.h>
- # include <syscall.h>
- # include <sys/sysinfo.h>
--# include <gnu/libc-version.h>
- # include <sys/ipc.h>
- # include <sys/shm.h>
- # include <link.h>
-@@ -544,9 +543,7 @@
-      os::Linux::set_glibc_version(str);
-   } else {
-      // _CS_GNU_LIBC_VERSION is not supported, try gnu_get_libc_version()
--     static char _gnu_libc_version[32];
--     jio_snprintf(_gnu_libc_version, sizeof(_gnu_libc_version),
--              "glibc %s %s", gnu_get_libc_version(), gnu_get_libc_release());
-+     static char _gnu_libc_version[32] = "2.9";
-      os::Linux::set_glibc_version(_gnu_libc_version);
-   }
- 
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-isfinte.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-isfinte.patch
deleted file mode 100644
index 7c5da59..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-isfinte.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Index: icedtea6-1.8/build/openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp
-===================================================================
---- openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	2010-06-09 21:41:28.576131825 +0200
-+++ openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	2010-06-09 21:41:55.555711815 +0200
-@@ -235,8 +235,8 @@
- 
- // Checking for finiteness
- 
--inline int g_isfinite(jfloat  f)                 { return finite(f); }
--inline int g_isfinite(jdouble f)                 { return finite(f); }
-+inline int g_isfinite(jfloat  f)                 { return isfinite(f); }
-+inline int g_isfinite(jdouble f)                 { return isfinite(f); }
- 
- 
- // Wide characters
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-isnanf.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-isnanf.patch
deleted file mode 100644
index b2ddfa9..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-isnanf.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp
-index 659d4da..68a06d5 100644
---- openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp
-+++ openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp
-@@ -253,7 +253,7 @@ inline int g_isnan(double f) { return isnand(f); }
- #elif defined(__APPLE__)
- inline int g_isnan(double f) { return isnan(f); }
- #elif defined(LINUX) || defined(_ALLBSD_SOURCE)
--inline int g_isnan(float  f) { return isnanf(f); }
-+inline int g_isnan(float  f) { return __isnanf(f); }
- inline int g_isnan(double f) { return isnan(f); }
- #else
- #error "missing platform-specific definition here"
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-loadavg.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-loadavg.patch
deleted file mode 100644
index 7da41fd..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-loadavg.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Index: icedtea6-1.8/build/openjdk/hotspot/src/os/linux/vm/os_linux.cpp
-===================================================================
---- openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 22:16:09.406334411 +0200
-+++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 22:19:38.952152043 +0200
-@@ -4325,7 +4325,22 @@
- // Linux doesn't yet have a (official) notion of processor sets,
- // so just return the system wide load average.
- int os::loadavg(double loadavg[], int nelem) {
--  return ::getloadavg(loadavg, nelem);
-+
-+	FILE *LOADAVG;
-+	double avg[3] = { 0.0, 0.0, 0.0 };
-+	int i, res = -1;;
-+
-+	if ((LOADAVG = fopen("/proc/loadavg", "r"))) {
-+		fscanf(LOADAVG, "%lf %lf %lf", &avg[0], &avg[1], &avg[2]);
-+		res = 0;
-+		fclose(LOADAVG);
-+	}
-+
-+	for (i = 0; (i < nelem) && (i < 3); i++) {
-+		loadavg[i] = avg[i];
-+	}
-+
-+	return res;
- }
- 
- void os::pause() {
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-iconv-uclibc.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-iconv-uclibc.patch
deleted file mode 100644
index 68f8581..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-iconv-uclibc.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Index: openjdk/jdk/make/java/npt/Makefile
-===================================================================
---- openjdk/jdk/make/java/npt/Makefile	2010-06-13 15:11:02.598512448 +0200
-+++ openjdk/jdk/make/java/npt/Makefile	2010-06-13 15:11:28.504759286 +0200
-@@ -65,6 +65,8 @@
- # We don't want to link against -ljava
- JAVALIB=
- 
-+LDLIBS += -liconv
-+
- # Add -export options to explicitly spell exported symbols
- ifeq ($(PLATFORM), windows)
-   OTHER_LCF += -export:nptInitialize -export:nptTerminate
-Index: icedtea6-1.8/openjdk-ecj/jdk/make/java/instrument/Makefile
-===================================================================
---- openjdk/jdk/make/java/instrument/Makefile	2010-06-13 15:12:14.688505195 +0200
-+++ openjdk/jdk/make/java/instrument/Makefile	2010-06-13 15:12:32.641425670 +0200
-@@ -123,6 +123,8 @@
- # We don't want to link against -ljava
- JAVALIB=
- 
-+LDLIBS += -liconv
-+
- #
- # Add to ambient vpath so we pick up the library files
- #
-Index: openjdk/jdk/make/sun/splashscreen/Makefile
-===================================================================
---- openjdk/jdk/make/sun/splashscreen/Makefile	2010-06-13 15:12:48.951840824 +0200
-+++ openjdk/jdk/make/sun/splashscreen/Makefile	2010-06-13 15:13:01.191422891 +0200
-@@ -55,6 +55,8 @@
- 
- JAVALIB=
- 
-+LDLIBS += -liconv
-+
- #
- # C Flags
- #
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-nio-use-host-cc.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-nio-use-host-cc.patch
deleted file mode 100644
index 94416bb..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-nio-use-host-cc.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-Index: openjdk/jdk/make/java/nio/Makefile
-===================================================================
---- openjdk/jdk/make/java/nio/Makefile	2013-10-01 21:20:11.000000000 -0700
-+++ openjdk/jdk/make/java/nio/Makefile	2013-10-01 21:30:40.901837422 -0700
-@@ -918,7 +918,7 @@
- ifeq ($(PLATFORM), macosx)
-   NIO_CC=$(HOST_CC)
- else
--  NIO_CC=$(CC)
-+  NIO_CC=$(CC_FOR_BUILD)
- endif
- 
- $(GENSOR_EXE) : $(TEMPDIR)/$(GENSOR_SRC)
-@@ -934,12 +934,8 @@
- $(SCH_GEN)/SocketOptionRegistry.java: $(GENSOR_EXE)
- 	$(prep-target)
- 	NAWK="$(NAWK)" SH="$(SH)" $(SH) -e addNotices.sh "$(SOR_COPYRIGHT_YEARS)" > $@
--ifdef CROSS_COMPILE_ARCH
--	$(QEMU) $(GENSOR_EXE) >> $@
--else
- 	$(GENSOR_EXE) >> $@
- endif
--endif
- #
- # Generated sun.nio.cs SingleByte classes
- #
-@@ -973,12 +969,8 @@
- $(SFS_GEN)/UnixConstants.java: $(GENUC_EXE)
- 	$(prep-target)
- 	NAWK="$(NAWK)" SH="$(SH)" $(SH) -e addNotices.sh "$(GENUC_COPYRIGHT_YEARS)" > $@
--ifdef CROSS_COMPILE_ARCH
--	$(QEMU) $(GENUC_EXE) >> $@
--else
- 	$(GENUC_EXE) >> $@
- endif
--endif
- 
- GENSC_SRC = $(PLATFORM_SRC)/native/sun/nio/fs/genSolarisConstants.c
- 
-@@ -999,11 +991,7 @@
- $(SFS_GEN)/SolarisConstants.java: $(GENSC_EXE)
- 	$(prep-target)
- 	NAWK="$(NAWK)" SH="$(SH)" $(SH) -e addNotices.sh "$(GENSC_COPYRIGHT_YEARS)" > $@
--ifdef CROSS_COMPILE_ARCH
--	$(QEMU) $(GENSC_EXE) >> $@
--else
- 	$(GENSC_EXE) >> $@
- endif
--endif
- 
- .PHONY: sources 
-Index: openjdk/jdk/make/sun/Makefile
-===================================================================
---- openjdk/jdk/make/sun/Makefile	2013-07-25 09:10:09.000000000 -0700
-+++ openjdk/jdk/make/sun/Makefile	2013-10-01 21:32:01.625839149 -0700
-@@ -55,7 +55,7 @@
-     endif
-   endif
-   HEADLESS_SUBDIR = headless
--  XAWT_SUBDIR     = xawt
-+  XAWT_SUBDIR     =
- endif
- 
- ifeq ($(PLATFORM), macosx)
-@@ -87,7 +87,7 @@
- endif
- SUBDIRS_desktop    = audio $(RENDER_SUBDIR) image \
-                      $(LWAWT_PRE_SUBDIR) $(DISPLAY_LIBS) $(DGA_SUBDIR) $(LWAWT_SUBDIR) \
--                     jawt font jpeg cmm $(DISPLAY_TOOLS) beans
-+                     font jpeg cmm $(DISPLAY_TOOLS) beans
- SUBDIRS_management = management
- SUBDIRS_misc       = $(ORG_SUBDIR) rmi $(JDBC_SUBDIR) tracing
- SUBDIRS_tools      = native2ascii serialver tools jconsole
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-powerpc-atomic64.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-powerpc-atomic64.patch
deleted file mode 100644
index cc5e4e8..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-powerpc-atomic64.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-http://mail.openjdk.java.net/pipermail/zero-dev/2010-June/000346.html
-
-this cute C code does the same thing on powerpc as the assembly code that
-was here before. If the compiler was built with the SPE extensions instead
-of traditional FPU and double operations are performed in HW then we are
-one step further: The compiler turns this into evldd & evstdd. Voila :)
-
-This C code could also be activated on s390. The compiler turns this into
-a single mvc instruction which does the copy operation. I don't know if
-mvc's copy ability is atomic _or_ not and therefore I leave it as it.
-
-Signed-off-by: Sebastian Andrzej Siewior <bigeasy at linutronix.de>
-
-./openjdk-src-dir/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.hpp
-Index: openjdk/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.hpp
-===================================================================
---- openjdk/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.hpp.org	2011-11-14 14:07:32.000000000 -0800
-+++ openjdk/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.hpp	2012-07-19 07:28:26.208405923 -0700
-@@ -25,6 +25,16 @@
- 
- #ifndef OS_CPU_LINUX_ZERO_VM_OS_LINUX_ZERO_HPP
- #define OS_CPU_LINUX_ZERO_VM_OS_LINUX_ZERO_HPP
-+#if defined(PPC) && !defined(_LP64)
-+
-+#ifndef __NO_FPRS__
-+#define ATOMIC64_COPY_THROUGH_DOUBLE 1
-+
-+#elif defined(__SPE__) && !defined(_SOFT_DOUBLE)
-+#define ATOMIC64_COPY_THROUGH_DOUBLE 1
-+
-+#endif
-+#endif
- 
-   static void setup_fpu() {}
- 
-@@ -36,12 +46,23 @@
- 
-   // Atomically copy 64 bits of data
-   static void atomic_copy64(volatile void *src, volatile void *dst) {
--#if defined(PPC) && !defined(_LP64)
--    double tmp;
--    asm volatile ("lfd  %0, 0(%1)\n"
--                  "stfd %0, 0(%2)\n"
--                  : "=f"(tmp)
--                  : "b"(src), "b"(dst));
-+#if ATOMIC64_COPY_THROUGH_DOUBLE
-+  /*
-+   * In order to copy 8 bytes atomicly we rely on the trick that some
-+   * architectures can load and store a double as a single operation.
-+   * gcc picks the correct opcode here and with optimization turned on
-+   * all temporary assignments are gone.                       - bigeasy
-+   */
-+   union {
-+          double *d;
-+          volatile void *v;
-+   } s, d;
-+
-+   s.v = src;
-+   d.v = dst;
-+
-+   *d.d = *s.d;
-+
- #elif defined(S390) && !defined(_LP64)
-     double tmp;
-     asm volatile ("ld  %0, 0(%1)\n"
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-ppc64-jvm-cfg.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-ppc64-jvm-cfg.patch
deleted file mode 100644
index 5bb7604..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-ppc64-jvm-cfg.patch
+++ /dev/null
@@ -1,41 +0,0 @@
---- /dev/null	2012-07-25 13:25:05.651551001 -0700
-+++ openjdk/jdk/src/solaris/bin/ppc64/jvm.cfg	2012-08-10 23:59:02.651551157 -0700
-@@ -0,0 +1,38 @@
-+# Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
-+# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
-+#
-+# This code is free software; you can redistribute it and/or modify it
-+# under the terms of the GNU General Public License version 2 only, as
-+# published by the Free Software Foundation.  Oracle designates this
-+# particular file as subject to the "Classpath" exception as provided
-+# by Oracle in the LICENSE file that accompanied this code.
-+#
-+# This code is distributed in the hope that it will be useful, but WITHOUT
-+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-+# version 2 for more details (a copy is included in the LICENSE file that
-+# accompanied this code).
-+#
-+# You should have received a copy of the GNU General Public License version
-+# 2 along with this work; if not, write to the Free Software Foundation,
-+# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
-+#
-+# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
-+# or visit www.oracle.com if you need additional information or have any
-+# questions.
-+#
-+# List of JVMs that can be used as an option to java, javac, etc.
-+# Order is important -- first in this list is the default JVM.
-+# NOTE that this both this file and its format are UNSUPPORTED and
-+# WILL GO AWAY in a future release.
-+#
-+# You may also select a JVM in an arbitrary location with the
-+# "-XXaltjvm=<jvm_dir>" option, but that too is unsupported
-+# and may not be available in a future release.
-+#
-+-client KNOWN
-+-server KNOWN
-+-hotspot ERROR
-+-classic WARN
-+-native ERROR
-+-green ERROR
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-remove-unused-backtrace.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-remove-unused-backtrace.patch
deleted file mode 100644
index 5423fde..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-remove-unused-backtrace.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Index: openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c
-===================================================================
---- openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c	2010-08-05 16:45:56.607257503 +0200
-+++ openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c	2010-08-05 16:47:19.727254686 +0200
-@@ -27,9 +27,6 @@
- #include <X11/Xutil.h>
- #include <X11/Xos.h>
- #include <X11/Xatom.h>
--#ifdef __linux__
--#include <execinfo.h>
--#endif
- 
- #include <jvm.h>
- #include <jni.h>
-@@ -689,26 +686,6 @@
-     return ret;
- }
- 
--#ifdef __linux__
--void print_stack(void)
--{
--  void *array[10];
--  size_t size;
--  char **strings;
--  size_t i;
--
--  size = backtrace (array, 10);
--  strings = backtrace_symbols (array, size);
--
--  fprintf (stderr, "Obtained %zd stack frames.\n", size);
--
--  for (i = 0; i < size; i++)
--     fprintf (stderr, "%s\n", strings[i]);
--
--  free (strings);
--}
--#endif
--
- Window get_xawt_root_shell(JNIEnv *env) {
-   static jclass classXRootWindow = NULL;
-   static jmethodID methodGetXRootWindow = NULL;
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-unpack-uclibc.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-unpack-uclibc.patch
deleted file mode 100644
index 7e98767..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-unpack-uclibc.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- openjdk/jdk/make/com/sun/java/pack/Makefile
-+++ openjdk/jdk/make/com/sun/java/pack/Makefile
-@@ -103,6 +103,7 @@ else
-   OTHER_LDLIBS  += -lc $(LIBCXX)
- # setup the list of libraries to link in...
- ifeq ($(PLATFORM), linux)
-+  OTHER_LDLIBS  += -lpthread
- ifeq ("$(CC_VER_MAJOR)", "3")
-   OTHER_LDLIBS  += -Wl,-Bstatic -lgcc_eh -Wl,-Bdynamic
- endif
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-launcher-stdc++.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-launcher-stdc++.patch
deleted file mode 100644
index b97745d..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-launcher-stdc++.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: openjdk/hotspot/make/linux/makefiles/launcher.make
-===================================================================
---- openjdk/hotspot/make/linux/makefiles/launcher.make	2011-12-20 10:33:37.000000000 +0100
-+++ openjdk/hotspot/make/linux/makefiles/launcher.make	2011-12-20 10:37:54.055022618 +0100
-@@ -51,7 +51,7 @@
- else
-   LAUNCHER.o                 = launcher.o
-   LFLAGS_LAUNCHER           += -L `pwd`
--  LIBS_LAUNCHER             += -l$(JVM) $(LIBS)
-+  LIBS_LAUNCHER             += -l$(JVM) $(LIBS) -lstdc++
-   ifeq ($(SHARK_BUILD), true)
-     LFLAGS_LAUNCHER += $(LLVM_LDFLAGS)
-     LIBS_LAUNCHER   += $(LLVM_LIBS)
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-libnet-renaming.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-libnet-renaming.patch
deleted file mode 100644
index d6a599c..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-libnet-renaming.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-diff --git openjdk/jdk/make/com/sun/nio/sctp/Makefile openjdk/jdk/make/com/sun/nio/sctp/Makefile
-index 4ae967f..fe669a9 100644
---- openjdk/jdk/make/com/sun/nio/sctp/Makefile
-+++ openjdk/jdk/make/com/sun/nio/sctp/Makefile
-@@ -64,11 +64,11 @@ ifneq ($(COMPILER_WARNINGS_FATAL),false)
- COMPILER_WARNINGS_FATAL=true
- endif
- #OTHER_LDLIBS += -L$(LIBDIR)/$(LIBARCH) -ljava -lnet -lpthread -ldl
--OTHER_LDLIBS += -L$(LIBDIR)/$(LIBARCH) -lnio -lnet -lpthread -ldl
-+OTHER_LDLIBS += -L$(LIBDIR)/$(LIBARCH) -lnio -ljavanet -lpthread -ldl
- endif
- ifeq ($(PLATFORM), solaris)
- #LIBSCTP = -lsctp
--OTHER_LDLIBS += $(LIBSOCKET) -L$(LIBDIR)/$(LIBARCH) -lnet -lnio
-+OTHER_LDLIBS += $(LIBSOCKET) -L$(LIBDIR)/$(LIBARCH) -ljavanet -lnio
- endif # PLATFORM
- 
- else # windows
-diff --git openjdk/jdk/make/java/net/Makefile openjdk/jdk/make/java/net/Makefile
-index 7283e45..720f3d3 100644
---- openjdk/jdk/make/java/net/Makefile
-+++ openjdk/jdk/make/java/net/Makefile
-@@ -25,7 +25,7 @@
- 
- BUILDDIR = ../..
- PACKAGE = java.net
--LIBRARY = net
-+LIBRARY = javanet
- PRODUCT = sun
- include $(BUILDDIR)/common/Defs.gmk
- 
-diff --git openjdk/jdk/make/java/nio/Makefile openjdk/jdk/make/java/nio/Makefile
-index 191f17d..1e5f8e5 100644
---- openjdk/jdk/make/java/nio/Makefile
-+++ openjdk/jdk/make/java/nio/Makefile
-@@ -369,7 +369,7 @@ ifeq ($(PLATFORM),windows)
- endif
- 
- ifeq ($(PLATFORM), linux)
--  OTHER_LDLIBS += -L$(LIBDIR)/$(LIBARCH) -ljava -lnet -lpthread $(LIBDL)
-+  OTHER_LDLIBS += -L$(LIBDIR)/$(LIBARCH) -ljava -ljavanet -lpthread $(LIBDL)
-   ifdef USE_SYSTEM_GIO
-     OTHER_LDLIBS += $(GIO_LIBS)
-     OTHER_INCLUDES += $(GIO_CFLAGS) -DUSE_SYSTEM_GIO
-@@ -379,12 +379,12 @@ ifeq ($(PLATFORM), linux)
- endif
- 
- ifeq ($(PLATFORM), macosx)
--OTHER_LDLIBS += -L$(LIBDIR) -ljava -lnet -pthread
-+OTHER_LDLIBS += -L$(LIBDIR) -ljava -ljavanet -pthread
- endif
- 
- ifeq ($(PLATFORM), solaris)
- OTHER_LDLIBS += $(JVMLIB) $(LIBSOCKET) -lposix4 $(LIBDL) -lsendfile \
--		-L$(LIBDIR)/$(LIBARCH) -ljava -lnet
-+		-L$(LIBDIR)/$(LIBARCH) -ljava -ljavanet
- endif # PLATFORM
- 
- ifdef COMPILE_AGAINST_SYSCALLS
-diff --git openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.java openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.java
-index b7f0f2f..b093868 100644
---- openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.java
-+++ openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.java
-@@ -69,7 +69,7 @@ abstract class AbstractPlainDatagramSocketImpl extends DatagramSocketImpl
-      */
-     static {
-         java.security.AccessController.doPrivileged(
--                  new sun.security.action.LoadLibraryAction("net"));
-+                  new sun.security.action.LoadLibraryAction("javanet"));
-     }
- 
-     /**
-diff --git openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java
-index c6a38ad..97de65b 100644
---- openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java
-+++ openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java
-@@ -78,7 +78,7 @@ abstract class AbstractPlainSocketImpl extends SocketImpl
-      */
-     static {
-         java.security.AccessController.doPrivileged(
--                  new sun.security.action.LoadLibraryAction("net"));
-+                  new sun.security.action.LoadLibraryAction("javanet"));
-     }
- 
-     /**
-diff --git openjdk/jdk/src/share/classes/java/net/DatagramPacket.java openjdk/jdk/src/share/classes/java/net/DatagramPacket.java
-index 195ee86..6822a57 100644
---- openjdk/jdk/src/share/classes/java/net/DatagramPacket.java
-+++ openjdk/jdk/src/share/classes/java/net/DatagramPacket.java
-@@ -47,7 +47,7 @@ class DatagramPacket {
-      */
-     static {
-         java.security.AccessController.doPrivileged(
--                  new sun.security.action.LoadLibraryAction("net"));
-+                  new sun.security.action.LoadLibraryAction("javanet"));
-         init();
-     }
- 
-diff --git openjdk/jdk/src/share/classes/java/net/InetAddress.java openjdk/jdk/src/share/classes/java/net/InetAddress.java
-index 3ea28e4..7c78eae 100644
---- openjdk/jdk/src/share/classes/java/net/InetAddress.java
-+++ openjdk/jdk/src/share/classes/java/net/InetAddress.java
-@@ -260,7 +260,7 @@ class InetAddress implements java.io.Serializable {
-     static {
-         preferIPv6Address = java.security.AccessController.doPrivileged(
-             new GetBooleanAction("java.net.preferIPv6Addresses")).booleanValue();
--        AccessController.doPrivileged(new LoadLibraryAction("net"));
-+        AccessController.doPrivileged(new LoadLibraryAction("javanet"));
-         init();
-     }
- 
-diff --git openjdk/jdk/src/share/classes/java/net/NetworkInterface.java openjdk/jdk/src/share/classes/java/net/NetworkInterface.java
-index 6314d15..761fdda 100644
---- openjdk/jdk/src/share/classes/java/net/NetworkInterface.java
-+++ openjdk/jdk/src/share/classes/java/net/NetworkInterface.java
-@@ -53,7 +53,7 @@ public final class NetworkInterface {
-     private static final int defaultIndex; /* index of defaultInterface */
- 
-     static {
--        AccessController.doPrivileged(new LoadLibraryAction("net"));
-+        AccessController.doPrivileged(new LoadLibraryAction("javanet"));
-         init();
-         defaultInterface = DefaultInterface.getDefault();
-         if (defaultInterface != null) {
-diff --git openjdk/jdk/src/share/classes/sun/net/sdp/SdpSupport.java openjdk/jdk/src/share/classes/sun/net/sdp/SdpSupport.java
-index 5baca6e..befd0b9 100644
---- openjdk/jdk/src/share/classes/sun/net/sdp/SdpSupport.java
-+++ openjdk/jdk/src/share/classes/sun/net/sdp/SdpSupport.java
-@@ -76,6 +76,6 @@ public final class SdpSupport {
- 
-     static {
-         AccessController.doPrivileged(
--            new sun.security.action.LoadLibraryAction("net"));
-+            new sun.security.action.LoadLibraryAction("javanet"));
-     }
- }
-diff --git openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java
-index d7aa358..9b2c719 100644
---- openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java
-+++ openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java
-@@ -95,7 +95,7 @@ public class DefaultProxySelector extends ProxySelector {
-                 }});
-         if (b != null && b.booleanValue()) {
-             java.security.AccessController.doPrivileged(
--                      new sun.security.action.LoadLibraryAction("net"));
-+                      new sun.security.action.LoadLibraryAction("javanet"));
-             hasSystemProxies = init();
-         }
-     }
-diff --git openjdk/jdk/src/share/classes/sun/nio/ch/Util.java openjdk/jdk/src/share/classes/sun/nio/ch/Util.java
-index 10662df..34d441a 100644
---- openjdk/jdk/src/share/classes/sun/nio/ch/Util.java
-+++ openjdk/jdk/src/share/classes/sun/nio/ch/Util.java
-@@ -483,7 +483,7 @@ class Util {
-                 return;
-             loaded = true;
-             java.security.AccessController
--                .doPrivileged(new sun.security.action.LoadLibraryAction("net"));
-+                .doPrivileged(new sun.security.action.LoadLibraryAction("javanet"));
-             java.security.AccessController
-                 .doPrivileged(new sun.security.action.LoadLibraryAction("nio"));
-             // IOUtil must be initialized; Its native methods are called from
-diff --git openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java
-index 3695b5d..7c833cc 100644
---- openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java
-+++ openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java
-@@ -247,7 +247,7 @@ public class ResolverConfigurationImpl
- 
-     static {
-         java.security.AccessController.doPrivileged(
--            new sun.security.action.LoadLibraryAction("net"));
-+            new sun.security.action.LoadLibraryAction("javanet"));
-     }
- 
- }
-diff --git openjdk/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java openjdk/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java
-index 7970885..46ab112 100644
---- openjdk/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java
-+++ openjdk/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java
-@@ -159,7 +159,7 @@ public class ResolverConfigurationImpl
- 
-     static {
-         java.security.AccessController.doPrivileged(
--            new sun.security.action.LoadLibraryAction("net"));
-+            new sun.security.action.LoadLibraryAction("javanet"));
-         init0();
- 
-         // start the address listener thread
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-openjdk-remove-currency-data-generation-expi.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-openjdk-remove-currency-data-generation-expi.patch
deleted file mode 100644
index 6dd36af..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-openjdk-remove-currency-data-generation-expi.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 7df2fd1014a0c31f518be4f6a0018533f469d584 Mon Sep 17 00:00:00 2001
-From: Alex Gonzalez <alex.gonzalez@digi.com>
-Date: Wed, 31 Dec 2014 16:07:32 +0100
-Subject: [PATCH] icedtea: openjdk: remove currency data generation expiration
- date
-
-Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>
----
- .../src/build/tools/generatecurrencydata/GenerateCurrencyData.java     | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java
-index bf335fa22c1d..0e421360fef9 100644
---- openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java
-+++ openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java
-@@ -281,9 +281,6 @@ public class GenerateCurrencyData {
-             checkCurrencyCode(newCurrency);
-             String timeString = currencyInfo.substring(4, length - 4);
-             long time = format.parse(timeString).getTime();
--            if (Math.abs(time - System.currentTimeMillis()) > ((long) 10) * 365 * 24 * 60 * 60 * 1000) {
--                throw new RuntimeException("time is more than 10 years from present: " + time);
--            }
-             specialCaseCutOverTimes[specialCaseCount] = time;
-             specialCaseOldCurrencies[specialCaseCount] = oldCurrency;
-             specialCaseOldCurrenciesDefaultFractionDigits[specialCaseCount] = getDefaultFractionDigits(oldCurrency);
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-remove_werror.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-remove_werror.patch
deleted file mode 100644
index f78f2b3..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-remove_werror.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-diff --git openjdk/hotspot/make/linux/makefiles/gcc.make openjdk/hotspot/make/linux/makefiles/gcc.make
-index 42f6843..765fc6d 100644
---- openjdk/hotspot/make/linux/makefiles/gcc.make
-+++ openjdk/hotspot/make/linux/makefiles/gcc.make
-@@ -149,11 +149,6 @@ else
-   CFLAGS += -pipe
- endif
- 
--# Compiler warnings are treated as errors
--ifneq ($(COMPILER_WARNINGS_FATAL),false)
--WARNINGS_ARE_ERRORS = -Werror
--endif
--
- # Except for a few acceptable ones
- # Since GCC 4.3, -Wconversion has changed its meanings to warn these implicit
- # conversions which might affect the values. To avoid that, we need to turn
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-shark-arm-linux-cpu-detection.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-shark-arm-linux-cpu-detection.patch
deleted file mode 100644
index f40bc51..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-shark-arm-linux-cpu-detection.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-Index: openjdk/hotspot/src/share/vm/shark/sharkCompiler.cpp
-===================================================================
---- openjdk.orig/hotspot/src/share/vm/shark/sharkCompiler.cpp	2010-07-14 16:42:48.412103129 +0200
-+++ openjdk/hotspot/src/share/vm/shark/sharkCompiler.cpp	2010-07-14 16:50:51.680282178 +0200
-@@ -32,6 +32,96 @@
- 
- #if SHARK_LLVM_VERSION >= 27
- namespace {
-+
-+#if defined(__arm__) && defined(__linux__)
-+#include <fcntl.h>
-+#include <linux/auxvec.h>
-+#include <asm/hwcap.h>
-+#define VECBUFF_SIZE 32
-+
-+bool TestARMLinuxHWCAP(int feature) {
-+  int fd;
-+  unsigned vecs[VECBUFF_SIZE];
-+  unsigned *p;
-+  int i, n;
-+  int rc;
-+
-+  rc = 0;
-+  fd = open("/proc/self/auxv", O_RDONLY);
-+  if (fd < 0) return 0;
-+  do {
-+    n = read(fd, vecs, VECBUFF_SIZE * sizeof(unsigned));
-+    p = vecs;
-+    i = n/8;
-+    while (--i >=0) {
-+      unsigned tag = *p++;
-+      unsigned value = *p++;
-+      if (tag == 0) goto fini;
-+      if(tag == AT_HWCAP && (value & feature)) {
-+        rc = 1;
-+        goto fini;
-+      }
-+    }
-+  } while (n == VECBUFF_SIZE * sizeof(unsigned));
-+fini:
-+  close(fd);
-+  return rc;
-+}
-+
-+char* TestARMLinuxAT(int auxvec) {
-+  int fd;
-+  unsigned vecs[VECBUFF_SIZE];
-+  unsigned *p;
-+  int i, n;
-+  char* rc;
-+
-+  rc = 0;
-+  fd = open("/proc/self/auxv", O_RDONLY);
-+  if (fd < 0) return 0;
-+  do {
-+    n = read(fd, vecs, VECBUFF_SIZE * sizeof(unsigned));
-+    p = vecs;
-+    i = n/8;
-+    while (--i >=0) {
-+      unsigned tag = *p++;
-+      unsigned value = *p++;
-+      if (tag == 0) goto fini;
-+      if(tag == (unsigned) auxvec ) {
-+        rc = (char*)value;
-+        goto fini;
-+      }
-+    }
-+  } while (n == VECBUFF_SIZE * sizeof(unsigned));
-+fini:
-+  close(fd);
-+  return rc;
-+}
-+
-+bool getARMHostCPUFeatures(StringMap<bool> &Features) {
-+  // FIXME LLVM PR6561 // Features["neon"]=TestARMLinuxHWCAP(HWCAP_NEON);
-+  Features["thumb2"]=TestARMLinuxHWCAP(HWCAP_THUMBEE);
-+  Features["vfp2"]=TestARMLinuxHWCAP(HWCAP_VFP);
-+
-+  std::string testArchKey(TestARMLinuxAT(AT_PLATFORM));
-+
-+  StringMap<std::string> archLinuxToLLVMMap;
-+  archLinuxToLLVMMap["v4l"]="v4t";
-+  archLinuxToLLVMMap["v5l"]="v5t";
-+  archLinuxToLLVMMap["v6l"]="v6";
-+  // FIXME change this from v6 to v7a when LLVM PR7048 have been fixed
-+  archLinuxToLLVMMap["v7l"]="v6";
-+
-+  llvm::StringMapIterator<std::string> resultIterator(archLinuxToLLVMMap.find(
-+                                                      testArchKey));
-+  if(resultIterator->first()) {
-+    std::string arch(resultIterator->second);
-+    Features[arch]=true;
-+  }
-+
-+  return true;
-+}
-+#endif
-+
-   cl::opt<std::string>
-   MCPU("mcpu");
- 
-@@ -64,7 +154,11 @@
- #if SHARK_LLVM_VERSION >= 27
-   // Finetune LLVM for the current host CPU.
-   StringMap<bool> Features;
-+#if defined(__arm__) && defined(__linux__)
-+  bool gotCpuFeatures = getARMHostCPUFeatures(Features);
-+#else
-   bool gotCpuFeatures = llvm::sys::getHostCPUFeatures(Features);
-+#endif
-   std::string cpu("-mcpu=" + llvm::sys::getHostCPUName());
- 
-   std::vector<const char*> args;
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-unbreak-float.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-unbreak-float.patch
deleted file mode 100644
index c03b23c..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-unbreak-float.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-diff --git openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h
-index c24c781..ccdc41a 100644
---- openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h
-+++ openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h
-@@ -32,13 +32,11 @@
- #endif
- #include "jfdlibm.h"
- 
--#ifdef __NEWVALID       /* special setup for Sun test regime */
- #if defined(i386) || defined(i486) || \
-     defined(intel) || defined(x86) || defined(arm) || \
-     defined(i86pc) || defined(_M_IA64) || defined(ia64)
- #define _LITTLE_ENDIAN
- #endif
--#endif
- 
- #ifdef _LITTLE_ENDIAN
- #define __HI(x) *(1+(int*)&x)
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch
deleted file mode 100644
index 3f7d70a..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git openjdk/jdk/make/java/nio/Makefile openjdk/jdk/make/java/nio/Makefile
-index 898272e..c5ca547 100644
---- openjdk/jdk/make/java/nio/Makefile
-+++ openjdk/jdk/make/java/nio/Makefile
-@@ -48,6 +48,8 @@ include FILES_java.gmk
- include FILES_c.gmk
- include Exportedfiles.gmk
- 
-+NIO_PLATFORM_CLASSES_ROOT_DIR =
-+
- ifeq ($(PLATFORM), windows)
- FILES_java += \
- 	sun/nio/ch/Iocp.java \
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch
deleted file mode 100644
index 784f2de..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-diff --git openjdk/hotspot/make/linux/makefiles/zeroshark.make openjdk/hotspot/make/linux/makefiles/zeroshark.make
-index c2a1484..156bdd0 100644
---- openjdk/hotspot/make/linux/makefiles/zeroshark.make
-+++ openjdk/hotspot/make/linux/makefiles/zeroshark.make
-@@ -32,26 +32,28 @@ Obj_Files += cppInterpreter_arm.o
- Obj_Files += thumb2.o
- 
- CFLAGS += -DHOTSPOT_ASM
-+CCFLAGS += -DHOTSPOT_ASM
-+
- 
- cppInterpreter_arm.o:	offsets_arm.s bytecodes_arm.s
- thumb2.o:		offsets_arm.s
- 
- offsets_arm.s:	mkoffsets
- 	@echo Generating assembler offsets
--	./mkoffsets > $@
-+	$(QEMU) ./mkoffsets > $@
- 
- bytecodes_arm.s: bytecodes_arm.def mkbc
- 	@echo Generating ARM assembler bytecode sequences
--	$(CC_COMPILE) $(CFLAGS) -E -x c++ - < $< | ./mkbc - $@ $(COMPILE_DONE)
-+	$(CC_COMPILE) $(CFLAGS) -E -x c++ - < $< | $(QEMU) ./mkbc - $@ $(COMPILE_DONE)
- 
- mkbc:	$(GAMMADIR)/tools/mkbc.c
- 	@echo Compiling mkbc tool
--	$(CC_COMPILE) -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) -static -fuse-ld=bfd -o $@ $< $(COMPILE_DONE)
- 
- mkoffsets:	asm_helper.cpp
- 	@echo Compiling offset generator
- 	$(QUIETLY) $(REMOVE_TARGET)
--	$(CC_COMPILE) $(CFLAGS) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) $(CFLAGS) -static -fuse-ld=bfd -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
- 
- endif
- 
diff --git a/recipes-core/openjdk/openjdk-7-25b30/jvm.cfg b/recipes-core/openjdk/openjdk-7-25b30/jvm.cfg
deleted file mode 100644
index ea97cda..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/jvm.cfg
+++ /dev/null
@@ -1,43 +0,0 @@
-# Copyright 2003 Sun Microsystems, Inc.  All Rights Reserved.
-# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
-#
-# This code is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License version 2 only, as
-# published by the Free Software Foundation.  Sun designates this
-# particular file as subject to the "Classpath" exception as provided
-# by Sun in the LICENSE file that accompanied this code.
-#
-# This code is distributed in the hope that it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# version 2 for more details (a copy is included in the LICENSE file that
-# accompanied this code).
-#
-# You should have received a copy of the GNU General Public License version
-# 2 along with this work; if not, write to the Free Software Foundation,
-# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
-# CA 95054 USA or visit www.sun.com if you need additional information or
-# have any questions.
-#
-# 
-# List of JVMs that can be used as an option to java, javac, etc.
-# Order is important -- first in this list is the default JVM.
-# NOTE that this both this file and its format are UNSUPPORTED and
-# WILL GO AWAY in a future release.
-#
-# You may also select a JVM in an arbitrary location with the
-# "-XXaltjvm=<jvm_dir>" option, but that too is unsupported
-# and may not be available in a future release.
-#
--server ERROR
--client IGNORE
--hotspot ERROR
--classic WARN
--native ERROR
--green ERROR
--zero ALIASED_TO -server
--shark ERROR
--cacao ERROR
--jamvm ERROR
diff --git a/recipes-core/openjdk/openjdk-7-25b30/remove-sun.misc.Perf-debug-code.patch b/recipes-core/openjdk/openjdk-7-25b30/remove-sun.misc.Perf-debug-code.patch
deleted file mode 100644
index 00b9660..0000000
--- a/recipes-core/openjdk/openjdk-7-25b30/remove-sun.misc.Perf-debug-code.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Index: openjdk/jdk/src/share/classes/java/net/URLClassLoader.java
-===================================================================
---- openjdk.orig/jdk/src/share/classes/java/net/URLClassLoader.java	2011-06-13 16:58:42.000000000 +0200
-+++ openjdk/jdk/src/share/classes/java/net/URLClassLoader.java	2011-06-28 18:43:50.114802612 +0200
-@@ -438,14 +438,12 @@
-             // Use (direct) ByteBuffer:
-             CodeSigner[] signers = res.getCodeSigners();
-             CodeSource cs = new CodeSource(url, signers);
--            sun.misc.PerfCounter.getReadClassBytesTime().addElapsedTimeFrom(t0);
-             return defineClass(name, bb, cs);
-         } else {
-             byte[] b = res.getBytes();
-             // must read certificates AFTER reading bytes.
-             CodeSigner[] signers = res.getCodeSigners();
-             CodeSource cs = new CodeSource(url, signers);
--            sun.misc.PerfCounter.getReadClassBytesTime().addElapsedTimeFrom(t0);
-             return defineClass(name, b, 0, b.length, cs);
-         }
-     }
-Index: openjdk/jdk/src/share/classes/java/lang/ClassLoader.java
-===================================================================
---- openjdk.orig/jdk/src/share/classes/java/lang/ClassLoader.java	2011-06-13 16:58:42.000000000 +0200
-+++ openjdk/jdk/src/share/classes/java/lang/ClassLoader.java	2011-06-28 18:43:50.142802778 +0200
-@@ -422,10 +422,6 @@
-                     long t1 = System.nanoTime();
-                     c = findClass(name);
- 
--                    // this is the defining class loader; record the stats
--                    sun.misc.PerfCounter.getParentDelegationTime().addTime(t1 - t0);
--                    sun.misc.PerfCounter.getFindClassTime().addElapsedTimeFrom(t1);
--                    sun.misc.PerfCounter.getFindClasses().increment();
-                 }
-             }
-             if (resolve) {
-Index: openjdk/jdk/src/share/classes/java/util/zip/ZipFile.java
-===================================================================
---- openjdk.orig/jdk/src/share/classes/java/util/zip/ZipFile.java
-+++ openjdk/jdk/src/share/classes/java/util/zip/ZipFile.java
-@@ -213,8 +213,6 @@ class ZipFile implements ZipConstants, Closeable {
-         this.zc = ZipCoder.get(charset);
-         long t0 = System.nanoTime();
-         jzfile = open(name, mode, file.lastModified(), usemmap);
--        sun.misc.PerfCounter.getZipFileOpenTime().addElapsedTimeFrom(t0);
--        sun.misc.PerfCounter.getZipFileCount().increment();
-         this.name = name;
-         this.total = getTotal(jzfile);
-         this.locsig = startsWithLOC(jzfile);
diff --git a/recipes-core/openjdk/openjdk-7-release-25b30.inc b/recipes-core/openjdk/openjdk-7-release-25b30.inc
deleted file mode 100644
index 9888ce3..0000000
--- a/recipes-core/openjdk/openjdk-7-release-25b30.inc
+++ /dev/null
@@ -1,137 +0,0 @@
-require openjdk-7-common.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-FILESPATH =. "${FILE_DIRNAME}/openjdk-7-25b30:"
-
-# Name of the directory containing the compiled output
-BUILD_DIR = "openjdk.build"
-BUILD_DIR_ECJ = "openjdk.build-ecj"
-
-# Force arm mode for now
-ARM_INSTRUCTION_SET_armv4t = "ARM"
-
-ICEDTEA_URI = "http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=iced"
-
-ICEDTEA_PREFIX = "icedtea7-forest-2.3"
-ICEDTEA_HG_URL = "http://icedtea.classpath.org/hg/release/${ICEDTEA_PREFIX}"
-
-OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
-OPENJDK_URI = "${ICEDTEA_HG_URL}/archive/${OPENJDK_FILE};name=openjdk;unpack=false"
-
-HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.gz"
-HOTSPOT_URI = "${ICEDTEA_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
-
-CORBA_FILE = "${CORBA_CHANGESET}.tar.gz"
-CORBA_URI = "${ICEDTEA_HG_URL}/corba/archive/${CORBA_FILE};name=corba;unpack=false"
-
-JAXP_FILE = "${JAXP_CHANGESET}.tar.gz"
-JAXP_URI = "${ICEDTEA_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpack=false"
-
-JAXWS_FILE = "${JAXWS_CHANGESET}.tar.gz"
-JAXWS_URI = "${ICEDTEA_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;unpack=false"
-
-JDK_FILE = "${JDK_CHANGESET}.tar.gz"
-JDK_URI = "${ICEDTEA_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=false"
-
-LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.gz"
-LANGTOOLS_URI = "${ICEDTEA_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=langtools;unpack=false"
-
-CACAO_VERSION = "e215e36be9fc"
-CACAO_FILE = "${CACAO_VERSION}.tar.gz"
-CACAO_URI = "http://icedtea.wildebeest.org/download/drops/cacao/${CACAO_FILE};name=cacao;unpack=false"
-SRC_URI[cacao.md5sum] = "79f95f0aea4ba04cf2f1a8632ac66d14"
-SRC_URI[cacao.sha256sum] = "4966514c72ee7ed108b882d9b6e65c3adf8a8f9c2dccb029f971b3c8cb4870ab"
-
-JAMVM_VERSION = "0972452d441544f7dd29c55d64f1ce3a5db90d82"
-JAMVM_FILE = "jamvm-${JAMVM_VERSION}.tar.gz"
-JAMVM_URI = "http://icedtea.wildebeest.org/download/drops/jamvm/${JAMVM_FILE};name=jamvm;unpack=false"
-SRC_URI[jamvm.md5sum] = "f4616713ec609e35aa8070811bd952aa"
-SRC_URI[jamvm.sha256sum] = "bfa706402ac934d24f7119eb78f6be65e91439a4b2e49dbcc21e288137808f03"
-
-# Allow overriding this separately
-OEPATCHES = "\
-	file://build-hacks.patch \
-	file://cacao-libtoolize.patch \
-	file://cacao-loadavg-makefile.patch \
-	file://fix_hotspot_crosscompile.patch \
-        file://cacao-update.patch \
-	file://cacao-loadavg.patch;apply=no \
-        file://cacao-arm-ucontext.patch;apply=no \
-        file://remove-sun.misc.Perf-debug-code.patch;apply=no \
-        file://fix-checksums.patch \
-	"
-
-# overrride the jamvm patch for now, needs to be solved upstream
-do_unpackpost() {
-    cp ${WORKDIR}/remove-sun.misc.Perf-debug-code.patch ${S}/patches/jamvm
-}
-
-addtask unpackpost after do_unpack before do_patch
-
-# Allow overriding this separately
-ICEDTEAPATCHES = "\
-	file://icedtea-crosscompile-fix.patch;apply=no \
-	file://icedtea-unbreak-float.patch;apply=no \
-	file://icedtea-remove_werror.patch;apply=no \
-        file://icedtea-libnet-renaming.patch;apply=no \
-	file://icedtea-shark-arm-linux-cpu-detection.patch;apply=no \
-	file://icedtea-corba-parallel-make.patch;apply=no \
-        file://icedtea-zero-hotspotfix.patch;apply=no \
-	file://icedtea-jdk-nio-use-host-cc.patch;apply=no \
-        file://icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch;apply=no \
-        file://icedtea-openjdk-remove-currency-data-generation-expi.patch;apply=no \
-        file://icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch;apply=no \
-	"
-ICEDTEAPATCHES_append_powerpc = " \
-	file://icedtea-jdk-ppc64-jvm-cfg.patch;apply=no \
-	file://icedtea-jdk-powerpc-atomic64.patch;apply=no \
-        "
-ICEDTEAPATCHES_append_powerpc64 = " \
-	file://icedtea-jdk-ppc64-jvm-cfg.patch;apply=no \
-        "
-ICEDTEAPATCHES_append_libc-uclibc = " \
-        file://icedtea-hotspot-isfinte.patch;apply=no \
-        file://icedtea-hotspot-glibc-version.patch;apply=no \
-        file://icedtea-hotspot-loadavg.patch;apply=no \
-        file://icedtea-hotspot-isnanf.patch;apply=no \
-        file://icedtea-jdk-iconv-uclibc.patch;apply=no \
-        file://icedtea-jdk-remove-unused-backtrace.patch;apply=no \
-        file://icedtea-jdk-unpack-uclibc.patch;apply=no \
-	file://icedtea-hotspot-dlvsym-uclibc.patch;apply=no \
-        "
-
-# Allow overriding this separately
-DISTRIBUTION_PATCHES = "\
-	patches/icedtea-crosscompile-fix.patch \
-	patches/icedtea-unbreak-float.patch \
-	patches/icedtea-remove_werror.patch \
-        patches/icedtea-libnet-renaming.patch \
-	patches/icedtea-shark-arm-linux-cpu-detection.patch \
-	patches/icedtea-corba-parallel-make.patch \
-        patches/icedtea-zero-hotspotfix.patch \
-	patches/icedtea-jdk-nio-use-host-cc.patch \
-	patches/icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch \
-	patches/icedtea-openjdk-remove-currency-data-generation-expi.patch \
-	patches/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch \
-	"
-
-DISTRIBUTION_PATCHES_append_libc-uclibc = "\
-        patches/icedtea-hotspot-isfinte.patch \
-        patches/icedtea-hotspot-isnanf.patch \
-        patches/icedtea-hotspot-glibc-version.patch \
-        patches/icedtea-hotspot-loadavg.patch \
-        patches/icedtea-jdk-iconv-uclibc.patch \
-        patches/icedtea-jdk-remove-unused-backtrace.patch \
-        patches/icedtea-jdk-unpack-uclibc.patch \
-	patches/icedtea-hotspot-dlvsym-uclibc.patch \
-        "
-
-DISTRIBUTION_PATCHES_append_powerpc = " \
-	patches/icedtea-jdk-ppc64-jvm-cfg.patch \
-	patches/icedtea-jdk-powerpc-atomic64.patch \
-        "
-DISTRIBUTION_PATCHES_append_powerpc64 = " \
-	patches/icedtea-jdk-ppc64-jvm-cfg.patch \
-        "
-export DISTRIBUTION_PATCHES
diff --git a/recipes-core/openjdk/openjdk-7_25b30-2.3.12.bb b/recipes-core/openjdk/openjdk-7_25b30-2.3.12.bb
deleted file mode 100644
index dcaf8bf..0000000
--- a/recipes-core/openjdk/openjdk-7_25b30-2.3.12.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-require openjdk-7-release-25b30.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[iced.md5sum] = "9b3afa162021e3fca6161ba8f9f7dc11"
-SRC_URI[iced.sha256sum] = "3c4e88e7c1b2b39dcd7ed65c3b9a1a8dbd2a48848ce42e1d8a22a6821cf890d1"
-
-CORBA_CHANGESET = "ea108ff3be9a"
-SRC_URI[corba.md5sum] = "f76840f24d112a8fe259cb4122415a25"
-SRC_URI[corba.sha256sum] = "818f5613b218fe2a2036e6c65622b970839986c0c1ca95563f911b379a52b765"
-
-JAXP_CHANGESET = "332f0234a53e"
-SRC_URI[jaxp.md5sum] = "1b11d9fa16e7bf7613a8b9d32f6a586a"
-SRC_URI[jaxp.sha256sum] = "a3f99615331cdc3d5e38e7169bb4b03dc43ede25c73834114240b8768207b9dc"
-
-JAXWS_CHANGESET = "fdc4ad9f30c6"
-SRC_URI[jaxws.md5sum] = "f6eb8fcbf99d0914149b0e2deac0e34c"
-SRC_URI[jaxws.sha256sum] = "b149c1fab323a586eae9b4459ccd929f0db8b35769e42dd7f4fbadc48b803dab"
-
-JDK_CHANGESET = "4a0cf2c05cc6"
-SRC_URI[jdk.md5sum] = "89f3dac9c06581fd8b4f1b1103a6c2f9"
-SRC_URI[jdk.sha256sum] = "badbbf50c820325ffe592762a2eff3414df71e286460b75716a2100d7f6f2aa0"
-
-LANGTOOLS_CHANGESET = "6c9b532f4281"
-SRC_URI[langtools.md5sum] = "e932425860de3b52358cff66b9ceadbf"
-SRC_URI[langtools.sha256sum] = "b9e2e3c97393f566b0c4dc2b0ca826bfb3b3841f5522a850b82d1ff23745839b"
-
-OPENJDK_CHANGESET = "e62743867f54"
-SRC_URI[openjdk.md5sum] = "5680583c82703031d6acb0a141fd328f"
-SRC_URI[openjdk.sha256sum] = "d1132bdde0e19d8e4d2516213bce7aa50b4b6d1ab04a82bf7a0440d6184db842"
-
-# located in hotspot.map
-HOTSPOT_CHANGESET = "37b254871acb"
-SRC_URI[hotspot.md5sum] = "57f2077c4d4237de44b788e0a8456c83"
-SRC_URI[hotspot.sha256sum] = "60268f9d792575ec26b8796753246aca70282937327c2fa855b3f0010638605e"
-
-- 
1.8.1.rc3


