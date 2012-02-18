Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Ryrq9-0006J9-T5
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2012 22:29:10 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4A72822325A7;
	Sat, 18 Feb 2012 22:20:56 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D034E22325A9;
	Sat, 18 Feb 2012 22:20:52 +0100 (CET)
Received: from rhein.familie-heinold.de (g229046026.adsl.alicedsl.de
	[92.229.46.26]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sat, 18 Feb 2012 22:20:50 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 4528D3C4C3; Sat, 18 Feb 2012 22:20:45 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2012 22:20:20 +0100
Message-Id: <1329600022-8027-11-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 10/12][oe-classic] openjdk: backport 1.11.1 release from meta-java
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
X-List-Received-Date: Sat, 18 Feb 2012 21:29:10 -0000

* shark is disabled since 1.11
* rework patches
* rework inc files for jamvm
* bump PR

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes/openjdk/openjdk-6-6b24/build-hacks.patch   |   79 +++++++
 .../openjdk/openjdk-6-6b24/cacao-libtoolize.patch  |   12 +
 .../openjdk-6-6b24/cacao-loadavg-makefile.patch    |   12 +
 recipes/openjdk/openjdk-6-6b24/cacao-loadavg.patch |   27 +++
 .../openjdk-6-6b24/fix_hotspot_crosscompile.patch  |   51 +++++
 .../openjdk-6-6b24/icedtea-crosscompile-fix.patch  |  216 ++++++++++++++++++
 .../openjdk-6-6b24/icedtea-fix-xrender.patch       |   13 ++
 .../openjdk-6-6b24/icedtea-hostbuildcc.patch       |   12 +
 .../icedtea-hotspot-dlvsym-uclibc.patch            |   16 ++
 .../icedtea-hotspot-glibc-version.patch            |   23 ++
 .../openjdk-6-6b24/icedtea-hotspot-isfinte.patch   |   15 ++
 .../openjdk-6-6b24/icedtea-hotspot-isnanf.patch    |   21 ++
 .../openjdk-6-6b24/icedtea-hotspot-loadavg.patch   |   28 +++
 .../openjdk-6-6b24/icedtea-jdk-iconv-uclibc.patch  |   39 ++++
 .../icedtea-jdk-remove-unused-backtrace.patch      |   41 ++++
 .../openjdk-6-6b24/icedtea-jdk-unpack-uclibc.patch |   12 +
 .../openjdk-6-6b24/icedtea-launcher-stdc++.patch   |   13 ++
 .../openjdk-6-6b24/icedtea-libnet-renaming.patch   |  148 +++++++++++++
 .../openjdk-6-6b24/icedtea-remove_werror.patch     |   14 ++
 .../icedtea-shark-arm-linux-cpu-detection.patch    |  113 ++++++++++
 .../openjdk-6-6b24/icedtea-unbreak-float.patch     |   18 ++
 .../openjdk-6-6b24/icedtea-zero-hotspotfix.patch   |   41 ++++
 recipes/openjdk/openjdk-6-6b24/jvm.cfg             |   43 ++++
 recipes/openjdk/openjdk-6-common.inc               |  163 +++++++++------
 recipes/openjdk/openjdk-6-release-6b24.inc         |  115 ++++++++++
 recipes/openjdk/openjdk-6/build-hacks.patch        |   31 +++
 .../openjdk-6/cacao-disable-stackbase-check.patch  |   12 +
 recipes/openjdk/openjdk-6/cacao-libtoolize.patch   |   18 ++
 recipes/openjdk/openjdk-6/cacao-vfp-compat.patch   |   37 ++++
 recipes/openjdk/openjdk-6/fix-llvm-libs.patch      |   13 ++
 .../openjdk-6/fix_hotspot_crosscompile.patch       |   94 ++++++++
 .../openjdk-6/icedtea-crosscompile-fix.patch       |  229 ++++++++++++++++++++
 .../openjdk-6/icedtea-fix-jar-command.patch        |   13 ++
 .../openjdk/openjdk-6/icedtea-hasgettransfer.patch |  131 +++++++++++
 .../openjdk/openjdk-6/icedtea-hostbuildcc.patch    |   12 +
 .../openjdk-6/icedtea-hotspot-glibc-version.patch  |   23 ++
 .../openjdk-6/icedtea-hotspot-isfinte.patch        |   15 ++
 .../openjdk/openjdk-6/icedtea-hotspot-isnanf.patch |   21 ++
 .../openjdk-6/icedtea-hotspot-loadavg.patch        |   28 +++
 .../openjdk-6/icedtea-jdk-RTLD_NOLOAD.patch        |   13 ++
 .../openjdk-6/icedtea-jdk-iconv-uclibc.patch       |   39 ++++
 .../icedtea-jdk-remove-unused-backtrace.patch      |   41 ++++
 .../openjdk-6/icedtea-jdk-unpack-uclibc.patch      |   12 +
 .../openjdk-6/icedtea-launcher-stdc++.patch        |   13 ++
 .../openjdk-6/icedtea-libnet-renaming.patch        |  148 +++++++++++++
 .../openjdk/openjdk-6/icedtea-llvm_headers.patch   |   29 +++
 .../openjdk/openjdk-6/icedtea-remove_werror.patch  |   14 ++
 .../openjdk/openjdk-6/icedtea-unbreak-float.patch  |   18 ++
 recipes/openjdk/openjdk-6/jvm.cfg                  |   41 ++++
 recipes/openjdk/openjdk-6/mkbc_returncode.patch    |   11 +
 .../openjdk-6/shark-arm-linux-cpu-detection.patch  |  113 ++++++++++
 .../openjdk/openjdk-6/shark-build-openjdkdir.patch |   13 ++
 recipes/openjdk/openjdk-6/zero-cmpswap-long.patch  |   20 ++
 recipes/openjdk/openjdk-6_6b24-1.11.1.bb           |   18 ++
 54 files changed, 2439 insertions(+), 66 deletions(-)
 create mode 100644 recipes/openjdk/openjdk-6-6b24/build-hacks.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/cacao-libtoolize.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/cacao-loadavg-makefile.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/cacao-loadavg.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/fix_hotspot_crosscompile.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-crosscompile-fix.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-fix-xrender.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-hostbuildcc.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-dlvsym-uclibc.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-glibc-version.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-isfinte.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-isnanf.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-loadavg.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-jdk-iconv-uclibc.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-jdk-remove-unused-backtrace.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-jdk-unpack-uclibc.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-launcher-stdc++.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-libnet-renaming.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-remove_werror.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-shark-arm-linux-cpu-detection.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-unbreak-float.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b24/jvm.cfg
 create mode 100644 recipes/openjdk/openjdk-6-release-6b24.inc
 create mode 100644 recipes/openjdk/openjdk-6/build-hacks.patch
 create mode 100644 recipes/openjdk/openjdk-6/cacao-disable-stackbase-check.patch
 create mode 100644 recipes/openjdk/openjdk-6/cacao-libtoolize.patch
 create mode 100644 recipes/openjdk/openjdk-6/cacao-vfp-compat.patch
 create mode 100644 recipes/openjdk/openjdk-6/fix-llvm-libs.patch
 create mode 100644 recipes/openjdk/openjdk-6/fix_hotspot_crosscompile.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-crosscompile-fix.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-fix-jar-command.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-hasgettransfer.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-hostbuildcc.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-hotspot-glibc-version.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-hotspot-isfinte.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-hotspot-isnanf.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-hotspot-loadavg.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-jdk-RTLD_NOLOAD.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-jdk-iconv-uclibc.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-jdk-remove-unused-backtrace.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-jdk-unpack-uclibc.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-launcher-stdc++.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-libnet-renaming.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-llvm_headers.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-remove_werror.patch
 create mode 100644 recipes/openjdk/openjdk-6/icedtea-unbreak-float.patch
 create mode 100644 recipes/openjdk/openjdk-6/jvm.cfg
 create mode 100644 recipes/openjdk/openjdk-6/mkbc_returncode.patch
 create mode 100644 recipes/openjdk/openjdk-6/shark-arm-linux-cpu-detection.patch
 create mode 100644 recipes/openjdk/openjdk-6/shark-build-openjdkdir.patch
 create mode 100644 recipes/openjdk/openjdk-6/zero-cmpswap-long.patch
 create mode 100644 recipes/openjdk/openjdk-6_6b24-1.11.1.bb

