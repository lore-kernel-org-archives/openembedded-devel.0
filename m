Return-Path: <vinay.k.awasthi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 811DF75794
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 01:12:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 27 Aug 2015 18:12:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="792411660"
Received: from vinay-h97m-d3h.sc.intel.com ([172.25.115.5])
	by orsmga002.jf.intel.com with ESMTP; 27 Aug 2015 18:12:54 -0700
From: "Vinay K. Awasthi" <vinay.k.awasthi@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Aug 2015 18:14:01 -0700
Message-Id: <1440724441-692-1-git-send-email-vinay.k.awasthi@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-java][PATCH] OpenJDK-8: For x86 and ARM
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
X-List-Received-Date: Fri, 28 Aug 2015 01:12:58 -0000

From: "Vinay K. Awasthi" <vinay.k.awasthi@intel.com>

Rebased it again with latest change-set and tested it on oe-core master with latest mate-openembedded.

There is no change in recipe.

This enables OpenJDK-8 jre/jdk for x86 and ARM.

This recipe is tested for arm (zero VM) and x86 (hotspot vm).

To build just use bitbake openjdk-8.

Signed-off-by: Vinay K. Awasthi <vinay.k.awasthi@intel.com>
---
 .../openjdk-8-60b27/cacao-arm-ucontext.patch       |  24 +
 .../openjdk/openjdk-8-60b27/cacao-libtoolize.patch |  12 +
 .../openjdk-8-60b27/cacao-loadavg-makefile.patch   |  13 +
 .../openjdk/openjdk-8-60b27/cacao-loadavg.patch    |  27 +
 .../openjdk-8-60b27/faulty-nx-emulation.patch      |  12 +
 .../openjdk/openjdk-8-60b27/fix-checksums.patch    |  61 ++
 recipes-core/openjdk/openjdk-8-60b27/jvm.cfg       |  43 ++
 .../openjdk/openjdk-8-60b27/zero-build.patch       |  14 +
 recipes-core/openjdk/openjdk-8_60b27-2.5.4.bb      | 621 +++++++++++++++++++++
 recipes-images/images/java-test-image.bb           |   1 +
 10 files changed, 828 insertions(+)
 create mode 100644 recipes-core/openjdk/openjdk-8-60b27/cacao-arm-ucontext.patch
 create mode 100644 recipes-core/openjdk/openjdk-8-60b27/cacao-libtoolize.patch
 create mode 100644 recipes-core/openjdk/openjdk-8-60b27/cacao-loadavg-makefile.patch
 create mode 100644 recipes-core/openjdk/openjdk-8-60b27/cacao-loadavg.patch
 create mode 100644 recipes-core/openjdk/openjdk-8-60b27/faulty-nx-emulation.patch
 create mode 100644 recipes-core/openjdk/openjdk-8-60b27/fix-checksums.patch
 create mode 100644 recipes-core/openjdk/openjdk-8-60b27/jvm.cfg
 create mode 100644 recipes-core/openjdk/openjdk-8-60b27/zero-build.patch
 create mode 100644 recipes-core/openjdk/openjdk-8_60b27-2.5.4.bb

