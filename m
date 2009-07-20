Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jackpot51@gmail.com>) id 1MT0fk-000619-6W
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jul 2009 23:45:24 +0200
Received: by qw-out-1920.google.com with SMTP id 4so819534qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2009 14:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:from:date:message-id
	:subject:to:content-type:content-transfer-encoding;
	bh=PV1Xzk1/VYj4yUWd00YREZqdx7R3knDUb4PpONJqSbw=;
	b=X51QU0WJrxGoUv9H7gV2tKhgyct659TYuMwoWXx46b9ee6Q4HlE/3jKujxVO9TuMN3
	Zv79H8L4/yVD31OAzfnwxTWnwAgZ/nZn15xprnW1KzVv/rZiPmElI7/ZDyS5oEv8AmwK
	ucQz1cEdDTPWLZ7TjL0mDfJ18/DayCcv5AWxs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=bAwoYwOmL/qk19zrv40SWVxZRot6JjRV1Gjf3In7JsB9wLdxnHYhn24vZmDcHXmxoz
	ySeyqsTjIQrvwmX6FEvHyn7KSp9Nk0aB0aGl9M0Gnd8VxEJywl5fYp0HpM++kn4AzbXw
	mr/YfGuieAMpQW1+5aOJYca6S1IF8J8rJV5UM=
MIME-Version: 1.0
Received: by 10.231.13.141 with SMTP id c13mr399871iba.56.1248125485244; Mon, 
	20 Jul 2009 14:31:25 -0700 (PDT)
From: Jeremy Soller <jackpot51@gmail.com>
Date: Mon, 20 Jul 2009 15:31:05 -0600
Message-ID: <40c7baa30907201431q6183f0afob5286a19464f71c6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Mono 2.4.2.2 Yet Again-someone delete my dupes please
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
X-List-Received-Date: Mon, 20 Jul 2009 21:45:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

diff -uprN a/conf/checksums.ini b/conf/checksums.ini
--- a/conf/checksums.ini	2009-07-20 12:50:37.019558572 -0600
+++ b/conf/checksums.ini	2009-07-20 12:54:05.916682718 -0600
@@ -28270,3 +28270,7 @@ sha256=f57c4e33eb2cdd87a6c2f01bfa4794340
 md5=5f7b88ebb2bcd7e8044328482d079661
 sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af