diff --git a/recipes/openjdk/openjdk-6-6b24/build-hacks.patch b/recipes/openjdk/openjdk-6-6b24/build-hacks.patch
new file mode 100644
index 0000000..e23bae5
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/build-hacks.patch
@@ -0,0 +1,79 @@
+Index: icedtea6/Makefile.am
+===================================================================
+--- icedtea6.orig/Makefile.am	2011-12-21 21:24:25.000000000 +0100
++++ icedtea6/Makefile.am	2011-12-21 22:50:11.649227590 +0100
+@@ -538,6 +538,11 @@
+ 	JAVAC="" \
+ 	JAVA_HOME="" \
+ 	JDK_HOME="" \
++        OE_CFLAGS="$(OE_CFLAGS)" \
++        OE_CPPFLAGS="$(OE_CPPFLAGS)" \
++        OE_CXXFLAGS="$(OE_CXXFLAGS)" \
++        OE_LDFLAGS="$(OE_LDFLAGS)" \
++        OE_LAUNCHER_LDFLAGS="$(OE_LAUNCHER_LDFLAGS)" \
+ 	DISTRIBUTION_ID="$(DIST_ID)" \
+ 	DERIVATIVE_ID="$(ICEDTEA_NAME) $(PACKAGE_VERSION)$(ICEDTEA_REV)" \
+ 	DEBUG_CLASSFILES="true" \
+@@ -1851,12 +1856,16 @@
+ if BUILD_JAMVM
+ 	cd jamvm/jamvm && \
+ 	LDFLAGS="-Xlinker -z -Xlinker noexecstack" \
+-	./autogen.sh --with-java-runtime-library=openjdk \
+-	  --prefix=$(abs_top_builddir)/jamvm/install ; \
+-	$(MAKE) ; \
+-	$(MAKE) install
++       $(ARCH_PREFIX) ./autogen.sh --with-java-runtime-library=openjdk \
++	  --prefix=/usr/lib \
++	  --host=$(host_alias) \
++	  --build=$(build_alias) \
++	  --target=$(target_alias)  \
++	  --with-libtool-sysroot ; \
++	$(ARCH_PREFIX) $(MAKE) ; \
++	$(ARCH_PREFIX) $(MAKE) install DESTDIR=$(abs_top_builddir)/jamvm/install
+ 	mkdir -p $(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/server
+-	cp $(abs_top_builddir)/jamvm/install/lib/libjvm.so $(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/server
++	cp $(abs_top_builddir)/jamvm/install/usr/lib/lib/libjvm.so $(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/server
+ 	ln -sf server $(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/client
+ 	touch $(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/server/Xusage.txt
+ 	ln -sf client/libjvm.so $(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/libjsig.so
+@@ -1874,7 +1883,7 @@
+ stamps/add-jamvm.stamp: stamps/icedtea.stamp stamps/jamvm.stamp
+ if ADD_JAMVM_BUILD
+ 	mkdir -p $(BUILD_JRE_ARCH_DIR)/jamvm
+-	install -m 644 jamvm/install/lib/libjvm.so \
++	install -m 644 jamvm/install/usr/lib/lib/libjvm.so \
+ 		$(BUILD_JRE_ARCH_DIR)/jamvm/
+ 	printf -- '-jamvm KNOWN\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
+ else
+@@ -1918,6 +1927,7 @@
+ 	  --host=$(host_alias) \
+ 	  --build=$(build_alias) \
+ 	  --target=$(target_alias) \
++	  --with-libtool-sysroot \
+ 	  --prefix=$(abs_top_builddir)/cacao/install \
+ 	  --with-java-runtime-library=openjdk \
+ 	  --with-java-runtime-library-prefix=$(abs_top_builddir)/openjdk \
+@@ -1984,7 +1994,7 @@
+ # configure script arguments, quoted in single quotes
+ CONFIGURE_ARGS = @CONFIGURE_ARGS@
+ ADD_ZERO_CONFIGURE_ARGS = \
+-	--with-jdk-home=$(BUILD_OUTPUT_DIR)/j2sdk-image \
++	--with-jdk-home=$(abs_top_builddir)/bootstrap/jdk1.6.0 \
+ 	--enable-zero
+ if ADD_SHARK_BUILD
+ ADD_ZERO_CONFIGURE_ARGS += \
+Index: icedtea6/javac.in
+===================================================================
+--- icedtea6.orig/javac.in	2011-12-21 21:24:30.000000000 +0100
++++ icedtea6/javac.in	2011-12-21 22:44:25.860460813 +0100
+@@ -45,7 +45,9 @@
+     my @CLASSPATH = ('@ECJ_JAR@');
+     push @CLASSPATH, split /:/, $ENV{"CLASSPATH"} if exists $ENV{"CLASSPATH"};
+     $ENV{"CLASSPATH"} = join ':', @CLASSPATH;
+-    exec '@JAVA@', 'org.eclipse.jdt.internal.compiler.batch.Main', @ecj_parms, @ecj_args;
++    # Compiling hotspot-tools consumes tons of memory and exceeds any default
++    # limits for jamvm and cacao.
++    exec '@JAVA@', '-Xmx1024m', 'org.eclipse.jdt.internal.compiler.batch.Main', @ecj_parms, @ecj_args;
+ }
+ else
+ {
diff --git a/recipes/openjdk/openjdk-6-6b24/cacao-libtoolize.patch b/recipes/openjdk/openjdk-6-6b24/cacao-libtoolize.patch
new file mode 100644
index 0000000..484cb10
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/cacao-libtoolize.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b24/cacao-loadavg-makefile.patch b/recipes/openjdk/openjdk-6-6b24/cacao-loadavg-makefile.patch
new file mode 100644
index 0000000..0f50c6c
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/cacao-loadavg-makefile.patch
@@ -0,0 +1,12 @@
+Index: icedtea6/Makefile.am
+===================================================================
+--- icedtea6.orig/Makefile.am	2011-12-20 10:54:09.000000000 +0100
++++ icedtea6/Makefile.am	2011-12-20 11:49:12.810009279 +0100
+@@ -1921,6 +1921,7 @@
+ if BUILD_CACAO
+ if !USE_SYSTEM_CACAO
+ 	cd cacao/cacao && \
++	patch -p1 -N  < $(abs_top_srcdir)/patches/cacao-loadavg.patch && \
+ 	rm -f libtool && \
+ 	./autogen.sh && \
+ 	$(ARCH_PREFIX) ./configure \
diff --git a/recipes/openjdk/openjdk-6-6b24/cacao-loadavg.patch b/recipes/openjdk/openjdk-6-6b24/cacao-loadavg.patch
new file mode 100644
index 0000000..0fc1a81
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/cacao-loadavg.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b24/fix_hotspot_crosscompile.patch b/recipes/openjdk/openjdk-6-6b24/fix_hotspot_crosscompile.patch
new file mode 100644
index 0000000..bef699f
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/fix_hotspot_crosscompile.patch
@@ -0,0 +1,51 @@
+Index: icedtea6/acinclude.m4
+===================================================================
+--- icedtea6.orig/acinclude.m4	2011-12-20 02:25:50.000000000 +0100
++++ icedtea6/acinclude.m4	2011-12-20 18:02:08.340386576 +0100
+@@ -928,6 +928,21 @@
+   AC_SUBST(ALT_CACAO_SRC_DIR)
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
+ AC_DEFUN([IT_WITH_GCJ],
+ [
+   AC_MSG_CHECKING([whether to compile ecj natively])
+Index: icedtea6/Makefile.am
+===================================================================
+--- icedtea6.orig/Makefile.am	2011-12-20 17:59:27.000000000 +0100
++++ icedtea6/Makefile.am	2011-12-20 18:04:32.972312064 +0100
+@@ -538,6 +538,7 @@
+ 	JAVAC="" \
+ 	JAVA_HOME="" \
+ 	JDK_HOME="" \
++	CC_FOR_BUILD="$(CC_FOR_BUILD)" \
+         OE_CFLAGS="$(OE_CFLAGS)" \
+         OE_CPPFLAGS="$(OE_CPPFLAGS)" \
+         OE_CXXFLAGS="$(OE_CXXFLAGS)" \
+Index: icedtea6/configure.ac
+===================================================================
+--- icedtea6.orig/configure.ac	2011-12-20 02:25:50.000000000 +0100
++++ icedtea6/configure.ac	2011-12-20 18:03:04.534043885 +0100
+@@ -18,6 +18,8 @@
+ AC_PROG_CC
+ AC_PROG_CXX
+ 
++AC_CHECK_WITH_CC_FOR_BUILD
++
+ IT_FIND_TOOL([MAKE], [make])
+ IT_FIND_TOOL([GZIP], [gzip])
+ IT_FIND_TOOL([ANT], [ant])
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-crosscompile-fix.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-crosscompile-fix.patch
new file mode 100644
index 0000000..652f7ac
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-crosscompile-fix.patch
@@ -0,0 +1,216 @@
+Index: openjdk/jdk/make/sun/awt/Makefile
+===================================================================
+--- openjdk.orig/jdk/make/sun/awt/Makefile	2009-01-24 17:54:57.000000000 +0100
++++ openjdk/jdk/make/sun/awt/Makefile	2009-01-24 17:55:07.000000000 +0100
+@@ -509,10 +509,10 @@
+ #
+ 
+ ifeq ($(PLATFORM), linux)
+-CPPFLAGS += -I$(MOTIF_DIR)/include \
+-            -I$(OPENWIN_HOME)/include \
+-            -I$(OPENWIN_HOME)/include/X11/extensions \
+-            -I$(PLATFORM_SRC)/native/$(PKGDIR)/font 
++#CPPFLAGS += -I$(MOTIF_DIR)/include \
++#            -I$(OPENWIN_HOME)/include \
++#            -I$(OPENWIN_HOME)/include/X11/extensions \
++CPPFLAGS +=  -I$(PLATFORM_SRC)/native/$(PKGDIR)/font 
+ endif
+ CPPFLAGS += -I$(SHARE_SRC)/native/$(PKGDIR)/debug \
+             -I$(SHARE_SRC)/native/$(PKGDIR)/../font \
+@@ -536,7 +536,7 @@
+ 	    $(EVENT_MODEL)
+ 
+ ifeq ($(PLATFORM), linux)
+-LDFLAGS += -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
++#LDFLAGS += -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
+ endif
+ 
+ LDFLAGS += -L$(LIBDIR)/$(LIBARCH)/$(TSOBJDIR) \
+Index: openjdk/jdk/make/sun/awt/mawt.gmk
+===================================================================
+--- openjdk.orig/jdk/make/sun/awt/mawt.gmk	2009-01-24 17:54:57.000000000 +0100
++++ openjdk/jdk/make/sun/awt/mawt.gmk	2009-01-24 17:55:07.000000000 +0100
+@@ -194,8 +194,8 @@
+ CPPFLAGS += -I$(CUPS_HEADERS_PATH)
+ 
+ ifndef HEADLESS
+-CPPFLAGS += -I$(OPENWIN_HOME)/include 
+-LDFLAGS  += -L$(OPENWIN_LIB)
++#CPPFLAGS += -I$(OPENWIN_HOME)/include 
++#LDFLAGS  += -L$(OPENWIN_LIB)
+ 
+ endif # !HEADLESS
+ 
+@@ -223,8 +223,8 @@
+ 
+ ifeq ($(PLATFORM), linux)
+ # Checking for the X11/extensions headers at the additional location
+-  CPPFLAGS += -I/X11R6/include/X11/extensions \
+-              -I/usr/include/X11/extensions
++#  CPPFLAGS += -I/X11R6/include/X11/extensions \
++#              -I/usr/include/X11/extensions
+ endif
+ 
+ ifeq ($(PLATFORM), solaris)
+Index: openjdk/jdk/make/sun/xawt/Makefile
+===================================================================
+--- openjdk.orig/jdk/make/sun/xawt/Makefile	2009-01-24 17:54:57.000000000 +0100
++++ openjdk/jdk/make/sun/xawt/Makefile	2009-01-24 17:55:07.000000000 +0100
+@@ -123,11 +123,12 @@
+         -I$(PLATFORM_SRC)/native/sun/awt 
+ 
+ ifeq ($(PLATFORM), linux)
++# Very unsuitable for cross-compilation.
+ # Allows for builds on Debian GNU Linux, X11 is in a different place 
+-  CPPFLAGS += -I/usr/X11R6/include/X11/extensions \
+-              -I/usr/include/X11/extensions \
+-              -I$(MOTIF_DIR)/include \
+-              -I$(OPENWIN_HOME)/include 
++#  CPPFLAGS += -I/usr/X11R6/include/X11/extensions \
++#              -I/usr/include/X11/extensions \
++#              -I$(MOTIF_DIR)/include \
++#              -I$(OPENWIN_HOME)/include 
+ endif
+ 
+ ifeq ($(PLATFORM), solaris)
+Index: openjdk/hotspot/make/linux/makefiles/vm.make
+===================================================================
+--- openjdk.orig/hotspot/make/linux/makefiles/vm.make	2009-01-24 17:54:57.000000000 +0100
++++ openjdk/hotspot/make/linux/makefiles/vm.make	2009-01-24 17:55:07.000000000 +0100
+@@ -170,6 +170,7 @@
+ LIBS_VM   += $(LLVM_LIBS)
+ endif
+ 
++LFLAGS_VM += $(OE_LDFLAGS)
+ LINK_VM = $(LINK_LIB.c)
+ 
+ # rule for building precompiled header
+Index: openjdk/hotspot/make/linux/makefiles/buildtree.make
+===================================================================
+--- openjdk.orig/hotspot/make/linux/makefiles/buildtree.make	2009-01-24 17:54:57.000000000 +0100
++++ openjdk/hotspot/make/linux/makefiles/buildtree.make	2009-01-24 17:55:07.000000000 +0100
+@@ -343,7 +343,7 @@
+ 	echo "rm -f Queens.class"; \
+ 	echo "\$${JAVA_HOME}/bin/javac -d . $(GAMMADIR)/make/test/Queens.java"; \
+ 	echo '[ -f gamma_g ] && { gamma=gamma_g; }'; \
+-	echo './$${gamma:-gamma} $(TESTFLAGS) Queens < /dev/null'; \
++	echo 'echo Silently skipping the execution of the gamma program'; \
+ 	) > $@
+ 	$(QUIETLY) chmod +x $@
+ 
+Index: openjdk/corba/make/common/Defs-linux.gmk
+===================================================================
+--- openjdk.orig/corba/make/common/Defs-linux.gmk	2009-01-24 17:54:57.000000000 +0100
++++ openjdk/corba/make/common/Defs-linux.gmk	2009-01-24 17:55:07.000000000 +0100
+@@ -82,9 +82,9 @@
+ CC_NO_OPT      =
+ 
+ ifeq ($(PRODUCT), java)
+-    _OPT = $(CC_HIGHER_OPT)
++    _OPT = $(OE_CFLAGS)
+ else
+-    _OPT = $(CC_LOWER_OPT)
++    _OPT = $(OE_CFLAGS)
+     CPPFLAGS_DBG    += -DLOGGING 
+ endif
+ 
+@@ -94,7 +94,7 @@
+ #    as the default.
+ CFLAGS_REQUIRED_alpha   += -mieee -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_amd64   += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+-CFLAGS_REQUIRED_arm     += -D_LITTLE_ENDIAN
++CFLAGS_REQUIRED_arm     += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_hppa    +=
+ CFLAGS_REQUIRED_i586    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_ia64    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+@@ -221,7 +221,7 @@
+ #
+ # -L paths for finding and -ljava
+ #
+-LDFLAGS_OPT     = -Xlinker -O1
++LDFLAGS_OPT     = $(OE_LDFLAGS)
+ LDFLAGS_COMMON += -L$(LIBDIR)/$(LIBARCH)
+ LDFLAGS_COMMON += -Wl,-soname=$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
+ 
+Index: openjdk/jdk/make/common/Defs-linux.gmk
+===================================================================
+--- openjdk.orig/jdk/make/common/Defs-linux.gmk	2009-01-24 17:54:57.000000000 +0100
++++ openjdk/jdk/make/common/Defs-linux.gmk	2009-01-24 17:55:07.000000000 +0100
+@@ -92,9 +92,9 @@
+ CC_NO_OPT      =
+ 
+ ifeq ($(PRODUCT), java)
+-    _OPT = $(CC_HIGHER_OPT)
++    _OPT = $(OE_CFLAGS)
+ else
+-    _OPT = $(CC_LOWER_OPT)
++    _OPT = $(OE_CFLAGS)
+     CPPFLAGS_DBG    += -DLOGGING 
+ endif
+ 
+@@ -104,7 +104,7 @@
+ #    as the default.
+ CFLAGS_REQUIRED_alpha   += -mieee -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_amd64   += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+-CFLAGS_REQUIRED_arm     += -D_LITTLE_ENDIAN
++CFLAGS_REQUIRED_arm     += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_hppa    +=
+ CFLAGS_REQUIRED_i586    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_ia64    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+@@ -231,7 +231,7 @@
+ #
+ # -L paths for finding and -ljava
+ #
+-LDFLAGS_OPT     = -Xlinker -O1
++LDFLAGS_OPT     = $(OE_LDFLAGS)
+ LDFLAGS_COMMON += -L$(LIBDIR)/$(LIBARCH)
+ LDFLAGS_COMMON += -Wl,-soname=$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
+ 
+Index: openjdk/hotspot/make/linux/makefiles/gcc.make
+===================================================================
+--- openjdk.orig/hotspot/make/linux/makefiles/gcc.make	2009-01-24 17:54:57.000000000 +0100
++++ openjdk/hotspot/make/linux/makefiles/gcc.make	2009-01-24 17:55:07.000000000 +0100
+@@ -119,7 +119,7 @@
+ CFLAGS_WARN/BYFILE = $(CFLAGS_WARN/$@)$(CFLAGS_WARN/DEFAULT$(CFLAGS_WARN/$@)) 
+ 
+ # The flags to use for an Optimized g++ build
+-OPT_CFLAGS += -O3
++OPT_CFLAGS += $(OE_CFLAGS)
+ 
+ # Hotspot uses very unstrict aliasing turn this optimization off
+ OPT_CFLAGS += -fno-strict-aliasing
+@@ -148,7 +148,7 @@
+ endif
+ 
+ # Enable linker optimization
+-LFLAGS += -Xlinker -O1
++LFLAGS += $(OE_LDFLAGS)
+ 
+ # Use $(MAPFLAG:FILENAME=real_file_name) to specify a map file.
+ MAPFLAG = -Xlinker --version-script=FILENAME
+Index: openjdk/hotspot/make/linux/makefiles/launcher.make
+===================================================================
+--- openjdk.orig/hotspot/make/linux/makefiles/launcher.make	2009-01-24 17:55:19.000000000 +0100
++++ openjdk/hotspot/make/linux/makefiles/launcher.make	2009-01-24 17:56:05.000000000 +0100
+@@ -44,7 +44,7 @@
+   LIBS_LAUNCHER             += $(STATIC_STDCXX) $(LIBS)
+ else
+   LAUNCHER.o                 = launcher.o
+-  LFLAGS_LAUNCHER           += -L `pwd`
++  LFLAGS_LAUNCHER           += -L `pwd` $(OE_LAUNCHER_LDFLAGS) $(OE_LDFLAGS)
+   LIBS_LAUNCHER             += -l$(JVM) $(LIBS) -lstdc++
+ endif
+ 
+Index: icedtea6-1.8.5/build/openjdk/jdk/make/sun/xawt/Makefile
+===================================================================
+--- openjdk/jdk/make/sun/xawt/Makefile	2011-03-14 14:17:03.926207269 +0100
++++ openjdk/jdk/make/sun/xawt/Makefile	2011-03-14 14:30:11.956186631 +0100
+@@ -245,7 +245,7 @@
+ 	    $(CHMOD) +w $@;\
+ 	else	\
+ 	    $(ECHO) GENERATING $@; \
+-	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
++	    $(QEMU) $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
+ 	fi
+ 	@if [ "$(DOCOMPARE)$(suffix $@)" = "true.64" ]; then \
+ 	    $(ECHO) COMPARING $@ and $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-fix-xrender.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-fix-xrender.patch
new file mode 100644
index 0000000..4bd8b2c
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-fix-xrender.patch
@@ -0,0 +1,13 @@
+Index: openjdk/jdk/src/solaris/native/sun/java2d/x11/XRSurfaceData.c
+===================================================================
+--- openjdk.orig/jdk/src/solaris/native/sun/java2d/x11/XRSurfaceData.c	2011-10-19 16:56:03.014276748 +0200
++++ openjdk/jdk/src/solaris/native/sun/java2d/x11/XRSurfaceData.c	2011-10-19 16:57:19.942658211 +0200
+@@ -29,7 +29,7 @@
+ #include "X11SurfaceData.h"
+ 
+ /*#include <xcb/xcb.h>*/
+-#include <Xrender.h>
++#include <X11/extensions/Xrender.h>
+ 
+ #ifndef RepeatNone  /* added in 0.10 */
+ #define RepeatNone    0
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-hostbuildcc.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-hostbuildcc.patch
new file mode 100644
index 0000000..5f2c98b
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-hostbuildcc.patch
@@ -0,0 +1,12 @@
+Index: openjdk/hotspot/make/linux/makefiles/rules.make
+===================================================================
+--- openjdk/hotspot/make/linux/makefiles/rules.make	2010-02-02 02:22:33.201668748 +0100
++++ openjdk/hotspot/make/linux/makefiles/rules.make	2010-02-02 02:23:08.480415783 +0100
+@@ -39,6 +39,7 @@
+ # $(CC) is the c compiler (cc/gcc), $(CCC) is the c++ compiler (CC/g++).
+ C_COMPILE       = $(CC) $(CPPFLAGS) $(CFLAGS)
+ CC_COMPILE      = $(CCC) $(CPPFLAGS) $(CFLAGS)
++CC_HOST_COMPILE  = $(BUILD_CC) $(CPPFLAGS) $(CFLAGS)
+ 
+ AS.S            = $(AS) $(ASFLAGS)
+ 
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-dlvsym-uclibc.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-dlvsym-uclibc.patch
new file mode 100644
index 0000000..657f722
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-dlvsym-uclibc.patch
@@ -0,0 +1,16 @@
+Index: openjdk/hotspot/src/os/linux/vm/os_linux.cpp
+===================================================================
+--- openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2011-12-20 19:15:05.000000000 +0100
++++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2011-12-20 19:18:22.411503442 +0100
+@@ -2593,10 +2593,7 @@
+ // If we are running with earlier version, which did not have symbol versions,
+ // we should use the base version.
+ void* os::Linux::libnuma_dlsym(void* handle, const char *name) {
+-  void *f = dlvsym(handle, name, "libnuma_1.1");
+-  if (f == NULL) {
+-    f = dlsym(handle, name);
+-  }
++  void *f = dlsym(handle, name);
+   return f;
+ }
+ 
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-glibc-version.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-glibc-version.patch
new file mode 100644
index 0000000..faa90ea
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-glibc-version.patch
@@ -0,0 +1,23 @@
+Index: icedtea6-1.8/build/openjdk/hotspot/src/os/linux/vm/os_linux.cpp
+===================================================================
+--- openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 22:22:13.696298239 +0200
++++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 22:24:15.308790737 +0200
+@@ -49,7 +49,6 @@
+ # include <string.h>
+ # include <syscall.h>
+ # include <sys/sysinfo.h>
+-# include <gnu/libc-version.h>
+ # include <sys/ipc.h>
+ # include <sys/shm.h>
+ # include <link.h>
+@@ -544,9 +543,7 @@
+      os::Linux::set_glibc_version(str);
+   } else {
+      // _CS_GNU_LIBC_VERSION is not supported, try gnu_get_libc_version()
+-     static char _gnu_libc_version[32];
+-     jio_snprintf(_gnu_libc_version, sizeof(_gnu_libc_version),
+-              "glibc %s %s", gnu_get_libc_version(), gnu_get_libc_release());
++     static char _gnu_libc_version[32] = "2.9";
+      os::Linux::set_glibc_version(_gnu_libc_version);
+   }
+ 
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-isfinte.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-isfinte.patch
new file mode 100644
index 0000000..7c5da59
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-isfinte.patch
@@ -0,0 +1,15 @@
+Index: icedtea6-1.8/build/openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp
+===================================================================
+--- openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	2010-06-09 21:41:28.576131825 +0200
++++ openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	2010-06-09 21:41:55.555711815 +0200
+@@ -235,8 +235,8 @@
+ 
+ // Checking for finiteness
+ 
+-inline int g_isfinite(jfloat  f)                 { return finite(f); }
+-inline int g_isfinite(jdouble f)                 { return finite(f); }
++inline int g_isfinite(jfloat  f)                 { return isfinite(f); }
++inline int g_isfinite(jdouble f)                 { return isfinite(f); }
+ 
+ 
+ // Wide characters
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-isnanf.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-isnanf.patch
new file mode 100644
index 0000000..494e965
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-isnanf.patch
@@ -0,0 +1,21 @@
+Index: icedtea6-1.8/build/openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp
+===================================================================
+--- openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	2010-06-09 21:47:12.695674808 +0200
++++ openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	2010-06-09 21:48:08.699007491 +0200
+@@ -220,14 +220,14 @@
+ // checking for nanness
+ #ifdef SOLARIS
+ #ifdef SPARC
+-inline int g_isnan(float  f) { return isnanf(f); }
++inline int g_isnan(float  f) { return __isnanf(f); }
+ #else
+ // isnanf() broken on Intel Solaris use isnand()
+ inline int g_isnan(float  f) { return isnand(f); }
+ #endif
+ inline int g_isnan(double f) { return isnand(f); }
+ #elif LINUX
+-inline int g_isnan(float  f) { return isnanf(f); }
++inline int g_isnan(float  f) { return __isnanf(f); }
+ inline int g_isnan(double f) { return isnan(f); }
+ #else
+ #error "missing platform-specific definition here"
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-loadavg.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-loadavg.patch
new file mode 100644
index 0000000..7da41fd
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-loadavg.patch
@@ -0,0 +1,28 @@
+Index: icedtea6-1.8/build/openjdk/hotspot/src/os/linux/vm/os_linux.cpp
+===================================================================
+--- openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 22:16:09.406334411 +0200
++++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 22:19:38.952152043 +0200
+@@ -4325,7 +4325,22 @@
+ // Linux doesn't yet have a (official) notion of processor sets,
+ // so just return the system wide load average.
+ int os::loadavg(double loadavg[], int nelem) {
+-  return ::getloadavg(loadavg, nelem);
++
++	FILE *LOADAVG;
++	double avg[3] = { 0.0, 0.0, 0.0 };
++	int i, res = -1;;
++
++	if ((LOADAVG = fopen("/proc/loadavg", "r"))) {
++		fscanf(LOADAVG, "%lf %lf %lf", &avg[0], &avg[1], &avg[2]);
++		res = 0;
++		fclose(LOADAVG);
++	}
++
++	for (i = 0; (i < nelem) && (i < 3); i++) {
++		loadavg[i] = avg[i];
++	}
++
++	return res;
+ }
+ 
+ void os::pause() {
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-jdk-iconv-uclibc.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-jdk-iconv-uclibc.patch
new file mode 100644
index 0000000..68f8581
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-jdk-iconv-uclibc.patch
@@ -0,0 +1,39 @@
+Index: openjdk/jdk/make/java/npt/Makefile
+===================================================================
+--- openjdk/jdk/make/java/npt/Makefile	2010-06-13 15:11:02.598512448 +0200
++++ openjdk/jdk/make/java/npt/Makefile	2010-06-13 15:11:28.504759286 +0200
+@@ -65,6 +65,8 @@
+ # We don't want to link against -ljava
+ JAVALIB=
+ 
++LDLIBS += -liconv
++
+ # Add -export options to explicitly spell exported symbols
+ ifeq ($(PLATFORM), windows)
+   OTHER_LCF += -export:nptInitialize -export:nptTerminate
+Index: icedtea6-1.8/openjdk-ecj/jdk/make/java/instrument/Makefile
+===================================================================
+--- openjdk/jdk/make/java/instrument/Makefile	2010-06-13 15:12:14.688505195 +0200
++++ openjdk/jdk/make/java/instrument/Makefile	2010-06-13 15:12:32.641425670 +0200
+@@ -123,6 +123,8 @@
+ # We don't want to link against -ljava
+ JAVALIB=
+ 
++LDLIBS += -liconv
++
+ #
+ # Add to ambient vpath so we pick up the library files
+ #
+Index: openjdk/jdk/make/sun/splashscreen/Makefile
+===================================================================
+--- openjdk/jdk/make/sun/splashscreen/Makefile	2010-06-13 15:12:48.951840824 +0200
++++ openjdk/jdk/make/sun/splashscreen/Makefile	2010-06-13 15:13:01.191422891 +0200
+@@ -55,6 +55,8 @@
+ 
+ JAVALIB=
+ 
++LDLIBS += -liconv
++
+ #
+ # C Flags
+ #
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-jdk-remove-unused-backtrace.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-jdk-remove-unused-backtrace.patch
new file mode 100644
index 0000000..5423fde
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-jdk-remove-unused-backtrace.patch
@@ -0,0 +1,41 @@
+Index: openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c
+===================================================================
+--- openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c	2010-08-05 16:45:56.607257503 +0200
++++ openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c	2010-08-05 16:47:19.727254686 +0200
+@@ -27,9 +27,6 @@
+ #include <X11/Xutil.h>
+ #include <X11/Xos.h>
+ #include <X11/Xatom.h>
+-#ifdef __linux__
+-#include <execinfo.h>
+-#endif
+ 
+ #include <jvm.h>
+ #include <jni.h>
+@@ -689,26 +686,6 @@
+     return ret;
+ }
+ 
+-#ifdef __linux__
+-void print_stack(void)
+-{
+-  void *array[10];
+-  size_t size;
+-  char **strings;
+-  size_t i;
+-
+-  size = backtrace (array, 10);
+-  strings = backtrace_symbols (array, size);
+-
+-  fprintf (stderr, "Obtained %zd stack frames.\n", size);
+-
+-  for (i = 0; i < size; i++)
+-     fprintf (stderr, "%s\n", strings[i]);
+-
+-  free (strings);
+-}
+-#endif
+-
+ Window get_xawt_root_shell(JNIEnv *env) {
+   static jclass classXRootWindow = NULL;
+   static jmethodID methodGetXRootWindow = NULL;
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-jdk-unpack-uclibc.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-jdk-unpack-uclibc.patch
new file mode 100644
index 0000000..40564f0
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-jdk-unpack-uclibc.patch
@@ -0,0 +1,12 @@
+Index: openjdk/jdk/make/com/sun/java/pack/Makefile
+===================================================================
+--- openjdk/jdk/make/com/sun/java/pack/Makefile	2010-06-13 15:25:21.548426411 +0200
++++ openjdk/jdk/make/com/sun/java/pack/Makefile	2010-06-13 15:25:43.858007543 +0200
+@@ -103,6 +103,7 @@
+   OTHER_LDLIBS += $(LIBCXX) -lc
+ # setup the list of libraries to link in...
+ ifeq ($(PLATFORM), linux)
++  OTHER_LDLIBS  += -lpthread
+ ifeq ("$(CC_VER_MAJOR)", "3")
+   OTHER_LDLIBS  += -Wl,-Bstatic -lgcc_eh -Wl,-Bdynamic
+ endif
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-launcher-stdc++.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-launcher-stdc++.patch
new file mode 100644
index 0000000..b97745d
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-launcher-stdc++.patch
@@ -0,0 +1,13 @@
+Index: openjdk/hotspot/make/linux/makefiles/launcher.make
+===================================================================
+--- openjdk/hotspot/make/linux/makefiles/launcher.make	2011-12-20 10:33:37.000000000 +0100
++++ openjdk/hotspot/make/linux/makefiles/launcher.make	2011-12-20 10:37:54.055022618 +0100
+@@ -51,7 +51,7 @@
+ else
+   LAUNCHER.o                 = launcher.o
+   LFLAGS_LAUNCHER           += -L `pwd`
+-  LIBS_LAUNCHER             += -l$(JVM) $(LIBS)
++  LIBS_LAUNCHER             += -l$(JVM) $(LIBS) -lstdc++
+   ifeq ($(SHARK_BUILD), true)
+     LFLAGS_LAUNCHER += $(LLVM_LDFLAGS)
+     LIBS_LAUNCHER   += $(LLVM_LIBS)
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-libnet-renaming.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-libnet-renaming.patch
new file mode 100644
index 0000000..024969d
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-libnet-renaming.patch
@@ -0,0 +1,148 @@
+Index: openjdk/jdk/make/java/net/Makefile
+===================================================================
+--- openjdk/jdk/make/java/net/Makefile	2010-07-05 12:28:58.476625401 +0200
++++ openjdk/jdk/make/java/net/Makefile	2010-07-05 12:29:11.876625138 +0200
+@@ -25,7 +25,7 @@
+ 
+ BUILDDIR = ../..
+ PACKAGE = java.net
+-LIBRARY = net
++LIBRARY = javanet
+ PRODUCT = sun
+ include $(BUILDDIR)/common/Defs.gmk
+ 
+Index: openjdk/jdk/make/java/nio/Makefile
+===================================================================
+--- openjdk/jdk/make/java/nio/Makefile	2010-07-05 12:31:27.046626250 +0200
++++ openjdk/jdk/make/java/nio/Makefile	2010-07-05 12:32:06.647874890 +0200
+@@ -139,11 +139,11 @@
+ endif
+ ifeq ($(PLATFORM), linux)
+ COMPILER_WARNINGS_FATAL=true
+-OTHER_LDLIBS += -L$(LIBDIR)/$(LIBARCH) -ljava -lnet -lpthread -ldl
++OTHER_LDLIBS += -L$(LIBDIR)/$(LIBARCH) -ljava -ljavanet -lpthread -ldl
+ endif
+ ifeq ($(PLATFORM), solaris)
+ OTHER_LDLIBS += $(JVMLIB) $(LIBSOCKET) -lposix4 -ldl \
+-		-L$(LIBDIR)/$(LIBARCH) -ljava -lnet
++		-L$(LIBDIR)/$(LIBARCH) -ljava -ljavanet
+ endif # PLATFORM
+ 
+ #
+Index: openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.java
+===================================================================
+--- openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.java	2010-07-05 17:40:56.467876415 +0200
++++ openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.java	2010-07-05 17:41:43.326628410 +0200
+@@ -58,7 +58,7 @@
+      */
+     static {
+         java.security.AccessController.doPrivileged(
+-                  new sun.security.action.LoadLibraryAction("net"));
++                  new sun.security.action.LoadLibraryAction("javanet"));
+     }
+ 
+     /**
+Index: openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java
+===================================================================
+--- openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java	2010-07-05 17:41:01.027875484 +0200
++++ openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java	2010-07-05 17:41:56.826626386 +0200
+@@ -74,7 +74,7 @@
+      */
+     static {
+         java.security.AccessController.doPrivileged(
+-                  new sun.security.action.LoadLibraryAction("net"));
++                  new sun.security.action.LoadLibraryAction("javanet"));
+     }
+ 
+     /**
+Index: openjdk/jdk/src/share/classes/java/net/DatagramPacket.java
+===================================================================
+--- openjdk/jdk/src/share/classes/java/net/DatagramPacket.java	2010-07-05 17:41:02.017875980 +0200
++++ openjdk/jdk/src/share/classes/java/net/DatagramPacket.java	2010-07-05 17:42:06.057875677 +0200
+@@ -47,7 +47,7 @@
+      */
+     static {
+         java.security.AccessController.doPrivileged(
+-                  new sun.security.action.LoadLibraryAction("net"));
++                  new sun.security.action.LoadLibraryAction("javanet"));
+         init();
+     }
+ 
+Index: openjdk/jdk/src/share/classes/java/net/InetAddress.java
+===================================================================
+--- openjdk/jdk/src/share/classes/java/net/InetAddress.java	2010-07-05 17:41:02.756626429 +0200
++++ openjdk/jdk/src/share/classes/java/net/InetAddress.java	2010-07-05 17:42:15.997875786 +0200
+@@ -230,7 +230,7 @@
+     static {
+         preferIPv6Address = java.security.AccessController.doPrivileged(
+             new GetBooleanAction("java.net.preferIPv6Addresses")).booleanValue();
+-        AccessController.doPrivileged(new LoadLibraryAction("net"));
++        AccessController.doPrivileged(new LoadLibraryAction("javanet"));
+         init();
+     }
+ 
+Index: openjdk/jdk/src/share/classes/java/net/NetworkInterface.java
+===================================================================
+--- openjdk/jdk/src/share/classes/java/net/NetworkInterface.java	2010-07-05 17:41:03.547875282 +0200
++++ openjdk/jdk/src/share/classes/java/net/NetworkInterface.java	2010-07-05 17:42:22.647875475 +0200
+@@ -52,7 +52,7 @@
+     private boolean virtual = false;
+ 
+     static {
+-        AccessController.doPrivileged(new LoadLibraryAction("net"));
++        AccessController.doPrivileged(new LoadLibraryAction("javanet"));
+         init();
+     }
+ 
+Index: openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java
+===================================================================
+--- openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java	2010-07-05 17:41:04.306628153 +0200
++++ openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java	2010-07-05 17:42:32.666627264 +0200
+@@ -89,7 +89,7 @@
+                 }});
+         if (b != null && b.booleanValue()) {
+             java.security.AccessController.doPrivileged(
+-                      new sun.security.action.LoadLibraryAction("net"));
++                      new sun.security.action.LoadLibraryAction("javanet"));
+             hasSystemProxies = init();
+         }
+     }
+Index: henning/bug/com.buglabs.build.oe/tmp/work/armv7a-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8-r3.3/openjdk-src-dir/jdk/src/share/classes/sun/nio/ch/Util.java
+===================================================================
+--- openjdk/jdk/src/share/classes/sun/nio/ch/Util.java	2010-07-05 17:41:05.086626745 +0200
++++ openjdk/jdk/src/share/classes/sun/nio/ch/Util.java	2010-07-05 17:42:39.266626410 +0200
+@@ -354,7 +354,7 @@
+                 return;
+             loaded = true;
+             java.security.AccessController
+-                .doPrivileged(new sun.security.action.LoadLibraryAction("net"));
++                .doPrivileged(new sun.security.action.LoadLibraryAction("javanet"));
+             java.security.AccessController
+                 .doPrivileged(new sun.security.action.LoadLibraryAction("nio"));
+             // IOUtil must be initialized; Its native methods are called from
+Index: openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java
+===================================================================
+--- openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java	2010-07-05 17:41:05.896626691 +0200
++++ openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java	2010-07-05 17:42:45.606625991 +0200
+@@ -244,7 +244,7 @@
+ 
+     static {
+         java.security.AccessController.doPrivileged(
+-            new sun.security.action.LoadLibraryAction("net"));
++            new sun.security.action.LoadLibraryAction("javanet"));
+     }
+ 
+ }
+Index: henning/bug/com.buglabs.build.oe/tmp/work/armv7a-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8-r3.3/openjdk-src-dir/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java
+===================================================================
+--- openjdk/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java	2010-07-05 17:41:06.786627210 +0200
++++ openjdk/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java	2010-07-05 17:42:51.926627747 +0200
+@@ -160,7 +160,7 @@
+ 
+     static {
+         java.security.AccessController.doPrivileged(
+-            new sun.security.action.LoadLibraryAction("net"));
++            new sun.security.action.LoadLibraryAction("javanet"));
+         init0();
+ 
+         // start the address listener thread
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-remove_werror.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-remove_werror.patch
new file mode 100644
index 0000000..f2ad035
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-remove_werror.patch
@@ -0,0 +1,14 @@
+Index: openjdk/hotspot/make/linux/makefiles/gcc.make
+===================================================================
+--- openjdk/hotspot/make/linux/makefiles/gcc.make	2010-02-02 16:11:35.758533706 +0100
++++ openjdk/hotspot/make/linux/makefiles/gcc.make	2010-02-02 16:11:42.761456458 +0100
+@@ -98,9 +98,6 @@
+   CFLAGS += -pipe
+ endif
+ 
+-# Compiler warnings are treated as errors
+-WARNINGS_ARE_ERRORS = -Werror
+-
+ # Except for a few acceptable ones
+ # Since GCC 4.3, -Wconversion has changed its meanings to warn these implicit
+ # conversions which might affect the values. To avoid that, we need to turn
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-shark-arm-linux-cpu-detection.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-shark-arm-linux-cpu-detection.patch
new file mode 100644
index 0000000..f40bc51
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-shark-arm-linux-cpu-detection.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-unbreak-float.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-unbreak-float.patch
new file mode 100644
index 0000000..9f875de
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-unbreak-float.patch
@@ -0,0 +1,18 @@
+Index: openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h
+===================================================================
+--- openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h	2010-02-02 13:49:39.972718207 +0100
++++ openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h	2010-02-02 13:50:04.635639302 +0100
+@@ -27,13 +27,11 @@
+ 
+ #include "jfdlibm.h"
+ 
+-#ifdef __NEWVALID       /* special setup for Sun test regime */
+ #if defined(i386) || defined(i486) || \
+         defined(intel) || defined(x86) || \
+         defined(i86pc) || defined(_M_IA64) || defined(ia64)
+ #define _LITTLE_ENDIAN
+ #endif
+-#endif
+ 
+ #ifdef _LITTLE_ENDIAN
+ #define __HI(x) *(1+(int*)&x)
diff --git a/recipes/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch b/recipes/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch
new file mode 100644
index 0000000..ec10e69
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch
@@ -0,0 +1,41 @@
+Index: openjdk/hotspot/make/linux/makefiles/zeroshark.make
+===================================================================
+--- openjdk/hotspot/make/linux/makefiles/zeroshark.make	2011-12-20 18:24:38.000000000 +0100
++++ openjdk/hotspot/make/linux/makefiles/zeroshark.make	2011-12-20 18:31:22.584884637 +0100
+@@ -32,13 +32,20 @@
+ Obj_Files += thumb2.o
+ 
+ CFLAGS += -DHOTSPOT_ASM
++CCFLAGS += -DHOTSPOT_ASM
++
++ifeq ($(CROSS_COMPILATION), true)
++	C_COMPILE_FOR_MKBC = $(CC_FOR_BUILD)
++else
++	C_COMPILE_FOR_MKBC = $(C_COMPILE)
++endif
+ 
+ cppInterpreter_arm.o:	offsets_arm.s bytecodes_arm.s
+ thumb2.o:		offsets_arm.s
+ 
+ offsets_arm.s:	mkoffsets
+ 	@echo Generating assembler offsets
+-	./mkoffsets > $@
++	$(QEMU) ./mkoffsets > $@
+ 
+ bytecodes_arm.s: bytecodes_arm.def mkbc
+ 	@echo Generatine ARM assembler bytecode sequences
+@@ -46,12 +53,12 @@
+ 
+ mkbc:	$(GAMMADIR)/tools/mkbc.c
+ 	@echo Compiling mkbc tool
+-	$(CC_COMPILE) -o $@ $< $(COMPILE_DONE)
++	$(C_COMPILE_FOR_MKBC) -o $@ $< $(COMPILE_DONE)
+ 
+ mkoffsets:	asm_helper.cpp
+ 	@echo Compiling offset generator
+ 	$(QUIETLY) $(REMOVE_TARGET)
+-	$(CC_COMPILE) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) -static -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
+ 
+ endif
+ 
diff --git a/recipes/openjdk/openjdk-6-6b24/jvm.cfg b/recipes/openjdk/openjdk-6-6b24/jvm.cfg
new file mode 100644
index 0000000..ea97cda
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b24/jvm.cfg
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
diff --git a/recipes/openjdk/openjdk-6-common.inc b/recipes/openjdk/openjdk-6-common.inc
index 59a7a56..f6d3c34 100644
--- a/recipes/openjdk/openjdk-6-common.inc
+++ b/recipes/openjdk/openjdk-6-common.inc
@@ -10,7 +10,7 @@ ICEDTEA = "NEEDS TO BE SET"
 S = "${WORKDIR}/${ICEDTEA}"
 B = "${S}/build"
 
