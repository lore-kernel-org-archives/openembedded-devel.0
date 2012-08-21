Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3ft5-0007BR-SP
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Aug 2012 06:16:20 +0200
Received: by mail-pz0-f51.google.com with SMTP id t11so2243525daj.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 21:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=/01gAnXTNCMu5Q/ubbp4ps1Fm+Swqz6dP+tJxplAtG4=;
	b=WmiG6GOABRdkYm61M8fB05NGrX0eB0Np2x0sFbXr/oV0+9VKrka4Z/dsv55zwer3bB
	nxDBopSAXV//C9rp7GkHk6diwxBTNG9EgQYO1N1oILaFe3FU0YyDGAqbk1WssrBpVJFv
	WcOPfrqa2PmGkiAxteNOP9fWydlMJoKQ08U0GIUFoMQIb/tNr9GrJScfBjWlF1898NXS
	BdyqG5KESQF9WbjoET2B2LGnIhhjUOP/R1CV7HcMlKGEfSmfV57jaChqNYKwDmAOLrSa
	Di6cXHdSGTgc7HpuLVYB9x2jXs8tqrbu4PuYmpFgt9P9rbJprUdJTHJrstfdbNqeKsPU
	LP/Q==
Received: by 10.68.193.137 with SMTP id ho9mr40768844pbc.93.1345521858460;
	Mon, 20 Aug 2012 21:04:18 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id uj3sm526674pbc.39.2012.08.20.21.04.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 21:04:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 21:03:36 -0700
Message-Id: <1345521816-2364-7-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345521816-2364-1-git-send-email-raj.khem@gmail.com>
References: <1345521816-2364-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-java/openjdk-7.0][PATCH 7/7] openjdk-7: Fix various issues in openjdk7 builds
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
X-List-Received-Date: Tue, 21 Aug 2012 04:16:20 -0000

Fix parallel build.
Fixed build on ppc/ppc64
Define WITH_ADDITIONAL_VMS variable so
it can be overridden from bbappend
Correct LICENSE
Fixed packaging errors and warnings
Fix python indentation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../icedtea-jdk-nio-use-host-cc.patch              |   89 +++++++++++++++++
 .../icedtea-jdk-ppc64-jvm-cfg.patch                |   41 ++++++++
 recipes-core/openjdk/openjdk-7-common.inc          |  100 ++++++++++----------
 recipes-core/openjdk/openjdk-7-release-03b21.inc   |   17 +++-
 4 files changed, 195 insertions(+), 52 deletions(-)
 create mode 100644 recipes-core/openjdk/openjdk-7-03b21/icedtea-jdk-nio-use-host-cc.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-03b21/icedtea-jdk-ppc64-jvm-cfg.patch

