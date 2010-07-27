Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1Odfr2-0000Wb-Rw
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 10:49:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 0FF074000B9ED;
	Tue, 27 Jul 2010 10:49:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id F1A004000C4A9;
	Tue, 27 Jul 2010 10:49:23 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aay-niigFf0a; Tue, 27 Jul 2010 10:49:23 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 358B04000B9ED;
	Tue, 27 Jul 2010 10:49:18 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1Odfqa-00007m-9z; Tue, 27 Jul 2010 10:49:12 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jul 2010 10:49:09 +0200
Message-Id: <1280220549-447-3-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1280220549-447-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1280220549-447-1-git-send-email-heinold@inf.fu-berlin.de>
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-SA-Exim-Scanned: No (on linuxtogo.org);
	Message bigger than SAmaxbody (256000)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 2/2] openjdk: backport from openembedded-dev
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
X-List-Received-Date: Tue, 27 Jul 2010 08:49:45 -0000

From: Henning Heinold <h.heinold@tarent.de>

---
 conf/checksums.ini                                 |   20 +
 recipes/openjdk/files/jvm.cfg                      |   41 +
 .../openjdk/openjdk-6-6b18-1.8/build-hacks.patch   |   31 +
 .../cacao-disable-stackbase-check.patch            |   12 +
 .../openjdk-6-6b18-1.8/cacao-vfp-compat.patch      |   37 +
 .../openjdk/openjdk-6-6b18-1.8/fix-llvm-libs.patch |   13 +
 .../fix_hotspot_crosscompile.patch                 |   94 +
 .../icedtea-crosscompile-fix.patch                 |  214 +
 .../icedtea-fix-jar-command.patch                  |   27 +
 .../openjdk-6-6b18-1.8/icedtea-hostbuildcc.patch   |   12 +
 .../icedtea-hotspot-glibc-version.patch            |   23 +
 .../icedtea-hotspot-isfinte.patch                  |   15 +
 .../icedtea-hotspot-isnanf.patch                   |   21 +
 .../icedtea-hotspot-loadavg.patch                  |   28 +
 .../icedtea-jdk-RTLD_NOLOAD.patch                  |   13 +
 .../icedtea-jdk-iconv-uclibc.patch                 |   39 +
 .../icedtea-jdk-remove-unused-backtrace.patch      |   51 +
 .../icedtea-jdk-unpack-uclibc.patch                |   12 +
 .../icedtea-launcher-stdc++.patch                  |   13 +
 .../icedtea-libnet-renaming.patch                  |  148 +
 .../openjdk-6-6b18-1.8/icedtea-remove_werror.patch |   14 +
 .../openjdk-6-6b18-1.8/icedtea-unbreak-float.patch |   18 +
 .../icedtea1.8-pre1.8.1-releasebranch-fixes.patch  | 4784 ++++++++++++++++++++
 .../openjdk-6-6b18-1.8/mkbc_returncode.patch       |   11 +
 .../shark-arm-linux-cpu-detection.patch            |  112 +
 .../shark-build-openjdkdir.patch                   |   13 +
 .../openjdk-6-6b18-1.8/zero-cmpswap-long.patch     |   20 +
 recipes/openjdk/openjdk-6-common.inc               |  530 +++
 recipes/openjdk/openjdk-6-release-6b18.inc         |  104 +
 recipes/openjdk/openjdk-6_6b18-1.8.bb              |    3 +
 30 files changed, 6473 insertions(+), 0 deletions(-)
 create mode 100644 recipes/openjdk/files/jvm.cfg
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/build-hacks.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/cacao-disable-stackbase-check.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/cacao-vfp-compat.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/fix-llvm-libs.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/fix_hotspot_crosscompile.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-crosscompile-fix.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-fix-jar-command.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hostbuildcc.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-glibc-version.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-isfinte.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-isnanf.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-loadavg.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-RTLD_NOLOAD.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-iconv-uclibc.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-remove-unused-backtrace.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-unpack-uclibc.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-launcher-stdc++.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-libnet-renaming.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-remove_werror.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-unbreak-float.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea1.8-pre1.8.1-releasebranch-fixes.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/mkbc_returncode.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/shark-arm-linux-cpu-detection.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/shark-build-openjdkdir.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/zero-cmpswap-long.patch
 create mode 100644 recipes/openjdk/openjdk-6-common.inc
 create mode 100644 recipes/openjdk/openjdk-6-release-6b18.inc
 create mode 100644 recipes/openjdk/openjdk-6_6b18-1.8.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 8abe5b8..e2ba722 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -3494,6 +3494,10 @@ sha256=1ea5bd257f755ffcae2c7a1935c37147c7392478922410e0870361eea08b6c27
 md5=63220327925ace13756ae334c55a3baa
 sha256=1dfc4903dc0172286df4f1740fd0f12749ac81d51c602290b47cbe83d51e1d56
 