-INC_PR = "r12"
+INC_PR = "r13"
 
 SRC_URI = "\
   ${ICEDTEA_URI} \
@@ -24,6 +24,8 @@ SRC_URI = "\
   file://jvm.cfg \
   "
 
+FILESPATHPKG =. "openjdk-6-${PV}:"
+
 JDKPN = "openjdk-6"
 JDK_DIR = "java-6-openjdk"
 
@@ -33,21 +35,23 @@ PROVIDES += "${JDKPN} ${PACKAGES}"
 DEPENDS = "giflib libpng jpeg cups \
 	   xalan-j xerces-j rhino \
 	   freetype libxinerama libxt libxp libxrender libxtst libxi \
-	   ant-native alsa-lib libffi \
-	   icedtea6-native fastjar \
-           llvm2.7 cacaoh-openjdk-native \
+	   alsa-lib libffi llvm2.7 \
+           ant-native \
+           fastjar-native \
+	   icedtea6-native \
+           cacaoh-openjdk-native \
            zip-native \
-	 "
+          "
+
+DEPENDS_append_libc-uclibc = " libiconv "
 
 # The OpenJDK build with interpreter optimizations for ARM depends on a binary
 # that generates constants for an assembler source file. There is no other
 # way than to generate this on a pseudo machine. Cross-compiling would not help
 # because structure sizes and/or alignment may differ.