diff --git a/recipes-core/openjdk/openjdk-8-60b27/cacao-arm-ucontext.patch b/recipes-core/openjdk/openjdk-8-60b27/cacao-arm-ucontext.patch
new file mode 100644
index 0000000..c21fcf1
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-60b27/cacao-arm-ucontext.patch
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
diff --git a/recipes-core/openjdk/openjdk-8-60b27/cacao-libtoolize.patch b/recipes-core/openjdk/openjdk-8-60b27/cacao-libtoolize.patch
new file mode 100644
index 0000000..484cb10
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-60b27/cacao-libtoolize.patch
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
diff --git a/recipes-core/openjdk/openjdk-8-60b27/cacao-loadavg-makefile.patch b/recipes-core/openjdk/openjdk-8-60b27/cacao-loadavg-makefile.patch
new file mode 100644
index 0000000..a389206
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-60b27/cacao-loadavg-makefile.patch
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
diff --git a/recipes-core/openjdk/openjdk-8-60b27/cacao-loadavg.patch b/recipes-core/openjdk/openjdk-8-60b27/cacao-loadavg.patch
new file mode 100644
index 0000000..0fc1a81
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-60b27/cacao-loadavg.patch
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
diff --git a/recipes-core/openjdk/openjdk-8-60b27/faulty-nx-emulation.patch b/recipes-core/openjdk/openjdk-8-60b27/faulty-nx-emulation.patch
new file mode 100644
index 0000000..4d65917
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-60b27/faulty-nx-emulation.patch
@@ -0,0 +1,12 @@
+--- hotspot/src/os/linux/vm/os_linux.cpp	2015-03-07 10:25:19.000000000 -0800
++++ hotspot/src/os/linux/vm/os_linux.cpp	2015-03-07 10:25:19.000000000 -0800
++++ a.cpp	2015-07-23 11:45:17.666243540 -0700
+@@ -4847,7 +4847,7 @@
+   Linux::capture_initial_stack(JavaThread::stack_size_at_create());
+ 
+ #if defined(IA32)
+-  workaround_expand_exec_shield_cs_limit();
++//  workaround_expand_exec_shield_cs_limit();
+ #endif
+ 
+   Linux::libpthread_init();
diff --git a/recipes-core/openjdk/openjdk-8-60b27/fix-checksums.patch b/recipes-core/openjdk/openjdk-8-60b27/fix-checksums.patch
new file mode 100644
index 0000000..e9db990
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-60b27/fix-checksums.patch
@@ -0,0 +1,61 @@
+--- icedtea-2.5.4/Makefile.am	2015-04-02 10:48:12.919550836 +0200
++++ icedtea-2.5.4/Makefile.am	2015-04-02 10:49:41.483806147 +0200
+@@ -4,19 +4,19 @@
+ BUILD_VERSION = b13
+ COMBINED_VERSION = $(JDK_UPDATE_VERSION)-$(BUILD_VERSION)
+
+-CORBA_CHANGESET = 3c9f523bf96e
+-JAXP_CHANGESET = ca26767d3375
+-JAXWS_CHANGESET = 9a6c90336922
+-JDK_CHANGESET = 1e6db4f8b0f3
+-LANGTOOLS_CHANGESET = 960cdffa8b3f
+-OPENJDK_CHANGESET = 6cf2880aab5e
+-
+-CORBA_SHA256SUM = 7411fe2df795981124ae2e4da0ddb7d98db0a94c9399a12876be03e7177eaa0b
+-JAXP_SHA256SUM = 84623e50b69710d12209fc761a49953c78f1a664ff54e022a77e35e25489f2f3
+-JAXWS_SHA256SUM = 4bd38a8121d85c422b425177ce648afdee9da18812c91c5b74939c58db33ab4b
+-JDK_SHA256SUM = e99b65baf66d8818e3c8fd31d71fbad4ad0ceb0b7fa4c2e0607eca3a40f2ba09
+-LANGTOOLS_SHA256SUM = 4fd76cbdf18174128863514b4d3997cb623368697bf4f5af6d079dbbcd7b378a
+-OPENJDK_SHA256SUM = 88c92a3cab37446352086876771733229b1602d4f79ef68629a151180652e1f1
++CORBA_CHANGESET = be922f27d059
++JAXP_CHANGESET = 56f6ca79467d
++JAXWS_CHANGESET = 975eb04d1795
++JDK_CHANGESET = afbc08ea922b
++LANGTOOLS_CHANGESET = e8e293d0db49
++OPENJDK_CHANGESET = d50c3672fd18
++
++CORBA_SHA256SUM = 868083374cb6eb02ea5ab780f47702c224a50ea8dc7d9f67e10dcad9e731567d
++JAXP_SHA256SUM = 254c622fc8a572efd0a10908b4038ba3cf41775d7c09c8f576800b3f608e33f7
++JAXWS_SHA256SUM = eae19a40fdda776fc8bbe7f8f1ddbc8501d061026ffcd290b7cf8f9d7f8f0e20
++JDK_SHA256SUM = 089850622aea0778ef73e8e43845952c4d21456075b61d2ed04fd3461c002925
++LANGTOOLS_SHA256SUM = 632183f6a948decdbd9f784a2742d4902ac2ab5c87b24232b02afa5f6efe6050
++OPENJDK_SHA256SUM = 211d1a45b032066575e871ae4514f5db7f8313478a3ca9bad236c58e4892b48f
+
+ DROP_URL = http://icedtea.classpath.org/download/drops
+
+@@ -35,6 +35,7 @@
+ ICEDTEA_MAJOR = icedtea7
+ ICEDTEA_BRANCH = 2.5
+ ICEDTEA_PREFIX = $(ICEDTEA_MAJOR)-forest-$(ICEDTEA_BRANCH)
++ICEDTEA_PREFIX = jdk8u60
+ ICEDTEA_HG_URL = http://icedtea.classpath.org/hg/release/$(ICEDTEA_PREFIX)
+ ICEDTEA_URL = $(DROP_URL)/$(ICEDTEA_MAJOR)/$(ICEDTEA_RELEASE)
+
+@@ -403,6 +403,7 @@
+ endif
+
+ ICEDTEA_BOOT_PATCHES += $(DISTRIBUTION_BOOT_PATCHES)
++ICEDTEA_BOOT_PATCHES = "patches/boot/no.patch"
+
+ # OpenJDK build environment.
+ if ZERO_BUILD
+
+
+--- icedtea-2.5.4/hotspot.map.in	2015-01-22 05:28:55.952757442 +0100
++++ icedtea-2.5.4/hotspot.map.in	2015-04-07 10:41:38.713960082 +0200
+@@ -1,3 +1,3 @@
+ # version type(drop/hg) url changeset sha256sum
+-default drop http://icedtea.classpath.org/download/drops/icedtea7/@ICEDTEA_RELEASE@ 6144ca9b6a72 4825f8543aa0c065530b05b0a95915a44eea153bbb696d2ffc4b50a398813e34
++default drop http://icedtea.classpath.org/download/drops/icedtea7/@ICEDTEA_RELEASE@ 10ad4b9d79f9 a95c0a8a20a90f387096dc37d52e4d1e42e5ac9da3c48fbe264d2fd5d79e9ae0
+ aarch64 drop http://icedtea.classpath.org/download/drops/icedtea7/@ICEDTEA_RELEASE@ 4d25046abb67 60da8d427f7e3659f701e54c763ea8366d8af3280c7e10670004938b2f07efef
+
diff --git a/recipes-core/openjdk/openjdk-8-60b27/jvm.cfg b/recipes-core/openjdk/openjdk-8-60b27/jvm.cfg
new file mode 100644
index 0000000..ea97cda
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-60b27/jvm.cfg
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
diff --git a/recipes-core/openjdk/openjdk-8-60b27/zero-build.patch b/recipes-core/openjdk/openjdk-8-60b27/zero-build.patch
new file mode 100644
index 0000000..1c07102
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8-60b27/zero-build.patch
@@ -0,0 +1,14 @@
+---  hotspot/src/share/vm/interpreter/interpreterRuntime.cpp	2015-03-07 10:25:19.000000000 -0800
++++  hotspot/src/share/vm/interpreter/interpreterRuntime.cpp	2015-03-07 10:25:19.000000000 -0800
+@@ -407,7 +407,11 @@
+     // during deoptimization so the interpreter needs to skip it when
+     // the frame is popped.
+     thread->set_do_not_unlock_if_synchronized(true);
++#ifdef CC_INTERP
++    return (address) -1;
++#else
+     return Interpreter::remove_activation_entry();
++#endif
+   }
+ 
+   // Need to do this check first since when _do_not_unlock_if_synchronized
diff --git a/recipes-core/openjdk/openjdk-8_60b27-2.5.4.bb b/recipes-core/openjdk/openjdk-8_60b27-2.5.4.bb
new file mode 100644
index 0000000..68ef3b6
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-8_60b27-2.5.4.bb
@@ -0,0 +1,621 @@
+require openjdk-common.inc
+ICEDTEA = "icedtea-${ICEDTEA_VERSION}"
+
+SRC_URI = " \
+  ${ICEDTEA_URI} \
+  ${OPENJDK_URI} \
+  ${HOTSPOT_URI} \
+  ${CORBA_URI} \
+  ${JAXP_URI} \
+  ${JAXWS_URI} \
+  ${JDK_URI} \
+  ${LANGTOOLS_URI} \
+  ${CACAO_URI} \
+  ${JAMVM_URI} \
+  ${NASHORN_URI} \
+  ${OEPATCHES} \
+  file://jvm.cfg \
+  "
+
+JDKPN = "openjdk-8"
+JDK_DIR = "java-8-openjdk"
+
+PN = "${JDKPN}-jre"
+PROVIDES += "${JDKPN}"
+
+DEPENDS = " \
+           icedtea7-native zip-native ant-native \
+           zlib libxslt-native \
+	   jpeg libpng giflib \
+           gtk+ glib-2.0 \
+           cups fontconfig \
+	   rhino krb5 \
+	   libxt libxinerama libxrender libxtst libxi \
+	   freetype alsa-lib libffi \
+          "
+
+# No package should directly depend on this (it should require
+# java-runtime instead).
+PRIVATE_LIBS = "\
+	lib.so libunpack.so libverify.so libjava.so libzip.so libnpt.so \
+	libjava_crw_demo.so libhprof.so libjavanet.so libnio.so \
+	libmanagement.so libinstrument.so libjsound.so libjsoundalsa.so \
+	libj2pcsc.so libj2pkcs11.so libj2gss.so libmlib_image.so \
+	libawt.so libsplashscreen.so libfreetype.so.6 libfontmanager.so \
+	libjpeg.so liblcms.so librmi.so libjawt.so libjaas_unix.so \
+	libattach.so libjdwp.so libdt_socket.so libhpi.so libjli.so \
+	libmawt.so libjvm.so \
+	libversionCheck.so libcompiledMethodLoad.so libgctest.so \
+	libheapViewer.so libheapTracker.so libminst.so libmtrace.so \
+	libwaiters.so libhprof.so \
+       "
+
+export ALT_CUPS_HEADERS_PATH = "${STAGING_INCDIR}"
+export ALT_FREETYPE_HEADERS_PATH = "${STAGING_INCDIR}/freetype2"
+export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
+export CACAO_CONFIGURE_ARGS = " \
+	${@['','--enable-softfloat'][bb.data.getVar('TARGET_FPU',d,1) == 'soft']}"
+
+JAVA_HOME[unexport] = "1"
+
+# disable shark until it is fully working again
+# WITH_ADDITIONAL_VMS ?= "--with-additional-vms=shark,cacao,jamvm"
+
+WITH_ADDITIONAL_VMS ?= "--with-additional-vms=cacao,jamvm"
+
+# OpenJDK supports parallel compilation but uses a plain number for this.
+# In OE we have PARALLEL_MAKE which is the actual option passed to make,
+# e.g. "-j 4".
+
+OPENJDK_PARALLEL_MAKE := "${PARALLEL_MAKE}"
+PARALLEL_MAKE =  ""
+
+def get_jdk8_jobs(d):
+    import bb
+
+    pm = bb.data.getVar('OPENJDK_PARALLEL_MAKE', d, 1);
+    if not pm:
+        return "1"
+
+    pm = pm.split("j");
+    if (len(pm) == 2):
+        return pm[1].strip()
+
+    # Whatever found in PARALLEL_MAKE was not suitable.
+    return "1"
+
+JDK_JOBS = "${@get_jdk8_jobs(d)}"
+
+EXTRA_OECONF = " \
+        --disable-tests \
+	--disable-hotspot-tests \
+	--disable-langtools-tests \
+	--disable-jdk-tests \
+	--disable-docs \
+	--disable-nss \
+	--disable-system-lcms \
+	--disable-bootstrap \
+        --with-rhino=${STAGING_DATADIR_JAVA}/rhino.jar \
+	--with-jdk-home=${STAGING_LIBDIR_JVM_NATIVE}/icedtea7-native \
+        --with-openjdk-src-zip=${WORKDIR}/${OPENJDK_FILE} \
+	--with-hotspot-src-zip=${WORKDIR}/${HOTSPOT_FILE} \
+	--with-corba-src-zip=${WORKDIR}/${CORBA_FILE} \
+	--with-jaxp-src-zip=${WORKDIR}/${JAXP_FILE} \
+	--with-jaxws-src-zip=${WORKDIR}/${JAXWS_FILE} \
+	--with-jdk-src-zip=${WORKDIR}/${JDK_FILE} \
+	--with-langtools-src-zip=${WORKDIR}/${LANGTOOLS_FILE} \
+	--with-parallel-jobs=${JDK_JOBS} \
+	--with-pkgversion=${PV} \
+       "
+
+do_configure_prepend() {
+  bbnote "Copying and resetting patches...Configure with parallel-jobs: ${JDK_JOBS}"
+
+  # Automatically copy everything that starts with "icedtea" (or "cacao") and ends with
+  # ".patch" into the patches directory.
+  find ${WORKDIR} -maxdepth 1 -name "icedtea*.patch" -exec cp {} ${S}/patches \;
+  find ${WORKDIR} -maxdepth 1 -name "cacao*.patch" -exec cp {} ${S}/patches \;
+  find ${WORKDIR} -maxdepth 1 -name "zero*.patch" -exec cp {} ${S}/patches \;
+  find ${WORKDIR} -maxdepth 1 -name "faulty-nx-emulation.patch" -exec cp {} ${S}/patches \;
+  # Overwrite pr2124.patch about NamedCurve.java
+  > ${S}/patches/pr2124.patch 
+  # Overwrite rhino.patch about JavaScript
+  > ${S}/patches/rhino.patch 
+  > ${S}/patches/boot/no.patch
+  bbnote "No need to remove snmp etc.. from openjdk-8"
+  > ${S}/fsg.sh.in	
+}
+
+do_configure_append() {
+        # We are not removing any files from openjdk-8
+        bbnote "Applying remaining patches.."
+	oe_runmake patch
+}
+
+# Work around broken variable quoting in oe-stable 2009 and provide the variable
+# via the environment which then overrides the erroneous value that was written
+# into '${ICETDEA}/Makefile'.
+# Icedtea's makefile is not compatible to parallelization so we cannot allow
+# passing a valid ${PARALLEL_MAKE} to it. OTOH OpenJDK's makefiles are
+# parallelizable and we need ${PARALLEL_MAKE} to derive the proper value.
+# The base for this quirk is that GNU Make only considers the last "-j" option.
+EXTRA_OEMAKE += 'CC="${CC}" CCC="${CXX}" CPP="${CPP}" CXX="${CXX}" CC_FOR_BUILD="${BUILD_CC}"'
+
+EXTRA_OEMAKE += ' \
+                OE_CFLAGS="${TARGET_CFLAGS}" \
+                OE_CPPFLAGS="${TARGET_CPPFLAGS}" \
+                OE_CXXFLAGS="${TARGET_CXXFLAGS}" \
+                OE_LDFLAGS="${TARGET_LDFLAGS}" \
+                ZIPEXE="${STAGING_BINDIR_NATIVE}/zip" \
+		CROSS_COMPILE_ARCH="${JDK_ARCH}" \
+		REQUIRED_ALSA_VERSION="" \
+               '
+
+# Provides the target architecture to the configure script.
+export LLVM_CONFIGURE_ARCH="${@get_llvm_configure_arch(d)}"
+
+OE_LAUNCHER_LDFLAGS = "-Wl,-rpath-link,${STAGING_LIBDIR}/llvm${WANT_LLVM_RELEASE} -Wl,-rpath,${libdir}/llvm${WANT_LLVM_RELEASE}"
+
+OE_LAUNCHER_LDFLAGS_arm = ""
+
+EXTRA_OEMAKE += 'OE_LAUNCHER_LDFLAGS="${OE_LAUNCHER_LDFLAGS}"'
+
+
+OPENJDK_OECONF = " \
+     --openjdk-target=${TARGET_SYS} \         
+     --prefix=/usr                  \
+     --exec_prefix=/usr             \
+     --bindir=/usr/bin              \
+     --sbindir=/usr/sbin            \
+     --libexecdir=/usr/libexec      \
+     --datadir=/usr/share           \
+     --sysconfdir=/etc              \
+     --sharedstatedir=/com          \
+     --localstatedir=/var           \
+     --libdir=/usr/lib              \
+     --includedir=/usr/include      \
+     --oldincludedir=/usr/include   \
+     --infodir=/usr/share/info      \
+     --mandir=/usr/share/man        \
+     --disable-headful              \
+     --with-sys-root=${STAGING_DIR_TARGET} \
+     --with-boot-jdk=${STAGING_LIBDIR_JVM_NATIVE}/icedtea7-native \
+     CFLAGS="--sysroot=${STAGING_DIR_TARGET} " \
+     CXXFLAGS="--sysroot=${STAGING_DIR_TARGET} " \
+     LDFLAGS="--sysroot=${STAGING_DIR_TARGET} " \
+     --with-extra-cflags="--sysroot=${STAGING_DIR_TARGET} " \
+     --with-extra-cxxflags="--sysroot=${STAGING_DIR_TARGET} " \
+     --with-extra-ldflags="--sysroot=${STAGING_DIR_TARGET} " \
+     "
+
+def should_build_zero(d):
+    if (get_llvm_configure_arch(d) == "x86"):
+        return False
+    else:
+        return True
+
+def openjdk8_configuration(d):
+    if (should_build_zero(d) == True):
+        return "--with-jvm-variants=zero LIBFFI_LIBS=-lffi"
+    else:
+        return "--with-jvm-variants=server"
+
+def openjdk_configuration(d):
+    if (should_build_zero(d) == True):
+        return "LIBFFI_LIBS=-lffi"
+    else:
+        return ""
+
+# LIBFFI_LIBS needs to be in EXTRA_OECONF
+OPENJDK_OECONF += "${@openjdk8_configuration(d)}"
+EXTRA_OECONF += "${@openjdk_configuration(d)}"
+BUILD_ZERO = "${@should_build_zero(d)}"
+
+do_compile() {
+
+        OPENJDK8_BUILD_LOC=`pwd`
+	bbnote "3/3 Building final JDK @ ${OPENJDK8_BUILD_LOC}"
+        # Create dummy Defs.gmk
+        mkdir -p ${OPENJDK8_BUILD_LOC}/openjdk/jdk/make/common/
+        mkdir -p ${OPENJDK8_BUILD_LOC}/openjdk/jdk/make/common/shared/
+        > ${OPENJDK8_BUILD_LOC}/openjdk/jdk/make/common/shared/Defs.gmk
+
+        # we do not want MAKE=make
+        MAKE=/usr/bin/make
+        BUILD_LD=/usr/bin/gcc
+        ###############################################
+        # Icedtea Makefile creates openjdk directory and copies various Java tar files etc.. and
+        # and unpacks it...
+        # This is where we need to configure OpenJDK-8
+        ###############################################
+	# Build the final Hotspot + OpenJDK
+        #
+        for F in `find ${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/libffi -name sysroot-destdir`
+        do
+            #export LIBFFI_LIBS="-L${F}/usr/lib/ -lffi"
+            LIBFFI_LOC=$F
+        done
+        for H in `find ${LIBFFI_LOC} -name include`
+        do
+            #export LIBFFI_CFLAGS="-I${H}/"
+            ln -sf $H/ffi.h ${STAGING_INCDIR}/ffi.h 
+            ln -sf $H/ffitarget.h ${STAGING_INCDIR}/ffitarget.h 
+        done
+        bbnote "We are trying to not apply patches to icedTea Makefile.am etc.."
+        bbnote "This way changes to Makefile.am will not require us to regenerate patches..."
+        if [ -e ${OPENJDK8_BUILD_LOC}/openjdk/configure ] ; then
+          cd ${OPENJDK8_BUILD_LOC}/openjdk
+          chmod +x ${OPENJDK8_BUILD_LOC}/openjdk/configure
+          bbnote "Setting up NASHORN...."
+          ln -sf ${WORKDIR}/${NASHORN_FILE} ${OPENJDK8_BUILD_LOC}/nashorn.tar.bz2 
+          tar xf ${OPENJDK8_BUILD_LOC}/nashorn.tar.bz2 
+          if [ -e nashorn ] ; then
+              rm -rf nashorn
+          fi;
+          mv nashorn-${NASHORN_CHANGESET} nashorn
+          if [ "${BUILD_ZERO}" = "True" ] ; then
+              bbnote "Apply fixes to Openjdk source so that we can build Zero"
+              if patch -l -p0 --dry-run -s -t -f -F 0 < ${S}/patches/zero-build.patch ;  
+              then
+                  bbnote "zero-build fix..."
+                  patch -l -p0 < ${S}/patches/zero-build.patch
+              else 
+                  bbnote "Already patched for zero-build"
+              fi;
+
+              if patch -l -p0 --dry-run -s -t -f -F 0 < ${S}/patches/faulty-nx-emulation.patch ; 
+              then
+                  bbnote "faulty-nx-emulation fix"
+                  patch -l -p0 < ${S}/patches/faulty-nx-emulation.patch
+              else 
+                  bbnote "Already patched for nx-emulation"
+              fi;
+          fi;
+
+          bbnote "Configuring OpenJDK-8..."
+          ${OPENJDK8_BUILD_LOC}/openjdk/configure ${OPENJDK_OECONF} 
+        fi ;
+
+        cd ${OPENJDK8_BUILD_LOC}                     
+        cd openjdk
+
+        rm -rf ${B}/${BUILD_DIR}
+
+        bbnote "Building OpenJDK-8..."
+        oe_runmake DEBUG_BINARIES=true all
+        ############################################
+        # Use following to create compact profiles.
+        ############################################
+        # For JRE only --- oe_runmake profiles
+        # For JDK/JRE  --- oe_runmake images profiles
+        
+        cd build
+        # Remove all debug symbol files.
+        find . -name "*.diz" -exec rm {} \;
+
+        ln -sf ${OPENJDK8_BUILD_LOC}/openjdk/build/*/images ${B}/${BUILD_DIR}
+        echo ${B} ${BUILD_DIR} ${D}
+        ls -al ${B}/${BUILD_DIR}
+        cd ${OPENJDK8_BUILD_LOC}                     
+        bbnote "Done with building Openjdk-8..."
+
+        bbnote "Removing openjdk build created libjsig symlink"
+        for libjsig_symbol in `find . -type l | grep libjsig.so` 
+        do
+            echo $libjsig_symbol
+            cp --remove-destination `dirname $libjsig_symbol`/../libjsig.so $libjsig_symbol
+        done
+        pwd
+        bbnote "Done fixing QA symlink issue"
+
+        ############################################
+        # Use following to copy compact profiles.
+        ############################################
+        # bbnote "Use following to copy compact3 profiles"
+
+        # Copy comapct3 profile as JRE
+        # cp -r images/j2re-compact3-image/bin ${B}/${BUILD_DIR}/j2sdk-image/jre/
+        # cp -r images/j2re-compact3-image/lib ${B}/${BUILD_DIR}/j2sdk-image/jre/
+        # Do the same for j2re-image
+        # cp -r images/j2re-compact3-image/bin ${B}/${BUILD_DIR}/j2re-image/
+        # cp -r images/j2re-compact3-image/lib ${B}/${BUILD_DIR}/j2re-image/
+
+}
+
+do_install() {
+
+	install -d ${D}${libdir_jvm}
+	cp -R ${B}/${BUILD_DIR}/j2sdk-image ${D}${JDK_HOME}
+
+	chmod u+rw -R ${D}${JDK_HOME}
+
+	# JRE is a subset of JDK. So to save space and resemble what the BIG distros
+	# do we create symlinks from the JDK binaries to their counterparts in the
+	# JRE folder (which have to exist by that time b/c of dependencies).
+	for F in `find ${D}${JDK_HOME}/jre/bin -type f`
+	do
+		bf=`basename $F`
+		bbnote "replace:" $bf
+		rm ${D}${JDK_HOME}/bin/$bf
+		ln -s ${JDK_HOME}/jre/bin/$bf ${D}${JDK_HOME}/bin/$bf
+	done
+
+        install -m644 ${WORKDIR}/jvm.cfg  ${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
+        # workaround for shared libarary searching
+	ln -sf ${JDK_HOME}/jre/lib/${JDK_ARCH}/server/libjvm.so ${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
+}
+
+# Notes about the ideas behind packaging:
+# 1) User should install openjdk-8-jre. This is a provider of 'java-runtime'.
+# 2) This lets package mgmt install: openjdk-8-java
+# openjdk-8-common
+#
+# For x86:
+# We use hotspot VM as this is most optimal and fastest VM.
+# For ARM:
+# We use zero (interpreter mode) VM as hotspot is not yet compiling.
+# 
+# We need to install openjdk-8-jre for Java Runtime Support.
+# To enable compiling on target, install openjdk-8-jdk package.
+# 3) All other packages, including -jdk, are optional and not needed for normal Java apps.
+#PACKAGES = " \
+#            ${JDKPN}-jre \
+#	     ${JDKPN}-jre-dbg \
+#            ${JDKPN}-dbg \
+#            ${JDKPN}-demo-dbg \
+#            ${JDKPN}-demo \
+#            ${JDKPN}-source \
+#            ${JDKPN}-doc \
+#            ${JDKPN}-jdk \
+#            ${JDKPN}-java \
+#            ${JDKPN}-vm-shark \
+#            ${JDKPN}-vm-zero \
+#            ${JDKPN}-vm-cacao \
+#	     ${JDKPN}-vm-jamvm \
+#            ${JDKPN}-common \
+#           "
+
+PACKAGES = " \
+            ${JDKPN}-jre \
+            ${JDKPN}-jdk \
+            ${JDKPN}-java \
+            ${JDKPN}-common \
+            ${JDKPN}-src \
+            ${JDKPN}-vm-server \
+            ${JDKPN}-vm-client \
+            ${JDKPN}-doc \
+            ${JDKPN}-demo \
+            ${JDKPN}-source \
+           "
+
+FILES_${JDKPN}-dbg = "\
+	${JDK_HOME}/bin/.debug \
+	${JDK_HOME}/lib/.debug \
+	${JDK_HOME}/lib/${JDK_ARCH}/jli/.debug \
+	${JDK_HOME}/jre/bin/.debug \
+	${JDK_HOME}/jre/lib/.debug \
+	${JDK_HOME}/jre/lib/${JDK_ARCH}/.debug \
+	${JDK_HOME}/jre/lib/${JDK_ARCH}/jli/.debug \
+	${JDK_HOME}/jre/lib/${JDK_ARCH}/native_threads/.debug \
+	${JDK_HOME}/jre/lib/${JDK_ARCH}/server/.debug \
+	${JDK_HOME}/jre/lib/${JDK_ARCH}/headless/.debug \
+	${JDK_HOME}/jre/lib/${JDK_ARCH}/xawt/.debug \
+	${JDK_HOME}/jre/lib/${JDK_ARCH}/client/.debug \
+       "
+
+FILES_${JDKPN}-demo = "${JDK_HOME}/demo ${JDK_HOME}/sample"
+RDEPENDS_${JDKPN}-demo = "java-runtime"
+FILES_${JDKPN}-demo-dbg = "\
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
+FILES_${JDKPN}-source = "${JDK_HOME}/src.zip"
+
+FILES_${JDKPN}-java = "${JDK_HOME}/jre/bin/java"
+
+FILES_${JDKPN}-vm-server = "${JDK_HOME}/jre/lib/${JDK_ARCH}/server/"
+
+FILES_${JDKPN}-vm-client = "${JDK_HOME}/jre/lib/${JDK_ARCH}/client/"
+
+FILES_${JDKPN}-vm-zero = "${JDK_HOME}/jre/lib/${JDK_ARCH}/server/"
+
+FILES_${JDKPN}-vm-shark = "${JDK_HOME}/jre/lib/${JDK_ARCH}/shark/"
+
+FILES_${JDKPN}-vm-cacao = "${JDK_HOME}/jre/lib/${JDK_ARCH}/cacao/"
+
+FILES_${JDKPN}-vm-jamvm = "${JDK_HOME}/jre/lib/${JDK_ARCH}/jamvm/"
+
+FILES_${JDKPN}-common = "${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
+                          ${JDK_HOME}/jre/THIRD_PARTY_README \
+                          ${JDK_HOME}/jre/LICENSE \
+                          ${JDK_HOME}/ASSEMBLY_EXCEPTION \
+                          ${JDK_HOME}/THIRD_PARTY_README \
+                          ${JDK_HOME}/LICENSE \
+                          ${JDK_HOME}/release \
+                          ${JDK_HOME}/jre/lib \
+                         "
+
+FILES_${JDKPN}-jre_append = " \
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
+        ${JDK_HOME}/jre/bin/jjs \
+       "
+
+
+#RPROVIDES_${JDKPN}-vm-shark = "java2-vm"
+#RPROVIDES_${JDKPN}-vm-zero = "java2-vm"
+#RPROVIDES_${JDKPN}-vm-cacao = "java2-vm"
+#RPROVIDES_${JDKPN}-vm-jamvm = "java2-vm"
+#RPROVIDES_${JDKPN}-vm-jamvm = "java2-vm"
+
+# Even though a vm is a hard dependency it is set as RRECOMMENDS so a single vm can get uninstalled:
+# root@beaglebone:~/java# opkg remove openjdk-8-vm-shark
+# No packages removed.
+# Collected errors:
+#  * print_dependents_warning: Package openjdk-8-vm-shark is depended upon by packages:
+#  * print_dependents_warning: 	openjdk-8-java
+#  * print_dependents_warning: These might cease to work if package openjdk-8-vm-shark is removed.
+#RRECOMMENDS_${JDKPN}-java = "java2-vm"
+
+# For some reason shark and cacao do not automatically depends on -common.
+# So we add that manually.
+RDEPENDS_${JDKPN}-vm-shark = "${JDKPN}-common"
+RDEPENDS_${JDKPN}-vm-cacao = "${JDKPN}-common"
+RDEPENDS_${JDKPN}-vm-jamvm = "${JDKPN}-common"
+# With out this you may see md5 mismatches.
+RDEPENDS_${JDKPN}-common = "librhino-java"
+
+# There is a symlink to a .so but this one is valid.
+INSANE_SKIP_${JDKPN}-vm-shark = "dev-so"
+INSANE_SKIP_${JDKPN}-vm-zero = "dev-so"
+INSANE_SKIP_${JDKPN}-vm-cacao = "dev-so"
+INSANE_SKIP_${JDKPN}-vm-jamvm = "dev-so"
+INSANE_SKIP_${JDKPN}-common = "dev-so"
+
+FILES_${JDKPN}-jdk = " \
+                       ${JDK_HOME}/bin \
+                       ${JDK_HOME}/lib \
+                       ${JDK_HOME}/include \
+                      "
+RDEPENDS_${JDKPN}-jre = "${JDKPN}-java ${JDKPN}-common"
+RDEPENDS_${JDKPN}-java = "${JDKPN}-common"
+RPROVIDES_${JDKPN}-jre = "java-runtime"
+
+RDEPENDS_${JDKPN}-jdk = "${JDKPN}-jre"
+
+FILES_${JDKPN}-doc = "${JDK_HOME}/man"
+
+require openjdk-postinst.inc
+
+ALTERNATIVE_PRIORITY = "50"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+FILESPATH =. "${FILE_DIRNAME}/openjdk-8-60b27:"
+
+# Name of the directory containing the compiled output
+BUILD_DIR = "openjdk.build"
+BUILD_DIR_ECJ = "openjdk.build-ecj"
+
+ICEDTEA_URI = "http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=iced"
+
+#ICEDTEA_PREFIX = "icedtea7-forest-2.5"
+ICEDTEA_PREFIX = "jdk8u60"
+
+OPENJDK_HG_URL = "http://hg.openjdk.java.net/jdk8u/jdk8u60"
+
+OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
+OPENJDK_URI = "${OPENJDK_HG_URL}/archive/${OPENJDK_FILE};name=openjdk;unpack=false"
+
+HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.bz2"
+HOTSPOT_URI = "${OPENJDK_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
+
+CORBA_FILE = "${CORBA_CHANGESET}.tar.bz2"
+CORBA_URI = "${OPENJDK_HG_URL}/corba/archive/${CORBA_FILE};name=corba;unpack=false"
+
+JAXP_FILE = "${JAXP_CHANGESET}.tar.bz2"
+JAXP_URI = "${OPENJDK_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpack=false"
+
+JAXWS_FILE = "${JAXWS_CHANGESET}.tar.bz2"
+JAXWS_URI = "${OPENJDK_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;unpack=false"
+
+JDK_FILE = "${JDK_CHANGESET}.tar.bz2"
+JDK_URI = "${OPENJDK_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=false"
+
+LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.bz2"
+LANGTOOLS_URI = "${OPENJDK_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=langtools;unpack=false"
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
+NASHORN_FILE = "${NASHORN_CHANGESET}.tar.bz2"
+NASHORN_URI = "${OPENJDK_HG_URL}/nashorn/archive/${NASHORN_FILE};name=nashorn;unpack=false"
+
+# Allow overriding this separately
+OEPATCHES = "\
+	file://fix-checksums.patch \
+	file://cacao-libtoolize.patch \
+	file://cacao-loadavg-makefile.patch \
+	file://cacao-loadavg.patch;apply=no \
+	file://cacao-arm-ucontext.patch;apply=no \
+	file://zero-build.patch;apply=no \
+	file://faulty-nx-emulation.patch;apply=no \
+	"
+
+# overrride the jamvm patch for now, needs to be solved upstream
+do_unpackpost() {
+}
+
+addtask unpackpost after do_unpack before do_patch
+
+# Allow overriding this separately
+
+# Allow overriding this separately
+
+PR = "r0.1"
+
+SRC_URI[iced.md5sum] = "646064d7a8d57c2cae0ef35a05de57c8"
+SRC_URI[iced.sha256sum] = "5301b9a8592af2cf8e3e7a3650e5e1fe744c6d2de7f8ff78080b2eeae86a9800"
+
+CORBA_CHANGESET = "be922f27d059"
+SRC_URI[corba.md5sum] = "778ba99ed19c288d0d1b22f42d0c2107"
+SRC_URI[corba.sha256sum] = "868083374cb6eb02ea5ab780f47702c224a50ea8dc7d9f67e10dcad9e731567d"
+
+JAXP_CHANGESET = "56f6ca79467d"
+SRC_URI[jaxp.md5sum] = "f8b291ba2a3c1e2964bd96328e0ebcfc"
+SRC_URI[jaxp.sha256sum] = "254c622fc8a572efd0a10908b4038ba3cf41775d7c09c8f576800b3f608e33f7"
+
+JAXWS_CHANGESET = "975eb04d1795"
+SRC_URI[jaxws.md5sum] = "effc3c176b54d94042ef8351635c11d4"
+SRC_URI[jaxws.sha256sum] = "eae19a40fdda776fc8bbe7f8f1ddbc8501d061026ffcd290b7cf8f9d7f8f0e20"
+
+JDK_CHANGESET = "afbc08ea922b"
+SRC_URI[jdk.md5sum] = "b65ffbe132d4efea2fab5c8ccd36693c"
+SRC_URI[jdk.sha256sum] = "089850622aea0778ef73e8e43845952c4d21456075b61d2ed04fd3461c002925"
+
+LANGTOOLS_CHANGESET = "e8e293d0db49"
+SRC_URI[langtools.md5sum] = "35e388d87587131c28862fa244e99383"
+SRC_URI[langtools.sha256sum] = "632183f6a948decdbd9f784a2742d4902ac2ab5c87b24232b02afa5f6efe6050"
+
+OPENJDK_CHANGESET = "d50c3672fd18"
+SRC_URI[openjdk.md5sum] = "afd33e3218e49f7ecb3c3f90088d9d94"
+SRC_URI[openjdk.sha256sum] = "211d1a45b032066575e871ae4514f5db7f8313478a3ca9bad236c58e4892b48f"
+
+# located in hotspot.map
+HOTSPOT_CHANGESET = "10ad4b9d79f9"
+SRC_URI[hotspot.md5sum] = "cf3ae34a7a4f1aec5fb8a895e3ebf2e4"
+SRC_URI[hotspot.sha256sum] = "a95c0a8a20a90f387096dc37d52e4d1e42e5ac9da3c48fbe264d2fd5d79e9ae0"
+
+NASHORN_CHANGESET = "72a33aed7dcc"
+SRC_URI[nashorn.md5sum] = "ea2fdd450fbf186edf98619556eaa1ee"
+SRC_URI[nashorn.sha256sum] = "36752f1ab4b1fb66fd8be412a8d2b1cfa9cf0258db743dc79e1e8c9607f50ef8"
+
+
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INHIBIT_PACKAGE_STRIP = "1"
+
diff --git a/recipes-images/images/java-test-image.bb b/recipes-images/images/java-test-image.bb
index 22c7bdf..3c241e6 100644
--- a/recipes-images/images/java-test-image.bb
+++ b/recipes-images/images/java-test-image.bb
@@ -9,6 +9,7 @@ IMAGE_INSTALL = "busybox modutils-initscripts initscripts opkg udev sysvinit net
                  ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL} \
                  openjdk-7-jre openjdk-7-vm-zero openjdk-7-vm-jamvm openjdk-7-vm-cacao \
                  openjdk-6-jre openjdk-6-vm-zero openjdk-6-vm-jamvm openjdk-6-vm-cacao \
+                 openjdk-8-jre \
                  strace dropbear binutils \
                  classpath \
                  classpath-common \
-- 
1.8.1.2