+[http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-0.99.4/cacao-0.99.4.tar.gz]
+md5=c5e6525c5212ddbb6026e4a7cde37ca6
+sha256=c6090c1d2ed3c60acda0076b62563598267be8dab270ce49ee1035002a2510cf
+
 [http://cairographics.org/releases/cairo-1.2.2.tar.gz]
 md5=2460487b1257a5583c889b1b9d2033ec
 sha256=9d53b8dd0bf76dd0da7cdbe65a6c6934be49bd3942dc5f7ef7bbcc7529d9ee02
@@ -12174,6 +12178,18 @@ sha256=202de62e2f3d0667cc464720d5897d0ccb29767ec24e0a4d4c5bd6c4d37425a4
 md5=b70924c697584ab7955050d7a9b4de57
 sha256=dae79e8c56090ac3fb4ac3fe0df9faf6a0c9694a89ef978dce0ab970557ad264
 
+[http://kenai.com/projects/jdk6-drops/downloads/download/jdk6-jaf-2009_10_27.zip]
+md5=7a50bb540a27cdd0001885630088b758
+sha256=fdc51476fc6bcc69ea1f099f33e84601a126bfa8b11c8fa11c25dc574345aa9f
+
+[https://jaxp.dev.java.net/files/nidaba/documents/913/147329/jdk6-jaxp-2009_10_13.zip]
+md5=a2f7b972124cd776ff71e7754eb9a429
+sha256=8714d55de18db48ca9da0ee986202005082f44cf4c215da8683342b70e61792b
+
+[http://kenai.com/projects/jdk6-drops/downloads/download/jdk6-jaxws-2009_10_27.zip]
+md5=3ea5728706169498b722b898a1008acf
+sha256=155ff3be83c980e197621a2fbf7ee34e8e0f536489351a5865cf0e52206245e2
+
 [http://www.jdom.org/dist/binary/archive/jdom-1.1.tar.gz]
 md5=22745cbaaddb12884ed8ee09083d8fe2
 sha256=a13549087141be24ad176b659afdc2c675f1ffa5288ff999a193d6d44a282056
@@ -18982,6 +18998,10 @@ sha256=96159489d8b70db275c125b627c6e6912e6c078279d76b968d2e0969359c9420
 md5=078fe0ab744c98694decc77f2456c560
 sha256=2019a4c3d2d14620caa78d7df49fd987a041066b4631bde4fd8424033f3c1785
 
+[http://download.java.net/openjdk/jdk6/promoted/b18/openjdk-6-src-b18-16_feb_2010.tar.gz]
+md5=94db01691ab38f98b7d42b2ebf4d5c0b
+sha256=778ea7b323aaa24d3c6e8fe32b8bb0f49040d9e86271859077ada9f9ee3c8ebf
+
 [http://jalimo.evolvis.org/repository/sources/openjdk-langtools-jdk7-b31.tar.bz2]
 md5=670931f67b2e4ac46c6e0cd15418f2fa
 sha256=f8b8820e410c137d279d14dec7e7a93217cc371acdfe1b3343b2278d1728932e
diff --git a/recipes/openjdk/files/jvm.cfg b/recipes/openjdk/files/jvm.cfg
new file mode 100644
index 0000000..9e008e9
--- /dev/null
+++ b/recipes/openjdk/files/jvm.cfg
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/build-hacks.patch b/recipes/openjdk/openjdk-6-6b18-1.8/build-hacks.patch
new file mode 100644
index 0000000..02a8300
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/build-hacks.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/cacao-disable-stackbase-check.patch b/recipes/openjdk/openjdk-6-6b18-1.8/cacao-disable-stackbase-check.patch
new file mode 100644
index 0000000..d676142
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/cacao-disable-stackbase-check.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/cacao-vfp-compat.patch b/recipes/openjdk/openjdk-6-6b18-1.8/cacao-vfp-compat.patch
new file mode 100644
index 0000000..09ba984
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/cacao-vfp-compat.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/fix-llvm-libs.patch b/recipes/openjdk/openjdk-6-6b18-1.8/fix-llvm-libs.patch
new file mode 100644
index 0000000..7c82daf
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/fix-llvm-libs.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/fix_hotspot_crosscompile.patch b/recipes/openjdk/openjdk-6-6b18-1.8/fix_hotspot_crosscompile.patch
new file mode 100644
index 0000000..38fb191
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/fix_hotspot_crosscompile.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-crosscompile-fix.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-crosscompile-fix.patch
new file mode 100644
index 0000000..ec0f259
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-crosscompile-fix.patch
@@ -0,0 +1,214 @@
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
+@@ -237,7 +238,9 @@
+ 	$(BOOT_JAVA_CMD) -cp $(WRAPPER_GENERATOR_TEMPDIR) WrapperGenerator \
+ 	    $(SIZER_DIR) $(XLIBTYPES) "sizer" $(subst .,,$(suffix $(basename $@)))
+ 
+-$(SIZES): $(SIZERS)
++#$(SIZES): $(SIZERS)
++# Prevent binaries being created. Instead take what is available.
++$(SIZES):
+ 	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
+ 	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
+ 	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-fix-jar-command.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-fix-jar-command.patch
new file mode 100644
index 0000000..607797e
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-fix-jar-command.patch
@@ -0,0 +1,27 @@
+Index: icedtea6-1.8/Makefile.am
+===================================================================
+--- icedtea6-1.8.orig/Makefile.am	2010-06-17 10:29:13.654666801 +0200
++++ icedtea6-1.8/Makefile.am	2010-06-17 10:30:50.334670771 +0200
+@@ -1662,12 +1662,7 @@
+ 	rm -f extra-source-files.txt
+ 
+ extra-lib/about.jar: stamps/extra-class-files.stamp
+-	if ! test -d $(ICEDTEA_BOOT_DIR) ; \
+-	then \
+-	  $(JAR) cf $@ -C extra-lib net ; \
+-	else \
+-	  $(ICEDTEA_BOOT_DIR)/bin/jar cf $@ -C extra-lib net ; \
+-	fi
++	$(ICEDTEA_BOOT_DIR)/bin/jar cf $@ -C extra-lib net ;
+ 
+ # PulseAudio based mixer
+ # (pulse-java)
+@@ -1750,7 +1745,7 @@
+ stamps/rewrite-rhino.stamp: stamps/rewriter.stamp $(RHINO_JAR)
+ if WITH_RHINO
+ 	mkdir -p rhino/rhino.{old,new}
+-	(cd rhino/rhino.old ; jar xf $(RHINO_JAR))
++	(cd rhino/rhino.old ; $(ICEDTEA_BOOT_DIR)/bin/jar xf $(RHINO_JAR))
+ 	$(ICEDTEA_BOOT_DIR)/bin/java -cp $(abs_top_builddir)/rewriter \
+ 	  com.redhat.rewriter.ClassRewriter \
+ 	  $(abs_top_builddir)/rhino/rhino.old $(abs_top_builddir)/rhino/rhino.new \
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hostbuildcc.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hostbuildcc.patch
new file mode 100644
index 0000000..5f2c98b
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hostbuildcc.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-glibc-version.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-glibc-version.patch
new file mode 100644
index 0000000..faa90ea
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-glibc-version.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-isfinte.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-isfinte.patch
new file mode 100644
index 0000000..7c5da59
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-isfinte.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-isnanf.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-isnanf.patch
new file mode 100644
index 0000000..494e965
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-isnanf.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-loadavg.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-loadavg.patch
new file mode 100644
index 0000000..7da41fd
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-loadavg.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-RTLD_NOLOAD.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-RTLD_NOLOAD.patch
new file mode 100644
index 0000000..9c70ba1
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-RTLD_NOLOAD.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-iconv-uclibc.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-iconv-uclibc.patch
new file mode 100644
index 0000000..68f8581
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-iconv-uclibc.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-remove-unused-backtrace.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-remove-unused-backtrace.patch
new file mode 100644
index 0000000..09ab459
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-remove-unused-backtrace.patch
@@ -0,0 +1,51 @@
+Index: openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c
+===================================================================
+--- openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c	2010-06-13 13:44:00.741955478 +0200
++++ openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c	2010-06-13 13:48:11.451931804 +0200
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
+@@ -692,35 +689,11 @@
+ 
+ static XErrorHandler saved_error_handler = NULL;
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
+ static int NoisyXErrorHandler(Display * dpy, XErrorEvent * event) {
+     fprintf(stderr, "id=%x, serial=%x, ec=%d, rc=%d, mc=%d\n",
+             event->resourceid, event->serial, event->error_code,
+             event->request_code, event->minor_code);
+-    /*
+-    #ifdef __linux__
+-        print_stack();
+-    #endif
+-    */
++
+     if (jvm != NULL) {
+       JNIEnv * env = (JNIEnv *)JNU_GetEnv(jvm, JNI_VERSION_1_2);
+       JNU_CallStaticMethodByName(env, NULL, "java/lang/Thread", "dumpStack", "()V");
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-unpack-uclibc.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-unpack-uclibc.patch
new file mode 100644
index 0000000..40564f0
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-unpack-uclibc.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-launcher-stdc++.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-launcher-stdc++.patch
new file mode 100644
index 0000000..ee24afa
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-launcher-stdc++.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-libnet-renaming.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-libnet-renaming.patch
new file mode 100644
index 0000000..024969d
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-libnet-renaming.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-remove_werror.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-remove_werror.patch
new file mode 100644
index 0000000..f2ad035
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-remove_werror.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-unbreak-float.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-unbreak-float.patch
new file mode 100644
index 0000000..9f875de
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea-unbreak-float.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/icedtea1.8-pre1.8.1-releasebranch-fixes.patch b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea1.8-pre1.8.1-releasebranch-fixes.patch
new file mode 100644
index 0000000..b48bcf0
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/icedtea1.8-pre1.8.1-releasebranch-fixes.patch
@@ -0,0 +1,4784 @@
+diff -r d1ad52447673 ChangeLog
+--- a/ChangeLog	Wed Apr 14 12:21:30 2010 +0200
++++ b/ChangeLog	Tue Jul 20 16:36:52 2010 +0200
+@@ -1,3 +1,261 @@
++2010-07-19  Gary Benson  <gbenson@redhat.com>
++
++	PR icedtea/483
++	* ports/hotspot/src/share/vm/shark/sharkNativeWrapper.cpp
++	(SharkNativeWrapper::initialize): Fix signedness of T_BYTE
++	and T_CHAR results.
++
++2010-07-16  Deepak Bhole <dbhole@redhat.com>
++
++	* patches/icedtea-policy-evaluation.patch: New patch. Fixes policy
++	evaluation to match the proprietary JDK.
++
++2010-07-15  Deepak Bhole <dbhole@redhat.com>
++
++	* patches/openjdk/6678385.patch: New file. Backpatched from jdk7 for 
++	upstream bug#6678385. Fixes rhbz# 551835. Fixes jvm crashes when window is
++	resized.
++
++2010-07-14  Jon VanAlten  <jon.vanalten@redhat.com>
++
++	* patches/icedtea-override-redirect-metacity.patch: Produces the
++	"expected" behavior for full screen applications or other situations
++	where developers wish to present elements that would cover things like
++	panels.  We previously had a version of this patch since changeset 876
++	ebc064e8892d, but dropped it in changeset changeset 1731
++	83619682858e because upstream had rejected as a metacity bug[1].
++	Metacity maintains that this behavior does not break any spec and does
++	not appear likely to change either[2], so we must be the "good guys" and
++	provide the expected behavior.  See discussion[3].
++	[1] http://bugs.sun.com/bugdatabase/view_bug.do?bug_id=6514512
++	[2] https://bugzilla.gnome.org/show_bug.cgi?id=405269
++	[3] http://mail.openjdk.java.net/pipermail/distro-pkg-dev/2010-April/008862.html
++	* Makefile.am: Apply icedtea-override-redirect-metacity.patch.
++
++2010-07-13  Mark Wielaard  <mjw@redhat.com>
++
++	Reported by William Cohen <wcohen@redhat.com>
++	* tapset/hotspot.stp.in (object_alloc): size is arg4, not arg3.
++
++2010-07-14  Deepak Bhole <dbhole@redhat.com>
++
++	* plugin/icedteanp/java/sun/applet/PluginMessageConsumer.java: Add a new
++	processedIds list to track which instances have been instantiated.
++	(okToProcess): Register width as priority only after handle is acquired.
++	Process resize messages only after tag and handle are processed.
++	(notifyWorkerIsFree): Add instance id to processedIds list if the worked
++	being free'd is an init worker.
++	(getFreeWorker): Create new normal worked only if worker count is less
++	than MAX_WORKERS - PRIORITY_WORKERS.
++	(dumpWorkerStatus): New method. Useful when debugging -- prints status of
++	all workers.
++	* plugin/icedteanp/java/sun/applet/PluginMessageHandlerWorker.java
++	(toString): New method. Returns the string representation of the worker
++	instance at call time.
++
++2010-07-13  Matthias Klose  <doko@ubuntu.com>
++
++	* acinclude.m4 (IT_CHECK_PLUGIN_DEPENDENCIES): Don't require libxul
++	libraries.
++	(IT_CHECK_XULRUNNER_VERSION): Use pkgconfig --modversion as version.
++
++2010-07-13  Deepak Bhole <dbhole@redhat.com>
++
++	* plugin/icedteanp/IcedTeaJavaRequestProcessor.h: Set timeout to 120
++	seconds (previous commit mistakenly changed it to 10).
++	* plugin/icedteanp/IcedTeaPluginUtils.h: Print debug info only in debug
++	mode.
++
++2010-06-14  Deepak Bhole <dbhole@redhat.com>
++
++	* plugin/icedteanp/IcedTeaJavaRequestProcessor.cc: Use variadic macro
++	for debug message printing.
++	* plugin/icedteanp/IcedTeaJavaRequestProcessor.h: Same.
++	* plugin/icedteanp/IcedTeaNPPlugin.cc: Same.
++	* plugin/icedteanp/IcedTeaPluginRequestProcessor.cc: Same.
++	* plugin/icedteanp/IcedTeaPluginUtils.cc: Same.
++	* plugin/icedteanp/IcedTeaPluginUtils.h: Same.
++	* plugin/icedteanp/IcedTeaScriptablePluginObject.cc: Same.
++
++2010-07-12 Jon VanAlten <jon.vanalten@redhat.com>
++	* pulseaudio/src/java/org/classpath/icedtea/pulseaudio/PulseAudioDataLine.java
++	* pulseaudio/src/java/org/classpath/icedtea/pulseaudio/PulseAudioLine.java
++	* pulseaudio/src/java/org/classpath/icedtea/pulseaudio/PulseAudioSourceDataLine.java
++	* pulseaudio/src/java/org/classpath/icedtea/pulseaudio/PulseAudioTargetDataLine.java:
++	Eliminate spurious exception throwing from open, close, read, write,
++	drain, and flush calls on closed lines.
++	Use isOpen() API call instead of instance variable where appropriate.
++
++2010-07-08  Man Lung Wong  <mwong@redhat.com>
++
++	* netx/net/sourceforge/jnlp/Parser.java:
++	(getRootNode): Used BufferedInputStream instead of InputStream to
++	have mark and reset method available. Passed the encoding to the
++	constructor of InputStreamReader, such that the stream will now
++	be parsed with the encoding the jnlp file is in.
++	(getEncoding): A new method which checks the first four bytes of input
++	and determines what the files encoding is.
++
++2010-06-24 Omair Majid <omajid@redhat.com>
++
++	* netx/net/sourceforge/jnlp/SecurityDesc.java: Fix comments.
++	* netx/net/sourceforge/jnlp/JNLPClassLoader.java
++	(activateJars): Always call activateNative.
++	(activateNative): Search for native code anywhere in the jar.
++
++2010-06-29  Omair Majid <omajid@redhat.com>
++
++	* netx/net/sourceforge/jnlp/runtime/JNLPClassLoader.java
++	nativeDirectories: New variable. Contains a list of directories that
++	contain native libraries.
++	(getInstance): Tell other classloaders about the native directory.
++	(getNativeDir): Add the new native directory to nativeDirectories.
++	(addNativeDirectory): New function.
++	(getNativeDirectories): New function.
++	(findLibrary): Look in all the native directories for the native library.
++
++2010-06-29  Omair Majid <omajid@redhat.com>
++
++	* netx/net/sourceforge/jnlp/services/XSingleInstanceService.java
++	(startListeningServer): Mark the thread as a daemon so the JVM can
++	shutdown if there are no other non-daemon thread running.
++
++2010-06-29 Omair Majid <omajid@redhat.com>
++
++	* netx/net/sourceforge/jnlp/cache/CacheUtil.java
++	(urlToPath): Call FileUtils.sanitizePath.
++	(fixPath): Moved to...
++	* netx/net/sourceforge/jnlp/util/FileUtils.java
++	(sanitizePath): New function. Moved from CacheUtil.java
++	(sanitizeFileName): Use a blacklisting approach rather than a whitelisting
++	approach: should work better with non ascii filenames.
++
++2010-07-08  Omair Majid  <omajid@redhat.com>
++
++	* plugin/icedteanp/java/sun/applet/PluginAppletViewer.java:
++	(reFrame): Pass the panel to the constructor, dont set it yourself.
++	(PluginAppletViewer): Set the panel to be the passed in object and only
++	then add it to the list of all panels.
++
++2010-07-08  Omair Majid  <omajid@redhat.com>
++
++	PR icedtea/460
++	* plugin/icedteanp/java/netscape/security/ForbiddenTargetException.java:
++	New file. Some applets, for legacy support, expect this class to be
++	present.
++
++2010-06-14 Andrew John Hughes  <ahughes@redhat.com>
++
++	Don't print out the return value of pthread_self
++	which is a pthread_t.  pthread_t is an opaque type
++	and we don't know what it actually is (it varies
++	from system to system; recent versions of Linux
++	use an unsigned long int).
++	* plugin/icedteanp/IcedTeaPluginUtils.h:
++	(PLUGIN_DEBUG_0ARG(str)): Don't print the thread_t.
++	(PLUGIN_DEBUG_1ARG(str,arg1)): Likewise.
++	(PLUGIN_DEBUG_2ARG(str,arg1,arg2)): Likewise.
++	(PLUGIN_DEBUG_3ARG(str,arg1,arg2,arg3)): Likewise.
++	(PLUGIN_DEBUG_4ARG(str,arg1,arg2,arg3,arg4)): Likewise.
++	(PLUGIN_DEBUG_5ARG(str,arg1,arg2,arg3,arg4,arg5)): Likewise.
++
++2010-06-14  Deepak Bhole <dbhole@redhat.com>
++
++	* plugin/icedteanp/java/sun/applet/PluginMessageConsumer.java: Fix bug
++	causing 100% CPU usage (rhbz# 592553).
++
++2010-06-14  Omair Majid <omajid@redhat.com>
++
++	PR icedtea/488
++	* plugin/icedteanp/IcedTeaPluginUtils.h: Bug #488. Fix bug due to
++	incorrect assumption that 'A' > 'a'.
++
++2010-06-14  Omair Majid <omajid@redhat.com>
++
++	PR icedtea/480
++	* plugin/icedteanp/IcedTeaNPPlugin.cc: Use getproperty NPAPI call instead
++	of evaluate, to get page URL.
++
++2010-05-07  Deepak Bhole <dbhole@redhat.com>
++
++	PR icedtea/436:
++	* plugin/icedteanp/java/sun/applet/PluginAppletViewer.java
++	(handleMessage): Don't print stack trace on InterruptedException.
++	(appletClose): Kill misbehaving applets that don't shut down properly.
++
++2010-05-07  Deepak Bhole <dbhole@redhat.com>
++
++	* netx/net/sourceforge/jnlp/Launcher.java
++	(setContextClassLoaderForAllThreads): Change to set context CL only for
++	given threadgroup.
++	(launchApplication): Supply threadgroup to
++	setContextClassLoaderForAllThreads.
++	(createApplet): Same.
++
++2010-05-07  Gary Benson  <gbenson@redhat.com>
++
++	* netx/net/sourceforge/jnlp/runtime/JNLPSecurityManager.java:
++	Removed a stray semicolon.
++
++2010-05-06  Deepak Bhole <dbhole@redhat.com>
++
++	* netx/net/sourceforge/jnlp/runtime/JNLPSecurityManager.java:
++	Add imports missed in last commit.
++
++2010-05-06  Deepak Bhole <dbhole@redhat.com>
++
++	* rt/net/sourceforge/jnlp/runtime/JNLPSecurityManager.java
++	(checkPermission): Allow Runtime and Security permission (for
++	putProvider.SunJCE) if initiated for an https connection.
++	(inTrustedCallChain): New method. Returns if given class/method is
++	in the call chain, and everything upto there is trusted.
++
++2010-05-05  Gary Benson  <gbenson@redhat.com>
++
++	PR icedtea/481
++	* ports/hotspot/src/share/vm/shark/sharkTopLevelBlock.cpp
++	(SharkTopLevelBlock::improve_virtual_call): Disable an
++	optimization that cannot currently be supported.
++
++2010-04-30  Gary Benson  <gbenson@redhat.com>
++
++	PR icedtea/324
++	* ports/hotspot/src/share/vm/shark/sharkTopLevelBlock.cpp
++	(SharkTopLevelBlock::do_aload): Cope with cases where
++	the array's type is unknown.
++	(SharkTopLevelBlock::do_astore): Likewise.
++
++2010-04-28  Andrew John Hughes  <ahughes@redhat.com>
++
++	PR icedtea/476
++	* Makefile.am:
++	Add patch when SystemTap is enabled to support
++	building with GCC 4.5.
++	* patches/systemtap-gcc-4.5.patch:
++	Add cast to NULL (doesn't apply to DTrace due
++	to differences between SystemTap and DTrace macros).
++
++2010-04-24  Matthias Klose  <doko@ubuntu.com>
++
++	* Makefile.am (check-langtools, check-jdk): Allow overwriting -samevm
++	with the environment variable ICEDTEA_JTREG_OTHERVM.
++
++2010-04-22  Xerxes Rånby  <xerxes@zafena.se>
++
++	* ports/hotspot/src/share/vm/shark/sharkNativeWrapper.cpp
++	(SharkNativeWrapper::initialize): Shark calling static jni
++	methods jclass argument fix.
++
++2010-04-04  Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
++
++	* acinclude.m4 (IT_SET_ARCH_SETTINGS): Fix Hitachi SH settings.
++
++2010-04-21  Deepak Bhole <dbhole@redhat.com>
++
++	* plugin/icedteanp/IcedTeaNPPlugin.cc
++	(plugin_filter_environment): Increment malloc size by one to account for
++	NULL terminator. Bug# 474.
++
+ 2010-04-12  Andrew John Hughes  <ahughes@redhat.com>
+ 
+ 	PR icedtea/373
+diff -r d1ad52447673 Makefile.am
+--- a/Makefile.am	Wed Apr 14 12:21:30 2010 +0200
++++ b/Makefile.am	Tue Jul 20 16:36:52 2010 +0200
+@@ -298,6 +298,7 @@
+ 	patches/icedtea-linux-separate-debuginfo.patch \
+ 	patches/icedtea-parisc.patch \
+ 	patches/icedtea-sh4-support.patch \
++	patches/icedtea-policy-evaluation.patch \
+ 	patches/libpng.patch \
+ 	patches/extensions/netx.patch \
+ 	patches/extensions/netx-dist.patch \
+@@ -326,7 +327,9 @@
+ 	patches/security/20100330/6932480.patch \
+ 	patches/ant-1.8.0.patch \
+ 	patches/icedtea-nss-6763530.patch \
+-	patches/nss-debug.patch
++	patches/nss-debug.patch \
++	patches/icedtea-override-redirect-metacity.patch \
++	patches/openjdk/6678385.patch
+ 
+ if WITH_RHINO
+ ICEDTEA_PATCHES += \
+@@ -374,7 +377,8 @@
+ endif
+ 
+ if ENABLE_SYSTEMTAP
+-ICEDTEA_PATCHES += patches/icedtea-systemtap.patch
++ICEDTEA_PATCHES += patches/icedtea-systemtap.patch \
++	patches/systemtap-gcc-4.5.patch
+ endif
+ 
+ if ENABLE_NSS
+@@ -2024,7 +2028,8 @@
+ 	mkdir -p test/langtools/JTwork test/langtools/JTreport
+ 	$(ICEDTEA_BOOT_DIR)/bin/java -jar test/jtreg.jar -v1 -a -ignore:quiet \
+ 		-w:test/langtools/JTwork -r:test/langtools/JTreport \
+-		-s -jdk:`pwd`/$(BUILD_OUTPUT_DIR)/j2sdk-image \
++		$${ICEDTEA_JTREG_OTHERVM:--samevm} \
++		-jdk:`pwd`/$(BUILD_OUTPUT_DIR)/j2sdk-image \
+ 		$(ICEDTEA_JTREG_OPTIONS) \
+ 		`pwd`/openjdk/langtools/test \
+ 	    | tee test/$@.log
+@@ -2033,7 +2038,8 @@
+ 	mkdir -p test/jdk/JTwork test/jdk/JTreport
+ 	$(ICEDTEA_BOOT_DIR)/bin/java -jar test/jtreg.jar -v1 -a -ignore:quiet \
+ 		-w:test/jdk/JTwork -r:test/jdk/JTreport \
+-		-s -jdk:`pwd`/$(BUILD_OUTPUT_DIR)/j2sdk-image \
++		$${ICEDTEA_JTREG_OTHERVM:--samevm} \
++		-jdk:`pwd`/$(BUILD_OUTPUT_DIR)/j2sdk-image \
+ 		-exclude:$(abs_top_srcdir)/test/jtreg/excludelist.jdk.jtx \
+ 		$(ICEDTEA_JTREG_OPTIONS) \
+ 		`pwd`/openjdk/jdk/test \
+diff -r d1ad52447673 acinclude.m4
+--- a/acinclude.m4	Wed Apr 14 12:21:30 2010 +0200
++++ b/acinclude.m4	Tue Jul 20 16:36:52 2010 +0200
+@@ -85,7 +85,7 @@
+       CROSS_TARGET_ARCH=s390x
+       ARCHFLAG="-m64"
+        ;;
+-    sh*-*-*)
++    sh*)
+       BUILD_ARCH_DIR=sh
+       INSTALL_ARCH_DIR=sh
+       JRE_ARCH_DIR=sh
+@@ -1461,15 +1461,7 @@
+   AC_SUBST(GTK_CFLAGS)
+   AC_SUBST(GTK_LIBS)
+ 
+-
+-  if $PKG_CONFIG --atleast-version 1.9.2 libxul 2>&AS_MESSAGE_LOG_FD ; then
+-    xullibs=libxul
+-  else
+-    xullibs="libxul libxul-unstable"
+-  fi
+-
+-  PKG_CHECK_MODULES(MOZILLA, \
+-    mozilla-plugin ${xullibs})
++  PKG_CHECK_MODULES(MOZILLA, mozilla-plugin)
+     
+   AC_SUBST(MOZILLA_CFLAGS)
+   AC_SUBST(MOZILLA_LIBS)
+@@ -1482,52 +1474,13 @@
+ AC_REQUIRE([IT_CHECK_PLUGIN_DEPENDENCIES])
+ if test "x${enable_plugin}" = "xyes"
+ then
+-  AC_LANG_PUSH([C++])
+-  OLDCPPFLAGS="$CPPFLAGS"
+-  CPPFLAGS="$CPPFLAGS $MOZILLA_CFLAGS"
+-
+-  AC_CACHE_CHECK([for xulrunner version], [xulrunner_cv_collapsed_version],
+-      [AC_RUN_IFELSE(
+-        [AC_LANG_PROGRAM([[
+-#include <mozilla-config.h>
+-#include <math.h>
+-#include <string.h>
+-#include <stdlib.h>
+-#include <stdio.h>
+-]],[[
+-int version = 0;
+-const char* token = NULL;
+-int power=6;
+-FILE *datafile;
+-
+-datafile = fopen ("conftest.vdata", "w");
+-if (!datafile) return 1;
+-
+-// 32 chars is more than enough to hold version
+-char* mozilla_version = (char*) malloc(32*sizeof(char));
+-snprintf(mozilla_version, 32, "%s", MOZILLA_VERSION);
+-
+-token = strtok(mozilla_version, ".");
+-while (token)
+-{
+-    version += atoi(token)*(pow(10, power));
+-    power -=2;
+-    token = strtok(NULL, ".");
+-}
+-
+-fprintf (datafile, "%d\n", version);
+-free(mozilla_version);
+-if (fclose(datafile)) return 1;
+-
+-return EXIT_SUCCESS;
+-]])],
+-    [xulrunner_cv_collapsed_version="$(cat conftest.vdata)"],
+-    [AC_MSG_FAILURE([cannot determine xulrunner version])])],
+-  [xulrunner_cv_collapsed_version="190000"])
+-
+-  CPPFLAGS="$OLDCPPFLAGS"
+-  AC_LANG_POP([C++])
+-
++  AC_CACHE_CHECK([for xulrunner version], [xulrunner_cv_collapsed_version],[
++    if pkg-config --modversion libxul >/dev/null 2>&1
++    then
++      xulrunner_cv_collapsed_version=`pkg-config --modversion libxul | awk -F. '{power=6; v=0; for (i=1; i <= NF; i++) {v += $i * 10 ^ power; power -=2}; print v}'`
++    else
++      AC_MSG_FAILURE([cannot determine xulrunner version])
++    fi])
+   AC_SUBST(MOZILLA_VERSION_COLLAPSED, $xulrunner_cv_collapsed_version)
+ fi
+ ])
+diff -r d1ad52447673 netx/net/sourceforge/jnlp/Launcher.java
+--- a/netx/net/sourceforge/jnlp/Launcher.java	Wed Apr 14 12:21:30 2010 +0200
++++ b/netx/net/sourceforge/jnlp/Launcher.java	Tue Jul 20 16:36:52 2010 +0200
+@@ -442,7 +442,7 @@
+             Method main = mainClass.getDeclaredMethod("main", new Class[] {String[].class} );
+             String args[] = file.getApplication().getArguments();
+ 
+-            setContextClassLoaderForAllThreads(app.getClassLoader());
++            setContextClassLoaderForAllThreads(app.getThreadGroup(), app.getClassLoader());
+ 
+             if (splashScreen != null) {
+                 if (splashScreen.isSplashScreenValid()) {
+@@ -464,30 +464,24 @@
+     }
+ 
+     /**
+-     * Set the classloader as the context classloader for all threads. This is
+-     * required to make some applications work. For example, an application that
+-     * provides a custom Swing LnF may ask the swing thread to load resources
+-     * from their JNLP, which would only work if the Swing thread knows about
+-     * the JNLPClassLoader.
++     * Set the classloader as the context classloader for all threads in 
++     * the given threadgroup. This is required to make some applications 
++     * work. For example, an application that provides a custom Swing LnF 
++     * may ask the swing thread to load resources from their JNLP, which 
++     * would only work if the Swing thread knows about the JNLPClassLoader.
+      * 
++     * @param tg The threadgroup for which the context classloader should be set
+      * @param classLoader the classloader to set as the context classloader
+      */
+-    private void setContextClassLoaderForAllThreads(ClassLoader classLoader) {
+-        ThreadMXBean threadBean = ManagementFactory.getThreadMXBean();
+-        ThreadGroup root;
+-        
+-        root = Thread.currentThread().getThreadGroup();
+-        while (root.getParent() != null) {
+-            root = root.getParent();
+-        }
++    private void setContextClassLoaderForAllThreads(ThreadGroup tg, ClassLoader classLoader) {
+ 
+         /* be prepared for change in thread size */
+-        int threadCountGuess = threadBean.getThreadCount();
++        int threadCountGuess = tg.activeCount();
+         Thread[] threads;
+         do {
+             threadCountGuess = threadCountGuess * 2;
+             threads = new Thread[threadCountGuess];
+-            root.enumerate(threads, true);
++            tg.enumerate(threads, true);
+         } while (threads[threadCountGuess-1] != null);
+         
+         
+@@ -595,7 +589,7 @@
+             group.setApplication(appletInstance);
+             loader.setApplication(appletInstance);
+ 
+-            setContextClassLoaderForAllThreads(appletInstance.getClassLoader());
++            setContextClassLoaderForAllThreads(appletInstance.getThreadGroup(), appletInstance.getClassLoader());
+ 
+             return appletInstance;
+         }
+diff -r d1ad52447673 netx/net/sourceforge/jnlp/Parser.java
+--- a/netx/net/sourceforge/jnlp/Parser.java	Wed Apr 14 12:21:30 2010 +0200
++++ b/netx/net/sourceforge/jnlp/Parser.java	Tue Jul 20 16:36:52 2010 +0200
+@@ -1169,11 +1169,15 @@
+             Node jnlpNode = getChildNode(document, "jnlp"); // skip comments
+             */
+ 
++            //A BufferedInputStream is used to allow marking and reseting 
++            //of a stream.    
++            BufferedInputStream bs = new BufferedInputStream(input);
++
+             /* NANO */
+             final XMLElement xml = new XMLElement();
+             final PipedInputStream pin = new PipedInputStream();
+             final PipedOutputStream pout = new PipedOutputStream(pin);
+-            final InputStreamReader isr = new InputStreamReader(input);    
++            final InputStreamReader isr = new InputStreamReader(bs, getEncoding(bs));
+             // Clean the jnlp xml file of all comments before passing
+             // it to the parser.
+             new Thread(
+@@ -1196,7 +1200,69 @@
+             throw new ParseException(R("PBadXML"), ex);
+         }
+     }
++    
++    /**
++     * Returns the name of the encoding used in this InputStream.
++     *
++     * @param input the InputStream
++     * @return a String representation of encoding
++     */
++    private static String getEncoding(InputStream input) throws IOException{
++        //Fixme: This only recognizes UTF-8, UTF-16, and 
++        //UTF-32, which is enough to parse the prolog portion of xml to
++        //find out the exact encoding (if it exists). The reason being
++        //there could be other encodings, such as ISO 8859 which is 8-bits
++        //but it supports latin characters.  
++        //So what needs to be done is to parse the prolog and retrieve
++        //the exact encoding from it.
+ 
++        int[] s = new int[4];
++        String encoding = "UTF-8";
++
++        //Determine what the first four bytes are and store 
++        //them into an int array.
++        input.mark(4);
++        for (int i = 0; i < 4; i++) {
++            s[i] = input.read(); 
++        }
++        input.reset();
++
++        //Set the encoding base on what the first four bytes of the
++        //inputstream turn out to be (following the information from
++        //www.w3.org/TR/REC-xml/#sec-guessing).
++        if (s[0] == 255) {
++            if (s[1] == 254) {
++                if (s[2] != 0 || s[3] != 0) {
++                    encoding = "UnicodeLittle";
++                } else {
++                    encoding = "X-UTF-32LE-BOM";
++                }
++            }
++        } else if (s[0] == 254 && s[1] == 255 && (s[2] != 0 || 
++          s[3] != 0)) {
++            encoding = "UTF-16";
++
++        } else if (s[0] == 0 && s[1] == 0 && s[2] == 254 && 
++          s[3] == 255) {
++            encoding = "X-UTF-32BE-BOM";
++
++        } else if (s[0] == 0 && s[1] == 0 && s[2] == 0 && 
++          s[3] == 60) {
++            encoding = "UTF-32BE";
++ 
++        } else if (s[0] == 60 && s[1] == 0 && s[2] == 0 && 
++          s[3] == 0) {
++            encoding = "UTF-32LE";
++
++        } else if (s[0] == 0 && s[1] == 60 && s[2] == 0 && 
++          s[3] == 63) { 
++            encoding = "UTF-16BE"; 
++        } else if (s[0] == 60 && s[1] == 0 && s[2] == 63 &&
++          s[3] == 0) { 
++            encoding = "UTF-16LE";
++        }
++
++        return encoding;
++    }
+ }
+ 
+-
+diff -r d1ad52447673 netx/net/sourceforge/jnlp/SecurityDesc.java
+--- a/netx/net/sourceforge/jnlp/SecurityDesc.java	Wed Apr 14 12:21:30 2010 +0200
++++ b/netx/net/sourceforge/jnlp/SecurityDesc.java	Tue Jul 20 16:36:52 2010 +0200
+@@ -31,12 +31,9 @@
+  */
+ public class SecurityDesc {
+ 
+-    // todo: make sure classloader's native code support checks
+-    // the security permissions
+-
+-    // shouldn't need to verify that native code only runs in
+-    // trusted environment because the parser and/or classloader
+-    // should kick it.
++    /*
++     * We do not verify security here, the classloader deals with security
++     */
+ 
+     /** All permissions. */
+     public static final Object ALL_PERMISSIONS = "All";
+diff -r d1ad52447673 netx/net/sourceforge/jnlp/cache/CacheUtil.java
+--- a/netx/net/sourceforge/jnlp/cache/CacheUtil.java	Wed Apr 14 12:21:30 2010 +0200
++++ b/netx/net/sourceforge/jnlp/cache/CacheUtil.java	Tue Jul 20 16:36:52 2010 +0200
+@@ -26,6 +26,7 @@
+ 
+ import net.sourceforge.jnlp.*;
+ import net.sourceforge.jnlp.runtime.*;
++import net.sourceforge.jnlp.util.FileUtils;
+ 
+ /**
+  * Provides static methods to interact with the cache, download
+@@ -300,23 +301,9 @@
+         path.append(File.separatorChar);
+         path.append(location.getPath().replace('/', File.separatorChar));
+ 
+-        return new File(JNLPRuntime.getBaseDir(), fixPath(path.toString()));
++        return new File(JNLPRuntime.getBaseDir(), FileUtils.sanitizePath(path.toString()));
+     }
+ 
+-    /**
+-     * Clean up a string by removing characters that can't appear in
+-     * a local file name.
+-     */
+-    private static String fixPath(String path) {
+-        char badChars[] = { '\\', '/', ':', '*', '?', '"', '<', '>', '|' };
+-
+-        for (int i=0; i < badChars.length; i++)
+-            if (badChars[i] != File.separatorChar)
+-                if (-1 != path.indexOf(badChars[i]))
+-                    path = path.replace(badChars[i], 'X');
+-
+-        return path;
+-    }
+ 
+     /**
+      * Waits until the resources are downloaded, while showing a
+diff -r d1ad52447673 netx/net/sourceforge/jnlp/runtime/JNLPClassLoader.java
+--- a/netx/net/sourceforge/jnlp/runtime/JNLPClassLoader.java	Wed Apr 14 12:21:30 2010 +0200
++++ b/netx/net/sourceforge/jnlp/runtime/JNLPClassLoader.java	Tue Jul 20 16:36:52 2010 +0200
+@@ -32,6 +32,7 @@
+ import java.security.Permissions;
+ import java.security.PrivilegedAction;
+ import java.util.ArrayList;
++import java.util.Collections;
+ import java.util.Enumeration;
+ import java.util.HashMap;
+ import java.util.LinkedList;
+@@ -80,12 +81,12 @@
+     /** map from JNLPFile url to shared classloader */
+     private static Map urlToLoader = new HashMap(); // never garbage collected!
+ 
+-    /** number of times a classloader with native code is created */
+-    private static int nativeCounter = 0;
+-
+     /** the directory for native code */
+     private File nativeDir = null; // if set, some native code exists
+ 
++    /** a list of directories that contain native libraries */
++    private List<File> nativeDirectories = Collections.synchronizedList(new LinkedList<File>());
++
+     /** security context */
+     private AccessControlContext acc = AccessController.getContext();
+ 
+@@ -240,18 +241,22 @@
+ 		        // loader for this unique key. Check.
+ 		        JNLPClassLoader extLoader = (JNLPClassLoader) urlToLoader.get(uniqueKey);
+ 
+-		        if (extLoader != null) {
++		        if (extLoader != null && extLoader != loader) {
+ 		            for (URL u : loader.getURLs())
+ 		                extLoader.addURL(u);
++		            for (File nativeDirectory: loader.getNativeDirectories())
++		                extLoader.addNativeDirectory(nativeDirectory);
+ 
+ 		            loader = extLoader;
+ 		        }
+ 
+                 // loader is now current + ext. But we also need to think of 
+                 // the baseLoader
+-		        if (baseLoader != null) {
++		        if (baseLoader != null && baseLoader != loader) {
+                     for (URL u : loader.getURLs())
+                         baseLoader.addURL(u);
++                    for (File nativeDirectory: loader.getNativeDirectories())
++                        baseLoader.addNativeDirectory(nativeDirectory);
+ 
+                     loader = baseLoader;
+                 } 
+@@ -642,8 +647,8 @@
+                             ex.printStackTrace();
+                     }
+ 
+-                    if (jar.isNative())
+-                        activateNative(jar);
++                    // some programs place a native library in any jar
++                    activateNative(jar);
+                 }
+ 
+                 return null;
+@@ -654,9 +659,9 @@
+     }
+ 
+     /**
+-     * Enable the native code contained in a JAR by copying the
+-     * native files into the filesystem.  Called in the security
+-     * context of the classloader.
++     * Search for and enable any native code contained in a JAR by copying the
++     * native files into the filesystem. Called in the security context of the
++     * classloader.
+      */
+     protected void activateNative(JARDesc jar) {
+         if (JNLPRuntime.isDebug())
+@@ -669,17 +674,33 @@
+         if (nativeDir == null)
+             nativeDir = getNativeDir();
+ 
++        String[] librarySuffixes = { ".so", ".dylib", ".jnilib", ".framework", ".dll" };
++
+         try {
+             JarFile jarFile = new JarFile(localFile, false);
+-            Enumeration entries = jarFile.entries();
++            Enumeration<JarEntry> entries = jarFile.entries();
+ 
+             while (entries.hasMoreElements()) {
+-                JarEntry e = (JarEntry) entries.nextElement();
++                JarEntry e = entries.nextElement();
+ 
+-                if (e.isDirectory() || e.getName().indexOf('/') != -1)
++                if (e.isDirectory()) {
+                     continue;
++                }
+ 
+-                File outFile = new File(nativeDir, e.getName());
++                String name = new File(e.getName()).getName();
++                boolean isLibrary = false;
++
++                for (String suffix: librarySuffixes) {
++                    if (name.endsWith(suffix)) {
++                       isLibrary = true;
++                       break;
++                    }
++                }
++                if (!isLibrary) {
++                    continue;
++                }
++
++                File outFile = new File(nativeDir, name);
+ 
+                 CacheUtil.streamCopy(jarFile.getInputStream(e),
+                                      new FileOutputStream(outFile));
+@@ -703,29 +724,47 @@
+ 
+         if (!nativeDir.mkdirs()) 
+             return null;
+-        else
++        else {
++            // add this new native directory to the search path
++            addNativeDirectory(nativeDir);
+             return nativeDir;
++        }
++    }
++
++    /**
++     * Adds the {@link File} to the search path of this {@link JNLPClassLoader}
++     * when trying to find a native library
++     */
++    protected void addNativeDirectory(File nativeDirectory) {
++        nativeDirectories.add(nativeDirectory);
++    }
++
++    /**
++     * Returns a list of all directories in the search path of the current classloader
++     * when it tires to find a native library.
++     * @return a list of directories in the search path for native libraries
++     */
++    protected List<File> getNativeDirectories() {
++        return nativeDirectories;
+     }
+ 
+     /**
+      * Return the absolute path to the native library.
+      */
+     protected String findLibrary(String lib) {
+-        if (nativeDir == null)
+-            return null;
+-
+         String syslib = System.mapLibraryName(lib);
+ 
+-        File target = new File(nativeDir, syslib);
+-        if (target.exists())
+-            return target.toString();
+-        else {
+-            String result = super.findLibrary(lib);
+-            if (result != null)
+-                return result;
++        for (File dir: getNativeDirectories()) {
++            File target = new File(dir, syslib);
++            if (target.exists())
++                return target.toString();
++        }
+ 
+-            return findLibraryExt(lib);
+-        }
++        String result = super.findLibrary(lib);
++        if (result != null)
++            return result;
++
++        return findLibraryExt(lib);
+     }
+ 
+     /**
+diff -r d1ad52447673 netx/net/sourceforge/jnlp/runtime/JNLPSecurityManager.java
+--- a/netx/net/sourceforge/jnlp/runtime/JNLPSecurityManager.java	Wed Apr 14 12:21:30 2010 +0200
++++ b/netx/net/sourceforge/jnlp/runtime/JNLPSecurityManager.java	Tue Jul 20 16:36:52 2010 +0200
+@@ -23,10 +23,12 @@
+ import java.awt.event.WindowEvent;
+ import java.lang.ref.WeakReference;
+ import java.net.SocketPermission;
++import java.security.AllPermission;
+ import java.security.AccessControlException;
+ import java.security.AccessController;
+ import java.security.Permission;
+ import java.security.PrivilegedAction;
++import java.security.SecurityPermission;
+ import java.util.PropertyPermission;
+ 
+ import javax.swing.JWindow;
+@@ -395,6 +397,24 @@
+ 				    // Everything else is denied
+ 				    throw se;
+ 
++				} else if (perm instanceof SecurityPermission) {
++
++				    // JCE's initialization requires putProviderProperty permission
++				    if (perm.equals(new SecurityPermission("putProviderProperty.SunJCE"))) {
++				        if (inTrustedCallChain("com.sun.crypto.provider.SunJCE", "run")) {
++				            return;
++				        }
++				    }
++
++				} else if (perm instanceof RuntimePermission) {
++
++				    // KeyGenerator's init method requires internal spec access
++				    if (perm.equals(new SecurityPermission("accessClassInPackage.sun.security.internal.spec"))) {
++				        if (inTrustedCallChain("javax.crypto.KeyGenerator", "init")) {
++				            return;
++				        }
++				    }
++
+ 				} else {
+ 				    tmpPerm = perm;
+ 				}
+@@ -419,6 +439,34 @@
+         }
+     }
+ 
++    /** 
++     * Returns weather the given class and method are in the current stack, 
++     * and whether or not everything upto then is trusted
++     * 
++     * @param className The name of the class to look for in the stack
++     * @param methodName The name of the method for the given class to look for in the stack
++     * @return Weather or not class::method() are in the chain, and everything upto there is trusted
++     */
++    private boolean inTrustedCallChain(String className, String methodName) {
++        
++        StackTraceElement[] stack =  Thread.currentThread().getStackTrace();
++        
++        for (int i=0; i < stack.length; i++) {
++
++            // Everything up to the desired class/method must be trusted
++            if (!stack[i].getClass().getProtectionDomain().implies(new AllPermission())) {
++                return false;
++            }
++
++            if (stack[i].getClassName().equals(className) &&
++                stack[i].getMethodName().equals(methodName)) {
++                return true;
++            }
++        }
++        
++        return false;
++    }
++    
+     /**
+      * Asks the user whether or not to grant permission.
+      * @param perm the permission to be granted
+diff -r d1ad52447673 netx/net/sourceforge/jnlp/services/XSingleInstanceService.java
+--- a/netx/net/sourceforge/jnlp/services/XSingleInstanceService.java	Wed Apr 14 12:21:30 2010 +0200
++++ b/netx/net/sourceforge/jnlp/services/XSingleInstanceService.java	Tue Jul 20 16:36:52 2010 +0200
+@@ -145,14 +145,21 @@
+     }
+ 
+     /**
+-     * Start the listening server to accept arguments from new isntances of
++     * Start the listening server to accept arguments from new instances of
+      * applications
+      * 
+      * @param lockFile
++     *            the {@link SingleInstanceLock} that the server should use
+      */
+     private void startListeningServer(SingleInstanceLock lockFile) {
+         SingleInstanceServer server = new SingleInstanceServer(lockFile);
+-        new Thread(server).start();
++        Thread serverThread = new Thread(server);
++        /* 
++         * mark as daemon so the JVM can shutdown if the server is the only
++         * thread running
++         */
++        serverThread.setDaemon(true);
++        serverThread.start();
+     }
+ 
+     /**
+diff -r d1ad52447673 netx/net/sourceforge/jnlp/util/FileUtils.java
+--- a/netx/net/sourceforge/jnlp/util/FileUtils.java	Wed Apr 14 12:21:30 2010 +0200
++++ b/netx/net/sourceforge/jnlp/util/FileUtils.java	Tue Jul 20 16:36:52 2010 +0200
+@@ -14,35 +14,58 @@
+ // License along with this library; if not, write to the Free Software
+ // Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
+ 
+-
+ package net.sourceforge.jnlp.util;
+ 
++import java.io.File;
++
+ /**
+- * This class contains a few file-related utility functions. 
++ * This class contains a few file-related utility functions.
+  * 
+  * @author Omair Majid
+  */
+ 
+-public class FileUtils {
++public final class FileUtils {
+ 
+-    
++    /**
++     * list of characters not allowed in filenames
++     */
++    private static final char INVALID_CHARS[] = { '\\', '/', ':', '*', '?', '"', '<', '>', '|' };
++
++    private static final char SANITIZED_CHAR = '_';
++
++    /**
++     * Clean up a string by removing characters that can't appear in a local
++     * file name.
++     *
++     * @param path
++     *        the path to sanitize
++     * @return a sanitized version of the input which is suitable for using as a
++     *         file path
++     */
++    public static String sanitizePath(String path) {
++
++        for (int i = 0; i < INVALID_CHARS.length; i++)
++            if (INVALID_CHARS[i] != File.separatorChar)
++                if (-1 != path.indexOf(INVALID_CHARS[i]))
++                    path = path.replace(INVALID_CHARS[i], SANITIZED_CHAR);
++
++        return path;
++    }
++
+     /**
+      * Given an input, return a sanitized form of the input suitable for use as
+      * a file/directory name
+-     * 
++     *
+      * @param input
+      * @return a sanitized version of the input
+      */
+-    public static String sanitizeFileName(String input) {
++    public static String sanitizeFileName(String filename) {
+ 
+-        /*
+-         * FIXME
+-         * 
+-         * Assuming safe characters are 'a-z','A-Z','0-9', '_', '.'
+-         */
++        for (int i = 0; i < INVALID_CHARS.length; i++)
++            if (-1 != filename.indexOf(INVALID_CHARS[i]))
++                filename = filename.replace(INVALID_CHARS[i], SANITIZED_CHAR);
+ 
+-        String sanitizedName = input.replaceAll("[^a-zA-Z0-9.]", "_");
+-        return sanitizedName;
++        return filename;
+     }
+-    
++
+ }
+diff -r d1ad52447673 patches/icedtea-override-redirect-metacity.patch
+--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
++++ b/patches/icedtea-override-redirect-metacity.patch	Tue Jul 20 16:36:52 2010 +0200
+@@ -0,0 +1,11 @@
++--- openjdk/jdk/src/solaris/classes/sun/awt/X11/XWindowPeer.java.orig	2008-05-25 17:31:31.000000000 +0200
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/XWindowPeer.java	2008-05-25 17:33:32.000000000 +0200
++@@ -1124,6 +1124,8 @@
++ 
++     boolean isOverrideRedirect() {
++         return (XWM.getWMID() == XWM.OPENLOOK_WM ? true : false) ||
+++            (XWM.getWMID() == XWM.METACITY_WM ? true : false) ||
+++            target.getName().equals("###overrideRedirect###") ||
++             ((XToolkit)Toolkit.getDefaultToolkit()).isOverrideRedirect((Window)target) ||
++             XTrayIconPeer.isTrayIconStuffWindow((Window)target);
++     }
+diff -r d1ad52447673 patches/icedtea-policy-evaluation.patch
+--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
++++ b/patches/icedtea-policy-evaluation.patch	Tue Jul 20 16:36:52 2010 +0200
+@@ -0,0 +1,35 @@
++# This patch aligns policy evaluation to be the same as the proprietary JDK.
++# http://mail.openjdk.java.net/pipermail/distro-pkg-dev/2010-July/009658.html
++# https://bugs.openjdk.java.net/show_bug.cgi?id=100142
++
++diff -up ./openjdk/jdk/src/share/classes/sun/security/provider/PolicyFile.java.sav ./jdk/src/share/classes/sun/security/provider/PolicyFile.java
++--- ./openjdk.orig/jdk/src/share/classes/sun/security/provider/PolicyFile.java.sav	2010-04-20 14:49:13.000000000 -0400
+++++ ./openjdk/jdk/src/share/classes/sun/security/provider/PolicyFile.java	2010-04-20 14:50:26.000000000 -0400
++@@ -1799,6 +1799,27 @@ public class PolicyFile extends java.sec
++ 
++         CodeSource canonCs = cs;
++         URL u = cs.getLocation();
+++        
+++        // If this is a jar protocol url, collapse it to a 
+++        // file protocol to process it as per the javadocs
+++        if (u != null && u.getProtocol().equals("jar")) {
+++            try {
+++                String fileURL = "";
+++            
+++                // remove the initial jar:
+++                fileURL = u.getPath();
+++            
+++                // remove the part after the !
+++                fileURL = fileURL.substring(0, fileURL.indexOf('!'));
+++                
+++                u = new URL(fileURL);
+++
+++            } catch (Exception e) {
+++                // Fail silently. In this case, url stays what it was above
+++            }
+++            
+++        }
+++        
++         if (u != null && u.getProtocol().equals("file")) {
++             boolean isLocalFile = false;
++             String host = u.getHost();
+diff -r d1ad52447673 patches/openjdk/6678385.patch
+--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
++++ b/patches/openjdk/6678385.patch	Tue Jul 20 16:36:52 2010 +0200
+@@ -0,0 +1,1241 @@
++# HG changeset patch
++# User art
++# Date 1242387635 -14400
++# Node ID f62f7fcc9965cd0b110f07b4cd42c419f77717c1
++# Parent  b28b073e72b625a4d8b6e71010a2968b5fc85124
++6678385: Random java.lang.StackOverflowError from various JDKs
++Reviewed-by: stayer
++
++IcedTea6 note: This patch (upstream bz#6678385) fixes rhbz# 551835.
++
++diff -uNr openjdk.orig/jdk/make/sun/xawt/mapfile-vers openjdk/jdk/make/sun/xawt/mapfile-vers
++--- openjdk.orig/jdk/make/sun/xawt/mapfile-vers	2010-07-15 10:28:21.755105655 -0400
+++++ openjdk/jdk/make/sun/xawt/mapfile-vers	2010-07-15 10:28:42.630981569 -0400
++@@ -125,6 +125,7 @@
++         Java_sun_awt_X11_XlibWrapper_SetToolkitErrorHandler;
++         Java_sun_awt_X11_XlibWrapper_XSetErrorHandler;
++         Java_sun_awt_X11_XlibWrapper_CallErrorHandler;
+++        Java_sun_awt_X11_XlibWrapper_PrintXErrorEvent;
++         Java_sun_awt_X11_XlibWrapper_XInternAtoms;
++         Java_sun_awt_X11_XlibWrapper_XChangeWindowAttributes;
++         Java_sun_awt_X11_XlibWrapper_XDeleteProperty;
++@@ -269,7 +270,6 @@
++         Java_sun_awt_X11_XToolkit_getDefaultXColormap;
++         Java_sun_awt_X11_XToolkit_getDefaultScreenData;
++         Java_sun_awt_X11_XToolkit_getEnv;
++-        Java_sun_awt_X11_XToolkit_setNoisyXErrorHandler;
++         Java_sun_awt_X11_XlibWrapper_XCreateBitmapFromData;
++         Java_sun_awt_X11_XlibWrapper_XFreePixmap;
++         Java_sun_awt_X11_XlibWrapper_XAllocColor;
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/MotifDnDConstants.java openjdk/jdk/src/solaris/classes/sun/awt/X11/MotifDnDConstants.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/MotifDnDConstants.java	2010-07-15 10:28:21.905105617 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/MotifDnDConstants.java	2010-07-15 10:28:42.631981678 -0400
++@@ -119,7 +119,7 @@
++                                                             false,
++                                                             XlibWrapper.AnyPropertyType);
++         try {
++-            int status = wpg.execute(XToolkit.IgnoreBadWindowHandler);
+++            int status = wpg.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++             if (status == XlibWrapper.Success &&
++                 wpg.getData() != 0 &&
++@@ -189,7 +189,7 @@
++                 try {
++                     Native.putLong(data, motifWindow);
++ 
++-                    XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++                    XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++                     XlibWrapper.XChangeProperty(XToolkit.getDisplay(),
++                                                 defaultRootWindow,
++                                                 XA_MOTIF_DRAG_WINDOW.getAtom(),
++@@ -276,7 +276,7 @@
++                                                             false,
++                                                             XA_MOTIF_DRAG_TARGETS.getAtom());
++         try {
++-            int status = wpg.execute(XToolkit.IgnoreBadWindowHandler);
+++            int status = wpg.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++             if (status != XlibWrapper.Success
++                 || wpg.getActualType() != XA_MOTIF_DRAG_TARGETS.getAtom()
++@@ -390,7 +390,7 @@
++                 }
++             }
++ 
++-            XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++            XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++             XlibWrapper.XChangeProperty(XToolkit.getDisplay(),
++                                         motifWindow,
++                                         XA_MOTIF_DRAG_TARGETS.getAtom(),
++@@ -406,7 +406,7 @@
++                 // Create a new motif window and retry.
++                 motifWindow = createMotifWindow();
++ 
++-                XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++                XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++                 XlibWrapper.XChangeProperty(XToolkit.getDisplay(),
++                                             motifWindow,
++                                             XA_MOTIF_DRAG_TARGETS.getAtom(),
++@@ -530,7 +530,7 @@
++             // CARD32 icc_handle
++             unsafe.putInt(structData + 4, (int)XA_MOTIF_ATOM_0.getAtom());
++ 
++-            XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++            XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++             XlibWrapper.XChangeProperty(XToolkit.getDisplay(), window,
++                                         XA_MOTIF_ATOM_0.getAtom(),
++                                         XA_MOTIF_DRAG_INITIATOR_INFO.getAtom(),
++@@ -563,7 +563,7 @@
++             unsafe.putShort(data + 10, (short)0); /* pad */
++             unsafe.putInt(data + 12, dataSize);
++ 
++-            XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++            XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++             XlibWrapper.XChangeProperty(XToolkit.getDisplay(), window,
++                                         XA_MOTIF_DRAG_RECEIVER_INFO.getAtom(),
++                                         XA_MOTIF_DRAG_RECEIVER_INFO.getAtom(),
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/MotifDnDDragSourceProtocol.java openjdk/jdk/src/solaris/classes/sun/awt/X11/MotifDnDDragSourceProtocol.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/MotifDnDDragSourceProtocol.java	2010-07-15 10:28:21.905105617 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/MotifDnDDragSourceProtocol.java	2010-07-15 10:28:42.633981353 -0400
++@@ -184,7 +184,7 @@
++                                      XlibWrapper.AnyPropertyType);
++ 
++         try {
++-            int status = wpg.execute(XToolkit.IgnoreBadWindowHandler);
+++            int status = wpg.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++             /*
++              * DragICCI.h:
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/MotifDnDDropTargetProtocol.java openjdk/jdk/src/solaris/classes/sun/awt/X11/MotifDnDDropTargetProtocol.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/MotifDnDDropTargetProtocol.java	2010-07-15 10:28:21.904105558 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/MotifDnDDropTargetProtocol.java	2010-07-15 10:28:42.636014780 -0400
++@@ -102,7 +102,7 @@
++                                      XlibWrapper.AnyPropertyType);
++ 
++         try {
++-            status = wpg.execute(XToolkit.IgnoreBadWindowHandler);
+++            status = wpg.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++             /*
++              * DragICCI.h:
++@@ -162,7 +162,7 @@
++                 unsafe.putInt(data + 12, dataSize);
++             }
++ 
++-            XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++            XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++             XlibWrapper.XChangeProperty(XToolkit.getDisplay(), embedder,
++                                         MotifDnDConstants.XA_MOTIF_DRAG_RECEIVER_INFO.getAtom(),
++                                         MotifDnDConstants.XA_MOTIF_DRAG_RECEIVER_INFO.getAtom(),
++@@ -204,7 +204,7 @@
++                                          XlibWrapper.AnyPropertyType);
++ 
++             try {
++-                status = wpg.execute(XToolkit.IgnoreBadWindowHandler);
+++                status = wpg.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++                 /*
++                  * DragICCI.h:
++@@ -236,7 +236,7 @@
++ 
++                     unsafe.putInt(data + 4, tproxy);
++ 
++-                    XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++                    XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++                     XlibWrapper.XChangeProperty(XToolkit.getDisplay(), embedder,
++                                                 MotifDnDConstants.XA_MOTIF_DRAG_RECEIVER_INFO.getAtom(),
++                                                 MotifDnDConstants.XA_MOTIF_DRAG_RECEIVER_INFO.getAtom(),
++@@ -276,7 +276,7 @@
++                                      XlibWrapper.AnyPropertyType);
++ 
++         try {
++-            status = wpg.execute(XToolkit.IgnoreBadWindowHandler);
+++            status = wpg.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++             /*
++              * DragICCI.h:
++@@ -325,7 +325,7 @@
++                                      XlibWrapper.AnyPropertyType);
++ 
++         try {
++-            int status = wpg.execute(XToolkit.IgnoreBadWindowHandler);
+++            int status = wpg.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++             if (status == (int)XlibWrapper.Success && wpg.getData() != 0 &&
++                 wpg.getActualType() != 0 && wpg.getActualFormat() == 8 &&
++@@ -375,7 +375,7 @@
++                                          MotifDnDConstants.XA_MOTIF_DRAG_INITIATOR_INFO.getAtom());
++ 
++             try {
++-                int status = wpg.execute(XToolkit.IgnoreBadWindowHandler);
+++                int status = wpg.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++                 if (status == XlibWrapper.Success && wpg.getData() != 0 &&
++                     wpg.getActualType() ==
++@@ -412,7 +412,7 @@
++          */
++         XWindowAttributes wattr = new XWindowAttributes();
++         try {
++-            XToolkit.WITH_XERROR_HANDLER(XToolkit.IgnoreBadWindowHandler);
+++            XToolkit.WITH_XERROR_HANDLER(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++             int status = XlibWrapper.XGetWindowAttributes(XToolkit.getDisplay(),
++                                                           source_win, wattr.pData);
++ 
++@@ -429,7 +429,7 @@
++             wattr.dispose();
++         }
++ 
++-        XToolkit.WITH_XERROR_HANDLER(XToolkit.IgnoreBadWindowHandler);
+++        XToolkit.WITH_XERROR_HANDLER(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++         XlibWrapper.XSelectInput(XToolkit.getDisplay(), source_win,
++                                  source_win_mask |
++                                  XlibWrapper.StructureNotifyMask);
++@@ -1020,7 +1020,7 @@
++         if (sourceWindow != 0) {
++             XToolkit.awtLock();
++             try {
++-                XToolkit.WITH_XERROR_HANDLER(XToolkit.IgnoreBadWindowHandler);
+++                XToolkit.WITH_XERROR_HANDLER(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++                 XlibWrapper.XSelectInput(XToolkit.getDisplay(), sourceWindow,
++                                          sourceWindowMask);
++                 XToolkit.RESTORE_XERROR_HANDLER();
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/WindowPropertyGetter.java openjdk/jdk/src/solaris/classes/sun/awt/X11/WindowPropertyGetter.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/WindowPropertyGetter.java	2010-07-15 10:28:21.900105578 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/WindowPropertyGetter.java	2010-07-15 10:28:42.637046074 -0400
++@@ -75,7 +75,7 @@
++     public int execute() {
++         return execute(null);
++     }
++-    public int execute(XToolkit.XErrorHandler errorHandler) {
+++    public int execute(XErrorHandler errorHandler) {
++ 
++         XToolkit.awtLock();
++         try {
++@@ -94,7 +94,7 @@
++ 
++             // Fix for performance problem - IgnodeBadWindowHandler is
++             // used too much without reason, just ignore it
++-            if (errorHandler == XToolkit.IgnoreBadWindowHandler) {
+++            if (errorHandler instanceof XErrorHandler.IgnoreBadWindowHandler) {
++                 errorHandler = null;
++             }
++ 
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XAWTXSettings.java openjdk/jdk/src/solaris/classes/sun/awt/X11/XAWTXSettings.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XAWTXSettings.java	2010-07-15 10:28:21.896105637 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/XAWTXSettings.java	2010-07-15 10:28:42.637981716 -0400
++@@ -122,7 +122,7 @@
++                 new WindowPropertyGetter(owner, xSettingsPropertyAtom, 0, MAX_LENGTH,
++                         false, xSettingsPropertyAtom.getAtom() );
++             try {
++-                int status = getter.execute(XToolkit.IgnoreBadWindowHandler);
+++                int status = getter.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++                 if (status != XlibWrapper.Success || getter.getData() == 0) {
++                     if (log.isLoggable(Level.FINE)) log.fine("OH OH : getter failed  status = " + status );
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XDecoratedPeer.java openjdk/jdk/src/solaris/classes/sun/awt/X11/XDecoratedPeer.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XDecoratedPeer.java	2010-07-15 10:28:21.895105718 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/XDecoratedPeer.java	2010-07-15 10:28:42.640232090 -0400
++@@ -1155,7 +1155,8 @@
++     }
++ 
++     boolean isOverrideRedirect() {
++-        return false;
+++//        return false;
+++        return ((XToolkit)Toolkit.getDefaultToolkit()).isOverrideRedirect((Window)target);
++     }
++ 
++     public boolean requestWindowFocus(long time, boolean timeProvided) {
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XDnDDragSourceProtocol.java openjdk/jdk/src/solaris/classes/sun/awt/X11/XDnDDragSourceProtocol.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XDnDDragSourceProtocol.java	2010-07-15 10:28:21.906105640 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/XDnDDragSourceProtocol.java	2010-07-15 10:28:42.642232277 -0400
++@@ -96,7 +96,7 @@
++                 action_count++;
++             }
++ 
++-            XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++            XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++             XDnDConstants.XA_XdndActionList.setAtomData(window,
++                                                         XAtom.XA_ATOM,
++                                                         data, action_count);
++@@ -117,7 +117,7 @@
++         try {
++             Native.put(data, formats);
++ 
++-            XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++            XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++             XDnDConstants.XA_XdndTypeList.setAtomData(window,
++                                                       XAtom.XA_ATOM,
++                                                       data, formats.length);
++@@ -195,7 +195,7 @@
++             new WindowPropertyGetter(window, XDnDConstants.XA_XdndAware, 0, 1,
++                                      false, XlibWrapper.AnyPropertyType);
++ 
++-        int status = wpg1.execute(XToolkit.IgnoreBadWindowHandler);
+++        int status = wpg1.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++         if (status == XlibWrapper.Success &&
++             wpg1.getData() != 0 && wpg1.getActualType() == XAtom.XA_ATOM) {
++@@ -215,7 +215,7 @@
++                                              0, 1, false, XAtom.XA_WINDOW);
++ 
++                 try {
++-                    status = wpg2.execute(XToolkit.IgnoreBadWindowHandler);
+++                    status = wpg2.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++                     if (status == XlibWrapper.Success &&
++                         wpg2.getData() != 0 &&
++@@ -233,7 +233,7 @@
++                                                  0, 1, false, XAtom.XA_WINDOW);
++ 
++                     try {
++-                        status = wpg3.execute(XToolkit.IgnoreBadWindowHandler);
+++                        status = wpg3.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++                         if (status != XlibWrapper.Success ||
++                             wpg3.getData() == 0 ||
++@@ -249,7 +249,7 @@
++                                                          XlibWrapper.AnyPropertyType);
++ 
++                             try {
++-                                status = wpg4.execute(XToolkit.IgnoreBadWindowHandler);
+++                                status = wpg4.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++                                 if (status != XlibWrapper.Success ||
++                                     wpg4.getData() == 0 ||
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XDnDDropTargetProtocol.java openjdk/jdk/src/solaris/classes/sun/awt/X11/XDnDDropTargetProtocol.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XDnDDropTargetProtocol.java	2010-07-15 10:28:21.903105589 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/XDnDDropTargetProtocol.java	2010-07-15 10:28:42.645236553 -0400
++@@ -88,7 +88,7 @@
++         try {
++             Native.putLong(data, 0, XDnDConstants.XDND_PROTOCOL_VERSION);
++ 
++-            XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++            XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++             XDnDConstants.XA_XdndAware.setAtomData(window, XAtom.XA_ATOM, data, 1);
++             XToolkit.RESTORE_XERROR_HANDLER();
++ 
++@@ -122,7 +122,7 @@
++                                      false, XlibWrapper.AnyPropertyType);
++ 
++         try {
++-            status = wpg1.execute(XToolkit.IgnoreBadWindowHandler);
+++            status = wpg1.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++             if (status == XlibWrapper.Success &&
++                 wpg1.getData() != 0 && wpg1.getActualType() == XAtom.XA_ATOM) {
++@@ -141,7 +141,7 @@
++                                          0, 1, false, XAtom.XA_WINDOW);
++ 
++             try {
++-                status = wpg2.execute(XToolkit.IgnoreBadWindowHandler);
+++                status = wpg2.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++                 if (status == XlibWrapper.Success &&
++                     wpg2.getData() != 0 &&
++@@ -159,7 +159,7 @@
++                                              0, 1, false, XAtom.XA_WINDOW);
++ 
++                 try {
++-                    status = wpg3.execute(XToolkit.IgnoreBadWindowHandler);
+++                    status = wpg3.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++                     if (status != XlibWrapper.Success ||
++                         wpg3.getData() == 0 ||
++@@ -175,7 +175,7 @@
++                                                      XlibWrapper.AnyPropertyType);
++ 
++                         try {
++-                            status = wpg4.execute(XToolkit.IgnoreBadWindowHandler);
+++                            status = wpg4.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++                             if (status != XlibWrapper.Success ||
++                                 wpg4.getData() == 0 ||
++@@ -205,7 +205,7 @@
++ 
++             /* The proxy window must have the XdndAware set, as XDnD protocol
++                prescribes to check the proxy window for XdndAware. */
++-            XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++            XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++             XDnDConstants.XA_XdndAware.setAtomData(newProxy, XAtom.XA_ATOM,
++                                                    data, 1);
++             XToolkit.RESTORE_XERROR_HANDLER();
++@@ -219,7 +219,7 @@
++             Native.putLong(data, 0, newProxy);
++ 
++             /* The proxy window must have the XdndProxy set to point to itself.*/
++-            XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++            XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++             XDnDConstants.XA_XdndProxy.setAtomData(newProxy, XAtom.XA_WINDOW,
++                                                    data, 1);
++             XToolkit.RESTORE_XERROR_HANDLER();
++@@ -232,7 +232,7 @@
++ 
++             Native.putLong(data, 0, XDnDConstants.XDND_PROTOCOL_VERSION);
++ 
++-            XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++            XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++             XDnDConstants.XA_XdndAware.setAtomData(embedder, XAtom.XA_ATOM,
++                                                    data, 1);
++             XToolkit.RESTORE_XERROR_HANDLER();
++@@ -245,7 +245,7 @@
++ 
++             Native.putLong(data, 0, newProxy);
++ 
++-            XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++            XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++             XDnDConstants.XA_XdndProxy.setAtomData(embedder, XAtom.XA_WINDOW,
++                                                    data, 1);
++             XToolkit.RESTORE_XERROR_HANDLER();
++@@ -278,7 +278,7 @@
++             try {
++                 Native.putLong(data, 0, entry.getVersion());
++ 
++-                XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++                XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++                 XDnDConstants.XA_XdndAware.setAtomData(embedder, XAtom.XA_ATOM,
++                                                        data, 1);
++                 XToolkit.RESTORE_XERROR_HANDLER();
++@@ -291,7 +291,7 @@
++ 
++                 Native.putLong(data, 0, (int)entry.getProxy());
++ 
++-                XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++                XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++                 XDnDConstants.XA_XdndProxy.setAtomData(embedder, XAtom.XA_WINDOW,
++                                                        data, 1);
++                 XToolkit.RESTORE_XERROR_HANDLER();
++@@ -329,7 +329,7 @@
++                                      false, XlibWrapper.AnyPropertyType);
++ 
++         try {
++-            status = wpg1.execute(XToolkit.IgnoreBadWindowHandler);
+++            status = wpg1.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++             if (status == XlibWrapper.Success &&
++                 wpg1.getData() != 0 && wpg1.getActualType() == XAtom.XA_ATOM) {
++@@ -348,7 +348,7 @@
++                                          0, 1, false, XAtom.XA_WINDOW);
++ 
++             try {
++-                status = wpg2.execute(XToolkit.IgnoreBadWindowHandler);
+++                status = wpg2.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++                 if (status == XlibWrapper.Success &&
++                     wpg2.getData() != 0 &&
++@@ -366,7 +366,7 @@
++                                              0, 1, false, XAtom.XA_WINDOW);
++ 
++                 try {
++-                    status = wpg3.execute(XToolkit.IgnoreBadWindowHandler);
+++                    status = wpg3.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++                     if (status != XlibWrapper.Success ||
++                         wpg3.getData() == 0 ||
++@@ -382,7 +382,7 @@
++                                                      XlibWrapper.AnyPropertyType);
++ 
++                         try {
++-                            status = wpg4.execute(XToolkit.IgnoreBadWindowHandler);
+++                            status = wpg4.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++                             if (status != XlibWrapper.Success ||
++                                 wpg4.getData() == 0 ||
++@@ -411,7 +411,7 @@
++                                      false, XlibWrapper.AnyPropertyType);
++ 
++         try {
++-            int status = wpg1.execute(XToolkit.IgnoreBadWindowHandler);
+++            int status = wpg1.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++             if (status == XlibWrapper.Success &&
++                 wpg1.getData() != 0 && wpg1.getActualType() == XAtom.XA_ATOM) {
++@@ -473,7 +473,7 @@
++                                          0, 0xFFFF, false,
++                                          XAtom.XA_ATOM);
++             try {
++-                wpg.execute(XToolkit.IgnoreBadWindowHandler);
+++                wpg.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++                 if (wpg.getActualType() == XAtom.XA_ATOM &&
++                     wpg.getActualFormat() == 32) {
++@@ -505,7 +505,7 @@
++                                          0, 0xFFFF, false,
++                                          XAtom.XA_ATOM);
++             try {
++-                wpg.execute(XToolkit.IgnoreBadWindowHandler);
+++                wpg.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++                 if (wpg.getActualType() == XAtom.XA_ATOM &&
++                     wpg.getActualFormat() == 32) {
++@@ -541,7 +541,7 @@
++          */
++         XWindowAttributes wattr = new XWindowAttributes();
++         try {
++-            XToolkit.WITH_XERROR_HANDLER(XToolkit.IgnoreBadWindowHandler);
+++            XToolkit.WITH_XERROR_HANDLER(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++             int status = XlibWrapper.XGetWindowAttributes(XToolkit.getDisplay(),
++                                                           source_win, wattr.pData);
++ 
++@@ -558,7 +558,7 @@
++             wattr.dispose();
++         }
++ 
++-        XToolkit.WITH_XERROR_HANDLER(XToolkit.IgnoreBadWindowHandler);
+++        XToolkit.WITH_XERROR_HANDLER(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++         XlibWrapper.XSelectInput(XToolkit.getDisplay(), source_win,
++                                  source_win_mask |
++                                  XlibWrapper.StructureNotifyMask);
++@@ -963,7 +963,7 @@
++         if (sourceWindow != 0) {
++             XToolkit.awtLock();
++             try {
++-                XToolkit.WITH_XERROR_HANDLER(XToolkit.IgnoreBadWindowHandler);
+++                XToolkit.WITH_XERROR_HANDLER(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++                 XlibWrapper.XSelectInput(XToolkit.getDisplay(), sourceWindow,
++                                          sourceWindowMask);
++                 XToolkit.RESTORE_XERROR_HANDLER();
++@@ -1104,14 +1104,14 @@
++                                                  0, 0xFFFF, false,
++                                                  XAtom.XA_ATOM);
++                     try {
++-                        wpg.execute(XToolkit.IgnoreBadWindowHandler);
+++                        wpg.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++                         if (wpg.getActualType() == XAtom.XA_ATOM &&
++                             wpg.getActualFormat() == 32) {
++ 
++                             XToolkit.awtLock();
++                             try {
++-                                XToolkit.WITH_XERROR_HANDLER(XWM.VerifyChangePropertyHandler);
+++                                XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++                                 XDnDConstants.XA_XdndTypeList.setAtomData(xclient.get_window(),
++                                                                           XAtom.XA_ATOM,
++                                                                           wpg.getData(),
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XDragSourceProtocol.java openjdk/jdk/src/solaris/classes/sun/awt/X11/XDragSourceProtocol.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XDragSourceProtocol.java	2010-07-15 10:28:21.896105637 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/XDragSourceProtocol.java	2010-07-15 10:28:42.646232066 -0400
++@@ -181,7 +181,7 @@
++                                    long time) {
++         XWindowAttributes wattr = new XWindowAttributes();
++         try {
++-            XToolkit.WITH_XERROR_HANDLER(XToolkit.IgnoreBadWindowHandler);
+++            XToolkit.WITH_XERROR_HANDLER(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++             int status = XlibWrapper.XGetWindowAttributes(XToolkit.getDisplay(),
++                                                           targetWindow, wattr.pData);
++ 
++@@ -198,7 +198,7 @@
++             wattr.dispose();
++         }
++ 
++-        XToolkit.WITH_XERROR_HANDLER(XToolkit.IgnoreBadWindowHandler);
+++        XToolkit.WITH_XERROR_HANDLER(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++         XlibWrapper.XSelectInput(XToolkit.getDisplay(), targetWindow,
++                                  targetWindowMask |
++                                  XlibWrapper.StructureNotifyMask);
++@@ -214,7 +214,7 @@
++     }
++ 
++     protected final void finalizeDrop() {
++-        XToolkit.WITH_XERROR_HANDLER(XToolkit.IgnoreBadWindowHandler);
+++        XToolkit.WITH_XERROR_HANDLER(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++         XlibWrapper.XSelectInput(XToolkit.getDisplay(), targetWindow,
++                                  targetWindowMask);
++         XToolkit.RESTORE_XERROR_HANDLER();
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XDropTargetRegistry.java openjdk/jdk/src/solaris/classes/sun/awt/X11/XDropTargetRegistry.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XDropTargetRegistry.java	2010-07-15 10:28:21.906105640 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/XDropTargetRegistry.java	2010-07-15 10:28:42.648232198 -0400
++@@ -172,7 +172,7 @@
++                 if (dest_x >= 0 && dest_y >= 0) {
++                     XWindowAttributes wattr = new XWindowAttributes();
++                     try {
++-                        XToolkit.WITH_XERROR_HANDLER(XToolkit.IgnoreBadWindowHandler);
+++                        XToolkit.WITH_XERROR_HANDLER(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++                         int status = XlibWrapper.XGetWindowAttributes(XToolkit.getDisplay(),
++                                                                       window, wattr.pData);
++                         XToolkit.RESTORE_XERROR_HANDLER();
++@@ -226,7 +226,7 @@
++             long event_mask = 0;
++             XWindowAttributes wattr = new XWindowAttributes();
++             try {
++-                XToolkit.WITH_XERROR_HANDLER(XToolkit.IgnoreBadWindowHandler);
+++                XToolkit.WITH_XERROR_HANDLER(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++                 int status = XlibWrapper.XGetWindowAttributes(XToolkit.getDisplay(),
++                                                               embedder, wattr.pData);
++                 XToolkit.RESTORE_XERROR_HANDLER();
++@@ -244,7 +244,7 @@
++             }
++ 
++             if ((event_mask & XlibWrapper.PropertyChangeMask) == 0) {
++-                XToolkit.WITH_XERROR_HANDLER(XToolkit.IgnoreBadWindowHandler);
+++                XToolkit.WITH_XERROR_HANDLER(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++                 XlibWrapper.XSelectInput(XToolkit.getDisplay(), embedder,
++                                          event_mask | XlibWrapper.PropertyChangeMask);
++                 XToolkit.RESTORE_XERROR_HANDLER();
++@@ -398,7 +398,7 @@
++ 
++             /* Restore the original event mask for the embedder. */
++             if ((event_mask & XlibWrapper.PropertyChangeMask) == 0) {
++-                XToolkit.WITH_XERROR_HANDLER(XToolkit.IgnoreBadWindowHandler);
+++                XToolkit.WITH_XERROR_HANDLER(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++                 XlibWrapper.XSelectInput(XToolkit.getDisplay(), embedder,
++                                          event_mask);
++                 XToolkit.RESTORE_XERROR_HANDLER();
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XEmbedCanvasPeer.java openjdk/jdk/src/solaris/classes/sun/awt/X11/XEmbedCanvasPeer.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XEmbedCanvasPeer.java	2010-07-15 10:28:21.897105547 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/XEmbedCanvasPeer.java	2010-07-15 10:28:42.650232331 -0400
++@@ -301,7 +301,7 @@
++         try {
++             XWindowAttributes wattr = new XWindowAttributes();
++             try {
++-                XToolkit.WITH_XERROR_HANDLER(XToolkit.IgnoreBadWindowHandler);
+++                XToolkit.WITH_XERROR_HANDLER(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++                 int status = XlibWrapper.XGetWindowAttributes(XToolkit.getDisplay(),
++                                                               xembed.handle, wattr.pData);
++ 
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XErrorHandler.java openjdk/jdk/src/solaris/classes/sun/awt/X11/XErrorHandler.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XErrorHandler.java	1969-12-31 19:00:00.000000000 -0500
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/XErrorHandler.java	2010-07-15 10:28:42.651989313 -0400
++@@ -0,0 +1,79 @@
+++/*
+++ * Copyright 2009 Sun Microsystems, Inc.  All Rights Reserved.
+++ * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
+++ *
+++ * This code is free software; you can redistribute it and/or modify it
+++ * under the terms of the GNU General Public License version 2 only, as
+++ * published by the Free Software Foundation.  Sun designates this
+++ * particular file as subject to the "Classpath" exception as provided
+++ * by Sun in the LICENSE file that accompanied this code.
+++ *
+++ * This code is distributed in the hope that it will be useful, but WITHOUT
+++ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+++ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+++ * version 2 for more details (a copy is included in the LICENSE file that
+++ * accompanied this code).
+++ *
+++ * You should have received a copy of the GNU General Public License version
+++ * 2 along with this work; if not, write to the Free Software Foundation,
+++ * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
+++ *
+++ * Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
+++ * CA 95054 USA or visit www.sun.com if you need additional information or
+++ * have any questions.
+++ */
+++package sun.awt.X11;
+++
+++public abstract class XErrorHandler {
+++
+++    /*
+++     * Called under AWT lock
+++     */
+++    public abstract int handleError(long display, XErrorEvent err);
+++
+++    /*
+++     * Forwards all the errors to saved error handler (which was
+++     * set before XToolkit had been initialized).
+++     */
+++    public static class XBaseErrorHandler extends XErrorHandler {
+++        @Override
+++        public int handleError(long display, XErrorEvent err) {
+++            return XToolkit.SAVED_ERROR_HANDLER(display, err);
+++        }
+++    }
+++
+++    /*
+++     * Instead of validating window id, we simply call XGetWindowProperty,
+++     * but temporary install this function as the error handler to ignore
+++     * BadWindow error.
+++     */
+++    public static class IgnoreBadWindowHandler extends XBaseErrorHandler {
+++        @Override
+++        public int handleError(long display, XErrorEvent err) {
+++            if (err.get_error_code() == XConstants.BadWindow) {
+++                return 0;
+++            }
+++            return super.handleError(display, err);
+++        }
+++        // Shared instance
+++        private static IgnoreBadWindowHandler theInstance = new IgnoreBadWindowHandler();
+++        public static IgnoreBadWindowHandler getInstance() {
+++            return theInstance;
+++        }
+++    }
+++
+++    public static class VerifyChangePropertyHandler extends XBaseErrorHandler {
+++        @Override
+++        public int handleError(long display, XErrorEvent err) {
+++            if (err.get_request_code() == XProtocolConstants.X_ChangeProperty) {
+++                return 0;
+++            }
+++            return super.handleError(display, err);
+++        }
+++        // Shared instance
+++        private static IgnoreBadWindowHandler theInstance = new IgnoreBadWindowHandler();
+++        public static IgnoreBadWindowHandler getInstance() {
+++            return theInstance;
+++        }
+++    }
+++}
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XlibUtil.java openjdk/jdk/src/solaris/classes/sun/awt/X11/XlibUtil.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XlibUtil.java	2010-07-15 10:28:21.893105473 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/XlibUtil.java	2010-07-15 10:28:42.651989313 -0400
++@@ -149,7 +149,7 @@
++                 new XTranslateCoordinates(src, dst, p.x, p.y);
++             try
++             {
++-                int status = xtc.execute(XToolkit.IgnoreBadWindowHandler);
+++                int status = xtc.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++                 if ((status != 0) &&
++                     ((XToolkit.saved_error == null) ||
++                      (XToolkit.saved_error.get_error_code() == XlibWrapper.Success)))
++@@ -306,7 +306,7 @@
++                                          XWM.XA_WM_STATE);
++             try
++             {
++-                wpg.execute(XToolkit.IgnoreBadWindowHandler);
+++                wpg.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++                 if (wpg.getActualType() == XWM.XA_WM_STATE.getAtom())
++                 {
++                     return true;
++@@ -345,7 +345,7 @@
++         XWindowAttributes wattr = new XWindowAttributes();
++         try
++         {
++-            XToolkit.WITH_XERROR_HANDLER(XToolkit.IgnoreBadWindowHandler);
+++            XToolkit.WITH_XERROR_HANDLER(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++             int status = XlibWrapper.XGetWindowAttributes(XToolkit.getDisplay(),
++                                                           window, wattr.pData);
++             XToolkit.RESTORE_XERROR_HANDLER();
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XlibWrapper.java openjdk/jdk/src/solaris/classes/sun/awt/X11/XlibWrapper.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XlibWrapper.java	2010-07-15 10:28:21.905105617 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/XlibWrapper.java	2010-07-15 10:28:42.654187919 -0400
++@@ -613,4 +613,6 @@
++         String javaVersion = XToolkit.getSystemProperty("java.version");
++         return javaVersion != null && javaVersion.contains("internal");
++     }
+++
+++    static native void PrintXErrorEvent(long display, long event_ptr);
++ }
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XProtocol.java openjdk/jdk/src/solaris/classes/sun/awt/X11/XProtocol.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XProtocol.java	2010-07-15 10:28:21.893105473 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/XProtocol.java	2010-07-15 10:28:42.655357930 -0400
++@@ -35,20 +35,6 @@
++     private Map<XAtom, XAtomList> atomToList = new HashMap<XAtom, XAtomList>();
++     private Map<XAtom, Long> atomToAnchor = new HashMap<XAtom, Long>();
++ 
++-    /*
++-     * Temporary error handler that ensures that we know if
++-     * XChangeProperty succeeded or not.
++-     */
++-    static XToolkit.XErrorHandler VerifyChangePropertyHandler = new XToolkit.XErrorHandler() {
++-            public int handleError(long display, XErrorEvent err) {
++-                XToolkit.XERROR_SAVE(err);
++-                if (err.get_request_code() == XlibWrapper.X_ChangeProperty) {
++-                    return 0;
++-                } else {
++-                    return XToolkit.SAVED_ERROR_HANDLER(display, err);
++-                }
++-            }
++-        };
++     volatile boolean firstCheck = true;
++     /*
++      * Check that that the list of protocols specified by WM in property
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XQueryTree.java openjdk/jdk/src/solaris/classes/sun/awt/X11/XQueryTree.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XQueryTree.java	2010-07-15 10:28:21.894105746 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/XQueryTree.java	2010-07-15 10:28:42.662356819 -0400
++@@ -51,7 +51,7 @@
++         public int execute() {
++                 return execute(null);
++         }
++-        public int execute(XToolkit.XErrorHandler errorHandler) {
+++        public int execute(XErrorHandler errorHandler) {
++                 XToolkit.awtLock();
++                 try {
++                     if (isDisposed()) {
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XToolkit.java openjdk/jdk/src/solaris/classes/sun/awt/X11/XToolkit.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XToolkit.java	2010-07-15 10:28:21.896105637 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/XToolkit.java	2010-07-15 10:30:45.039232001 -0400
++@@ -48,6 +48,7 @@
++ import sun.font.FontManager;
++ import sun.misc.PerformanceLogger;
++ import sun.print.PrintJob2D;
+++import sun.security.action.GetBooleanAction;
++ import java.lang.reflect.*;
++ 
++ public class XToolkit extends UNIXToolkit implements Runnable, XConstants {
++@@ -120,62 +121,78 @@
++             setBackingStoreType();
++         }
++         m_removeSourceEvents = SunToolkit.getMethod(EventQueue.class, "removeSourceEvents", new Class[] {Object.class, Boolean.TYPE}) ;
+++        noisyAwtHandler = AccessController.doPrivileged(new GetBooleanAction("sun.awt.noisyerrorhandler"));
+++
++     }
++ 
++-    // Error handler stuff
++-    static XErrorEvent saved_error;
++-    static long saved_error_handler;
++-    static XErrorHandler curErrorHandler;
++-    // Should be called under LOCK, before releasing LOCK RESTORE_XERROR_HANDLER should be called
++-    static void WITH_XERROR_HANDLER(XErrorHandler handler) {
+++    //---- ERROR HANDLER CODE ----//
+++
+++    /*
+++     * Error handler at the moment of XToolkit initialization
+++     */
+++    private static long saved_error_handler;
+++
+++    /*
+++     * XErrorEvent being handled
+++     */
+++    static volatile XErrorEvent saved_error;
+++
+++    /*
+++     * Current error handler or null if no error handler is set
+++     */
+++    private static XErrorHandler current_error_handler;
+++
+++    /*
+++     * Value of sun.awt.noisyerrorhandler system property
+++     */
+++    private static boolean noisyAwtHandler;
+++
+++    public static void WITH_XERROR_HANDLER(XErrorHandler handler) {
++         saved_error = null;
++-        curErrorHandler = handler;
++-        XSync();
++-        saved_error_handler = XlibWrapper.SetToolkitErrorHandler();
++-    }
++-    static void XERROR_SAVE(XErrorEvent event) {
++-        saved_error = event;
+++        current_error_handler = handler;
++     }
++-    // Should be called under LOCK
++-    static void RESTORE_XERROR_HANDLER() {
++-       XSync();
++-        XlibWrapper.XSetErrorHandler(saved_error_handler);
++-        curErrorHandler = null;
+++
+++    public static void RESTORE_XERROR_HANDLER() {
+++        current_error_handler = null;
++     }
+++
++     // Should be called under LOCK
++-    static int SAVED_ERROR_HANDLER(long display, XErrorEvent error) {
++-        return XlibWrapper.CallErrorHandler(saved_error_handler, display, error.pData);
++-    }
++-    interface XErrorHandler {
++-        int handleError(long display, XErrorEvent err);
+++    public static int SAVED_ERROR_HANDLER(long display, XErrorEvent error) {
+++        if (saved_error_handler != 0) {
+++            // Default XErrorHandler may just terminate the process. Don't call it.
+++            // return XlibWrapper.CallErrorHandler(saved_error_handler, display, error.pData);
+++        }
+++        if (log.isLoggable(Level.FINE)) {
+++            log.log(Level.FINE, "Unhandled XErrorEvent: " +
+++                    "id=" + error.get_resourceid() + ", " +
+++                    "serial=" + error.get_serial() + ", " +
+++                    "ec=" + error.get_error_code() + ", " +
+++                    "rc=" + error.get_request_code() + ", " +
+++                    "mc=" + error.get_minor_code());
+++        }
+++        return 0;
++     }
++-    static int GlobalErrorHandler(long display, long event_ptr) {
+++
+++    // Called from the native code when an error occurs
+++    private static int globalErrorHandler(long display, long event_ptr) {
+++        if (noisyAwtHandler) {
+++            XlibWrapper.PrintXErrorEvent(display, event_ptr);
+++        }
++         XErrorEvent event = new XErrorEvent(event_ptr);
+++        saved_error = event;
++         try {
++-            if (curErrorHandler != null) {
++-                return curErrorHandler.handleError(display, event);
+++            if (current_error_handler != null) {
+++                return current_error_handler.handleError(display, event);
++             } else {
++                 return SAVED_ERROR_HANDLER(display, event);
++             }
++-        } finally {
+++        } catch (Throwable z) {
+++            log.log(Level.FINE, "Error in GlobalErrorHandler", z);
++         }
+++        return 0;
++     }
++ 
++-/*
++- * Instead of validating window id, we simply call XGetWindowProperty,
++- * but temporary install this function as the error handler to ignore
++- * BadWindow error.
++- */
++-    static XErrorHandler IgnoreBadWindowHandler = new XErrorHandler() {
++-            public int handleError(long display, XErrorEvent err) {
++-                XERROR_SAVE(err);
++-                if (err.get_error_code() == BadWindow) {
++-                    return 0;
++-                } else {
++-                    return SAVED_ERROR_HANDLER(display, err);
++-                }
++-            }
++-        };
+++    //---- END OF ERROR HANDLER CODE ----//
++ 
++ 
++     private native static void initIDs();
++@@ -269,17 +286,27 @@
++ 
++             arrowCursor = XlibWrapper.XCreateFontCursor(XToolkit.getDisplay(),
++                 XCursorFontConstants.XC_arrow);
+++
+++            saved_error_handler = XlibWrapper.SetToolkitErrorHandler();
+++
++         } finally {
++             awtUnlock();
++         }
++ 
++-        if (log.isLoggable(Level.FINE)) {
++-            Runtime.getRuntime().addShutdownHook(new Thread() {
++-                    public void run() {
+++        Runtime.getRuntime().addShutdownHook(new Thread() {
+++            public void run() {
+++                if (log.isLoggable(Level.FINE)) {
++                         dumpPeers();
++-                    }
++-                });
++-        }
+++                }
+++
+++                awtLock();
+++                try {
+++                        XlibWrapper.XSetErrorHandler(saved_error_handler);
+++                } finally {
+++                        awtUnlock();
+++                }
+++            }
+++        });
++     }
++ 
++     static String getCorrectXIDString(String val) {
++@@ -2162,5 +2189,4 @@
++         return new XDesktopPeer();
++     }
++ 
++-    public static native void setNoisyXErrorHandler();
++ }
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XTranslateCoordinates.java openjdk/jdk/src/solaris/classes/sun/awt/X11/XTranslateCoordinates.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XTranslateCoordinates.java	2010-07-15 10:28:21.900105578 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/XTranslateCoordinates.java	2010-07-15 10:28:42.666356882 -0400
++@@ -57,7 +57,7 @@
++         public int execute() {
++                 return execute(null);
++         }
++-        public int execute(XToolkit.XErrorHandler errorHandler) {
+++        public int execute(XErrorHandler errorHandler) {
++                 XToolkit.awtLock();
++                 try {
++                 if (isDisposed()) {
++diff -uNr openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XWM.java openjdk/jdk/src/solaris/classes/sun/awt/X11/XWM.java
++--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11/XWM.java	2010-07-15 10:28:21.896105637 -0400
+++++ openjdk/jdk/src/solaris/classes/sun/awt/X11/XWM.java	2010-07-15 10:28:42.668356704 -0400
++@@ -273,7 +273,7 @@
++             winmgr_running = false;
++             substruct.set_event_mask(XlibWrapper.SubstructureRedirectMask);
++ 
++-            XToolkit.WITH_XERROR_HANDLER(DetectWMHandler);
+++            XToolkit.WITH_XERROR_HANDLER(detectWMHandler);
++             XlibWrapper.XChangeWindowAttributes(XToolkit.getDisplay(),
++                                                 XToolkit.getDefaultRootWindow(),
++                                                 XlibWrapper.CWEventMask,
++@@ -318,7 +318,7 @@
++             new WindowPropertyGetter(window, XA_ENLIGHTENMENT_COMMS, 0, 14, false,
++                                      XAtom.XA_STRING);
++         try {
++-            int status = getter.execute(XToolkit.IgnoreBadWindowHandler);
+++            int status = getter.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++             if (status != XlibWrapper.Success || getter.getData() == 0) {
++                 return 0;
++             }
++@@ -442,7 +442,7 @@
++                 new WindowPropertyGetter(wmwin, XA_DT_SM_STATE_INFO, 0, 1,
++                                          false, XA_DT_SM_STATE_INFO);
++             try {
++-                status = getter2.execute(XToolkit.IgnoreBadWindowHandler);
+++                status = getter2.execute(XErrorHandler.IgnoreBadWindowHandler.getInstance());
++ 
++ 
++                 if (status != XlibWrapper.Success || getter2.getData() == 0) {
++@@ -574,21 +574,6 @@
++     }
++ 
++     /*
++-     * Temporary error handler that ensures that we know if
++-     * XChangeProperty succeeded or not.
++-     */
++-    static XToolkit.XErrorHandler VerifyChangePropertyHandler = new XToolkit.XErrorHandler() {
++-            public int handleError(long display, XErrorEvent err) {
++-                XToolkit.XERROR_SAVE(err);
++-                if (err.get_request_code() == XlibWrapper.X_ChangeProperty) {
++-                    return 0;
++-                } else {
++-                    return XToolkit.SAVED_ERROR_HANDLER(display, err);
++-                }
++-            }
++-        };
++-
++-    /*
++      * Prepare IceWM check.
++      *
++      * The only way to detect IceWM, seems to be by setting
++@@ -623,7 +608,7 @@
++ 
++         XToolkit.awtLock();
++         try {
++-            XToolkit.WITH_XERROR_HANDLER(VerifyChangePropertyHandler);
+++            XToolkit.WITH_XERROR_HANDLER(XErrorHandler.VerifyChangePropertyHandler.getInstance());
++             XlibWrapper.XChangePropertyS(XToolkit.getDisplay(), XToolkit.getDefaultRootWindow(),
++                                          XA_ICEWM_WINOPTHINT.getAtom(),
++                                          XA_ICEWM_WINOPTHINT.getAtom(),
++@@ -691,20 +676,19 @@
++      * Temporary error handler that checks if selecting for
++      * SubstructureRedirect failed.
++      */
++-    static boolean winmgr_running = false;
++-    static XToolkit.XErrorHandler DetectWMHandler = new XToolkit.XErrorHandler() {
++-            public int handleError(long display, XErrorEvent err) {
++-                XToolkit.XERROR_SAVE(err);
++-                if (err.get_request_code() == XlibWrapper.X_ChangeWindowAttributes
++-                    && err.get_error_code() == XlibWrapper.BadAccess)
++-                {
++-                    winmgr_running = true;
++-                    return 0;
++-                } else {
++-                    return XToolkit.SAVED_ERROR_HANDLER(display, err);
++-                }
+++    private static boolean winmgr_running = false;
+++    private static XErrorHandler detectWMHandler = new XErrorHandler.XBaseErrorHandler() {
+++        @Override
+++        public int handleError(long display, XErrorEvent err) {
+++            if ((err.get_request_code() == XProtocolConstants.X_ChangeWindowAttributes) &&
+++                (err.get_error_code() == XConstants.BadAccess))
+++            {
+++                winmgr_running = true;
+++                return 0;
++             }
++-        };
+++            return super.handleError(display, err);
+++        }
+++    };
++ 
++     /*
++      * Make an educated guess about running window manager.
++diff -uNr openjdk.orig/jdk/src/solaris/native/sun/awt/awt_GraphicsEnv.c openjdk/jdk/src/solaris/native/sun/awt/awt_GraphicsEnv.c
++--- openjdk.orig/jdk/src/solaris/native/sun/awt/awt_GraphicsEnv.c	2010-07-15 10:28:21.866105645 -0400
+++++ openjdk/jdk/src/solaris/native/sun/awt/awt_GraphicsEnv.c	2010-07-15 10:28:42.670355820 -0400
++@@ -175,42 +175,11 @@
++ }
++ 
++ #ifndef HEADLESS
+++
++ /*
++- * error handlers
+++ * XIOErrorHandler
++  */
++-
++-int
++-xerror_handler(Display * disp, XErrorEvent * err)
++-{
++-/* #ifdef DEBUG */
++-    char msg[128];
++-    char buf[128];
++-    char *ev = getenv("NOISY_AWT");
++-
++-    if (!ev || !ev[0])
++-        return 0;
++-    XGetErrorText(disp, err->error_code, msg, sizeof(msg));
++-    jio_fprintf(stderr, "Xerror %s, XID %x, ser# %d\n", msg, err->resourceid, err->serial);
++-    jio_snprintf(buf, sizeof(buf), "%d", err->request_code);
++-    XGetErrorDatabaseText(disp, "XRequest", buf, "Unknown", msg, sizeof(msg));
++-    jio_fprintf(stderr, "Major opcode %d (%s)\n", err->request_code, msg);
++-    if (err->request_code > 128) {
++-        jio_fprintf(stderr, "Minor opcode %d\n", err->minor_code);
++-    }
++-    if (awtLockInited) {
++-        /*SignalError(lockedee->lastpc, lockedee, "fp/ade/gui/GUIException", msg); */
++-    }
++-    if (strcasecmp(ev, "abort") == 0) {
++-        JNIEnv *env = (JNIEnv *)JNU_GetEnv(jvm, JNI_VERSION_1_2);
++-
++-        (*env)->FatalError(env, "xerror_handler abort");
++-    }
++-/* #endif */
++-    return 0;
++-}
++-
++-static int
++-xioerror_handler(Display * disp)
+++static int xioerror_handler(Display *disp)
++ {
++     if (awtLockInited) {
++         if (errno == EPIPE) {
++@@ -806,7 +775,6 @@
++         return NULL;
++     }
++ 
++-    XSetErrorHandler(xerror_handler);
++     XSetIOErrorHandler(xioerror_handler);
++ 
++     /* set awt_numScreens, and whether or not we're using Xinerama */
++diff -uNr openjdk.orig/jdk/src/solaris/native/sun/awt/awt_InputMethod.c openjdk/jdk/src/solaris/native/sun/awt/awt_InputMethod.c
++--- openjdk.orig/jdk/src/solaris/native/sun/awt/awt_InputMethod.c	2010-07-15 10:28:21.865105640 -0400
+++++ openjdk/jdk/src/solaris/native/sun/awt/awt_InputMethod.c	2010-07-15 10:28:42.671355975 -0400
++@@ -1458,7 +1458,6 @@
++ }
++ 
++ static void OpenXIMCallback(Display *display, XPointer client_data, XPointer call_data) {
++-    extern int xerror_handler();
++     XIMCallback ximCallback;
++ 
++     X11im = XOpenIM(display, NULL, NULL, NULL);
++@@ -1469,13 +1468,6 @@
++     ximCallback.callback = (XIMProc)DestroyXIMCallback;
++     ximCallback.client_data = NULL;
++     XSetIMValues(X11im, XNDestroyCallback, &ximCallback, NULL);
++-
++-    /* Workaround for Solaris 2.6 bug 4097754. We're affected by this problem
++-     * because Motif also calls XOpenIM for us. Re-registering the error handler
++-     * that MToolkit has registered already after calling XOpenIM avoids the
++-     * problem.
++-     */
++-    XSetErrorHandler(xerror_handler);
++ }
++ 
++ static void DestroyXIMCallback(XIM im, XPointer client_data, XPointer call_data) {
++diff -uNr openjdk.orig/jdk/src/solaris/native/sun/awt/awt_MToolkit.c openjdk/jdk/src/solaris/native/sun/awt/awt_MToolkit.c
++--- openjdk.orig/jdk/src/solaris/native/sun/awt/awt_MToolkit.c	2010-07-15 10:28:21.867105700 -0400
+++++ openjdk/jdk/src/solaris/native/sun/awt/awt_MToolkit.c	2010-07-15 10:28:42.673355929 -0400
++@@ -1926,26 +1926,6 @@
++               XtAppProcessEvent(awt_appContext, iMask & ~XtIMXEvent);
++             }
++ 
++-            /*
++-            ** Bug #4361799: Forte4J sometimes crashes on Solaris:
++-            ** There is an underlying bug in Selection.c in Xt lib.
++-            ** The routine HandleSelectionEvents, can call EndProtectedSection()
++-            ** more than  StartProtectedSection(), and then EndProtectedSection
++-            ** will restore the default XError handler.  As a result awt's
++-            ** XError handler gets removed and we later crash on an XError.
++-            **
++-            ** This happens when we call XtAppProcessEvent with event type 1e
++-            ** (SelectionRequest) when running two copies of Forte
++-            **
++-            ** XSetErrorHandler can safely be called repeatedly, so we are
++-            ** fixing this with the sledgehammer, and resetting our XError
++-            ** handler every time through the loop:
++-            */
++-            {
++-                extern int32_t xerror_handler();
++-                XSetErrorHandler(xerror_handler);
++-            }
++-
++ } /* processOneEvent() */
++ 
++ /*
++diff -uNr openjdk.orig/jdk/src/solaris/native/sun/xawt/XlibWrapper.c openjdk/jdk/src/solaris/native/sun/xawt/XlibWrapper.c
++--- openjdk.orig/jdk/src/solaris/native/sun/xawt/XlibWrapper.c	2010-07-15 10:28:21.882105738 -0400
+++++ openjdk/jdk/src/solaris/native/sun/xawt/XlibWrapper.c	2010-07-15 10:28:42.675169363 -0400
++@@ -1097,7 +1097,7 @@
++ static int ToolkitErrorHandler(Display * dpy, XErrorEvent * event) {
++     if (jvm != NULL) {
++         JNIEnv * env = (JNIEnv *)JNU_GetEnv(jvm, JNI_VERSION_1_2);
++-        return JNU_CallStaticMethodByName(env, NULL, "sun/awt/X11/XToolkit", "GlobalErrorHandler", "(JJ)I",
+++        return JNU_CallStaticMethodByName(env, NULL, "sun/awt/X11/XToolkit", "globalErrorHandler", "(JJ)I",
++                                           ptr_to_jlong(dpy), ptr_to_jlong(event)).i;
++     } else {
++         return 0;
++@@ -1140,6 +1140,28 @@
++     return (*(XErrorHandler)jlong_to_ptr(handler))((Display*) jlong_to_ptr(display), (XErrorEvent*) jlong_to_ptr(event_ptr));
++ }
++ 
+++/*
+++ * Class:     sun_awt_X11_XlibWrapper
+++ * Method:    PrintXErrorEvent
+++ * Signature: (JJ)V
+++ */
+++JNIEXPORT void JNICALL Java_sun_awt_X11_XlibWrapper_PrintXErrorEvent
+++(JNIEnv *env, jclass clazz, jlong display, jlong event_ptr)
+++{
+++    char msg[128];
+++    char buf[128];
+++
+++    XErrorEvent* err = (XErrorEvent *)jlong_to_ptr(event_ptr);
+++
+++    XGetErrorText((Display *)jlong_to_ptr(display), err->error_code, msg, sizeof(msg));
+++    jio_fprintf(stderr, "Xerror %s, XID %x, ser# %d\n", msg, err->resourceid, err->serial);
+++    jio_snprintf(buf, sizeof(buf), "%d", err->request_code);
+++    XGetErrorDatabaseText((Display *)jlong_to_ptr(display), "XRequest", buf, "Unknown", msg, sizeof(msg));
+++    jio_fprintf(stderr, "Major opcode %d (%s)\n", err->request_code, msg);
+++    if (err->request_code > 128) {
+++        jio_fprintf(stderr, "Minor opcode %d\n", err->minor_code);
+++    }
+++}
++ 
++ 
++ /*
++diff -uNr openjdk.orig/jdk/src/solaris/native/sun/xawt/XToolkit.c openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c
++--- openjdk.orig/jdk/src/solaris/native/sun/xawt/XToolkit.c	2010-07-15 10:28:21.883105599 -0400
+++++ openjdk/jdk/src/solaris/native/sun/xawt/XToolkit.c	2010-07-15 10:28:42.676355933 -0400
++@@ -581,7 +581,6 @@
++         pollFds[1].revents = 0;
++     }
++ 
++-
++     AWT_NOFLUSH_UNLOCK();
++ 
++     /* ACTUALLY DO THE POLL() */
++@@ -690,8 +689,6 @@
++     return ret;
++ }
++ 
++-static XErrorHandler saved_error_handler = NULL;
++-
++ #ifdef __linux__
++ void print_stack(void)
++ {
++@@ -712,38 +709,6 @@
++ }
++ #endif
++ 
++-static int NoisyXErrorHandler(Display * dpy, XErrorEvent * event) {
++-    fprintf(stderr, "id=%x, serial=%x, ec=%d, rc=%d, mc=%d\n",
++-            event->resourceid, event->serial, event->error_code,
++-            event->request_code, event->minor_code);
++-    /*
++-    #ifdef __linux__
++-        print_stack();
++-    #endif
++-    */
++-    if (jvm != NULL) {
++-      JNIEnv * env = (JNIEnv *)JNU_GetEnv(jvm, JNI_VERSION_1_2);
++-      JNU_CallStaticMethodByName(env, NULL, "java/lang/Thread", "dumpStack", "()V");
++-    }
++-    if (!saved_error_handler) {
++-        return saved_error_handler(dpy, event);
++-    }
++-    return 0;
++-}
++-
++-/*
++- * Class:     sun_awt_X11_XToolkit
++- * Method:    setNoisyXErrorHandler
++- * Signature: ()V
++- */
++-JNIEXPORT void JNICALL Java_sun_awt_X11_XToolkit_setNoisyXErrorHandler
++-(JNIEnv *env , jclass clazz)
++-{
++-    (*env)->GetJavaVM(env, &jvm);
++-    saved_error_handler = XSetErrorHandler(NoisyXErrorHandler);
++-}
++-
++-
++ Window get_xawt_root_shell(JNIEnv *env) {
++   static jclass classXRootWindow = NULL;
++   static jmethodID methodGetXRootWindow = NULL;
+diff -r d1ad52447673 patches/systemtap-gcc-4.5.patch
+--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
++++ b/patches/systemtap-gcc-4.5.patch	Tue Jul 20 16:36:52 2010 +0200
+@@ -0,0 +1,11 @@
++--- openjdk.orig/hotspot/src/share/vm/prims/jni.cpp	2010-04-28 08:51:29.000000000 +0100
+++++ openjdk/hotspot/src/share/vm/prims/jni.cpp	2010-04-28 09:29:22.000000000 +0100
++@@ -2723,7 +2723,7 @@
++ 
++   if (!directBufferSupportInitializeEnded) {
++     if (!initializeDirectBufferSupport(env, thread)) {
++-      DTRACE_PROBE1(hotspot_jni, NewDirectByteBuffer__return, NULL);
+++      DTRACE_PROBE1(hotspot_jni, NewDirectByteBuffer__return, (uintptr_t) NULL);
++       return NULL;
++     }
++   }
+diff -r d1ad52447673 plugin/icedteanp/IcedTeaJavaRequestProcessor.cc
+--- a/plugin/icedteanp/IcedTeaJavaRequestProcessor.cc	Wed Apr 14 12:21:30 2010 +0200
++++ b/plugin/icedteanp/IcedTeaJavaRequestProcessor.cc	Tue Jul 20 16:36:52 2010 +0200
+@@ -179,7 +179,7 @@
+ 
+ JavaRequestProcessor::JavaRequestProcessor()
+ {
+-    PLUGIN_DEBUG_0ARG("JavaRequestProcessor constructor\n");
++    PLUGIN_DEBUG("JavaRequestProcessor constructor\n");
+ 
+ 	// caller frees this
+ 	result = new JavaResultData();
+@@ -200,7 +200,7 @@
+ 
+ JavaRequestProcessor::~JavaRequestProcessor()
+ {
+-    PLUGIN_DEBUG_0ARG("JavaRequestProcessor::~JavaRequestProcessor\n");
++    PLUGIN_DEBUG("JavaRequestProcessor::~JavaRequestProcessor\n");
+ 
+ 	if (result)
+ 	{
+@@ -271,7 +271,7 @@
+     	result->error_msg->append("Error: Timed out when waiting for response");
+ 
+     	// Report error
+-    	PLUGIN_DEBUG_1ARG("Error: Timed out when waiting for response to %s\n", message.c_str());
++    	PLUGIN_DEBUG("Error: Timed out when waiting for response to %s\n", message.c_str());
+     }
+ 
+     java_to_plugin_bus->unSubscribe(this);
+@@ -847,12 +847,12 @@
+ 
+     if (NPVARIANT_IS_VOID(variant))
+     {
+-    	PLUGIN_DEBUG_1ARG("VOID %d\n", variant);
++    	PLUGIN_DEBUG("VOID %d\n", variant);
+     	id->append("0");
+     	return; // no need to go further
+     } else if (NPVARIANT_IS_NULL(variant))
+     {
+-    	PLUGIN_DEBUG_1ARG("NULL\n", variant);
++    	PLUGIN_DEBUG("NULL\n", variant);
+     	id->append("0");
+     	return; // no need to go further
+     } else if (NPVARIANT_IS_BOOLEAN(variant))
+@@ -894,18 +894,18 @@
+         NPObject* obj = NPVARIANT_TO_OBJECT(variant);
+         if (IcedTeaScriptableJavaPackageObject::is_valid_java_object(obj))
+         {
+-            PLUGIN_DEBUG_0ARG("NPObject is a Java object\n");
++            PLUGIN_DEBUG("NPObject is a Java object\n");
+             alreadyCreated = true;
+         } else
+         {
+-            PLUGIN_DEBUG_0ARG("NPObject is not a Java object\n");
++            PLUGIN_DEBUG("NPObject is not a Java object\n");
+             NPIdentifier length_id = browser_functions.getstringidentifier("length");
+ 
+             // FIXME: We currently only handle <= 2 dim arrays. Do we really need more though?
+ 
+             // Is it an array?
+             if (IcedTeaPluginUtilities::isObjectJSArray(instance, obj)) {
+-                PLUGIN_DEBUG_0ARG("NPObject is an array\n");
++                PLUGIN_DEBUG("NPObject is an array\n");
+ 
+                 std::string array_id = std::string();
+                 std::string java_array_type = std::string();
+diff -r d1ad52447673 plugin/icedteanp/IcedTeaNPPlugin.cc
+--- a/plugin/icedteanp/IcedTeaNPPlugin.cc	Wed Apr 14 12:21:30 2010 +0200
++++ b/plugin/icedteanp/IcedTeaNPPlugin.cc	Tue Jul 20 16:36:52 2010 +0200
+@@ -262,7 +262,7 @@
+          int16_t argc, char* argn[], char* argv[],
+          NPSavedData* saved)
+ {
+-  PLUGIN_DEBUG_0ARG("ITNP_New\n");
++  PLUGIN_DEBUG("ITNP_New\n");
+ 
+   static NPObject *window_ptr;
+   NPIdentifier identifier;
+@@ -275,7 +275,7 @@
+   }
+   browser_functions.getproperty(instance, window_ptr, identifier, &member_ptr);
+ 
+-  PLUGIN_DEBUG_1ARG("Got variant %p\n", &member_ptr);
++  PLUGIN_DEBUG("Got variant %p\n", &member_ptr);
+ 
+ 
+   NPError np_error = NPERR_NO_ERROR;
+@@ -395,12 +395,12 @@
+   documentbase = NULL;
+ 
+   // store an identifier for this plugin
+-  PLUGIN_DEBUG_2ARG("Mapping id %d and instance %p\n", instance_counter, instance);
++  PLUGIN_DEBUG("Mapping id %d and instance %p\n", instance_counter, instance);
+   g_hash_table_insert(instance_to_id_map, instance, GINT_TO_POINTER(instance_counter));
+   g_hash_table_insert(id_to_instance_map, GINT_TO_POINTER(instance_counter), instance);
+   instance_counter++;
+ 
+-  PLUGIN_DEBUG_0ARG ("ITNP_New return\n");
++  PLUGIN_DEBUG ("ITNP_New return\n");
+ 
+   return np_error;
+ }
+@@ -415,16 +415,16 @@
+   GMutex *vm_start_mutex = g_mutex_new();
+   g_mutex_lock(vm_start_mutex);
+ 
+-  PLUGIN_DEBUG_0ARG("Checking JVM status...\n");
++  PLUGIN_DEBUG("Checking JVM status...\n");
+ 
+   // If the jvm is already up, do nothing
+   if (jvm_up)
+   {
+-      PLUGIN_DEBUG_0ARG("JVM is up. Returning.\n");
++      PLUGIN_DEBUG("JVM is up. Returning.\n");
+       return;
+   }
+ 
+-  PLUGIN_DEBUG_0ARG("No JVM is running. Attempting to start one...\n");
++  PLUGIN_DEBUG("No JVM is running. Attempting to start one...\n");
+ 
+   NPError np_error = NPERR_NO_ERROR;
+   ITNPPluginData* data = NULL;
+@@ -447,14 +447,14 @@
+   // clean up any older pip
+   unlink (in_pipe_name);
+ 
+-  PLUGIN_DEBUG_1ARG ("ITNP_New: creating input fifo: %s\n", in_pipe_name);
++  PLUGIN_DEBUG ("ITNP_New: creating input fifo: %s\n", in_pipe_name);
+   if (mkfifo (in_pipe_name, 0600) == -1 && errno != EEXIST)
+     {
+       PLUGIN_ERROR_TWO ("Failed to create input pipe", strerror (errno));
+       np_error = NPERR_GENERIC_ERROR;
+       goto cleanup_in_pipe_name;
+     }
+-  PLUGIN_DEBUG_1ARG ("ITNP_New: created input fifo: %s\n", in_pipe_name);
++  PLUGIN_DEBUG ("ITNP_New: created input fifo: %s\n", in_pipe_name);
+ 
+   // Create plugin-to-appletviewer pipe which we refer to as the
+   // output pipe.
+@@ -473,14 +473,14 @@
+   // clean up any older pip
+   unlink (out_pipe_name);
+ 
+-  PLUGIN_DEBUG_1ARG ("ITNP_New: creating output fifo: %s\n", out_pipe_name);
++  PLUGIN_DEBUG ("ITNP_New: creating output fifo: %s\n", out_pipe_name);
+   if (mkfifo (out_pipe_name, 0600) == -1 && errno != EEXIST)
+     {
+       PLUGIN_ERROR_TWO ("Failed to create output pipe", strerror (errno));
+       np_error = NPERR_GENERIC_ERROR;
+       goto cleanup_out_pipe_name;
+     }
+-  PLUGIN_DEBUG_1ARG ("ITNP_New: created output fifo: %s\n", out_pipe_name);
++  PLUGIN_DEBUG ("ITNP_New: created output fifo: %s\n", out_pipe_name);
+ 
+   // Start a separate appletviewer process for each applet, even if
+   // there are multiple applets in the same page.  We may need to
+@@ -571,9 +571,9 @@
+ 
+   // cleanup_out_pipe:
+   // Delete output pipe.
+-  PLUGIN_DEBUG_1ARG ("ITNP_New: deleting input fifo: %s\n", in_pipe_name);
++  PLUGIN_DEBUG ("ITNP_New: deleting input fifo: %s\n", in_pipe_name);
+   unlink (out_pipe_name);
+-  PLUGIN_DEBUG_1ARG ("ITNP_New: deleted input fifo: %s\n", in_pipe_name);
++  PLUGIN_DEBUG ("ITNP_New: deleted input fifo: %s\n", in_pipe_name);
+ 
+  cleanup_out_pipe_name:
+   g_free (out_pipe_name);
+@@ -581,9 +581,9 @@
+ 
+   // cleanup_in_pipe:
+   // Delete input pipe.
+-  PLUGIN_DEBUG_1ARG ("ITNP_New: deleting output fifo: %s\n", out_pipe_name);
++  PLUGIN_DEBUG ("ITNP_New: deleting output fifo: %s\n", out_pipe_name);
+   unlink (in_pipe_name);
+-  PLUGIN_DEBUG_1ARG ("ITNP_New: deleted output fifo: %s\n", out_pipe_name);
++  PLUGIN_DEBUG ("ITNP_New: deleted output fifo: %s\n", out_pipe_name);
+ 
+  cleanup_in_pipe_name:
+   g_free (in_pipe_name);
+@@ -599,7 +599,7 @@
+ NPError
+ ITNP_GetValue (NPP instance, NPPVariable variable, void* value)
+ {
+-  PLUGIN_DEBUG_0ARG ("ITNP_GetValue\n");
++  PLUGIN_DEBUG ("ITNP_GetValue\n");
+ 
+   NPError np_error = NPERR_NO_ERROR;
+ 
+@@ -608,7 +608,7 @@
+     // This plugin needs XEmbed support.
+     case NPPVpluginNeedsXEmbed:
+       {
+-        PLUGIN_DEBUG_0ARG ("ITNP_GetValue: returning TRUE for NeedsXEmbed.\n");
++        PLUGIN_DEBUG ("ITNP_GetValue: returning TRUE for NeedsXEmbed.\n");
+         bool* bool_value = (bool*) value;
+         *bool_value = true;
+       }
+@@ -624,7 +624,7 @@
+       break;
+     }
+ 
+-  PLUGIN_DEBUG_0ARG ("ITNP_GetValue return\n");
++  PLUGIN_DEBUG ("ITNP_GetValue return\n");
+ 
+   return np_error;
+ }
+@@ -632,7 +632,7 @@
+ NPError
+ ITNP_Destroy (NPP instance, NPSavedData** save)
+ {
+-  PLUGIN_DEBUG_1ARG ("ITNP_Destroy %p\n", instance);
++  PLUGIN_DEBUG ("ITNP_Destroy %p\n", instance);
+ 
+   ITNPPluginData* data = (ITNPPluginData*) instance->pdata;
+ 
+@@ -649,7 +649,7 @@
+ 
+   IcedTeaPluginUtilities::invalidateInstance(instance);
+ 
+-  PLUGIN_DEBUG_0ARG ("ITNP_Destroy return\n");
++  PLUGIN_DEBUG ("ITNP_Destroy return\n");
+ 
+   return NPERR_NO_ERROR;
+ }
+@@ -657,7 +657,7 @@
+ NPError
+ ITNP_SetWindow (NPP instance, NPWindow* window)
+ {
+-  PLUGIN_DEBUG_0ARG ("ITNP_SetWindow\n");
++  PLUGIN_DEBUG ("ITNP_SetWindow\n");
+ 
+   if (instance == NULL)
+     {
+@@ -679,7 +679,7 @@
+   // Simply return if we receive a NULL window.
+   if ((window == NULL) || (window->window == NULL))
+     {
+-      PLUGIN_DEBUG_0ARG ("ITNP_SetWindow: got NULL window.\n");
++      PLUGIN_DEBUG ("ITNP_SetWindow: got NULL window.\n");
+ 
+       return NPERR_NO_ERROR;
+     }
+@@ -690,7 +690,7 @@
+       if (data->window_handle == window->window)
+     {
+           // The parent window is the same as in previous calls.
+-          PLUGIN_DEBUG_0ARG ("ITNP_SetWindow: window already exists.\n");
++          PLUGIN_DEBUG ("ITNP_SetWindow: window already exists.\n");
+ 
+           // Critical region.  Read data->appletviewer_mutex and send
+           // a message to the appletviewer.
+@@ -704,7 +704,7 @@
+           // SetWindow call.
+           if (window->width != data->window_width)
+         {
+-                  PLUGIN_DEBUG_0ARG ("ITNP_SetWindow: window width changed.\n");
++                  PLUGIN_DEBUG ("ITNP_SetWindow: window width changed.\n");
+           // The width of the plugin window has changed.
+ 
+                   // Store the new width.
+@@ -714,7 +714,7 @@
+ 
+           if (window->height != data->window_height)
+         {
+-                  PLUGIN_DEBUG_0ARG ("ITNP_SetWindow: window height changed.\n");
++                  PLUGIN_DEBUG ("ITNP_SetWindow: window height changed.\n");
+           // The height of the plugin window has changed.
+ 
+                   // Store the new height.
+@@ -736,7 +736,7 @@
+       else
+         {
+               // The appletviewer is not running.
+-          PLUGIN_DEBUG_0ARG ("ITNP_SetWindow: appletviewer is not running.\n");
++          PLUGIN_DEBUG ("ITNP_SetWindow: appletviewer is not running.\n");
+         }
+ 
+           g_mutex_unlock (data->appletviewer_mutex);
+@@ -745,12 +745,12 @@
+     {
+       // The parent window has changed.  This branch does run but
+       // doing nothing in response seems to be sufficient.
+-      PLUGIN_DEBUG_0ARG ("ITNP_SetWindow: parent window changed.\n");
++      PLUGIN_DEBUG ("ITNP_SetWindow: parent window changed.\n");
+     }
+     }
+   else
+     {
+-      PLUGIN_DEBUG_0ARG ("ITNP_SetWindow: setting window.\n");
++      PLUGIN_DEBUG ("ITNP_SetWindow: setting window.\n");
+ 
+       // Critical region.  Send messages to appletviewer.
+       g_mutex_lock (data->appletviewer_mutex);
+@@ -774,7 +774,7 @@
+       data->window_handle = window->window;
+     }
+ 
+-  PLUGIN_DEBUG_0ARG ("ITNP_SetWindow return\n");
++  PLUGIN_DEBUG ("ITNP_SetWindow return\n");
+ 
+   return NPERR_NO_ERROR;
+ }
+@@ -783,9 +783,9 @@
+ ITNP_NewStream (NPP instance, NPMIMEType type, NPStream* stream,
+                NPBool seekable, uint16_t* stype)
+ {
+-  PLUGIN_DEBUG_0ARG ("ITNP_NewStream\n");
++  PLUGIN_DEBUG ("ITNP_NewStream\n");
+ 
+-  PLUGIN_DEBUG_0ARG ("ITNP_NewStream return\n");
++  PLUGIN_DEBUG ("ITNP_NewStream return\n");
+ 
+   return NPERR_NO_ERROR;
+ }
+@@ -793,17 +793,17 @@
+ void
+ ITNP_StreamAsFile (NPP instance, NPStream* stream, const char* filename)
+ {
+-  PLUGIN_DEBUG_0ARG ("ITNP_StreamAsFile\n");
++  PLUGIN_DEBUG ("ITNP_StreamAsFile\n");
+ 
+-  PLUGIN_DEBUG_0ARG ("ITNP_StreamAsFile return\n");
++  PLUGIN_DEBUG ("ITNP_StreamAsFile return\n");
+ }
+ 
+ NPError
+ ITNP_DestroyStream (NPP instance, NPStream* stream, NPReason reason)
+ {
+-  PLUGIN_DEBUG_0ARG ("ITNP_DestroyStream\n");
++  PLUGIN_DEBUG ("ITNP_DestroyStream\n");
+ 
+-  PLUGIN_DEBUG_0ARG ("ITNP_DestroyStream return\n");
++  PLUGIN_DEBUG ("ITNP_DestroyStream return\n");
+ 
+   return NPERR_NO_ERROR;
+ }
+@@ -811,9 +811,9 @@
+ int32_t
+ ITNP_WriteReady (NPP instance, NPStream* stream)
+ {
+-  PLUGIN_DEBUG_0ARG ("ITNP_WriteReady\n");
++  PLUGIN_DEBUG ("ITNP_WriteReady\n");
+ 
+-  PLUGIN_DEBUG_0ARG ("ITNP_WriteReady return\n");
++  PLUGIN_DEBUG ("ITNP_WriteReady return\n");
+ 
+   return 0;
+ }
+@@ -822,9 +822,9 @@
+ ITNP_Write (NPP instance, NPStream* stream, int32_t offset, int32_t len,
+            void* buffer)
+ {
+-  PLUGIN_DEBUG_0ARG ("ITNP_Write\n");
++  PLUGIN_DEBUG ("ITNP_Write\n");
+ 
+-  PLUGIN_DEBUG_0ARG ("ITNP_Write return\n");
++  PLUGIN_DEBUG ("ITNP_Write return\n");
+ 
+   return 0;
+ }
+@@ -832,17 +832,17 @@
+ void
+ ITNP_Print (NPP instance, NPPrint* platformPrint)
+ {
+-  PLUGIN_DEBUG_0ARG ("ITNP_Print\n");
++  PLUGIN_DEBUG ("ITNP_Print\n");
+ 
+-  PLUGIN_DEBUG_0ARG ("ITNP_Print return\n");
++  PLUGIN_DEBUG ("ITNP_Print return\n");
+ }
+ 
+ int16_t
+ ITNP_HandleEvent (NPP instance, void* event)
+ {
+-  PLUGIN_DEBUG_0ARG ("ITNP_HandleEvent\n");
++  PLUGIN_DEBUG ("ITNP_HandleEvent\n");
+ 
+-  PLUGIN_DEBUG_0ARG ("ITNP_HandleEvent return\n");
++  PLUGIN_DEBUG ("ITNP_HandleEvent return\n");
+ 
+   return 0;
+ }
+@@ -851,9 +851,9 @@
+ ITNP_URLNotify (NPP instance, const char* url, NPReason reason,
+                void* notifyData)
+ {
+-  PLUGIN_DEBUG_0ARG ("ITNP_URLNotify\n");
++  PLUGIN_DEBUG ("ITNP_URLNotify\n");
+ 
+-  PLUGIN_DEBUG_0ARG ("ITNP_URLNotify return\n");
++  PLUGIN_DEBUG ("ITNP_URLNotify return\n");
+ }
+ 
+ NPError
+@@ -924,7 +924,7 @@
+ static void
+ plugin_data_new (ITNPPluginData** data)
+ {
+-  PLUGIN_DEBUG_0ARG ("plugin_data_new\n");
++  PLUGIN_DEBUG ("plugin_data_new\n");
+ 
+   *data = (ITNPPluginData*)
+     (*browser_functions.memalloc) (sizeof (struct ITNPPluginData));
+@@ -933,7 +933,7 @@
+   if (*data)
+     memset (*data, 0, sizeof (struct ITNPPluginData));
+ 
+-  PLUGIN_DEBUG_0ARG ("plugin_data_new return\n");
++  PLUGIN_DEBUG ("plugin_data_new return\n");
+ }
+ 
+ 
+@@ -948,7 +948,7 @@
+ static gchar*
+ plugin_get_documentbase (NPP instance)
+ {
+-  PLUGIN_DEBUG_0ARG ("plugin_get_documentbase\n");
++  PLUGIN_DEBUG ("plugin_get_documentbase\n");
+ 
+   nsIPluginInstance* xpcom_instance = NULL;
+   nsIPluginInstancePeer* peer = NULL;
+@@ -1000,16 +1000,16 @@
+   NS_RELEASE (peer);
+ 
+  cleanup_done:
+-  PLUGIN_DEBUG_0ARG ("plugin_get_documentbase return\n");
++  PLUGIN_DEBUG ("plugin_get_documentbase return\n");
+ 
+-  PLUGIN_DEBUG_1ARG("plugin_get_documentbase returning: %s\n", documentbase_copy);
++  PLUGIN_DEBUG("plugin_get_documentbase returning: %s\n", documentbase_copy);
+   return documentbase_copy;
+ }
+ #else
+ static gchar*
+ plugin_get_documentbase (NPP instance)
+ {
+-  PLUGIN_DEBUG_0ARG ("plugin_get_documentbase\n");
++  PLUGIN_DEBUG ("plugin_get_documentbase\n");
+ 
+   char const* documentbase = NULL;
+   gchar* documentbase_copy = NULL;
+@@ -1021,30 +1021,26 @@
+   // Additionally, since it is insecure, we cannot use it for making
+   // security decisions.
+   NPObject* window;
+-  NPString script = NPString();
+-  std::string script_str = std::string();
+-  NPVariant* location = new NPVariant();
+-  std::string location_str = std::string();
++  browser_functions.getvalue(instance, NPNVWindowNPObject, &window);
+ 
+-  browser_functions.getvalue(instance, NPNVWindowNPObject, &window);
+-  script_str += "window.location.href";
+-#if MOZILLA_VERSION_COLLAPSED < 1090200
+-  script.utf8characters = script_str.c_str();
+-  script.utf8length = script_str.size();
+-#else
+-  script.UTF8Characters = script_str.c_str();
+-  script.UTF8Length = script_str.size();
+-#endif
+-  browser_functions.evaluate(instance, window, &script, location);
++  NPVariant location;
++  NPIdentifier location_id = browser_functions.getstringidentifier("location");
++  browser_functions.getproperty(instance, window, location_id, &location);
++
++  NPVariant href;
++  NPIdentifier href_id = browser_functions.getstringidentifier("href");
++  browser_functions.getproperty(instance, NPVARIANT_TO_OBJECT(location), 
++                               href_id, &href);
+ 
+   // Strip everything after the last "/"
+ #if MOZILLA_VERSION_COLLAPSED < 1090200
+-  gchar** parts = g_strsplit (NPVARIANT_TO_STRING(*location).utf8characters, "/", -1);
++  gchar** parts = g_strsplit (NPVARIANT_TO_STRING(href).utf8characters, "/", -1);
+ #else
+-  gchar** parts = g_strsplit (NPVARIANT_TO_STRING(*location).UTF8Characters, "/", -1);
++  gchar** parts = g_strsplit (NPVARIANT_TO_STRING(href).UTF8Characters, "/", -1);
+ #endif
+   guint parts_sz = g_strv_length (parts);
+ 
++  std::string location_str;
+   for (int i=0; i < parts_sz - 1; i++)
+   {
+       location_str += parts[i];
+@@ -1054,9 +1050,11 @@
+   documentbase_copy = g_strdup (location_str.c_str());
+ 
+   // Release references.
++  browser_functions.releasevariantvalue(&href);
++  browser_functions.releasevariantvalue(&location);
+  cleanup_done:
+-  PLUGIN_DEBUG_0ARG ("plugin_get_documentbase return\n");
+-  PLUGIN_DEBUG_1ARG("plugin_get_documentbase returning: %s\n", documentbase_copy);
++  PLUGIN_DEBUG ("plugin_get_documentbase return\n");
++  PLUGIN_DEBUG("plugin_get_documentbase returning: %s\n", documentbase_copy);
+ 
+   return documentbase_copy;
+ }
+@@ -1069,7 +1067,7 @@
+ {
+   GtkWidget* dialog = NULL;
+ 
+-  PLUGIN_DEBUG_0ARG ("plugin_display_failure_dialog\n");
++  PLUGIN_DEBUG ("plugin_display_failure_dialog\n");
+ 
+   dialog = gtk_message_dialog_new (NULL,
+                                    GTK_DIALOG_DESTROY_WITH_PARENT,
+@@ -1081,7 +1079,7 @@
+   gtk_dialog_run (GTK_DIALOG (dialog));
+   gtk_widget_destroy (dialog);
+ 
+-  PLUGIN_DEBUG_0ARG ("plugin_display_failure_dialog return\n");
++  PLUGIN_DEBUG ("plugin_display_failure_dialog return\n");
+ }
+ 
+ 
+@@ -1095,7 +1093,7 @@
+                          GIOCondition condition,
+                          gpointer plugin_data)
+ {
+-  PLUGIN_DEBUG_0ARG ("plugin_in_pipe_callback\n");
++  PLUGIN_DEBUG ("plugin_in_pipe_callback\n");
+ 
+   gboolean keep_installed = TRUE;
+ 
+@@ -1130,18 +1128,18 @@
+ 
+   if (condition & (G_IO_ERR | G_IO_HUP))
+     {
+-      PLUGIN_DEBUG_0ARG ("appletviewer has stopped.\n");
++      PLUGIN_DEBUG ("appletviewer has stopped.\n");
+       keep_installed = FALSE;
+     }
+ 
+-  PLUGIN_DEBUG_0ARG ("plugin_in_pipe_callback return\n");
++  PLUGIN_DEBUG ("plugin_in_pipe_callback return\n");
+ 
+   return keep_installed;
+ }
+ 
+ void consume_message(gchar* message) {
+ 
+-	PLUGIN_DEBUG_1ARG ("  PIPE: plugin read: %s\n", message);
++	PLUGIN_DEBUG ("  PIPE: plugin read: %s\n", message);
+ 
+   if (g_str_has_prefix (message, "instance"))
+     {
+@@ -1156,7 +1154,7 @@
+ 
+       if (instance_id > 0 && !instance)
+         {
+-          PLUGIN_DEBUG_2ARG("Instance %d is not active. Refusing to consume message \"%s\"\n", instance_id, message);
++          PLUGIN_DEBUG("Instance %d is not active. Refusing to consume message \"%s\"\n", instance_id, message);
+           return;
+         }
+       else if (instance)
+@@ -1170,8 +1168,8 @@
+           gchar* decoded_url = (gchar*) calloc(strlen(parts[3]) + 1, sizeof(gchar));
+           IcedTeaPluginUtilities::decodeURL(parts[3], &decoded_url);
+ 
+-          PLUGIN_DEBUG_1ARG ("plugin_in_pipe_callback: opening URL %s\n", decoded_url);
+-          PLUGIN_DEBUG_1ARG ("plugin_in_pipe_callback: URL target %s\n", parts[4]);
++          PLUGIN_DEBUG ("plugin_in_pipe_callback: opening URL %s\n", decoded_url);
++          PLUGIN_DEBUG ("plugin_in_pipe_callback: URL target %s\n", parts[4]);
+ 
+           NPError np_error =
+             (*browser_functions.geturl) (data->owner, decoded_url, parts[4]);
+@@ -1193,7 +1191,7 @@
+ 
+           // join the rest
+           gchar* status_message = g_strjoinv(" ", parts);
+-          PLUGIN_DEBUG_1ARG ("plugin_in_pipe_callback: setting status %s\n", status_message);
++          PLUGIN_DEBUG ("plugin_in_pipe_callback: setting status %s\n", status_message);
+           (*browser_functions.status) (data->owner, status_message);
+ 
+           g_free(status_message);
+@@ -1229,7 +1227,7 @@
+ 
+         gchar* decoded_url = (gchar*) calloc(strlen(parts[4]) + 1, sizeof(gchar));
+         IcedTeaPluginUtilities::decodeURL(parts[4], &decoded_url);
+-        PLUGIN_DEBUG_5ARG("parts[0]=%s, parts[1]=%s, reference, parts[3]=%s, parts[4]=%s -- decoded_url=%s\n", parts[0], parts[1], parts[3], parts[4], decoded_url);
++        PLUGIN_DEBUG("parts[0]=%s, parts[1]=%s, reference, parts[3]=%s, parts[4]=%s -- decoded_url=%s\n", parts[0], parts[1], parts[3], parts[4], decoded_url);
+ 
+         gchar* proxy_info;
+ 
+@@ -1243,7 +1241,7 @@
+             proxy_info = g_strconcat (proxy_info, proxy, NULL);
+           }
+ 
+-        PLUGIN_DEBUG_1ARG("Proxy info: %s\n", proxy_info);
++        PLUGIN_DEBUG("Proxy info: %s\n", proxy_info);
+         plugin_send_message_to_appletviewer(proxy_info);
+ 
+         g_free(decoded_url);
+@@ -1269,7 +1267,7 @@
+             cookie_info = g_strconcat (cookie_info, cookie_string, NULL);
+         }
+ 
+-        PLUGIN_DEBUG_1ARG("Cookie info: %s\n", cookie_info);
++        PLUGIN_DEBUG("Cookie info: %s\n", cookie_info);
+         plugin_send_message_to_appletviewer(cookie_info);
+ 
+         g_free(decoded_url);
+@@ -1294,7 +1292,7 @@
+ {
+     int id = GPOINTER_TO_INT(g_hash_table_lookup(instance_to_id_map,
+                                                        instance));
+-    PLUGIN_DEBUG_2ARG("Returning id %d for instance %p\n", id, instance);
++    PLUGIN_DEBUG("Returning id %d for instance %p\n", id, instance);
+     return id;
+ }
+ 
+@@ -1329,7 +1327,7 @@
+ 
+   // if there is no proxy found, return immediately
+   if (!info) {
+-     PLUGIN_DEBUG_1ARG("%s does not need a proxy\n", siteAddr);
++     PLUGIN_DEBUG("%s does not need a proxy\n", siteAddr);
+      return NPERR_GENERIC_ERROR;
+   }
+ 
+@@ -1367,7 +1365,7 @@
+ 
+   *len = strlen(*proxy);
+ 
+-  PLUGIN_DEBUG_2ARG("Proxy info for %s: %s\n", siteAddr, *proxy);
++  PLUGIN_DEBUG("Proxy info for %s: %s\n", siteAddr, *proxy);
+ 
+ #else
+ 
+@@ -1400,13 +1398,13 @@
+                           GIOCondition condition,
+                           gpointer plugin_data)
+ {
+-  PLUGIN_DEBUG_0ARG ("plugin_out_pipe_callback\n");
++  PLUGIN_DEBUG ("plugin_out_pipe_callback\n");
+ 
+   ITNPPluginData* data = (ITNPPluginData*) plugin_data;
+ 
+-  PLUGIN_DEBUG_0ARG ("plugin_out_pipe_callback: appletviewer has stopped.\n");
++  PLUGIN_DEBUG ("plugin_out_pipe_callback: appletviewer has stopped.\n");
+ 
+-  PLUGIN_DEBUG_0ARG ("plugin_out_pipe_callback return\n");
++  PLUGIN_DEBUG ("plugin_out_pipe_callback return\n");
+ 
+   return FALSE;
+ }
+@@ -1449,12 +1447,12 @@
+ 
+   if (path_new == NULL || strlen (path_new) == 0)
+     {
+-      PLUGIN_DEBUG_0ARG("Unset LD_LIBRARY_PATH\n");
++      PLUGIN_DEBUG("Unset LD_LIBRARY_PATH\n");
+       return NULL;
+     }
+   else
+     {
+-      PLUGIN_DEBUG_1ARG ("Set LD_LIBRARY_PATH: %s\n", path_new);
++      PLUGIN_DEBUG ("Set LD_LIBRARY_PATH: %s\n", path_new);
+       return path_new;
+     }
+ }
+@@ -1464,7 +1462,7 @@
+ plugin_filter_environment(void)
+ {
+   gchar **var_names = g_listenv();
+-  gchar **new_env = (gchar**) malloc(sizeof(gchar*) * g_strv_length (var_names));
++  gchar **new_env = (gchar**) malloc(sizeof(gchar*) * (g_strv_length (var_names) + 1));
+   int i_var, i_env;
+ 
+   for (i_var = 0, i_env = 0; var_names[i_var] != NULL; i_var++)
+@@ -1486,7 +1484,7 @@
+ static NPError
+ plugin_test_appletviewer ()
+ {
+-  PLUGIN_DEBUG_1ARG ("plugin_test_appletviewer: %s\n", appletviewer_executable);
++  PLUGIN_DEBUG ("plugin_test_appletviewer: %s\n", appletviewer_executable);
+   NPError error = NPERR_NO_ERROR;
+ 
+   gchar* command_line[3] = { NULL, NULL, NULL };
+@@ -1523,14 +1521,14 @@
+   g_free (command_line[2]);
+   command_line[2] = NULL;
+ 
+-  PLUGIN_DEBUG_0ARG ("plugin_test_appletviewer return\n");
++  PLUGIN_DEBUG ("plugin_test_appletviewer return\n");
+   return error;
+ }
+ 
+ static NPError
+ plugin_start_appletviewer (ITNPPluginData* data)
+ {
+-  PLUGIN_DEBUG_0ARG ("plugin_start_appletviewer\n");
++  PLUGIN_DEBUG ("plugin_start_appletviewer\n");
+   NPError error = NPERR_NO_ERROR;
+ 
+   gchar** command_line;
+@@ -1599,12 +1597,12 @@
+ 
+   if (appletviewer_pid)
+     {
+-      PLUGIN_DEBUG_1ARG("Initialized VM with pid=%d\n", appletviewer_pid);
++      PLUGIN_DEBUG("Initialized VM with pid=%d\n", appletviewer_pid);
+       appletviewer_watch_id = g_child_watch_add(appletviewer_pid, (GChildWatchFunc) appletviewer_monitor, (gpointer) appletviewer_pid);
+     }
+ 
+ 
+-  PLUGIN_DEBUG_0ARG ("plugin_start_appletviewer return\n");
++  PLUGIN_DEBUG ("plugin_start_appletviewer return\n");
+   return error;
+ }
+ 
+@@ -1613,7 +1611,7 @@
+ static gchar*
+ plugin_create_applet_tag (int16_t argc, char* argn[], char* argv[])
+ {
+-  PLUGIN_DEBUG_0ARG ("plugin_create_applet_tag\n");
++  PLUGIN_DEBUG ("plugin_create_applet_tag\n");
+ 
+   gchar* applet_tag = g_strdup ("<EMBED ");
+   gchar* parameters = g_strdup ("");
+@@ -1712,7 +1710,7 @@
+   g_free (parameters);
+   parameters = NULL;
+ 
+-  PLUGIN_DEBUG_0ARG ("plugin_create_applet_tag return\n");
++  PLUGIN_DEBUG ("plugin_create_applet_tag return\n");
+ 
+   return applet_tag;
+ }
+@@ -1722,7 +1720,7 @@
+ void
+ plugin_send_message_to_appletviewer (gchar const* message)
+ {
+-  PLUGIN_DEBUG_0ARG ("plugin_send_message_to_appletviewer\n");
++  PLUGIN_DEBUG ("plugin_send_message_to_appletviewer\n");
+ 
+   if (jvm_up)
+     {
+@@ -1767,10 +1765,10 @@
+       g_free (newline_message);
+       newline_message = NULL;
+ 
+-      PLUGIN_DEBUG_1ARG ("  PIPE: plugin wrote: %s\n", message);
++      PLUGIN_DEBUG ("  PIPE: plugin wrote: %s\n", message);
+     }
+ 
+-  PLUGIN_DEBUG_0ARG ("plugin_send_message_to_appletviewer return\n");
++  PLUGIN_DEBUG ("plugin_send_message_to_appletviewer return\n");
+ }
+ 
+ // Stop the appletviewer process.  When this is called the
+@@ -1789,7 +1787,7 @@
+ static void
+ plugin_stop_appletviewer ()
+ {
+-  PLUGIN_DEBUG_0ARG ("plugin_stop_appletviewer\n");
++  PLUGIN_DEBUG ("plugin_stop_appletviewer\n");
+ 
+   if (jvm_up)
+     {
+@@ -1865,21 +1863,21 @@
+   jvm_up = FALSE;
+   sleep(2); /* Needed to prevent crashes during debug (when JDWP port is not freed by the kernel right away) */
+ 
+-  PLUGIN_DEBUG_0ARG ("plugin_stop_appletviewer return\n");
++  PLUGIN_DEBUG ("plugin_stop_appletviewer return\n");
+ }
+ 
+ static void appletviewer_monitor(GPid pid, gint status, gpointer data)
+ {
+-    PLUGIN_DEBUG_0ARG ("appletviewer_monitor\n");
++    PLUGIN_DEBUG ("appletviewer_monitor\n");
+     jvm_up = FALSE;
+     pid = -1;
+-    PLUGIN_DEBUG_0ARG ("appletviewer_monitor return\n");
++    PLUGIN_DEBUG ("appletviewer_monitor return\n");
+ }
+ 
+ static void
+ plugin_data_destroy (NPP instance)
+ {
+-  PLUGIN_DEBUG_0ARG ("plugin_data_destroy\n");
++  PLUGIN_DEBUG ("plugin_data_destroy\n");
+ 
+   ITNPPluginData* tofree = (ITNPPluginData*) instance->pdata;
+ 
+@@ -1914,7 +1912,7 @@
+   (*browser_functions.memfree) (tofree);
+   tofree = NULL;
+ 
+-  PLUGIN_DEBUG_0ARG ("plugin_data_destroy return\n");
++  PLUGIN_DEBUG ("plugin_data_destroy return\n");
+ }
+ 
+ // FACTORY FUNCTIONS
+@@ -1931,7 +1929,7 @@
+ NPError
+ NP_Initialize (NPNetscapeFuncs* browserTable, NPPluginFuncs* pluginTable)
+ {
+-  PLUGIN_DEBUG_0ARG ("NP_Initialize\n");
++  PLUGIN_DEBUG ("NP_Initialize\n");
+ 
+   if (initialized)
+     return NPERR_NO_ERROR;
+@@ -2145,7 +2143,7 @@
+ 
+   appletviewer_executable = g_strdup_printf ("%s/../../bin/java",
+                                              dirname (filename));
+-  PLUGIN_DEBUG_4ARG(".so is located at: %s and the link points to: %s. Executing java from dir %s to run %s\n", info.dli_fname, filename, dirname (filename), appletviewer_executable);
++  PLUGIN_DEBUG(".so is located at: %s and the link points to: %s. Executing java from dir %s to run %s\n", info.dli_fname, filename, dirname (filename), appletviewer_executable);
+   if (!appletviewer_executable)
+     {
+       PLUGIN_ERROR ("Failed to create appletviewer executable name.");
+@@ -2169,9 +2167,9 @@
+ 
+   plugin_instance_mutex = g_mutex_new ();
+ 
+-  PLUGIN_DEBUG_1ARG ("NP_Initialize: using %s\n", appletviewer_executable);
++  PLUGIN_DEBUG ("NP_Initialize: using %s\n", appletviewer_executable);
+ 
+-  PLUGIN_DEBUG_0ARG ("NP_Initialize return\n");
++  PLUGIN_DEBUG ("NP_Initialize return\n");
+ 
+   plugin_req_proc = new PluginRequestProcessor();
+   java_req_proc = new JavaMessageSender();
+@@ -2218,9 +2216,9 @@
+ char*
+ NP_GetMIMEDescription ()
+ {
+-  PLUGIN_DEBUG_0ARG ("NP_GetMIMEDescription\n");
++  PLUGIN_DEBUG ("NP_GetMIMEDescription\n");
+ 
+-  PLUGIN_DEBUG_0ARG ("NP_GetMIMEDescription return\n");
++  PLUGIN_DEBUG ("NP_GetMIMEDescription return\n");
+ 
+   return (char*) PLUGIN_MIME_DESC;
+ }
+@@ -2230,7 +2228,7 @@
+ NPError
+ NP_GetValue (void* future, NPPVariable variable, void* value)
+ {
+-  PLUGIN_DEBUG_0ARG ("NP_GetValue\n");
++  PLUGIN_DEBUG ("NP_GetValue\n");
+ 
+   NPError result = NPERR_NO_ERROR;
+   gchar** char_value = (gchar**) value;
+@@ -2238,12 +2236,12 @@
+   switch (variable)
+     {
+     case NPPVpluginNameString:
+-      PLUGIN_DEBUG_0ARG ("NP_GetValue: returning plugin name.\n");
++      PLUGIN_DEBUG ("NP_GetValue: returning plugin name.\n");
+       *char_value = g_strdup (PLUGIN_NAME);
+       break;
+ 
+     case NPPVpluginDescriptionString:
+-      PLUGIN_DEBUG_0ARG ("NP_GetValue: returning plugin description.\n");
++      PLUGIN_DEBUG ("NP_GetValue: returning plugin description.\n");
+       *char_value = g_strdup (PLUGIN_DESC);
+       break;
+ 
+@@ -2253,7 +2251,7 @@
+       break;
+     }
+ 
+-  PLUGIN_DEBUG_0ARG ("NP_GetValue return\n");
++  PLUGIN_DEBUG ("NP_GetValue return\n");
+ 
+   return result;
+ }
+@@ -2263,7 +2261,7 @@
+ NPError
+ NP_Shutdown (void)
+ {
+-  PLUGIN_DEBUG_0ARG ("NP_Shutdown\n");
++  PLUGIN_DEBUG ("NP_Shutdown\n");
+ 
+   // Free mutex.
+   if (plugin_instance_mutex)
+@@ -2312,9 +2310,9 @@
+ 
+   // cleanup_out_pipe:
+   // Delete output pipe.
+-  PLUGIN_DEBUG_1ARG ("NP_Shutdown: deleting output fifo: %s\n", out_pipe_name);
++  PLUGIN_DEBUG ("NP_Shutdown: deleting output fifo: %s\n", out_pipe_name);
+   unlink (out_pipe_name);
+-  PLUGIN_DEBUG_1ARG ("NP_Shutdown: deleted output fifo: %s\n", out_pipe_name);
++  PLUGIN_DEBUG ("NP_Shutdown: deleted output fifo: %s\n", out_pipe_name);
+ 
+   // cleanup_out_pipe_name:
+   g_free (out_pipe_name);
+@@ -2322,9 +2320,9 @@
+ 
+   // cleanup_in_pipe:
+   // Delete input pipe.
+-  PLUGIN_DEBUG_1ARG ("NP_Shutdown: deleting input fifo: %s\n", in_pipe_name);
++  PLUGIN_DEBUG ("NP_Shutdown: deleting input fifo: %s\n", in_pipe_name);
+   unlink (in_pipe_name);
+-  PLUGIN_DEBUG_1ARG ("NP_Shutdown: deleted input fifo: %s\n", in_pipe_name);
++  PLUGIN_DEBUG ("NP_Shutdown: deleted input fifo: %s\n", in_pipe_name);
+ 
+   // cleanup_in_pipe_name:
+   g_free (in_pipe_name);
+@@ -2347,7 +2345,7 @@
+   delete plugin_to_java_bus;
+   //delete internal_bus;
+ 
+-  PLUGIN_DEBUG_0ARG ("NP_Shutdown return\n");
++  PLUGIN_DEBUG ("NP_Shutdown return\n");
+ 
+   return NPERR_NO_ERROR;
+ }
+@@ -2415,6 +2413,6 @@
+ NPObject*
+ allocate_scriptable_object(NPP npp, NPClass *aClass)
+ {
+-	PLUGIN_DEBUG_0ARG("Allocating new scriptable object\n");
++	PLUGIN_DEBUG("Allocating new scriptable object\n");
+ 	return new IcedTeaScriptablePluginObject(npp);
+ }
+diff -r d1ad52447673 plugin/icedteanp/IcedTeaPluginRequestProcessor.cc
+--- a/plugin/icedteanp/IcedTeaPluginRequestProcessor.cc	Wed Apr 14 12:21:30 2010 +0200
++++ b/plugin/icedteanp/IcedTeaPluginRequestProcessor.cc	Tue Jul 20 16:36:52 2010 +0200
+@@ -73,7 +73,7 @@
+ 
+ PluginRequestProcessor::~PluginRequestProcessor()
+ {
+-    PLUGIN_DEBUG_0ARG("PluginRequestProcessor::~PluginRequestProcessor\n");
++    PLUGIN_DEBUG("PluginRequestProcessor::~PluginRequestProcessor\n");
+ 
+     if (pendingRequests)
+         delete pendingRequests;
+@@ -89,7 +89,7 @@
+ bool
+ PluginRequestProcessor::newMessageOnBus(const char* message)
+ {
+-    PLUGIN_DEBUG_1ARG("PluginRequestProcessor processing %s\n", message);
++    PLUGIN_DEBUG("PluginRequestProcessor processing %s\n", message);
+ 
+     std::string* type;
+     std::string* command;
+@@ -169,7 +169,7 @@
+     get_instance_from_id(id, instance);
+ 
+     browser_functions.getvalue(instance, NPNVWindowNPObject, &window_ptr);
+-    PLUGIN_DEBUG_3ARG("ID=%d, Instance=%p, WindowPTR = %p\n", id, instance, window_ptr);
++    PLUGIN_DEBUG("ID=%d, Instance=%p, WindowPTR = %p\n", id, instance, window_ptr);
+ 
+     OBJECT_TO_NPVARIANT(window_ptr, *variant);
+     browser_functions.retainobject(window_ptr);
+@@ -592,7 +592,7 @@
+     }
+ #endif
+ 
+-    PLUGIN_DEBUG_1ARG("Member PTR after internal request: %s\n", thread_data.result.c_str());
++    PLUGIN_DEBUG("Member PTR after internal request: %s\n", thread_data.result.c_str());
+ 
+     java_result = java_request.findClass(0, "netscape.javascript.JSObject");
+ 
+@@ -711,7 +711,7 @@
+     std::string command;
+     pthread_mutex_t wait_mutex = PTHREAD_MUTEX_INITIALIZER; // This is needed for API compat. and is unused
+ 
+-    PLUGIN_DEBUG_1ARG("Queue processor initialized. Queue = %p\n", message_queue);
++    PLUGIN_DEBUG("Queue processor initialized. Queue = %p\n", message_queue);
+ 
+     while (true)
+     {
+@@ -787,7 +787,7 @@
+         message_parts = NULL;
+     }
+ 
+-    PLUGIN_DEBUG_0ARG("Queue processing stopped.\n");
++    PLUGIN_DEBUG("Queue processing stopped.\n");
+ }
+ 
+ /******************************************
+@@ -810,7 +810,7 @@
+     property = (NPIdentifier*) parameters.at(2);
+     value = (std::string*) parameters.at(3);
+ 
+-    PLUGIN_DEBUG_4ARG("Setting %s on instance %p, object %p to value %s\n", browser_functions.utf8fromidentifier(*property), instance, member, value->c_str());
++    PLUGIN_DEBUG("Setting %s on instance %p, object %p to value %s\n", browser_functions.utf8fromidentifier(*property), instance, member, value->c_str());
+ 
+     IcedTeaPluginUtilities::javaResultToNPVariant(instance, value, &value_variant);
+ 
+@@ -834,7 +834,7 @@
+     NPIdentifier* member_identifier = (NPIdentifier*) parameters.at(2);
+ 
+     // Get the NPVariant corresponding to this member
+-    PLUGIN_DEBUG_4ARG("Looking for %p %p %p (%s)\n", instance, parent_ptr, member_identifier, browser_functions.utf8fromidentifier(*member_identifier));
++    PLUGIN_DEBUG("Looking for %p %p %p (%s)\n", instance, parent_ptr, member_identifier, browser_functions.utf8fromidentifier(*member_identifier));
+ 
+     if (!browser_functions.hasproperty(instance, parent_ptr, *member_identifier))
+     {
+@@ -854,7 +854,7 @@
+     // store member -> instance link
+     IcedTeaPluginUtilities::storeInstanceID(member_ptr, instance);
+ 
+-    PLUGIN_DEBUG_0ARG("_getMember returning.\n");
++    PLUGIN_DEBUG("_getMember returning.\n");
+ }
+ 
+ void
+@@ -868,7 +868,7 @@
+     NPVariant* eval_result = new NPVariant();
+     std::string eval_result_ptr_str = std::string();
+ 
+-    PLUGIN_DEBUG_0ARG("_eval called\n");
++    PLUGIN_DEBUG("_eval called\n");
+ 
+     std::vector<void*>* call_data = (std::vector<void*>*) data;
+ 
+@@ -880,12 +880,12 @@
+     script.utf8characters = script_str->c_str();
+     script.utf8length = script_str->size();
+ 
+-    PLUGIN_DEBUG_1ARG("Evaluating: %s\n", script.utf8characters);
++    PLUGIN_DEBUG("Evaluating: %s\n", script.utf8characters);
+ #else
+     script.UTF8Characters = script_str->c_str();
+     script.UTF8Length = script_str->size();
+ 
+-    PLUGIN_DEBUG_1ARG("Evaluating: %s\n", script.UTF8Characters);
++    PLUGIN_DEBUG("Evaluating: %s\n", script.UTF8Characters);
+ #endif
+ 
+     ((AsyncCallThreadData*) data)->call_successful = browser_functions.evaluate(instance, window_ptr, &script, eval_result);
+@@ -898,7 +898,7 @@
+     }
+     ((AsyncCallThreadData*) data)->result_ready = true;
+ 
+-    PLUGIN_DEBUG_0ARG("_eval returning\n");
++    PLUGIN_DEBUG("_eval returning\n");
+ }
+ 
+ 
+@@ -914,7 +914,7 @@
+     NPVariant* call_result = new NPVariant();
+     std::string call_result_ptr_str = std::string();
+ 
+-    PLUGIN_DEBUG_0ARG("_call called\n");
++    PLUGIN_DEBUG("_call called\n");
+ 
+     std::vector<void*>* call_data = (std::vector<void*>*) data;
+ 
+@@ -930,7 +930,9 @@
+         IcedTeaPluginUtilities::printNPVariant(args[i]);
+     }
+ 
++    PLUGIN_DEBUG("_calling\n");
+     ((AsyncCallThreadData*) data)->call_successful = browser_functions.invoke(instance, window_ptr, function, args, *arg_count, call_result);
++    PLUGIN_DEBUG("_called\n");
+ 
+     IcedTeaPluginUtilities::printNPVariant(*call_result);
+ 
+@@ -942,7 +944,7 @@
+ 
+     ((AsyncCallThreadData*) data)->result_ready = true;
+ 
+-    PLUGIN_DEBUG_0ARG("_call returning\n");
++    PLUGIN_DEBUG("_call returning\n");
+ }
+ 
+ void
+@@ -958,7 +960,7 @@
+     instance = (NPP) call_data->at(0);
+     NPVariant* variant = (NPVariant*) call_data->at(1);
+ 
+-    PLUGIN_DEBUG_2ARG("_getString called with %p and %p\n", instance, variant);
++    PLUGIN_DEBUG("_getString called with %p and %p\n", instance, variant);
+ 
+     if (NPVARIANT_IS_OBJECT(*variant))
+     {
+@@ -972,7 +974,7 @@
+         ((AsyncCallThreadData*) data)->call_successful = true;
+     }
+ 
+-    PLUGIN_DEBUG_0ARG("ToString result: ");
++    PLUGIN_DEBUG("ToString result: ");
+     IcedTeaPluginUtilities::printNPVariant(tostring_result);
+ 
+     if (((AsyncCallThreadData*) data)->call_successful)
+@@ -981,6 +983,6 @@
+     }
+     ((AsyncCallThreadData*) data)->result_ready = true;
+ 
+-    PLUGIN_DEBUG_0ARG("_getString returning\n");
++    PLUGIN_DEBUG("_getString returning\n");
+ }
+ 
+diff -r d1ad52447673 plugin/icedteanp/IcedTeaPluginUtils.cc
+--- a/plugin/icedteanp/IcedTeaPluginUtils.cc	Wed Apr 14 12:21:30 2010 +0200
++++ b/plugin/icedteanp/IcedTeaPluginUtils.cc	Tue Jul 20 16:36:52 2010 +0200
+@@ -157,7 +157,7 @@
+ 
+ 	result->append(id_str);
+ 
+-	PLUGIN_DEBUG_2ARG("Converting pointer %p to %s\n", id, id_str);
++	PLUGIN_DEBUG("Converting pointer %p to %s\n", id, id_str);
+ 	free(id_str);
+ }
+ 
+@@ -174,15 +174,15 @@
+ 	void* ptr;
+ 	if (sizeof(void*) == sizeof(long long))
+ 	{
+-		PLUGIN_DEBUG_2ARG("Casting (long long) \"%s\" -- %llu\n", id_str.c_str(), strtoull(id_str.c_str(), NULL, 0));
++		PLUGIN_DEBUG("Casting (long long) \"%s\" -- %llu\n", id_str.c_str(), strtoull(id_str.c_str(), NULL, 0));
+ 		ptr = reinterpret_cast <void*> ((unsigned long long) strtoull(id_str.c_str(), NULL, 0));
+ 	} else
+ 	{
+-		PLUGIN_DEBUG_2ARG("Casting (long) \"%s\" -- %lu\n", id_str.c_str(), strtoul(id_str.c_str(), NULL, 0));
++		PLUGIN_DEBUG("Casting (long) \"%s\" -- %lu\n", id_str.c_str(), strtoul(id_str.c_str(), NULL, 0));
+ 		ptr = reinterpret_cast <void*> ((unsigned long)  strtoul(id_str.c_str(), NULL, 0));
+ 	}
+ 
+-	PLUGIN_DEBUG_1ARG("Casted: %p\n", ptr);
++	PLUGIN_DEBUG("Casted: %p\n", ptr);
+ 
+ 	return ptr;
+ }
+@@ -200,15 +200,15 @@
+     void* ptr;
+     if (sizeof(void*) == sizeof(long long))
+     {
+-        PLUGIN_DEBUG_2ARG("Casting (long long) \"%s\" -- %llu\n", id_str->c_str(), strtoull(id_str->c_str(), NULL, 0));
++        PLUGIN_DEBUG("Casting (long long) \"%s\" -- %llu\n", id_str->c_str(), strtoull(id_str->c_str(), NULL, 0));
+         ptr = reinterpret_cast <void*> ((unsigned long long) strtoull(id_str->c_str(), NULL, 0));
+     } else
+     {
+-        PLUGIN_DEBUG_2ARG("Casting (long) \"%s\" -- %lu\n", id_str->c_str(), strtoul(id_str->c_str(), NULL, 0));
++        PLUGIN_DEBUG("Casting (long) \"%s\" -- %lu\n", id_str->c_str(), strtoul(id_str->c_str(), NULL, 0));
+         ptr = reinterpret_cast <void*> ((unsigned long)  strtoul(id_str->c_str(), NULL, 0));
+     }
+ 
+-    PLUGIN_DEBUG_1ARG("Casted: %p\n", ptr);
++    PLUGIN_DEBUG("Casted: %p\n", ptr);
+ 
+     return ptr;
+ }
+@@ -344,7 +344,7 @@
+ 	for (int i = begin; i < begin+length; i++)
+ 	    result_unicode_str->push_back((char) strtol(unicode_byte_array->at(i)->c_str(), NULL, 16));
+ 
+-	PLUGIN_DEBUG_2ARG("Converted UTF-8 string: %s. Length=%d\n", result_unicode_str->c_str(), result_unicode_str->length());
++	PLUGIN_DEBUG("Converted UTF-8 string: %s. Length=%d\n", result_unicode_str->c_str(), result_unicode_str->length());
+ }
+ 
+ /**
+@@ -381,7 +381,7 @@
+ 	*utf_str = ostream.str();
+ 
+ 	free(hex_value);
+-	PLUGIN_DEBUG_2ARG("Converted %s to UTF-8 string %s\n", str->c_str(), utf_str->c_str());
++	PLUGIN_DEBUG("Converted %s to UTF-8 string %s\n", str->c_str(), utf_str->c_str());
+ }
+ 
+ /**
+@@ -451,7 +451,7 @@
+ 
+ 	*str += " }";
+ 
+-	PLUGIN_DEBUG_2ARG("%s %s\n", prefix, str->c_str());
++	PLUGIN_DEBUG("%s %s\n", prefix, str->c_str());
+ 
+ 	delete str;
+ }
+@@ -483,7 +483,7 @@
+ void
+ IcedTeaPluginUtilities::storeInstanceID(void* member_ptr, NPP instance)
+ {
+-    PLUGIN_DEBUG_2ARG("Storing instance %p with key %p\n", instance, member_ptr);
++    PLUGIN_DEBUG("Storing instance %p with key %p\n", instance, member_ptr);
+     instance_map->insert(std::make_pair(member_ptr, instance));
+ }
+ 
+@@ -496,7 +496,7 @@
+ void
+ IcedTeaPluginUtilities::removeInstanceID(void* member_ptr)
+ {
+-    PLUGIN_DEBUG_1ARG("Removing key %p from instance map\n", member_ptr);
++    PLUGIN_DEBUG("Removing key %p from instance map\n", member_ptr);
+     instance_map->erase(member_ptr);
+ }
+ 
+@@ -506,7 +506,7 @@
+ void
+ IcedTeaPluginUtilities::invalidateInstance(NPP instance)
+ {
+-    PLUGIN_DEBUG_1ARG("Invalidating instance %p\n", instance);
++    PLUGIN_DEBUG("Invalidating instance %p\n", instance);
+ 
+     std::map<void*,NPP>::iterator iterator;
+ 
+@@ -531,14 +531,14 @@
+ {
+ 
+     NPP instance = NULL;
+-    PLUGIN_DEBUG_1ARG("getInstanceFromMemberPtr looking for %p\n", member_ptr);
++    PLUGIN_DEBUG("getInstanceFromMemberPtr looking for %p\n", member_ptr);
+ 
+     std::map<void*, NPP>::iterator iterator = instance_map->find(member_ptr);
+ 
+     if (iterator != instance_map->end())
+     {
+         instance = instance_map->find(member_ptr)->second;
+-        PLUGIN_DEBUG_2ARG("getInstanceFromMemberPtr found %p. Instance = %p\n", member_ptr, instance);
++        PLUGIN_DEBUG("getInstanceFromMemberPtr found %p. Instance = %p\n", member_ptr, instance);
+     }
+ 
+     return instance;
+@@ -556,7 +556,7 @@
+ {
+ 
+     NPObject* object = NULL;
+-    PLUGIN_DEBUG_1ARG("getNPObjectFromJavaKey looking for %s\n", key.c_str());
++    PLUGIN_DEBUG("getNPObjectFromJavaKey looking for %s\n", key.c_str());
+ 
+     std::map<std::string, NPObject*>::iterator iterator = object_map->find(key);
+ 
+@@ -567,7 +567,7 @@
+         if (getInstanceFromMemberPtr(mapped_object) != NULL)
+         {
+             object = mapped_object;
+-            PLUGIN_DEBUG_2ARG("getNPObjectFromJavaKey found %s. NPObject = %p\n", key.c_str(), object);
++            PLUGIN_DEBUG("getNPObjectFromJavaKey found %s. NPObject = %p\n", key.c_str(), object);
+         }
+     }
+ 
+@@ -584,7 +584,7 @@
+ void
+ IcedTeaPluginUtilities::storeObjectMapping(std::string key, NPObject* object)
+ {
+-    PLUGIN_DEBUG_2ARG("Storing object %p with key %s\n", object, key.c_str());
++    PLUGIN_DEBUG("Storing object %p with key %s\n", object, key.c_str());
+     object_map->insert(std::make_pair(key, object));
+ }
+ 
+@@ -597,7 +597,7 @@
+ void
+ IcedTeaPluginUtilities::removeObjectMapping(std::string key)
+ {
+-    PLUGIN_DEBUG_1ARG("Removing key %s from object map\n", key.c_str());
++    PLUGIN_DEBUG("Removing key %s from object map\n", key.c_str());
+     object_map->erase(key);
+ }
+ 
+@@ -627,7 +627,7 @@
+ 
+ 	*str += " }";
+ 
+-	PLUGIN_DEBUG_2ARG("%s %s\n", prefix, str->c_str());
++	PLUGIN_DEBUG("%s %s\n", prefix, str->c_str());
+ 
+ 	delete str;
+ }
+@@ -641,35 +641,35 @@
+ 
+     if (NPVARIANT_IS_VOID(variant))
+     {
+-    	PLUGIN_DEBUG_1ARG("VOID %d\n", variant);
++    	PLUGIN_DEBUG("VOID %d\n", variant);
+     }
+     else if (NPVARIANT_IS_NULL(variant))
+     {
+-    	PLUGIN_DEBUG_1ARG("NULL\n", variant);
++    	PLUGIN_DEBUG("NULL\n", variant);
+     }
+     else if (NPVARIANT_IS_BOOLEAN(variant))
+     {
+-    	PLUGIN_DEBUG_1ARG("BOOL: %d\n", NPVARIANT_TO_BOOLEAN(variant));
++    	PLUGIN_DEBUG("BOOL: %d\n", NPVARIANT_TO_BOOLEAN(variant));
+     }
+     else if (NPVARIANT_IS_INT32(variant))
+     {
+-    	PLUGIN_DEBUG_1ARG("INT32: %d\n", NPVARIANT_TO_INT32(variant));
++    	PLUGIN_DEBUG("INT32: %d\n", NPVARIANT_TO_INT32(variant));
+     }
+     else if (NPVARIANT_IS_DOUBLE(variant))
+     {
+-    	PLUGIN_DEBUG_1ARG("DOUBLE: %f\n", NPVARIANT_TO_DOUBLE(variant));
++    	PLUGIN_DEBUG("DOUBLE: %f\n", NPVARIANT_TO_DOUBLE(variant));
+     }
+     else if (NPVARIANT_IS_STRING(variant))
+     {
+ #if MOZILLA_VERSION_COLLAPSED < 1090200
+-    	PLUGIN_DEBUG_1ARG("STRING: %s\n", NPVARIANT_TO_STRING(variant).utf8characters);
++    	PLUGIN_DEBUG("STRING: %s\n", NPVARIANT_TO_STRING(variant).utf8characters);
+ #else
+-    	PLUGIN_DEBUG_1ARG("STRING: %s\n", NPVARIANT_TO_STRING(variant).UTF8Characters);
++    	PLUGIN_DEBUG("STRING: %s\n", NPVARIANT_TO_STRING(variant).UTF8Characters);
+ #endif
+     }
+     else
+     {
+-    	PLUGIN_DEBUG_1ARG("OBJ: %p\n", NPVARIANT_TO_OBJECT(variant));
++    	PLUGIN_DEBUG("OBJ: %p\n", NPVARIANT_TO_OBJECT(variant));
+     }
+ }
+ 
+@@ -738,19 +738,19 @@
+ 
+         if (value == "void")
+         {
+-            PLUGIN_DEBUG_0ARG("Method call returned void\n");
++            PLUGIN_DEBUG("Method call returned void\n");
+             VOID_TO_NPVARIANT(*variant);
+         } else if (value == "null")
+         {
+-            PLUGIN_DEBUG_0ARG("Method call returned null\n");
++            PLUGIN_DEBUG("Method call returned null\n");
+             NULL_TO_NPVARIANT(*variant);
+         }else if (value == "true")
+         {
+-            PLUGIN_DEBUG_0ARG("Method call returned a boolean (true)\n");
++            PLUGIN_DEBUG("Method call returned a boolean (true)\n");
+             BOOLEAN_TO_NPVARIANT(true, *variant);
+         } else if (value == "false")
+         {
+-            PLUGIN_DEBUG_0ARG("Method call returned a boolean (false)\n");
++            PLUGIN_DEBUG("Method call returned a boolean (false)\n");
+             BOOLEAN_TO_NPVARIANT(false, *variant);
+         } else
+         {
+@@ -761,12 +761,12 @@
+                 d < -(0x7fffffffL - 1L) ||
+                 d > 0x7fffffffL)
+             {
+-                PLUGIN_DEBUG_1ARG("Method call returned a double %f\n", d);
++                PLUGIN_DEBUG("Method call returned a double %f\n", d);
+                 DOUBLE_TO_NPVARIANT(d, *variant);
+             } else
+             {
+                 int32_t i = (int32_t) d;
+-                PLUGIN_DEBUG_1ARG("Method call returned an int %d\n", i);
++                PLUGIN_DEBUG("Method call returned an int %d\n", i);
+                 INT32_TO_NPVARIANT(i, *variant);
+             }
+         }
+@@ -803,7 +803,7 @@
+             NPUTF8* return_str = (NPUTF8*) malloc(sizeof(NPUTF8)*java_result->return_string->size() + 1);
+             strcpy(return_str, java_result->return_string->c_str());
+ 
+-            PLUGIN_DEBUG_1ARG("Method call returned a string: \"%s\"\n", return_str);
++            PLUGIN_DEBUG("Method call returned a string: \"%s\"\n", return_str);
+             STRINGZ_TO_NPVARIANT(return_str, *variant);
+ 
+         } else {
+@@ -865,7 +865,7 @@
+     constructor_name.append(NPVARIANT_TO_STRING(constructor_str).UTF8Characters);
+ #endif
+ 
+-    PLUGIN_DEBUG_1ARG("Constructor for NPObject is %s\n", constructor_name.c_str());
++    PLUGIN_DEBUG("Constructor for NPObject is %s\n", constructor_name.c_str());
+ 
+     return constructor_name.find("function Array") == 0;
+ }
+@@ -874,7 +874,7 @@
+ IcedTeaPluginUtilities::decodeURL(const gchar* url, gchar** decoded_url)
+ {
+ 
+-    PLUGIN_DEBUG_2ARG("GOT URL: %s -- %s\n", url, *decoded_url);
++    PLUGIN_DEBUG("GOT URL: %s -- %s\n", url, *decoded_url);
+     int length = strlen(url);
+     for (int i=0; i < length; i++)
+     {
+@@ -903,7 +903,7 @@
+         }
+     }
+ 
+-    PLUGIN_DEBUG_1ARG("SENDING URL: %s\n", *decoded_url);
++    PLUGIN_DEBUG("SENDING URL: %s\n", *decoded_url);
+ }
+ 
+ /******************************************
+@@ -951,13 +951,13 @@
+ 	ret = pthread_mutex_init(&subscriber_mutex, NULL);
+ 
+ 	if(ret)
+-		PLUGIN_DEBUG_1ARG("Error: Unable to initialize subscriber mutex: %d\n", ret);
++		PLUGIN_DEBUG("Error: Unable to initialize subscriber mutex: %d\n", ret);
+ 
+ 	ret = pthread_mutex_init(&msg_queue_mutex, NULL);
+ 	if(ret)
+-		PLUGIN_DEBUG_1ARG("Error: Unable to initialize message queue mutex: %d\n", ret);
++		PLUGIN_DEBUG("Error: Unable to initialize message queue mutex: %d\n", ret);
+ 
+-	PLUGIN_DEBUG_2ARG("Mutexs %p and %p initialized\n", &subscriber_mutex, &msg_queue_mutex);
++	PLUGIN_DEBUG("Mutexs %p and %p initialized\n", &subscriber_mutex, &msg_queue_mutex);
+ }
+ 
+ /**
+@@ -968,17 +968,17 @@
+ 
+ MessageBus::~MessageBus()
+ {
+-    PLUGIN_DEBUG_0ARG("MessageBus::~MessageBus\n");
++    PLUGIN_DEBUG("MessageBus::~MessageBus\n");
+ 
+ 	int ret;
+ 
+ 	ret = pthread_mutex_destroy(&subscriber_mutex);
+ 	if(ret)
+-		PLUGIN_DEBUG_1ARG("Error: Unable to destroy subscriber mutex: %d\n", ret);
++		PLUGIN_DEBUG("Error: Unable to destroy subscriber mutex: %d\n", ret);
+ 
+ 	ret = pthread_mutex_destroy(&msg_queue_mutex);
+ 	if(ret)
+-			PLUGIN_DEBUG_1ARG("Error: Unable to destroy message queue mutex: %d\n", ret);
++			PLUGIN_DEBUG("Error: Unable to destroy message queue mutex: %d\n", ret);
+ }
+ 
+ /**
+@@ -991,7 +991,7 @@
+ {
+     // Applets may initialize in parallel. So lock before pushing.
+ 
+-	PLUGIN_DEBUG_2ARG("Subscribing %p to bus %p\n", b, this);
++	PLUGIN_DEBUG("Subscribing %p to bus %p\n", b, this);
+     pthread_mutex_lock(&subscriber_mutex);
+     subscribers.push_back(b);
+     pthread_mutex_unlock(&subscriber_mutex);
+@@ -1007,7 +1007,7 @@
+ {
+     // Applets may initialize in parallel. So lock before pushing.
+ 
+-	PLUGIN_DEBUG_2ARG("Un-subscribing %p from bus %p\n", b, this);
++	PLUGIN_DEBUG("Un-subscribing %p from bus %p\n", b, this);
+     pthread_mutex_lock(&subscriber_mutex);
+     subscribers.remove(b);
+     pthread_mutex_unlock(&subscriber_mutex);
+@@ -1027,21 +1027,21 @@
+ 	// consumer frees this memory
+ 	strcpy(msg, message);
+ 
+-	PLUGIN_DEBUG_1ARG("Trying to lock %p...\n", &msg_queue_mutex);
++	PLUGIN_DEBUG("Trying to lock %p...\n", &msg_queue_mutex);
+ 	pthread_mutex_lock(&subscriber_mutex);
+ 
+-    PLUGIN_DEBUG_1ARG("Message %s received on bus. Notifying subscribers.\n", msg);
++    PLUGIN_DEBUG("Message %s received on bus. Notifying subscribers.\n", msg);
+ 
+     std::list<BusSubscriber*>::const_iterator i;
+     for( i = subscribers.begin(); i != subscribers.end() && !message_consumed; ++i ) {
+-    	PLUGIN_DEBUG_2ARG("Notifying subscriber %p of %s\n", *i, msg);
++    	PLUGIN_DEBUG("Notifying subscriber %p of %s\n", *i, msg);
+     	message_consumed = ((BusSubscriber*) *i)->newMessageOnBus(msg);
+     }
+ 
+     pthread_mutex_unlock(&subscriber_mutex);
+ 
+     if (!message_consumed)
+-    	PLUGIN_DEBUG_1ARG("Warning: No consumer found for message %s\n", msg);
++    	PLUGIN_DEBUG("Warning: No consumer found for message %s\n", msg);
+ 
+-    PLUGIN_DEBUG_1ARG("%p unlocked...\n", &msg_queue_mutex);
++    PLUGIN_DEBUG("%p unlocked...\n", &msg_queue_mutex);
+ }
+diff -r d1ad52447673 plugin/icedteanp/IcedTeaPluginUtils.h
+--- a/plugin/icedteanp/IcedTeaPluginUtils.h	Wed Apr 14 12:21:30 2010 +0200
++++ b/plugin/icedteanp/IcedTeaPluginUtils.h	Tue Jul 20 16:36:52 2010 +0200
+@@ -66,64 +66,14 @@
+ 
+ #include "IcedTeaNPPlugin.h"
+ 
+-#define PLUGIN_DEBUG_0ARG(str) \
+-  do                                        \
+-  {                                         \
+-    if (plugin_debug)                       \
+-    {                                       \
+-      fprintf(stderr, "ICEDTEA NP PLUGIN: thread %p: ", pthread_self()); \
+-      fprintf(stderr, str);                \
+-    }                                       \
+-  } while (0)
+-
+-#define PLUGIN_DEBUG_1ARG(str, arg1) \
+-  do                                        \
+-  {                                         \
+-    if (plugin_debug)                       \
+-    {                                       \
+-      fprintf(stderr, "ICEDTEA NP PLUGIN: thread %p: ", pthread_self()); \
+-      fprintf(stderr, str, arg1);          \
+-    }                                       \
+-  } while (0)
+-
+-#define PLUGIN_DEBUG_2ARG(str, arg1, arg2)  \
+-  do                                        \
+-  {                                         \
+-    if (plugin_debug)                       \
+-    {                                       \
+-      fprintf(stderr, "ICEDTEA NP PLUGIN: thread %p: ", pthread_self()); \
+-      fprintf(stderr, str, arg1, arg2);    \
+-    }                                       \
+-  } while (0)
+-
+-#define PLUGIN_DEBUG_3ARG(str, arg1, arg2, arg3) \
+-  do                                           \
+-  {                                            \
+-    if (plugin_debug)                          \
+-    {                                          \
+-      fprintf(stderr, "ICEDTEA NP PLUGIN: thread %p: ", pthread_self()); \
+-      fprintf(stderr, str, arg1, arg2, arg3); \
+-    }                                          \
+-  } while (0)
+-
+-#define PLUGIN_DEBUG_4ARG(str, arg1, arg2, arg3, arg4) \
+-  do                                                 \
+-  {                                                  \
+-    if (plugin_debug)                                \
+-    {                                                \
+-      fprintf(stderr, "ICEDTEA NP PLUGIN: thread %p: ", pthread_self()); \
+-      fprintf(stderr, str, arg1, arg2, arg3, arg4); \
+-    }                                                \
+-  } while (0)
+-
+-#define PLUGIN_DEBUG_5ARG(str, arg1, arg2, arg3, arg4, arg5) \
+-  do                                                 \
+-  {                                                  \
+-    if (plugin_debug)                                \
+-    {                                                \
+-      fprintf(stderr, "ICEDTEA NP PLUGIN: thread %p: ", pthread_self()); \
+-      fprintf(stderr, str, arg1, arg2, arg3, arg4, arg5); \
+-    }                                                \
++#define PLUGIN_DEBUG(...) \
++  do                                                          \
++  {                                                           \
++    if (plugin_debug)                                         \
++    {                                                         \
++      fprintf (stderr, "ITNPP Thread# %ld: ", pthread_self()); \
++      fprintf (stderr, __VA_ARGS__);                          \
++    }                                                         \
+   } while (0)
+ 
+ #define CHECK_JAVA_RESULT(result_data)                               \
+@@ -137,8 +87,8 @@
+ }
+ 
+ #define HEX_TO_INT(c) \
+-    ((*c >= 'A') ? *c - 'A' + 10 : \
+-     (*c >= 'a') ? *c - 'a' + 10 : \
++    ((*c >= 'a') ? *c - 'a' + 10 : \
++     (*c >= 'A') ? *c - 'A' + 10 : \
+      *c - '0')
+ 
+ #define IS_VALID_HEX(c) \
+diff -r d1ad52447673 plugin/icedteanp/IcedTeaScriptablePluginObject.cc
+--- a/plugin/icedteanp/IcedTeaScriptablePluginObject.cc	Wed Apr 14 12:21:30 2010 +0200
++++ b/plugin/icedteanp/IcedTeaScriptablePluginObject.cc	Tue Jul 20 16:36:52 2010 +0200
+@@ -135,7 +135,7 @@
+ NPObject*
+ allocate_scriptable_jp_object(NPP npp, NPClass *aClass)
+ {
+-    PLUGIN_DEBUG_0ARG("Allocating new scriptable Java Package object\n");
++    PLUGIN_DEBUG("Allocating new scriptable Java Package object\n");
+     return new IcedTeaScriptableJavaPackageObject(npp);
+ }
+ 
+@@ -161,7 +161,7 @@
+ 	np_class->construct = IcedTeaScriptableJavaPackageObject::construct;
+ 
+ 	scriptable_object = browser_functions.createobject(instance, np_class);
+-	PLUGIN_DEBUG_3ARG("Returning new scriptable package class: %p from instance %p with name %s\n", scriptable_object, instance, name);
++	PLUGIN_DEBUG("Returning new scriptable package class: %p from instance %p with name %s\n", scriptable_object, instance, name);
+ 
+     ((IcedTeaScriptableJavaPackageObject*) scriptable_object)->setPackageName(name);
+ 
+@@ -172,7 +172,7 @@
+ 
+ IcedTeaScriptableJavaPackageObject::IcedTeaScriptableJavaPackageObject(NPP instance)
+ {
+-    PLUGIN_DEBUG_0ARG("Constructing new scriptable java package object\n");
++    PLUGIN_DEBUG("Constructing new scriptable java package object\n");
+ 	this->instance = instance;
+ 	this->package_name = new std::string();
+ }
+@@ -232,7 +232,7 @@
+ bool
+ IcedTeaScriptableJavaPackageObject::hasProperty(NPObject *npobj, NPIdentifier name)
+ {
+-	PLUGIN_DEBUG_1ARG("IcedTeaScriptableJavaPackageObject::hasProperty %s\n", browser_functions.utf8fromidentifier(name));
++	PLUGIN_DEBUG("IcedTeaScriptableJavaPackageObject::hasProperty %s\n", browser_functions.utf8fromidentifier(name));
+ 
+ 	bool hasProperty = false;
+ 	JavaResultData* java_result;
+@@ -240,7 +240,7 @@
+     NPP instance = IcedTeaPluginUtilities::getInstanceFromMemberPtr(npobj);
+     int plugin_instance_id = get_id_from_instance(instance);
+ 
+-	PLUGIN_DEBUG_1ARG("Object package name: \"%s\"\n", ((IcedTeaScriptableJavaPackageObject*) npobj)->getPackageName().c_str());
++	PLUGIN_DEBUG("Object package name: \"%s\"\n", ((IcedTeaScriptableJavaPackageObject*) npobj)->getPackageName().c_str());
+ 
+ 	// "^java" is always a package
+ 	if (((IcedTeaScriptableJavaPackageObject*) npobj)->getPackageName().length() == 0 &&
+@@ -255,7 +255,7 @@
+ 	    property_name += ".";
+ 	property_name += browser_functions.utf8fromidentifier(name);
+ 
+-	PLUGIN_DEBUG_1ARG("Looking for name \"%s\"\n", property_name.c_str());
++	PLUGIN_DEBUG("Looking for name \"%s\"\n", property_name.c_str());
+ 
+ 	java_result = java_request->hasPackage(plugin_instance_id, property_name);
+ 
+@@ -278,7 +278,7 @@
+ IcedTeaScriptableJavaPackageObject::getProperty(NPObject *npobj, NPIdentifier name, NPVariant *result)
+ {
+ 
+-	PLUGIN_DEBUG_1ARG("IcedTeaScriptableJavaPackageObject::getProperty %s\n", browser_functions.utf8fromidentifier(name));
++	PLUGIN_DEBUG("IcedTeaScriptableJavaPackageObject::getProperty %s\n", browser_functions.utf8fromidentifier(name));
+ 
+ 	if (!browser_functions.utf8fromidentifier(name))
+ 	    return false;
+@@ -303,14 +303,14 @@
+ 
+ 	if (isPropertyClass)
+ 	{
+-		PLUGIN_DEBUG_0ARG("Returning package object\n");
++		PLUGIN_DEBUG("Returning package object\n");
+ 		obj = IcedTeaScriptablePluginObject::get_scriptable_java_package_object(
+                                   IcedTeaPluginUtilities::getInstanceFromMemberPtr(npobj),
+                                   property_name.c_str());
+ 	}
+ 	else
+ 	{
+-		PLUGIN_DEBUG_0ARG("Returning Java object\n");
++		PLUGIN_DEBUG("Returning Java object\n");
+ 		obj = IcedTeaScriptableJavaPackageObject::get_scriptable_java_object(
+ 		                IcedTeaPluginUtilities::getInstanceFromMemberPtr(npobj),
+ 		                *(java_result->return_string), "0", false);
+@@ -353,7 +353,7 @@
+ NPObject*
+ allocate_scriptable_java_object(NPP npp, NPClass *aClass)
+ {
+-    PLUGIN_DEBUG_0ARG("Allocating new scriptable Java object\n");
++    PLUGIN_DEBUG("Allocating new scriptable Java object\n");
+     return new IcedTeaScriptableJavaObject(npp);
+ }
+ 
+@@ -370,12 +370,12 @@
+     obj_key += ":";
+     obj_key += instance_id;
+ 
+-    PLUGIN_DEBUG_1ARG("get_scriptable_java_object searching for %s...\n", obj_key.c_str());
++    PLUGIN_DEBUG("get_scriptable_java_object searching for %s...\n", obj_key.c_str());
+     scriptable_object = IcedTeaPluginUtilities::getNPObjectFromJavaKey(obj_key);
+ 
+     if (scriptable_object != NULL)
+     {
+-        PLUGIN_DEBUG_1ARG("Returning existing object %p\n", scriptable_object);
++        PLUGIN_DEBUG("Returning existing object %p\n", scriptable_object);
+         browser_functions.retainobject(scriptable_object);
+         return scriptable_object;
+     }
+@@ -420,7 +420,7 @@
+         browser_functions.retainobject(scriptable_object);
+     }
+ 
+-    PLUGIN_DEBUG_4ARG("Constructed new Java Object with classid=%s, instanceid=%s, isArray=%d and scriptable_object=%p\n", class_id.c_str(), instance_id.c_str(), isArray, scriptable_object);
++    PLUGIN_DEBUG("Constructed new Java Object with classid=%s, instanceid=%s, isArray=%d and scriptable_object=%p\n", class_id.c_str(), instance_id.c_str(), isArray, scriptable_object);
+ 
+ 	((IcedTeaScriptableJavaObject*) scriptable_object)->setClassIdentifier(class_id);
+     ((IcedTeaScriptableJavaObject*) scriptable_object)->setIsArray(isArray);
+@@ -431,7 +431,7 @@
+ 	IcedTeaPluginUtilities::storeInstanceID(scriptable_object, instance);
+ 	IcedTeaPluginUtilities::storeObjectMapping(obj_key, scriptable_object);
+ 
+-	PLUGIN_DEBUG_2ARG("Inserting into object_map key %s->%p\n", obj_key.c_str(), scriptable_object);
++	PLUGIN_DEBUG("Inserting into object_map key %s->%p\n", obj_key.c_str(), scriptable_object);
+ 	return scriptable_object;
+ }
+ 
+@@ -439,7 +439,7 @@
+ void
+ _createAndRetainJavaObject(void* data)
+ {
+-    PLUGIN_DEBUG_0ARG("Asynchronously creating/retaining object ...\n");
++    PLUGIN_DEBUG("Asynchronously creating/retaining object ...\n");
+ 
+     std::vector<void*> parameters = ((AsyncCallThreadData*) data)->parameters;
+     NPP instance = (NPP) parameters.at(0);
+@@ -510,7 +510,7 @@
+ bool
+ IcedTeaScriptableJavaObject::hasMethod(NPObject *npobj, NPIdentifier name)
+ {
+-    PLUGIN_DEBUG_2ARG("IcedTeaScriptableJavaObject::hasMethod %s (ival=%d)\n", browser_functions.utf8fromidentifier(name), browser_functions.intfromidentifier(name));
++    PLUGIN_DEBUG("IcedTeaScriptableJavaObject::hasMethod %s (ival=%d)\n", browser_functions.utf8fromidentifier(name), browser_functions.intfromidentifier(name));
+     bool hasMethod = false;
+ 
+     // If object is an array and requested "method" may be a number, check for it first
+@@ -531,7 +531,7 @@
+         hasMethod = java_result->return_identifier != 0;
+     }
+ 
+-    PLUGIN_DEBUG_1ARG("IcedTeaScriptableJavaObject::hasMethod returning %d\n", hasMethod);
++    PLUGIN_DEBUG("IcedTeaScriptableJavaObject::hasMethod returning %d\n", hasMethod);
+     return hasMethod;
+ }
+ 
+@@ -542,7 +542,7 @@
+     NPUTF8* method_name = browser_functions.utf8fromidentifier(name);
+ 
+     // Extract arg type array
+-    PLUGIN_DEBUG_1ARG("IcedTeaScriptableJavaObject::invoke %s. Args follow.\n", method_name);
++    PLUGIN_DEBUG("IcedTeaScriptableJavaObject::invoke %s. Args follow.\n", method_name);
+     for (int i=0; i < argCount; i++)
+     {
+         IcedTeaPluginUtilities::printNPVariant(args[i]);
+@@ -577,14 +577,14 @@
+ 
+     if (instance_id.length() == 0) // Static
+     {
+-        PLUGIN_DEBUG_0ARG("Calling static method\n");
++        PLUGIN_DEBUG("Calling static method\n");
+         callee = ((IcedTeaScriptableJavaObject*) npobj)->getClassID();
+         java_result = java_request.callStaticMethod(
+                         IcedTeaPluginUtilities::getSourceFromInstance(instance),
+                         callee, browser_functions.utf8fromidentifier(name), arg_ids);
+     } else
+     {
+-        PLUGIN_DEBUG_0ARG("Calling method normally\n");
++        PLUGIN_DEBUG("Calling method normally\n");
+         callee = ((IcedTeaScriptableJavaObject*) npobj)->getInstanceID();
+         java_result = java_request.callMethod(
+                         IcedTeaPluginUtilities::getSourceFromInstance(instance),
+@@ -600,7 +600,7 @@
+         return false;
+     }
+ 
+-    PLUGIN_DEBUG_0ARG("IcedTeaScriptableJavaObject::invoke converting and returning.\n");
++    PLUGIN_DEBUG("IcedTeaScriptableJavaObject::invoke converting and returning.\n");
+     return IcedTeaPluginUtilities::javaResultToNPVariant(instance, java_result->return_string, result);
+ }
+ 
+@@ -615,7 +615,7 @@
+ bool
+ IcedTeaScriptableJavaObject::hasProperty(NPObject *npobj, NPIdentifier name)
+ {
+-    PLUGIN_DEBUG_2ARG("IcedTeaScriptableJavaObject::hasProperty %s (ival=%d)\n", browser_functions.utf8fromidentifier(name), browser_functions.intfromidentifier(name));
++    PLUGIN_DEBUG("IcedTeaScriptableJavaObject::hasProperty %s (ival=%d)\n", browser_functions.utf8fromidentifier(name), browser_functions.intfromidentifier(name));
+     bool hasProperty = false;
+ 
+     // If it is an array, only length and indexes are valid
+@@ -648,14 +648,14 @@
+         }
+     }
+ 
+-	PLUGIN_DEBUG_1ARG("IcedTeaScriptableJavaObject::hasProperty returning %d\n", hasProperty);
++	PLUGIN_DEBUG("IcedTeaScriptableJavaObject::hasProperty returning %d\n", hasProperty);
+ 	return hasProperty;
+ }
+ 
+ bool
+ IcedTeaScriptableJavaObject::getProperty(NPObject *npobj, NPIdentifier name, NPVariant *result)
+ {
+-    PLUGIN_DEBUG_2ARG("IcedTeaScriptableJavaObject::getProperty %s (ival=%d)\n", browser_functions.utf8fromidentifier(name), browser_functions.intfromidentifier(name));
++    PLUGIN_DEBUG("IcedTeaScriptableJavaObject::getProperty %s (ival=%d)\n", browser_functions.utf8fromidentifier(name), browser_functions.intfromidentifier(name));
+ 
+     bool isPropertyClass = false;
+     JavaResultData* java_result;
+@@ -730,14 +730,14 @@
+         return false;
+     }
+ 
+-    PLUGIN_DEBUG_0ARG("IcedTeaScriptableJavaObject::getProperty converting and returning.\n");
++    PLUGIN_DEBUG("IcedTeaScriptableJavaObject::getProperty converting and returning.\n");
+     return IcedTeaPluginUtilities::javaResultToNPVariant(instance, java_result->return_string, result);
+ }
+ 
+ bool
+ IcedTeaScriptableJavaObject::setProperty(NPObject *npobj, NPIdentifier name, const NPVariant *value)
+ {
+-    PLUGIN_DEBUG_2ARG("IcedTeaScriptableJavaObject::setProperty %s (ival=%d) to:\n", browser_functions.utf8fromidentifier(name), browser_functions.intfromidentifier(name));
++    PLUGIN_DEBUG("IcedTeaScriptableJavaObject::setProperty %s (ival=%d) to:\n", browser_functions.utf8fromidentifier(name), browser_functions.intfromidentifier(name));
+     IcedTeaPluginUtilities::printNPVariant(*value);
+ 
+     bool isPropertyClass = false;
+@@ -811,7 +811,7 @@
+         return false;
+     }
+ 
+-    PLUGIN_DEBUG_0ARG("IcedTeaScriptableJavaObject::setProperty returning.\n");
++    PLUGIN_DEBUG("IcedTeaScriptableJavaObject::setProperty returning.\n");
+     return true;
+ }
+ 
+@@ -834,7 +834,7 @@
+ 	           NPVariant *result)
+ {
+     // Extract arg type array
+-    PLUGIN_DEBUG_1ARG("IcedTeaScriptableJavaObject::construct %s. Args follow.\n", ((IcedTeaScriptableJavaObject*) npobj)->getClassID().c_str());
++    PLUGIN_DEBUG("IcedTeaScriptableJavaObject::construct %s. Args follow.\n", ((IcedTeaScriptableJavaObject*) npobj)->getClassID().c_str());
+     for (int i=0; i < argCount; i++)
+     {
+         IcedTeaPluginUtilities::printNPVariant(args[i]);
+@@ -892,6 +892,6 @@
+ 
+     OBJECT_TO_NPVARIANT(obj, *result);
+ 
+-    PLUGIN_DEBUG_0ARG("IcedTeaScriptableJavaObject::construct returning.\n");
++    PLUGIN_DEBUG("IcedTeaScriptableJavaObject::construct returning.\n");
+     return true;
+ }
+diff -r d1ad52447673 plugin/icedteanp/java/netscape/security/ForbiddenTargetException.java
+--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
++++ b/plugin/icedteanp/java/netscape/security/ForbiddenTargetException.java	Tue Jul 20 16:36:52 2010 +0200
+@@ -0,0 +1,52 @@
++/* ForbiddenTargetException.java
++   Copyright (C) 2010  Red Hat
++
++This file is part of IcedTea.
++
++IcedTea is free software; you can redistribute it and/or modify
++it under the terms of the GNU General Public License as published by
++the Free Software Foundation; either version 2, or (at your option)
++any later version.
++
++IcedTea is distributed in the hope that it will be useful, but
++WITHOUT ANY WARRANTY; without even the implied warranty of
++MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++General Public License for more details.
++
++You should have received a copy of the GNU General Public License
++along with IcedTea; see the file COPYING.  If not, write to the
++Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
++02110-1301 USA.
++
++Linking this library statically or dynamically with other modules is
++making a combined work based on this library.  Thus, the terms and
++conditions of the GNU General Public License cover the whole
++combination.
++
++As a special exception, the copyright holders of this library give you
++permission to link this library with independent modules to produce an
++executable, regardless of the license terms of these independent
++modules, and to copy and distribute the resulting executable under
++terms of your choice, provided that you also meet, for each linked
++independent module, the terms and conditions of the license of that
++module.  An independent module is a module which is not derived from
++or based on this library.  If you modify this library, you may extend
++this exception to your version of the library, but you are not
++obligated to do so.  If you do not wish to do so, delete this
++exception statement from your version. */
++
++package netscape.security;
++
++public class ForbiddenTargetException extends RuntimeException{
++
++    private static final long serialVersionUID = 1271219852541058396L;
++
++    public ForbiddenTargetException() {
++        super();
++    }
++
++    public ForbiddenTargetException(String s) {
++        super(s);
++    }
++
++}
+diff -r d1ad52447673 plugin/icedteanp/java/sun/applet/PluginAppletViewer.java
+--- a/plugin/icedteanp/java/sun/applet/PluginAppletViewer.java	Wed Apr 14 12:21:30 2010 +0200
++++ b/plugin/icedteanp/java/sun/applet/PluginAppletViewer.java	Tue Jul 20 16:36:52 2010 +0200
+@@ -1,4 +1,4 @@
+-/* VoidPluginCallRequest -- represent Java-to-JavaScript requests
++/* PluginAppletViewer -- Handles embedding of the applet panel
+    Copyright (C) 2008  Red Hat 
+ 
+ This file is part of IcedTea.
+@@ -393,8 +393,7 @@
+          if (oldFrame != null && handle == oldFrame.handle)
+              return;
+ 
+-         PluginAppletViewer newFrame = new PluginAppletViewer(handle, identifier, statusMsgStream, heightFactor, widthFactor);
+-         newFrame.panel = panel;
++         PluginAppletViewer newFrame = new PluginAppletViewer(handle, identifier, statusMsgStream, heightFactor, widthFactor, panel);
+ 
+          if (oldFrame != null) {
+              applets.remove(oldFrame.identifier);
+@@ -425,13 +424,14 @@
+       */
+      private PluginAppletViewer(long handle, final int identifier, 
+                          PrintStream statusMsgStream, double heightFactor, 
+-                         double widthFactor) {
++                         double widthFactor, AppletViewerPanel appletPanel) {
+          
+          super(handle, true);
+          this.statusMsgStream = statusMsgStream;
+          this.identifier = identifier;
+          this.proposedHeightFactor = heightFactor;
+          this.proposedWidthFactor = widthFactor;
++         this.panel = appletPanel;
+ 
+          if (!appletPanels.contains(panel))
+              appletPanels.addElement(panel);
+@@ -735,7 +735,7 @@
+                       Thread.sleep(50);
+                       wait += 50;
+                   } catch (InterruptedException ie) {
+-                      ie.printStackTrace();
++                      // just wait
+                   }
+              }
+              
+@@ -1605,10 +1605,15 @@
+          {
+              public void run()
+              {
++                 ThreadGroup tg = ((JNLPClassLoader) p.applet.getClass().getClassLoader()).getApplication().getThreadGroup();
++                
+                  appletShutdown(p);
+                  appletPanels.removeElement(p);
+                  dispose();
+ 
++                 if (tg.activeCount() > 0)
++                 tg.stop();
++
+                  if (countApplets() == 0) {
+                      appletSystemExit();
+                  }
+diff -r d1ad52447673 plugin/icedteanp/java/sun/applet/PluginMessageConsumer.java
+--- a/plugin/icedteanp/java/sun/applet/PluginMessageConsumer.java	Wed Apr 14 12:21:30 2010 +0200
++++ b/plugin/icedteanp/java/sun/applet/PluginMessageConsumer.java	Tue Jul 20 16:36:52 2010 +0200
+@@ -61,6 +61,7 @@
+ 	PluginStreamHandler streamHandler = null;
+ 	AppletSecurity as;
+ 	ConsumerThread consumerThread = new ConsumerThread();
++	private static ArrayList<Integer> processedIds = new ArrayList<Integer>();
+ 
+ 	/** 
+ 	 * Registers a reference to wait for. Responses to registered priority 
+@@ -162,15 +163,24 @@
+ 	        }
+ 	        
+ 	        registerPriorityWait("instance " + instanceNum + " handle");
+-	        registerPriorityWait("instance " + instanceNum + " width");
+ 
+-	    } else if (msgParts[2].equals("handle") || msgParts[2].equals("width")) {
++	    } else if (msgParts[2].equals("handle")) {
+ 	            Integer instanceNum = new Integer(msgParts[1]);
+ 
+ 	            // If this instance is not in init, return false immediately. 
+-	            // Handle/Width messages should NEVER go before tag messages
++	            // Handle messages should NEVER go before tag messages
+ 	            if (!isInInit(instanceNum))
+ 	                return false;
++
++		        registerPriorityWait("instance " + instanceNum + " width");
++	    } else if (msgParts[2].equals("width")) {
++	    	
++	    	// width messages cannot proceed until handle and tag have been resolved
++	    	Integer instanceNum = new Integer(msgParts[1]);
++
++	    	if (!processedIds.contains(instanceNum)) {
++                return false;
++            }
+ 	    }
+ 
+ 	    return true;
+@@ -181,8 +191,10 @@
+ 	        Iterator<Integer> i = initWorkers.keySet().iterator();
+             while (i.hasNext()) {
+                 Integer key = i.next();
+-                if (initWorkers.get(key).equals(worker))
++                if (initWorkers.get(key).equals(worker)) {
++                    processedIds.add(key);
+                     initWorkers.remove(key);
++                }
+             }
+ 	    }
+ 	    
+@@ -270,7 +282,7 @@
+ 			if (workers.size() <= MAX_WORKERS) {
+ 			    PluginMessageHandlerWorker worker = null;
+ 			    
+-			    if (workers.size() <= (MAX_WORKERS - PRIORITY_WORKERS)) {
++			    if (workers.size() < (MAX_WORKERS - PRIORITY_WORKERS)) {
+ 			        PluginDebug.debug("Cannot find free worker, creating worker " + workers.size());
+ 			        worker = new PluginMessageHandlerWorker(this, streamHandler, workers.size(), as, false);
+ 			    } else if (prioritized) {
+@@ -291,4 +303,9 @@
+ 			return null;
+ 	}
+ 	
++	private void dumpWorkerStatus() {
++		for (PluginMessageHandlerWorker worker: workers) {
++			PluginDebug.debug(worker.toString());
++		}
++	}
+ }
+diff -r d1ad52447673 plugin/icedteanp/java/sun/applet/PluginMessageHandlerWorker.java
+--- a/plugin/icedteanp/java/sun/applet/PluginMessageHandlerWorker.java	Wed Apr 14 12:21:30 2010 +0200
++++ b/plugin/icedteanp/java/sun/applet/PluginMessageHandlerWorker.java	Tue Jul 20 16:36:52 2010 +0200
+@@ -72,7 +72,7 @@
+ 
+ 			if (message != null) {
+ 				
+-			    PluginDebug.debug("Consumer thread " + id + " consuming " + message);
++			    PluginDebug.debug("Consumer (priority=" + isPriorityWorker + ") thread " + id + " consuming " + message);
+ 			    
+ 				// ideally, whoever returns things object should mark it 
+ 				// busy first, but just in case..
+@@ -90,7 +90,7 @@
+ 
+ 				this.message = null;
+ 				
+-				PluginDebug.debug("Consumption completed by consumer thread " + id);
++				PluginDebug.debug("Consumption (priority=" + isPriorityWorker + ") completed by consumer thread " + id);
+ 
+ 	            // mark ourselves free again
+ 				free();
+@@ -140,4 +140,8 @@
+ 	        return free && (prioritized == isPriorityWorker);
+ 	    }
+ 	}
++
++	public String toString() {
++		return "Worker #" + this.id + "/IsPriority=" + this.isPriorityWorker + "/IsFree=" + this.free + "/Message=" + message;  
++	}
+ }
+diff -r d1ad52447673 ports/hotspot/src/share/vm/shark/sharkNativeWrapper.cpp
+--- a/ports/hotspot/src/share/vm/shark/sharkNativeWrapper.cpp	Wed Apr 14 12:21:30 2010 +0200
++++ b/ports/hotspot/src/share/vm/shark/sharkNativeWrapper.cpp	Tue Jul 20 16:36:52 2010 +0200
+@@ -98,7 +98,8 @@
+   if (is_static()) {
+     builder()->CreateStore(
+       builder()->CreateInlineOop(
+-        JNIHandles::make_local(target()->method_holder())),
++        JNIHandles::make_local(
++        target()->method_holder()->klass_part()->java_mirror())),
+       oop_tmp_slot());
+ 
+     param_types.push_back(box_type);
+@@ -326,11 +327,11 @@
+       needs_cast = true;
+       break;
+ 
+-    case T_BYTE:
++    case T_CHAR:
+       needs_cast = true;
+       break;
+ 
+-    case T_CHAR:
++    case T_BYTE:
+     case T_SHORT:
+       needs_cast = true;
+       is_signed = true;
+diff -r d1ad52447673 ports/hotspot/src/share/vm/shark/sharkTopLevelBlock.cpp
+--- a/ports/hotspot/src/share/vm/shark/sharkTopLevelBlock.cpp	Wed Apr 14 12:21:30 2010 +0200
++++ b/ports/hotspot/src/share/vm/shark/sharkTopLevelBlock.cpp	Tue Jul 20 16:36:52 2010 +0200
+@@ -691,12 +691,6 @@
+   SharkValue *index = pop();
+   SharkValue *array = pop();
+ 
+-  assert(array->type()->is_array_klass(), "should be");
+-  ciType *element_type = ((ciArrayKlass *) array->type())->element_type();
+-  assert((element_type->basic_type() == T_BOOLEAN && basic_type == T_BYTE) ||
+-         (element_type->basic_type() == T_ARRAY && basic_type == T_OBJECT) ||
+-         (element_type->basic_type() == basic_type), "type mismatch");
+-
+   check_null(array);
+   check_bounds(array, index);
+ 
+@@ -729,7 +723,21 @@
+     break;
+ 
+   case T_OBJECT:
+-    push(SharkValue::create_generic(element_type, value, false));
++    // You might expect that array->type()->is_array_klass() would
++    // always be true, but it isn't.  If ciTypeFlow detects that a
++    // value is always null then that value becomes an untyped null
++    // object.  Shark doesn't presently support this, so a generic
++    // T_OBJECT is created.  In this case we guess the type using
++    // the BasicType we were supplied.  In reality the generated
++    // code will never be used, as the null value will be caught
++    // by the above null pointer check.
++    // http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=324
++    push(
++      SharkValue::create_generic(
++        array->type()->is_array_klass() ?
++          ((ciArrayKlass *) array->type())->element_type() :
++          ciType::make(basic_type),
++        value, false));
+     break;
+ 
+   default:
+@@ -743,12 +751,6 @@
+   SharkValue *index  = pop();
+   SharkValue *array  = pop();
+ 
+-  assert(array->type()->is_array_klass(), "should be");
+-  ciType *element_type = ((ciArrayKlass *) array->type())->element_type();
+-  assert((element_type->basic_type() == T_BOOLEAN && basic_type == T_BYTE) ||
+-         (element_type->basic_type() == T_ARRAY && basic_type == T_OBJECT) ||
+-         (element_type->basic_type() == basic_type), "type mismatch");
+-
+   check_null(array);
+   check_bounds(array, index);
+ 
+@@ -792,7 +794,7 @@
+ 
+   builder()->CreateStore(value, addr);
+ 
+-  if (!element_type->is_primitive_type())
++  if (basic_type == T_OBJECT) // XXX or T_ARRAY?
+     builder()->CreateUpdateBarrierSet(oopDesc::bs(), addr);
+ }
+ 
+@@ -901,6 +903,18 @@
+       dest_method->holder() == java_lang_Object_klass())
+     return dest_method;
+ 
++#ifdef SHARK_CAN_DEOPTIMIZE_ANYWHERE
++  // This code can replace a virtual call with a direct call if this
++  // class is the only one in the entire set of loaded classes that
++  // implements this method.  This makes the compiled code dependent
++  // on other classes that implement the method not being loaded, a
++  // condition which is enforced by the dependency tracker.  If the
++  // dependency tracker determines a method has become invalid it
++  // will mark it for recompilation, causing running copies to be
++  // deoptimized.  Shark currently can't deoptimize arbitrarily like
++  // that, so this optimization cannot be used.
++  // http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=481
++  
+   // All other interesting cases are instance classes
+   if (!receiver_type->is_instance_klass())
+     return NULL;
+@@ -956,6 +970,8 @@
+   // with non-monomorphic targets if the receiver has an exact
+   // type.  We don't mark types this way, so we can't do this.
+ 
++#endif // SHARK_CAN_DEOPTIMIZE_ANYWHERE
++
+   return NULL;
+ }
+ 
+diff -r d1ad52447673 pulseaudio/src/java/org/classpath/icedtea/pulseaudio/PulseAudioDataLine.java
+--- a/pulseaudio/src/java/org/classpath/icedtea/pulseaudio/PulseAudioDataLine.java	Wed Apr 14 12:21:30 2010 +0200
++++ b/pulseaudio/src/java/org/classpath/icedtea/pulseaudio/PulseAudioDataLine.java	Tue Jul 20 16:36:52 2010 +0200
+@@ -86,7 +86,7 @@
+ 	protected void open(AudioFormat format, int bufferSize)
+ 			throws LineUnavailableException {
+ 
+-		if (isOpen) {
++		if (isOpen()) {
+ 			throw new IllegalStateException("Line is already open");
+ 		}
+ 
+@@ -139,7 +139,7 @@
+ 			}
+ 		}
+ 
+-		if (!isOpen) {
++		if (!isOpen()) {
+ 			throw new IllegalArgumentException("Invalid format");
+ 		}
+ 
+@@ -299,9 +299,10 @@
+ 	@Override
+ 	public void close() {
+ 
+-		if (!isOpen) {
+-			throw new IllegalStateException(
+-					"Line must be open for close() to work");
++		if (!isOpen()) {
++			// For whatever reason, we are being asked to close
++			// a line that is not even open.
++			return;
+ 		}
+ 
+ 		synchronized (eventLoop.threadLock) {
+@@ -346,7 +347,7 @@
+ 
+ 	@Override
+ 	public void start() {
+-		if (!isOpen) {
++		if (!isOpen()) {
+ 			throw new IllegalStateException(
+ 					"Line must be open()ed before it can be start()ed");
+ 		}
+@@ -376,10 +377,10 @@
+ 
+ 	@Override
+ 	public synchronized void stop() {
+-		if (!isOpen) {
+-			throw new IllegalStateException(
+-					"Line must be open()ed before it can be start()ed");
+-
++		if (!isOpen()) {
++			// For some reason, we are being asked to stop a line
++			// that isn't even open.
++			return;
+ 		}
+ 		writeInterrupted = true;
+ 		if (!isStarted) {
+@@ -433,7 +434,7 @@
+ 			throws LineUnavailableException;
+ 
+ 	public Stream getStream() {
+-		if (!isOpen) {
++		if (!isOpen()) {
+ 			throw new IllegalStateException("Line must be open");
+ 		}
+ 
+@@ -442,7 +443,7 @@
+ 
+ 	@Override
+ 	public int getBufferSize() {
+-		if (!isOpen) {
++		if (!isOpen()) {
+ 			return DEFAULT_BUFFER_SIZE;
+ 		}
+ 		return bufferSize;
+@@ -450,7 +451,7 @@
+ 
+ 	@Override
+ 	public AudioFormat getFormat() {
+-		if (!isOpen) {
++		if (!isOpen()) {
+ 			return defaultFormat;
+ 		}
+ 		return currentFormat;
+@@ -467,7 +468,7 @@
+ 	 *            the name of this audio stream
+ 	 */
+ 	public void setName(String streamName) {
+-		if (isOpen) {
++		if (isOpen()) {
+ 
+ 			Operation o;
+ 			synchronized (eventLoop.threadLock) {
+diff -r d1ad52447673 pulseaudio/src/java/org/classpath/icedtea/pulseaudio/PulseAudioLine.java
+--- a/pulseaudio/src/java/org/classpath/icedtea/pulseaudio/PulseAudioLine.java	Wed Apr 14 12:21:30 2010 +0200
++++ b/pulseaudio/src/java/org/classpath/icedtea/pulseaudio/PulseAudioLine.java	Tue Jul 20 16:36:52 2010 +0200
+@@ -62,7 +62,7 @@
+ 
+ 	@Override
+ 	public void close() {
+-		if (!isOpen) {
++		if (!isOpen()) {
+ 			throw new IllegalStateException("Line is not open");
+ 		}
+ 
+@@ -79,7 +79,7 @@
+ 
+ 	@Override
+ 	public Control getControl(Type control) {
+-		if (isOpen) {
++		if (isOpen()) {
+ 			for (Control aControl : controls) {
+ 				if (aControl.getType() == control) {
+ 					return aControl;
+@@ -92,7 +92,7 @@
+ 
+ 	@Override
+ 	public Control[] getControls() {
+-		if (!isOpen) {
++		if (!isOpen()) {
+ 			return new Control[] {};
+ 		}
+ 
+diff -r d1ad52447673 pulseaudio/src/java/org/classpath/icedtea/pulseaudio/PulseAudioSourceDataLine.java
+--- a/pulseaudio/src/java/org/classpath/icedtea/pulseaudio/PulseAudioSourceDataLine.java	Wed Apr 14 12:21:30 2010 +0200
++++ b/pulseaudio/src/java/org/classpath/icedtea/pulseaudio/PulseAudioSourceDataLine.java	Tue Jul 20 16:36:52 2010 +0200
+@@ -142,8 +142,9 @@
+ 			writeInterrupted = false;
+ 		}
+ 
+-		if (!isOpen) {
+-			throw new IllegalStateException("must call open() before write()");
++		if (!isOpen()) {
++			// A closed line can write exactly 0 bytes.
++			return 0;
+ 		}
+ 
+ 		int frameSize = currentFormat.getFrameSize();
+@@ -259,11 +260,6 @@
+ 
+ 	@Override
+ 	public void drain() {
+-		if (!isOpen) {
+-			throw new IllegalStateException(
+-					"Line must be open before it can be drain()ed");
+-
+-		}
+ 
+ 		synchronized (this) {
+ 			writeInterrupted = true;
+@@ -271,13 +267,13 @@
+ 
+ 		do {
+ 			synchronized (this) {
+-				if (!isOpen) {
++				if (!isOpen()) {
+ 					return;
+ 				}
+ 				if (getBytesInBuffer() == 0) {
+ 					return;
+ 				}
+-				if (isStarted || !isOpen) {
++				if (isStarted) {
+ 					break;
+ 				}
+ 				try {
+@@ -301,29 +297,27 @@
+ 
+ 	@Override
+ 	public void flush() {
+-		if (!isOpen) {
+-			throw new IllegalStateException(
+-					"Line must be open before it can be flush()ed");
+-		}
+ 		synchronized (this) {
+ 			writeInterrupted = true;
+ 		}
+ 
+-		Operation operation;
+-		synchronized (eventLoop.threadLock) {
+-			operation = stream.flush();
++		if (isOpen()) {
++			Operation operation;
++			synchronized (eventLoop.threadLock) {
++				operation = stream.flush();
++			}
++
++			operation.waitForCompletion();
++			operation.releaseReference();
+ 		}
+ 
+-		operation.waitForCompletion();
+-		operation.releaseReference();
+-
+ 	}
+ 
+ 	@Override
+ 	synchronized public void close() {
+ 
+-		if (!isOpen) {
+-			throw new IllegalStateException("not open so cant close");
++		if (!isOpen()) {
++			return;
+ 		}
+ 
+ 		writeInterrupted = true;
+diff -r d1ad52447673 pulseaudio/src/java/org/classpath/icedtea/pulseaudio/PulseAudioTargetDataLine.java
+--- a/pulseaudio/src/java/org/classpath/icedtea/pulseaudio/PulseAudioTargetDataLine.java	Wed Apr 14 12:21:30 2010 +0200
++++ b/pulseaudio/src/java/org/classpath/icedtea/pulseaudio/PulseAudioTargetDataLine.java	Tue Jul 20 16:36:52 2010 +0200
+@@ -76,15 +76,19 @@
+ 
+ 	@Override
+ 	synchronized public void close() {
++		if (!isOpen()) {
++			// Probably due to some programmer error, we are being
++			// asked to close an already closed line.  Oh well.
++			Debug.println(DebugLevel.Verbose,
++					"PulseAudioTargetDataLine.close(): "
++					+ "Line closed that wasn't open.");
++			return;
++		}
++
+ 		/* check for permission to record audio */
+ 		AudioPermission perm = new AudioPermission("record", null);
+ 		perm.checkGuard(null);
+ 
+-		if (!isOpen) {
+-			throw new IllegalStateException(
+-					"Line cant be closed if it isnt open");
+-		}
+-
+ 		PulseAudioMixer parentMixer = PulseAudioMixer.getInstance();
+ 		parentMixer.removeTargetLine(this);
+ 
+@@ -101,7 +105,7 @@
+ 		AudioPermission perm = new AudioPermission("record", null);
+ 		perm.checkGuard(null);
+ 
+-		if (isOpen) {
++		if (isOpen()) {
+ 			throw new IllegalStateException("already open");
+ 		}
+ 		super.open(format, bufferSize);
+@@ -142,8 +146,9 @@
+ 
+ 		/* check state and inputs */
+ 
+-		if (!isOpen) {
+-			throw new IllegalStateException("must call open() before read()");
++		if (!isOpen()) {
++			// A closed line can produce zero bytes of data.
++			return 0;
+ 		}
+ 
+ 		int frameSize = currentFormat.getFrameSize();
+@@ -220,7 +225,7 @@
+ 		while (remainingLength != 0) {
+ 			synchronized (this) {
+ 
+-				if (!isOpen || !isStarted) {
++				if (!isOpen() || !isStarted) {
+ 					return sizeRead;
+ 				}
+ 
+@@ -287,57 +292,57 @@
+ 	@Override
+ 	public void drain() {
+ 
+-		if (!isOpen) {
+-			throw new IllegalStateException("must call open() before drain()");
++		// blocks when there is data on the line
++		// http://www.jsresources.org/faq_audio.html#stop_drain_tdl
++		while (true) {
++			synchronized (this) {
++				if (!isStarted || !isOpen()) {
++					break;
++				}
++			}
++			try {
++				//TODO: Is this the best length of sleep?
++				//Maybe in case this loop runs for a long time
++				//it would be good to switch to a longer
++				//sleep.  Like bump it up each iteration after
++				//the Nth iteration, up to a MAXSLEEP length.
++				Thread.sleep(100);
++			} catch (InterruptedException e) {
++				// do nothing
++			}
+ 		}
+ 
+ 		synchronized (this) {
+ 			drained = true;
+ 		}
+ 
+-		// blocks when there is data on the line
+-		// http://www.jsresources.org/faq_audio.html#stop_drain_tdl
+-		while (true) {
+-			synchronized (this) {
+-				if (!isStarted || !isOpen) {
+-					break;
+-				}
+-			}
+-			try {
+-				Thread.sleep(100);
+-			} catch (InterruptedException e) {
+-				// do nothing
+-			}
+-		}
+-
+ 	}
+ 
+ 	@Override
+ 	public void flush() {
+-		if (!isOpen) {
+-			throw new IllegalStateException("Line must be open");
++		if (isOpen()) {
++
++			/* flush the buffer on pulseaudio's side */
++			Operation operation;
++			synchronized (eventLoop.threadLock) {
++				operation = stream.flush();
++			}
++			operation.waitForCompletion();
++			operation.releaseReference();
+ 		}
+ 
+-		/* flush the buffer on pulseaudio's side */
+-		Operation operation;
+-		synchronized (eventLoop.threadLock) {
+-			operation = stream.flush();
+-		}
+-		operation.waitForCompletion();
+-		operation.releaseReference();
+-
+ 		synchronized (this) {
+ 			flushed = true;
+ 			/* flush the partial fragment we stored */
+ 			fragmentBuffer = null;
+ 		}
+-
+ 	}
+ 
+ 	@Override
+ 	public int available() {
+-		if (!isOpen) {
+-			throw new IllegalStateException("Line must be open");
++		if (!isOpen()) {
++			// a closed line has 0 bytes available.
++			return 0;
+ 		}
+ 
+ 		synchronized (eventLoop.threadLock) {
+diff -r d1ad52447673 tapset/hotspot.stp.in
+--- a/tapset/hotspot.stp.in	Wed Apr 14 12:21:30 2010 +0200
++++ b/tapset/hotspot.stp.in	Tue Jul 20 16:36:52 2010 +0200
+@@ -120,7 +120,7 @@
+   name = "object_alloc";
+   thread_id = $arg1;
+   class = user_string_n($arg2, $arg3);
+-  size = $arg3;
++  size = $arg4;
+   probestr = sprintf("%s(thread_id=%d,class='%s',size=0x%x)",
+                      name, thread_id, class, size);
+ }
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/mkbc_returncode.patch b/recipes/openjdk/openjdk-6-6b18-1.8/mkbc_returncode.patch
new file mode 100644
index 0000000..13280b3
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/mkbc_returncode.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/shark-arm-linux-cpu-detection.patch b/recipes/openjdk/openjdk-6-6b18-1.8/shark-arm-linux-cpu-detection.patch
new file mode 100644
index 0000000..b4a635e
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/shark-arm-linux-cpu-detection.patch
@@ -0,0 +1,112 @@
+Index: icedtea6-1.8/ports/hotspot/src/share/vm/shark/sharkCompiler.cpp
+===================================================================
+--- icedtea6-1.8.orig/ports/hotspot/src/share/vm/shark/sharkCompiler.cpp	2010-07-14 16:42:48.412103129 +0200
++++ icedtea6-1.8/ports/hotspot/src/share/vm/shark/sharkCompiler.cpp	2010-07-14 16:50:51.680282178 +0200
+@@ -32,6 +32,95 @@
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
++  // FIXME ARMv6t2 JIT is not yet supported // Features["thumb2"]=TestARMLinuxHWCAP(HWCAP_THUMBEE);
++  Features["vfp2"]=TestARMLinuxHWCAP(HWCAP_VFP);
++
++  std::string testArchKey(TestARMLinuxAT(AT_PLATFORM));
++
++  StringMap<std::string> archLinuxToLLVMMap;
++  archLinuxToLLVMMap["v4l"]="v4t";
++  archLinuxToLLVMMap["v5l"]="v5t";
++  archLinuxToLLVMMap["v6l"]="v6";
++  archLinuxToLLVMMap["v7l"]="v7a";
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/shark-build-openjdkdir.patch b/recipes/openjdk/openjdk-6-6b18-1.8/shark-build-openjdkdir.patch
new file mode 100644
index 0000000..4e89967
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/shark-build-openjdkdir.patch
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
diff --git a/recipes/openjdk/openjdk-6-6b18-1.8/zero-cmpswap-long.patch b/recipes/openjdk/openjdk-6-6b18-1.8/zero-cmpswap-long.patch
new file mode 100644
index 0000000..ca21ccf
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-6b18-1.8/zero-cmpswap-long.patch
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
diff --git a/recipes/openjdk/openjdk-6-common.inc b/recipes/openjdk/openjdk-6-common.inc
new file mode 100644
index 0000000..cbf7468
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-common.inc
@@ -0,0 +1,530 @@
+DESCRIPTION = "Java runtime based upon the OpenJDK- and Icedtea Project"
+HOMEPAGE = "http://icedtea.classpath.org"
+LICENSE  = "GPL with Classpath Exception"
+PRIORITY = "optional"
+SECTION  = "libs"
+
+# Name of the icedtea tarball and top-level directory.
+ICEDTEA = "NEEDS TO BE SET"
+
+S = "${WORKDIR}/${ICEDTEA}"
+B = "${S}/build"
+
+INC_PR = "r10"
+
+SRC_URI = "\
+  ${ICEDTEA_URI} \
+  ${OPENJDK_URI} \
+  ${JAXWS_URI} \
+  ${JAF_URI} \
+  ${JAXP_URI} \
+  ${CACAO_URI} \
+  ${OEPATCHES} \
+  ${ICEDTEAPATCHES} \
+  file://jvm.cfg \
+  "
+
+JDK_PN = "openjdk-6"
+JDK_DIR = "java-6-openjdk"
+
+PN = "${JDK_PN}-jre"
+PROVIDES = "${JDK_PN}"
+
+DEPENDS = "giflib libpng jpeg cups \
+	   xalan-j xerces-j rhino \
+	   freetype libxinerama libxt libxp libxrender libxtst libxi \
+	   ant-native alsa-lib libffi \
+	   icedtea6-native fastjar \
+           llvm2.7 cacaoh-openjdk-native \
+	 "
+
+# The OpenJDK build with interpreter optimizations for ARM depends on a binary
+# that generates constants for an assembler source file. There is no other
+# way than to generate this on a pseudo machine. Cross-compiling would not help
+# because structure sizes and/or alignment may differ.
+DEPENDS_append_arm = " qemu-native "
+
+
+FILESPATHPKG = "openjdk-6-${PV}"
+
+# For compatibility with Poky:
+FILESPATH_append = ":${FILE_DIRNAME}/openjdk-6-${PV}"
+
+FILESPATHPKG_append = ":files"
+
+# No package should directly depend on this (it should require
+# java2-runtime instead).
+PRIVATE_LIBS = "\
+	libunpack.so libverify.so libjava.so libzip.so libnpt.so \ 
+	libjava_crw_demo.so libhprof.so libnet.so libnio.so \
+	libmanagement.so libinstrument.so libjsound.so libjsoundalsa.so \
+	libj2pcsc.so libj2pkcs11.so libj2gss.so libmlib_image.so \
+	libawt.so libsplashscreen.so libfreetype.so.6 libfontmanager.so \
+	libjpeg.so liblcms.so librmi.so libjawt.so libjaas_unix.so \
+	libattach.so libjdwp.so libdt_socket.so libhpi.so libjli.so \
+	libmawt.so libjvm.so \
+	libversionCheck.so libcompiledMethodLoad.so libgctest.so \
+	libheapViewer.so libheapTracker.so libminst.so libmtrace.so \
+	libwaiters.so libhprof.so \
+"
+
+
+inherit java autotools
+
+export ALT_CUPS_HEADERS_PATH = "${STAGING_INCDIR}"
+export ALT_FREETYPE_HEADERS_PATH = "${STAGING_INCDIR}/freetype2"
+export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
+export CACAO_CONFIGURE_ARGS = "\
+	${@['','--enable-softfloat'][bb.data.getVar('TARGET_FPU',d,1) == 'soft']} \
+	--with-cacaoh=${STAGING_BINDIR_NATIVE}/cacaoh-openjdk-0.99.4"
+
+JAVA_HOME[unexport] = "1"
+
+EXTRA_OECONF = "\
+	--disable-docs \
+	--disable-pulse-java \
+        --disable-plugin \
+	\
+	--with-ecj=${STAGING_BINDIR_NATIVE}/foo \
+	--with-ecj-jar=${STAGING_DATADIR_JAVA_NATIVE}/ecj-bootstrap.jar \
+	--with-java=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/java \
+	--with-javac=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/javac \
+	--with-javah=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/javah \
+	--with-jar=${STAGING_BINDIR_NATIVE}/fastjar \
+	--with-rmic=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin/rmic \
+	--with-xalan2-jar=${STAGING_DATADIR_JAVA}/xalan2.jar \
+	--with-xalan2-serializer-jar=${STAGING_DATADIR_JAVA}/serializer.jar \
+	--with-xerces2-jar=${STAGING_DATADIR_JAVA}/xercesImpl.jar \
+	--with-rhino=${STAGING_DATADIR_JAVA}/rhino.jar \
+	--with-openjdk-src-dir=${WORKDIR}/openjdk-src-dir \
+	--with-gcj-home=${WORKDIR}/fake-jdk \
+	--with-parallel-jobs=${JDK_JOBS} \
+	\
+	--with-libgcj-jar=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/jre/lib/rt.jar \
+	\
+	--with-pkgversion=${PV} \
+	--with-cc-for-build=${BUILD_CC} \
+        --enable-zero \
+        --with-additional-vms=shark,cacao \
+        --enable-openjdk-cross-compilation \
+       "
+
+
+# OpenJDK uses slightly different names for certain arches. We need to know
+#	this to create some files which are expected by the build.
+def get_jdk_arch(d):
+  import bb
+
+  jdk_arch = bb.data.getVar('TARGET_ARCH', d, 1)
+  if jdk_arch == "x86_64":
+    jdk_arch = "amd64"
+  elif (jdk_arch == "i586" or jdk_arch == "i686"):
+    jdk_arch = "i586"
+
+  return jdk_arch
+
+JDK_ARCH = "${@get_jdk_arch(d)}"
+JDK_HOME = "${libdir_jvm}/${JDK_DIR}"
+
+# OpenJDK supports parallel compilation but uses a plain number for this.
+# In OE we have PARALLEL_MAKE which is the actual option passed to make,
+# e.g. "-j 4". 
+def get_jdk_jobs(d):
+	import bb
+
+	pm = bb.data.getVar('PARALLEL_MAKE', d, 1);
+	if not pm:
+		return "1"
+	
+	pm = pm.split(" ");
+	if (len(pm) == 2):
+		return pm[1]
+
+	# Whatever found in PARALLEL_MAKE was not suitable.
+	return "1"
+
+JDK_JOBS = "${@get_jdk_jobs(d)}"
+
+# A function that is needed in the Shark builds.
+def get_llvm_configure_arch(d):
+  import bb;
+
+  arch = bb.data.getVar('TARGET_ARCH', d, 1)
+  if arch == "x86_64" or arch == "i486" or arch == "i586" or arch == "i686":
+    arch = "x86"
+  elif arch == "arm":
+    arch = "arm"
+  elif arch == "mipsel":
+    arch = "mips"
+  elif arch == "powerpc":
+    arch = "powerpc"
+  else:
+    oefatal("Your target architecture is not supported by this recipe");
+
+  return arch
+
+# Custom preparation of the sources which:
+# - cleans up the sources
+# - copies the patches into the proper directory
+# - prepares the FakeJDK directory structure
+#DISABLED because of incompatibility with oe stable 2009: do_prepareconfigure () {
+do_configure_prepend() {
+  chmod -R ug+w ${WORKDIR}/openjdk-src-dir
+  (cd ${WORKDIR}/openjdk-src-dir && sh ${S}/fsg.sh)
+
+  # Automatically copy everything that starts with "icedtea" (or "cacao") and ends with
+  # ".patch" into the patches directory.
+  find ${WORKDIR} -maxdepth 1 -name "icedtea*.patch" -exec cp {} ${S}/patches \;
+  find ${WORKDIR} -maxdepth 1 -name "cacao*.patch" -exec cp {} ${S}/patches \;
+
+  # use now the rt.jar from icedtea6-native
+  mkdir -p ${WORKDIR}/fake-jdk/jre/lib
+  ln -sf ${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/jre/lib/rt.jar ${WORKDIR}/fake-jdk/jre/lib/rt.jar
+
+  symlinked=false
+  oenote "Creating symlinks for fake-jdk"
+  mkdir -p ${WORKDIR}/fake-jdk/include
+  for i in `find ${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/include` ;do
+	bn=`basename $i`
+	oenote "Symlinking: $bn"
+    ln -sf $i ${WORKDIR}/fake-jdk/include/$bn;
+	symlinked=true
+  done
+
+  # If the symlinks have not been created the built cannot continue. This
+  # can happen if icedtea6-native is not ready at this point. The recipe
+  # should make sure this is not the case but a little sanity checking
+  # in such a complicated build can't be wrong.
+  if [ x$symlinked == xfalse ]
+  then
+    oefatal "Build b0rken! Have not created any symlinks for fake-jdk!"
+  else
+	oenote "fake-jdk setup appears sane."
+  fi
+}
+
+# Note: The following lines only work for OE.dev branch but cause an exception
+# in oe stable's 2009 bitbake. As such the function is prepended to do_configure instead.
+#addtask prepareconfigure after do_patch before do_configure
+# Makes prepareconfigure depend on icedtea6-native having being staged.
+#do_prepareconfigure[depends] += "icedtea6-native:do_populate_sysroot"
+
+
+do_configure_append() {
+	oe_runmake patch-ecj
+}
+
+# Work around broken variable quoting in oe-stable 2009 and provide the variable
+# via the environment which then overrides the erroneous value that was written
+# into '${ICETDEA}/Makefile'.
+# Icedtea's makefile is not compatible to parallelization so we cannot allow
+# passing a valid ${PARALLEL_MAKE} to it. OTOH OpenJDK's makefiles are
+# parallelizable and we need ${PARALLEL_MAKE} to derive the proper value.
+# The base for this quirk is that GNU Make only considers the last "-j" option.
+EXTRA_OEMAKE = '-j 1 CC="${CC}" CCC="${CXX}" CPP="${CPP}" CXX="${CXX}" CC_FOR_BUILD="${BUILD_CC}"'
+
+EXTRA_OEMAKE += ' \
+                OE_CFLAGS="${TARGET_CFLAGS}" \
+                OE_CPPFLAGS="${TARGET_CPPFLAGS}" \
+                OE_CXXFLAGS="${TARGET_CXXFLAGS}" \
+                OE_LDFLAGS="${TARGET_LDFLAGS}" \
+               '
+
+# Puts an OE specific string into the binary making it possible for the user
+# to know where it comes from (and blame the right people ...).
+DIST_ID = "Built for ${DISTRO}"
+DIST_NAME = "${DISTRO}"
+EXTRA_OEMAKE += 'DIST_NAME="${DIST_NAME}" DIST_ID="${DIST_ID}"'
+
+
+# llvm configure and compiles stuff
+
+export WANT_LLVM_RELEASE = "2.7"
+
+# Provides the target architecture to the configure script.
+export LLVM_CONFIGURE_ARCH="${@get_llvm_configure_arch(d)}"
+
+OE_LAUNCHER_LDFLAGS = "-Wl,-rpath-link,${STAGING_LIBDIR}/llvm2.7"
+
+EXTRA_OEMAKE += 'OE_LAUNCHER_LDFLAGS="${OE_LAUNCHER_LDFLAGS}"'
+
+
+# Large stack is required at least on x86_64 host, otherwise random segfaults appear:
+QEMU = "qemu-${TARGET_ARCH} ${QEMU_OPTIONS} -s 1048576 -L ${STAGING_DIR_TARGET}"
+
+EXTRA_OEMAKE += 'QEMU="${QEMU}"'
+
+# Name of the directory containing the compiled output
+BUILD_DIR = "build/linux-${JDK_ARCH}"
+
+# The build of OpenJDK is a 3-part process. For better restartability and overrideability they have been split into
+# three functions.
+# 1. compile Hotspot or Cacao (this one is supposed to be implemented according to wanted VM)
+# 2. compile openjdk-ecj (to have libraries as libjvm.so and libjava.so which are needed later)
+# 3. compile openjdk (the final result)
+
+do_compilestepone() {
+        oe_runmake bootstrap-directory-ecj
+
+        # now we need to override the tools.jar to point to the normal jdk's tools.jar
+        rm bootstrap/ecj/lib/tools.jar
+        ln -s ${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/lib/tools.jar bootstrap/ecj/lib/tools.jar
+
+        # First build hotspot to get a libjvm.so (to link corba in the icedtea-ecj build)
+        echo "1/3 Building Hotspot"
+        oe_runmake hotspot
+
+        # Remove spurious libarch directory/symlink
+        rm -rf bootstrap/ecj/jre/lib/${JDK_ARCH} || true
+
+                # Provide a symlink to the target arch's libjvm.so (to link against)
+        ln -s `pwd`/openjdk-ecj/${BUILD_DIR}/j2sdk-image/jre/lib/${JDK_ARCH} bootstrap/jdk1.6.0/jre/lib/${JDK_ARCH}
+
+        # fake j2sdk-image
+        rm openjdk-ecj/${BUILD_DIR}/j2sdk-image/include || true
+        cp -ar openjdk-ecj/${BUILD_DIR}/hotspot/import/include openjdk-ecj/${BUILD_DIR}/j2sdk-image/
+        install -d openjdk-ecj/${BUILD_DIR}/j2sdk-image/bin
+}
+addtask compilestepone after do_qa_configure before do_compilesteptwo
+
+# This part can be shared between cacao and hotspot-zero builds.
+do_compilesteptwo() {
+	echo "2/3 Building bootstrap JDK"
+
+	# Take pre-generated binaries from -native build
+	install -d generated/sun/awt/X11/generator
+	ln -sf ${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/generated/sizer.32 generated/sun/awt/X11/generator/sizer.32
+	install -d openjdk/${BUILD_DIR}/gensrc/sun/awt/X11/generator
+	ln -sf ${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/generated/sizer.32 openjdk/${BUILD_DIR}/gensrc/sun/awt/X11/generator/sizer.32
+
+	# Now cross-compile bootstrap JDK
+	rm stamps/icedtea-against-ecj.stamp stamps/icedtea-ecj.stamp || true
+	oe_runmake icedtea-against-ecj
+
+	ln -sf ../openjdk-ecj/${BUILD_DIR}/j2sdk-image bootstrap/icedtea
+
+	#	Replace all executables with symlinks to their native equivalents.
+	for F in `find ${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native/bin -type f`
+	do
+		bf=`basename $F`
+		echo "Creating symlink for:" $bf
+		ln -sf $F bootstrap/icedtea/bin/$bf
+	done
+}
+addtask compilesteptwo after do_compilestepone before do_compile
+
+do_compile() {
+
+	echo "3/3 Building final JDK"
+
+	# Build the final Hotspot + OpenJDK
+	oe_runmake icedtea-against-icedtea \
+}
+
+do_install() {
+	install -d ${D}${libdir_jvm}
+	cp -R ${S}/build/openjdk/${BUILD_DIR}/j2sdk-image ${D}${JDK_HOME}
+
+	chmod u+rw -R ${D}${JDK_HOME}
+
+	# Fix symlink which would point into staging in the binary package.
+	ln -sf ${datadir_java}/rhino.jar ${D}${JDK_HOME}/jre/lib/rhino.jar
+
+	# JRE is a subset of JDK. So to save space and resemble what the BIG distros
+	# do we create symlinks from the JDK binaries to their counterparts in the
+	# JRE folder (which have to exist by that time b/c of dependencies). 
+	for F in `find ${D}${JDK_HOME}/jre/bin -type f`
+	do
+		bf=`basename $F`
+		echo "replace:" $bf
+		rm ${D}${JDK_HOME}/bin/$bf
+		ln -s ${JDK_HOME}/jre/bin/$bf ${D}${JDK_HOME}/bin/$bf
+	done
+
+        install -m644 ${WORKDIR}/jvm.cfg  ${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
+}
+
+# Manual staging step that is only needed for oe-stable.
+do_stage() {
+          :
+}
+
+# Notes about the ideas behind packaging:
+# 1) User should install openjdk-6-jre. This is a provider of 'java2-runtime'.
+# 2) This lets package mgmt install: openjdk-6-java
+# -> openjdk-6-vm-shark|openjdk-6-vm-zero|openjdk-6-vm-cacao -> openjdk-6-common
+#
+# With opkg the zero VM is chosen which is good b/c that is the best known (= compatible)
+# runtime. Installing other runtimes side-by-side is possible. Through jvm.cfg the following
+# order of precedence is enforced: zero, shark, cacao. User can chose a different runtime
+# by adding '-shark' or '-cacao' to the Java command (or by deinstalling an otherwise preferred
+# runtime)
+# 3) All other packages, including -jdk, are optional and not needed for normal Java apps.
+PACKAGES = " \
+            ${JDK_PN}-jre \
+            ${JDK_PN}-dbg \
+            ${JDK_PN}-demo-dbg \
+            ${JDK_PN}-demo \
+            ${JDK_PN}-source \
+            ${JDK_PN}-doc \
+            ${JDK_PN}-jdk \
+            ${JDK_PN}-java \
+            ${JDK_PN}-vm-shark \
+            ${JDK_PN}-vm-zero \
+            ${JDK_PN}-vm-cacao \
+            ${JDK_PN}-common \
+           "
+
+FILES_${JDK_PN}-dbg = "\
+	${JDK_HOME}/bin/.debug \
+	${JDK_HOME}/lib/.debug \
+	${JDK_HOME}/jre/bin/.debug \
+	${JDK_HOME}/jre/lib/.debug \
+	${JDK_HOME}/jre/lib/${JDK_ARCH}/.debug \
+	${JDK_HOME}/jre/lib/${JDK_ARCH}/jli/.debug \
+	${JDK_HOME}/jre/lib/${JDK_ARCH}/native_threads/.debug \
+	${JDK_HOME}/jre/lib/${JDK_ARCH}/server/.debug \
+        ${JDK_HOME}/jre/lib/${JDK_ARCH}/shark/.debug \
+	${JDK_HOME}/jre/lib/${JDK_ARCH}/headless/.debug \
+	${JDK_HOME}/jre/lib/${JDK_ARCH}/xawt/.debug \
+       "
+
+FILES_${JDK_PN}-demo = "${JDK_HOME}/demo ${JDK_HOME}/sample"
+RDEPENDS_${JDK_PN}-demo = "java2-runtime"
+FILES_${JDK_PN}-demo-dbg = "\
+	${JDK_HOME}/demo/jvmti/gctest/lib/.debug \
+	${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug \
+	${JDK_HOME}/demo/jvmti/heapViewer/lib/.debug \
+	${JDK_HOME}/demo/jvmti/hprof/lib/.debug \
+	${JDK_HOME}/demo/jvmti/minst/lib/.debug \
+	${JDK_HOME}/demo/jvmti/mtrace/lib/.debug \
+	${JDK_HOME}/demo/jvmti/versionCheck/lib/.debug \
+	${JDK_HOME}/demo/jvmti/waiters/lib/.debug \
+	${JDK_HOME}/demo/jvmti/compiledMethodLoad/lib/.debug \
+       "
+
+FILES_${JDK_PN}-source = "${JDK_HOME}/src.zip"
+
+FILES_${JDK_PN}-java = "${JDK_HOME}/jre/bin/java"
+
+FILES_${JDK_PN}-vm-zero = "${JDK_HOME}/jre/lib/arm/server/"
+
+FILES_${JDK_PN}-vm-shark = "${JDK_HOME}/jre/lib/arm/shark/"
+
+FILES_${JDK_PN}-vm-cacao = "${JDK_HOME}/jre/lib/arm/cacao/"
+
+FILES_${JDK_PN}-common = "${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
+                          ${JDK_HOME}/jre/THIRD_PARTY_README \
+                          ${JDK_HOME}/jre/LICENSE \
+                          ${JDK_HOME}/jre/lib \
+                         "
+
+FILES_openjdk-6-jre_append = " \
+	${JDK_HOME}/jre/bin/keytool \
+        ${JDK_HOME}/jre/bin/orbd \
+	${JDK_HOME}/jre/bin/pack200 \
+        ${JDK_HOME}/jre/bin/rmid \
+	${JDK_HOME}/jre/bin/rmiregistry \
+        ${JDK_HOME}/jre/bin/servertool \
+	${JDK_HOME}/jre/bin/tnameserv \
+        ${JDK_HOME}/jre/bin/unpack200 \
+	${JDK_HOME}/jre/bin/policytool \
+        ${JDK_HOME}/jre/bin/javaws \
+       "
+
+RDEPENDS_${JDK_PN}-common = "librhino-java"
+
+RPROVIDES_${JDK_PN}-vm-shark = "java2-vm"
+RPROVIDES_${JDK_PN}-vm-zero = "java2-vm"
+RPROVIDES_${JDK_PN}-vm-cacao = "java2-vm"
+
+RDEPENDS_${JDK_PN}-java = "java2-vm"
+
+# For some reason shark and cacao do not automatically depends on -common.
+# So we add that manually.
+RDEPENDS_${JDK_PN}-vm-shark = "${JDK_PN}-common"
+RDEPENDS_${JDK_PN}-vm-cacao = "${JDK_PN}-common"
+
+# There is a symlink to a .so but this one is valid.
+INSANE_SKIP_${JDK_PN}-vm-shark = "1"
+INSANE_SKIP_${JDK_PN}-vm-zero = "1"
+INSANE_SKIP_${JDK_PN}-vm-cacao = "1"
+INSANE_SKIP_${JDK_PN}-common = "1"
+
+FILES_${JDK_PN}-jdk = " \
+                       ${JDK_HOME}/bin \
+                       ${JDK_HOME}/lib \
+                       ${JDK_HOME}/include \
+                      "
+RDEPENDS_${JDK_PN}-jre = "${JDK_PN}-java"
+RPROVIDES_${JDK_PN}-jre = "java2-runtime"
+
+RDEPENDS_${JDK_PN}-jdk = "${JDK_PN}-jre"
+
+FILES_${JDK_PN}-doc = "${JDK_HOME}/man"
+
+pkg_postinst_${JDK_PN}-vm-shark () {
+        if  grep -q "\-cacao KNOWN" ${JDK_HOME}/jre/lib/arm/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/arm/jvm.cfg; then
+          sed -i -e "/\-cacao KNOWN/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
+          echo "-cacao KNOWN" >> ${JDK_HOME}/jre/lib/arm/jvm.cfg
+        fi 
+
+	sed -i -e "/\-shark.*/d" -e "s|\(^\-server*\)|\-shark KNOWN\n\1|" -e "/^$/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
+}
+
+pkg_prerm_${JDK_PN}-vm-shark () {
+	sed -i -e "/^\-shark.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg 
+        if  grep -q "\-cacao KNOWN" ${JDK_HOME}/jre/lib/arm/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/arm/jvm.cfg; then
+          sed -i -e "/\-cacao KNOWN/d" -e  "s|\(^\-server*\)|\-cacao KNOWN\n\1|" ${JDK_HOME}/jre/lib/arm/jvm.cfg
+        fi
+}
+
+pkg_postinst_${JDK_PN}-vm-cacao () {
+        if  grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/arm/jvm.cfg && ! grep -q "\-shark KNOWN" ${JDK_HOME}/jre/lib/arm/jvm.cfg; then
+          sed -i -e "/\-cacao.*/d" -e  "s|\(^\-server*\)|\-cacao KNOWN\n\1|" -e "/^$/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
+        else 
+	  sed -i -e "s|^\-cacao.*|\-cacao KNOWN|" -e "/^$/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
+        fi
+}
+
+pkg_prerm_${JDK_PN}-vm-cacao () {
+     if  grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/arm/jvm.cfg && ! grep -q "\-shark KNOWN" ${JDK_HOME}/jre/lib/arm/jvm.cfg; then
+	sed -i -e "/\-cacao.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
+        echo "-cacao ERROR" >> ${JDK_HOME}/jre/lib/arm/jvm.cfg
+      else
+	sed -i -e "s|^\-cacao.*|\-cacao ERROR|" -e "/^$/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
+      fi
+}
+
+pkg_postinst_${JDK_PN}-vm-zero () {
+ if  grep -q "\-cacao KNOWN" ${JDK_HOME}/jre/lib/arm/jvm.cfg  && ! grep -q "\-shark KNOWN" ${JDK_HOME}/jre/lib/arm/jvm.cfg; then
+   sed -i -e "/\-cacao KNOWN/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
+   echo "-cacao KNOWN" >> ${JDK_HOME}/jre/lib/arm/jvm.cfg
+ fi
+
+ sed -i -e "s|^\-server.*|\-server KNOWN|" -e "/^$/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
+}
+
+pkg_prerm_${JDK_PN}-vm-zero () {
+ if  grep -q "\-cacao KNOWN" ${JDK_HOME}/jre/lib/arm/jvm.cfg  && ! grep -q "\-shark KNOWN" ${JDK_HOME}/jre/lib/arm/jvm.cfg; then
+   sed -i -e "/\-cacao KNOWN/d" -e  "s|\(^\-server*\)|\-cacao KNOWN\n\1|" ${JDK_HOME}/jre/lib/arm/jvm.cfg
+ fi
+
+ sed -i -e "s|^\-server.*|\-server ERROR|" -e "/^$/d" ${JDK_HOME}/jre/lib/arm/jvm.cfg
+}
+
+pkg_postinst_${JDK_PN}-jre () {
+	update-alternatives --install ${bindir}/java java ${JDK_HOME}/jre/bin/java 15
+}
+
+pkg_prerm_${JDK_PN}-jre () {
+	update-alternatives --remove java ${JDK_HOME}/jre/bin/java
+}
+
+pkg_postinst_${JDK_PN}-jdk () {
+	update-alternatives --install ${bindir}/javac javac ${JDK_HOME}/bin/javac 15
+}
+
+pkg_prerm_${JDK_PN}-jdk () {
+	update-alternatives --remove javac ${JDK_HOME}/bin/javac
+}
diff --git a/recipes/openjdk/openjdk-6-release-6b18.inc b/recipes/openjdk/openjdk-6-release-6b18.inc
new file mode 100644
index 0000000..6cc4f2c
--- /dev/null
+++ b/recipes/openjdk/openjdk-6-release-6b18.inc
@@ -0,0 +1,104 @@
+require openjdk-6-common.inc
+
+EXTRA_OECONF += "\
+	--with-jaxws-drop-zip=${DL_DIR}/jdk6-jaxws-2009_10_27.zip \ 
+	--with-jaf-drop-zip=${DL_DIR}/jdk6-jaf-2009_10_27.zip \
+	--with-jaxp-drop-zip=${DL_DIR}/jdk6-jaxp-2009_10_13.zip \
+	--with-cacao-src-zip=${DL_DIR}/cacao-0.99.4.tar.gz \
+"
+
+# Use IcedTea6 1.8 release.
+ICEDTEA = "icedtea6-1.8"
+ICEDTEA_URI = "http://icedtea.classpath.org/download/source/${ICEDTEA}.tar.gz"
+
+OPENJDK_URI = "http://download.java.net/openjdk/jdk6/promoted/b18/openjdk-6-src-b18-16_feb_2010.tar.gz;subdir=openjdk-src-dir"
+
+JAXWS_URI = "http://kenai.com/projects/jdk6-drops/downloads/download/jdk6-jaxws-2009_10_27.zip"
+
+JAF_URI = "http://kenai.com/projects/jdk6-drops/downloads/download/jdk6-jaf-2009_10_27.zip"
+
+JAXP_URI = "https://jaxp.dev.java.net/files/nidaba/documents/913/147329/jdk6-jaxp-2009_10_13.zip"
+
+CACAO_URI = "http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-0.99.4/cacao-0.99.4.tar.gz"
+
+# Allow overriding this separately
+OEPATCHES = "\
+	file://build-hacks.patch;patch=1 \
+	file://zero-cmpswap-long.patch;patch=1 \
+	file://fix_hotspot_crosscompile.patch;patch=1 \
+	file://mkbc_returncode.patch;patch=1 \
+	file://icedtea-fix-jar-command.patch;patch=1 \
+	file://fix-llvm-libs.patch;patch=1 \
+	file://shark-build-openjdkdir.patch;patch=1 \
+	file://shark-arm-linux-cpu-detection.patch;patch=1 \
+        file://icedtea1.8-pre1.8.1-releasebranch-fixes.patch;patch=1 \
+	"
+
+# Allow overriding this separately
+ICEDTEAPATCHES = "\
+	file://icedtea-launcher-stdc++.patch \
+	file://icedtea-crosscompile-fix.patch \
+	file://icedtea-hostbuildcc.patch \
+	file://icedtea-unbreak-float.patch \
+	file://icedtea-remove_werror.patch \
+	file://cacao-vfp-compat.patch \
+	file://cacao-disable-stackbase-check.patch \
+        file://icedtea-libnet-renaming.patch \
+	"
+
+ICEDTEAPATCHES_append_linux-uclibc = " \
+        file://icedtea-hotspot-isfinte.patch \
+        file://icedtea-hotspot-glibc-version.patch \
+        file://icedtea-hotspot-loadavg.patch \
+        file://icedtea-hotspot-isnanf.patch \
+        file://icedtea-jdk-iconv-uclibc.patch \
+        file://icedtea-jdk-remove-unused-backtrace.patch \
+        file://icedtea-jdk-RTLD_NOLOAD.patch \
+        file://icedtea-jdk-unpack-uclibc.patch \
+        "
+
+ICEDTEAPATCHES_append_linux-uclibceabi = " \
+        file://icedtea-hotspot-isfinte.patch \
+        file://icedtea-hotspot-isnanf.patch \
+        file://icedtea-hotspot-glibc-version.patch \
+        file://icedtea-hotspot-loadavg.patch \
+        file://icedtea-jdk-iconv-uclibc.patch \
+        file://icedtea-jdk-remove-unused-backtrace.patch \
+        file://icedtea-jdk-RTLD_NOLOAD.patch \
+        file://icedtea-jdk-unpack-uclibc.patch \
+        "
+
+# Allow overriding this separately
+DISTRIBUTION_PATCHES = "\
+	patches/icedtea-launcher-stdc++.patch \
+	patches/icedtea-crosscompile-fix.patch \
+	patches/icedtea-hostbuildcc.patch \
+	patches/icedtea-unbreak-float.patch \
+	patches/icedtea-remove_werror.patch \
+	patches/cacao-vfp-compat.patch \
+	patches/cacao-disable-stackbase-check.patch \
+        patches/icedtea-libnet-renaming.patch \
+	"
+
+DISTRIBUTION_PATCHES_append_linux-uclibc = "\
+        patches/icedtea-hotspot-isfinte.patch \
+        patches/icedtea-hotspot-isnanf.patch \
+        patches/icedtea-hotspot-glibc-version.patch \
+        patches/icedtea-hotspot-loadavg.patch \
+        patches/icedtea-jdk-iconv-uclibc.patch \
+        patches/icedtea-jdk-remove-unused-backtrace.patch \
+        patches/icedtea-jdk-RTLD_NOLOAD.patch \
+        patches/icedtea-jdk-unpack-uclibc.patch \
+        "
+DISTRIBUTION_PATCHES_append_linux-uclibceabi = "\
+        patches/icedtea-hotspot-isfinte.patch \
+        patches/icedtea-hotspot-isnanf.patch \
+        patches/icedtea-hotspot-glibc-version.patch \
+        patches/icedtea-hotspot-loadavg.patch \
+        patches/icedtea-jdk-iconv-uclibc.patch \
+        patches/icedtea-jdk-remove-unused-backtrace.patch \
+        patches/icedtea-jdk-RTLD_NOLOAD.patch \
+        patches/icedtea-jdk-unpack-uclibc.patch \
+        "
+
+export DISTRIBUTION_PATCHES
diff --git a/recipes/openjdk/openjdk-6_6b18-1.8.bb b/recipes/openjdk/openjdk-6_6b18-1.8.bb
new file mode 100644
index 0000000..7ab39bb
--- /dev/null
+++ b/recipes/openjdk/openjdk-6_6b18-1.8.bb
@@ -0,0 +1,3 @@
+require openjdk-6-release-6b18.inc
+
+PR = "${INC_PR}.4"
-- 
1.7.0.4