-DEPENDS_append_arm = " qemu-native "
+DEPENDS_append = " qemu-native "
 
 
-FILESPATHPKG =. "openjdk-6-${PV}:"
-
 # No package should directly depend on this (it should require
 # java2-runtime instead).
 PRIVATE_LIBS = "\
@@ -62,10 +66,10 @@ PRIVATE_LIBS = "\
 	libversionCheck.so libcompiledMethodLoad.so libgctest.so \
 	libheapViewer.so libheapTracker.so libminst.so libmtrace.so \
 	libwaiters.so libhprof.so \
-"
+       "
 
 
-inherit java autotools
+inherit java autotools gettext qemu
 
 export ALT_CUPS_HEADERS_PATH = "${STAGING_INCDIR}"
 export ALT_FREETYPE_HEADERS_PATH = "${STAGING_INCDIR}/freetype2"
@@ -86,7 +90,7 @@ EXTRA_OECONF = "\
 	--with-java=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/java \
 	--with-javac=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/javac \
 	--with-javah=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/javah \
-	--with-jar=${STAGING_BINDIR_NATIVE}/fastjar \
+	--with-jar=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/jar \
 	--with-rmic=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/rmic \
 	--with-xalan2-jar=${STAGING_DATADIR_JAVA}/xalan2.jar \
 	--with-xalan2-serializer-jar=${STAGING_DATADIR_JAVA}/serializer.jar \
@@ -101,7 +105,7 @@ EXTRA_OECONF = "\
 	--with-pkgversion=${PV} \
 	--with-cc-for-build=${BUILD_CC} \
         --enable-zero \
-        --with-additional-vms=shark,cacao \
+        --with-additional-vms=${WITH_ADDITIONAL_VMS} \
         --enable-openjdk-cross-compilation \
        "
 
@@ -114,8 +118,8 @@ def get_jdk_arch(d):
   jdk_arch = bb.data.getVar('TARGET_ARCH', d, 1)
   if jdk_arch == "x86_64":
     jdk_arch = "amd64"
-  elif (jdk_arch == "i586" or jdk_arch == "i686"):
-    jdk_arch = "i586"
+  elif (jdk_arch == "i486" or jdk_arch == "i586" or jdk_arch == "i686"):
+    jdk_arch = "i386"
 
   return jdk_arch
 
@@ -150,12 +154,12 @@ def get_llvm_configure_arch(d):
     arch = "x86"
   elif arch == "arm":
     arch = "arm"
-  elif arch == "mipsel":
+  elif arch == "mipsel" or arch == "mips":
     arch = "mips"
   elif arch == "powerpc":
     arch = "powerpc"
   else:
