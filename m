Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1564B6AC24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 07:27:51 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so71059764wgy.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 00:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xQktI/cclw47MHurD63ZUU2oYU0UAfeKTXJF1hyJpoo=;
	b=lIcms5/fh5P7/HN1x1VuJHFnY5juTNE5vhjrmQFCqKgU4nBveDOlOONjLcowTSdCqB
	9C6DUps/CLxsYfl/VRDaMpkNkbqFnNHyrpSCQ1+h+5HqFvMdrTNVLSvW3AaalbUASFnz
	BNCN4381gAbXyWcvylT+6BxAmFPcFB8pVR039jknDgiuYLSWGKT8FJj03vQz2of2ghC3
	U9nfKe0SfYgvyec/5wQMudqXI8CaRNj0wYYbwWPDCy0Lim78mrG42S2lCbaLsyJ1dHA/
	fCd2frJ3uSo43dcxy06qhB/C01qTr6OfaBkwXdMg1G+e6wlp1IZCT9CEGjF0DbFw2MEL
	ZEnA==
X-Received: by 10.194.187.41 with SMTP id fp9mr25500011wjc.58.1428910072380;
	Mon, 13 Apr 2015 00:27:52 -0700 (PDT)
Received: from localhost.localdomain (pD9F9B569.dip0.t-ipconnect.de.
	[217.249.181.105]) by mx.google.com with ESMTPSA id
	i10sm10139643wja.40.2015.04.13.00.27.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Apr 2015 00:27:51 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Apr 2015 09:27:34 +0200
Message-Id: <1428910057-23647-5-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
In-Reply-To: <1428910057-23647-4-git-send-email-sven.ebenfeld@gmail.com>
References: <1428910057-23647-1-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-2-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-3-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-4-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH v2 4/7] openjdk-7: Add Version 75b13 with IcedTea 2.5.4
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
X-List-Received-Date: Mon, 13 Apr 2015 07:27:52 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../openjdk/openjdk-7-75b13/build-hacks.patch      |  71 +++++
 .../openjdk-7-75b13/cacao-arm-ucontext.patch       |  24 ++
 .../openjdk/openjdk-7-75b13/cacao-libtoolize.patch |  12 +
 .../openjdk-7-75b13/cacao-loadavg-makefile.patch   |  13 +
 .../openjdk/openjdk-7-75b13/cacao-loadavg.patch    |  27 ++
 .../openjdk/openjdk-7-75b13/fix-checksums.patch    |  28 ++
 .../openjdk-7-75b13/fix_hotspot_crosscompile.patch |  52 +++
 ...cedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch |  19 ++
 .../openjdk-7-75b13/icedtea-crosscompile-fix.patch | 355 +++++++++++++++++++++
 .../icedtea-jdk-nio-use-host-cc.patch              |  74 +++++
 .../icedtea-jdk-rmi-crosscompile.patch             |  13 +
 .../openjdk-7-75b13/icedtea-libnet-renaming.patch  | 236 ++++++++++++++
 ...njdk-remove-currency-data-generation-expi.patch |  25 ++
 .../openjdk-7-75b13/icedtea-remove_werror.patch    |  16 +
 .../icedtea-shark-arm-linux-cpu-detection.patch    | 113 +++++++
 .../openjdk-7-75b13/icedtea-unbreak-float.patch    |  18 ++
 ...edtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch |  13 +
 .../openjdk-7-75b13/icedtea-zero-hotspotfix.patch  |  36 +++
 recipes-core/openjdk/openjdk-7-75b13/jvm.cfg       |  43 +++
 .../remove-sun.misc.Perf-debug-code.patch          |  47 +++
 recipes-core/openjdk/openjdk-7-common.inc          |   9 +-
 recipes-core/openjdk/openjdk-7-release-75b13.inc   | 102 ++++++
 recipes-core/openjdk/openjdk-7_75b13-2.5.4.bb      |  36 +++
 23 files changed, 1378 insertions(+), 4 deletions(-)
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/build-hacks.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/cacao-arm-ucontext.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/cacao-libtoolize.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/cacao-loadavg-makefile.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/cacao-loadavg.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/fix-checksums.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/fix_hotspot_crosscompile.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscompile-fix.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-nio-use-host-cc.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-rmi-crosscompile.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-libnet-renaming.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-openjdk-remove-currency-data-generation-expi.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-remove_werror.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-shark-arm-linux-cpu-detection.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-unbreak-float.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-zero-hotspotfix.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/jvm.cfg
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/remove-sun.misc.Perf-debug-code.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-release-75b13.inc
 create mode 100644 recipes-core/openjdk/openjdk-7_75b13-2.5.4.bb