diff --git a/recipes-core/openjdk/openjdk-7-03b21/icedtea-jdk-nio-use-host-cc.patch b/recipes-core/openjdk/openjdk-7-03b21/icedtea-jdk-nio-use-host-cc.patch
new file mode 100644
index 0000000..6b14673
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-03b21/icedtea-jdk-nio-use-host-cc.patch
@@ -0,0 +1,89 @@
+diff --git openjdk/jdk/make/java/nio/Makefile openjdk/jdk/make/java/nio/Makefile
+index 7906531..afa5d46 100644
+--- openjdk/jdk/make/java/nio/Makefile
++++ openjdk/jdk/make/java/nio/Makefile
+@@ -823,7 +823,7 @@ $(TEMPDIR)/$(GENSOR_SRC) : $(GENSOR_SRC)
+ 
+ $(GENSOR_EXE) : $(TEMPDIR)/$(GENSOR_SRC)
+ 	$(prep-target)
+-	($(CD) $(TEMPDIR); $(CC) $(CPPFLAGS) $(LDDFLAGS) \
++	($(CD) $(TEMPDIR); $(CC_FOR_BUILD) $(CPPFLAGS) $(LDDFLAGS) \
+ 	   -o genSocketOptionRegistry$(EXE_SUFFIX) $(GENSOR_SRC))
+ 
+ ifdef NIO_PLATFORM_CLASSES_ROOT_DIR
+@@ -834,12 +834,8 @@ else
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
+@@ -863,7 +859,7 @@ GENUC_COPYRIGHT_YEARS = $(shell $(CAT) $(GENUC_SRC) | \
+ 
+ $(GENUC_EXE) : $(GENUC_SRC)
+ 	$(prep-target)
+-	$(CC) $(CPPFLAGS) -o $@ $(GENUC_SRC)
++	$(CC_FOR_BUILD) $(CPPFLAGS) -o $@ $(GENUC_SRC)
+ 
+ ifdef NIO_PLATFORM_CLASSES_ROOT_DIR
+ $(SFS_GEN)/UnixConstants.java: $(NIO_PLATFORM_CLASSES_ROOT_DIR)/sun/nio/fs/UnixConstants-$(PLATFORM)-$(ARCH).java
+@@ -873,12 +869,8 @@ else
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
+@@ -889,7 +881,7 @@ GENSC_COPYRIGHT_YEARS = $(shell $(CAT) $(GENSC_SRC) | \
+ 
+ $(GENSC_EXE) : $(GENSC_SRC)
+ 	$(prep-target)
+-	$(CC) $(CPPFLAGS) -o $@ $(GENSC_SRC)
++	$(CC_FOR_BUILD) $(CPPFLAGS) -o $@ $(GENSC_SRC)
+ 
+ ifdef NIO_PLATFORM_CLASSES_ROOT_DIR
+ $(SFS_GEN)/SolarisConstants.java: $(NIO_PLATFORM_CLASSES_ROOT_DIR)/sun/nio/fs/SolarisConstants-$(PLATFORM)-$(ARCH).java
+@@ -899,11 +891,7 @@ else
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
+--- openjdk/jdk/make/sun/Makefile.khem	2012-08-10 19:32:40.695550897 -0700
++++ openjdk/jdk/make/sun/Makefile	2012-08-10 19:33:39.195550853 -0700
+@@ -55,7 +55,7 @@ ifneq ($(PLATFORM), windows)
+     endif
+   endif
+   HEADLESS_SUBDIR = headless
+-  XAWT_SUBDIR     = xawt
++  XAWT_SUBDIR     =
+ endif
+ 
+ ifndef OPENJDK
+@@ -79,7 +79,7 @@ else
+ endif
+ SUBDIRS_desktop    = audio $(RENDER_SUBDIR) image \
+                      $(DISPLAY_LIBS) $(DGA_SUBDIR) \
+-                     jawt font jpeg cmm $(DISPLAY_TOOLS) beans
++                     font jpeg cmm $(DISPLAY_TOOLS) beans
+ SUBDIRS_management = management
+ SUBDIRS_misc       = $(ORG_SUBDIR) rmi $(JDBC_SUBDIR) tracing
+ SUBDIRS_tools      = native2ascii serialver tools jconsole
diff --git a/recipes-core/openjdk/openjdk-7-03b21/icedtea-jdk-ppc64-jvm-cfg.patch b/recipes-core/openjdk/openjdk-7-03b21/icedtea-jdk-ppc64-jvm-cfg.patch
new file mode 100644
index 0000000..5bb7604
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-03b21/icedtea-jdk-ppc64-jvm-cfg.patch
@@ -0,0 +1,41 @@
+--- /dev/null	2012-07-25 13:25:05.651551001 -0700
++++ openjdk/jdk/src/solaris/bin/ppc64/jvm.cfg	2012-08-10 23:59:02.651551157 -0700
+@@ -0,0 +1,38 @@
++# Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
++# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
++#
++# This code is free software; you can redistribute it and/or modify it
++# under the terms of the GNU General Public License version 2 only, as
++# published by the Free Software Foundation.  Oracle designates this
++# particular file as subject to the "Classpath" exception as provided
++# by Oracle in the LICENSE file that accompanied this code.
++#
++# This code is distributed in the hope that it will be useful, but WITHOUT
++# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
++# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
++# version 2 for more details (a copy is included in the LICENSE file that
++# accompanied this code).
++#
++# You should have received a copy of the GNU General Public License version
++# 2 along with this work; if not, write to the Free Software Foundation,
++# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
++#
++# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
++# or visit www.oracle.com if you need additional information or have any
++# questions.
++#
++# List of JVMs that can be used as an option to java, javac, etc.
++# Order is important -- first in this list is the default JVM.
++# NOTE that this both this file and its format are UNSUPPORTED and
++# WILL GO AWAY in a future release.
++#
++# You may also select a JVM in an arbitrary location with the
++# "-XXaltjvm=<jvm_dir>" option, but that too is unsupported
++# and may not be available in a future release.
++#
++-client KNOWN
++-server KNOWN
++-hotspot ERROR
++-classic WARN
++-native ERROR
++-green ERROR
diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 1752973..eb0a817 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Java runtime based upon the OpenJDK- and Icedtea Project"
 HOMEPAGE = "http://icedtea.classpath.org"
-LICENSE  = "GPL with Classpath Exception"
+LICENSE  = "GPL-2.0-with-classpath-exception"
 PRIORITY = "optional"
 SECTION  = "libs"
 
@@ -89,41 +89,30 @@ export CACAO_CONFIGURE_ARGS = " \
 
 JAVA_HOME[unexport] = "1"
 
-WITH_ADDITIONAL_VMS = "shark,cacao,jamvm"
+WITH_ADDITIONAL_VMS ?= "--with-additional-vms=shark,cacao,jamvm"
 
-WITH_ADDITIONAL_VMS_arm = "cacao,jamvm"
+WITH_ADDITIONAL_VMS_arm = "--with-additional-vms=cacao,jamvm"
 
 # OpenJDK supports parallel compilation but uses a plain number for this.
 # In OE we have PARALLEL_MAKE which is the actual option passed to make,
 # e.g. "-j 4".
 
-def set_jdk7_jobs(d):
-        import bb
-
-        pm  = bb.data.getVar('PARALLEL_MAKE', d, 1)
-        pmi = bb.data.getVar('PARALLEL_MAKE_ICEDTEA', d, 1)
-
-        if not pmi:
-                pm = pm.split("j");
-                if (len(pm) == 2):
-                        bb.data.setVar('PARALLEL_MAKE_ICEDTEA', pm[1], d)
-        return
-
-
-PARALLEL = "${@set_jdk7_jobs(d)}"
+OPENJDK_PARALLEL_MAKE := "${PARALLEL_MAKE}"
+PARALLEL_MAKE =  ""
 
 def get_jdk7_jobs(d):
-        import bb
+    import bb
+
+    pm = bb.data.getVar('OPENJDK_PARALLEL_MAKE', d, 1);
+    if not pm:
+        return "1"
 
-        ret = 1
-        pmoo = bb.data.getVar('PARALLEL_MAKE', d, 1)
-        if pmoo:
-                bb.data.setVar('PARALLEL_MAKE', "", d)
+    pm = pm.split("j");
+    if (len(pm) == 2):
+        return pm[1].strip()
 
-        pm = bb.data.getVar('PARALLEL_MAKE_ICEDTEA', d, 1)
-        if pm:
-                ret = pm
-        return ret
+    # Whatever found in PARALLEL_MAKE was not suitable.
+    return "1"
 
 JDK_JOBS = "${@get_jdk7_jobs(d)}"
 
@@ -157,21 +146,24 @@ EXTRA_OECONF = " \
 	\
 	--with-pkgversion=${PV} \
 	--with-cc-for-build=${BUILD_CC} \
-        --with-additional-vms=${WITH_ADDITIONAL_VMS} \
        "
 
 # OpenJDK uses slightly different names for certain arches. We need to know
 #	this to create some files which are expected by the build.
 def get_jdk_arch(d):
-  import bb
+    import bb
 
-  jdk_arch = bb.data.getVar('TARGET_ARCH', d, 1)
-  if jdk_arch == "x86_64":
-    jdk_arch = "amd64"
-  elif (jdk_arch == "i486" or jdk_arch == "i586" or jdk_arch == "i686"):
-    jdk_arch = "i386"
+    jdk_arch = bb.data.getVar('TRANSLATED_TARGET_ARCH', d, 1)
+    if jdk_arch == "x86-64":
+        jdk_arch = "amd64"
+    elif jdk_arch == "powerpc":
+        jdk_arch = "ppc"
+    elif jdk_arch == "powerpc64":
+        jdk_arch = "ppc64"
+    elif (jdk_arch == "i486" or jdk_arch == "i586" or jdk_arch == "i686"):
+        jdk_arch = "i386"
 
-  return jdk_arch
+    return jdk_arch
 
 JDK_ARCH = "${@get_jdk_arch(d)}"
 JDK_HOME = "${libdir_jvm}/${JDK_DIR}"
@@ -179,24 +171,24 @@ JDK_FAKE = "${WORKDIR}/fake-jdk"
 
 # A function that is needed in the Shark builds.
 def get_llvm_configure_arch(d):
-  import bb;
-
-  arch = bb.data.getVar('TARGET_ARCH', d, 1)
-  if arch == "x86_64" or arch == "i486" or arch == "i586" or arch == "i686":
-    arch = "x86"
-  elif arch == "arm":
-    arch = "arm"
-  elif arch == "mipsel" or arch == "mips":
-    arch = "mips"
-  elif arch == "powerpc":
-    arch = "powerpc"
-  else:
-    bb.error("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
-
-  return arch
+    import bb;
+
+    arch = bb.data.getVar('TRANSLATED_TARGET_ARCH', d, 1)
+    if arch == "x86-64" or arch == "i486" or arch == "i586" or arch == "i686":
+        arch = "x86"
+    elif arch == "arm":
+        arch = "arm"
+    elif arch == "mipsel" or arch == "mips":
+        arch = "mips"
+    elif arch == "powerpc" or arch == "powerpc64":
+        arch = "powerpc"
+    else:
+        bb.error("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
+
+    return arch
 
 do_configure_prepend() {
-  echo "Configure with parallel-jobs: ${PARALLEL}"
+  echo "Configure with parallel-jobs: ${JDK_JOBS}"
 
   # Automatically copy everything that starts with "icedtea" (or "cacao") and ends with
   # ".patch" into the patches directory.
@@ -224,6 +216,7 @@ EXTRA_OEMAKE += ' \
                 OE_LDFLAGS="${TARGET_LDFLAGS}" \
                 ZIPEXE="${STAGING_BINDIR_NATIVE}/zip" \
 		CROSS_COMPILE_ARCH="${JDK_ARCH}" \
+		REQUIRED_ALSA_VERSION="" \
                '
 
 # Puts an OE specific string into the binary making it possible for the user
@@ -247,7 +240,7 @@ OE_LAUNCHER_LDFLAGS_arm = ""
 EXTRA_OEMAKE += 'OE_LAUNCHER_LDFLAGS="${OE_LAUNCHER_LDFLAGS}"'
 
 # Large stack is required at least on x86_64 host, otherwise random segfaults appear:
-QEMU = "${@qemu_target_binary(d)} ${QEMU_OPTIONS} -s 2097152 -L ${STAGING_DIR_TARGET}"
+QEMU = "${@qemu_target_binary(d)} ${QEMU_OPTIONS} -s 2097152 -L ${STAGING_DIR_TARGET} -E LD_LIBRARY_PATH=${STAGING_BASELIBDIR}"
 
 EXTRA_OEMAKE += 'QEMU="${QEMU}"'
 
@@ -295,6 +288,7 @@ do_install() {
 # 3) All other packages, including -jdk, are optional and not needed for normal Java apps.
 PACKAGES = " \
             ${JDKPN}-jre \
+	    ${JDKPN}-jre-dbg \
             ${JDKPN}-dbg \
             ${JDKPN}-demo-dbg \
             ${JDKPN}-demo \
@@ -352,6 +346,10 @@ FILES_${JDKPN}-vm-jamvm = "${JDK_HOME}/jre/lib/${JDK_ARCH}/jamvm/"
 FILES_${JDKPN}-common = "${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
                           ${JDK_HOME}/jre/THIRD_PARTY_README \
                           ${JDK_HOME}/jre/LICENSE \
+                          ${JDK_HOME}/ASSEMBLY_EXCEPTION \
+                          ${JDK_HOME}/THIRD_PARTY_README \
+                          ${JDK_HOME}/LICENSE \
+                          ${JDK_HOME}/release \
                           ${JDK_HOME}/jre/lib \
                          "
 
diff --git a/recipes-core/openjdk/openjdk-7-release-03b21.inc b/recipes-core/openjdk/openjdk-7-release-03b21.inc
index 5147d76..40c1cf6 100644
--- a/recipes-core/openjdk/openjdk-7-release-03b21.inc
+++ b/recipes-core/openjdk/openjdk-7-release-03b21.inc
@@ -93,7 +93,14 @@ ICEDTEAPATCHES = "\
 	file://icedtea-corba-parallel-make.patch;apply=no \
         file://icedtea-zero-hotspotfix.patch;apply=no \
 	"
-
+ICEDTEAPATCHES_append_powerpc = " \
+	file://icedtea-jdk-nio-use-host-cc.patch;apply=no \
+	file://icedtea-jdk-ppc64-jvm-cfg.patch;apply=no \
+        "
+ICEDTEAPATCHES_append_powerpc64 = " \
+	file://icedtea-jdk-nio-use-host-cc.patch;apply=no \
+	file://icedtea-jdk-ppc64-jvm-cfg.patch;apply=no \
+        "
 ICEDTEAPATCHES_append_libc-uclibc = " \
         file://icedtea-hotspot-isfinte.patch;apply=no \
         file://icedtea-hotspot-glibc-version.patch;apply=no \
@@ -129,4 +136,12 @@ DISTRIBUTION_PATCHES_append_libc-uclibc = "\
 	patches/icedtea-hotspot-dlvsym-uclibc.patch \
         "
 
+DISTRIBUTION_PATCHES_append_powerpc = " \
+	patches/icedtea-jdk-nio-use-host-cc.patch \
+	patches/icedtea-jdk-ppc64-jvm-cfg.patch \
+        "
+DISTRIBUTION_PATCHES_append_powerpc64 = " \
+	patches/icedtea-jdk-nio-use-host-cc.patch \
+	patches/icedtea-jdk-ppc64-jvm-cfg.patch \
+        "
 export DISTRIBUTION_PATCHES
-- 
1.7.9.5