-    oefatal("Your target architecture is not supported by this recipe");
+    oefatal("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
 
   return arch
 
@@ -178,7 +182,7 @@ do_configure_prepend() {
   ln -sf ${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/jre/lib/rt.jar ${WORKDIR}/fake-jdk/jre/lib/rt.jar
 
   symlinked=false
-  oenote "Creating symlinks for fake-jdk"
+  echo "Creating symlinks for fake-jdk"
   mkdir -p ${WORKDIR}/fake-jdk/include
   for i in `find ${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/include` ;do
 	bn=`basename $i`
@@ -195,7 +199,7 @@ do_configure_prepend() {
   then
     oefatal "Build b0rken! Have not created any symlinks for fake-jdk!"
   else
-	oenote "fake-jdk setup appears sane."
+    oenote "fake-jdk setup appears sane."
   fi
 }
 
@@ -248,19 +252,16 @@ export WANT_LLVM_RELEASE = "2.7"
 # Provides the target architecture to the configure script.
 export LLVM_CONFIGURE_ARCH="${@get_llvm_configure_arch(d)}"
 
-OE_LAUNCHER_LDFLAGS = "-Wl,-rpath-link,${STAGING_LIBDIR}/llvm2.7"
+OE_LAUNCHER_LDFLAGS = "-Wl,-rpath-link,${STAGING_LIBDIR}/llvm${WANT_LLVM_RELEASE} -Wl,-rpath,/usr/lib/llvm${WANT_LLVM_RELEASE}"
 
 EXTRA_OEMAKE += 'OE_LAUNCHER_LDFLAGS="${OE_LAUNCHER_LDFLAGS}"'
 
 
 # Large stack is required at least on x86_64 host, otherwise random segfaults appear:
-QEMU = "qemu-${TARGET_ARCH} ${QEMU_OPTIONS} -s 1048576 -L ${STAGING_DIR_TARGET}"
+QEMU = "${@qemu_target_binary(d)} ${QEMU_OPTIONS} -s 1048576 -L ${STAGING_DIR_TARGET}"
 
 EXTRA_OEMAKE += 'QEMU="${QEMU}"'
 
-# Name of the directory containing the compiled output
-BUILD_DIR = "build/linux-${JDK_ARCH}"
-
 # The build of OpenJDK is a 3-part process. For better restartability and overrideability they have been split into
 # three functions.
 # 1. compile Hotspot or Cacao (this one is supposed to be implemented according to wanted VM)
@@ -282,12 +283,12 @@ do_compilestepone() {
         rm -rf bootstrap/ecj/jre/lib/${JDK_ARCH} || true
 
                 # Provide a symlink to the target arch's libjvm.so (to link against)
-        ln -s `pwd`/openjdk-ecj/${BUILD_DIR}/j2sdk-image/jre/lib/${JDK_ARCH} bootstrap/jdk1.6.0/jre/lib/${JDK_ARCH}
+        ln -s `pwd`/${BUILD_DIR_ECJ}/j2sdk-image/jre/lib/${JDK_ARCH} bootstrap/jdk1.6.0/jre/lib/${JDK_ARCH}
 
         # fake j2sdk-image
-        rm openjdk-ecj/${BUILD_DIR}/j2sdk-image/include || true
-        cp -ar openjdk-ecj/${BUILD_DIR}/hotspot/import/include openjdk-ecj/${BUILD_DIR}/j2sdk-image/
-        install -d openjdk-ecj/${BUILD_DIR}/j2sdk-image/bin
+        rm ${BUILD_DIR_ECJ}/j2sdk-image/include || true
+        cp -ar ${BUILD_DIR_ECJ}/hotspot/import/include ${BUILD_DIR_ECJ}/j2sdk-image/
+        install -d ${BUILD_DIR_ECJ}/j2sdk-image/bin
 }
 addtask compilestepone after do_configure before do_compilesteptwo
 
@@ -299,7 +300,7 @@ do_compilesteptwo() {
 	rm stamps/icedtea-against-ecj.stamp stamps/icedtea-ecj.stamp || true
 	oe_runmake icedtea-against-ecj
 
-	ln -sf ../openjdk-ecj/${BUILD_DIR}/j2sdk-image bootstrap/icedtea
+	ln -sf ../${BUILD_DIR_ECJ}/j2sdk-image bootstrap/icedtea
 
 	#	Replace all executables with symlinks to their native equivalents.
 	for F in `find ${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin -type f`
@@ -321,7 +322,7 @@ do_compile() {
 
 do_install() {
 	install -d ${D}${libdir_jvm}
-	cp -R ${S}/build/openjdk/${BUILD_DIR}/j2sdk-image ${D}${JDK_HOME}
+	cp -R ${S}/build/${BUILD_DIR}/j2sdk-image ${D}${JDK_HOME}
 
 	chmod u+rw -R ${D}${JDK_HOME}
 
@@ -342,11 +343,6 @@ do_install() {
         install -m644 ${WORKDIR}/jvm.cfg  ${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
 }
 
-# Manual staging step that is only needed for oe-stable.
-do_stage() {
-          :
-}
-
 # Notes about the ideas behind packaging:
 # 1) User should install openjdk-6-jre. This is a provider of 'java2-runtime'.
 # 2) This lets package mgmt install: openjdk-6-java
@@ -370,6 +366,7 @@ PACKAGES = " \
             ${JDKPN}-vm-shark \
             ${JDKPN}-vm-zero \
             ${JDKPN}-vm-cacao \
+	    ${JDKPN}-vm-jamvm \
             ${JDKPN}-common \
            "
 
@@ -405,11 +402,13 @@ FILES_${JDKPN}-source = "${JDK_HOME}/src.zip"
 
 FILES_${JDKPN}-java = "${JDK_HOME}/jre/bin/java"
 
-FILES_${JDKPN}-vm-zero = "${JDK_HOME}/jre/lib/arm/server/"
+FILES_${JDKPN}-vm-zero = "${JDK_HOME}/jre/lib/${JDK_ARCH}/server/"
 
-FILES_${JDKPN}-vm-shark = "${JDK_HOME}/jre/lib/arm/shark/"
+FILES_${JDKPN}-vm-shark = "${JDK_HOME}/jre/lib/${JDK_ARCH}/shark/"
 
-FILES_${JDKPN}-vm-cacao = "${JDK_HOME}/jre/lib/arm/cacao/"
+FILES_${JDKPN}-vm-cacao = "${JDK_HOME}/jre/lib/${JDK_ARCH}/cacao/"
+
+FILES_${JDKPN}-vm-jamvm = "${JDK_HOME}/jre/lib/${JDK_ARCH}/jamvm/"
 
 FILES_${JDKPN}-common = "${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
                           ${JDK_HOME}/jre/THIRD_PARTY_README \
@@ -435,18 +434,28 @@ RDEPENDS_${JDKPN}-common = "librhino-java"
 RPROVIDES_${JDKPN}-vm-shark = "java2-vm"
 RPROVIDES_${JDKPN}-vm-zero = "java2-vm"
 RPROVIDES_${JDKPN}-vm-cacao = "java2-vm"
+RPROVIDES_${JDKPN}-vm-jamvm = "java2-vm"
 
-RDEPENDS_${JDKPN}-java = "java2-vm"
+# Even though a vm is a hard dependency it is set as RRECOMMENDS so a single vm can get uninstalled:
+# root@beaglebone:~/java# opkg remove openjdk-6-vm-shark
+# No packages removed.
+# Collected errors:
+#  * print_dependents_warning: Package openjdk-6-vm-shark is depended upon by packages:
+#  * print_dependents_warning: 	openjdk-6-java
+#  * print_dependents_warning: These might cease to work if package openjdk-6-vm-shark is removed.
+RRECOMMENDS_${JDKPN}-java = "java2-vm"
 
 # For some reason shark and cacao do not automatically depends on -common.
 # So we add that manually.
 RDEPENDS_${JDKPN}-vm-shark = "${JDKPN}-common"
 RDEPENDS_${JDKPN}-vm-cacao = "${JDKPN}-common"
+RDEPENDS_${JDKPN}-vm-jamvm = "${JDKPN}-common"
 
 # There is a symlink to a .so but this one is valid.
 INSANE_SKIP_${JDKPN}-vm-shark = "1"
 INSANE_SKIP_${JDKPN}-vm-zero = "1"
 INSANE_SKIP_${JDKPN}-vm-cacao = "1"
+INSANE_SKIP_${JDKPN}-vm-jamvm = "1"
 INSANE_SKIP_${JDKPN}-common = "1"
 
 FILES_${JDKPN}-jdk = " \
@@ -462,53 +471,75 @@ RDEPENDS_${JDKPN}-jdk = "${JDKPN}-jre"
 FILES_${JDKPN}-doc = "${JDK_HOME}/man"
 
 pkg_postinst_${JDKPN}-vm-shark () {
-        if  grep -q "\-cacao KNOWN" ${JDK_HOME}/jre/lib/arm/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/arm/jvm.cfg; then
-          sed -i -e "/\-cacao KNOWN/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
-          echo "-cacao KNOWN" >> ${JDK_HOME}/jre/lib/arm/jvm.cfg
+        if grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+          sed -i -e "/\-shark.*/d" -e "s|\(^\-server*\)|\-shark KNOWN\n\1|" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+	else
+          sed -i -e "s/\-shark.*/\-shark KNOWN/" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
         fi 
-
-	sed -i -e "/\-shark.*/d" -e "s|\(^\-server*\)|\-shark KNOWN\n\1|" -e "/^$/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
 }
 
 pkg_prerm_${JDKPN}-vm-shark () {
-	sed -i -e "/^\-shark.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg 
-        if  grep -q "\-cacao KNOWN" ${JDK_HOME}/jre/lib/arm/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/arm/jvm.cfg; then
-          sed -i -e "/\-cacao KNOWN/d" -e  "s|\(^\-server*\)|\-cacao KNOWN\n\1|" ${JDK_HOME}/jre/lib/arm/jvm.cfg
+	sed -i -e "/^\-shark.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+        if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+          FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -1`
+          sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
         fi
+
+        echo "-shark ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
 }
 
 pkg_postinst_${JDKPN}-vm-cacao () {
-        if  grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/arm/jvm.cfg && ! grep -q "\-shark KNOWN" ${JDK_HOME}/jre/lib/arm/jvm.cfg; then
-          sed -i -e "/\-cacao.*/d" -e  "s|\(^\-server*\)|\-cacao KNOWN\n\1|" -e "/^$/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
-        else 
-	  sed -i -e "s|^\-cacao.*|\-cacao KNOWN|" -e "/^$/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
+        if grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+          sed -i -e "/\-cacao.*/d" -e "s|\(^\-server*\)|\-cacao KNOWN\n\1|" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+	else
+          sed -i -e "s/\-cacao.*/\-cacao KNOWN/" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
         fi
 }
 
 pkg_prerm_${JDKPN}-vm-cacao () {
-     if  grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/arm/jvm.cfg && ! grep -q "\-shark KNOWN" ${JDK_HOME}/jre/lib/arm/jvm.cfg; then
-	sed -i -e "/\-cacao.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
-        echo "-cacao ERROR" >> ${JDK_HOME}/jre/lib/arm/jvm.cfg
-      else
-	sed -i -e "s|^\-cacao.*|\-cacao ERROR|" -e "/^$/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
-      fi
+	sed -i -e "/^\-cacao.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+        if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+          FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -1`
+          sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+        fi
+
+        echo "-cacao ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+}
+
+pkg_postinst_${JDKPN}-vm-jamvm () {
+        if grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+          sed -i -e "/\-jamvm.*/d" -e "s|\(^\-server*\)|\-jamvm KNOWN\n\1|" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+	else
+          sed -i -e "s/\-jamvm.*/\-jamvm KNOWN/" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+        fi 
+}
+
+pkg_prerm_${JDKPN}-vm-jamvm () {
+	sed -i -e "/^\-jamvm.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+        if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+          FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -1`
+          sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+        fi
+
+        echo "-jamvm ERROR" >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
 }
 
 pkg_postinst_${JDKPN}-vm-zero () {
- if  grep -q "\-cacao KNOWN" ${JDK_HOME}/jre/lib/arm/jvm.cfg  && ! grep -q "\-shark KNOWN" ${JDK_HOME}/jre/lib/arm/jvm.cfg; then
-   sed -i -e "/\-cacao KNOWN/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
-   echo "-cacao KNOWN" >> ${JDK_HOME}/jre/lib/arm/jvm.cfg
- fi
+        if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+           FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -1`
+           sed -i -e "/${FIRST_KNOWN}/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+           echo ${FIRST_KNOWN} >> ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+        fi
 
- sed -i -e "s|^\-server.*|\-server KNOWN|" -e "/^$/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
+        sed -i -e "s|^\-server.*|\-server KNOWN|" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
 }
 
 pkg_prerm_${JDKPN}-vm-zero () {
- if  grep -q "\-cacao KNOWN" ${JDK_HOME}/jre/lib/arm/jvm.cfg  && ! grep -q "\-shark KNOWN" ${JDK_HOME}/jre/lib/arm/jvm.cfg; then
-   sed -i -e "/\-cacao KNOWN/d" -e  "s|\(^\-server*\)|\-cacao KNOWN\n\1|" ${JDK_HOME}/jre/lib/arm/jvm.cfg
- fi
-
- sed -i -e "s|^\-server.*|\-server ERROR|" -e "/^$/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
+	sed -i -e "/^\-server.*/\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+        if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
+          FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -1`
+          sed -i -e "/${FIRST_KNOWN}/d" -e  "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
+        fi
 }
 
 pkg_postinst_${JDKPN}-jre () {
diff --git a/recipes/openjdk/openjdk-6-release-6b24.inc b/recipes/openjdk/openjdk-6-release-6b24.inc
new file mode 100644
index 0000000..74ac277
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-release-6b24.inc
@@ -0,0 +1,115 @@
+require openjdk-6-common.inc
+
+# needed for dis-asm.h
+# if shark is needed
+# DEPENDS += "binutils"
+
+SRC_URI += "${JAMVM_URI}"
+
+EXTRA_OECONF += "\
+        --with-jdk-home=${WORKDIR}/fake-jdk \
+	--with-jar=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/jar \
+	--with-out-rhino \
+	--with-jaxws-drop-zip=${DL_DIR}/${JAXWS_FILE} \ 
+	--with-jaf-drop-zip=${DL_DIR}/${JAF_FILE} \
+	--with-jaxp-drop-zip=${DL_DIR}/${JAXP_FILE} \
+	--with-cacao-src-zip=${DL_DIR}/${CACAO_VERSION}.tar.gz \
+	--with-jamvm-src-zip=${DL_DIR}/jamvm-${JAMVM_VERSION}.tar.gz \
+	--with-openjdk-src-zip=${DL_DIR}/openjdk-6-src-${OPENJDK_VERSION}-${OPENJDK_DATE}.tar.gz \
+"
+
+# List of additional JVM to include in the build.
+WITH_ADDITIONAL_VMS = "cacao,jamvm"
+
+# Name of the directory containing the compiled output
+BUILD_DIR = "openjdk.build"
+BUILD_DIR_ECJ = "openjdk.build-ecj"
+
+# Force arm mode for now
+ARM_INSTRUCTION_SET_armv4t = "ARM"
+
+ICEDTEA_URI = "http://icedtea.classpath.org/download/source/${ICEDTEA}.tar.gz;name=iced"
+
+OPENJDK_VERSION = "b24"
+OPENJDK_DATE = "14_nov_2011"
+OPENJDK_URI = "http://download.java.net/openjdk/jdk6/promoted/${OPENJDK_VERSION}/openjdk-6-src-${OPENJDK_VERSION}-${OPENJDK_DATE}.tar.gz;subdir=openjdk-src-dir;name=openjdk"
+SRC_URI[openjdk.md5sum] = "0eabdd360169144336e50081b8d01001"
+SRC_URI[openjdk.sha256sum] = "f84e7f0938f4939660ff8f9c2aa164d301faa8a519f2324ceb05ad34b2e09227"
+
+JAXWS_FILE = "jdk6-jaxws2_1_6-2011_06_13.zip"
+JAXWS_URI = "http://icedtea.classpath.org/download/drops/${JAXWS_FILE};name=jaxws"
+SRC_URI[jaxws.md5sum] = "8fd91b09b643a19a912b8a75e7a7a9d5"
+SRC_URI[jaxws.sha256sum] = "229040544e791f44906e8e7b6f6faf503c730a5d854275135f3925490d5c3be3"
+
+JAF_FILE = "jdk6-jaf-b20.zip"
+JAF_URI = "http://icedtea.classpath.org/download/drops/${JAF_FILE};name=jaf"
+SRC_URI[jaf.md5sum] = "bc95c133620bd68c161cac9891592901"
+SRC_URI[jaf.sha256sum] = "78c7b5c9d6271e88ee46abadd018a61f1e9645f8936cc8df1617e5f4f5074012"
+
+JAXP_FILE = "jaxp144_03.zip"
+JAXP_URI = "http://icedtea.classpath.org/download/drops/${JAXP_FILE};name=jaxp"
+SRC_URI[jaxp.md5sum] = "9eea471ad474040265c688858fcf09aa"
+SRC_URI[jaxp.sha256sum] = "c1a5348e17b330a7e4b18431e61a40efd2ba99a7da71102cf2c604478ef96012"
+
+CACAO_URI = "http://icedtea.classpath.org/download/drops/cacao/${CACAO_VERSION}.tar.gz;name=cacao"
+
+JAMVM_URI = "http://icedtea.classpath.org/download/drops/jamvm/jamvm-${JAMVM_VERSION}.tar.gz;name=jamvm"
+
+# Allow overriding this separately
+OEPATCHES = "\
+	file://build-hacks.patch \
+	file://cacao-libtoolize.patch \
+	file://cacao-loadavg-makefile.patch \
+	file://fix_hotspot_crosscompile.patch \
+	file://cacao-loadavg.patch;apply=no \
+	"
+
+# Allow overriding this separately
+ICEDTEAPATCHES = "\
+	file://icedtea-launcher-stdc++.patch;apply=no \
+	file://icedtea-crosscompile-fix.patch;apply=no \
+	file://icedtea-hostbuildcc.patch;apply=no \
+	file://icedtea-unbreak-float.patch;apply=no \
+	file://icedtea-remove_werror.patch;apply=no \
+        file://icedtea-libnet-renaming.patch;apply=no \
+	file://icedtea-fix-xrender.patch;apply=no \
+	file://icedtea-shark-arm-linux-cpu-detection.patch;apply=no \
+        file://icedtea-zero-hotspotfix.patch;apply=no \
+	"
+
+ICEDTEAPATCHES_append_libc-uclibc = " \
+        file://icedtea-hotspot-isfinte.patch;apply=no \
+        file://icedtea-hotspot-glibc-version.patch;apply=no \
+        file://icedtea-hotspot-loadavg.patch;apply=no \
+        file://icedtea-hotspot-isnanf.patch;apply=no \
+        file://icedtea-jdk-iconv-uclibc.patch;apply=no \
+        file://icedtea-jdk-remove-unused-backtrace.patch;apply=no \
+        file://icedtea-jdk-unpack-uclibc.patch;apply=no \
+	file://icedtea-hotspot-dlvsym-uclibc.patch;apply=no \
+        "
+
+# Allow overriding this separately
+DISTRIBUTION_PATCHES = "\
+	patches/icedtea-launcher-stdc++.patch \
+	patches/icedtea-crosscompile-fix.patch \
+	patches/icedtea-hostbuildcc.patch \
+	patches/icedtea-unbreak-float.patch \
+	patches/icedtea-remove_werror.patch \
+        patches/icedtea-libnet-renaming.patch \
+	patches/icedtea-fix-xrender.patch \
+	patches/icedtea-shark-arm-linux-cpu-detection.patch \
+	patches/icedtea-zero-hotspotfix.patch \
+	"
+
+DISTRIBUTION_PATCHES_append_libc-uclibc = "\
+        patches/icedtea-hotspot-isfinte.patch \
+        patches/icedtea-hotspot-isnanf.patch \
+        patches/icedtea-hotspot-glibc-version.patch \
+        patches/icedtea-hotspot-loadavg.patch \
+        patches/icedtea-jdk-iconv-uclibc.patch \
+        patches/icedtea-jdk-remove-unused-backtrace.patch \
+        patches/icedtea-jdk-unpack-uclibc.patch \
+	patches/icedtea-hotspot-dlvsym-uclibc.patch \
+        "
+
+export DISTRIBUTION_PATCHES
diff --git a/recipes/openjdk/openjdk-6/build-hacks.patch b/recipes/openjdk/openjdk-6/build-hacks.patch
new file mode 100644
index 0000000..02a8300
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/build-hacks.patch
@@ -0,0 +1,31 @@
+Index: icedtea6-1.8/Makefile.am
+===================================================================
+--- icedtea6-1.8.orig/Makefile.am	2010-04-12 23:55:51.754838172 +0200
++++ icedtea6-1.8/Makefile.am	2010-06-16 15:17:10.224708601 +0200
+@@ -477,6 +477,11 @@
+ 	JAVAC="" \
+ 	JAVA_HOME="" \
+ 	JDK_HOME="" \
++        OE_CFLAGS="$(OE_CFLAGS)" \
++        OE_CPPFLAGS="$(OE_CPPFLAGS)" \
++        OE_CXXFLAGS="$(OE_CXXFLAGS)" \
++        OE_LDFLAGS="$(OE_LDFLAGS)" \
++        OE_LAUNCHER_LDFLAGS="$(OE_LAUNCHER_LDFLAGS)" \
+ 	DISTRIBUTION_ID="$(DIST_ID)" \
+ 	DERIVATIVE_ID="$(ICEDTEA_NAME) $(PACKAGE_VERSION)$(ICEDTEA_REV)" \
+ 	DEBUG_CLASSFILES="true" \
+Index: icedtea6-1.8/javac.in
+===================================================================
+--- icedtea6-1.8.orig/javac.in	2010-03-25 15:10:41.714835519 +0100
++++ icedtea6-1.8/javac.in	2010-06-16 15:14:31.205334756 +0200
+@@ -35,7 +35,9 @@
+ elif [ ! -z "@ECJ@" ] ; then
+     @ECJ@ -1.5 -nowarn $bcoption $NEW_ARGS
+ else
++    # Compiling hotspot-tools consumes tons of memory and exceeds any default
++    # limits for jamvm and cacao.
+     CLASSPATH=@ECJ_JAR@${CLASSPATH:+:}$CLASSPATH \
+-     @JAVA@ org.eclipse.jdt.internal.compiler.batch.Main -1.5 -nowarn $bcoption $NEW_ARGS
++     @JAVA@ -Xmx1024m org.eclipse.jdt.internal.compiler.batch.Main -1.5 -nowarn $bcoption $NEW_ARGS
+ fi
+ 
diff --git a/recipes/openjdk/openjdk-6/cacao-disable-stackbase-check.patch b/recipes/openjdk/openjdk-6/cacao-disable-stackbase-check.patch
new file mode 100644
index 0000000..d676142
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/cacao-disable-stackbase-check.patch
@@ -0,0 +1,12 @@
+Index: cacao/cacao/src/mm/boehm-gc/os_dep.c
+===================================================================
+--- cacao/cacao/src/mm/boehm-gc/os_dep.c	2009-02-15 16:29:15.000000000 +0100
++++ cacao/cacao/src/mm/boehm-gc/os_dep.c	2009-02-15 16:29:24.000000000 +0100
+@@ -1077,7 +1077,6 @@
+       c = stat_buf[buf_offset++];
+     }
+     close(f);
+-    if (result < 0x10000000) ABORT("Absurd stack bottom value");
+     return (ptr_t)result;
+   }
+ 
diff --git a/recipes/openjdk/openjdk-6/cacao-libtoolize.patch b/recipes/openjdk/openjdk-6/cacao-libtoolize.patch
new file mode 100644
index 0000000..a153a32
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/cacao-libtoolize.patch
@@ -0,0 +1,18 @@
+Index: icedtea6-1.8.5/Makefile.am
+===================================================================
+--- icedtea6-1.8.5.orig/Makefile.am	2011-02-04 18:29:58.826701224 +0100
++++ icedtea6-1.8.5/Makefile.am	2011-02-04 18:31:53.430016002 +0100
+@@ -1918,10 +1918,13 @@
+ if BUILD_CACAO
+ if !USE_SYSTEM_CACAO
+ 	cd cacao/cacao && \
++        rm -f libtool && \
++        autoreconf --verbose --install --force --no-recursive && \
+ 	$(ARCH_PREFIX) ./configure \
+ 	  --host=$(host_alias) \
+ 	  --build=$(build_alias) \
+ 	  --target=$(target_alias) \
++          --with-libtool-sysroot \
+ 	  --prefix=$(abs_top_builddir)/cacao/install \
+ 	  --with-java-runtime-library=openjdk \
+ 	  --with-java-runtime-library-prefix=$(abs_top_builddir)/openjdk \
diff --git a/recipes/openjdk/openjdk-6/cacao-vfp-compat.patch b/recipes/openjdk/openjdk-6/cacao-vfp-compat.patch
new file mode 100644
index 0000000..09ba984
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/cacao-vfp-compat.patch
@@ -0,0 +1,37 @@
+Index: cacao/cacao/src/vm/jit/arm/codegen.c
+===================================================================
+--- cacao/cacao/src/vm/jit/arm/codegen.c	2008-10-01 16:23:21.439856241 +0200
++++ cacao/cacao/src/vm/jit/arm/codegen.c	2008-10-01 16:41:24.278841537 +0200
+@@ -2353,10 +2353,12 @@
+ 
+ 			d = md->returntype.type;
+ 
+-#if !defined(__SOFTFP__)
++#if !defined(__SOFTFP__) && !defined(__VFP_FP__)
+ 			/* TODO: this is only a hack, since we use R0/R1 for float
+ 			   return!  this depends on gcc; it is independent from
+-			   our ENABLE_SOFTFLOAT define */
++			   our ENABLE_SOFTFLOAT define
++			   It is only needed for -mfpu=fpa -mfloat-abi=hard!
++			 */
+ 			if (iptr->opc == ICMD_BUILTIN && d != TYPE_VOID && IS_FLT_DBL_TYPE(d)) {
+ #if 0 && !defined(NDEBUG)
+ 				dolog("BUILTIN that returns float or double (%s.%s)", m->clazz->name->text, m->name->text);
+@@ -3019,7 +3021,7 @@
+ 	s1 = (s4) (cd->mcodeptr - cd->mcodebase);
+ 	M_RECOMPUTE_PV(s1);
+ 
+-#if !defined(__SOFTFP__)
++#if !defined(__SOFTFP__) && !defined(__VFP_FP__)
+ 	/* TODO: this is only a hack, since we use R0/R1 for float return! */
+ 	/* this depends on gcc; it is independent from our ENABLE_SOFTFLOAT define */
+ 	if (md->returntype.type != TYPE_VOID && IS_FLT_DBL_TYPE(md->returntype.type)) {
+@@ -3030,7 +3032,7 @@
+ 		/* M_CAST_FLT_TO_INT_TYPED(md->returntype.type, REG_FRESULT, REG_RESULT_TYPED(md->returntype.type)); */
+ 		if (IS_2_WORD_TYPE(md->returntype.type)) {
+ 			DCD(0xed2d8102); /* stfd    f0, [sp, #-8]! */
+-			M_LDRD_UPDATE(REG_RESULT_PACKED, REG_SP, 8);
++ 			M_LDRD_UPDATE(REG_RESULT_PACKED, REG_SP, 8);
+ 		} else {
+ 			DCD(0xed2d0101); /* stfs    f0, [sp, #-4]!*/
+ 			M_LDR_UPDATE(REG_RESULT, REG_SP, 4);
diff --git a/recipes/openjdk/openjdk-6/fix-llvm-libs.patch b/recipes/openjdk/openjdk-6/fix-llvm-libs.patch
new file mode 100644
index 0000000..7c82daf
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/fix-llvm-libs.patch
@@ -0,0 +1,13 @@
+Index: icedtea6-1.8/configure.ac
+===================================================================
+--- icedtea6-1.8.orig/configure.ac
++++ icedtea6-1.8/configure.ac
+@@ -472,7 +472,7 @@
+     if test "x$LLVM_SHARED_LIB" != x && echo "$flag" | grep -q '^-lLLVM'; then
+       continue
+     fi
+-    if echo "$flag" | grep -q '^-l'; then
++    if echo "$flag" | grep -q '^-l\|.so'; then
+       if test "x$LLVM_LIBS" != "x"; then
+         LLVM_LIBS="$LLVM_LIBS "
+       fi
diff --git a/recipes/openjdk/openjdk-6/fix_hotspot_crosscompile.patch b/recipes/openjdk/openjdk-6/fix_hotspot_crosscompile.patch
new file mode 100644
index 0000000..38fb191
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/fix_hotspot_crosscompile.patch
@@ -0,0 +1,94 @@
+Index: icedtea6-1.8/Makefile.am
+===================================================================
+--- icedtea6-1.8.orig/Makefile.am	2010-06-18 12:31:34.534667003 +0200
++++ icedtea6-1.8/Makefile.am	2010-06-18 12:31:34.714667729 +0200
+@@ -488,6 +488,7 @@
+ 	DEBUG_BINARIES="true" \
+ 	ALT_DROPS_DIR="$(abs_top_builddir)/drops" \
+ 	VERBOSE="$(VERBOSE)" \
++	CC_FOR_BUILD="$(CC_FOR_BUILD)" \
+ 	ALT_NETX_DIST="$(abs_top_builddir)/netx.build" \
+ 	ALT_LIVECONNECT_DIST="$(abs_top_builddir)/liveconnect"
+ 
+Index: icedtea6-1.8/acinclude.m4
+===================================================================
+--- icedtea6-1.8.orig/acinclude.m4	2010-04-10 21:58:40.804836529 +0200
++++ icedtea6-1.8/acinclude.m4	2010-06-18 12:31:34.714667729 +0200
+@@ -900,6 +900,21 @@
+   AC_SUBST(ALT_CACAO_SRC_DIR)
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
+ AC_DEFUN([AC_CHECK_WITH_GCJ],
+ [
+   AC_MSG_CHECKING([whether to compile ecj natively])
+Index: icedtea6-1.8/configure.ac
+===================================================================
+--- icedtea6-1.8.orig/configure.ac	2010-04-12 13:46:18.821086023 +0200
++++ icedtea6-1.8/configure.ac	2010-06-18 12:31:34.724666321 +0200
+@@ -44,6 +44,7 @@
+ IT_CHECK_FOR_MERCURIAL
+ IT_OBTAIN_HG_REVISIONS
+ AC_PATH_TOOL([LSB_RELEASE],[lsb_release])
++AC_CHECK_WITH_CC_FOR_BUILD
+ AC_CHECK_WITH_GCJ
+ AC_CHECK_WITH_HOTSPOT_BUILD
+ AC_PATH_TOOL([LINUX32],[linux32])
+Index: icedtea6-1.8/ports/hotspot/make/linux/makefiles/zeroshark.make
+===================================================================
+--- icedtea6-1.8.orig/ports/hotspot/make/linux/makefiles/zeroshark.make	2010-03-25 15:10:42.061085966 +0100
++++ icedtea6-1.8/ports/hotspot/make/linux/makefiles/zeroshark.make	2010-06-18 12:40:42.834666505 +0200
+@@ -32,6 +32,13 @@
+ Obj_Files += thumb2.o
+ 
+ CFLAGS += -DHOTSPOT_ASM
++CCFLAGS += -DHOTSPOT_ASM
++
++ifeq ($(CROSS_COMPILATION), true)
++  C_COMPILE_FOR_MKBC = $(CC_FOR_BUILD)
++else
++  C_COMPILE_FOR_MKBC = $(C_COMPILE)
++endif
+ 
+ %.o: %.S
+ 	@echo Assembling $<
+@@ -43,20 +50,20 @@
+ 
+ offsets_arm.s:	mkoffsets
+ 	@echo Generating assembler offsets
+-	./mkoffsets > $@
++	$(QEMU) ./mkoffsets > $@
+ 
+ bytecodes_arm.s: bytecodes_arm.def mkbc
+ 	@echo Generatine ARM assembler bytecode sequences
+ 	$(CC_COMPILE) -E -x c++ - < $< | ./mkbc - $@ $(COMPILE_DONE)
+ 
+-mkbc:	$(GAMMADIR)/tools/mkbc.c
++mkbc: $(GAMMADIR)/tools/mkbc.c
+ 	@echo Compiling mkbc tool
+-	$(CC_COMPILE) -o $@ $< $(COMPILE_DONE)
++	$(C_COMPILE_FOR_MKBC) -o $@ $< $(COMPILE_DONE)
+ 
+-mkoffsets:	asm_helper.cpp
++mkoffsets: asm_helper.cpp
+ 	@echo Compiling offset generator
+ 	$(QUIETLY) $(REMOVE_TARGET)
+-	$(CC_COMPILE) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) -static -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
+ 
+ endif
+ 
diff --git a/recipes/openjdk/openjdk-6/icedtea-crosscompile-fix.patch b/recipes/openjdk/openjdk-6/icedtea-crosscompile-fix.patch
new file mode 100644
index 0000000..6ec83bb
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-crosscompile-fix.patch
@@ -0,0 +1,229 @@
+Index: openjdk/jdk/make/sun/awt/Makefile
+===================================================================
+--- openjdk.orig/jdk/make/sun/awt/Makefile	2009-01-24 17:54:57.000000000 +0100
++++ openjdk/jdk/make/sun/awt/Makefile	2009-01-24 17:55:07.000000000 +0100
+@@ -509,10 +509,10 @@
+ #
+ 
+ ifeq ($(PLATFORM), linux)
+-CPPFLAGS += -I$(MOTIF_DIR)/include \
+-            -I$(OPENWIN_HOME)/include \
+-            -I$(OPENWIN_HOME)/include/X11/extensions \
+-            -I$(PLATFORM_SRC)/native/$(PKGDIR)/font 
++#CPPFLAGS += -I$(MOTIF_DIR)/include \
++#            -I$(OPENWIN_HOME)/include \
++#            -I$(OPENWIN_HOME)/include/X11/extensions \
++CPPFLAGS +=  -I$(PLATFORM_SRC)/native/$(PKGDIR)/font 
+ endif
+ CPPFLAGS += -I$(SHARE_SRC)/native/$(PKGDIR)/debug \
+             -I$(SHARE_SRC)/native/$(PKGDIR)/../font \
+@@ -536,7 +536,7 @@
+ 	    $(EVENT_MODEL)
+ 
+ ifeq ($(PLATFORM), linux)
+-LDFLAGS += -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
++#LDFLAGS += -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
+ endif
+ 
+ LDFLAGS += -L$(LIBDIR)/$(LIBARCH)/$(TSOBJDIR) \
+Index: openjdk/jdk/make/sun/awt/mawt.gmk
+===================================================================
+--- openjdk.orig/jdk/make/sun/awt/mawt.gmk	2009-01-24 17:54:57.000000000 +0100
++++ openjdk/jdk/make/sun/awt/mawt.gmk	2009-01-24 17:55:07.000000000 +0100
+@@ -194,8 +194,8 @@
+ CPPFLAGS += -I$(CUPS_HEADERS_PATH)
+ 
+ ifndef HEADLESS
+-CPPFLAGS += -I$(OPENWIN_HOME)/include 
+-LDFLAGS  += -L$(OPENWIN_LIB)
++#CPPFLAGS += -I$(OPENWIN_HOME)/include 
++#LDFLAGS  += -L$(OPENWIN_LIB)
+ 
+ endif # !HEADLESS
+ 
+@@ -223,8 +223,8 @@
+ 
+ ifeq ($(PLATFORM), linux)
+ # Checking for the X11/extensions headers at the additional location
+-  CPPFLAGS += -I/X11R6/include/X11/extensions \
+-              -I/usr/include/X11/extensions
++#  CPPFLAGS += -I/X11R6/include/X11/extensions \
++#              -I/usr/include/X11/extensions
+ endif
+ 
+ ifeq ($(PLATFORM), solaris)
+Index: openjdk/jdk/make/sun/xawt/Makefile
+===================================================================
+--- openjdk.orig/jdk/make/sun/xawt/Makefile	2009-01-24 17:54:57.000000000 +0100
++++ openjdk/jdk/make/sun/xawt/Makefile	2009-01-24 17:55:07.000000000 +0100
+@@ -123,11 +123,12 @@
+         -I$(PLATFORM_SRC)/native/sun/awt 
+ 
+ ifeq ($(PLATFORM), linux)
++# Very unsuitable for cross-compilation.
+ # Allows for builds on Debian GNU Linux, X11 is in a different place 
+-  CPPFLAGS += -I/usr/X11R6/include/X11/extensions \
+-              -I/usr/include/X11/extensions \
+-              -I$(MOTIF_DIR)/include \
+-              -I$(OPENWIN_HOME)/include 
++#  CPPFLAGS += -I/usr/X11R6/include/X11/extensions \
++#              -I/usr/include/X11/extensions \
++#              -I$(MOTIF_DIR)/include \
++#              -I$(OPENWIN_HOME)/include 
+ endif
+ 
+ ifeq ($(PLATFORM), solaris)
+Index: openjdk/hotspot/make/linux/makefiles/vm.make
+===================================================================
+--- openjdk.orig/hotspot/make/linux/makefiles/vm.make	2009-01-24 17:54:57.000000000 +0100
++++ openjdk/hotspot/make/linux/makefiles/vm.make	2009-01-24 17:55:07.000000000 +0100
+@@ -170,6 +170,7 @@
+ LIBS_VM   += $(LLVM_LIBS)
+ endif
+ 
++LFLAGS_VM += $(OE_LDFLAGS)
+ LINK_VM = $(LINK_LIB.c)
+ 
+ # rule for building precompiled header
+Index: openjdk/hotspot/make/linux/makefiles/buildtree.make
+===================================================================
+--- openjdk.orig/hotspot/make/linux/makefiles/buildtree.make	2009-01-24 17:54:57.000000000 +0100
++++ openjdk/hotspot/make/linux/makefiles/buildtree.make	2009-01-24 17:55:07.000000000 +0100
+@@ -343,7 +343,7 @@
+ 	echo "rm -f Queens.class"; \
+ 	echo "\$${JAVA_HOME}/bin/javac -d . $(GAMMADIR)/make/test/Queens.java"; \
+ 	echo '[ -f gamma_g ] && { gamma=gamma_g; }'; \
+-	echo './$${gamma:-gamma} $(TESTFLAGS) Queens < /dev/null'; \
++	echo 'echo Silently skipping the execution of the gamma program'; \
+ 	) > $@
+ 	$(QUIETLY) chmod +x $@
+ 
+Index: openjdk/corba/make/common/Defs-linux.gmk
+===================================================================
+--- openjdk.orig/corba/make/common/Defs-linux.gmk	2009-01-24 17:54:57.000000000 +0100
++++ openjdk/corba/make/common/Defs-linux.gmk	2009-01-24 17:55:07.000000000 +0100
+@@ -82,9 +82,9 @@
+ CC_NO_OPT      =
+ 
+ ifeq ($(PRODUCT), java)
+-    _OPT = $(CC_HIGHER_OPT)
++    _OPT = $(OE_CFLAGS)
+ else
+-    _OPT = $(CC_LOWER_OPT)
++    _OPT = $(OE_CFLAGS)
+     CPPFLAGS_DBG    += -DLOGGING 
+ endif
+ 
+@@ -94,7 +94,7 @@
+ #    as the default.
+ CFLAGS_REQUIRED_alpha   += -mieee -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_amd64   += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+-CFLAGS_REQUIRED_arm     += -D_LITTLE_ENDIAN
++CFLAGS_REQUIRED_arm     += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_hppa    +=
+ CFLAGS_REQUIRED_i586    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_ia64    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+@@ -221,7 +221,7 @@
+ #
+ # -L paths for finding and -ljava
+ #
+-LDFLAGS_OPT     = -Xlinker -O1
++LDFLAGS_OPT     = $(OE_LDFLAGS)
+ LDFLAGS_COMMON += -L$(LIBDIR)/$(LIBARCH)
+ LDFLAGS_COMMON += -Wl,-soname=$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
+ 
+Index: openjdk/jdk/make/common/Defs-linux.gmk
+===================================================================
+--- openjdk.orig/jdk/make/common/Defs-linux.gmk	2009-01-24 17:54:57.000000000 +0100
++++ openjdk/jdk/make/common/Defs-linux.gmk	2009-01-24 17:55:07.000000000 +0100
+@@ -92,9 +92,9 @@
+ CC_NO_OPT      =
+ 
+ ifeq ($(PRODUCT), java)
+-    _OPT = $(CC_HIGHER_OPT)
++    _OPT = $(OE_CFLAGS)
+ else
+-    _OPT = $(CC_LOWER_OPT)
++    _OPT = $(OE_CFLAGS)
+     CPPFLAGS_DBG    += -DLOGGING 
+ endif
+ 
+@@ -104,7 +104,7 @@
+ #    as the default.
+ CFLAGS_REQUIRED_alpha   += -mieee -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_amd64   += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+-CFLAGS_REQUIRED_arm     += -D_LITTLE_ENDIAN
++CFLAGS_REQUIRED_arm     += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_hppa    +=
+ CFLAGS_REQUIRED_i586    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_ia64    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+@@ -231,7 +231,7 @@
+ #
+ # -L paths for finding and -ljava
+ #
+-LDFLAGS_OPT     = -Xlinker -O1
++LDFLAGS_OPT     = $(OE_LDFLAGS)
+ LDFLAGS_COMMON += -L$(LIBDIR)/$(LIBARCH)
+ LDFLAGS_COMMON += -Wl,-soname=$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
+ 
+Index: openjdk/hotspot/make/linux/makefiles/gcc.make
+===================================================================
+--- openjdk.orig/hotspot/make/linux/makefiles/gcc.make	2009-01-24 17:54:57.000000000 +0100
++++ openjdk/hotspot/make/linux/makefiles/gcc.make	2009-01-24 17:55:07.000000000 +0100
+@@ -119,7 +119,7 @@
+ CFLAGS_WARN/BYFILE = $(CFLAGS_WARN/$@)$(CFLAGS_WARN/DEFAULT$(CFLAGS_WARN/$@)) 
+ 
+ # The flags to use for an Optimized g++ build
+-OPT_CFLAGS += -O3
++OPT_CFLAGS += $(OE_CFLAGS)
+ 
+ # Hotspot uses very unstrict aliasing turn this optimization off
+ OPT_CFLAGS += -fno-strict-aliasing
+@@ -148,7 +148,7 @@
+ endif
+ 
+ # Enable linker optimization
+-LFLAGS += -Xlinker -O1
++LFLAGS += $(OE_LDFLAGS)
+ 
+ # Use $(MAPFLAG:FILENAME=real_file_name) to specify a map file.
+ MAPFLAG = -Xlinker --version-script=FILENAME
+Index: openjdk/hotspot/make/linux/makefiles/launcher.make
+===================================================================
+--- openjdk.orig/hotspot/make/linux/makefiles/launcher.make	2009-01-24 17:55:19.000000000 +0100
++++ openjdk/hotspot/make/linux/makefiles/launcher.make	2009-01-24 17:56:05.000000000 +0100
+@@ -44,7 +44,7 @@
+   LIBS_LAUNCHER             += $(STATIC_STDCXX) $(LIBS)
+ else
+   LAUNCHER.o                 = launcher.o
+-  LFLAGS_LAUNCHER           += -L `pwd`
++  LFLAGS_LAUNCHER           += -L `pwd` $(OE_LAUNCHER_LDFLAGS) $(OE_LDFLAGS)
+   LIBS_LAUNCHER             += -l$(JVM) $(LIBS) -lstdc++
+ endif
+ 
+Index: icedtea6-1.8.5/build/openjdk/jdk/make/sun/xawt/Makefile
+===================================================================
+--- openjdk/jdk/make/sun/xawt/Makefile	2011-03-14 14:17:03.926207269 +0100
++++ openjdk/jdk/make/sun/xawt/Makefile	2011-03-14 14:30:11.956186631 +0100
+@@ -245,7 +245,7 @@
+ 	    $(CHMOD) +w $@;\
+ 	else	\
+ 	    $(ECHO) GENERATING $@; \
+-	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
++	    $(QEMU) $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
+ 	fi
+ 	@if [ "$(DOCOMPARE)$(suffix $@)" = "true.64" ]; then \
+ 	    $(ECHO) COMPARING $@ and $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
+Index: openjdk/hotspot/make/linux/makefiles/jsig.make
+===================================================================
+--- openjdk/hotspot/make/linux/makefiles/jsig.make	2010-02-17 04:11:04.000000000 +0100
++++ openjdk/hotspot/make/linux/makefiles/jsig.make	2011-11-18 22:56:03.923900991 +0100
+@@ -39,7 +39,7 @@
+ # cause problems with interposing. See CR: 6466665
+ # LFLAGS_JSIG += $(MAPFLAG:FILENAME=$(LIBJSIG_MAPFILE))
+ 
+-LFLAGS_JSIG += -D_GNU_SOURCE -D_REENTRANT
++LFLAGS_JSIG += -D_GNU_SOURCE -D_REENTRANT $(OE_LDFLAGS)
+ 
+ # DEBUG_BINARIES overrides everything, use full -g debug information
+ ifeq ($(DEBUG_BINARIES), true)
diff --git a/recipes/openjdk/openjdk-6/icedtea-fix-jar-command.patch b/recipes/openjdk/openjdk-6/icedtea-fix-jar-command.patch
new file mode 100644
index 0000000..59d806d
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-fix-jar-command.patch
@@ -0,0 +1,13 @@
+Index: icedtea6-1.8/Makefile.am
+===================================================================
+--- icedtea6-1.8.orig/Makefile.am	2010-06-17 10:29:13.654666801 +0200
++++ icedtea6-1.8/Makefile.am	2010-06-17 10:30:50.334670771 +0200
+@@ -1750,7 +1745,7 @@
+ stamps/rewrite-rhino.stamp: stamps/rewriter.stamp $(RHINO_JAR)
+ if WITH_RHINO
+ 	mkdir -p rhino/rhino.{old,new}
+-	(cd rhino/rhino.old ; jar xf $(RHINO_JAR))
++	(cd rhino/rhino.old ; $(ICEDTEA_BOOT_DIR)/bin/jar xf $(RHINO_JAR))
+ 	$(ICEDTEA_BOOT_DIR)/bin/java -cp $(abs_top_builddir)/rewriter \
+ 	  com.redhat.rewriter.ClassRewriter \
+ 	  $(abs_top_builddir)/rhino/rhino.old $(abs_top_builddir)/rhino/rhino.new \
diff --git a/recipes/openjdk/openjdk-6/icedtea-hasgettransfer.patch b/recipes/openjdk/openjdk-6/icedtea-hasgettransfer.patch
new file mode 100644
index 0000000..01dcb82
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-hasgettransfer.patch
@@ -0,0 +1,131 @@
+Index: openjdk/jdk/src/share/classes/javax/swing/HasGetTransferHandler.java
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ openjdk/jdk/src/share/classes/javax/swing/HasGetTransferHandler.java	2011-11-18 20:44:00.281649848 +0100
+@@ -0,0 +1,38 @@
++/*
++ * Copyright 2000-2006 Sun Microsystems, Inc.  All Rights Reserved.
++ * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
++ *
++ * This code is free software; you can redistribute it and/or modify it
++ * under the terms of the GNU General Public License version 2 only, as
++ * published by the Free Software Foundation.  Sun designates this
++ * particular file as subject to the "Classpath" exception as provided
++ * by Sun in the LICENSE file that accompanied this code.
++ *
++ * This code is distributed in the hope that it will be useful, but WITHOUT
++ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
++ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
++ * version 2 for more details (a copy is included in the LICENSE file that
++ * accompanied this code).
++ *
++ * You should have received a copy of the GNU General Public License version
++ * 2 along with this work; if not, write to the Free Software Foundation,
++ * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
++ *
++ * Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
++ * CA 95054 USA or visit www.sun.com if you need additional information or
++ * have any questions.
++ */
++package javax.swing;
++
++/**
++ * An interface to tag things with a {@code getTransferHandler} method.
++ */
++interface HasGetTransferHandler {
++
++     /** Returns the {@code TransferHandler}.
++      *
++      * @return The {@code TransferHandler} or {@code null}
++      */
++     public TransferHandler getTransferHandler();
++}
++
+Index: openjdk/jdk/src/share/classes/javax/swing/TransferHandler.java
+===================================================================
+--- openjdk/jdk/src/share/classes/javax/swing/TransferHandler.java	2011-11-18 18:51:22.000000000 +0100
++++ openjdk/jdk/src/share/classes/javax/swing/TransferHandler.java	2011-11-18 20:44:01.628219313 +0100
+@@ -122,18 +122,6 @@
+     public static final int LINK = DnDConstants.ACTION_LINK;
+ 
+     /**
+-     * An interface to tag things with a {@code getTransferHandler} method.
+-     */
+-    interface HasGetTransferHandler {
+-
+-        /** Returns the {@code TransferHandler}.
+-         *
+-         * @return The {@code TransferHandler} or {@code null}
+-         */
+-        public TransferHandler getTransferHandler();
+-    }
+-
+-    /**
+      * Represents a location where dropped data should be inserted.
+      * This is a base class that only encapsulates a point.
+      * Components supporting drop may provide subclasses of this
+diff --git a/jdk/src/share/classes/javax/swing/JApplet.java b/jdk/src/share/classes/javax/swing/JApplet.java
+index 47f792a..72c2cf9 100644
+--- openjdk/jdk/src/share/classes/javax/swing/JApplet.java
++++ openjdk/jdk/src/share/classes/javax/swing/JApplet.java
+@@ -91,7 +91,7 @@ import javax.accessibility.*;
+  */
+ public class JApplet extends Applet implements Accessible,
+                                                RootPaneContainer,
+-                               TransferHandler.HasGetTransferHandler
++                                               HasGetTransferHandler
+ {
+     /**
+      * @see #getRootPane
+diff --git a/jdk/src/share/classes/javax/swing/JComponent.java b/jdk/src/share/classes/javax/swing/JComponent.java
+index 4293a4f..0c0a1dc 100644
+--- openjdk/jdk/src/share/classes/javax/swing/JComponent.java
++++ openjdk/jdk/src/share/classes/javax/swing/JComponent.java
+@@ -171,7 +171,7 @@ import sun.swing.UIClientPropertyKey;
+  * @author Arnaud Weber
+  */
+ public abstract class JComponent extends Container implements Serializable,
+-                                              TransferHandler.HasGetTransferHandler
++                                                              HasGetTransferHandler
+ {
+     /**
+      * @see #getUIClassID
+diff --git a/jdk/src/share/classes/javax/swing/JDialog.java b/jdk/src/share/classes/javax/swing/JDialog.java
+index a0193d1..aeeb243 100644
+--- openjdk/jdk/src/share/classes/javax/swing/JDialog.java
++++ openjdk/jdk/src/share/classes/javax/swing/JDialog.java
+@@ -97,7 +97,7 @@ import javax.accessibility.*;
+ public class JDialog extends Dialog implements WindowConstants,
+                                                Accessible,
+                                                RootPaneContainer,
+-                               TransferHandler.HasGetTransferHandler
++                                               HasGetTransferHandler
+ {
+     /**
+      * Key into the AppContext, used to check if should provide decorations
+diff --git a/jdk/src/share/classes/javax/swing/JFrame.java b/jdk/src/share/classes/javax/swing/JFrame.java
+index 9910b43..4cb8f58 100644
+--- openjdk/jdk/src/share/classes/javax/swing/JFrame.java
++++ openjdk/jdk/src/share/classes/javax/swing/JFrame.java
+@@ -109,7 +109,7 @@ import javax.accessibility.*;
+ public class JFrame  extends Frame implements WindowConstants,
+                                               Accessible,
+                                               RootPaneContainer,
+-                              TransferHandler.HasGetTransferHandler
++                                              HasGetTransferHandler
+ {
+     /**
+      * The exit application default window close operation. If a window
+diff --git a/jdk/src/share/classes/javax/swing/JWindow.java b/jdk/src/share/classes/javax/swing/JWindow.java
+index c94803c..85bbb57 100644
+--- openjdk/jdk/src/share/classes/javax/swing/JWindow.java
++++ openjdk/jdk/src/share/classes/javax/swing/JWindow.java
+@@ -91,7 +91,7 @@ import javax.accessibility.*;
+  */
+ public class JWindow extends Window implements Accessible,
+                                                RootPaneContainer,
+-                               TransferHandler.HasGetTransferHandler
++                                               HasGetTransferHandler
+ {
+     /**
+      * The <code>JRootPane</code> instance that manages the
diff --git a/recipes/openjdk/openjdk-6/icedtea-hostbuildcc.patch b/recipes/openjdk/openjdk-6/icedtea-hostbuildcc.patch
new file mode 100644
index 0000000..5f2c98b
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-hostbuildcc.patch
@@ -0,0 +1,12 @@
+Index: openjdk/hotspot/make/linux/makefiles/rules.make
+===================================================================
+--- openjdk/hotspot/make/linux/makefiles/rules.make	2010-02-02 02:22:33.201668748 +0100
++++ openjdk/hotspot/make/linux/makefiles/rules.make	2010-02-02 02:23:08.480415783 +0100
+@@ -39,6 +39,7 @@
+ # $(CC) is the c compiler (cc/gcc), $(CCC) is the c++ compiler (CC/g++).
+ C_COMPILE       = $(CC) $(CPPFLAGS) $(CFLAGS)
+ CC_COMPILE      = $(CCC) $(CPPFLAGS) $(CFLAGS)
++CC_HOST_COMPILE  = $(BUILD_CC) $(CPPFLAGS) $(CFLAGS)
+ 
+ AS.S            = $(AS) $(ASFLAGS)
+ 
diff --git a/recipes/openjdk/openjdk-6/icedtea-hotspot-glibc-version.patch b/recipes/openjdk/openjdk-6/icedtea-hotspot-glibc-version.patch
new file mode 100644
index 0000000..faa90ea
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-hotspot-glibc-version.patch
@@ -0,0 +1,23 @@
+Index: icedtea6-1.8/build/openjdk/hotspot/src/os/linux/vm/os_linux.cpp
+===================================================================
+--- openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 22:22:13.696298239 +0200
++++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 22:24:15.308790737 +0200
+@@ -49,7 +49,6 @@
+ # include <string.h>
+ # include <syscall.h>
+ # include <sys/sysinfo.h>
+-# include <gnu/libc-version.h>
+ # include <sys/ipc.h>
+ # include <sys/shm.h>
+ # include <link.h>
+@@ -544,9 +543,7 @@
+      os::Linux::set_glibc_version(str);
+   } else {
+      // _CS_GNU_LIBC_VERSION is not supported, try gnu_get_libc_version()
+-     static char _gnu_libc_version[32];
+-     jio_snprintf(_gnu_libc_version, sizeof(_gnu_libc_version),
+-              "glibc %s %s", gnu_get_libc_version(), gnu_get_libc_release());
++     static char _gnu_libc_version[32] = "2.9";
+      os::Linux::set_glibc_version(_gnu_libc_version);
+   }
+ 
diff --git a/recipes/openjdk/openjdk-6/icedtea-hotspot-isfinte.patch b/recipes/openjdk/openjdk-6/icedtea-hotspot-isfinte.patch
new file mode 100644
index 0000000..7c5da59
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-hotspot-isfinte.patch
@@ -0,0 +1,15 @@
+Index: icedtea6-1.8/build/openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp
+===================================================================
+--- openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	2010-06-09 21:41:28.576131825 +0200
++++ openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	2010-06-09 21:41:55.555711815 +0200
+@@ -235,8 +235,8 @@
+ 
+ // Checking for finiteness
+ 
+-inline int g_isfinite(jfloat  f)                 { return finite(f); }
+-inline int g_isfinite(jdouble f)                 { return finite(f); }
++inline int g_isfinite(jfloat  f)                 { return isfinite(f); }
++inline int g_isfinite(jdouble f)                 { return isfinite(f); }
+ 
+ 
+ // Wide characters
diff --git a/recipes/openjdk/openjdk-6/icedtea-hotspot-isnanf.patch b/recipes/openjdk/openjdk-6/icedtea-hotspot-isnanf.patch
new file mode 100644
index 0000000..494e965
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-hotspot-isnanf.patch
@@ -0,0 +1,21 @@
+Index: icedtea6-1.8/build/openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp
+===================================================================
+--- openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	2010-06-09 21:47:12.695674808 +0200
++++ openjdk/hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp	2010-06-09 21:48:08.699007491 +0200
+@@ -220,14 +220,14 @@
+ // checking for nanness
+ #ifdef SOLARIS
+ #ifdef SPARC
+-inline int g_isnan(float  f) { return isnanf(f); }
++inline int g_isnan(float  f) { return __isnanf(f); }
+ #else
+ // isnanf() broken on Intel Solaris use isnand()
+ inline int g_isnan(float  f) { return isnand(f); }
+ #endif
+ inline int g_isnan(double f) { return isnand(f); }
+ #elif LINUX
+-inline int g_isnan(float  f) { return isnanf(f); }
++inline int g_isnan(float  f) { return __isnanf(f); }
+ inline int g_isnan(double f) { return isnan(f); }
+ #else
+ #error "missing platform-specific definition here"
diff --git a/recipes/openjdk/openjdk-6/icedtea-hotspot-loadavg.patch b/recipes/openjdk/openjdk-6/icedtea-hotspot-loadavg.patch
new file mode 100644
index 0000000..7da41fd
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-hotspot-loadavg.patch
@@ -0,0 +1,28 @@
+Index: icedtea6-1.8/build/openjdk/hotspot/src/os/linux/vm/os_linux.cpp
+===================================================================
+--- openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 22:16:09.406334411 +0200
++++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp	2010-06-09 22:19:38.952152043 +0200
+@@ -4325,7 +4325,22 @@
+ // Linux doesn't yet have a (official) notion of processor sets,
+ // so just return the system wide load average.
+ int os::loadavg(double loadavg[], int nelem) {
+-  return ::getloadavg(loadavg, nelem);
++
++	FILE *LOADAVG;
++	double avg[3] = { 0.0, 0.0, 0.0 };
++	int i, res = -1;;
++
++	if ((LOADAVG = fopen("/proc/loadavg", "r"))) {
++		fscanf(LOADAVG, "%lf %lf %lf", &avg[0], &avg[1], &avg[2]);
++		res = 0;
++		fclose(LOADAVG);
++	}
++
++	for (i = 0; (i < nelem) && (i < 3); i++) {
++		loadavg[i] = avg[i];
++	}
++
++	return res;
+ }
+ 
+ void os::pause() {
diff --git a/recipes/openjdk/openjdk-6/icedtea-jdk-RTLD_NOLOAD.patch b/recipes/openjdk/openjdk-6/icedtea-jdk-RTLD_NOLOAD.patch
new file mode 100644
index 0000000..9c70ba1
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-jdk-RTLD_NOLOAD.patch
@@ -0,0 +1,13 @@
+Index: openjdk/jdk/src/solaris/native/sun/security/pkcs11/j2secmod_md.c
+===================================================================
+--- openjdk/jdk/src/solaris/native/sun/security/pkcs11/j2secmod_md.c	2010-06-13 15:18:05.655136951 +0200
++++ openjdk/jdk/src/solaris/native/sun/security/pkcs11/j2secmod_md.c	2010-06-13 15:20:29.601377967 +0200
+@@ -51,7 +51,7 @@
+ {
+     const char *libName = (*env)->GetStringUTFChars(env, jLibName, NULL);
+     // look up existing handle only, do not load
+-    void *hModule = dlopen(libName, RTLD_NOLOAD);
++    void *hModule = dlopen(libName, RTLD_LAZY);
+     dprintf2("-handle for %s: %u\n", libName, hModule);
+     (*env)->ReleaseStringUTFChars(env, jLibName, libName);
+     return (jlong)hModule;
diff --git a/recipes/openjdk/openjdk-6/icedtea-jdk-iconv-uclibc.patch b/recipes/openjdk/openjdk-6/icedtea-jdk-iconv-uclibc.patch
new file mode 100644
index 0000000..68f8581
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-jdk-iconv-uclibc.patch
@@ -0,0 +1,39 @@
+Index: openjdk/jdk/make/java/npt/Makefile
+===================================================================
+--- openjdk/jdk/make/java/npt/Makefile	2010-06-13 15:11:02.598512448 +0200
++++ openjdk/jdk/make/java/npt/Makefile	2010-06-13 15:11:28.504759286 +0200
+@@ -65,6 +65,8 @@
+ # We don't want to link against -ljava
+ JAVALIB=
+ 
++LDLIBS += -liconv
++
+ # Add -export options to explicitly spell exported symbols
+ ifeq ($(PLATFORM), windows)
+   OTHER_LCF += -export:nptInitialize -export:nptTerminate
+Index: icedtea6-1.8/openjdk-ecj/jdk/make/java/instrument/Makefile
+===================================================================
+--- openjdk/jdk/make/java/instrument/Makefile	2010-06-13 15:12:14.688505195 +0200
++++ openjdk/jdk/make/java/instrument/Makefile	2010-06-13 15:12:32.641425670 +0200
+@@ -123,6 +123,8 @@
+ # We don't want to link against -ljava
+ JAVALIB=
+ 
++LDLIBS += -liconv
++
+ #
+ # Add to ambient vpath so we pick up the library files
+ #
+Index: openjdk/jdk/make/sun/splashscreen/Makefile
+===================================================================
+--- openjdk/jdk/make/sun/splashscreen/Makefile	2010-06-13 15:12:48.951840824 +0200
++++ openjdk/jdk/make/sun/splashscreen/Makefile	2010-06-13 15:13:01.191422891 +0200
+@@ -55,6 +55,8 @@
+ 
+ JAVALIB=
+ 
++LDLIBS += -liconv
++
+ #
+ # C Flags
+ #
diff --git a/recipes/openjdk/openjdk-6/icedtea-jdk-remove-unused-backtrace.patch b/recipes/openjdk/openjdk-6/icedtea-jdk-remove-unused-backtrace.patch
new file mode 100644
index 0000000..5423fde
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-jdk-remove-unused-backtrace.patch
@@ -0,0 +1,41 @@
+Index: openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c
+===================================================================
+--- openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c	2010-08-05 16:45:56.607257503 +0200
++++ openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c	2010-08-05 16:47:19.727254686 +0200
+@@ -27,9 +27,6 @@
+ #include <X11/Xutil.h>
+ #include <X11/Xos.h>
+ #include <X11/Xatom.h>
+-#ifdef __linux__
+-#include <execinfo.h>
+-#endif
+ 
+ #include <jvm.h>
+ #include <jni.h>
+@@ -689,26 +686,6 @@
+     return ret;
+ }
+ 
+-#ifdef __linux__
+-void print_stack(void)
+-{
+-  void *array[10];
+-  size_t size;
+-  char **strings;
+-  size_t i;
+-
+-  size = backtrace (array, 10);
+-  strings = backtrace_symbols (array, size);
+-
+-  fprintf (stderr, "Obtained %zd stack frames.\n", size);
+-
+-  for (i = 0; i < size; i++)
+-     fprintf (stderr, "%s\n", strings[i]);
+-
+-  free (strings);
+-}
+-#endif
+-
+ Window get_xawt_root_shell(JNIEnv *env) {
+   static jclass classXRootWindow = NULL;
+   static jmethodID methodGetXRootWindow = NULL;
diff --git a/recipes/openjdk/openjdk-6/icedtea-jdk-unpack-uclibc.patch b/recipes/openjdk/openjdk-6/icedtea-jdk-unpack-uclibc.patch
new file mode 100644
index 0000000..40564f0
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-jdk-unpack-uclibc.patch
@@ -0,0 +1,12 @@
+Index: openjdk/jdk/make/com/sun/java/pack/Makefile
+===================================================================
+--- openjdk/jdk/make/com/sun/java/pack/Makefile	2010-06-13 15:25:21.548426411 +0200
++++ openjdk/jdk/make/com/sun/java/pack/Makefile	2010-06-13 15:25:43.858007543 +0200
+@@ -103,6 +103,7 @@
+   OTHER_LDLIBS += $(LIBCXX) -lc
+ # setup the list of libraries to link in...
+ ifeq ($(PLATFORM), linux)
++  OTHER_LDLIBS  += -lpthread
+ ifeq ("$(CC_VER_MAJOR)", "3")
+   OTHER_LDLIBS  += -Wl,-Bstatic -lgcc_eh -Wl,-Bdynamic
+ endif
diff --git a/recipes/openjdk/openjdk-6/icedtea-launcher-stdc++.patch b/recipes/openjdk/openjdk-6/icedtea-launcher-stdc++.patch
new file mode 100644
index 0000000..ee24afa
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-launcher-stdc++.patch
@@ -0,0 +1,13 @@
+Index: openjdk/hotspot/make/linux/makefiles/launcher.make
+===================================================================
+--- openjdk.orig/hotspot/make/linux/makefiles/launcher.make	2009-01-16 17:30:56.000000000 +0100
++++ openjdk/hotspot/make/linux/makefiles/launcher.make	2009-01-16 17:31:13.000000000 +0100
+@@ -45,7 +45,7 @@
+ else
+   LAUNCHER.o                 = launcher.o
+   LFLAGS_LAUNCHER           += -L `pwd`
+-  LIBS_LAUNCHER             += -l$(JVM) $(LIBS)
++  LIBS_LAUNCHER             += -l$(JVM) $(LIBS) -lstdc++
+ endif
+ 
+ LINK_LAUNCHER = $(LINK.c)
diff --git a/recipes/openjdk/openjdk-6/icedtea-libnet-renaming.patch b/recipes/openjdk/openjdk-6/icedtea-libnet-renaming.patch
new file mode 100644
index 0000000..024969d
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-libnet-renaming.patch
@@ -0,0 +1,148 @@
+Index: openjdk/jdk/make/java/net/Makefile
+===================================================================
+--- openjdk/jdk/make/java/net/Makefile	2010-07-05 12:28:58.476625401 +0200
++++ openjdk/jdk/make/java/net/Makefile	2010-07-05 12:29:11.876625138 +0200
+@@ -25,7 +25,7 @@
+ 
+ BUILDDIR = ../..
+ PACKAGE = java.net
+-LIBRARY = net
++LIBRARY = javanet
+ PRODUCT = sun
+ include $(BUILDDIR)/common/Defs.gmk
+ 
+Index: openjdk/jdk/make/java/nio/Makefile
+===================================================================
+--- openjdk/jdk/make/java/nio/Makefile	2010-07-05 12:31:27.046626250 +0200
++++ openjdk/jdk/make/java/nio/Makefile	2010-07-05 12:32:06.647874890 +0200
+@@ -139,11 +139,11 @@
+ endif
+ ifeq ($(PLATFORM), linux)
+ COMPILER_WARNINGS_FATAL=true
+-OTHER_LDLIBS += -L$(LIBDIR)/$(LIBARCH) -ljava -lnet -lpthread -ldl
++OTHER_LDLIBS += -L$(LIBDIR)/$(LIBARCH) -ljava -ljavanet -lpthread -ldl
+ endif
+ ifeq ($(PLATFORM), solaris)
+ OTHER_LDLIBS += $(JVMLIB) $(LIBSOCKET) -lposix4 -ldl \
+-		-L$(LIBDIR)/$(LIBARCH) -ljava -lnet
++		-L$(LIBDIR)/$(LIBARCH) -ljava -ljavanet
+ endif # PLATFORM
+ 
+ #
+Index: openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.java
+===================================================================
+--- openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.java	2010-07-05 17:40:56.467876415 +0200
++++ openjdk/jdk/src/share/classes/java/net/AbstractPlainDatagramSocketImpl.java	2010-07-05 17:41:43.326628410 +0200
+@@ -58,7 +58,7 @@
+      */
+     static {
+         java.security.AccessController.doPrivileged(
+-                  new sun.security.action.LoadLibraryAction("net"));
++                  new sun.security.action.LoadLibraryAction("javanet"));
+     }
+ 
+     /**
+Index: openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java
+===================================================================
+--- openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java	2010-07-05 17:41:01.027875484 +0200
++++ openjdk/jdk/src/share/classes/java/net/AbstractPlainSocketImpl.java	2010-07-05 17:41:56.826626386 +0200
+@@ -74,7 +74,7 @@
+      */
+     static {
+         java.security.AccessController.doPrivileged(
+-                  new sun.security.action.LoadLibraryAction("net"));
++                  new sun.security.action.LoadLibraryAction("javanet"));
+     }
+ 
+     /**
+Index: openjdk/jdk/src/share/classes/java/net/DatagramPacket.java
+===================================================================
+--- openjdk/jdk/src/share/classes/java/net/DatagramPacket.java	2010-07-05 17:41:02.017875980 +0200
++++ openjdk/jdk/src/share/classes/java/net/DatagramPacket.java	2010-07-05 17:42:06.057875677 +0200
+@@ -47,7 +47,7 @@
+      */
+     static {
+         java.security.AccessController.doPrivileged(
+-                  new sun.security.action.LoadLibraryAction("net"));
++                  new sun.security.action.LoadLibraryAction("javanet"));
+         init();
+     }
+ 
+Index: openjdk/jdk/src/share/classes/java/net/InetAddress.java
+===================================================================
+--- openjdk/jdk/src/share/classes/java/net/InetAddress.java	2010-07-05 17:41:02.756626429 +0200
++++ openjdk/jdk/src/share/classes/java/net/InetAddress.java	2010-07-05 17:42:15.997875786 +0200
+@@ -230,7 +230,7 @@
+     static {
+         preferIPv6Address = java.security.AccessController.doPrivileged(
+             new GetBooleanAction("java.net.preferIPv6Addresses")).booleanValue();
+-        AccessController.doPrivileged(new LoadLibraryAction("net"));
++        AccessController.doPrivileged(new LoadLibraryAction("javanet"));
+         init();
+     }
+ 
+Index: openjdk/jdk/src/share/classes/java/net/NetworkInterface.java
+===================================================================
+--- openjdk/jdk/src/share/classes/java/net/NetworkInterface.java	2010-07-05 17:41:03.547875282 +0200
++++ openjdk/jdk/src/share/classes/java/net/NetworkInterface.java	2010-07-05 17:42:22.647875475 +0200
+@@ -52,7 +52,7 @@
+     private boolean virtual = false;
+ 
+     static {
+-        AccessController.doPrivileged(new LoadLibraryAction("net"));
++        AccessController.doPrivileged(new LoadLibraryAction("javanet"));
+         init();
+     }
+ 
+Index: openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java
+===================================================================
+--- openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java	2010-07-05 17:41:04.306628153 +0200
++++ openjdk/jdk/src/share/classes/sun/net/spi/DefaultProxySelector.java	2010-07-05 17:42:32.666627264 +0200
+@@ -89,7 +89,7 @@
+                 }});
+         if (b != null && b.booleanValue()) {
+             java.security.AccessController.doPrivileged(
+-                      new sun.security.action.LoadLibraryAction("net"));
++                      new sun.security.action.LoadLibraryAction("javanet"));
+             hasSystemProxies = init();
+         }
+     }
+Index: henning/bug/com.buglabs.build.oe/tmp/work/armv7a-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8-r3.3/openjdk-src-dir/jdk/src/share/classes/sun/nio/ch/Util.java
+===================================================================
+--- openjdk/jdk/src/share/classes/sun/nio/ch/Util.java	2010-07-05 17:41:05.086626745 +0200
++++ openjdk/jdk/src/share/classes/sun/nio/ch/Util.java	2010-07-05 17:42:39.266626410 +0200
+@@ -354,7 +354,7 @@
+                 return;
+             loaded = true;
+             java.security.AccessController
+-                .doPrivileged(new sun.security.action.LoadLibraryAction("net"));
++                .doPrivileged(new sun.security.action.LoadLibraryAction("javanet"));
+             java.security.AccessController
+                 .doPrivileged(new sun.security.action.LoadLibraryAction("nio"));
+             // IOUtil must be initialized; Its native methods are called from
+Index: openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java
+===================================================================
+--- openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java	2010-07-05 17:41:05.896626691 +0200
++++ openjdk/jdk/src/solaris/classes/sun/net/dns/ResolverConfigurationImpl.java	2010-07-05 17:42:45.606625991 +0200
+@@ -244,7 +244,7 @@
+ 
+     static {
+         java.security.AccessController.doPrivileged(
+-            new sun.security.action.LoadLibraryAction("net"));
++            new sun.security.action.LoadLibraryAction("javanet"));
+     }
+ 
+ }
+Index: henning/bug/com.buglabs.build.oe/tmp/work/armv7a-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8-r3.3/openjdk-src-dir/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java
+===================================================================
+--- openjdk/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java	2010-07-05 17:41:06.786627210 +0200
++++ openjdk/jdk/src/windows/classes/sun/net/dns/ResolverConfigurationImpl.java	2010-07-05 17:42:51.926627747 +0200
+@@ -160,7 +160,7 @@
+ 
+     static {
+         java.security.AccessController.doPrivileged(
+-            new sun.security.action.LoadLibraryAction("net"));
++            new sun.security.action.LoadLibraryAction("javanet"));
+         init0();
+ 
+         // start the address listener thread
diff --git a/recipes/openjdk/openjdk-6/icedtea-llvm_headers.patch b/recipes/openjdk/openjdk-6/icedtea-llvm_headers.patch
new file mode 100644
index 0000000..e47ee50
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-llvm_headers.patch
@@ -0,0 +1,29 @@
+Index: openjdk/hotspot/src/share/vm/shark/llvmHeaders.hpp
+===================================================================
+--- openjdk/hotspot/src/share/vm/shark/llvmHeaders.hpp	2011-11-18 20:38:09.000000000 +0100
++++ openjdk/hotspot/src/share/vm/shark/llvmHeaders.hpp	2011-11-18 21:03:15.781644337 +0100
+@@ -38,7 +38,11 @@
+ #include <llvm/ModuleProvider.h>
+ #endif
+ #include <llvm/Support/IRBuilder.h>
++#if SHARK_LLVM_VERSION >= 29
++#include <llvm/Support/Threading.h>
++#else
+ #include <llvm/System/Threading.h>
++#endif
+ #include <llvm/Target/TargetSelect.h>
+ #include <llvm/Type.h>
+ #include <llvm/ExecutionEngine/JITMemoryManager.h>
+@@ -47,8 +51,12 @@
+ #include <llvm/ExecutionEngine/JIT.h>
+ #include <llvm/ADT/StringMap.h>
+ #include <llvm/Support/Debug.h>
++#if SHARK_LLVM_VERSION >= 29
++#include <llvm/Support/Host.h>
++#else
+ #include <llvm/System/Host.h>
+ #endif
++#endif
+ 
+ #include <map>
+ 
diff --git a/recipes/openjdk/openjdk-6/icedtea-remove_werror.patch b/recipes/openjdk/openjdk-6/icedtea-remove_werror.patch
new file mode 100644
index 0000000..f2ad035
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-remove_werror.patch
@@ -0,0 +1,14 @@
+Index: openjdk/hotspot/make/linux/makefiles/gcc.make
+===================================================================
+--- openjdk/hotspot/make/linux/makefiles/gcc.make	2010-02-02 16:11:35.758533706 +0100
++++ openjdk/hotspot/make/linux/makefiles/gcc.make	2010-02-02 16:11:42.761456458 +0100
+@@ -98,9 +98,6 @@
+   CFLAGS += -pipe
+ endif
+ 
+-# Compiler warnings are treated as errors
+-WARNINGS_ARE_ERRORS = -Werror
+-
+ # Except for a few acceptable ones
+ # Since GCC 4.3, -Wconversion has changed its meanings to warn these implicit
+ # conversions which might affect the values. To avoid that, we need to turn
diff --git a/recipes/openjdk/openjdk-6/icedtea-unbreak-float.patch b/recipes/openjdk/openjdk-6/icedtea-unbreak-float.patch
new file mode 100644
index 0000000..9f875de
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/icedtea-unbreak-float.patch
@@ -0,0 +1,18 @@
+Index: openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h
+===================================================================
+--- openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h	2010-02-02 13:49:39.972718207 +0100
++++ openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h	2010-02-02 13:50:04.635639302 +0100
+@@ -27,13 +27,11 @@
+ 
+ #include "jfdlibm.h"
+ 
+-#ifdef __NEWVALID       /* special setup for Sun test regime */
+ #if defined(i386) || defined(i486) || \
+         defined(intel) || defined(x86) || \
+         defined(i86pc) || defined(_M_IA64) || defined(ia64)
+ #define _LITTLE_ENDIAN
+ #endif
+-#endif
+ 
+ #ifdef _LITTLE_ENDIAN
+ #define __HI(x) *(1+(int*)&x)
diff --git a/recipes/openjdk/openjdk-6/jvm.cfg b/recipes/openjdk/openjdk-6/jvm.cfg
new file mode 100644
index 0000000..9e008e9
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/jvm.cfg
@@ -0,0 +1,41 @@
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
+-cacao ERROR
diff --git a/recipes/openjdk/openjdk-6/mkbc_returncode.patch b/recipes/openjdk/openjdk-6/mkbc_returncode.patch
new file mode 100644
index 0000000..13280b3
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/mkbc_returncode.patch
@@ -0,0 +1,11 @@
+Index: icedtea6/ports/hotspot/tools/mkbc.c
+===================================================================
+--- icedtea6.orig/ports/hotspot/tools/mkbc.c	2010-04-01 12:25:13.791317722 +0200
++++ icedtea6/ports/hotspot/tools/mkbc.c	2010-04-01 12:27:34.151606177 +0200
+@@ -602,4 +602,6 @@
+ 	if (ferror(bci_f)) fatal("Error writing bci");
+ 	if (source_f != stdin) fclose(source_f);
+ 	if (bci_f != stdout) fclose(bci_f);
++
++	return 0;
+ }
diff --git a/recipes/openjdk/openjdk-6/shark-arm-linux-cpu-detection.patch b/recipes/openjdk/openjdk-6/shark-arm-linux-cpu-detection.patch
new file mode 100644
index 0000000..df9e147
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/shark-arm-linux-cpu-detection.patch
@@ -0,0 +1,113 @@
+Index: icedtea6-1.8/ports/hotspot/src/share/vm/shark/sharkCompiler.cpp
+===================================================================
+--- icedtea6-1.8.orig/ports/hotspot/src/share/vm/shark/sharkCompiler.cpp	2010-07-14 16:42:48.412103129 +0200
++++ icedtea6-1.8/ports/hotspot/src/share/vm/shark/sharkCompiler.cpp	2010-07-14 16:50:51.680282178 +0200
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
diff --git a/recipes/openjdk/openjdk-6/shark-build-openjdkdir.patch b/recipes/openjdk/openjdk-6/shark-build-openjdkdir.patch
new file mode 100644
index 0000000..4e89967
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/shark-build-openjdkdir.patch
@@ -0,0 +1,13 @@
+Index: icedtea6-1.8/Makefile.am
+===================================================================
+--- icedtea6-1.8.orig/Makefile.am	2010-06-30 11:30:49.526648376 +0200
++++ icedtea6-1.8/Makefile.am	2010-06-30 11:42:02.606648734 +0200
+@@ -1882,7 +1882,7 @@
+ # configure script arguments, quoted in single quotes
+ CONFIGURE_ARGS = @CONFIGURE_ARGS@
+ ADD_ZERO_CONFIGURE_ARGS = \
+-	--with-openjdk=$(abs_top_builddir)/$(BUILD_OUTPUT_DIR)/j2sdk-image \
++	--with-openjdk=$(abs_top_builddir)/bootstrap/jdk1.6.0 \
+ 	--enable-zero
+ if ADD_SHARK_BUILD
+ ADD_ZERO_CONFIGURE_ARGS += \
diff --git a/recipes/openjdk/openjdk-6/zero-cmpswap-long.patch b/recipes/openjdk/openjdk-6/zero-cmpswap-long.patch
new file mode 100644
index 0000000..ca21ccf
--- /dev/null
+++ b/recipes/openjdk/openjdk-6/zero-cmpswap-long.patch
@@ -0,0 +1,20 @@
+Index: icedtea6-1.8/ports/hotspot/src/os_cpu/linux_zero/vm/atomic_linux_zero.inline.hpp
+===================================================================
+--- icedtea6-1.8.orig/ports/hotspot/src/os_cpu/linux_zero/vm/atomic_linux_zero.inline.hpp	2010-06-17 10:26:16.885292426 +0200
++++ icedtea6-1.8/ports/hotspot/src/os_cpu/linux_zero/vm/atomic_linux_zero.inline.hpp	2010-06-17 10:29:19.034668305 +0200
+@@ -266,7 +266,15 @@
+                              volatile jlong* dest,
+                              jlong compare_value) {
+ 
++#ifdef ARM
++  return arm_compare_and_swap((jint *) dest, (jint) compare_value, (jint) exchange_value);
++#else
++#ifdef M68K
++  return m68k_compare_and_swap((jint *) dest, (jint) compare_value, (jint) exchange_value);
++#else
+   return __sync_val_compare_and_swap(dest, compare_value, exchange_value);
++#endif // M68K
++#endif // ARM
+ }
+ 
+ inline intptr_t Atomic::cmpxchg_ptr(intptr_t exchange_value,
diff --git a/recipes/openjdk/openjdk-6_6b24-1.11.1.bb b/recipes/openjdk/openjdk-6_6b24-1.11.1.bb
new file mode 100644
index 0000000..0a43281
--- /dev/null
+++ b/recipes/openjdk/openjdk-6_6b24-1.11.1.bb
@@ -0,0 +1,18 @@
+require openjdk-6-release-6b24.inc
+
+PR = "${INC_PR}.0"
+
+ICEDTEA = "icedtea6-1.11.1"
+
+SRC_URI[iced.md5sum] = "e51d9d2f0328cc5aa7a00943abd96ed6"
+SRC_URI[iced.sha256sum] = "bafb0e21e1edf5ee22871b13dbc0a8a0d3efd894551fb91d5f59783069b6912c"
+
+CACAO_VERSION = "cff92704c4e0"
+SRC_URI[cacao.md5sum] = "40b811b8b7f01b51cd21e62255691bc7"
+SRC_URI[cacao.sha256sum] = "dc768c9d097fb056ad34fc6d5a57e8fd4f3b24bf515be92acc5ee4208160eb3f"
+
+JAMVM_VERSION = "4617da717ecb05654ea5bb9572338061106a414d"
+SRC_URI[jamvm.md5sum] = "740c2587502831cac6797d1233a7e27b"
+SRC_URI[jamvm.sha256sum] = "47fce7bd556c1b1d29a93b8c45497e0d872b48b7f535066b303336f29d0f0d8d"
+
+FILESPATH =. "${FILE_DIRNAME}/openjdk-6-6b24:"
-- 
1.7.9