diff --git a/recipes-core/openjdk/openjdk-7-75b13/build-hacks.patch b/recipes-core/openjdk/openjdk-7-75b13/build-hacks.patch
new file mode 100644
index 0000000..998e656
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/build-hacks.patch
@@ -0,0 +1,71 @@
+Index: icedtea-2.5.4/Makefile.am
+===================================================================
+--- icedtea-2.5.4.orig/Makefile.am	2013-07-26 18:17:45.499466367 +0000
++++ icedtea-2.5.4/Makefile.am	2013-07-30 21:04:46.761410713 +0000
+@@ -474,6 +474,12 @@
+ 	FT2_LIBS="$(FREETYPE2_LIBS)" \
+ 	ALT_PARALLEL_COMPILE_JOBS="$(PARALLEL_JOBS)" \
+ 	HOTSPOT_BUILD_JOBS="$(PARALLEL_JOBS)" \
++	OE_CFLAGS="$(OE_CFLAGS)" \
++	OE_CPPFLAGS="$(OE_CPPFLAGS)" \
++	OE_CXXFLAGS="$(OE_CXXFLAGS)" \
++	OE_LDFLAGS="$(OE_LDFLAGS)" \
++	OE_LAUNCHER_LDFLAGS="$(OE_LAUNCHER_LDFLAGS)" \
++	DISTRIBUTION_ID="$(DIST_ID)" \
+ 	QUIETLY="" \
+ 	ANT_RESPECT_JAVA_HOME="TRUE" \
+ 	DISTRIBUTION_ID="$(DIST_ID)" \
+@@ -1777,8 +1783,8 @@
+ 	rm -f stamps/add-tzdata-support.stamp
+ 
+ stamps/check-crypto.stamp: stamps/cryptocheck.stamp stamps/icedtea.stamp
+-	if [ -e $(BUILD_OUTPUT_DIR)/j2sdk-image/bin/java ] ; then \
+-	  $(BUILD_OUTPUT_DIR)/j2sdk-image/bin/java -cp $(CRYPTO_CHECK_BUILD_DIR) TestCryptoLevel ; \
++	if [ -e $(abs_top_builddir)/bootstrap/jdk1.6.0/bin/java ] ; then \
++	  $(abs_top_builddir)/bootstrap/jdk1.6.0/bin/java -cp $(CRYPTO_CHECK_BUILD_DIR) TestCryptoLevel ; \
+ 	fi
+ 	mkdir -p stamps
+ 	touch $@
+@@ -2124,7 +2130,11 @@
+ 	cd jamvm/jamvm && \
+ 	LDFLAGS="-Xlinker -z -Xlinker noexecstack" \
+ 	./autogen.sh --with-java-runtime-library=openjdk7 \
+-	  --prefix=$(abs_top_builddir)/jamvm/install ; \
++	  --prefix=$(abs_top_builddir)/jamvm/install \
++	  --host=$(host_alias) \
++	  --build=$(build_alias) \
++	  --target=$(target_alias)  \
++	  --with-libtool-sysroot=${ALT_FREETYPE_LIB_PATH} ; \
+ 	$(MAKE) ; \
+ 	$(MAKE) install
+ 	mkdir -p $(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/server
+@@ -2189,6 +2199,7 @@
+ 	  --host=$(host_alias) \
+ 	  --build=$(build_alias) \
+ 	  --target=$(target_alias) \
++	  --with-libtool-sysroot=${ALT_FREETYPE_LIB_PATH} \
+ 	  --prefix=$(abs_top_builddir)/cacao/install \
+ 	  --with-java-runtime-library=openjdk7 \
+ 	  --with-java-runtime-library-prefix=$(abs_top_builddir)/openjdk \
+@@ -2256,7 +2267,7 @@
+ # configure script arguments, quoted in single quotes
+ CONFIGURE_ARGS = @CONFIGURE_ARGS@
+ ADD_ZERO_CONFIGURE_ARGS = \
+-	--with-jdk-home=$(BUILD_OUTPUT_DIR)/j2sdk-image \
++	--with-jdk-home=$(abs_top_builddir)/bootstrap/jdk1.6.0 \
+ 	--disable-bootstrap --enable-zero
+ if ADD_SHARK_BUILD
+ ADD_ZERO_CONFIGURE_ARGS += \
+Index: icedtea-2.5.4/javac.in
+===================================================================
+--- icedtea-2.3.4.orig/javac.in	2013-07-24 21:33:57.224612327 +0000
++++ icedtea-2.5.4/javac.in	2013-07-30 19:41:56.240277496 +0000
+@@ -77,5 +77,7 @@
+     my @CLASSPATH = ('@ECJ_JAR@');
+     push @CLASSPATH, split /:/, $ENV{"CLASSPATH"} if exists $ENV{"CLASSPATH"};
+     $ENV{"CLASSPATH"} = join ':', @CLASSPATH;
+-    exec '@JAVA@', 'org.eclipse.jdt.internal.compiler.batch.Main', @ecj_parms, @ecj_args;
++    # Compiling hotspot-tools consumes tons of memory and exceeds any default
++    # limits for jamvm and cacao.
++    exec '@JAVA@', '-Xmx1024m', 'org.eclipse.jdt.internal.compiler.batch.Main', @ecj_parms, @ecj_args;
+ }
diff --git a/recipes-core/openjdk/openjdk-7-75b13/cacao-arm-ucontext.patch b/recipes-core/openjdk/openjdk-7-75b13/cacao-arm-ucontext.patch
new file mode 100644
index 0000000..c21fcf1
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/cacao-arm-ucontext.patch
@@ -0,0 +1,24 @@
+Index: cacao-a567bcb7f589/src/vm/jit/arm/linux/md-os.c
+===================================================================
+--- cacao-a567bcb7f589/src/vm/jit/arm/linux/md-os.c	2013-01-26 21:30:54.206581090 +0100
++++ cacao-a567bcb7f589/src/vm/jit/arm/linux/md-os.c	2013-01-26 21:31:34.406991316 +0100
+@@ -28,19 +28,7 @@
+ 
+ #include <stdint.h>
+ 
+-#define ucontext broken_glibc_ucontext
+-#define ucontext_t broken_glibc_ucontext_t
+ #include <ucontext.h>
+-#undef ucontext
+-#undef ucontext_t
+-
+-typedef struct ucontext {
+-   unsigned long     uc_flags;
+-   struct ucontext  *uc_link;
+-   stack_t           uc_stack;
+-   struct sigcontext uc_mcontext;
+-   sigset_t          uc_sigmask;
+-} ucontext_t;
+ 
+ #define scontext_t struct sigcontext
+ 
diff --git a/recipes-core/openjdk/openjdk-7-75b13/cacao-libtoolize.patch b/recipes-core/openjdk/openjdk-7-75b13/cacao-libtoolize.patch
new file mode 100644
index 0000000..484cb10
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/cacao-libtoolize.patch
@@ -0,0 +1,12 @@
+Index: icedtea6/Makefile.am
+===================================================================
+--- icedtea6.orig/Makefile.am	2011-12-21 22:58:23.000000000 +0100
++++ icedtea6/Makefile.am	2011-12-21 23:00:21.405887186 +0100
+@@ -1922,6 +1922,7 @@
+ if BUILD_CACAO
+ if !USE_SYSTEM_CACAO
+ 	cd cacao/cacao && \
++	rm -f libtool && \
+ 	./autogen.sh && \
+ 	$(ARCH_PREFIX) ./configure \
+ 	  --host=$(host_alias) \
diff --git a/recipes-core/openjdk/openjdk-7-75b13/cacao-loadavg-makefile.patch b/recipes-core/openjdk/openjdk-7-75b13/cacao-loadavg-makefile.patch
new file mode 100644
index 0000000..a389206
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/cacao-loadavg-makefile.patch
@@ -0,0 +1,13 @@
+Index: icedtea-2.1.4/Makefile.am
+===================================================================
+--- icedtea-2.1.4.orig/Makefile.am	2013-01-26 18:20:55.152561203 +0100
++++ icedtea-2.1.4/Makefile.am	2013-01-26 18:41:07.637992206 +0100
+@@ -1994,6 +1994,8 @@
+ if BUILD_CACAO
+ if !USE_SYSTEM_CACAO
+ 	cd cacao/cacao && \
++	patch -p1 -N < $(abs_top_srcdir)/patches/cacao-loadavg.patch && \
++	patch -p1 -N < $(abs_top_srcdir)/patches/cacao-arm-ucontext.patch && \
+ 	rm -f libtool && \
+ 	./autogen.sh && \
+ 	$(ARCH_PREFIX) ./configure \
diff --git a/recipes-core/openjdk/openjdk-7-75b13/cacao-loadavg.patch b/recipes-core/openjdk/openjdk-7-75b13/cacao-loadavg.patch
new file mode 100644
index 0000000..0fc1a81
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/cacao-loadavg.patch
@@ -0,0 +1,27 @@
+Index: cacao-cff92704c4e0/src/vm/os.hpp
+===================================================================
+--- cacao-cff92704c4e0/src/vm/os.hpp	2011-12-08 13:40:45.000000000 +0100
++++ cacao-cff92704c4e0/src/vm/os.hpp	2011-12-20 11:42:36.985633921 +0100
+@@ -425,7 +425,21 @@
+ #if defined(HAVE_GETLOADAVG)
+ 	return ::getloadavg(loadavg, nelem);
+ #else
+-# error getloadavg not available
++        FILE *LOADAVG;
++        double avg[3] = { 0.0, 0.0, 0.0 };
++        int i, res = -1;;
++
++        if ((LOADAVG = fopen("/proc/loadavg", "r"))) {
++                fscanf(LOADAVG, "%lf %lf %lf", &avg[0], &avg[1], &avg[2]);
++                res = 0;
++                fclose(LOADAVG);
++        }
++
++        for (i = 0; (i < nelem) && (i < 3); i++) {
++                loadavg[i] = avg[i];
++        }
++
++        return res;
+ #endif
+ }
+ 
diff --git a/recipes-core/openjdk/openjdk-7-75b13/fix-checksums.patch b/recipes-core/openjdk/openjdk-7-75b13/fix-checksums.patch
new file mode 100644
index 0000000..5623448
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/fix-checksums.patch
@@ -0,0 +1,28 @@
+--- icedtea-2.5.4/Makefile.am	2015-04-02 10:48:12.919550836 +0200
++++ icedtea-2.5.4/Makefile.am	2015-04-02 10:49:41.483806147 +0200
+@@ -11,12 +11,12 @@
+ LANGTOOLS_CHANGESET = 960cdffa8b3f
+ OPENJDK_CHANGESET = 6cf2880aab5e
+ 
+-CORBA_SHA256SUM = 7411fe2df795981124ae2e4da0ddb7d98db0a94c9399a12876be03e7177eaa0b
+-JAXP_SHA256SUM = 84623e50b69710d12209fc761a49953c78f1a664ff54e022a77e35e25489f2f3
+-JAXWS_SHA256SUM = 4bd38a8121d85c422b425177ce648afdee9da18812c91c5b74939c58db33ab4b
+-JDK_SHA256SUM = e99b65baf66d8818e3c8fd31d71fbad4ad0ceb0b7fa4c2e0607eca3a40f2ba09
+-LANGTOOLS_SHA256SUM = 4fd76cbdf18174128863514b4d3997cb623368697bf4f5af6d079dbbcd7b378a
+-OPENJDK_SHA256SUM = 88c92a3cab37446352086876771733229b1602d4f79ef68629a151180652e1f1
++CORBA_SHA256SUM = da21a7e17c30f87f180a4e4712c32c382d9dc522c29736bb745cfc238bcea7a4
++JAXP_SHA256SUM = d9e3c87357f0be354f7f76f820e97fb8fe918dd1bfeb223ff0958a662539f851
++JAXWS_SHA256SUM = b8154336679168deaa4fc076a1951f54073153d398ab840dfed3df456e4f4ae9
++JDK_SHA256SUM = a5db2c28f23fee351aaa7fd783fbcd14a6f77c62d753fe6d52ab8b5b97a4720b
++LANGTOOLS_SHA256SUM = daab93539d7c840865121f06dc7e0ec441656c2dc249ecee44aa2049643a4db3
++OPENJDK_SHA256SUM = 4387e53911667b6324421d9a1ea5c098fa5fb56a10f659124c1e10df3486e393
+ 
+ DROP_URL = http://icedtea.classpath.org/download/drops
+ 
+--- icedtea-2.5.4/hotspot.map.in	2015-01-22 05:28:55.952757442 +0100
++++ icedtea-2.5.4/hotspot.map.in	2015-04-07 10:41:38.713960082 +0200
+@@ -1,3 +1,3 @@
+ # version type(drop/hg) url changeset sha256sum
+-default drop http://icedtea.classpath.org/download/drops/icedtea7/@ICEDTEA_RELEASE@ 6144ca9b6a72 4825f8543aa0c065530b05b0a95915a44eea153bbb696d2ffc4b50a398813e34
++default drop http://icedtea.classpath.org/download/drops/icedtea7/@ICEDTEA_RELEASE@ 67b77521a2fd 050684e8c46b680728f477eba2546550d65ed3ded82329027f6163a3d8c5359a
+ aarch64 drop http://icedtea.classpath.org/download/drops/icedtea7/@ICEDTEA_RELEASE@ 4d25046abb67 60da8d427f7e3659f701e54c763ea8366d8af3280c7e10670004938b2f07efef
diff --git a/recipes-core/openjdk/openjdk-7-75b13/fix_hotspot_crosscompile.patch b/recipes-core/openjdk/openjdk-7-75b13/fix_hotspot_crosscompile.patch
new file mode 100644
index 0000000..6c829fc
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/fix_hotspot_crosscompile.patch
@@ -0,0 +1,52 @@
+Index: icedtea-2.1/acinclude.m4
+===================================================================
+--- icedtea-2.1.orig/acinclude.m4
++++ icedtea-2.1/acinclude.m4
+@@ -906,6 +906,22 @@
+   AC_SUBST(VERSION_SUFFIX, $version_suffix)
+ ])
+ 
++AC_DEFUN([AC_CHECK_WITH_CC_FOR_BUILD],
++[
++  AC_MSG_CHECKING(for compiler used for subsidiary programs)
++  AC_ARG_WITH([cc-for-build],
++              [AS_HELP_STRING(--with-cc-for-build,specify the compiler for subsidiary (helper) programs)],
++  [
++    CC_FOR_BUILD="${withval}"
++  ],
++  [
++    CC_FOR_BUILD="\$(CC)"
++  ])
++  AC_MSG_RESULT(${CC_FOR_BUILD})
++  AC_SUBST(CC_FOR_BUILD)
++])
++
++
+ AC_DEFUN_ONCE([IT_WITH_GCJ],
+ [
+   AC_MSG_CHECKING([whether to compile ecj natively])
+Index: icedtea-2.1/configure.ac
+===================================================================
+--- icedtea-2.1.orig/configure.ac
++++ icedtea-2.1/configure.ac
+@@ -22,6 +22,8 @@
+ AC_PROG_CC
+ AC_PROG_CXX
+ 
++AC_CHECK_WITH_CC_FOR_BUILD
++
+ IT_FIND_TOOLS([MAKE], [gmake make])
+ IT_FIND_TOOL([GZIP], [gzip])
+ IT_FIND_TOOL([ANT], [ant])
+Index: icedtea-2.1/Makefile.am
+===================================================================
+--- icedtea-2.1.orig/Makefile.am
++++ icedtea-2.1/Makefile.am
+@@ -474,6 +474,7 @@
+ 	FT2_LIBS="$(FREETYPE2_LIBS)" \
+ 	ALT_PARALLEL_COMPILE_JOBS="$(PARALLEL_JOBS)" \
+ 	HOTSPOT_BUILD_JOBS="$(PARALLEL_JOBS)" \
++	CC_FOR_BUILD="$(CC_FOR_BUILD)" \
+ 	OE_CFLAGS="$(OE_CFLAGS)" \
+ 	OE_CPPFLAGS="$(OE_CPPFLAGS)" \
+ 	OE_CXXFLAGS="$(OE_CXXFLAGS)" \
diff --git a/recipes-core/openjdk/openjdk-7-75b13/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch b/recipes-core/openjdk/openjdk-7-75b13/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch
new file mode 100644
index 0000000..fc78b96
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch
@@ -0,0 +1,19 @@
+From: Mario Domenech Goulart <mario@ossystems.com.br>
+Organization: O.S. Systems Software LTDA.
+
+Upstream-Status: Pending
+---
+--- openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2015-03-30 13:43:43.433168285 -0300
++++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2015-03-30 13:45:57.601833592 -0300
+@@ -410,9 +410,9 @@
+  *        7: The default directories, normally /lib and /usr/lib.
+  */
+ #if defined(AMD64) || defined(_LP64) && (defined(SPARC) || defined(PPC) || defined(S390) || defined(AARCH64)) || defined(BUILTIN_SIM)
+-#define DEFAULT_LIBPATH "/usr/lib64:/lib64:/lib:/usr/lib"
++#define DEFAULT_LIBPATH "/usr/lib64:/lib64:/lib:/usr/lib:/usr/lib64/jni:/usr/lib/jni"
+ #else
+-#define DEFAULT_LIBPATH "/lib:/usr/lib"
++#define DEFAULT_LIBPATH "/lib:/usr/lib:/usr/lib/jni"
+ #endif
+ 
+ #define EXTENSIONS_DIR  "/lib/ext"
diff --git a/recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscompile-fix.patch b/recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscompile-fix.patch
new file mode 100644
index 0000000..250f8a4
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscompile-fix.patch
@@ -0,0 +1,355 @@
+diff --git openjdk/corba/make/common/shared/Platform.gmk openjdk/corba/make/common/shared/Platform.gmk
+index fb575fa..e0426ad 100644
+--- openjdk/corba/make/common/shared/Platform.gmk
++++ openjdk/corba/make/common/shared/Platform.gmk
+@@ -152,9 +152,13 @@
+   OS_NAME = linux
+   OS_VERSION := $(shell uname -r)
+   # Arch and OS name/version
+-  mach := $(shell uname -m)
+-  ifneq (,$(wildcard /usr/bin/dpkg-architecture))
+-    mach := $(shell (dpkg-architecture -qDEB_HOST_ARCH_CPU 2>/dev/null || echo $(mach)) | sed 's/arm64/aarch64/;s/powerpc$$/ppc/;s/hppa/parisc/;s/ppc64el/ppc64le/')
++  ifdef CROSS_COMPILE_ARCH
++    mach := $(CROSS_COMPILE_ARCH)
++  else
++    mach := $(shell uname -m)
++    ifneq (,$(wildcard /usr/bin/dpkg-architecture))
++      mach := $(shell (dpkg-architecture -qDEB_HOST_ARCH_CPU 2>/dev/null || echo $(mach)) | sed 's/arm64/aarch64/;s/powerpc$$/ppc/;s/hppa/parisc/;s/ppc64el/ppc64le/')
++    endif
+   endif
+   archExpr = case "$(mach)" in \
+                 i[3-9]86) \
+diff --git openjdk/hotspot/make/linux/makefiles/build_vm_def.sh openjdk/hotspot/make/linux/makefiles/build_vm_def.sh
+index ea81ff6..68b0d71 100644
+--- openjdk/hotspot/make/linux/makefiles/build_vm_def.sh
++++ openjdk/hotspot/make/linux/makefiles/build_vm_def.sh
+@@ -1,10 +1,12 @@
+ #!/bin/sh
+ 
+ # If we're cross compiling use that path for nm
+-if [ "$CROSS_COMPILE_ARCH" != "" ]; then 
+-NM=$ALT_COMPILER_PATH/nm
+-else
+-NM=nm
++if [ "$NM" == "" ]; then
++  if [ "$CROSS_COMPILE_ARCH" != "" ]; then 
++    NM=$ALT_COMPILER_PATH/nm
++  else
++    NM=nm
++  fi
+ fi
+ 
+ $NM --defined-only $* \
+diff --git openjdk/hotspot/make/linux/makefiles/gcc.make openjdk/hotspot/make/linux/makefiles/gcc.make
+index 6fe5191..765fc6d 100644
+--- openjdk/hotspot/make/linux/makefiles/gcc.make
++++ openjdk/hotspot/make/linux/makefiles/gcc.make
+@@ -164,7 +164,7 @@ CFLAGS_WARN/DEFAULT = $(WARNINGS_ARE_ERRORS) $(ACCEPTABLE_WARNINGS)
+ CFLAGS_WARN/BYFILE = $(CFLAGS_WARN/$@)$(CFLAGS_WARN/DEFAULT$(CFLAGS_WARN/$@)) 
+ 
+ # The flags to use for an Optimized g++ build
+-OPT_CFLAGS += -O3
++OPT_CFLAGS += $(OE_CFLAGS)
+ 
+ # Hotspot uses very unstrict aliasing turn this optimization off
+ OPT_CFLAGS += -fno-strict-aliasing
+@@ -208,15 +208,7 @@ LFLAGS += -Wl,-relax
+ endif
+ 
+ # Enable linker optimization
+-LFLAGS += -Xlinker -O1
+-
+-# If this is a --hash-style=gnu system, use --hash-style=both
+-#   The gnu .hash section won't work on some Linux systems like SuSE 10.
+-_HAS_HASH_STYLE_GNU:=$(shell $(CC) -dumpspecs | grep -- '--hash-style=gnu')
+-ifneq ($(_HAS_HASH_STYLE_GNU),)
+-  LDFLAGS_HASH_STYLE = -Wl,--hash-style=both
+-endif
+-LFLAGS += $(LDFLAGS_HASH_STYLE)
++LFLAGS += $(OE_LDFLAGS)
+ 
+ # Use $(MAPFLAG:FILENAME=real_file_name) to specify a map file.
+ MAPFLAG = -Xlinker --version-script=FILENAME
+diff --git openjdk/hotspot/make/linux/makefiles/launcher.make openjdk/hotspot/make/linux/makefiles/launcher.make
+index 0c102ea..f4dfbf6 100644
+--- openjdk/hotspot/make/linux/makefiles/launcher.make
++++ openjdk/hotspot/make/linux/makefiles/launcher.make
+@@ -50,8 +50,8 @@ ifeq ($(LINK_INTO),AOUT)
+   LIBS_LAUNCHER             += $(STATIC_STDCXX) $(LIBS)
+ else
+   LAUNCHER.o                 = launcher.o
+-  LFLAGS_LAUNCHER           += -L `pwd`
+-  LIBS_LAUNCHER             += -l$(JVM) $(LIBS)
++  LFLAGS_LAUNCHER           += -L `pwd` $(OE_LAUNCHER_LDFLAGS) $(OE_LDFLAGS)
++  LIBS_LAUNCHER             += -l$(JVM) $(LIBS) -lstdc++
+ endif
+ 
+ LINK_LAUNCHER = $(LINK.CC)
+diff --git openjdk/hotspot/make/linux/makefiles/vm.make openjdk/hotspot/make/linux/makefiles/vm.make
+index b0ffd9a..4e8c47c 100644
+--- openjdk/hotspot/make/linux/makefiles/vm.make
++++ openjdk/hotspot/make/linux/makefiles/vm.make
+@@ -300,6 +300,7 @@
+   LFLAGS_VM += $(LLVM_LDFLAGS)
+ endif
+ 
++LFLAGS_VM += $(OE_LDFLAGS)
+ LINK_VM = $(LINK_LIB.CC)
+ 
+ # rule for building precompiled header
+diff --git openjdk/jdk/make/common/Defs-linux.gmk openjdk/jdk/make/common/Defs-linux.gmk
+index 69e1177..dc7f8e6 100644
+--- openjdk/jdk/make/common/Defs-linux.gmk
++++ openjdk/jdk/make/common/Defs-linux.gmk
+@@ -162,28 +162,6 @@
+   endif
+ endif
+ 
+-#
+-# Default optimization
+-#
+-
+-ifndef OPTIMIZATION_LEVEL
+-  ifeq ($(PRODUCT), java)
+-    OPTIMIZATION_LEVEL = HIGHER
+-  else
+-    OPTIMIZATION_LEVEL = LOWER
+-  endif
+-endif
+-ifndef FASTDEBUG_OPTIMIZATION_LEVEL
+-  FASTDEBUG_OPTIMIZATION_LEVEL = LOWER
+-endif
+-
+-CC_OPT/NONE     = 
+-CC_OPT/LOWER    = -O2
+-CC_OPT/HIGHER   = -O3
+-CC_OPT/HIGHEST  = -O3
+-
+-CC_OPT          = $(CC_OPT/$(OPTIMIZATION_LEVEL))
+-
+ # For all platforms, do not omit the frame pointer register usage. 
+ #    We need this frame pointer to make it easy to walk the stacks.
+ #    This should be the default on X86, but ia64 and amd64 may not have this
+@@ -191,7 +169,7 @@
+ CFLAGS_REQUIRED_aarch64 += -fno-omit-frame-pointer -fsigned-char -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_alpha   += -mieee -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_amd64   += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+-CFLAGS_REQUIRED_arm     += -fsigned-char -D_LITTLE_ENDIAN
++CFLAGS_REQUIRED_arm     += -fsigned-char -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_hppa    +=
+ CFLAGS_REQUIRED_i586    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_ia64    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+ @@ -359,7 +337,7 @@ LDFLAGS_COMMON  += $(LDFLAGS_DEFS_OPTION)
+ #
+ # -L paths for finding and -ljava
+ #
+-LDFLAGS_OPT     = -Xlinker -O1
++LDFLAGS_OPT     = $(OE_LDFLAGS)
+ LDFLAGS_COMMON += -L$(LIBDIR)/$(LIBARCH)
+ LDFLAGS_COMMON += -Wl,-soname=$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
+ 
+diff --git openjdk/jdk/make/common/shared/Platform.gmk openjdk/jdk/make/common/shared/Platform.gmk
+index c23e96e..484afca 100644
+--- openjdk/jdk/make/common/shared/Platform.gmk
++++ openjdk/jdk/make/common/shared/Platform.gmk
+@@ -169,9 +169,9 @@
+     mach := $(CROSS_COMPILE_ARCH)
+   else
+     mach := $(shell uname -m)
+-  endif
+-  ifneq (,$(wildcard /usr/bin/dpkg-architecture))
+-    mach := $(shell (dpkg-architecture -qDEB_HOST_ARCH_CPU 2>/dev/null || echo $(mach)) | sed 's/arm64/aarch64/;s/powerpc$$/ppc/;s/hppa/parisc/;s/ppc64el/ppc64le/')
++    ifneq (,$(wildcard /usr/bin/dpkg-architecture))
++      mach := $(shell (dpkg-architecture -qDEB_HOST_ARCH_CPU 2>/dev/null || echo $(mach)) | sed 's/arm64/aarch64/;s/powerpc$$/ppc/;s/hppa/parisc/;s/ppc64el/ppc64le/')
++    endif
+   endif
+   archExpr = case "$(mach)" in \
+                 i[3-9]86) \
+diff --git openjdk/jdk/make/java/nio/Makefile openjdk/jdk/make/java/nio/Makefile
+index cd336a2..1e5f8e5 100644
+--- openjdk/jdk/make/java/nio/Makefile
++++ openjdk/jdk/make/java/nio/Makefile
+@@ -971,8 +971,12 @@ else
+ $(SCH_GEN)/SocketOptionRegistry.java: $(GENSOR_EXE)
+ 	$(prep-target)
+ 	NAWK="$(NAWK)" SH="$(SH)" $(SH) -e addNotices.sh "$(SOR_COPYRIGHT_YEARS)" > $@
++ifdef CROSS_COMPILE_ARCH
++	$(QEMU) $(GENSOR_EXE) >> $@
++else
+ 	$(GENSOR_EXE) >> $@
+ endif
++endif
+ #
+ # Generated sun.nio.cs SingleByte classes
+ #
+@@ -1006,8 +1010,12 @@ else
+ $(SFS_GEN)/UnixConstants.java: $(GENUC_EXE)
+ 	$(prep-target)
+ 	NAWK="$(NAWK)" SH="$(SH)" $(SH) -e addNotices.sh "$(GENUC_COPYRIGHT_YEARS)" > $@
++ifdef CROSS_COMPILE_ARCH
++	$(QEMU) $(GENUC_EXE) >> $@
++else
+ 	$(GENUC_EXE) >> $@
+ endif
++endif
+ 
+ GENSC_SRC = $(PLATFORM_SRC)/native/sun/nio/fs/genSolarisConstants.c
+ 
+@@ -1028,7 +1036,11 @@ else
+ $(SFS_GEN)/SolarisConstants.java: $(GENSC_EXE)
+ 	$(prep-target)
+ 	NAWK="$(NAWK)" SH="$(SH)" $(SH) -e addNotices.sh "$(GENSC_COPYRIGHT_YEARS)" > $@
++ifdef CROSS_COMPILE_ARCH
++	$(QEMU) $(GENSC_EXE) >> $@
++else
+ 	$(GENSC_EXE) >> $@
+ endif
++endif
+ 
+ .PHONY: sources 
+diff --git openjdk/jdk/make/sun/awt/mawt.gmk openjdk/jdk/make/sun/awt/mawt.gmk
+index b6e0d99..edc530e 100644
+--- openjdk/jdk/make/sun/awt/mawt.gmk
++++ openjdk/jdk/make/sun/awt/mawt.gmk
+@@ -151,22 +151,6 @@ else
+ #endif
+ 
+ LIBXTST = -lXtst
+-ifeq ($(PLATFORM), linux)
+-   ifeq ($(ARCH_DATA_MODEL), 64)
+-   # XXX what about the rest of them?
+-        LIBXT = -lXt
+-    else
+-    # Allows for builds on Debian GNU Linux, X11 is in a different place 
+-       LIBXT = $(firstword $(wildcard $(OPENWIN_LIB)/libXt.a) \
+-                        $(wildcard /usr/lib/libXt.a))
+-       LIBSM = $(firstword $(wildcard $(OPENWIN_LIB)/libSM.a) \
+-                        $(wildcard /usr/lib/libSM.a))
+-       LIBICE = $(firstword $(wildcard $(OPENWIN_LIB)/libICE.a) \
+-                         $(wildcard /usr/lib/libICE.a))
+-       LIBXTST = $(firstword $(wildcard $(OPENWIN_LIB)/libXtst.a) \
+-                         $(wildcard /usr/lib/libXtst.a))
+-   endif
+-endif
+ 
+ # Use -lXmu for EditRes support
+ LIBXMU_DBG	= -lXmu
+@@ -181,7 +165,7 @@ ifneq (,$(findstring $(PLATFORM), linux macosx))
+ OTHER_CFLAGS += -DMLIB_NO_LIBSUNMATH
+ # XXX what is this define below? Isn't it motif-related?
+ OTHER_CFLAGS += -DXMSTRINGDEFINES=1
+-OTHER_LDLIBS =  $(LIBXMU) $(LIBXTST) -lXext $(LIBXT) $(LIBSM) $(LIBICE) -lX11 -lXi
++OTHER_LDLIBS =  $(LIBXMU) $(LIBXTST) -lXext -lXt -lSM -lICE -lXi -lX11
+ endif
+ 
+ endif
+@@ -230,12 +214,6 @@ else
+   CPPFLAGS += -I$(PLATFORM_SRC)/native/common/deps/fontconfig2
+ endif
+ 
+-ifndef HEADLESS
+-CPPFLAGS += -I$(OPENWIN_HOME)/include 
+-LDFLAGS  += -L$(OPENWIN_LIB)
+-
+-endif # !HEADLESS
+-
+ CPPFLAGS += -I$(SHARE_SRC)/native/$(PKGDIR)/debug \
+             -I$(SHARE_SRC)/native/$(PKGDIR)/../font \
+             -I$(PLATFORM_SRC)/native/$(PKGDIR)/../font \
+@@ -248,12 +248,6 @@
+ endif # !HEADLESS
+ endif # PLATFORM
+ 
+-ifeq ($(PLATFORM), linux)
+-  # Checking for the X11/extensions headers at the additional location
+-  CPPFLAGS += -I$(firstword $(wildcard $(OPENWIN_HOME)/include/X11/extensions) \
+-                        $(wildcard /usr/include/X11/extensions))
+-endif
+-
+ ifeq ($(PLATFORM), macosx)
+   CPPFLAGS += -I$(OPENWIN_HOME)/include/X11/extensions \
+               -I$(OPENWIN_HOME)/include
+diff --git openjdk/jdk/make/sun/xawt/Makefile openjdk/jdk/make/sun/xawt/Makefile
+index 53d31f3..183c063 100644
+--- openjdk/jdk/make/sun/xawt/Makefile
++++ openjdk/jdk/make/sun/xawt/Makefile
+@@ -198,20 +198,6 @@ else
+   CPPFLAGS += -I$(PLATFORM_SRC)/native/common/deps/glib2
+ endif
+ 
+-ifeq ($(PLATFORM), linux)
+-  ifndef CROSS_COMPILE_ARCH
+-    # Allows for builds on Debian GNU Linux, X11 is in a different place 
+-    # This should really be handled at a higher-level so we don't have to
+-    # work-around this when cross-compiling
+-    CPPFLAGS += -I/usr/X11R6/include/X11/extensions \
+-                -I/usr/include/X11/extensions \
+-                -I$(OPENWIN_HOME)/include 
+-  else
+-    CPPFLAGS += -I$(OPENWIN_HOME)/include/X11/extensions \
+-                -I$(OPENWIN_HOME)/include 
+-  endif
+-endif
+-
+ # We have some odd logic here because some Solaris 10 updates
+ # have a render.h file that suggests gradients are supported, but
+ # the Xrender.h doesn't have the corresponding type definitions.
+@@ -292,16 +278,10 @@ ifeq ($(ARCH_DATA_MODEL), 32)
+ SIZERS = $(SIZER).32
+ SIZERS_C = $(SIZER_32_C)
+ SIZES = $(WRAPPER_GENERATOR_DIR)/sizes.32
+-ifdef CROSS_COMPILE_ARCH
+-CFLAGS_32 = -m32
+-endif
+ else # !32
+ SIZERS = $(SIZER).64
+ SIZERS_C = $(SIZER_64_C)
+ SIZES = $(WRAPPER_GENERATOR_DIR)/sizes.64
+-ifdef CROSS_COMPILE_ARCH
+-CFLAGS_64 = -m64
+-endif
+ endif # 32
+ endif # !macosx
+ endif # solaris
+@@ -337,15 +321,11 @@ WRAPPER_GENERATOR_TEMPDIR=$(TEMPDIR)/sun/awt/X11/generator
+ WRAPPER_GENERATOR_CLASS=$(WRAPPER_GENERATOR_TEMPDIR)/WrapperGenerator.class 
+ XLIBTYPES=$(PLATFORM_SRC)/classes/sun/awt/X11/generator/xlibtypes.txt
+ 
+-ifndef CROSS_COMPILE_ARCH
+ SIZERS_CC = $(CC)
+-else
+-SIZERS_CC = $(HOST_CC)
+-endif
+ 
+ $(SIZERS): $(SIZERS_C) 
+ 	$(prep-target)
+-	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -o $@ $(SIZER)$(suffix $@).c
++	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -fuse-ld=bfd -o $@ $(SIZER)$(suffix $@).c
+ 
+ $(WRAPPER_GENERATOR_CLASS): $(WRAPPER_GENERATOR_JAVA)
+ 	$(prep-target)
+@@ -358,6 +334,16 @@ $(SIZERS_C): $(WRAPPER_GENERATOR_CLASS) $(XLIBTYPES)
+ 	    $(SIZER_DIR) $(XLIBTYPES) "sizer" $(subst .,,$(suffix $(basename $@)))
+ 
+ $(SIZES): $(SIZERS)
++ifdef CROSS_COMPILE_ARCH
++	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
++	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
++	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
++	    $(CHMOD) +w $@;\
++	else	\
++	    $(ECHO) GENERATING $@; \
++	    $(QEMU) $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
++	fi
++else
+ 	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
+ 	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
+ 	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
+@@ -366,6 +352,7 @@ $(SIZES): $(SIZERS)
+ 	    $(ECHO) GENERATING $@; \
+ 	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
+ 	fi
++endif
+ 	@if [ "$(DOCOMPARE)$(suffix $@)" = "true.64" ]; then \
+ 	    $(ECHO) COMPARING $@ and $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
+ 	    $(DIFF) $@ $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
diff --git a/recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-nio-use-host-cc.patch b/recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-nio-use-host-cc.patch
new file mode 100644
index 0000000..f966093
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-nio-use-host-cc.patch
@@ -0,0 +1,74 @@
+Index: openjdk/jdk/make/java/nio/Makefile
+===================================================================
+--- openjdk/jdk/make/java/nio/Makefile	2013-10-01 21:20:11.000000000 -0700
++++ openjdk/jdk/make/java/nio/Makefile	2013-10-01 21:30:40.901837422 -0700
+@@ -918,7 +918,7 @@
+ ifeq ($(PLATFORM), macosx)
+   NIO_CC=$(HOST_CC)
+ else
+-  NIO_CC=$(CC)
++  NIO_CC=$(CC_FOR_BUILD)
+ endif
+ 
+ $(GENSOR_EXE) : $(TEMPDIR)/$(GENSOR_SRC)
+@@ -934,12 +934,8 @@
+ $(SCH_GEN)/SocketOptionRegistry.java: $(GENSOR_EXE)
+ 	$(prep-target)
+ 	NAWK="$(NAWK)" SH="$(SH)" $(SH) -e addNotices.sh "$(SOR_COPYRIGHT_YEARS)" > $@
+-ifdef CROSS_COMPILE_ARCH
+-	$(QEMU) $(GENSOR_EXE) >> $@
+-else
+ 	$(GENSOR_EXE) >> $@
+ endif
+-endif
+ #
+ # Generated sun.nio.cs SingleByte classes
+ #
+@@ -973,12 +969,8 @@
+ $(SFS_GEN)/UnixConstants.java: $(GENUC_EXE)
+ 	$(prep-target)
+ 	NAWK="$(NAWK)" SH="$(SH)" $(SH) -e addNotices.sh "$(GENUC_COPYRIGHT_YEARS)" > $@
+-ifdef CROSS_COMPILE_ARCH
+-	$(QEMU) $(GENUC_EXE) >> $@
+-else
+ 	$(GENUC_EXE) >> $@
+ endif
+-endif
+ 
+ GENSC_SRC = $(PLATFORM_SRC)/native/sun/nio/fs/genSolarisConstants.c
+ 
+@@ -999,11 +991,7 @@
+ $(SFS_GEN)/SolarisConstants.java: $(GENSC_EXE)
+ 	$(prep-target)
+ 	NAWK="$(NAWK)" SH="$(SH)" $(SH) -e addNotices.sh "$(GENSC_COPYRIGHT_YEARS)" > $@
+-ifdef CROSS_COMPILE_ARCH
+-	$(QEMU) $(GENSC_EXE) >> $@
+-else
+ 	$(GENSC_EXE) >> $@
+ endif
+-endif
+ 
+ .PHONY: sources 
+Index: openjdk/jdk/make/sun/Makefile
+===================================================================
+--- openjdk/jdk/make/sun/Makefile	2013-07-25 09:10:09.000000000 -0700
++++ openjdk/jdk/make/sun/Makefile	2013-10-01 21:32:01.625839149 -0700
+@@ -55,7 +55,7 @@
+     endif
+   endif
+   HEADLESS_SUBDIR = headless
+-  XAWT_SUBDIR     = xawt gtk
++  XAWT_SUBDIR     = 
+ endif
+ 
+ ifeq ($(PLATFORM), macosx)
+@@ -87,7 +87,7 @@
+ endif
+ SUBDIRS_desktop    = audio $(RENDER_SUBDIR) image \
+                      $(LWAWT_PRE_SUBDIR) $(DISPLAY_LIBS) $(DGA_SUBDIR) $(LWAWT_SUBDIR) \
+-                     jawt font jpeg cmm $(DISPLAY_TOOLS) beans
++                     font jpeg cmm $(DISPLAY_TOOLS) beans
+ SUBDIRS_management = management
+ SUBDIRS_misc       = $(ORG_SUBDIR) rmi $(JDBC_SUBDIR) tracing
+ SUBDIRS_tools      = native2ascii serialver tools jconsole
+ 
\ No newline at end of file
diff --git a/recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-rmi-crosscompile.patch b/recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-rmi-crosscompile.patch
new file mode 100644
index 0000000..55f1f9c
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-rmi-crosscompile.patch
@@ -0,0 +1,13 @@
+diff --git openjdk/jdk/make/com/sun/jmx/Makefile openjdk/jdk/make/com/sun/jmx/Makefile
+index eaf8a6e..4938613 100644
+--- openjdk/jdk/make/com/sun/jmx/Makefile
++++ openjdk/jdk/make/com/sun/jmx/Makefile
+@@ -102,7 +102,7 @@ FILES_ties   = $(subst javax/management/remote/rmi/,javax/management/remote/rmi/
+ # when available, we need to run with latest rmic version available. rmic 
+ # launch tool not built at this stage but we can invoke via rmi class.
+ 
+-RMIC_JAVA = $(OUTPUTDIR)/bin/java
++RMIC_JAVA = $(BOOTDIR)/bin/java
+ # need to treat 64bit solaris differently
+ ifeq ($(PLATFORM)-$(LIBARCH), solaris-amd64)
+ RMIC_JAVA = $(OUTPUTDIR)/bin/amd64/java
diff --git a/recipes-core/openjdk/openjdk-7-75b13/icedtea-libnet-renaming.patch b/recipes-core/openjdk/openjdk-7-75b13/icedtea-libnet-renaming.patch
new file mode 100644
index 0000000..e32feb0
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/icedtea-libnet-renaming.patch
@@ -0,0 +1,236 @@
+diff --git openjdk/jdk/make/com/sun/nio/sctp/Makefile openjdk/jdk/make/com/sun/nio/sctp/Makefile
+index 4ae967f..fe669a9 100644
+--- openjdk/jdk/make/com/sun/nio/sctp/Makefile
++++ openjdk/jdk/make/com/sun/nio/sctp/Makefile
+@@ -64,11 +64,11 @@ ifneq ($(COMPILER_WARNINGS_FATAL),false)
+ COMPILER_WARNINGS_FATAL=true
+ endif
+ #OTHER_LDLIBS += -L$(LIBDIR)/$(LIBARCH) -ljava -lnet -lpthread -ldl
+-OTHER_LDLIBS += -L$(LIBDIR)/$(LIBARCH) -lnio -lnet -lpthread -ldl
++OTHER_LDLIBS += -L$(LIBDIR)/$(LIBARCH) -lnio -ljavanet -lpthread -ldl
+ endif
+ ifeq ($(PLATFORM), solaris)
+ #LIBSCTP = -lsctp
+-OTHER_LDLIBS += $(LIBSOCKET) -L$(LIBDIR)/$(LIBARCH) -lnet -lnio
++OTHER_LDLIBS += $(LIBSOCKET) -L$(LIBDIR)/$(LIBARCH) -ljavanet -lnio
+ endif # PLATFORM
+ 
+ else # windows
+diff --git openjdk/jdk/make/java/net/Makefile openjdk/jdk/make/java/net/Makefile
+index 7283e45..720f3d3 100644
+--- openjdk/jdk/make/java/net/Makefile
++++ openjdk/jdk/make/java/net/Makefile
+@@ -25,7 +25,7 @@
+ 
+ BUILDDIR = ../..
+ PACKAGE = java.net
+-LIBRARY = net
++LIBRARY = javanet
+ PRODUCT = sun
+ include $(BUILDDIR)/common/Defs.gmk
+ 
+diff --git openjdk/jdk/make/java/nio/Makefile openjdk/jdk/make/java/nio/Makefile
+index 191f17d..1e5f8e5 100644
+--- openjdk/jdk/make/java/nio/Makefile
++++ openjdk/jdk/make/java/nio/Makefile
+@@ -403,7 +403,7 @@
+ endif
+ 
+ ifeq ($(PLATFORM), linux)
+-  OTHER_LDLIBS += -L$(LIBDIR)/$(LIBARCH) -ljava -lnet -lpthread $(LIBDL)
++  OTHER_LDLIBS += -L$(LIBDIR)/$(LIBARCH) -ljava -ljavanet -lpthread $(LIBDL)
+   ifeq ($(SYSTEM_GIO), true)
+     OTHER_LDLIBS += $(GIO_LIBS)
+     OTHER_INCLUDES += $(GIO_CFLAGS) -DUSE_SYSTEM_GIO
+@@ -413,15 +413,15 @@
+ endif
+ 
+ ifeq ($(PLATFORM), macosx)
+-OTHER_LDLIBS += -L$(LIBDIR) -ljava -lnet -pthread -framework CoreFoundation
++OTHER_LDLIBS += -L$(LIBDIR) -ljava -ljavanet -pthread -framework CoreFoundation
+ endif
+ 
+ ifeq ($(PLATFORM), solaris)
+ OTHER_LDLIBS += $(JVMLIB) $(LIBSOCKET) -lposix4 $(LIBDL) -lsendfile \
+-		-L$(LIBDIR)/$(LIBARCH) -ljava -lnet
++		-L$(LIBDIR)/$(LIBARCH) -ljava -ljavanet
+ endif
+ ifeq ($(PLATFORM), aix)
+-OTHER_LDLIBS += -L$(LIBDIR)/$(LIBARCH) -ljava -lnet
++OTHER_LDLIBS += -L$(LIBDIR)/$(LIBARCH) -ljava -ljavanet
+ endif # PLATFORM
+ 
+ ifeq ($(COMPILE_AGAINST_SYSCALLS), true)
+diff --git openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.java openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.java
+index b7f0f2f..b093868 100644
+--- openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.java
++++ openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.java
+@@ -69,7 +69,7 @@
+      */
+     static {
+         java.security.AccessController.doPrivileged(
+-                  new sun.security.action.LoadLibraryAction("net"));
++                  new sun.security.action.LoadLibraryAction("javanet"));
+         init();
+     }
+ 
+diff --git openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java
+index c6a38ad..97de65b 100644
+--- openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java
++++ openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java
+@@ -78,7 +78,7 @@ abstract class AbstractPlainSocketImpl extends SocketImpl
+      */
+     static {
+         java.security.AccessController.doPrivileged(
+-                  new sun.security.action.LoadLibraryAction("net"));
++                  new sun.security.action.LoadLibraryAction("javanet"));
+     }
+ 
+     /**
+diff --git openjdk/jdk/src/share/classes/java/net/DatagramPacket.java openjdk/jdk/src/share/classes/java/net/DatagramPacket.java
+index 195ee86..6822a57 100644
+--- openjdk/jdk/src/share/classes/java/net/DatagramPacket.java
++++ openjdk/jdk/src/share/classes/java/net/DatagramPacket.java
+@@ -47,7 +47,7 @@ class DatagramPacket {
+      */
+     static {
+         java.security.AccessController.doPrivileged(
+-                  new sun.security.action.LoadLibraryAction("net"));
++                  new sun.security.action.LoadLibraryAction("javanet"));
+         init();
+     }
+ 
+diff --git openjdk/jdk/src/share/classes/java/net/InetAddress.java openjdk/jdk/src/share/classes/java/net/InetAddress.java
+index 3ea28e4..7c78eae 100644
+--- openjdk/jdk/src/share/classes/java/net/InetAddress.java
++++ openjdk/jdk/src/share/classes/java/net/InetAddress.java
+@@ -260,7 +260,7 @@ class InetAddress implements java.io.Serializable {
+     static {
+         preferIPv6Address = java.security.AccessController.doPrivileged(
+             new GetBooleanAction("java.net.preferIPv6Addresses")).booleanValue();
+-        AccessController.doPrivileged(new LoadLibraryAction("net"));
++        AccessController.doPrivileged(new LoadLibraryAction("javanet"));
+         init();
+     }
+ 
+diff --git openjdk/jdk/src/share/classes/java/net/NetworkInterface.java openjdk/jdk/src/share/classes/java/net/NetworkInterface.java
+index 6314d15..761fdda 100644
+--- openjdk/jdk/src/share/classes/java/net/NetworkInterface.java
++++ openjdk/jdk/src/share/classes/java/net/NetworkInterface.java
+@@ -53,7 +53,7 @@ public final class NetworkInterface {
+     private static final int defaultIndex; /* index of defaultInterface */
+ 
+     static {
+-        AccessController.doPrivileged(new LoadLibraryAction("net"));
++        AccessController.doPrivileged(new LoadLibraryAction("javanet"));
+         init();
+         defaultInterface = DefaultInterface.getDefault();
+         if (defaultInterface != null) {
+diff --git openjdk/jdk/src/share/classes/sun/net/sdp/SdpSupport.java openjdk/jdk/src/share/classes/sun/net/sdp/SdpSupport.java
+index 5baca6e..befd0b9 100644
+--- openjdk/jdk/src/share/classes/sun/net/sdp/SdpSupport.java
++++ openjdk/jdk/src/share/classes/sun/net/sdp/SdpSupport.java
+@@ -76,6 +76,6 @@ public final class SdpSupport {
+ 
+     static {
+         AccessController.doPrivileged(
+-            new sun.security.action.LoadLibraryAction("net"));
++            new sun.security.action.LoadLibraryAction("javanet"));
+     }
+ }
+diff --git openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java
+index d7aa358..9b2c719 100644
+--- openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java
++++ openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java
+@@ -95,7 +95,7 @@ public class DefaultProxySelector extends ProxySelector {
+                 }});
+         if (b != null && b.booleanValue()) {
+             java.security.AccessController.doPrivileged(
+-                      new sun.security.action.LoadLibraryAction("net"));
++                      new sun.security.action.LoadLibraryAction("javanet"));
+             hasSystemProxies = init();
+         }
+     }
+diff --git openjdk/jdk/src/share/classes/sun/nio/ch/Util.java openjdk/jdk/src/share/classes/sun/nio/ch/Util.java
+index 10662df..34d441a 100644
+--- openjdk/jdk/src/share/classes/sun/nio/ch/Util.java
++++ openjdk/jdk/src/share/classes/sun/nio/ch/Util.java
+@@ -483,7 +483,7 @@ class Util {
+                 return;
+             loaded = true;
+             java.security.AccessController
+-                .doPrivileged(new sun.security.action.LoadLibraryAction("net"));
++                .doPrivileged(new sun.security.action.LoadLibraryAction("javanet"));
+             java.security.AccessController
+                 .doPrivileged(new sun.security.action.LoadLibraryAction("nio"));
+             // IOUtil must be initialized; Its native methods are called from
+diff --git openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java
+index 3695b5d..7c833cc 100644
+--- openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java
++++ openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java
+@@ -247,7 +247,7 @@ public class ResolverConfigurationImpl
+ 
+     static {
+         java.security.AccessController.doPrivileged(
+-            new sun.security.action.LoadLibraryAction("net"));
++            new sun.security.action.LoadLibraryAction("javanet"));
+     }
+ 
+ }
+diff --git openjdk/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java openjdk/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java
+index 7970885..46ab112 100644
+--- openjdk/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java
++++ openjdk/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java
+@@ -159,7 +159,7 @@ public class ResolverConfigurationImpl
+ 
+     static {
+         java.security.AccessController.doPrivileged(
+-            new sun.security.action.LoadLibraryAction("net"));
++            new sun.security.action.LoadLibraryAction("javanet"));
+         init0();
+ 
+         // start the address listener thread
+--- openjdk/jdk/src/windows/classes/sun/net/PortConfig.java	2015-01-08 21:19:49.000000000 +0100
++++ openjdk/jdk/src/windows/classes/sun/net/PortConfig.java	2015-04-02 13:45:19.330199119 +0200
+@@ -43,7 +43,7 @@
+         AccessController.doPrivileged(
+             new java.security.PrivilegedAction<Void>() {
+                 public Void run() {
+-                    System.loadLibrary("net");
++                    System.loadLibrary("javanet");
+                     return null;
+                 }
+             });
+--- openjdk/jdk/src/windows/classes/sun/nio/fs/RegistryFileTypeDetector.java	2015-01-08 21:19:49.000000000 +0100
++++ openjdk/jdk/src/windows/classes/sun/nio/fs/RegistryFileTypeDetector.java	2015-04-02 13:47:48.245530982 +0200
+@@ -74,7 +74,7 @@
+             @Override
+             public Void run() {
+                 // nio.dll has dependency on net.dll
+-                System.loadLibrary("net");
++                System.loadLibrary("javanet");
+                 System.loadLibrary("nio");
+                 return null;
+         }});
+--- openjdk/jdk/src/windows/classes/sun/nio/fs/WindowsNativeDispatcher.java	2015-01-08 21:19:49.000000000 +0100
++++ openjdk/jdk/src/windows/classes/sun/nio/fs/WindowsNativeDispatcher.java	2015-04-02 13:48:46.363509265 +0200
+@@ -1124,7 +1124,7 @@
+         AccessController.doPrivileged(new PrivilegedAction<Void>() {
+             public Void run() {
+                 // nio.dll has dependency on net.dll
+-                System.loadLibrary("net");
++                System.loadLibrary("javanet");
+                 System.loadLibrary("nio");
+                 return null;
+         }});
+--- openjdk/jdk/src/solaris/classes/sun/net/PortConfig.java	2015-01-08 21:19:49.000000000 +0100
++++ openjdk/jdk/src/solaris/classes/sun/net/PortConfig.java	2015-04-02 13:49:49.541999538 +0200
+@@ -44,7 +44,7 @@
+         AccessController.doPrivileged(
+             new java.security.PrivilegedAction<Void>() {
+                 public Void run() {
+-                    System.loadLibrary("net");
++                    System.loadLibrary("javanet");
+                     String os = System.getProperty("os.name");
+                     if (os.startsWith("Linux")) {
+                         defaultLower = 32768;
diff --git a/recipes-core/openjdk/openjdk-7-75b13/icedtea-openjdk-remove-currency-data-generation-expi.patch b/recipes-core/openjdk/openjdk-7-75b13/icedtea-openjdk-remove-currency-data-generation-expi.patch
new file mode 100644
index 0000000..6dd36af
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/icedtea-openjdk-remove-currency-data-generation-expi.patch
@@ -0,0 +1,25 @@
+From 7df2fd1014a0c31f518be4f6a0018533f469d584 Mon Sep 17 00:00:00 2001
+From: Alex Gonzalez <alex.gonzalez@digi.com>
+Date: Wed, 31 Dec 2014 16:07:32 +0100
+Subject: [PATCH] icedtea: openjdk: remove currency data generation expiration
+ date
+
+Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>
+---
+ .../src/build/tools/generatecurrencydata/GenerateCurrencyData.java     | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java
+index bf335fa22c1d..0e421360fef9 100644
+--- openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java
++++ openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java
+@@ -281,9 +281,6 @@ public class GenerateCurrencyData {
+             checkCurrencyCode(newCurrency);
+             String timeString = currencyInfo.substring(4, length - 4);
+             long time = format.parse(timeString).getTime();
+-            if (Math.abs(time - System.currentTimeMillis()) > ((long) 10) * 365 * 24 * 60 * 60 * 1000) {
+-                throw new RuntimeException("time is more than 10 years from present: " + time);
+-            }
+             specialCaseCutOverTimes[specialCaseCount] = time;
+             specialCaseOldCurrencies[specialCaseCount] = oldCurrency;
+             specialCaseOldCurrenciesDefaultFractionDigits[specialCaseCount] = getDefaultFractionDigits(oldCurrency);
diff --git a/recipes-core/openjdk/openjdk-7-75b13/icedtea-remove_werror.patch b/recipes-core/openjdk/openjdk-7-75b13/icedtea-remove_werror.patch
new file mode 100644
index 0000000..f78f2b3
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/icedtea-remove_werror.patch
@@ -0,0 +1,16 @@
+diff --git openjdk/hotspot/make/linux/makefiles/gcc.make openjdk/hotspot/make/linux/makefiles/gcc.make
+index 42f6843..765fc6d 100644
+--- openjdk/hotspot/make/linux/makefiles/gcc.make
++++ openjdk/hotspot/make/linux/makefiles/gcc.make
+@@ -149,11 +149,6 @@ else
+   CFLAGS += -pipe
+ endif
+ 
+-# Compiler warnings are treated as errors
+-ifneq ($(COMPILER_WARNINGS_FATAL),false)
+-WARNINGS_ARE_ERRORS = -Werror
+-endif
+-
+ # Except for a few acceptable ones
+ # Since GCC 4.3, -Wconversion has changed its meanings to warn these implicit
+ # conversions which might affect the values. To avoid that, we need to turn
diff --git a/recipes-core/openjdk/openjdk-7-75b13/icedtea-shark-arm-linux-cpu-detection.patch b/recipes-core/openjdk/openjdk-7-75b13/icedtea-shark-arm-linux-cpu-detection.patch
new file mode 100644
index 0000000..f40bc51
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/icedtea-shark-arm-linux-cpu-detection.patch
@@ -0,0 +1,113 @@
+Index: openjdk/hotspot/src/share/vm/shark/sharkCompiler.cpp
+===================================================================
+--- openjdk.orig/hotspot/src/share/vm/shark/sharkCompiler.cpp	2010-07-14 16:42:48.412103129 +0200
++++ openjdk/hotspot/src/share/vm/shark/sharkCompiler.cpp	2010-07-14 16:50:51.680282178 +0200
+@@ -32,6 +32,96 @@
+ 
+ #if SHARK_LLVM_VERSION >= 27
+ namespace {
++
++#if defined(__arm__) && defined(__linux__)
++#include <fcntl.h>
++#include <linux/auxvec.h>
++#include <asm/hwcap.h>
++#define VECBUFF_SIZE 32
++
++bool TestARMLinuxHWCAP(int feature) {
++  int fd;
++  unsigned vecs[VECBUFF_SIZE];
++  unsigned *p;
++  int i, n;
++  int rc;
++
++  rc = 0;
++  fd = open("/proc/self/auxv", O_RDONLY);
++  if (fd < 0) return 0;
++  do {
++    n = read(fd, vecs, VECBUFF_SIZE * sizeof(unsigned));
++    p = vecs;
++    i = n/8;
++    while (--i >=0) {
++      unsigned tag = *p++;
++      unsigned value = *p++;
++      if (tag == 0) goto fini;
++      if(tag == AT_HWCAP && (value & feature)) {
++        rc = 1;
++        goto fini;
++      }
++    }
++  } while (n == VECBUFF_SIZE * sizeof(unsigned));
++fini:
++  close(fd);
++  return rc;
++}
++
++char* TestARMLinuxAT(int auxvec) {
++  int fd;
++  unsigned vecs[VECBUFF_SIZE];
++  unsigned *p;
++  int i, n;
++  char* rc;
++
++  rc = 0;
++  fd = open("/proc/self/auxv", O_RDONLY);
++  if (fd < 0) return 0;
++  do {
++    n = read(fd, vecs, VECBUFF_SIZE * sizeof(unsigned));
++    p = vecs;
++    i = n/8;
++    while (--i >=0) {
++      unsigned tag = *p++;
++      unsigned value = *p++;
++      if (tag == 0) goto fini;
++      if(tag == (unsigned) auxvec ) {
++        rc = (char*)value;
++        goto fini;
++      }
++    }
++  } while (n == VECBUFF_SIZE * sizeof(unsigned));
++fini:
++  close(fd);
++  return rc;
++}
++
++bool getARMHostCPUFeatures(StringMap<bool> &Features) {
++  // FIXME LLVM PR6561 // Features["neon"]=TestARMLinuxHWCAP(HWCAP_NEON);
++  Features["thumb2"]=TestARMLinuxHWCAP(HWCAP_THUMBEE);
++  Features["vfp2"]=TestARMLinuxHWCAP(HWCAP_VFP);
++
++  std::string testArchKey(TestARMLinuxAT(AT_PLATFORM));
++
++  StringMap<std::string> archLinuxToLLVMMap;
++  archLinuxToLLVMMap["v4l"]="v4t";
++  archLinuxToLLVMMap["v5l"]="v5t";
++  archLinuxToLLVMMap["v6l"]="v6";
++  // FIXME change this from v6 to v7a when LLVM PR7048 have been fixed
++  archLinuxToLLVMMap["v7l"]="v6";
++
++  llvm::StringMapIterator<std::string> resultIterator(archLinuxToLLVMMap.find(
++                                                      testArchKey));
++  if(resultIterator->first()) {
++    std::string arch(resultIterator->second);
++    Features[arch]=true;
++  }
++
++  return true;
++}
++#endif
++
+   cl::opt<std::string>
+   MCPU("mcpu");
+ 
+@@ -64,7 +154,11 @@
+ #if SHARK_LLVM_VERSION >= 27
+   // Finetune LLVM for the current host CPU.
+   StringMap<bool> Features;
++#if defined(__arm__) && defined(__linux__)
++  bool gotCpuFeatures = getARMHostCPUFeatures(Features);
++#else
+   bool gotCpuFeatures = llvm::sys::getHostCPUFeatures(Features);
++#endif
+   std::string cpu("-mcpu=" + llvm::sys::getHostCPUName());
+ 
+   std::vector<const char*> args;
diff --git a/recipes-core/openjdk/openjdk-7-75b13/icedtea-unbreak-float.patch b/recipes-core/openjdk/openjdk-7-75b13/icedtea-unbreak-float.patch
new file mode 100644
index 0000000..c03b23c
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/icedtea-unbreak-float.patch
@@ -0,0 +1,18 @@
+diff --git openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h
+index c24c781..ccdc41a 100644
+--- openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h
++++ openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h
+@@ -32,13 +32,11 @@
+ #endif
+ #include "jfdlibm.h"
+ 
+-#ifdef __NEWVALID       /* special setup for Sun test regime */
+ #if defined(i386) || defined(i486) || \
+     defined(intel) || defined(x86) || defined(arm) || \
+     defined(i86pc) || defined(_M_IA64) || defined(ia64)
+ #define _LITTLE_ENDIAN
+ #endif
+-#endif
+ 
+ #ifdef _LITTLE_ENDIAN
+ #define __HI(x) *(1+(int*)&x)
diff --git a/recipes-core/openjdk/openjdk-7-75b13/icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch b/recipes-core/openjdk/openjdk-7-75b13/icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch
new file mode 100644
index 0000000..3f7d70a
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch
@@ -0,0 +1,13 @@
+diff --git openjdk/jdk/make/java/nio/Makefile openjdk/jdk/make/java/nio/Makefile
+index 898272e..c5ca547 100644
+--- openjdk/jdk/make/java/nio/Makefile
++++ openjdk/jdk/make/java/nio/Makefile
+@@ -48,6 +48,8 @@ include FILES_java.gmk
+ include FILES_c.gmk
+ include Exportedfiles.gmk
+ 
++NIO_PLATFORM_CLASSES_ROOT_DIR =
++
+ ifeq ($(PLATFORM), windows)
+ FILES_java += \
+ 	sun/nio/ch/Iocp.java \
diff --git a/recipes-core/openjdk/openjdk-7-75b13/icedtea-zero-hotspotfix.patch b/recipes-core/openjdk/openjdk-7-75b13/icedtea-zero-hotspotfix.patch
new file mode 100644
index 0000000..e97e4fc
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/icedtea-zero-hotspotfix.patch
@@ -0,0 +1,36 @@
+diff --git openjdk/hotspot/make/linux/makefiles/zeroshark.make openjdk/hotspot/make/linux/makefiles/zeroshark.make
+index c2a1484..156bdd0 100644
+--- openjdk/hotspot/make/linux/makefiles/zeroshark.make
++++ openjdk/hotspot/make/linux/makefiles/zeroshark.make
+@@ -33,26 +33,27 @@
+ Obj_Files += arm32JIT.o
+ 
+ CFLAGS += -DHOTSPOT_ASM
++CCFLAGS += -DHOTSPOT_ASM
+ 
+ cppInterpreter_arm.o:	offsets_arm.s bytecodes_arm.s
+ arm32JIT.o:		offsets_arm.s
+ 
+ offsets_arm.s:	mkoffsets
+ 	@echo Generating assembler offsets
+-	./mkoffsets > $@
++	$(QEMU) ./mkoffsets > $@
+ 
+ bytecodes_arm.s: bytecodes_arm.def mkbc
+ 	@echo Generating ARM assembler bytecode sequences
+-	$(CXX_COMPILE) -E -x c++ - < $< | ./mkbc - $@ $(COMPILE_DONE)
++	$(CXX_COMPILE) -E -x c++ - < $< | $(QEMU) ./mkbc - $@ $(COMPILE_DONE)
+ 
+ mkbc:	$(GAMMADIR)/tools/mkbc.c
+ 	@echo Compiling mkbc tool
+-	$(CC_COMPILE) -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) -static -fuse-ld=bfd -o $@ $< $(COMPILE_DONE)
+ 
+ mkoffsets:	asm_helper.cpp
+ 	@echo Compiling offset generator
+ 	$(QUIETLY) $(REMOVE_TARGET)
+-	$(CXX_COMPILE) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
++	$(CXX_COMPILE) -static -fuse-ld=bfd -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
+ 
+ endif
+ endif
diff --git a/recipes-core/openjdk/openjdk-7-75b13/jvm.cfg b/recipes-core/openjdk/openjdk-7-75b13/jvm.cfg
new file mode 100644
index 0000000..ea97cda
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/jvm.cfg
@@ -0,0 +1,43 @@
+# Copyright 2003 Sun Microsystems, Inc.  All Rights Reserved.
+# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
+#
+# This code is free software; you can redistribute it and/or modify it
+# under the terms of the GNU General Public License version 2 only, as
+# published by the Free Software Foundation.  Sun designates this
+# particular file as subject to the "Classpath" exception as provided
+# by Sun in the LICENSE file that accompanied this code.
+#
+# This code is distributed in the hope that it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+# version 2 for more details (a copy is included in the LICENSE file that
+# accompanied this code).
+#
+# You should have received a copy of the GNU General Public License version
+# 2 along with this work; if not, write to the Free Software Foundation,
+# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
+# CA 95054 USA or visit www.sun.com if you need additional information or
+# have any questions.
+#
+# 
+# List of JVMs that can be used as an option to java, javac, etc.
+# Order is important -- first in this list is the default JVM.
+# NOTE that this both this file and its format are UNSUPPORTED and
+# WILL GO AWAY in a future release.
+#
+# You may also select a JVM in an arbitrary location with the
+# "-XXaltjvm=<jvm_dir>" option, but that too is unsupported
+# and may not be available in a future release.
+#
+-server ERROR
+-client IGNORE
+-hotspot ERROR
+-classic WARN
+-native ERROR
+-green ERROR
+-zero ALIASED_TO -server
+-shark ERROR
+-cacao ERROR
+-jamvm ERROR
diff --git a/recipes-core/openjdk/openjdk-7-75b13/remove-sun.misc.Perf-debug-code.patch b/recipes-core/openjdk/openjdk-7-75b13/remove-sun.misc.Perf-debug-code.patch
new file mode 100644
index 0000000..00b9660
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-75b13/remove-sun.misc.Perf-debug-code.patch
@@ -0,0 +1,47 @@
+Index: openjdk/jdk/src/share/classes/java/net/URLClassLoader.java
+===================================================================
+--- openjdk.orig/jdk/src/share/classes/java/net/URLClassLoader.java	2011-06-13 16:58:42.000000000 +0200
++++ openjdk/jdk/src/share/classes/java/net/URLClassLoader.java	2011-06-28 18:43:50.114802612 +0200
+@@ -438,14 +438,12 @@
+             // Use (direct) ByteBuffer:
+             CodeSigner[] signers = res.getCodeSigners();
+             CodeSource cs = new CodeSource(url, signers);
+-            sun.misc.PerfCounter.getReadClassBytesTime().addElapsedTimeFrom(t0);
+             return defineClass(name, bb, cs);
+         } else {
+             byte[] b = res.getBytes();
+             // must read certificates AFTER reading bytes.
+             CodeSigner[] signers = res.getCodeSigners();
+             CodeSource cs = new CodeSource(url, signers);
+-            sun.misc.PerfCounter.getReadClassBytesTime().addElapsedTimeFrom(t0);
+             return defineClass(name, b, 0, b.length, cs);
+         }
+     }
+Index: openjdk/jdk/src/share/classes/java/lang/ClassLoader.java
+===================================================================
+--- openjdk.orig/jdk/src/share/classes/java/lang/ClassLoader.java	2011-06-13 16:58:42.000000000 +0200
++++ openjdk/jdk/src/share/classes/java/lang/ClassLoader.java	2011-06-28 18:43:50.142802778 +0200
+@@ -422,10 +422,6 @@
+                     long t1 = System.nanoTime();
+                     c = findClass(name);
+ 
+-                    // this is the defining class loader; record the stats
+-                    sun.misc.PerfCounter.getParentDelegationTime().addTime(t1 - t0);
+-                    sun.misc.PerfCounter.getFindClassTime().addElapsedTimeFrom(t1);
+-                    sun.misc.PerfCounter.getFindClasses().increment();
+                 }
+             }
+             if (resolve) {
+Index: openjdk/jdk/src/share/classes/java/util/zip/ZipFile.java
+===================================================================
+--- openjdk.orig/jdk/src/share/classes/java/util/zip/ZipFile.java
++++ openjdk/jdk/src/share/classes/java/util/zip/ZipFile.java
+@@ -213,8 +213,6 @@ class ZipFile implements ZipConstants, Closeable {
+         this.zc = ZipCoder.get(charset);
+         long t0 = System.nanoTime();
+         jzfile = open(name, mode, file.lastModified(), usemmap);
+-        sun.misc.PerfCounter.getZipFileOpenTime().addElapsedTimeFrom(t0);
+-        sun.misc.PerfCounter.getZipFileCount().increment();
+         this.name = name;
+         this.total = getTotal(jzfile);
+         this.locsig = startsWithLOC(jzfile);
diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 55d010e..b697688 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -26,12 +26,12 @@ PN = "${JDKPN}-jre"
 PROVIDES += "${JDKPN}"
 
 DEPENDS = " \
-           icedtea6-native zip-native ant-native \
+           icedtea7-native zip-native ant-native \
            zlib \
 	   jpeg libpng giflib \
            gtk+ glib-2.0 \
            cups fontconfig \
-	   rhino \
+           rhino krb5 \
 	   libxt libxinerama libxrender libxtst libxi \
 	   freetype alsa-lib libffi \
           "
@@ -70,7 +70,7 @@ WITH_ADDITIONAL_VMS ?= "--with-additional-vms=cacao,jamvm"
 # e.g. "-j 4".
 
 OPENJDK_PARALLEL_MAKE := "${PARALLEL_MAKE}"
-PARALLEL_MAKE =  ""
+PARALLEL_MAKE = ""
 
 def get_jdk7_jobs(d):
     import bb
@@ -101,7 +101,7 @@ EXTRA_OECONF = " \
 	\
         --enable-zero \
 	\
-	--with-jdk-home=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native \
+	--with-jdk-home=${STAGING_LIBDIR_JVM_NATIVE}/icedtea7-native \
 	--with-rhino=${STAGING_DATADIR_JAVA}/rhino.jar \
 	\
         --with-openjdk-src-zip=${WORKDIR}/${OPENJDK_FILE} \
@@ -226,6 +226,7 @@ PACKAGES = " \
 FILES_${JDKPN}-dbg = "\
 	${JDK_HOME}/bin/.debug \
 	${JDK_HOME}/lib/.debug \
+	${JDK_HOME}/lib/${JDK_ARCH}/jli/.debug \
 	${JDK_HOME}/jre/bin/.debug \
 	${JDK_HOME}/jre/lib/.debug \
 	${JDK_HOME}/jre/lib/${JDK_ARCH}/.debug \
diff --git a/recipes-core/openjdk/openjdk-7-release-75b13.inc b/recipes-core/openjdk/openjdk-7-release-75b13.inc
new file mode 100644
index 0000000..e60679b
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-release-75b13.inc
@@ -0,0 +1,102 @@
+require openjdk-7-common.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+FILESPATH =. "${FILE_DIRNAME}/openjdk-7-75b13:"
+
+# Name of the directory containing the compiled output
+BUILD_DIR = "openjdk.build"
+BUILD_DIR_ECJ = "openjdk.build-ecj"
+
+# Force arm mode for now
+ARM_INSTRUCTION_SET_armv4t = "ARM"
+
+ICEDTEA_URI = "http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=iced"
+
+ICEDTEA_PREFIX = "icedtea7-forest-2.5"
+ICEDTEA_HG_URL = "http://icedtea.classpath.org/hg/release/${ICEDTEA_PREFIX}"
+
+OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
+OPENJDK_URI = "${ICEDTEA_HG_URL}/archive/${OPENJDK_FILE};name=openjdk;unpack=false"
+
+HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.bz2"
+#HOTSPOT_URI = "${ICEDTEA_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
+HOTSPOT_URI = "http://icedtea.classpath.org/hg/icedtea7-forest/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
+
+CORBA_FILE = "${CORBA_CHANGESET}.tar.bz2"
+CORBA_URI = "${ICEDTEA_HG_URL}/corba/archive/${CORBA_FILE};name=corba;unpack=false"
+
+JAXP_FILE = "${JAXP_CHANGESET}.tar.bz2"
+JAXP_URI = "${ICEDTEA_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpack=false"
+
+JAXWS_FILE = "${JAXWS_CHANGESET}.tar.bz2"
+JAXWS_URI = "${ICEDTEA_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;unpack=false"
+
+JDK_FILE = "${JDK_CHANGESET}.tar.bz2"
+JDK_URI = "${ICEDTEA_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=false"
+
+LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.bz2"
+LANGTOOLS_URI = "${ICEDTEA_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=langtools;unpack=false"
+
+CACAO_VERSION = "e215e36be9fc"
+CACAO_FILE = "${CACAO_VERSION}.tar.gz"
+CACAO_URI = "http://icedtea.wildebeest.org/download/drops/cacao/${CACAO_FILE};name=cacao;unpack=false"
+SRC_URI[cacao.md5sum] = "79f95f0aea4ba04cf2f1a8632ac66d14"
+SRC_URI[cacao.sha256sum] = "4966514c72ee7ed108b882d9b6e65c3adf8a8f9c2dccb029f971b3c8cb4870ab"
+
+JAMVM_VERSION = "ec18fb9e49e62dce16c5094ef1527eed619463aa"
+JAMVM_FILE = "jamvm-${JAMVM_VERSION}.tar.gz"
+JAMVM_URI = "http://icedtea.wildebeest.org/download/drops/jamvm/${JAMVM_FILE};name=jamvm;unpack=false"
+SRC_URI[jamvm.md5sum] = "d50ae193d01a9251e10679c7a2cc6ff1"
+SRC_URI[jamvm.sha256sum] = "31810266666c23822942aac62a78019c2c4589e1c5ee48329cbf42652d4437bc"
+
+# Allow overriding this separately
+OEPATCHES = "\
+	file://fix-checksums.patch \
+	file://build-hacks.patch \
+	file://cacao-libtoolize.patch \
+	file://cacao-loadavg-makefile.patch \
+	file://fix_hotspot_crosscompile.patch \
+	file://cacao-loadavg.patch;apply=no \
+	file://cacao-arm-ucontext.patch;apply=no \
+	file://remove-sun.misc.Perf-debug-code.patch;apply=no \
+	"
+
+# overrride the jamvm patch for now, needs to be solved upstream
+do_unpackpost() {
+    cp ${WORKDIR}/remove-sun.misc.Perf-debug-code.patch ${S}/patches/jamvm
+}
+
+addtask unpackpost after do_unpack before do_patch
+
+# Allow overriding this separately
+ICEDTEAPATCHES = "\
+	file://icedtea-jdk-rmi-crosscompile.patch;apply=no \
+	file://icedtea-crosscompile-fix.patch;apply=no \
+	file://icedtea-unbreak-float.patch;apply=no \
+	file://icedtea-remove_werror.patch;apply=no \
+	file://icedtea-libnet-renaming.patch;apply=no \
+	file://icedtea-shark-arm-linux-cpu-detection.patch;apply=no \
+	file://icedtea-zero-hotspotfix.patch;apply=no \
+	file://icedtea-jdk-nio-use-host-cc.patch;apply=no \
+	file://icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch;apply=no \
+	file://icedtea-openjdk-remove-currency-data-generation-expi.patch;apply=no \
+	file://icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch;apply=no \
+	"
+
+# Allow overriding this separately
+DISTRIBUTION_PATCHES = "\
+	patches/icedtea-jdk-rmi-crosscompile.patch \
+	patches/icedtea-crosscompile-fix.patch \
+	patches/icedtea-unbreak-float.patch \
+	patches/icedtea-remove_werror.patch \
+	patches/icedtea-libnet-renaming.patch \
+	patches/icedtea-shark-arm-linux-cpu-detection.patch \
+	patches/icedtea-zero-hotspotfix.patch \
+	patches/icedtea-jdk-nio-use-host-cc.patch \
+	patches/icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch \
+	patches/icedtea-openjdk-remove-currency-data-generation-expi.patch \
+	patches/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch \
+	"
+
+export DISTRIBUTION_PATCHES
diff --git a/recipes-core/openjdk/openjdk-7_75b13-2.5.4.bb b/recipes-core/openjdk/openjdk-7_75b13-2.5.4.bb
new file mode 100644
index 0000000..ac37846
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7_75b13-2.5.4.bb
@@ -0,0 +1,36 @@
+require openjdk-7-release-75b13.inc
+
+PR = "${INC_PR}.1"
+
+SRC_URI[iced.md5sum] = "646064d7a8d57c2cae0ef35a05de57c8"
+SRC_URI[iced.sha256sum] = "5301b9a8592af2cf8e3e7a3650e5e1fe744c6d2de7f8ff78080b2eeae86a9800"
+
+CORBA_CHANGESET = "3c9f523bf96e"
+SRC_URI[corba.md5sum] = "fe08a1bdf6e5b9c6541f9ba5d12a8c7e"
+SRC_URI[corba.sha256sum] = "da21a7e17c30f87f180a4e4712c32c382d9dc522c29736bb745cfc238bcea7a4"
+
+JAXP_CHANGESET = "ca26767d3375"
+SRC_URI[jaxp.md5sum] = "9479cc9bbe888cef835da2529fa6e07e"
+SRC_URI[jaxp.sha256sum] = "d9e3c87357f0be354f7f76f820e97fb8fe918dd1bfeb223ff0958a662539f851"
+
+JAXWS_CHANGESET = "9a6c90336922"
+SRC_URI[jaxws.md5sum] = "a4cc532e6244637d2a185547075a057a"
+SRC_URI[jaxws.sha256sum] = "b8154336679168deaa4fc076a1951f54073153d398ab840dfed3df456e4f4ae9"
+
+JDK_CHANGESET = "1e6db4f8b0f3"
+SRC_URI[jdk.md5sum] = "466b5bac22960beea959f79ef9029899"
+SRC_URI[jdk.sha256sum] = "a5db2c28f23fee351aaa7fd783fbcd14a6f77c62d753fe6d52ab8b5b97a4720b"
+
+LANGTOOLS_CHANGESET = "960cdffa8b3f"
+SRC_URI[langtools.md5sum] = "a44baae860eafef49c6febb89c74acd8"
+SRC_URI[langtools.sha256sum] = "daab93539d7c840865121f06dc7e0ec441656c2dc249ecee44aa2049643a4db3"
+
+OPENJDK_CHANGESET = "6cf2880aab5e"
+SRC_URI[openjdk.md5sum] = "b3c781de9e0632b61c6a61bc87d93631"
+SRC_URI[openjdk.sha256sum] = "4387e53911667b6324421d9a1ea5c098fa5fb56a10f659124c1e10df3486e393"
+
+# located in hotspot.map
+# Replaced due to http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=1851
+HOTSPOT_CHANGESET = "67b77521a2fd"
+SRC_URI[hotspot.md5sum] = "4bc7af1c7fd45c50ddfbb897730f0eb4"
+SRC_URI[hotspot.sha256sum] = "050684e8c46b680728f477eba2546550d65ed3ded82329027f6163a3d8c5359a"
-- 
1.8.1.rc3