+[http://ftp.novell.com/pub/mono/sources/mono/mono-2.4.2.2.tar.bz2]
+md5=54aac9b914c5a4dc81c2bfd058df1c93
+sha256=e3b965c56a669c3012856dcc17b7400d28505dd4bb8a3c6eb3e653bb41b5e6ba
+
diff -uprN a/recipes/mono/files/mono-fix-libdir-path.patch
b/recipes/mono/files/mono-fix-libdir-path.patch
--- a/recipes/mono/files/mono-fix-libdir-path.patch	2009-07-20
12:50:48.099681989 -0600
+++ b/recipes/mono/files/mono-fix-libdir-path.patch	2009-07-16
09:02:36.979601000 -0600
@@ -1,5 +1,5 @@
---- mono-1.2.5/scripts/Makefile.am.orig	2007-09-27 04:23:39.000000000 +0200
-+++ mono-1.2.5/scripts/Makefile.am	2007-09-27 04:24:19.000000000 +0200
+--- mono-2.4.2/scripts/Makefile.am.orig	2007-09-27 04:23:39.000000000 +0200
++++ mono-2.4.2/scripts/Makefile.am	2007-09-27 04:24:19.000000000 +0200
 @@ -92,7 +92,7 @@
  mono_instdir = $(shell cygpath -m $(libdir))/mono
  else
diff -uprN a/recipes/mono/mono-1.2.5.1/configure.patch
b/recipes/mono/mono-1.2.5.1/configure.patch
--- a/recipes/mono/mono-1.2.5.1/configure.patch	2009-07-20
12:50:48.100684122 -0600
+++ b/recipes/mono/mono-1.2.5.1/configure.patch	1969-12-31
17:00:00.000000000 -0700
@@ -1,67 +0,0 @@
-Index: mono-1.2.5/configure.in
-===================================================================
---- mono-1.2.5.orig/configure.in
-+++ mono-1.2.5/configure.in
-@@ -1134,6 +1134,8 @@ if test x$platform_win32 = xno; then
- 		], [
- 				AC_MSG_RESULT(no)
- 				with_tls=pthread
-+		], [
-+				AC_MSG_RESULT(yes)
- 		])
- 	fi
-
-@@ -1236,6 +1238,9 @@ if test x$platform_win32 = xno; then
- 		], [
- 				with_sigaltstack=no
- 				AC_MSG_RESULT(no)
-+		], [
-+				AC_MSG_RESULT(yes)
-+				AC_DEFINE(HAVE_WORKING_SIGALTSTACK)
- 		])
- 	fi
-
-@@ -1893,24 +1898,26 @@ if test "x$with_tls" = "x__thread"; then
- 	])
- fi
-
--if test ${TARGET} = ARM; then
--	dnl ******************************************
--	dnl *** Check to see what FPU is available ***
--	dnl ******************************************
--	AC_MSG_CHECKING(which FPU to use)
--
--	AC_TRY_COMPILE([], [
--		__asm__ ("ldfd f0, [r0]");
--		], fpu=FPA, [
--			AC_TRY_COMPILE([], [
--				__asm__ ("fldd d0, [r0]");
--			], fpu=VFP, fpu=NONE)
--		])
-+#if test ${TARGET} = ARM; then
-+#	dnl ******************************************
-+#	dnl *** Check to see what FPU is available ***
-+#	dnl ******************************************
-+#	AC_MSG_CHECKING(which FPU to use)
-+#
-+#	AC_TRY_COMPILE([], [
-+#		__asm__ ("ldfd f0, [r0]");
-+#		], fpu=FPA, [
-+#			AC_TRY_COMPILE([], [
-+#				__asm__ ("fldd d0, [r0]");
-+#			], fpu=VFP, fpu=NONE)
-+#		])
-+#
-+#	AC_MSG_RESULT($fpu)
-+#	CPPFLAGS="$CPPFLAGS -DARM_FPU_$fpu=1"
-+#	unset fpu
-+#fi
-
--	AC_MSG_RESULT($fpu)
--	CPPFLAGS="$CPPFLAGS -DARM_FPU_$fpu=1"
--	unset fpu
--fi
-+	CPPFLAGS="$CPPFLAGS -DARM_FPU_NONE=1"
-
- if test ${TARGET} = unknown; then
- 	CPPFLAGS="$CPPFLAGS -DNO_PORT"
diff -uprN a/recipes/mono/mono-1.2.5.1/disable-monoburg.patch
b/recipes/mono/mono-1.2.5.1/disable-monoburg.patch
--- a/recipes/mono/mono-1.2.5.1/disable-monoburg.patch	2009-07-20
12:50:48.100684122 -0600
+++ b/recipes/mono/mono-1.2.5.1/disable-monoburg.patch	1969-12-31
17:00:00.000000000 -0700
@@ -1,22 +0,0 @@
-Index: mono-1.2.5.1/mono/Makefile.am
-===================================================================
---- mono-1.2.5.1.orig/mono/Makefile.am	2008-03-05 15:52:06.000000000 +0800
-+++ mono-1.2.5.1/mono/Makefile.am	2008-03-05 15:52:23.000000000 +0800
-@@ -1,3 +1,3 @@
-
--SUBDIRS = utils io-layer monoburg os cil metadata \
-+SUBDIRS = utils io-layer os cil metadata \
-       arch interpreter mini dis monograph tests benchmark profiler
-Index: mono-1.2.5.1/mono/mini/Makefile.am
-===================================================================
---- mono-1.2.5.1.orig/mono/mini/Makefile.am	2008-03-05 16:02:51.000000000 +0800
-+++ mono-1.2.5.1/mono/mini/Makefile.am	2008-03-05 16:02:57.000000000 +0800
-@@ -436,7 +436,7 @@
- 	$(GENMDESC_PRG) $(srcdir)/cpu-mips.md cpu-mips.h mips_desc
-
- inssel.c inssel.h: $(BURGSRC)
--	$(monodir)/mono/monoburg/monoburg -c 1 -p -e $(BURGSRC) -d inssel.h
-s inssel.c
-+	monoburg -c 1 -p -e $(BURGSRC) -d inssel.h -s inssel.c
-
- testi: mono test.exe
- 	$(RUNTIME) -v -v --ncompile 1 --compile Test:$(mtest) test.exe
diff -uprN a/recipes/mono/mono_1.2.5.1.bb b/recipes/mono/mono_1.2.5.1.bb
--- a/recipes/mono/mono_1.2.5.1.bb	2009-07-20 12:50:48.104680933 -0600
+++ b/recipes/mono/mono_1.2.5.1.bb	1969-12-31 17:00:00.000000000 -0700
@@ -1,83 +0,0 @@
-require mono_1.2.5.inc
-
-DEPENDS = "mono-native mono-mcs-intermediate glib-2.0 perl-native"
-
-PR = "r5"
-
-# mono makes use of non-thumb-compatible inline asm.
-ARM_INSTRUCTION_SET = "arm"
-
-SRC_URI += "file://configure.patch;patch=1 \
-	file://genmdesc-cpp.patch;patch=1 \
-	file://disable-monoburg.patch;patch=1"
-
-# Per http://www.mono-project.com/Mono:ARM
-EXTRA_OECONF += " --disable-mcs-build "
-# Instead, get the mcs tree from a different build (see mono-mcs-intermediate)
-
-do_install_prepend() {
-	install -d ${D}
-	cd ${D}
-	tar -xzf ${STAGING_DATADIR_NATIVE}/mono-mcs/mono-mcs-${PV}.tar.gz
-	cd ${S}
-}
-
-do_install_append() {
-	# mono-mcs-intermediate builds and installs jay (a Yacc for Java and C#),
-	# however, jay is not being cross-compiled and thus only
-	# available for the buildhost architecture, so remove it
-	# entirely
-	cd ${D}
-	rm -rf ./usr/share/man/man1/jay.1 ./usr/share/jay \
-	    ./usr/share/jay/README.jay \
-	    ./usr/bin/jay
-	cd ${S}
-
-	# Not packaged with the default rules and apparently
-	# not used for anything
-	rm -rf ${D}${datadir}/mono-1.0/mono/cil/cil-opcodes.xml
-}
-
-inherit mono
-
-# Import file definitions from Debian
-require mono_1.2.5.1-files.inc
-
-# Add some packages
-PACKAGES_append = " mono-doc mono mono-runtime"
-
-FILES_mono-doc_append = " /usr/share/libgc-mono/ "
-
-FILES_mono = ""
-ALLOW_EMPTY_mono = "1"
-RDEPENDS_mono = "mono-common mono-jit"
-
-FILES_mono-runtime = ""
-ALLOW_EMPTY_mono-runtime = "1"
-RDEPENDS_mono-runtime = "mono-jit mono-gac"
-
-RDEPENDS_mono-jit = "mono-common"
-
-FILES_libmono-dev =+ " /usr/lib/libmono.la
/usr/lib/libmono-profiler-cov.la /usr/lib/libmono-profiler-aot.la \
-	/usr/lib/libMonoPosixHelper.la /usr/lib/libMonoSupportW.la"
-FILES_libmono-dbg =+ " /usr/lib/.debug/libmono*.so.*
/usr/lib/.debug/libikvm-native.so \
-	/usr/lib/.debug/libMonoPosixHelper.so /usr/lib/.debug/libMonoSupportW.so"
-
-# Packages not included in Debian
-PACKAGES_prepend = "libnunit2.2-cil-dbg libnunit2.2-cil-dev libnunit2.2-cil \
-	libmono-cecil0.5-cil-dbg libmono-cecil0.5-cil-dev libmono-cecil0.5-cil \
-	libmono-db2-1.0-cil-dbg libmono-db2-1.0-cil-dev libmono-db2-1.0-cil"
-
-FILES_libnunit2.2-cil = "/usr/lib/mono/gac/nunit.*/2.2.*
/usr/lib/mono/1.0/nunit.*.dll"
-FILES_libnunit2.2-cil-dev = "/usr/lib/pkgconfig/mono-nunit.pc"
-FILES_libnunit2.2-cil-dbg = "/usr/lib/mono/gac/nunit*/2.2.*/nunit.*.dll.mdb"
-
-FILES_libmono-cecil0.5-cil = "/usr/lib/mono/gac/Mono.Cecil/0.5.*"
-FILES_libmono-cecil0.5-cil-dbg =
"/usr/lib/mono/gac/Mono.Cecil/0.5.0.1__0738eb9f132ed756/Mono.Cecil.dll.mdb"
-
-FILES_libmono-db2-1.0-cil = "/usr/lib/mono/gac/IBM.Data.DB2/1.0*
/usr/lib/mono/1.0/IBM.Data.DB2.dll"
-FILES_libmono-db2-1.0-cil-dbg =
"/usr/lib/mono/gac/IBM.Data.DB2/1.0*/IBM.Data.DB2.dll.mdb"
-
-# Move .pc files
-FILES_libmono-cairo1.0-cil-dev = "/usr/lib/pkgconfig/mono-cairo.pc"
-PACKAGES =+ " libmono-cairo1.0-cil-dev "
diff -uprN a/recipes/mono/mono_1.2.5.1-files.inc
b/recipes/mono/mono_1.2.5.1-files.inc
--- a/recipes/mono/mono_1.2.5.1-files.inc	2009-07-20 12:50:48.103680893 -0600
+++ b/recipes/mono/mono_1.2.5.1-files.inc	1969-12-31 17:00:00.000000000 -0700
@@ -1,1634 +0,0 @@
-# This is a generated file, please do not edit directly
-# Use collect-files.py instead. -- Henryk <henryk@openmoko.org>
-FILES_mono-jit-dbg += "/usr/bin/mono*.mdb \
-	/usr/bin/mono*/*.mdb"
-FILES_mono-jit = "/usr/bin/mono"
-FILES_mono-gac-dbg += "/usr/bin/gacutil*.mdb \
-	/usr/bin/gacutil*/*.mdb \
-	/usr/lib/mono/1.0/gacutil.exe*.mdb \
-	/usr/lib/mono/1.0/gacutil.exe*/*.mdb"
-FILES_mono-gac = "/usr/bin/gacutil \
-	/usr/lib/mono/1.0/gacutil.exe"
-FILES_mono-mjs-dbg += "/usr/bin/mjs*.mdb \
-	/usr/bin/mjs*/*.mdb \
-	/usr/lib/mono/1.0/mjs.exe*.mdb \
-	/usr/lib/mono/1.0/mjs.exe*/*.mdb"
-FILES_mono-mjs = "/usr/bin/mjs \
-	/usr/lib/mono/1.0/mjs.exe*"
-FILES_mono-gmcs-dbg += "/usr/bin/gmcs*.mdb \
-	/usr/bin/gmcs*/*.mdb \
-	/usr/bin/wsdl2*.mdb \
-	/usr/bin/wsdl2*/*.mdb \
-	/usr/bin/monop2*.mdb \
-	/usr/bin/monop2*/*.mdb \
-	/usr/bin/ilasm2*.mdb \
-	/usr/bin/ilasm2*/*.mdb \
-	/usr/bin/resgen2*.mdb \
-	/usr/bin/resgen2*/*.mdb \
-	/usr/bin/mono-api-info2*.mdb \
-	/usr/bin/mono-api-info2*/*.mdb \
-	/usr/bin/mono-service2*.mdb \
-	/usr/bin/mono-service2*/*.mdb \
-	/usr/bin/mkbundle2*.mdb \
-	/usr/bin/mkbundle2*/*.mdb \
-	/usr/bin/xbuild*.mdb \
-	/usr/bin/xbuild*/*.mdb \
-	/usr/bin/sgen*.mdb \
-	/usr/bin/sgen*/*.mdb \
-	/usr/bin/al2*.mdb \
-	/usr/bin/al2*/*.mdb \
-	/usr/bin/httpcfg*.mdb \
-	/usr/bin/httpcfg*/*.mdb \
-	/usr/lib/mono/2.0/*.exe*.mdb \
-	/usr/lib/mono/2.0/*.exe*/*.mdb \
-	/usr/lib/mono/2.0/xbuild.rsp*.mdb \
-	/usr/lib/mono/2.0/xbuild.rsp*/*.mdb \
-	/usr/lib/mono/2.0/MSBuild/*.mdb \
-	/usr/lib/mono/2.0/MSBuild/*/*.mdb \
-	/usr/lib/mono/2.0/MSBuild/.debug/ \
-	/usr/lib/mono/2.0/MSBuild/../.debug/ \
-	/usr/lib/mono/2.0/Microsoft.Build.xsd*.mdb \
-	/usr/lib/mono/2.0/Microsoft.Build.xsd*/*.mdb \
-	/usr/lib/mono/2.0/Microsoft.CSharp.targets*.mdb \
-	/usr/lib/mono/2.0/Microsoft.CSharp.targets*/*.mdb \
-	/usr/lib/mono/2.0/Microsoft.Common.tasks*.mdb \
-	/usr/lib/mono/2.0/Microsoft.Common.tasks*/*.mdb \
-	/usr/lib/mono/2.0/Microsoft.Common.targets*.mdb \
-	/usr/lib/mono/2.0/Microsoft.Common.targets*/*.mdb \
-	/usr/lib/mono/2.0/Microsoft.VisualBasic.targets*.mdb \
-	/usr/lib/mono/2.0/Microsoft.VisualBasic.targets*/*.mdb"
-FILES_mono-gmcs = "/usr/bin/gmcs \
-	/usr/bin/wsdl2 \
-	/usr/bin/monop2 \
-	/usr/bin/ilasm2 \
-	/usr/bin/resgen2 \
-	/usr/bin/mono-api-info2 \
-	/usr/bin/mono-service2 \
-	/usr/bin/mkbundle2 \
-	/usr/bin/xbuild \
-	/usr/bin/sgen \
-	/usr/bin/al2 \
-	/usr/bin/httpcfg \
-	/usr/lib/mono/2.0/*.exe* \
-	/usr/lib/mono/2.0/xbuild.rsp \
-	/usr/lib/mono/2.0/MSBuild/ \
-	/usr/lib/mono/2.0/Microsoft.Build.xsd \
-	/usr/lib/mono/2.0/Microsoft.CSharp.targets \
-	/usr/lib/mono/2.0/Microsoft.Common.tasks \
-	/usr/lib/mono/2.0/Microsoft.Common.targets \
-	/usr/lib/mono/2.0/Microsoft.VisualBasic.targets"
-FILES_mono-utils-dbg += "/usr/bin/pedump*.mdb \
-	/usr/bin/pedump*/*.mdb \
-	/usr/bin/monodis*.mdb \
-	/usr/bin/monodis*/*.mdb \
-	/usr/bin/monograph*.mdb \
-	/usr/bin/monograph*/*.mdb \
-	/usr/bin/mono-find-provides*.mdb \
-	/usr/bin/mono-find-provides*/*.mdb \
-	/usr/bin/mono-find-requires*.mdb \
-	/usr/bin/mono-find-requires*/*.mdb"
-FILES_mono-utils = "/usr/bin/pedump \
-	/usr/bin/monodis \
-	/usr/bin/monograph \
-	/usr/bin/mono-find-provides \
-	/usr/bin/mono-find-requires"
-FILES_libmono-peapi1.0-cil-dbg += "/usr/lib/mono/gac/PEAPI/1.0.*/*.mdb \
-	/usr/lib/mono/gac/PEAPI/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/PEAPI/1.0.*/.debug/ \
-	/usr/lib/mono/gac/PEAPI/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/PEAPI.dll*.mdb \
-	/usr/lib/mono/1.0/PEAPI.dll*/*.mdb"
-FILES_libmono-peapi1.0-cil = "/usr/lib/mono/gac/PEAPI/1.0.*/ \
-	/usr/lib/mono/1.0/PEAPI.dll"
-FILES_libmono-cairo1.0-cil-dbg += "/usr/lib/mono/gac/Mono.Cairo/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Cairo/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Cairo/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Cairo/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Mono.Cairo.dll*.mdb \
-	/usr/lib/mono/1.0/Mono.Cairo.dll*/*.mdb \
-	/usr/lib/pkgconfig/mono-cairo.pc*.mdb \
-	/usr/lib/pkgconfig/mono-cairo.pc*/*.mdb"
-FILES_libmono-cairo1.0-cil = "/usr/lib/mono/gac/Mono.Cairo/1.0.*/ \
-	/usr/lib/mono/1.0/Mono.Cairo.dll \
-	/usr/lib/pkgconfig/mono-cairo.pc"
-FILES_libmono-system-web2.0-cil-dbg +=
"/usr/lib/mono/gac/System.Web/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Web/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Web/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Web/2.0.*/../.debug/ \
-	/usr/lib/mono/gac/System.Web.Services/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Web.Services/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Web.Services/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Web.Services/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/System.Web.dll*.mdb \
-	/usr/lib/mono/2.0/System.Web.dll*/*.mdb \
-	/usr/lib/mono/2.0/System.Web.Services.dll*.mdb \
-	/usr/lib/mono/2.0/System.Web.Services.dll*/*.mdb"
-FILES_libmono-system-web2.0-cil = "/usr/lib/mono/gac/System.Web/2.0.*/ \
-	/usr/lib/mono/gac/System.Web.Services/2.0.*/ \
-	/usr/lib/mono/2.0/System.Web.dll \
-	/usr/lib/mono/2.0/System.Web.Services.dll"
-FILES_libmono-accessibility2.0-cil-dbg +=
"/usr/lib/mono/gac/Accessibility/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Accessibility/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Accessibility/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Accessibility/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Accessibility.dll*.mdb \
-	/usr/lib/mono/2.0/Accessibility.dll*/*.mdb"
-FILES_libmono-accessibility2.0-cil = "/usr/lib/mono/gac/Accessibility/2.0.*/ \
-	/usr/lib/mono/2.0/Accessibility.dll"
-FILES_libmono-microsoft7.0-cil-dbg +=
"/usr/lib/mono/gac/Microsoft.JScript/7.0.*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.JScript/7.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.JScript/7.0.*/.debug/ \
-	/usr/lib/mono/gac/Microsoft.JScript/7.0.*/../.debug/ \
-	/usr/lib/mono/gac/Microsoft.VisualC/7.0.*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.VisualC/7.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.VisualC/7.0.*/.debug/ \
-	/usr/lib/mono/gac/Microsoft.VisualC/7.0.*/../.debug/ \
-	/usr/lib/mono/gac/Microsoft.Vsa/7.0.*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.Vsa/7.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.Vsa/7.0.*/.debug/ \
-	/usr/lib/mono/gac/Microsoft.Vsa/7.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Microsoft.JScript.dll*.mdb \
-	/usr/lib/mono/1.0/Microsoft.JScript.dll*/*.mdb \
-	/usr/lib/mono/1.0/Microsoft.VisualC.dll*.mdb \
-	/usr/lib/mono/1.0/Microsoft.VisualC.dll*/*.mdb \
-	/usr/lib/mono/1.0/Microsoft.Vsa.dll*.mdb \
-	/usr/lib/mono/1.0/Microsoft.Vsa.dll*/*.mdb"
-FILES_libmono-microsoft7.0-cil = "/usr/lib/mono/gac/Microsoft.JScript/7.0.*/ \
-	/usr/lib/mono/gac/Microsoft.VisualC/7.0.*/ \
-	/usr/lib/mono/gac/Microsoft.Vsa/7.0.*/ \
-	/usr/lib/mono/1.0/Microsoft.JScript.dll \
-	/usr/lib/mono/1.0/Microsoft.VisualC.dll \
-	/usr/lib/mono/1.0/Microsoft.Vsa.dll"
-FILES_libmono-winforms2.0-cil-dbg +=
"/usr/lib/mono/gac/System.Windows.Forms/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Windows.Forms/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Windows.Forms/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Windows.Forms/2.0.*/../.debug/ \
-	/usr/lib/mono/gac/System.Drawing.Design/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Drawing.Design/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Drawing.Design/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Drawing.Design/2.0.*/../.debug/ \
-	/usr/lib/mono/gac/System.Design/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Design/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Design/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Design/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/System.Windows.Forms.dll*.mdb \
-	/usr/lib/mono/2.0/System.Windows.Forms.dll*/*.mdb \
-	/usr/lib/mono/2.0/System.Drawing.Design.dll*.mdb \
-	/usr/lib/mono/2.0/System.Drawing.Design.dll*/*.mdb \
-	/usr/lib/mono/2.0/System.Design.dll*.mdb \
-	/usr/lib/mono/2.0/System.Design.dll*/*.mdb"
-FILES_libmono-winforms2.0-cil =
"/usr/lib/mono/gac/System.Windows.Forms/2.0.*/ \
-	/usr/lib/mono/gac/System.Drawing.Design/2.0.*/ \
-	/usr/lib/mono/gac/System.Design/2.0.*/ \
-	/usr/lib/mono/2.0/System.Windows.Forms.dll \
-	/usr/lib/mono/2.0/System.Drawing.Design.dll \
-	/usr/lib/mono/2.0/System.Design.dll"
-FILES_libmono-ldap1.0-cil-dbg +=
"/usr/lib/mono/gac/Novell.Directory.Ldap/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Novell.Directory.Ldap/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Novell.Directory.Ldap/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Novell.Directory.Ldap/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Novell.Directory.Ldap.dll*.mdb \
-	/usr/lib/mono/1.0/Novell.Directory.Ldap.dll*/*.mdb"
-FILES_libmono-ldap1.0-cil = "/usr/lib/mono/gac/Novell.Directory.Ldap/1.0.*/ \
-	/usr/lib/mono/1.0/Novell.Directory.Ldap.dll"
-FILES_libmono-sharpzip2.84-cil-dbg +=
"/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.84.*/*.mdb \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.84.*/*/*.mdb \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.84.*/.debug/ \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.84.*/../.debug/ \
-	/usr/lib/mono/2.0/ICSharpCode.SharpZipLib.dll*.mdb \
-	/usr/lib/mono/2.0/ICSharpCode.SharpZipLib.dll*/*.mdb"
-FILES_libmono-sharpzip2.84-cil =
"/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.84.*/ \
-	/usr/lib/mono/2.0/ICSharpCode.SharpZipLib.dll"
-FILES_libmono-system-data2.0-cil-dbg +=
"/usr/lib/mono/gac/System.Data/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Data/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Data/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Data/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/System.Data.dll*.mdb \
-	/usr/lib/mono/2.0/System.Data.dll*/*.mdb"
-FILES_libmono-system-data2.0-cil = "/usr/lib/mono/gac/System.Data/2.0.*/ \
-	/usr/lib/mono/2.0/System.Data.dll"
-FILES_libmono-corlib2.0-cil-dbg += "/usr/lib/mono/gac/I18N*/2.0.*/*.mdb \
-	/usr/lib/mono/gac/I18N*/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/I18N*/2.0.*/.debug/ \
-	/usr/lib/mono/gac/I18N*/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/I18N*.dll*.mdb \
-	/usr/lib/mono/2.0/I18N*.dll*/*.mdb \
-	/usr/lib/mono/2.0/mscorlib.dll*.mdb \
-	/usr/lib/mono/2.0/mscorlib.dll*/*.mdb"
-FILES_libmono-corlib2.0-cil = "/usr/lib/mono/gac/I18N*/2.0.*/ \
-	/usr/lib/mono/2.0/I18N*.dll \
-	/usr/lib/mono/2.0/mscorlib.dll*"
-FILES_libmono-winforms1.0-cil-dbg +=
"/usr/lib/mono/gac/System.Windows.Forms/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Windows.Forms/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Windows.Forms/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Windows.Forms/1.0.*/../.debug/ \
-	/usr/lib/mono/gac/System.Drawing.Design/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Drawing.Design/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Drawing.Design/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Drawing.Design/1.0.*/../.debug/ \
-	/usr/lib/mono/gac/System.Design/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Design/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Design/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Design/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/System.Windows.Forms.dll*.mdb \
-	/usr/lib/mono/1.0/System.Windows.Forms.dll*/*.mdb \
-	/usr/lib/mono/1.0/System.Drawing.Design.dll*.mdb \
-	/usr/lib/mono/1.0/System.Drawing.Design.dll*/*.mdb \
-	/usr/lib/mono/1.0/System.Design.dll*.mdb \
-	/usr/lib/mono/1.0/System.Design.dll*/*.mdb"
-FILES_libmono-winforms1.0-cil =
"/usr/lib/mono/gac/System.Windows.Forms/1.0.*/ \
-	/usr/lib/mono/gac/System.Drawing.Design/1.0.*/ \
-	/usr/lib/mono/gac/System.Design/1.0.*/ \
-	/usr/lib/mono/1.0/System.Windows.Forms.dll \
-	/usr/lib/mono/1.0/System.Drawing.Design.dll \
-	/usr/lib/mono/1.0/System.Design.dll"
-FILES_libmono-microsoft8.0-cil-dbg +=
"/usr/lib/mono/gac/Microsoft.JScript/8.0.*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.JScript/8.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.JScript/8.0.*/.debug/ \
-	/usr/lib/mono/gac/Microsoft.JScript/8.0.*/../.debug/ \
-	/usr/lib/mono/gac/Microsoft.VisualC/8.0.*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.VisualC/8.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.VisualC/8.0.*/.debug/ \
-	/usr/lib/mono/gac/Microsoft.VisualC/8.0.*/../.debug/ \
-	/usr/lib/mono/gac/Microsoft.Vsa/8.0.*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.Vsa/8.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.Vsa/8.0.*/.debug/ \
-	/usr/lib/mono/gac/Microsoft.Vsa/8.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Microsoft.JScript.dll*.mdb \
-	/usr/lib/mono/2.0/Microsoft.JScript.dll*/*.mdb \
-	/usr/lib/mono/2.0/Microsoft.VisualC.dll*.mdb \
-	/usr/lib/mono/2.0/Microsoft.VisualC.dll*/*.mdb \
-	/usr/lib/mono/2.0/Microsoft.Vsa.dll*.mdb \
-	/usr/lib/mono/2.0/Microsoft.Vsa.dll*/*.mdb"
-FILES_libmono-microsoft8.0-cil = "/usr/lib/mono/gac/Microsoft.JScript/8.0.*/ \
-	/usr/lib/mono/gac/Microsoft.VisualC/8.0.*/ \
-	/usr/lib/mono/gac/Microsoft.Vsa/8.0.*/ \
-	/usr/lib/mono/2.0/Microsoft.JScript.dll \
-	/usr/lib/mono/2.0/Microsoft.VisualC.dll \
-	/usr/lib/mono/2.0/Microsoft.Vsa.dll"
-FILES_libmono-corlib1.0-cil-dbg += "/usr/lib/mono/gac/I18N*/1.0.*/*.mdb \
-	/usr/lib/mono/gac/I18N*/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/I18N*/1.0.*/.debug/ \
-	/usr/lib/mono/gac/I18N*/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/I18N*.dll*.mdb \
-	/usr/lib/mono/1.0/I18N*.dll*/*.mdb \
-	/usr/lib/mono/1.0/mscorlib.dll*.mdb \
-	/usr/lib/mono/1.0/mscorlib.dll*/*.mdb"
-FILES_libmono-corlib1.0-cil = "/usr/lib/mono/gac/I18N*/1.0.*/ \
-	/usr/lib/mono/1.0/I18N*.dll \
-	/usr/lib/mono/1.0/mscorlib.dll*"
-FILES_libmono-system-web1.0-cil-dbg +=
"/usr/lib/mono/gac/System.Web/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Web/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Web/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Web/1.0.*/../.debug/ \
-	/usr/lib/mono/gac/System.Web.Services/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Web.Services/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Web.Services/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Web.Services/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/System.Web.dll*.mdb \
-	/usr/lib/mono/1.0/System.Web.dll*/*.mdb \
-	/usr/lib/mono/1.0/System.Web.Services.dll*.mdb \
-	/usr/lib/mono/1.0/System.Web.Services.dll*/*.mdb"
-FILES_libmono-system-web1.0-cil = "/usr/lib/mono/gac/System.Web/1.0.*/ \
-	/usr/lib/mono/gac/System.Web.Services/1.0.*/ \
-	/usr/lib/mono/1.0/System.Web.dll \
-	/usr/lib/mono/1.0/System.Web.Services.dll"
-FILES_libmono-system-runtime2.0-cil-dbg +=
"/usr/lib/mono/gac/System.Runtime.*/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Runtime.*/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Runtime.*/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Runtime.*/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/System.Runtime.*.dll*.mdb \
-	/usr/lib/mono/2.0/System.Runtime.*.dll*/*.mdb"
-FILES_libmono-system-runtime2.0-cil =
"/usr/lib/mono/gac/System.Runtime.*/2.0.*/ \
-	/usr/lib/mono/2.0/System.Runtime.*.dll"
-FILES_libmono-cscompmgd8.0-cil-dbg +=
"/usr/lib/mono/gac/cscompmgd/8.0.*/*.mdb \
-	/usr/lib/mono/gac/cscompmgd/8.0.*/*/*.mdb \
-	/usr/lib/mono/gac/cscompmgd/8.0.*/.debug/ \
-	/usr/lib/mono/gac/cscompmgd/8.0.*/../.debug/ \
-	/usr/lib/mono/2.0/cscompmgd.dll*.mdb \
-	/usr/lib/mono/2.0/cscompmgd.dll*/*.mdb"
-FILES_libmono-cscompmgd8.0-cil = "/usr/lib/mono/gac/cscompmgd/8.0.*/ \
-	/usr/lib/mono/2.0/cscompmgd.dll"
-FILES_libmono-cscompmgd7.0-cil-dbg +=
"/usr/lib/mono/gac/cscompmgd/7.0.*/*.mdb \
-	/usr/lib/mono/gac/cscompmgd/7.0.*/*/*.mdb \
-	/usr/lib/mono/gac/cscompmgd/7.0.*/.debug/ \
-	/usr/lib/mono/gac/cscompmgd/7.0.*/../.debug/ \
-	/usr/lib/mono/1.0/cscompmgd.dll*.mdb \
-	/usr/lib/mono/1.0/cscompmgd.dll*/*.mdb"
-FILES_libmono-cscompmgd7.0-cil = "/usr/lib/mono/gac/cscompmgd/7.0.*/ \
-	/usr/lib/mono/1.0/cscompmgd.dll"
-FILES_libmono-firebirdsql1.7-cil-dbg +=
"/usr/lib/mono/gac/FirebirdSql.Data.Firebird/1.7.*/*.mdb \
-	/usr/lib/mono/gac/FirebirdSql.Data.Firebird/1.7.*/*/*.mdb \
-	/usr/lib/mono/gac/FirebirdSql.Data.Firebird/1.7.*/.debug/ \
-	/usr/lib/mono/gac/FirebirdSql.Data.Firebird/1.7.*/../.debug/ \
-	/usr/lib/mono/1.0/FirebirdSql.Data.Firebird.dll*.mdb \
-	/usr/lib/mono/1.0/FirebirdSql.Data.Firebird.dll*/*.mdb"
-FILES_libmono-firebirdsql1.7-cil =
"/usr/lib/mono/gac/FirebirdSql.Data.Firebird/1.7.*/ \
-	/usr/lib/mono/1.0/FirebirdSql.Data.Firebird.dll"
-FILES_mono-jay-dbg += "/usr/bin/jay*.mdb \
-	/usr/bin/jay*/*.mdb"
-FILES_mono-jay = "/usr/bin/jay"
-FILES_libmono-data-tds1.0-cil-dbg +=
"/usr/lib/mono/gac/Mono.Data.Tds/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.Tds/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.Tds/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Data.Tds/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Mono.Data.Tds.dll*.mdb \
-	/usr/lib/mono/1.0/Mono.Data.Tds.dll*/*.mdb"
-FILES_libmono-data-tds1.0-cil = "/usr/lib/mono/gac/Mono.Data.Tds/1.0.*/ \
-	/usr/lib/mono/1.0/Mono.Data.Tds.dll"
-FILES_libmono-sqlite1.0-cil-dbg +=
"/usr/lib/mono/gac/Mono.Data.Sqlite/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.Sqlite/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.Sqlite/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Data.Sqlite/1.0.*/../.debug/ \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Mono.Data.Sqlite.dll*.mdb \
-	/usr/lib/mono/1.0/Mono.Data.Sqlite.dll*/*.mdb \
-	/usr/lib/mono/1.0/Mono.Data.SqliteClient.dll*.mdb \
-	/usr/lib/mono/1.0/Mono.Data.SqliteClient.dll*/*.mdb"
-FILES_libmono-sqlite1.0-cil = "/usr/lib/mono/gac/Mono.Data.Sqlite/1.0.*/ \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/1.0.*/ \
-	/usr/lib/mono/1.0/Mono.Data.Sqlite.dll \
-	/usr/lib/mono/1.0/Mono.Data.SqliteClient.dll"
-FILES_libmono-relaxng1.0-cil-dbg +=
"/usr/lib/mono/gac/Commons.Xml.Relaxng/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Commons.Xml.Relaxng/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Commons.Xml.Relaxng/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Commons.Xml.Relaxng/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Commons.Xml.Relaxng.dll*.mdb \
-	/usr/lib/mono/1.0/Commons.Xml.Relaxng.dll*/*.mdb"
-FILES_libmono-relaxng1.0-cil = "/usr/lib/mono/gac/Commons.Xml.Relaxng/1.0.*/ \
-	/usr/lib/mono/1.0/Commons.Xml.Relaxng.dll"
-FILES_libmono-dev-dbg += "/usr/lib/libmono*.a*.mdb \
-	/usr/lib/libmono*.a*/*.mdb \
-	/usr/lib/libMono*.a*.mdb \
-	/usr/lib/libMono*.a*/*.mdb \
-	/usr/lib/libmono*.so*.mdb \
-	/usr/lib/libmono*.so*/*.mdb \
-	/usr/lib/libMonoSupportW.a*.mdb \
-	/usr/lib/libMonoSupportW.a*/*.mdb \
-	/usr/lib/pkgconfig/mono.pc*.mdb \
-	/usr/lib/pkgconfig/mono.pc*/*.mdb \
-	/usr/lib/pkgconfig/dotnet.pc*.mdb \
-	/usr/lib/pkgconfig/dotnet.pc*/*.mdb \
-	/usr/include/*.mdb \
-	/usr/include/*/*.mdb \
-	/usr/include/.debug/ \
-	/usr/include/../.debug/"
-FILES_libmono-dev = "/usr/lib/libmono*.a \
-	/usr/lib/libMono*.a \
-	/usr/lib/libmono*.so \
-	/usr/lib/libMonoSupportW.a \
-	/usr/lib/pkgconfig/mono.pc \
-	/usr/lib/pkgconfig/dotnet.pc \
-	/usr/include/"
-FILES_libmono-accessibility1.0-cil-dbg +=
"/usr/lib/mono/gac/Accessibility/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Accessibility/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Accessibility/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Accessibility/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Accessibility.dll*.mdb \
-	/usr/lib/mono/1.0/Accessibility.dll*/*.mdb"
-FILES_libmono-accessibility1.0-cil = "/usr/lib/mono/gac/Accessibility/1.0.*/ \
-	/usr/lib/mono/1.0/Accessibility.dll"
-FILES_mono-common-dbg += "/etc/mono*.mdb \
-	/etc/mono*/*.mdb \
-	/usr/share/mono-1.0/mono/cil/cil-opcodes.xml*.mdb \
-	/usr/share/mono-1.0/mono/cil/cil-opcodes.xml*/*.mdb"
-FILES_mono-common = "/etc/mono \
-	/usr/share/mono-1.0/mono/cil/cil-opcodes.xml"
-FILES_libmono-oracle1.0-cil-dbg +=
"/usr/lib/mono/gac/System.Data.OracleClient/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Data.OracleClient/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Data.OracleClient/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Data.OracleClient/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/System.Data.OracleClient.dll*.mdb \
-	/usr/lib/mono/1.0/System.Data.OracleClient.dll*/*.mdb"
-FILES_libmono-oracle1.0-cil =
"/usr/lib/mono/gac/System.Data.OracleClient/1.0.*/ \
-	/usr/lib/mono/1.0/System.Data.OracleClient.dll"
-FILES_libmono-system-data1.0-cil-dbg +=
"/usr/lib/mono/gac/System.Data/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Data/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Data/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Data/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/System.Data.dll*.mdb \
-	/usr/lib/mono/1.0/System.Data.dll*/*.mdb"
-FILES_libmono-system-data1.0-cil = "/usr/lib/mono/gac/System.Data/1.0.*/ \
-	/usr/lib/mono/1.0/System.Data.dll"
-FILES_libmono-bytefx0.7.6.2-cil-dbg +=
"/usr/lib/mono/gac/ByteFX.Data/0.7.6.2*/*.mdb \
-	/usr/lib/mono/gac/ByteFX.Data/0.7.6.2*/*/*.mdb \
-	/usr/lib/mono/gac/ByteFX.Data/0.7.6.2*/.debug/ \
-	/usr/lib/mono/gac/ByteFX.Data/0.7.6.2*/../.debug/ \
-	/usr/lib/mono/2.0/ByteFX.Data.dll*.mdb \
-	/usr/lib/mono/2.0/ByteFX.Data.dll*/*.mdb"
-FILES_libmono-bytefx0.7.6.2-cil = "/usr/lib/mono/gac/ByteFX.Data/0.7.6.2*/ \
-	/usr/lib/mono/2.0/ByteFX.Data.dll"
-FILES_libmono0-dbg += "/usr/lib/libmono*.so.*.mdb \
-	/usr/lib/libmono*.so.*/*.mdb \
-	/usr/lib/libMonoPosixHelper.so*.mdb \
-	/usr/lib/libMonoPosixHelper.so*/*.mdb \
-	/usr/lib/libMonoSupportW.so*.mdb \
-	/usr/lib/libMonoSupportW.so*/*.mdb"
-FILES_libmono0 = "/usr/lib/libmono*.so.* \
-	/usr/lib/libMonoPosixHelper.so \
-	/usr/lib/libMonoSupportW.so"
-FILES_libmono-sharpzip0.6-cil-dbg +=
"/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.6.*/*.mdb \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.6.*/*/*.mdb \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.6.*/.debug/ \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.6.*/../.debug/ \
-	/usr/lib/mono/compat-1.0/ICSharpCode.SharpZipLib.dll*.mdb \
-	/usr/lib/mono/compat-1.0/ICSharpCode.SharpZipLib.dll*/*.mdb"
-FILES_libmono-sharpzip0.6-cil =
"/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.6.*/ \
-	/usr/lib/mono/compat-1.0/ICSharpCode.SharpZipLib.dll"
-FILES_libmono-data-tds2.0-cil-dbg +=
"/usr/lib/mono/gac/Mono.Data.Tds/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.Tds/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.Tds/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Data.Tds/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Mono.Data.Tds.dll*.mdb \
-	/usr/lib/mono/2.0/Mono.Data.Tds.dll*/*.mdb"
-FILES_libmono-data-tds2.0-cil = "/usr/lib/mono/gac/Mono.Data.Tds/2.0.*/ \
-	/usr/lib/mono/2.0/Mono.Data.Tds.dll"
-FILES_libmono-system-messaging1.0-cil-dbg +=
"/usr/lib/mono/gac/System.Messaging/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Messaging/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Messaging/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Messaging/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/System.Messaging.dll*.mdb \
-	/usr/lib/mono/1.0/System.Messaging.dll*/*.mdb"
-FILES_libmono-system-messaging1.0-cil =
"/usr/lib/mono/gac/System.Messaging/1.0.*/ \
-	/usr/lib/mono/1.0/System.Messaging.dll"
-FILES_libmono-npgsql1.0-cil-dbg += "/usr/lib/mono/gac/Npgsql/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Npgsql/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Npgsql/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Npgsql/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Npgsql.dll*.mdb \
-	/usr/lib/mono/1.0/Npgsql.dll*/*.mdb"
-FILES_libmono-npgsql1.0-cil = "/usr/lib/mono/gac/Npgsql/1.0.*/ \
-	/usr/lib/mono/1.0/Npgsql.dll"
-FILES_libmono-security2.0-cil-dbg +=
"/usr/lib/mono/gac/Mono.Security/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Security/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Security/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Security/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Mono.Security.dll*.mdb \
-	/usr/lib/mono/2.0/Mono.Security.dll*/*.mdb"
-FILES_libmono-security2.0-cil = "/usr/lib/mono/gac/Mono.Security/2.0.*/ \
-	/usr/lib/mono/2.0/Mono.Security.dll"
-FILES_libmono-security1.0-cil-dbg +=
"/usr/lib/mono/gac/Mono.Security/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Security/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Security/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Security/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Mono.Security.dll*.mdb \
-	/usr/lib/mono/1.0/Mono.Security.dll*/*.mdb"
-FILES_libmono-security1.0-cil = "/usr/lib/mono/gac/Mono.Security/1.0.*/ \
-	/usr/lib/mono/1.0/Mono.Security.dll"
-FILES_libmono-bytefx0.7.6.1-cil-dbg +=
"/usr/lib/mono/gac/ByteFX.Data/0.7.6.1*/*.mdb \
-	/usr/lib/mono/gac/ByteFX.Data/0.7.6.1*/*/*.mdb \
-	/usr/lib/mono/gac/ByteFX.Data/0.7.6.1*/.debug/ \
-	/usr/lib/mono/gac/ByteFX.Data/0.7.6.1*/../.debug/ \
-	/usr/lib/mono/1.0/ByteFX.Data.dll*.mdb \
-	/usr/lib/mono/1.0/ByteFX.Data.dll*/*.mdb"
-FILES_libmono-bytefx0.7.6.1-cil = "/usr/lib/mono/gac/ByteFX.Data/0.7.6.1*/ \
-	/usr/lib/mono/1.0/ByteFX.Data.dll"
-FILES_libmono-microsoft-build2.0-cil-dbg +=
"/usr/lib/mono/gac/Microsoft.Build.*/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.Build.*/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.Build.*/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Microsoft.Build.*/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Microsoft.Build.*.dll*.mdb \
-	/usr/lib/mono/2.0/Microsoft.Build.*.dll*/*.mdb"
-FILES_libmono-microsoft-build2.0-cil =
"/usr/lib/mono/gac/Microsoft.Build.*/2.0.*/ \
-	/usr/lib/mono/2.0/Microsoft.Build.*.dll"
-FILES_libmono-system-ldap1.0-cil-dbg +=
"/usr/lib/mono/gac/System.DirectoryServices/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.DirectoryServices/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.DirectoryServices/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.DirectoryServices/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/System.DirectoryServices.dll*.mdb \
-	/usr/lib/mono/1.0/System.DirectoryServices.dll*/*.mdb"
-FILES_libmono-system-ldap1.0-cil =
"/usr/lib/mono/gac/System.DirectoryServices/1.0.*/ \
-	/usr/lib/mono/1.0/System.DirectoryServices.dll"
-FILES_libmono-relaxng2.0-cil-dbg +=
"/usr/lib/mono/gac/Commons.Xml.Relaxng/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Commons.Xml.Relaxng/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Commons.Xml.Relaxng/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Commons.Xml.Relaxng/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Commons.Xml.Relaxng.dll*.mdb \
-	/usr/lib/mono/2.0/Commons.Xml.Relaxng.dll*/*.mdb"
-FILES_libmono-relaxng2.0-cil = "/usr/lib/mono/gac/Commons.Xml.Relaxng/2.0.*/ \
-	/usr/lib/mono/2.0/Commons.Xml.Relaxng.dll"
-FILES_libmono-system-ldap2.0-cil-dbg +=
"/usr/lib/mono/gac/System.DirectoryServices/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.DirectoryServices/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.DirectoryServices/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.DirectoryServices/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/System.DirectoryServices.dll*.mdb \
-	/usr/lib/mono/2.0/System.DirectoryServices.dll*/*.mdb"
-FILES_libmono-system-ldap2.0-cil =
"/usr/lib/mono/gac/System.DirectoryServices/2.0.*/ \
-	/usr/lib/mono/2.0/System.DirectoryServices.dll"
-FILES_libmono-system-messaging2.0-cil-dbg +=
"/usr/lib/mono/gac/System.Messaging/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Messaging/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Messaging/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Messaging/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/System.Messaging.dll*.mdb \
-	/usr/lib/mono/2.0/System.Messaging.dll*/*.mdb"
-FILES_libmono-system-messaging2.0-cil =
"/usr/lib/mono/gac/System.Messaging/2.0.*/ \
-	/usr/lib/mono/2.0/System.Messaging.dll"
-FILES_libmono-sharpzip0.84-cil-dbg +=
"/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.84.*/*.mdb \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.84.*/*/*.mdb \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.84.*/.debug/ \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.84.*/../.debug/ \
-	/usr/lib/mono/1.0/ICSharpCode.SharpZipLib.dll*.mdb \
-	/usr/lib/mono/1.0/ICSharpCode.SharpZipLib.dll*/*.mdb"
-FILES_libmono-sharpzip0.84-cil =
"/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.84.*/ \
-	/usr/lib/mono/1.0/ICSharpCode.SharpZipLib.dll"
-FILES_libmono-sqlite2.0-cil-dbg +=
"/usr/lib/mono/gac/Mono.Data.Sqlite/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.Sqlite/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.Sqlite/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Data.Sqlite/2.0.*/../.debug/ \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Mono.Data.Sqlite.dll*.mdb \
-	/usr/lib/mono/2.0/Mono.Data.Sqlite.dll*/*.mdb \
-	/usr/lib/mono/2.0/Mono.Data.SqliteClient.dll*.mdb \
-	/usr/lib/mono/2.0/Mono.Data.SqliteClient.dll*/*.mdb"
-FILES_libmono-sqlite2.0-cil = "/usr/lib/mono/gac/Mono.Data.Sqlite/2.0.*/ \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/2.0.*/ \
-	/usr/lib/mono/2.0/Mono.Data.Sqlite.dll \
-	/usr/lib/mono/2.0/Mono.Data.SqliteClient.dll"
-FILES_libmono-ldap2.0-cil-dbg +=
"/usr/lib/mono/gac/Novell.Directory.Ldap/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Novell.Directory.Ldap/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Novell.Directory.Ldap/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Novell.Directory.Ldap/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Novell.Directory.Ldap.dll*.mdb \
-	/usr/lib/mono/2.0/Novell.Directory.Ldap.dll*/*.mdb"
-FILES_libmono-ldap2.0-cil = "/usr/lib/mono/gac/Novell.Directory.Ldap/2.0.*/ \
-	/usr/lib/mono/2.0/Novell.Directory.Ldap.dll"
-FILES_libmono-npgsql2.0-cil-dbg += "/usr/lib/mono/gac/Npgsql/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Npgsql/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Npgsql/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Npgsql/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Npgsql.dll*.mdb \
-	/usr/lib/mono/2.0/Npgsql.dll*/*.mdb"
-FILES_libmono-npgsql2.0-cil = "/usr/lib/mono/gac/Npgsql/2.0.*/ \
-	/usr/lib/mono/2.0/Npgsql.dll"
-FILES_libmono-system-runtime1.0-cil-dbg +=
"/usr/lib/mono/gac/System.Runtime.*/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Runtime.*/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Runtime.*/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Runtime.*/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/System.Runtime.*.dll*.mdb \
-	/usr/lib/mono/1.0/System.Runtime.*.dll*/*.mdb"
-FILES_libmono-system-runtime1.0-cil =
"/usr/lib/mono/gac/System.Runtime.*/1.0.*/ \
-	/usr/lib/mono/1.0/System.Runtime.*.dll"
-FILES_libmono-oracle2.0-cil-dbg +=
"/usr/lib/mono/gac/System.Data.OracleClient/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Data.OracleClient/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Data.OracleClient/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Data.OracleClient/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/System.Data.OracleClient.dll*.mdb \
-	/usr/lib/mono/2.0/System.Data.OracleClient.dll*/*.mdb"
-FILES_libmono-oracle2.0-cil =
"/usr/lib/mono/gac/System.Data.OracleClient/2.0.*/ \
-	/usr/lib/mono/2.0/System.Data.OracleClient.dll"
-FILES_libmono-c5-1.0-cil-dbg += "/usr/lib/mono/gac/Mono.C5/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.C5/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.C5/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.C5/1.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Mono.C5.dll*.mdb \
-	/usr/lib/mono/2.0/Mono.C5.dll*/*.mdb"
-FILES_libmono-c5-1.0-cil = "/usr/lib/mono/gac/Mono.C5/1.0.*/ \
-	/usr/lib/mono/2.0/Mono.C5.dll"
-FILES_libmono-sharpzip2.6-cil-dbg +=
"/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.6.*/*.mdb \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.6.*/*/*.mdb \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.6.*/.debug/ \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.6.*/../.debug/ \
-	/usr/lib/mono/compat-2.0/ICSharpCode.SharpZipLib.dll*.mdb \
-	/usr/lib/mono/compat-2.0/ICSharpCode.SharpZipLib.dll*/*.mdb"
-FILES_libmono-sharpzip2.6-cil =
"/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.6.*/ \
-	/usr/lib/mono/compat-2.0/ICSharpCode.SharpZipLib.dll"
-FILES_libmono-cairo2.0-cil-dbg += "/usr/lib/mono/gac/Mono.Cairo/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Cairo/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Cairo/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Cairo/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Mono.Cairo.dll*.mdb \
-	/usr/lib/mono/2.0/Mono.Cairo.dll*/*.mdb"
-FILES_libmono-cairo2.0-cil = "/usr/lib/mono/gac/Mono.Cairo/2.0.*/ \
-	/usr/lib/mono/2.0/Mono.Cairo.dll"
-FILES_libmono-peapi2.0-cil-dbg += "/usr/lib/mono/gac/PEAPI/2.0.*/*.mdb \
-	/usr/lib/mono/gac/PEAPI/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/PEAPI/2.0.*/.debug/ \
-	/usr/lib/mono/gac/PEAPI/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/PEAPI.dll*.mdb \
-	/usr/lib/mono/2.0/PEAPI.dll*/*.mdb"
-FILES_libmono-peapi2.0-cil = "/usr/lib/mono/gac/PEAPI/2.0.*/ \
-	/usr/lib/mono/2.0/PEAPI.dll"
-FILES_mono-mcs-dbg += "/usr/bin/*.mdb \
-	/usr/bin/*/*.mdb \
-	/usr/bin/.debug/ \
-	/usr/bin/../.debug/ \
-	/usr/lib/mono/1.0/*.exe*.mdb \
-	/usr/lib/mono/1.0/*.exe*/*.mdb"
-FILES_mono-mcs = "/usr/bin/ \
-	/usr/lib/mono/1.0/*.exe*"
-FILES_libmono-system1.0-cil-dbg += "/usr/lib/mono/gac/System*/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System*/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System*/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System*/1.0.*/../.debug/ \
-	/usr/lib/mono/gac/CustomMarshalers/1.0.*/*.mdb \
-	/usr/lib/mono/gac/CustomMarshalers/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/CustomMarshalers/1.0.*/.debug/ \
-	/usr/lib/mono/gac/CustomMarshalers/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/System*.dll*.mdb \
-	/usr/lib/mono/1.0/System*.dll*/*.mdb \
-	/usr/lib/mono/1.0/CustomMarshalers.dll*.mdb \
-	/usr/lib/mono/1.0/CustomMarshalers.dll*/*.mdb"
-FILES_libmono-system1.0-cil = "/usr/lib/mono/gac/System*/1.0.*/ \
-	/usr/lib/mono/gac/CustomMarshalers/1.0.*/ \
-	/usr/lib/mono/1.0/System*.dll \
-	/usr/lib/mono/1.0/CustomMarshalers.dll*"
-FILES_libmono-system2.0-cil-dbg += "/usr/lib/mono/gac/System*/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System*/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System*/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System*/2.0.*/../.debug/ \
-	/usr/lib/mono/gac/CustomMarshalers/2.0.*/*.mdb \
-	/usr/lib/mono/gac/CustomMarshalers/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/CustomMarshalers/2.0.*/.debug/ \
-	/usr/lib/mono/gac/CustomMarshalers/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/System*.dll*.mdb \
-	/usr/lib/mono/2.0/System*.dll*/*.mdb \
-	/usr/lib/mono/2.0/CustomMarshalers.dll*.mdb \
-	/usr/lib/mono/2.0/CustomMarshalers.dll*/*.mdb"
-FILES_libmono-system2.0-cil = "/usr/lib/mono/gac/System*/2.0.*/ \
-	/usr/lib/mono/gac/CustomMarshalers/2.0.*/ \
-	/usr/lib/mono/2.0/System*.dll \
-	/usr/lib/mono/2.0/CustomMarshalers.dll*"
-FILES_libmono1.0-cil-dbg += "/usr/lib/mono/gac/Mono.*/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.*/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.*/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.*/1.0.*/../.debug/ \
-	/usr/lib/mono/gac/OpenSystem.C/1.0.*.mdb \
-	/usr/lib/mono/gac/OpenSystem.C/1.0.*/*.mdb \
-	/usr/lib/mono/gac/mono-service/1.0.*/*.mdb \
-	/usr/lib/mono/gac/mono-service/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/mono-service/1.0.*/.debug/ \
-	/usr/lib/mono/gac/mono-service/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Mono.*.dll*.mdb \
-	/usr/lib/mono/1.0/Mono.*.dll*/*.mdb \
-	/usr/lib/mono/1.0/OpenSystem.C.dll*.mdb \
-	/usr/lib/mono/1.0/OpenSystem.C.dll*/*.mdb"
-FILES_libmono1.0-cil = "/usr/lib/mono/gac/Mono.*/1.0.*/ \
-	/usr/lib/mono/gac/OpenSystem.C/1.0.* \
-	/usr/lib/mono/gac/mono-service/1.0.*/ \
-	/usr/lib/mono/1.0/Mono.*.dll \
-	/usr/lib/mono/1.0/OpenSystem.C.dll"
-FILES_libmono2.0-cil-dbg += "/usr/lib/mono/gac/Mono.*/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.*/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.*/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.*/2.0.*/../.debug/ \
-	/usr/lib/mono/gac/OpenSystem.C/2.0.*.mdb \
-	/usr/lib/mono/gac/OpenSystem.C/2.0.*/*.mdb \
-	/usr/lib/mono/gac/mono-service/2.0.*/*.mdb \
-	/usr/lib/mono/gac/mono-service/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/mono-service/2.0.*/.debug/ \
-	/usr/lib/mono/gac/mono-service/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Mono.*.dll*.mdb \
-	/usr/lib/mono/2.0/Mono.*.dll*/*.mdb \
-	/usr/lib/mono/2.0/OpenSystem.C.dll*.mdb \
-	/usr/lib/mono/2.0/OpenSystem.C.dll*/*.mdb"
-FILES_libmono2.0-cil = "/usr/lib/mono/gac/Mono.*/2.0.*/ \
-	/usr/lib/mono/gac/OpenSystem.C/2.0.* \
-	/usr/lib/mono/gac/mono-service/2.0.*/ \
-	/usr/lib/mono/2.0/Mono.*.dll \
-	/usr/lib/mono/2.0/OpenSystem.C.dll"
-
-PACKAGES = "mono-jit-dbg \
-	mono-jit \
-	mono-gac-dbg \
-	mono-gac \
-	mono-mjs-dbg \
-	mono-mjs \
-	mono-gmcs-dbg \
-	mono-gmcs \
-	mono-utils-dbg \
-	mono-utils \
-	libmono-peapi1.0-cil-dbg \
-	libmono-peapi1.0-cil \
-	libmono-cairo1.0-cil-dbg \
-	libmono-cairo1.0-cil \
-	libmono-system-web2.0-cil-dbg \
-	libmono-system-web2.0-cil \
-	libmono-accessibility2.0-cil-dbg \
-	libmono-accessibility2.0-cil \
-	libmono-microsoft7.0-cil-dbg \
-	libmono-microsoft7.0-cil \
-	libmono-winforms2.0-cil-dbg \
-	libmono-winforms2.0-cil \
-	libmono-ldap1.0-cil-dbg \
-	libmono-ldap1.0-cil \
-	libmono-sharpzip2.84-cil-dbg \
-	libmono-sharpzip2.84-cil \
-	libmono-system-data2.0-cil-dbg \
-	libmono-system-data2.0-cil \
-	libmono-corlib2.0-cil-dbg \
-	libmono-corlib2.0-cil \
-	libmono-winforms1.0-cil-dbg \
-	libmono-winforms1.0-cil \
-	libmono-microsoft8.0-cil-dbg \
-	libmono-microsoft8.0-cil \
-	libmono-corlib1.0-cil-dbg \
-	libmono-corlib1.0-cil \
-	libmono-system-web1.0-cil-dbg \
-	libmono-system-web1.0-cil \
-	libmono-system-runtime2.0-cil-dbg \
-	libmono-system-runtime2.0-cil \
-	libmono-cscompmgd8.0-cil-dbg \
-	libmono-cscompmgd8.0-cil \
-	libmono-cscompmgd7.0-cil-dbg \
-	libmono-cscompmgd7.0-cil \
-	libmono-firebirdsql1.7-cil-dbg \
-	libmono-firebirdsql1.7-cil \
-	mono-jay-dbg \
-	mono-jay \
-	libmono-data-tds1.0-cil-dbg \
-	libmono-data-tds1.0-cil \
-	libmono-sqlite1.0-cil-dbg \
-	libmono-sqlite1.0-cil \
-	libmono-relaxng1.0-cil-dbg \
-	libmono-relaxng1.0-cil \
-	libmono-dev-dbg \
-	libmono-dev \
-	libmono-accessibility1.0-cil-dbg \
-	libmono-accessibility1.0-cil \
-	mono-common-dbg \
-	mono-common \
-	libmono-oracle1.0-cil-dbg \
-	libmono-oracle1.0-cil \
-	libmono-system-data1.0-cil-dbg \
-	libmono-system-data1.0-cil \
-	libmono-bytefx0.7.6.2-cil-dbg \
-	libmono-bytefx0.7.6.2-cil \
-	libmono0-dbg \
-	libmono0 \
-	libmono-sharpzip0.6-cil-dbg \
-	libmono-sharpzip0.6-cil \
-	libmono-data-tds2.0-cil-dbg \
-	libmono-data-tds2.0-cil \
-	libmono-system-messaging1.0-cil-dbg \
-	libmono-system-messaging1.0-cil \
-	libmono-npgsql1.0-cil-dbg \
-	libmono-npgsql1.0-cil \
-	libmono-security2.0-cil-dbg \
-	libmono-security2.0-cil \
-	libmono-security1.0-cil-dbg \
-	libmono-security1.0-cil \
-	libmono-bytefx0.7.6.1-cil-dbg \
-	libmono-bytefx0.7.6.1-cil \
-	libmono-microsoft-build2.0-cil-dbg \
-	libmono-microsoft-build2.0-cil \
-	libmono-system-ldap1.0-cil-dbg \
-	libmono-system-ldap1.0-cil \
-	libmono-relaxng2.0-cil-dbg \
-	libmono-relaxng2.0-cil \
-	libmono-system-ldap2.0-cil-dbg \
-	libmono-system-ldap2.0-cil \
-	libmono-system-messaging2.0-cil-dbg \
-	libmono-system-messaging2.0-cil \
-	libmono-sharpzip0.84-cil-dbg \
-	libmono-sharpzip0.84-cil \
-	libmono-sqlite2.0-cil-dbg \
-	libmono-sqlite2.0-cil \
-	libmono-ldap2.0-cil-dbg \
-	libmono-ldap2.0-cil \
-	libmono-npgsql2.0-cil-dbg \
-	libmono-npgsql2.0-cil \
-	libmono-system-runtime1.0-cil-dbg \
-	libmono-system-runtime1.0-cil \
-	libmono-oracle2.0-cil-dbg \
-	libmono-oracle2.0-cil \
-	libmono-c5-1.0-cil-dbg \
-	libmono-c5-1.0-cil \
-	libmono-sharpzip2.6-cil-dbg \
-	libmono-sharpzip2.6-cil \
-	libmono-cairo2.0-cil-dbg \
-	libmono-cairo2.0-cil \
-	libmono-peapi2.0-cil-dbg \
-	libmono-peapi2.0-cil \
-	mono-mcs-dbg \
-	mono-mcs \
-	libmono-system1.0-cil-dbg \
-	libmono-system1.0-cil \
-	libmono-system2.0-cil-dbg \
-	libmono-system2.0-cil \
-	libmono1.0-cil-dbg \
-	libmono1.0-cil \
-	libmono2.0-cil-dbg \
-	libmono2.0-cil"
-# This is a generated file, please do not edit directly
-# Use collect-files.py instead. -- Henryk <henryk@openmoko.org>
-FILES_mono-jit-dbg += "/usr/bin/mono*.mdb \
-	/usr/bin/mono*/*.mdb"
-FILES_mono-jit = "/usr/bin/mono"
-FILES_mono-gac-dbg += "/usr/bin/gacutil*.mdb \
-	/usr/bin/gacutil*/*.mdb \
-	/usr/lib/mono/1.0/gacutil.exe*.mdb \
-	/usr/lib/mono/1.0/gacutil.exe*/*.mdb"
-FILES_mono-gac = "/usr/bin/gacutil \
-	/usr/lib/mono/1.0/gacutil.exe"
-FILES_mono-mjs-dbg += "/usr/bin/mjs*.mdb \
-	/usr/bin/mjs*/*.mdb \
-	/usr/lib/mono/1.0/mjs.exe*.mdb \
-	/usr/lib/mono/1.0/mjs.exe*/*.mdb"
-FILES_mono-mjs = "/usr/bin/mjs \
-	/usr/lib/mono/1.0/mjs.exe*"
-FILES_mono-gmcs-dbg += "/usr/bin/gmcs*.mdb \
-	/usr/bin/gmcs*/*.mdb \
-	/usr/bin/wsdl2*.mdb \
-	/usr/bin/wsdl2*/*.mdb \
-	/usr/bin/monop2*.mdb \
-	/usr/bin/monop2*/*.mdb \
-	/usr/bin/ilasm2*.mdb \
-	/usr/bin/ilasm2*/*.mdb \
-	/usr/bin/resgen2*.mdb \
-	/usr/bin/resgen2*/*.mdb \
-	/usr/bin/mono-api-info2*.mdb \
-	/usr/bin/mono-api-info2*/*.mdb \
-	/usr/bin/mono-service2*.mdb \
-	/usr/bin/mono-service2*/*.mdb \
-	/usr/bin/mkbundle2*.mdb \
-	/usr/bin/mkbundle2*/*.mdb \
-	/usr/bin/xbuild*.mdb \
-	/usr/bin/xbuild*/*.mdb \
-	/usr/bin/sgen*.mdb \
-	/usr/bin/sgen*/*.mdb \
-	/usr/bin/al2*.mdb \
-	/usr/bin/al2*/*.mdb \
-	/usr/bin/httpcfg*.mdb \
-	/usr/bin/httpcfg*/*.mdb \
-	/usr/lib/mono/2.0/*.exe*.mdb \
-	/usr/lib/mono/2.0/*.exe*/*.mdb \
-	/usr/lib/mono/2.0/xbuild.rsp*.mdb \
-	/usr/lib/mono/2.0/xbuild.rsp*/*.mdb \
-	/usr/lib/mono/2.0/MSBuild/*.mdb \
-	/usr/lib/mono/2.0/MSBuild/*/*.mdb \
-	/usr/lib/mono/2.0/MSBuild/.debug/ \
-	/usr/lib/mono/2.0/MSBuild/../.debug/ \
-	/usr/lib/mono/2.0/Microsoft.Build.xsd*.mdb \
-	/usr/lib/mono/2.0/Microsoft.Build.xsd*/*.mdb \
-	/usr/lib/mono/2.0/Microsoft.CSharp.targets*.mdb \
-	/usr/lib/mono/2.0/Microsoft.CSharp.targets*/*.mdb \
-	/usr/lib/mono/2.0/Microsoft.Common.tasks*.mdb \
-	/usr/lib/mono/2.0/Microsoft.Common.tasks*/*.mdb \
-	/usr/lib/mono/2.0/Microsoft.Common.targets*.mdb \
-	/usr/lib/mono/2.0/Microsoft.Common.targets*/*.mdb \
-	/usr/lib/mono/2.0/Microsoft.VisualBasic.targets*.mdb \
-	/usr/lib/mono/2.0/Microsoft.VisualBasic.targets*/*.mdb"
-FILES_mono-gmcs = "/usr/bin/gmcs \
-	/usr/bin/wsdl2 \
-	/usr/bin/monop2 \
-	/usr/bin/ilasm2 \
-	/usr/bin/resgen2 \
-	/usr/bin/mono-api-info2 \
-	/usr/bin/mono-service2 \
-	/usr/bin/mkbundle2 \
-	/usr/bin/xbuild \
-	/usr/bin/sgen \
-	/usr/bin/al2 \
-	/usr/bin/httpcfg \
-	/usr/lib/mono/2.0/*.exe* \
-	/usr/lib/mono/2.0/xbuild.rsp \
-	/usr/lib/mono/2.0/MSBuild/ \
-	/usr/lib/mono/2.0/Microsoft.Build.xsd \
-	/usr/lib/mono/2.0/Microsoft.CSharp.targets \
-	/usr/lib/mono/2.0/Microsoft.Common.tasks \
-	/usr/lib/mono/2.0/Microsoft.Common.targets \
-	/usr/lib/mono/2.0/Microsoft.VisualBasic.targets"
-FILES_mono-utils-dbg += "/usr/bin/pedump*.mdb \
-	/usr/bin/pedump*/*.mdb \
-	/usr/bin/monodis*.mdb \
-	/usr/bin/monodis*/*.mdb \
-	/usr/bin/monograph*.mdb \
-	/usr/bin/monograph*/*.mdb \
-	/usr/bin/mono-find-provides*.mdb \
-	/usr/bin/mono-find-provides*/*.mdb \
-	/usr/bin/mono-find-requires*.mdb \
-	/usr/bin/mono-find-requires*/*.mdb"
-FILES_mono-utils = "/usr/bin/pedump \
-	/usr/bin/monodis \
-	/usr/bin/monograph \
-	/usr/bin/mono-find-provides \
-	/usr/bin/mono-find-requires"
-FILES_libmono-peapi1.0-cil-dbg += "/usr/lib/mono/gac/PEAPI/1.0.*/*.mdb \
-	/usr/lib/mono/gac/PEAPI/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/PEAPI/1.0.*/.debug/ \
-	/usr/lib/mono/gac/PEAPI/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/PEAPI.dll*.mdb \
-	/usr/lib/mono/1.0/PEAPI.dll*/*.mdb"
-FILES_libmono-peapi1.0-cil = "/usr/lib/mono/gac/PEAPI/1.0.*/ \
-	/usr/lib/mono/1.0/PEAPI.dll"
-FILES_libmono-cairo1.0-cil-dbg += "/usr/lib/mono/gac/Mono.Cairo/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Cairo/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Cairo/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Cairo/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Mono.Cairo.dll*.mdb \
-	/usr/lib/mono/1.0/Mono.Cairo.dll*/*.mdb \
-	/usr/lib/pkgconfig/mono-cairo.pc*.mdb \
-	/usr/lib/pkgconfig/mono-cairo.pc*/*.mdb"
-FILES_libmono-cairo1.0-cil = "/usr/lib/mono/gac/Mono.Cairo/1.0.*/ \
-	/usr/lib/mono/1.0/Mono.Cairo.dll \
-	/usr/lib/pkgconfig/mono-cairo.pc"
-FILES_libmono-system-web2.0-cil-dbg +=
"/usr/lib/mono/gac/System.Web/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Web/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Web/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Web/2.0.*/../.debug/ \
-	/usr/lib/mono/gac/System.Web.Services/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Web.Services/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Web.Services/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Web.Services/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/System.Web.dll*.mdb \
-	/usr/lib/mono/2.0/System.Web.dll*/*.mdb \
-	/usr/lib/mono/2.0/System.Web.Services.dll*.mdb \
-	/usr/lib/mono/2.0/System.Web.Services.dll*/*.mdb"
-FILES_libmono-system-web2.0-cil = "/usr/lib/mono/gac/System.Web/2.0.*/ \
-	/usr/lib/mono/gac/System.Web.Services/2.0.*/ \
-	/usr/lib/mono/2.0/System.Web.dll \
-	/usr/lib/mono/2.0/System.Web.Services.dll"
-FILES_libmono-accessibility2.0-cil-dbg +=
"/usr/lib/mono/gac/Accessibility/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Accessibility/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Accessibility/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Accessibility/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Accessibility.dll*.mdb \
-	/usr/lib/mono/2.0/Accessibility.dll*/*.mdb"
-FILES_libmono-accessibility2.0-cil = "/usr/lib/mono/gac/Accessibility/2.0.*/ \
-	/usr/lib/mono/2.0/Accessibility.dll"
-FILES_libmono-microsoft7.0-cil-dbg +=
"/usr/lib/mono/gac/Microsoft.JScript/7.0.*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.JScript/7.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.JScript/7.0.*/.debug/ \
-	/usr/lib/mono/gac/Microsoft.JScript/7.0.*/../.debug/ \
-	/usr/lib/mono/gac/Microsoft.VisualC/7.0.*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.VisualC/7.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.VisualC/7.0.*/.debug/ \
-	/usr/lib/mono/gac/Microsoft.VisualC/7.0.*/../.debug/ \
-	/usr/lib/mono/gac/Microsoft.Vsa/7.0.*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.Vsa/7.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.Vsa/7.0.*/.debug/ \
-	/usr/lib/mono/gac/Microsoft.Vsa/7.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Microsoft.JScript.dll*.mdb \
-	/usr/lib/mono/1.0/Microsoft.JScript.dll*/*.mdb \
-	/usr/lib/mono/1.0/Microsoft.VisualC.dll*.mdb \
-	/usr/lib/mono/1.0/Microsoft.VisualC.dll*/*.mdb \
-	/usr/lib/mono/1.0/Microsoft.Vsa.dll*.mdb \
-	/usr/lib/mono/1.0/Microsoft.Vsa.dll*/*.mdb"
-FILES_libmono-microsoft7.0-cil = "/usr/lib/mono/gac/Microsoft.JScript/7.0.*/ \
-	/usr/lib/mono/gac/Microsoft.VisualC/7.0.*/ \
-	/usr/lib/mono/gac/Microsoft.Vsa/7.0.*/ \
-	/usr/lib/mono/1.0/Microsoft.JScript.dll \
-	/usr/lib/mono/1.0/Microsoft.VisualC.dll \
-	/usr/lib/mono/1.0/Microsoft.Vsa.dll"
-FILES_libmono-winforms2.0-cil-dbg +=
"/usr/lib/mono/gac/System.Windows.Forms/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Windows.Forms/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Windows.Forms/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Windows.Forms/2.0.*/../.debug/ \
-	/usr/lib/mono/gac/System.Drawing.Design/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Drawing.Design/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Drawing.Design/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Drawing.Design/2.0.*/../.debug/ \
-	/usr/lib/mono/gac/System.Design/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Design/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Design/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Design/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/System.Windows.Forms.dll*.mdb \
-	/usr/lib/mono/2.0/System.Windows.Forms.dll*/*.mdb \
-	/usr/lib/mono/2.0/System.Drawing.Design.dll*.mdb \
-	/usr/lib/mono/2.0/System.Drawing.Design.dll*/*.mdb \
-	/usr/lib/mono/2.0/System.Design.dll*.mdb \
-	/usr/lib/mono/2.0/System.Design.dll*/*.mdb"
-FILES_libmono-winforms2.0-cil =
"/usr/lib/mono/gac/System.Windows.Forms/2.0.*/ \
-	/usr/lib/mono/gac/System.Drawing.Design/2.0.*/ \
-	/usr/lib/mono/gac/System.Design/2.0.*/ \
-	/usr/lib/mono/2.0/System.Windows.Forms.dll \
-	/usr/lib/mono/2.0/System.Drawing.Design.dll \
-	/usr/lib/mono/2.0/System.Design.dll"
-FILES_libmono-ldap1.0-cil-dbg +=
"/usr/lib/mono/gac/Novell.Directory.Ldap/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Novell.Directory.Ldap/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Novell.Directory.Ldap/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Novell.Directory.Ldap/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Novell.Directory.Ldap.dll*.mdb \
-	/usr/lib/mono/1.0/Novell.Directory.Ldap.dll*/*.mdb"
-FILES_libmono-ldap1.0-cil = "/usr/lib/mono/gac/Novell.Directory.Ldap/1.0.*/ \
-	/usr/lib/mono/1.0/Novell.Directory.Ldap.dll"
-FILES_libmono-sharpzip2.84-cil-dbg +=
"/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.84.*/*.mdb \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.84.*/*/*.mdb \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.84.*/.debug/ \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.84.*/../.debug/ \
-	/usr/lib/mono/2.0/ICSharpCode.SharpZipLib.dll*.mdb \
-	/usr/lib/mono/2.0/ICSharpCode.SharpZipLib.dll*/*.mdb"
-FILES_libmono-sharpzip2.84-cil =
"/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.84.*/ \
-	/usr/lib/mono/2.0/ICSharpCode.SharpZipLib.dll"
-FILES_libmono-system-data2.0-cil-dbg +=
"/usr/lib/mono/gac/System.Data/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Data/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Data/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Data/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/System.Data.dll*.mdb \
-	/usr/lib/mono/2.0/System.Data.dll*/*.mdb"
-FILES_libmono-system-data2.0-cil = "/usr/lib/mono/gac/System.Data/2.0.*/ \
-	/usr/lib/mono/2.0/System.Data.dll"
-FILES_libmono-corlib2.0-cil-dbg += "/usr/lib/mono/gac/I18N*/2.0.*/*.mdb \
-	/usr/lib/mono/gac/I18N*/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/I18N*/2.0.*/.debug/ \
-	/usr/lib/mono/gac/I18N*/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/I18N*.dll*.mdb \
-	/usr/lib/mono/2.0/I18N*.dll*/*.mdb \
-	/usr/lib/mono/2.0/mscorlib.dll*.mdb \
-	/usr/lib/mono/2.0/mscorlib.dll*/*.mdb"
-FILES_libmono-corlib2.0-cil = "/usr/lib/mono/gac/I18N*/2.0.*/ \
-	/usr/lib/mono/2.0/I18N*.dll \
-	/usr/lib/mono/2.0/mscorlib.dll*"
-FILES_libmono-winforms1.0-cil-dbg +=
"/usr/lib/mono/gac/System.Windows.Forms/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Windows.Forms/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Windows.Forms/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Windows.Forms/1.0.*/../.debug/ \
-	/usr/lib/mono/gac/System.Drawing.Design/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Drawing.Design/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Drawing.Design/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Drawing.Design/1.0.*/../.debug/ \
-	/usr/lib/mono/gac/System.Design/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Design/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Design/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Design/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/System.Windows.Forms.dll*.mdb \
-	/usr/lib/mono/1.0/System.Windows.Forms.dll*/*.mdb \
-	/usr/lib/mono/1.0/System.Drawing.Design.dll*.mdb \
-	/usr/lib/mono/1.0/System.Drawing.Design.dll*/*.mdb \
-	/usr/lib/mono/1.0/System.Design.dll*.mdb \
-	/usr/lib/mono/1.0/System.Design.dll*/*.mdb"
-FILES_libmono-winforms1.0-cil =
"/usr/lib/mono/gac/System.Windows.Forms/1.0.*/ \
-	/usr/lib/mono/gac/System.Drawing.Design/1.0.*/ \
-	/usr/lib/mono/gac/System.Design/1.0.*/ \
-	/usr/lib/mono/1.0/System.Windows.Forms.dll \
-	/usr/lib/mono/1.0/System.Drawing.Design.dll \
-	/usr/lib/mono/1.0/System.Design.dll"
-FILES_libmono-microsoft8.0-cil-dbg +=
"/usr/lib/mono/gac/Microsoft.JScript/8.0.*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.JScript/8.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.JScript/8.0.*/.debug/ \
-	/usr/lib/mono/gac/Microsoft.JScript/8.0.*/../.debug/ \
-	/usr/lib/mono/gac/Microsoft.VisualC/8.0.*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.VisualC/8.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.VisualC/8.0.*/.debug/ \
-	/usr/lib/mono/gac/Microsoft.VisualC/8.0.*/../.debug/ \
-	/usr/lib/mono/gac/Microsoft.Vsa/8.0.*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.Vsa/8.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.Vsa/8.0.*/.debug/ \
-	/usr/lib/mono/gac/Microsoft.Vsa/8.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Microsoft.JScript.dll*.mdb \
-	/usr/lib/mono/2.0/Microsoft.JScript.dll*/*.mdb \
-	/usr/lib/mono/2.0/Microsoft.VisualC.dll*.mdb \
-	/usr/lib/mono/2.0/Microsoft.VisualC.dll*/*.mdb \
-	/usr/lib/mono/2.0/Microsoft.Vsa.dll*.mdb \
-	/usr/lib/mono/2.0/Microsoft.Vsa.dll*/*.mdb"
-FILES_libmono-microsoft8.0-cil = "/usr/lib/mono/gac/Microsoft.JScript/8.0.*/ \
-	/usr/lib/mono/gac/Microsoft.VisualC/8.0.*/ \
-	/usr/lib/mono/gac/Microsoft.Vsa/8.0.*/ \
-	/usr/lib/mono/2.0/Microsoft.JScript.dll \
-	/usr/lib/mono/2.0/Microsoft.VisualC.dll \
-	/usr/lib/mono/2.0/Microsoft.Vsa.dll"
-FILES_libmono-corlib1.0-cil-dbg += "/usr/lib/mono/gac/I18N*/1.0.*/*.mdb \
-	/usr/lib/mono/gac/I18N*/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/I18N*/1.0.*/.debug/ \
-	/usr/lib/mono/gac/I18N*/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/I18N*.dll*.mdb \
-	/usr/lib/mono/1.0/I18N*.dll*/*.mdb \
-	/usr/lib/mono/1.0/mscorlib.dll*.mdb \
-	/usr/lib/mono/1.0/mscorlib.dll*/*.mdb"
-FILES_libmono-corlib1.0-cil = "/usr/lib/mono/gac/I18N*/1.0.*/ \
-	/usr/lib/mono/1.0/I18N*.dll \
-	/usr/lib/mono/1.0/mscorlib.dll*"
-FILES_libmono-system-web1.0-cil-dbg +=
"/usr/lib/mono/gac/System.Web/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Web/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Web/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Web/1.0.*/../.debug/ \
-	/usr/lib/mono/gac/System.Web.Services/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Web.Services/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Web.Services/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Web.Services/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/System.Web.dll*.mdb \
-	/usr/lib/mono/1.0/System.Web.dll*/*.mdb \
-	/usr/lib/mono/1.0/System.Web.Services.dll*.mdb \
-	/usr/lib/mono/1.0/System.Web.Services.dll*/*.mdb"
-FILES_libmono-system-web1.0-cil = "/usr/lib/mono/gac/System.Web/1.0.*/ \
-	/usr/lib/mono/gac/System.Web.Services/1.0.*/ \
-	/usr/lib/mono/1.0/System.Web.dll \
-	/usr/lib/mono/1.0/System.Web.Services.dll"
-FILES_libmono-system-runtime2.0-cil-dbg +=
"/usr/lib/mono/gac/System.Runtime.*/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Runtime.*/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Runtime.*/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Runtime.*/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/System.Runtime.*.dll*.mdb \
-	/usr/lib/mono/2.0/System.Runtime.*.dll*/*.mdb"
-FILES_libmono-system-runtime2.0-cil =
"/usr/lib/mono/gac/System.Runtime.*/2.0.*/ \
-	/usr/lib/mono/2.0/System.Runtime.*.dll"
-FILES_libmono-cscompmgd8.0-cil-dbg +=
"/usr/lib/mono/gac/cscompmgd/8.0.*/*.mdb \
-	/usr/lib/mono/gac/cscompmgd/8.0.*/*/*.mdb \
-	/usr/lib/mono/gac/cscompmgd/8.0.*/.debug/ \
-	/usr/lib/mono/gac/cscompmgd/8.0.*/../.debug/ \
-	/usr/lib/mono/2.0/cscompmgd.dll*.mdb \
-	/usr/lib/mono/2.0/cscompmgd.dll*/*.mdb"
-FILES_libmono-cscompmgd8.0-cil = "/usr/lib/mono/gac/cscompmgd/8.0.*/ \
-	/usr/lib/mono/2.0/cscompmgd.dll"
-FILES_libmono-cscompmgd7.0-cil-dbg +=
"/usr/lib/mono/gac/cscompmgd/7.0.*/*.mdb \
-	/usr/lib/mono/gac/cscompmgd/7.0.*/*/*.mdb \
-	/usr/lib/mono/gac/cscompmgd/7.0.*/.debug/ \
-	/usr/lib/mono/gac/cscompmgd/7.0.*/../.debug/ \
-	/usr/lib/mono/1.0/cscompmgd.dll*.mdb \
-	/usr/lib/mono/1.0/cscompmgd.dll*/*.mdb"
-FILES_libmono-cscompmgd7.0-cil = "/usr/lib/mono/gac/cscompmgd/7.0.*/ \
-	/usr/lib/mono/1.0/cscompmgd.dll"
-FILES_libmono-firebirdsql1.7-cil-dbg +=
"/usr/lib/mono/gac/FirebirdSql.Data.Firebird/1.7.*/*.mdb \
-	/usr/lib/mono/gac/FirebirdSql.Data.Firebird/1.7.*/*/*.mdb \
-	/usr/lib/mono/gac/FirebirdSql.Data.Firebird/1.7.*/.debug/ \
-	/usr/lib/mono/gac/FirebirdSql.Data.Firebird/1.7.*/../.debug/ \
-	/usr/lib/mono/1.0/FirebirdSql.Data.Firebird.dll*.mdb \
-	/usr/lib/mono/1.0/FirebirdSql.Data.Firebird.dll*/*.mdb"
-FILES_libmono-firebirdsql1.7-cil =
"/usr/lib/mono/gac/FirebirdSql.Data.Firebird/1.7.*/ \
-	/usr/lib/mono/1.0/FirebirdSql.Data.Firebird.dll"
-FILES_mono-jay-dbg += "/usr/bin/jay*.mdb \
-	/usr/bin/jay*/*.mdb"
-FILES_mono-jay = "/usr/bin/jay"
-FILES_libmono-data-tds1.0-cil-dbg +=
"/usr/lib/mono/gac/Mono.Data.Tds/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.Tds/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.Tds/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Data.Tds/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Mono.Data.Tds.dll*.mdb \
-	/usr/lib/mono/1.0/Mono.Data.Tds.dll*/*.mdb"
-FILES_libmono-data-tds1.0-cil = "/usr/lib/mono/gac/Mono.Data.Tds/1.0.*/ \
-	/usr/lib/mono/1.0/Mono.Data.Tds.dll"
-FILES_libmono-sqlite1.0-cil-dbg +=
"/usr/lib/mono/gac/Mono.Data.Sqlite/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.Sqlite/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.Sqlite/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Data.Sqlite/1.0.*/../.debug/ \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Mono.Data.Sqlite.dll*.mdb \
-	/usr/lib/mono/1.0/Mono.Data.Sqlite.dll*/*.mdb \
-	/usr/lib/mono/1.0/Mono.Data.SqliteClient.dll*.mdb \
-	/usr/lib/mono/1.0/Mono.Data.SqliteClient.dll*/*.mdb"
-FILES_libmono-sqlite1.0-cil = "/usr/lib/mono/gac/Mono.Data.Sqlite/1.0.*/ \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/1.0.*/ \
-	/usr/lib/mono/1.0/Mono.Data.Sqlite.dll \
-	/usr/lib/mono/1.0/Mono.Data.SqliteClient.dll"
-FILES_libmono-relaxng1.0-cil-dbg +=
"/usr/lib/mono/gac/Commons.Xml.Relaxng/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Commons.Xml.Relaxng/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Commons.Xml.Relaxng/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Commons.Xml.Relaxng/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Commons.Xml.Relaxng.dll*.mdb \
-	/usr/lib/mono/1.0/Commons.Xml.Relaxng.dll*/*.mdb"
-FILES_libmono-relaxng1.0-cil = "/usr/lib/mono/gac/Commons.Xml.Relaxng/1.0.*/ \
-	/usr/lib/mono/1.0/Commons.Xml.Relaxng.dll"
-FILES_libmono-dev-dbg += "/usr/lib/libmono*.a*.mdb \
-	/usr/lib/libmono*.a*/*.mdb \
-	/usr/lib/libMono*.a*.mdb \
-	/usr/lib/libMono*.a*/*.mdb \
-	/usr/lib/libmono*.so*.mdb \
-	/usr/lib/libmono*.so*/*.mdb \
-	/usr/lib/libMonoSupportW.a*.mdb \
-	/usr/lib/libMonoSupportW.a*/*.mdb \
-	/usr/lib/pkgconfig/mono.pc*.mdb \
-	/usr/lib/pkgconfig/mono.pc*/*.mdb \
-	/usr/lib/pkgconfig/dotnet.pc*.mdb \
-	/usr/lib/pkgconfig/dotnet.pc*/*.mdb \
-	/usr/include/*.mdb \
-	/usr/include/*/*.mdb \
-	/usr/include/.debug/ \
-	/usr/include/../.debug/"
-FILES_libmono-dev = "/usr/lib/libmono*.a \
-	/usr/lib/libMono*.a \
-	/usr/lib/libmono*.so \
-	/usr/lib/libMonoSupportW.a \
-	/usr/lib/pkgconfig/mono.pc \
-	/usr/lib/pkgconfig/dotnet.pc \
-	/usr/include/"
-FILES_libmono-accessibility1.0-cil-dbg +=
"/usr/lib/mono/gac/Accessibility/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Accessibility/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Accessibility/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Accessibility/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Accessibility.dll*.mdb \
-	/usr/lib/mono/1.0/Accessibility.dll*/*.mdb"
-FILES_libmono-accessibility1.0-cil = "/usr/lib/mono/gac/Accessibility/1.0.*/ \
-	/usr/lib/mono/1.0/Accessibility.dll"
-FILES_mono-common-dbg += "/etc/mono*.mdb \
-	/etc/mono*/*.mdb \
-	/usr/share/mono-1.0/mono/cil/cil-opcodes.xml*.mdb \
-	/usr/share/mono-1.0/mono/cil/cil-opcodes.xml*/*.mdb"
-FILES_mono-common = "/etc/mono \
-	/usr/share/mono-1.0/mono/cil/cil-opcodes.xml"
-FILES_libmono-oracle1.0-cil-dbg +=
"/usr/lib/mono/gac/System.Data.OracleClient/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Data.OracleClient/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Data.OracleClient/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Data.OracleClient/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/System.Data.OracleClient.dll*.mdb \
-	/usr/lib/mono/1.0/System.Data.OracleClient.dll*/*.mdb"
-FILES_libmono-oracle1.0-cil =
"/usr/lib/mono/gac/System.Data.OracleClient/1.0.*/ \
-	/usr/lib/mono/1.0/System.Data.OracleClient.dll"
-FILES_libmono-system-data1.0-cil-dbg +=
"/usr/lib/mono/gac/System.Data/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Data/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Data/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Data/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/System.Data.dll*.mdb \
-	/usr/lib/mono/1.0/System.Data.dll*/*.mdb"
-FILES_libmono-system-data1.0-cil = "/usr/lib/mono/gac/System.Data/1.0.*/ \
-	/usr/lib/mono/1.0/System.Data.dll"
-FILES_libmono-bytefx0.7.6.2-cil-dbg +=
"/usr/lib/mono/gac/ByteFX.Data/0.7.6.2*/*.mdb \
-	/usr/lib/mono/gac/ByteFX.Data/0.7.6.2*/*/*.mdb \
-	/usr/lib/mono/gac/ByteFX.Data/0.7.6.2*/.debug/ \
-	/usr/lib/mono/gac/ByteFX.Data/0.7.6.2*/../.debug/ \
-	/usr/lib/mono/2.0/ByteFX.Data.dll*.mdb \
-	/usr/lib/mono/2.0/ByteFX.Data.dll*/*.mdb"
-FILES_libmono-bytefx0.7.6.2-cil = "/usr/lib/mono/gac/ByteFX.Data/0.7.6.2*/ \
-	/usr/lib/mono/2.0/ByteFX.Data.dll"
-FILES_libmono0-dbg += "/usr/lib/libmono*.so.*.mdb \
-	/usr/lib/libmono*.so.*/*.mdb \
-	/usr/lib/libMonoPosixHelper.so*.mdb \
-	/usr/lib/libMonoPosixHelper.so*/*.mdb \
-	/usr/lib/libMonoSupportW.so*.mdb \
-	/usr/lib/libMonoSupportW.so*/*.mdb"
-FILES_libmono0 = "/usr/lib/libmono*.so.* \
-	/usr/lib/libMonoPosixHelper.so \
-	/usr/lib/libMonoSupportW.so"
-FILES_libmono-sharpzip0.6-cil-dbg +=
"/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.6.*/*.mdb \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.6.*/*/*.mdb \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.6.*/.debug/ \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.6.*/../.debug/ \
-	/usr/lib/mono/compat-1.0/ICSharpCode.SharpZipLib.dll*.mdb \
-	/usr/lib/mono/compat-1.0/ICSharpCode.SharpZipLib.dll*/*.mdb"
-FILES_libmono-sharpzip0.6-cil =
"/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.6.*/ \
-	/usr/lib/mono/compat-1.0/ICSharpCode.SharpZipLib.dll"
-FILES_libmono-data-tds2.0-cil-dbg +=
"/usr/lib/mono/gac/Mono.Data.Tds/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.Tds/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.Tds/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Data.Tds/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Mono.Data.Tds.dll*.mdb \
-	/usr/lib/mono/2.0/Mono.Data.Tds.dll*/*.mdb"
-FILES_libmono-data-tds2.0-cil = "/usr/lib/mono/gac/Mono.Data.Tds/2.0.*/ \
-	/usr/lib/mono/2.0/Mono.Data.Tds.dll"
-FILES_libmono-system-messaging1.0-cil-dbg +=
"/usr/lib/mono/gac/System.Messaging/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Messaging/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Messaging/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Messaging/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/System.Messaging.dll*.mdb \
-	/usr/lib/mono/1.0/System.Messaging.dll*/*.mdb"
-FILES_libmono-system-messaging1.0-cil =
"/usr/lib/mono/gac/System.Messaging/1.0.*/ \
-	/usr/lib/mono/1.0/System.Messaging.dll"
-FILES_libmono-npgsql1.0-cil-dbg += "/usr/lib/mono/gac/Npgsql/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Npgsql/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Npgsql/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Npgsql/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Npgsql.dll*.mdb \
-	/usr/lib/mono/1.0/Npgsql.dll*/*.mdb"
-FILES_libmono-npgsql1.0-cil = "/usr/lib/mono/gac/Npgsql/1.0.*/ \
-	/usr/lib/mono/1.0/Npgsql.dll"
-FILES_libmono-security2.0-cil-dbg +=
"/usr/lib/mono/gac/Mono.Security/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Security/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Security/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Security/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Mono.Security.dll*.mdb \
-	/usr/lib/mono/2.0/Mono.Security.dll*/*.mdb"
-FILES_libmono-security2.0-cil = "/usr/lib/mono/gac/Mono.Security/2.0.*/ \
-	/usr/lib/mono/2.0/Mono.Security.dll"
-FILES_libmono-security1.0-cil-dbg +=
"/usr/lib/mono/gac/Mono.Security/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Security/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Security/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Security/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Mono.Security.dll*.mdb \
-	/usr/lib/mono/1.0/Mono.Security.dll*/*.mdb"
-FILES_libmono-security1.0-cil = "/usr/lib/mono/gac/Mono.Security/1.0.*/ \
-	/usr/lib/mono/1.0/Mono.Security.dll"
-FILES_libmono-bytefx0.7.6.1-cil-dbg +=
"/usr/lib/mono/gac/ByteFX.Data/0.7.6.1*/*.mdb \
-	/usr/lib/mono/gac/ByteFX.Data/0.7.6.1*/*/*.mdb \
-	/usr/lib/mono/gac/ByteFX.Data/0.7.6.1*/.debug/ \
-	/usr/lib/mono/gac/ByteFX.Data/0.7.6.1*/../.debug/ \
-	/usr/lib/mono/1.0/ByteFX.Data.dll*.mdb \
-	/usr/lib/mono/1.0/ByteFX.Data.dll*/*.mdb"
-FILES_libmono-bytefx0.7.6.1-cil = "/usr/lib/mono/gac/ByteFX.Data/0.7.6.1*/ \
-	/usr/lib/mono/1.0/ByteFX.Data.dll"
-FILES_libmono-microsoft-build2.0-cil-dbg +=
"/usr/lib/mono/gac/Microsoft.Build.*/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.Build.*/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Microsoft.Build.*/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Microsoft.Build.*/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Microsoft.Build.*.dll*.mdb \
-	/usr/lib/mono/2.0/Microsoft.Build.*.dll*/*.mdb"
-FILES_libmono-microsoft-build2.0-cil =
"/usr/lib/mono/gac/Microsoft.Build.*/2.0.*/ \
-	/usr/lib/mono/2.0/Microsoft.Build.*.dll"
-FILES_libmono-system-ldap1.0-cil-dbg +=
"/usr/lib/mono/gac/System.DirectoryServices/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.DirectoryServices/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.DirectoryServices/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.DirectoryServices/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/System.DirectoryServices.dll*.mdb \
-	/usr/lib/mono/1.0/System.DirectoryServices.dll*/*.mdb"
-FILES_libmono-system-ldap1.0-cil =
"/usr/lib/mono/gac/System.DirectoryServices/1.0.*/ \
-	/usr/lib/mono/1.0/System.DirectoryServices.dll"
-FILES_libmono-relaxng2.0-cil-dbg +=
"/usr/lib/mono/gac/Commons.Xml.Relaxng/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Commons.Xml.Relaxng/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Commons.Xml.Relaxng/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Commons.Xml.Relaxng/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Commons.Xml.Relaxng.dll*.mdb \
-	/usr/lib/mono/2.0/Commons.Xml.Relaxng.dll*/*.mdb"
-FILES_libmono-relaxng2.0-cil = "/usr/lib/mono/gac/Commons.Xml.Relaxng/2.0.*/ \
-	/usr/lib/mono/2.0/Commons.Xml.Relaxng.dll"
-FILES_libmono-system-ldap2.0-cil-dbg +=
"/usr/lib/mono/gac/System.DirectoryServices/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.DirectoryServices/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.DirectoryServices/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.DirectoryServices/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/System.DirectoryServices.dll*.mdb \
-	/usr/lib/mono/2.0/System.DirectoryServices.dll*/*.mdb"
-FILES_libmono-system-ldap2.0-cil =
"/usr/lib/mono/gac/System.DirectoryServices/2.0.*/ \
-	/usr/lib/mono/2.0/System.DirectoryServices.dll"
-FILES_libmono-system-messaging2.0-cil-dbg +=
"/usr/lib/mono/gac/System.Messaging/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Messaging/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Messaging/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Messaging/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/System.Messaging.dll*.mdb \
-	/usr/lib/mono/2.0/System.Messaging.dll*/*.mdb"
-FILES_libmono-system-messaging2.0-cil =
"/usr/lib/mono/gac/System.Messaging/2.0.*/ \
-	/usr/lib/mono/2.0/System.Messaging.dll"
-FILES_libmono-sharpzip0.84-cil-dbg +=
"/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.84.*/*.mdb \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.84.*/*/*.mdb \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.84.*/.debug/ \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.84.*/../.debug/ \
-	/usr/lib/mono/1.0/ICSharpCode.SharpZipLib.dll*.mdb \
-	/usr/lib/mono/1.0/ICSharpCode.SharpZipLib.dll*/*.mdb"
-FILES_libmono-sharpzip0.84-cil =
"/usr/lib/mono/gac/ICSharpCode.SharpZipLib/0.84.*/ \
-	/usr/lib/mono/1.0/ICSharpCode.SharpZipLib.dll"
-FILES_libmono-sqlite2.0-cil-dbg +=
"/usr/lib/mono/gac/Mono.Data.Sqlite/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.Sqlite/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.Sqlite/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Data.Sqlite/2.0.*/../.debug/ \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Mono.Data.Sqlite.dll*.mdb \
-	/usr/lib/mono/2.0/Mono.Data.Sqlite.dll*/*.mdb \
-	/usr/lib/mono/2.0/Mono.Data.SqliteClient.dll*.mdb \
-	/usr/lib/mono/2.0/Mono.Data.SqliteClient.dll*/*.mdb"
-FILES_libmono-sqlite2.0-cil = "/usr/lib/mono/gac/Mono.Data.Sqlite/2.0.*/ \
-	/usr/lib/mono/gac/Mono.Data.SqliteClient/2.0.*/ \
-	/usr/lib/mono/2.0/Mono.Data.Sqlite.dll \
-	/usr/lib/mono/2.0/Mono.Data.SqliteClient.dll"
-FILES_libmono-ldap2.0-cil-dbg +=
"/usr/lib/mono/gac/Novell.Directory.Ldap/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Novell.Directory.Ldap/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Novell.Directory.Ldap/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Novell.Directory.Ldap/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Novell.Directory.Ldap.dll*.mdb \
-	/usr/lib/mono/2.0/Novell.Directory.Ldap.dll*/*.mdb"
-FILES_libmono-ldap2.0-cil = "/usr/lib/mono/gac/Novell.Directory.Ldap/2.0.*/ \
-	/usr/lib/mono/2.0/Novell.Directory.Ldap.dll"
-FILES_libmono-npgsql2.0-cil-dbg += "/usr/lib/mono/gac/Npgsql/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Npgsql/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Npgsql/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Npgsql/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Npgsql.dll*.mdb \
-	/usr/lib/mono/2.0/Npgsql.dll*/*.mdb"
-FILES_libmono-npgsql2.0-cil = "/usr/lib/mono/gac/Npgsql/2.0.*/ \
-	/usr/lib/mono/2.0/Npgsql.dll"
-FILES_libmono-system-runtime1.0-cil-dbg +=
"/usr/lib/mono/gac/System.Runtime.*/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Runtime.*/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Runtime.*/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Runtime.*/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/System.Runtime.*.dll*.mdb \
-	/usr/lib/mono/1.0/System.Runtime.*.dll*/*.mdb"
-FILES_libmono-system-runtime1.0-cil =
"/usr/lib/mono/gac/System.Runtime.*/1.0.*/ \
-	/usr/lib/mono/1.0/System.Runtime.*.dll"
-FILES_libmono-oracle2.0-cil-dbg +=
"/usr/lib/mono/gac/System.Data.OracleClient/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System.Data.OracleClient/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System.Data.OracleClient/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System.Data.OracleClient/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/System.Data.OracleClient.dll*.mdb \
-	/usr/lib/mono/2.0/System.Data.OracleClient.dll*/*.mdb"
-FILES_libmono-oracle2.0-cil =
"/usr/lib/mono/gac/System.Data.OracleClient/2.0.*/ \
-	/usr/lib/mono/2.0/System.Data.OracleClient.dll"
-FILES_libmono-c5-1.0-cil-dbg += "/usr/lib/mono/gac/Mono.C5/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.C5/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.C5/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.C5/1.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Mono.C5.dll*.mdb \
-	/usr/lib/mono/2.0/Mono.C5.dll*/*.mdb"
-FILES_libmono-c5-1.0-cil = "/usr/lib/mono/gac/Mono.C5/1.0.*/ \
-	/usr/lib/mono/2.0/Mono.C5.dll"
-FILES_libmono-sharpzip2.6-cil-dbg +=
"/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.6.*/*.mdb \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.6.*/*/*.mdb \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.6.*/.debug/ \
-	/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.6.*/../.debug/ \
-	/usr/lib/mono/compat-2.0/ICSharpCode.SharpZipLib.dll*.mdb \
-	/usr/lib/mono/compat-2.0/ICSharpCode.SharpZipLib.dll*/*.mdb"
-FILES_libmono-sharpzip2.6-cil =
"/usr/lib/mono/gac/ICSharpCode.SharpZipLib/2.6.*/ \
-	/usr/lib/mono/compat-2.0/ICSharpCode.SharpZipLib.dll"
-FILES_libmono-cairo2.0-cil-dbg += "/usr/lib/mono/gac/Mono.Cairo/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.Cairo/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.Cairo/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.Cairo/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Mono.Cairo.dll*.mdb \
-	/usr/lib/mono/2.0/Mono.Cairo.dll*/*.mdb"
-FILES_libmono-cairo2.0-cil = "/usr/lib/mono/gac/Mono.Cairo/2.0.*/ \
-	/usr/lib/mono/2.0/Mono.Cairo.dll"
-FILES_libmono-peapi2.0-cil-dbg += "/usr/lib/mono/gac/PEAPI/2.0.*/*.mdb \
-	/usr/lib/mono/gac/PEAPI/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/PEAPI/2.0.*/.debug/ \
-	/usr/lib/mono/gac/PEAPI/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/PEAPI.dll*.mdb \
-	/usr/lib/mono/2.0/PEAPI.dll*/*.mdb"
-FILES_libmono-peapi2.0-cil = "/usr/lib/mono/gac/PEAPI/2.0.*/ \
-	/usr/lib/mono/2.0/PEAPI.dll"
-FILES_mono-mcs-dbg += "/usr/bin/*.mdb \
-	/usr/bin/*/*.mdb \
-	/usr/bin/.debug/ \
-	/usr/bin/../.debug/ \
-	/usr/lib/mono/1.0/*.exe*.mdb \
-	/usr/lib/mono/1.0/*.exe*/*.mdb"
-FILES_mono-mcs = "/usr/bin/ \
-	/usr/lib/mono/1.0/*.exe*"
-FILES_libmono-system1.0-cil-dbg += "/usr/lib/mono/gac/System*/1.0.*/*.mdb \
-	/usr/lib/mono/gac/System*/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System*/1.0.*/.debug/ \
-	/usr/lib/mono/gac/System*/1.0.*/../.debug/ \
-	/usr/lib/mono/gac/CustomMarshalers/1.0.*/*.mdb \
-	/usr/lib/mono/gac/CustomMarshalers/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/CustomMarshalers/1.0.*/.debug/ \
-	/usr/lib/mono/gac/CustomMarshalers/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/System*.dll*.mdb \
-	/usr/lib/mono/1.0/System*.dll*/*.mdb \
-	/usr/lib/mono/1.0/CustomMarshalers.dll*.mdb \
-	/usr/lib/mono/1.0/CustomMarshalers.dll*/*.mdb"
-FILES_libmono-system1.0-cil = "/usr/lib/mono/gac/System*/1.0.*/ \
-	/usr/lib/mono/gac/CustomMarshalers/1.0.*/ \
-	/usr/lib/mono/1.0/System*.dll \
-	/usr/lib/mono/1.0/CustomMarshalers.dll*"
-FILES_libmono-system2.0-cil-dbg += "/usr/lib/mono/gac/System*/2.0.*/*.mdb \
-	/usr/lib/mono/gac/System*/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/System*/2.0.*/.debug/ \
-	/usr/lib/mono/gac/System*/2.0.*/../.debug/ \
-	/usr/lib/mono/gac/CustomMarshalers/2.0.*/*.mdb \
-	/usr/lib/mono/gac/CustomMarshalers/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/CustomMarshalers/2.0.*/.debug/ \
-	/usr/lib/mono/gac/CustomMarshalers/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/System*.dll*.mdb \
-	/usr/lib/mono/2.0/System*.dll*/*.mdb \
-	/usr/lib/mono/2.0/CustomMarshalers.dll*.mdb \
-	/usr/lib/mono/2.0/CustomMarshalers.dll*/*.mdb"
-FILES_libmono-system2.0-cil = "/usr/lib/mono/gac/System*/2.0.*/ \
-	/usr/lib/mono/gac/CustomMarshalers/2.0.*/ \
-	/usr/lib/mono/2.0/System*.dll \
-	/usr/lib/mono/2.0/CustomMarshalers.dll*"
-FILES_libmono1.0-cil-dbg += "/usr/lib/mono/gac/Mono.*/1.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.*/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.*/1.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.*/1.0.*/../.debug/ \
-	/usr/lib/mono/gac/OpenSystem.C/1.0.*.mdb \
-	/usr/lib/mono/gac/OpenSystem.C/1.0.*/*.mdb \
-	/usr/lib/mono/gac/mono-service/1.0.*/*.mdb \
-	/usr/lib/mono/gac/mono-service/1.0.*/*/*.mdb \
-	/usr/lib/mono/gac/mono-service/1.0.*/.debug/ \
-	/usr/lib/mono/gac/mono-service/1.0.*/../.debug/ \
-	/usr/lib/mono/1.0/Mono.*.dll*.mdb \
-	/usr/lib/mono/1.0/Mono.*.dll*/*.mdb \
-	/usr/lib/mono/1.0/OpenSystem.C.dll*.mdb \
-	/usr/lib/mono/1.0/OpenSystem.C.dll*/*.mdb"
-FILES_libmono1.0-cil = "/usr/lib/mono/gac/Mono.*/1.0.*/ \
-	/usr/lib/mono/gac/OpenSystem.C/1.0.* \
-	/usr/lib/mono/gac/mono-service/1.0.*/ \
-	/usr/lib/mono/1.0/Mono.*.dll \
-	/usr/lib/mono/1.0/OpenSystem.C.dll"
-FILES_libmono2.0-cil-dbg += "/usr/lib/mono/gac/Mono.*/2.0.*/*.mdb \
-	/usr/lib/mono/gac/Mono.*/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/Mono.*/2.0.*/.debug/ \
-	/usr/lib/mono/gac/Mono.*/2.0.*/../.debug/ \
-	/usr/lib/mono/gac/OpenSystem.C/2.0.*.mdb \
-	/usr/lib/mono/gac/OpenSystem.C/2.0.*/*.mdb \
-	/usr/lib/mono/gac/mono-service/2.0.*/*.mdb \
-	/usr/lib/mono/gac/mono-service/2.0.*/*/*.mdb \
-	/usr/lib/mono/gac/mono-service/2.0.*/.debug/ \
-	/usr/lib/mono/gac/mono-service/2.0.*/../.debug/ \
-	/usr/lib/mono/2.0/Mono.*.dll*.mdb \
-	/usr/lib/mono/2.0/Mono.*.dll*/*.mdb \
-	/usr/lib/mono/2.0/OpenSystem.C.dll*.mdb \
-	/usr/lib/mono/2.0/OpenSystem.C.dll*/*.mdb"
-FILES_libmono2.0-cil = "/usr/lib/mono/gac/Mono.*/2.0.*/ \
-	/usr/lib/mono/gac/OpenSystem.C/2.0.* \
-	/usr/lib/mono/gac/mono-service/2.0.*/ \
-	/usr/lib/mono/2.0/Mono.*.dll \
-	/usr/lib/mono/2.0/OpenSystem.C.dll"
-
-PACKAGES = "mono-jit-dbg \
-	mono-jit \
-	mono-gac-dbg \
-	mono-gac \
-	mono-mjs-dbg \
-	mono-mjs \
-	mono-gmcs-dbg \
-	mono-gmcs \
-	mono-utils-dbg \
-	mono-utils \
-	libmono-peapi1.0-cil-dbg \
-	libmono-peapi1.0-cil \
-	libmono-cairo1.0-cil-dbg \
-	libmono-cairo1.0-cil \
-	libmono-system-web2.0-cil-dbg \
-	libmono-system-web2.0-cil \
-	libmono-accessibility2.0-cil-dbg \
-	libmono-accessibility2.0-cil \
-	libmono-microsoft7.0-cil-dbg \
-	libmono-microsoft7.0-cil \
-	libmono-winforms2.0-cil-dbg \
-	libmono-winforms2.0-cil \
-	libmono-ldap1.0-cil-dbg \
-	libmono-ldap1.0-cil \
-	libmono-sharpzip2.84-cil-dbg \
-	libmono-sharpzip2.84-cil \
-	libmono-system-data2.0-cil-dbg \
-	libmono-system-data2.0-cil \
-	libmono-corlib2.0-cil-dbg \
-	libmono-corlib2.0-cil \
-	libmono-winforms1.0-cil-dbg \
-	libmono-winforms1.0-cil \
-	libmono-microsoft8.0-cil-dbg \
-	libmono-microsoft8.0-cil \
-	libmono-corlib1.0-cil-dbg \
-	libmono-corlib1.0-cil \
-	libmono-system-web1.0-cil-dbg \
-	libmono-system-web1.0-cil \
-	libmono-system-runtime2.0-cil-dbg \
-	libmono-system-runtime2.0-cil \
-	libmono-cscompmgd8.0-cil-dbg \
-	libmono-cscompmgd8.0-cil \
-	libmono-cscompmgd7.0-cil-dbg \
-	libmono-cscompmgd7.0-cil \
-	libmono-firebirdsql1.7-cil-dbg \
-	libmono-firebirdsql1.7-cil \
-	mono-jay-dbg \
-	mono-jay \
-	libmono-data-tds1.0-cil-dbg \
-	libmono-data-tds1.0-cil \
-	libmono-sqlite1.0-cil-dbg \
-	libmono-sqlite1.0-cil \
-	libmono-relaxng1.0-cil-dbg \
-	libmono-relaxng1.0-cil \
-	libmono-dev-dbg \
-	libmono-dev \
-	libmono-accessibility1.0-cil-dbg \
-	libmono-accessibility1.0-cil \
-	mono-common-dbg \
-	mono-common \
-	libmono-oracle1.0-cil-dbg \
-	libmono-oracle1.0-cil \
-	libmono-system-data1.0-cil-dbg \
-	libmono-system-data1.0-cil \
-	libmono-bytefx0.7.6.2-cil-dbg \
-	libmono-bytefx0.7.6.2-cil \
-	libmono0-dbg \
-	libmono0 \
-	libmono-sharpzip0.6-cil-dbg \
-	libmono-sharpzip0.6-cil \
-	libmono-data-tds2.0-cil-dbg \
-	libmono-data-tds2.0-cil \
-	libmono-system-messaging1.0-cil-dbg \
-	libmono-system-messaging1.0-cil \
-	libmono-npgsql1.0-cil-dbg \
-	libmono-npgsql1.0-cil \
-	libmono-security2.0-cil-dbg \
-	libmono-security2.0-cil \
-	libmono-security1.0-cil-dbg \
-	libmono-security1.0-cil \
-	libmono-bytefx0.7.6.1-cil-dbg \
-	libmono-bytefx0.7.6.1-cil \
-	libmono-microsoft-build2.0-cil-dbg \
-	libmono-microsoft-build2.0-cil \
-	libmono-system-ldap1.0-cil-dbg \
-	libmono-system-ldap1.0-cil \
-	libmono-relaxng2.0-cil-dbg \
-	libmono-relaxng2.0-cil \
-	libmono-system-ldap2.0-cil-dbg \
-	libmono-system-ldap2.0-cil \
-	libmono-system-messaging2.0-cil-dbg \
-	libmono-system-messaging2.0-cil \
-	libmono-sharpzip0.84-cil-dbg \
-	libmono-sharpzip0.84-cil \
-	libmono-sqlite2.0-cil-dbg \
-	libmono-sqlite2.0-cil \
-	libmono-ldap2.0-cil-dbg \
-	libmono-ldap2.0-cil \
-	libmono-npgsql2.0-cil-dbg \
-	libmono-npgsql2.0-cil \
-	libmono-system-runtime1.0-cil-dbg \
-	libmono-system-runtime1.0-cil \
-	libmono-oracle2.0-cil-dbg \
-	libmono-oracle2.0-cil \
-	libmono-c5-1.0-cil-dbg \
-	libmono-c5-1.0-cil \
-	libmono-sharpzip2.6-cil-dbg \
-	libmono-sharpzip2.6-cil \
-	libmono-cairo2.0-cil-dbg \
-	libmono-cairo2.0-cil \
-	libmono-peapi2.0-cil-dbg \
-	libmono-peapi2.0-cil \
-	mono-mcs-dbg \
-	mono-mcs \
-	libmono-system1.0-cil-dbg \
-	libmono-system1.0-cil \
-	libmono-system2.0-cil-dbg \
-	libmono-system2.0-cil \
-	libmono1.0-cil-dbg \
-	libmono1.0-cil \
-	libmono2.0-cil-dbg \
-	libmono2.0-cil"
diff -uprN a/recipes/mono/mono_1.2.5.inc b/recipes/mono/mono_1.2.5.inc
--- a/recipes/mono/mono_1.2.5.inc	2009-07-20 12:50:48.104680933 -0600
+++ b/recipes/mono/mono_1.2.5.inc	1969-12-31 17:00:00.000000000 -0700
@@ -1,12 +0,0 @@
-DESCRIPTION = "Mono Programming Language"
-SECTION = "devel/mono"
-LICENSE = "GPL LGPL X11"
-
-SRC_URI = "http://go-mono.com/sources/mono/mono-${PV}.tar.bz2"
-
-S = "${WORKDIR}/mono-${PV}"
-
-inherit autotools
-EXTRA_OECONF_arm = "--without-tls"
-EXTRA_OECONF_mipsel = "--without-tls"
-
diff -uprN a/recipes/mono/mono-1.2.6/configure.patch
b/recipes/mono/mono-1.2.6/configure.patch
--- a/recipes/mono/mono-1.2.6/configure.patch	2009-07-20
12:50:48.101686853 -0600
+++ b/recipes/mono/mono-1.2.6/configure.patch	1969-12-31
17:00:00.000000000 -0700
@@ -1,23 +0,0 @@
-Index: mono-1.2.6/configure.in
-===================================================================
---- mono-1.2.6.orig/configure.in	2007-11-08 17:07:57.000000000 -0500
-+++ mono-1.2.6/configure.in	2007-12-12 15:27:52.000000000 -0500
-@@ -1150,6 +1150,8 @@
- 		], [
- 				AC_MSG_RESULT(no)
- 				with_tls=pthread
-+		], [
-+				AC_MSG_RESULT(yes)
- 		])
- 	fi
-
-@@ -1252,6 +1254,9 @@
- 		], [
- 				with_sigaltstack=no
- 				AC_MSG_RESULT(no)
-+		], [
-+				AC_MSG_RESULT(yes)
-+				AC_DEFINE(HAVE_WORKING_SIGALTSTACK)
- 		])
- 	fi
-
diff -uprN a/recipes/mono/mono_1.2.6.bb b/recipes/mono/mono_1.2.6.bb
--- a/recipes/mono/mono_1.2.6.bb	2009-07-20 12:50:48.104680933 -0600
+++ b/recipes/mono/mono_1.2.6.bb	1969-12-31 17:00:00.000000000 -0700
@@ -1,81 +0,0 @@
-require mono_1.2.6.inc
-
-DEPENDS = "mono-native mono-mcs-intermediate glib-2.0 perl-native"
-
-PR = "r2"
-
-# mono makes use of non-thumb-compatible inline asm.
-ARM_INSTRUCTION_SET = "arm"
-
-SRC_URI += "file://configure.patch;patch=1"
-
-# Per http://www.mono-project.com/Mono:ARM
-EXTRA_OECONF += " --disable-mcs-build "
-# Instead, get the mcs tree from a different build (see mono-mcs-intermediate)
-
-do_install_prepend() {
-	install -d ${D}
-	cd ${D}
-	tar -xzf ${STAGING_DATADIR_NATIVE}/mono-mcs/mono-mcs-${PV}.tar.gz
-	cd ${S}
-}
-
-do_install_append() {
-	# mono-mcs-intermediate builds and installs jay (a Yacc for Java and C#),
-	# however, jay is not being cross-compiled and thus only
-	# available for the buildhost architecture, so remove it
-	# entirely
-	cd ${D}
-	rm -rf ./usr/share/man/man1/jay.1 ./usr/share/jay \
-	    ./usr/share/jay/README.jay \
-	    ./usr/bin/jay
-	cd ${S}
-
-	# Not packaged with the default rules and apparently
-	# not used for anything
-	rm -rf ${D}${datadir}/mono-1.0/mono/cil/cil-opcodes.xml
-}
-
-inherit mono
-
-# Import file definitions from Debian
-require mono_1.2.5.1-files.inc
-
-# Add some packages
-PACKAGES_append = " mono-doc mono mono-runtime"
-
-FILES_mono-doc_append = " /usr/share/libgc-mono/ "
-
-FILES_mono = ""
-ALLOW_EMPTY_mono = "1"
-RDEPENDS_mono = "mono-common mono-jit"
-
-FILES_mono-runtime = ""
-ALLOW_EMPTY_mono-runtime = "1"
-RDEPENDS_mono-runtime = "mono-jit mono-gac"
-
-RDEPENDS_mono-jit = "mono-common"
-
-FILES_libmono-dev =+ " /usr/lib/libmono.la
/usr/lib/libmono-profiler-cov.la /usr/lib/libmono-profiler-aot.la \
-	/usr/lib/libMonoPosixHelper.la /usr/lib/libMonoSupportW.la"
-FILES_libmono-dbg =+ " /usr/lib/.debug/libmono*.so.*
/usr/lib/.debug/libikvm-native.so \
-	/usr/lib/.debug/libMonoPosixHelper.so /usr/lib/.debug/libMonoSupportW.so"
-
-# Packages not included in Debian
-PACKAGES_prepend = "libnunit2.2-cil-dbg libnunit2.2-cil-dev libnunit2.2-cil \
-	libmono-cecil0.5-cil-dbg libmono-cecil0.5-cil-dev libmono-cecil0.5-cil \
-	libmono-db2-1.0-cil-dbg libmono-db2-1.0-cil-dev libmono-db2-1.0-cil"
-
-FILES_libnunit2.2-cil = "/usr/lib/mono/gac/nunit.*/2.2.*
/usr/lib/mono/1.0/nunit.*.dll"
-FILES_libnunit2.2-cil-dev = "/usr/lib/pkgconfig/mono-nunit.pc"
-FILES_libnunit2.2-cil-dbg = "/usr/lib/mono/gac/nunit*/2.2.*/nunit.*.dll.mdb"
-
-FILES_libmono-cecil0.5-cil = "/usr/lib/mono/gac/Mono.Cecil/0.5.*"
-FILES_libmono-cecil0.5-cil-dbg =
"/usr/lib/mono/gac/Mono.Cecil/0.5.0.1__0738eb9f132ed756/Mono.Cecil.dll.mdb"
-
-FILES_libmono-db2-1.0-cil = "/usr/lib/mono/gac/IBM.Data.DB2/1.0*
/usr/lib/mono/1.0/IBM.Data.DB2.dll"
-FILES_libmono-db2-1.0-cil-dbg =
"/usr/lib/mono/gac/IBM.Data.DB2/1.0*/IBM.Data.DB2.dll.mdb"
-
-# Move .pc files
-FILES_libmono-cairo1.0-cil-dev = "/usr/lib/pkgconfig/mono-cairo.pc"
-PACKAGES =+ " libmono-cairo1.0-cil-dev "
diff -uprN a/recipes/mono/mono_1.2.6.inc b/recipes/mono/mono_1.2.6.inc
--- a/recipes/mono/mono_1.2.6.inc	2009-07-20 12:50:48.104680933 -0600
+++ b/recipes/mono/mono_1.2.6.inc	1969-12-31 17:00:00.000000000 -0700
@@ -1,14 +0,0 @@
-DESCRIPTION = "Mono Programming Language"
-SECTION = "devel/mono"
-LICENSE = "GPL LGPL X11"
-
-SRC_URI = "http://go-mono.com/sources/mono/mono-1.2.6.tar.bz2 \
-	   file://mono-libgc-configure.patch;patch=1"
-
-S = "${WORKDIR}/mono-1.2.6"
-
-inherit autotools
-ARM_INSTRUCTION_SET = "arm"
-EXTRA_OECONF_arm = "--without-tls"
-EXTRA_OECONF_mipsel = "--without-tls"
-
diff -uprN a/recipes/mono/mono-1.9.1+2.2-rc1/configure.patch
b/recipes/mono/mono-1.9.1+2.2-rc1/configure.patch
--- a/recipes/mono/mono-1.9.1+2.2-rc1/configure.patch	2009-07-20
12:50:48.101686853 -0600
+++ b/recipes/mono/mono-1.9.1+2.2-rc1/configure.patch	1969-12-31
17:00:00.000000000 -0700
@@ -1,44 +0,0 @@
-Index: mono-2.2/configure.in
-===================================================================
---- mono-2.2.orig/configure.in	2008-11-13 18:22:29.000000000 -0500
-+++ mono-2.2/configure.in	2008-12-10 16:03:11.000000000 -0500
-@@ -1155,6 +1155,8 @@
- 		], [
- 				AC_MSG_RESULT(no)
- 				with_tls=pthread
-+		], [
-+				AC_MSG_RESULT(yes)
- 		])
- 	fi
-
-@@ -1257,6 +1259,9 @@
- 		], [
- 				with_sigaltstack=no
- 				AC_MSG_RESULT(no)
-+		], [
-+				AC_MSG_RESULT(yes)
-+				AC_DEFINE(HAVE_WORKING_SIGALTSTACK)
- 		])
- 	fi
-
-@@ -1746,6 +1751,7 @@
-
- jit_wanted=false
- interp_wanted=false
-+echo "CLIFF: checking host = $host"
- case "$host" in
- #	mips-sgi-irix5.* | mips-sgi-irix6.*)
- #		TARGET=MIPS;
-@@ -1882,10 +1888,12 @@
- 		jit_wanted=true
- 		;;
- 	arm*-linux*)
-+    echo "CLIFF: found arm linux"
- 		TARGET=ARM;
- 		arch_target=arm;
- 		ACCESS_UNALIGNED="no"
- 		JIT_SUPPORTED=yes
-+		CPPFLAGS="$CPPFLAGS -DARM_FPU_VFP=1"
- 		jit_wanted=true
- 		;;
- 	s390-*-linux*)
diff -uprN a/recipes/mono/mono-1.9.1+2.2-rc1/disable-docs.patch
b/recipes/mono/mono-1.9.1+2.2-rc1/disable-docs.patch
--- a/recipes/mono/mono-1.9.1+2.2-rc1/disable-docs.patch	2009-07-20
12:50:48.101686853 -0600
+++ b/recipes/mono/mono-1.9.1+2.2-rc1/disable-docs.patch	1969-12-31
17:00:00.000000000 -0700
@@ -1,13 +0,0 @@
-Index: mono-2.2/Makefile.am
-===================================================================
---- mono-2.2.orig/Makefile.am	2008-12-10 16:25:14.000000000 -0500
-+++ mono-2.2/Makefile.am	2008-12-10 16:25:24.000000000 -0500
-@@ -1,7 +1,7 @@
- AUTOMAKE_OPTIONS = foreign
- ACLOCAL_AMFLAGS = -I .
-
--SUBDIRS = po $(libgc_dir) $(eglib_dir) mono $(ikvm_native_dir)
support data runtime scripts man samples web msvc docs
-+SUBDIRS = po $(libgc_dir) $(eglib_dir) mono $(ikvm_native_dir)
support data runtime scripts man samples web msvc
-
- # Keep in sync with SUBDIRS
- ## 'tools' is not normally built
diff -uprN a/recipes/mono/mono-1.9.1+2.2-rc1/disable-monoburg.patch
b/recipes/mono/mono-1.9.1+2.2-rc1/disable-monoburg.patch
--- a/recipes/mono/mono-1.9.1+2.2-rc1/disable-monoburg.patch	2009-07-20
12:50:48.101686853 -0600
+++ b/recipes/mono/mono-1.9.1+2.2-rc1/disable-monoburg.patch	1969-12-31
17:00:00.000000000 -0700
@@ -1,22 +0,0 @@
-Index: mono-2.2/mono/Makefile.am
-===================================================================
---- mono-2.2.orig/mono/Makefile.am	2008-12-10 15:38:30.000000000 -0500
-+++ mono-2.2/mono/Makefile.am	2008-12-10 15:38:37.000000000 -0500
-@@ -1,3 +1,3 @@
-
--SUBDIRS = utils io-layer monoburg os cil metadata \
-+SUBDIRS = utils io-layer os cil metadata \
-       arch interpreter mini dis monograph tests benchmark profiler
-Index: mono-2.2/mono/mini/Makefile.am
-===================================================================
---- mono-2.2.orig/mono/mini/Makefile.am	2008-12-10 15:44:11.000000000 -0500
-+++ mono-2.2/mono/mini/Makefile.am	2008-12-10 15:44:22.000000000 -0500
-@@ -482,7 +482,7 @@
- 	$(GENMDESC_PRG) $(srcdir)/cpu-mips.md cpu-mips.h mips_desc
-
- inssel.c inssel.h: $(BURGSRC)
--	$(monodir)/mono/monoburg/monoburg -c 1 -p -e $(BURGSRC) -d inssel.h
-s inssel.c
-+	monoburg -c 1 -p -e $(BURGSRC) -d inssel.h -s inssel.c
-
- testi: mono test.exe
- 	$(RUNTIME) -v -v --ncompile 1 --compile Test:$(mtest) test.exe
diff -uprN a/recipes/mono/mono-1.9.1+2.2-rc1/fix-eabi-syscall.patch
b/recipes/mono/mono-1.9.1+2.2-rc1/fix-eabi-syscall.patch
--- a/recipes/mono/mono-1.9.1+2.2-rc1/fix-eabi-syscall.patch	2009-07-20
12:50:48.101686853 -0600
+++ b/recipes/mono/mono-1.9.1+2.2-rc1/fix-eabi-syscall.patch	1969-12-31
17:00:00.000000000 -0700
@@ -1,12 +0,0 @@
---- mono.orig/mono/mini/mini-arm.c	2008/12/12 19:49:41	121457
-+++ mono/mono/mini/mini-arm.c	2009/01/05 08:58:47	122416
-@@ -581,6 +581,8 @@
- {
- #if __APPLE__
- 	sys_icache_invalidate (code, size);
-+#elif ((__GNUC__ >= 4) && (__GNUC_MINOR__ >= 1))
-+	__clear_cache (code, code + size);
- #else
- 	__asm __volatile ("mov r0, %0\n"
- 			"mov r1, %1\n"
-
diff -uprN a/recipes/mono/mono_1.9.1+2.2-rc1.bb
b/recipes/mono/mono_1.9.1+2.2-rc1.bb
--- a/recipes/mono/mono_1.9.1+2.2-rc1.bb	2009-07-20 12:50:48.104680933 -0600
+++ b/recipes/mono/mono_1.9.1+2.2-rc1.bb	1969-12-31 17:00:00.000000000 -0700
@@ -1,87 +0,0 @@
-require mono_2.2.0.inc
-
-DEPENDS = "mono-native mono-mcs-intermediate glib-2.0 perl-native"
-
-DEFAULT_PREFERENCE = "-1"
-
-PR = "r3"
-
-# mono makes use of non-thumb-compatible inline asm.
-ARM_INSTRUCTION_SET = "arm"
-
-SRC_URI += "file://configure.patch;patch=1 \
-            file://disable-docs.patch;patch=1 \
-            file://disable-monoburg.patch;patch=1 \
-            file://fix-eabi-syscall.patch;patch=1 \
-	   "
-
-# Per http://www.mono-project.com/Mono:ARM
-EXTRA_OECONF += " --disable-mcs-build "
-# Instead, get the mcs tree from a different build (see mono-mcs-intermediate)
-
-do_install_prepend() {
-	install -d ${D}
-	pushd ${D}
-	tar -xzf ${STAGING_DATADIR_NATIVE}/mono-mcs/mono-mcs-${PV}.tar.gz
-	popd
-}
-
-do_install_append() {
-	# mono-mcs-intermediate builds and installs jay (a Yacc for Java and C#),
-	# however, jay is not being cross-compiled and thus only
-	# available for the buildhost architecture, so remove it
-	# entirely
-	pushd ${D}
-	rm -rf ./usr/share/man/man1/jay.1 ./usr/share/jay \
-	    ./usr/share/jay/README.jay \
-	    ./usr/bin/jay
-	popd
-
-	# Not packaged with the default rules and apparently
-	# not used for anything
-	rm -rf ${D}${datadir}/mono-1.0/mono/cil/cil-opcodes.xml
-}
-
-inherit mono
-
-# Import file definitions from Debian
-require mono_2.x-files.inc
-
-# Add some packages
-PACKAGES_append = " mono-doc mono mono-runtime"
-
-FILES_mono-doc_append = " /usr/share/libgc-mono/ "
-
-FILES_mono = ""
-ALLOW_EMPTY_mono = "1"
-RDEPENDS_mono = "mono-common mono-jit"
-
-FILES_mono-runtime = ""
-ALLOW_EMPTY_mono-runtime = "1"
-RDEPENDS_mono-runtime = "mono-jit mono-gac"
-
-RDEPENDS_mono-jit = "mono-common"
-
-FILES_libmono-dev =+ " /usr/lib/libmono.la
/usr/lib/libmono-profiler-cov.la /usr/lib/libmono-profiler-aot.la \
-	/usr/lib/libMonoPosixHelper.la /usr/lib/libMonoSupportW.la"
-FILES_libmono-dbg =+ " /usr/lib/.debug/libmono*.so.*
/usr/lib/.debug/libikvm-native.so \
-	/usr/lib/.debug/libMonoPosixHelper.so /usr/lib/.debug/libMonoSupportW.so"
-
-# Packages not included in Debian
-PACKAGES_prepend = "libnunit2.2-cil-dbg libnunit2.2-cil-dev libnunit2.2-cil \
-	libmono-cecil0.5-cil-dbg libmono-cecil0.5-cil-dev libmono-cecil0.5-cil \
-	libmono-db2-1.0-cil-dbg libmono-db2-1.0-cil-dev libmono-db2-1.0-cil"
-
-FILES_libnunit2.2-cil = "/usr/lib/mono/gac/nunit.*/2.2.*
/usr/lib/mono/1.0/nunit.*.dll"
-FILES_libnunit2.2-cil-dev = "/usr/lib/pkgconfig/mono-nunit.pc"
-FILES_libnunit2.2-cil-dbg = "/usr/lib/mono/gac/nunit*/2.2.*/nunit.*.dll.mdb"
-
-FILES_libmono-cecil0.5-cil = "/usr/lib/mono/gac/Mono.Cecil/0.5.*"
-FILES_libmono-cecil0.5-cil-dbg =
"/usr/lib/mono/gac/Mono.Cecil/0.5.0.1__0738eb9f132ed756/Mono.Cecil.dll.mdb"
-
-FILES_libmono-db2-1.0-cil = "/usr/lib/mono/gac/IBM.Data.DB2/1.0*
/usr/lib/mono/1.0/IBM.Data.DB2.dll"
-FILES_libmono-db2-1.0-cil-dbg =
"/usr/lib/mono/gac/IBM.Data.DB2/1.0*/IBM.Data.DB2.dll.mdb"
-
-# Move .pc files
-FILES_libmono-cairo1.0-cil-dev = "/usr/lib/pkgconfig/mono-cairo.pc"
-PACKAGES =+ " libmono-cairo1.0-cil-dev "
diff -uprN a/recipes/mono/mono_2.2.0.inc b/recipes/mono/mono_2.2.0.inc
--- a/recipes/mono/mono_2.2.0.inc	2009-07-20 12:50:48.104680933 -0600
+++ b/recipes/mono/mono_2.2.0.inc	1969-12-31 17:00:00.000000000 -0700
@@ -1,22 +0,0 @@
-DESCRIPTION = "Mono Programming Language"
-SECTION = "devel/mono"
-LICENSE = "GPL LGPL X11"
-
-SRC_URI = "http://bec-systems.com/pub/mono/mono-2.2-rc1.tar.bz2 \
-		"
-
-#	   file://mono-libgc-configure.patch;patch=1"
-
-S = "${WORKDIR}/mono-2.2"
-
-do_fix_dolt_libtool() {
-	# look for libtool prefixed with HOST_SYS
-	sed -e "s/slash\}libtool/slash\}${HOST_SYS}-libtool/" -i acinclude.m4
-}
-
-inherit autotools
-EXTRA_OECONF_arm = "--without-tls"
-EXTRA_OECONF_mipsel = "--without-tls"
-
-addtask fix_dolt_libtool after do_patch before do_configure
-
diff -uprN a/recipes/mono/mono-2.4/configure.patch
b/recipes/mono/mono-2.4/configure.patch
--- a/recipes/mono/mono-2.4/configure.patch	1969-12-31 17:00:00.000000000 -0700
+++ b/recipes/mono/mono-2.4/configure.patch	2009-07-16 09:02:37.111475000 -0600
@@ -0,0 +1,44 @@
+Index: mono-2.4.2.1/configure.in
+===================================================================
+--- mono-2.4.2.1.orig/configure.in	2008-11-13 18:22:29.000000000 -0500
++++ mono-2.4.2.1/configure.in	2008-12-10 16:03:11.000000000 -0500
+@@ -1155,6 +1155,8 @@
+ 		], [
+ 				AC_MSG_RESULT(no)
+ 				with_tls=pthread
++		], [
++				AC_MSG_RESULT(yes)
+ 		])
+ 	fi
+
+@@ -1257,6 +1259,9 @@
+ 		], [
+ 				with_sigaltstack=no
+ 				AC_MSG_RESULT(no)
++		], [
++				AC_MSG_RESULT(yes)
++				AC_DEFINE(HAVE_WORKING_SIGALTSTACK)
+ 		])
+ 	fi
+
+@@ -1746,6 +1751,7 @@
+
+ jit_wanted=false
+ interp_wanted=false
++echo "CLIFF: checking host = $host"
+ case "$host" in
+ #	mips-sgi-irix5.* | mips-sgi-irix6.*)
+ #		TARGET=MIPS;
+@@ -1882,10 +1888,12 @@
+ 		jit_wanted=true
+ 		;;
+ 	arm*-linux*)
++    echo "CLIFF: found arm linux"
+ 		TARGET=ARM;
+ 		arch_target=arm;
+ 		ACCESS_UNALIGNED="no"
+ 		JIT_SUPPORTED=yes
++		CPPFLAGS="$CPPFLAGS -DARM_FPU_VFP=1"
+ 		jit_wanted=true
+ 		;;
+ 	s390-*-linux*)
diff -uprN a/recipes/mono/mono-2.4/Makefile.patch
b/recipes/mono/mono-2.4/Makefile.patch
--- a/recipes/mono/mono-2.4/Makefile.patch	1969-12-31 17:00:00.000000000 -0700
+++ b/recipes/mono/mono-2.4/Makefile.patch	2009-07-16 09:02:37.112476000 -0600
@@ -0,0 +1,24 @@
+--- mono-2.4.2.1/docs/Makefile	2009-06-03 14:51:18.000000000 -0600
++++ mono-2.4.2.1/docs/Makefile	2009-06-03 14:51:53.000000000 -0600
+@@ -400,7 +400,8 @@ distdir: $(DISTFILES)
+ 	  dist-hook
+ check-am: all-am
+ check: check-am
+-all-am: Makefile $(DATA)
++all-am: Makefile
++# $(DATA)
+ installdirs:
+ 	for dir in "$(DESTDIR)$(sourcesdir)"; do \
+ 	  test -z "$$dir" || $(MKDIR_P) "$$dir"; \
+@@ -410,8 +411,9 @@ install-exec: install-exec-am
+ install-data: install-data-am
+ uninstall: uninstall-am
+
+-install-am: all-am
+-	@$(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am
++install-am:
++#all-am
++#	@$(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am
+
+ installcheck: installcheck-am
+ install-strip:
diff -uprN a/recipes/mono/mono-2.4/mini-arm.patch
b/recipes/mono/mono-2.4/mini-arm.patch
--- a/recipes/mono/mono-2.4/mini-arm.patch	1969-12-31 17:00:00.000000000 -0700
+++ b/recipes/mono/mono-2.4/mini-arm.patch	2009-07-16 09:02:37.112476000 -0600
@@ -0,0 +1,11 @@
+--- mono-2.4.2.1/mono/mini/mini-arm.h	2009-06-23 09:41:00.000000000 -0600
++++ mono-2.4.2.1/mono/mini/mini-arm.h	2009-06-23 09:40:27.000000000 -0600
+@@ -9,7 +9,7 @@
+ #endif
+
+ #ifdef ARM_FPU_VFP
+-#error "VFP support is not complete, try mono SVN for that."
++//#error "VFP support is not complete, try mono SVN for that."
+ #endif
+
+ #if defined(__ARM_EABI__)
diff -uprN a/recipes/mono/mono_2.4.2.2.inc b/recipes/mono/mono_2.4.2.2.inc
--- a/recipes/mono/mono_2.4.2.2.inc	1969-12-31 17:00:00.000000000 -0700
+++ b/recipes/mono/mono_2.4.2.2.inc	2009-07-20 12:42:33.661683000 -0600
@@ -0,0 +1,20 @@
+DESCRIPTION = "Mono Programming Language"
+SECTION = "devel/mono"
+LICENSE = "GPL LGPL X11"
+
+SRC_URI = "http://mono.ximian.com/monobuild/preview/sources/mono/mono-2.4.2.2.tar.bz2
\
+		"
+
+S = "${WORKDIR}/mono-2.4.2.2"
+
+do_fix_dolt_libtool() {
+	# look for libtool prefixed with HOST_SYS
+	sed -e "s/slash\}libtool/slash\}${HOST_SYS}-libtool/" -i acinclude.m4
+	echo No acinclude!
+}
+
+inherit autotools
+EXTRA_OECONF_arm = "--without-tls"
+EXTRA_OECONF_mipsel = "--without-tls"
+
+addtask fix_dolt_libtool after do_patch before do_configure
diff -uprN a/recipes/mono/mono_2.4.bb b/recipes/mono/mono_2.4.bb
--- a/recipes/mono/mono_2.4.bb	1969-12-31 17:00:00.000000000 -0700
+++ b/recipes/mono/mono_2.4.bb	2009-07-20 12:20:30.784684000 -0600
@@ -0,0 +1,91 @@
+require mono_2.4.2.2.inc
+
+DEPENDS = "mono-native mono-mcs-intermediate glib-2.0 perl-native"
+
+DEFAULT_PREFERENCE = "-1"
+
+PR = "r3"
+
+# mono makes use of non-thumb-compatible inline asm.
+ARM_INSTRUCTION_SET = "arm"
+
+SRC_URI += "file://configure.patch;patch=1\
+	    file://mini-arm.patch;patch=1"
+
+# Per http://www.mono-project.com/Mono:ARM
+EXTRA_OECONF += " --disable-mcs-build "
+# Instead, get the mcs tree from a different build (see mono-mcs-intermediate)
+
+do_patch_stuff() {
+	    cd ${WORKDIR}/mono-2.4.2.2/
+	    patch -p1 < ${USERBRANCH}/recipes/mono/mono-2.4/Makefile.patch
+}
+
+addtask patch_stuff after do_configure before do_compile
+
+do_install_prepend() {
+	install -d ${D}
+	pushd ${D}
+	tar -xzf ${STAGING_DATADIR_NATIVE}/mono-mcs/mono-mcs-${PV}.tar.gz
+	popd
+}
+
+do_install_append() {
+	# mono-mcs-intermediate builds and installs jay (a Yacc for Java and C#),
+	# however, jay is not being cross-compiled and thus only
+	# available for the buildhost architecture, so remove it
+	# entirely
+	pushd ${D}
+	rm -rf ./usr/share/man/man1/jay.1 ./usr/share/jay \
+	    ./usr/share/jay/README.jay \
+	    ./usr/bin/jay
+	popd
+
+	# Not packaged with the default rules and apparently
+	# not used for anything
+	rm -rf ${D}${datadir}/mono-1.0/mono/cil/cil-opcodes.xml
+}
+
+inherit mono
+
+# Import file definitions from Debian
+require mono_2.x-files.inc
+
+# Add some packages
+PACKAGES_append = "mono-doc mono mono-runtime"
+
+#FILES_mono-doc_append = " /usr/share/libgc-mono/ "
+
+FILES_mono = ""
+ALLOW_EMPTY_mono = "1"
+RDEPENDS_mono = "mono-common mono-jit"
+
+FILES_mono-runtime = ""
+ALLOW_EMPTY_mono-runtime = "1"
+RDEPENDS_mono-runtime = "mono-jit mono-gac"
+
+RDEPENDS_mono-jit = "mono-common"
+
+FILES_libmono-dev =+ " /usr/lib/libmono.la
/usr/lib/libmono-profiler-cov.la /usr/lib/libmono-profiler-aot.la \
+	/usr/lib/libMonoPosixHelper.la /usr/lib/libMonoSupportW.la"
+FILES_libmono-dbg =+ " /usr/lib/.debug/libmono*.so.*
/usr/lib/.debug/libikvm-native.so \
+	/usr/lib/.debug/libMonoPosixHelper.so /usr/lib/.debug/libMonoSupportW.so"
+
+# Packages not included in Debian
+PACKAGES_prepend = "libnunit2.2-cil-dbg libnunit2.2-cil-dev libnunit2.2-cil \
+	libmono-cecil0.5-cil-dbg libmono-cecil0.5-cil-dev libmono-cecil0.5-cil \
+	libmono-db2-1.0-cil-dbg libmono-db2-1.0-cil-dev libmono-db2-1.0-cil"
+
+FILES_libnunit2.2-cil = "/usr/lib/mono/gac/nunit.*/2.2.*
/usr/lib/mono/1.0/nunit.*.dll"
+FILES_libnunit2.2-cil-dev = "/usr/lib/pkgconfig/mono-nunit.pc"
+FILES_libnunit2.2-cil-dbg = "/usr/lib/mono/gac/nunit*/2.2.*/nunit.*.dll.mdb"
+
+FILES_libmono-cecil0.5-cil = "/usr/lib/mono/gac/Mono.Cecil/0.5.*"
+FILES_libmono-cecil0.5-cil-dbg =
"/usr/lib/mono/gac/Mono.Cecil/0.5.0.1__0738eb9f132ed756/Mono.Cecil.dll.mdb"
+
+FILES_libmono-db2-1.0-cil = "/usr/lib/mono/gac/IBM.Data.DB2/1.0*
/usr/lib/mono/1.0/IBM.Data.DB2.dll"
+FILES_libmono-db2-1.0-cil-dbg =
"/usr/lib/mono/gac/IBM.Data.DB2/1.0*/IBM.Data.DB2.dll.mdb"
+
+# Move .pc files
+FILES_libmono-cairo1.0-cil-dev = "/usr/lib/pkgconfig/mono-cairo.pc"
+PACKAGES =+ " libmono-cairo1.0-cil-dev "
diff -uprN a/recipes/mono/mono-mcs-intermediate_1.2.5.1.bb
b/recipes/mono/mono-mcs-intermediate_1.2.5.1.bb
--- a/recipes/mono/mono-mcs-intermediate_1.2.5.1.bb	2009-07-20
12:50:48.102681229 -0600
+++ b/recipes/mono/mono-mcs-intermediate_1.2.5.1.bb	1969-12-31
17:00:00.000000000 -0700
@@ -1,12 +0,0 @@
-# This is a straw-man recipe for step 1 in the two-step build of
-# mono. Because it's impossible to build the mcs directory
-# in cross-compile mode, this recipe will do a native build,
-# then tar the resulting install tree for usage by the mono
-# package in step 2.
-# See http://www.mono-project.com/Mono:ARM
-
-require mono_1.2.5.inc
-require mono-mcs-intermediate.inc
-
-PARALLEL_MAKE = ""
-
diff -uprN a/recipes/mono/mono-mcs-intermediate_1.2.6.bb
b/recipes/mono/mono-mcs-intermediate_1.2.6.bb
--- a/recipes/mono/mono-mcs-intermediate_1.2.6.bb	2009-07-20
12:50:48.102681229 -0600
+++ b/recipes/mono/mono-mcs-intermediate_1.2.6.bb	1969-12-31
17:00:00.000000000 -0700
@@ -1,13 +0,0 @@
-# This is a straw-man recipe for step 1 in the two-step build of
-# mono. Because it's impossible to build the mcs directory
-# in cross-compile mode, this recipe will do a native build,
-# then tar the resulting install tree for usage by the mono
-# package in step 2.
-# See http://www.mono-project.com/Mono:ARM
-
-require mono_1.2.6.inc
-require mono-mcs-intermediate.inc
-
-PARALLEL_MAKE = ""
-
-
diff -uprN a/recipes/mono/mono-mcs-intermediate_1.9.1+2.2-rc1.bb
b/recipes/mono/mono-mcs-intermediate_1.9.1+2.2-rc1.bb
--- a/recipes/mono/mono-mcs-intermediate_1.9.1+2.2-rc1.bb	2009-07-20
12:50:48.102681229 -0600
+++ b/recipes/mono/mono-mcs-intermediate_1.9.1+2.2-rc1.bb	1969-12-31
17:00:00.000000000 -0700
@@ -1,15 +0,0 @@
-# This is a straw-man recipe for step 1 in the two-step build of
-# mono. Because it's impossible to build the mcs directory
-# in cross-compile mode, this recipe will do a native build,
-# then tar the resulting install tree for usage by the mono
-# package in step 2.
-# See http://www.mono-project.com/Mono:ARM
-
-require mono_2.2.0.inc
-require mono-mcs-intermediate.inc
-
-DEFAULT_PREFERENCE = "-1"
-
-#SRC_URI += "file://libgc_cppflags.patch;patch=1"
-
-
diff -uprN a/recipes/mono/mono-mcs-intermediate_2.4.bb
b/recipes/mono/mono-mcs-intermediate_2.4.bb
--- a/recipes/mono/mono-mcs-intermediate_2.4.bb	1969-12-31
17:00:00.000000000 -0700
+++ b/recipes/mono/mono-mcs-intermediate_2.4.bb	2009-07-20
12:13:58.920683000 -0600
@@ -0,0 +1,15 @@
+# This is a straw-man recipe for step 1 in the two-step build of
+# mono. Because it's impossible to build the mcs directory
+# in cross-compile mode, this recipe will do a native build,
+# then tar the resulting install tree for usage by the mono
+# package in step 2.
+# See http://www.mono-project.com/Mono:ARM
+
+require mono_2.4.2.2.inc
+require mono-mcs-intermediate.inc
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI += ""
+
+
diff -uprN a/recipes/mono/mono-native_1.2.5.1.bb
b/recipes/mono/mono-native_1.2.5.1.bb
--- a/recipes/mono/mono-native_1.2.5.1.bb	2009-07-20 12:50:48.102681229 -0600
+++ b/recipes/mono/mono-native_1.2.5.1.bb	1969-12-31 17:00:00.000000000 -0700
@@ -1,23 +0,0 @@
-require mono_1.2.5.inc
-PR = "r2"
-DEPENDS = "glib-2.0-native perl-native"
-
-SRC_URI += "file://mono-fix-libdir-path.patch;patch=1"
-
-PARALLEL_MAKE = ""
-
-inherit native
-
-do_stage_prepend() {
-	install -m 755 ${S}/mono/monoburg/monoburg ${STAGING_BINDIR}
-}
-
-do_fix_libtool_name() {
-	# inherit native will make that all native tools that are being
-	# built are prefixed with something like "i686-linux-",
-	# including libtool. Fix up some hardcoded libtool names:
-	for i in "${S}"/runtime/*-wrapper.in; do
-		sed -e "s/libtool/${BUILD_SYS}-libtool/" -i "${i}"
-	done
-}
-addtask fix_libtool_name after do_patch before do_configure
diff -uprN a/recipes/mono/mono-native_1.9.1+2.2-rc1.bb
b/recipes/mono/mono-native_1.9.1+2.2-rc1.bb
--- a/recipes/mono/mono-native_1.9.1+2.2-rc1.bb	2009-07-20
12:50:48.102681229 -0600
+++ b/recipes/mono/mono-native_1.9.1+2.2-rc1.bb	1969-12-31
17:00:00.000000000 -0700
@@ -1,25 +0,0 @@
-require mono_2.2.0.inc
-PR = "r3"
-DEPENDS = "glib-2.0-native perl-native"
-
-DEFAULT_PREFERENCE = "-1"
-
-#SRC_URI += "file://mono-fix-libdir-path.patch;patch=1 \
-#	    file://libgc_cppflags.patch;patch=1 \
-#           "
-
-inherit native
-
-do_stage_prepend() {
-	install -m 755 ${S}/mono/monoburg/monoburg ${STAGING_BINDIR}
-}
-
-do_fix_libtool_name() {
-	# inherit native will make that all native tools that are being
-	# built are prefixed with something like "i686-linux-",
-	# including libtool. Fix up some hardcoded libtool names:
-	for i in "${S}"/runtime/*-wrapper.in; do
-		sed -e "s/libtool/${BUILD_SYS}-libtool/" -i "${i}"
-	done
-}
-addtask fix_libtool_name after do_patch before do_configure
diff -uprN a/recipes/mono/mono-native_2.4.bb b/recipes/mono/mono-native_2.4.bb
--- a/recipes/mono/mono-native_2.4.bb	1969-12-31 17:00:00.000000000 -0700
+++ b/recipes/mono/mono-native_2.4.bb	2009-07-20 12:42:45.998682000 -0600
@@ -0,0 +1,19 @@
+require mono_2.4.2.2.inc
+PR = "r0"
+DEPENDS = "glib-2.0-native perl-native"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI += ""
+
+inherit native
+
+do_fix_libtool_name() {
+	# inherit native will make that all native tools that are being
+	# built are prefixed with something like "i686-linux-",
+	# including libtool. Fix up some hardcoded libtool names:
+	for i in "${S}"/runtime/*-wrapper.in; do
+		sed -e "s/libtool/${BUILD_SYS}-libtool/" -i "${i}"
+	done
+}
+addtask fix_libtool_name after do_patch before do_configure
diff -uprN a/recipes/mono/mono_svn.bb b/recipes/mono/mono_svn.bb
--- a/recipes/mono/mono_svn.bb	2009-07-20 12:50:48.105681043 -0600
+++ b/recipes/mono/mono_svn.bb	2009-07-20 12:41:36.471683000 -0600
@@ -5,7 +5,7 @@ DEPENDS = "mono-native mono-mcs-intermed
 PR = "r0"
 DEFAULT_PREFERENCE = "-1"

-SRC_URI += "file://configure-svnr87352.patch;patch=1"
+SRC_URI += ""

 # Per http://www.mono-project.com/Mono:ARM
 EXTRA_OECONF += " --disable-mcs-build "
@@ -37,7 +37,7 @@ do_install_append() {
 inherit mono

 # Import file definitions from Debian
-require mono_1.2.5.1-files.inc
+require mono_2.x-files.inc

 # Add some packages
 PACKAGES_append = " mono-doc mono mono-runtime"


