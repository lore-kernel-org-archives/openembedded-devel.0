Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3ft4-0007Bh-AZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Aug 2012 06:16:18 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so8917811pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 21:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=jwKKcJa+4WZvTLnK3vZmBBnOSOC5qto6jEi30GbgAsA=;
	b=LIAUEqD5ra5Gofu31vc4whM1cjaEqyttbsH9avi4MjAkdIjlSwq2yUL+LfXBaitb+I
	TAjLxvfivLyXpwkGmXultnriuXVMF2ghjXYKefPjoPPzStlFbU81i8uGT1FZK3QJb78T
	0V70oq1x3UEKuZQssBNrrnxgBeJWm8dy/DzWivYOiqf+QD7YrfDAIMRfse2k+eL9xA+2
	Uk1bcUREoQPbTBKIuhGmDSnkUuW4ohksTu9KeFFcCSIlquHiAdcf2kU5teI0/wmk4d9F
	ZEQh+dxnIjAstkB641jlvtCO/BZitpfx3Y/i+3d8HxZ1dm//fmtx628D53bx8+bm9ub6
	rTFw==
Received: by 10.68.235.68 with SMTP id uk4mr40047817pbc.52.1345521856944;
	Mon, 20 Aug 2012 21:04:16 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id uj3sm526674pbc.39.2012.08.20.21.04.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 21:04:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 21:03:35 -0700
Message-Id: <1345521816-2364-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345521816-2364-1-git-send-email-raj.khem@gmail.com>
References: <1345521816-2364-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-java/openjdk-7.0][PATCH 6/7] icedtea-native: Remove 2.1 recipes and fix python spacing
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
X-List-Received-Date: Tue, 21 Aug 2012 04:16:18 -0000

Also fix the LICENSE when here
Moved to icedtea 2.1.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-core/icedtea/icedtea7-native.inc           |   62 ++++++++------------
 recipes-core/icedtea/icedtea7-native_2.1.bb        |    8 ---
 .../icedtea-remove_sparc_compiler_option.patch     |   13 ----
 recipes-core/icedtea/openjdk-7-release-03b147.inc  |   20 +++----
 4 files changed, 35 insertions(+), 68 deletions(-)
 delete mode 100644 recipes-core/icedtea/icedtea7-native_2.1.bb
 delete mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-remove_sparc_compiler_option.patch

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 75075d1..e209a68 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Harness to build the source code from OpenJDK using Free Software build tools"
 HOMEPAGE = "http://icedtea.classpath.org"
-LICENSE  = "GPL with Classpath Exception"
+LICENSE  = "GPL-2.0-with-classpath-exception"
 INC_PR = "r0"
 
 DEPENDS = "virtual/javac-native virtual/java-native classpath-native \
@@ -8,11 +8,13 @@ DEPENDS = "virtual/javac-native virtual/java-native classpath-native \
            libx11-native xproto-native libxt-native libxext-native libxrender-native \
            giflib-native jpeg-native libpng-native \
            glib-2.0-native freetype-native zlib-native \
-           fontconfig-native zip-native \
+           fontconfig-native zip-native alsa-lib-native \
           "
 
 inherit native java autotools
 
+JAVA_HOME[unexport] = "1"
+
 SRC_URI = " \
   ${ICEDTEA_URI} \
   ${OPENJDK_URI} \
@@ -36,33 +38,21 @@ export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
 # OpenJDK supports parallel compilation but uses a plain number for this.
 # In OE we have PARALLEL_MAKE which is the actual option passed to make,
 # e.g. "-j 4".
-
-def set_jdk7_native_jobs(d):
-        import bb
-
-        pm  = bb.data.getVar('PARALLEL_MAKE', d, 1)
-        pmi = bb.data.getVar('PARALLEL_MAKE_ICEDTEA', d, 1)
-
-        if not pmi:
-                pm = pm.split("j");
-                if (len(pm) == 2):
-                    bb.data.setVar('PARALLEL_MAKE_ICEDTEA', pm[1], d)
-        return
-
-PARALLEL = "${@set_jdk7_native_jobs(d)}"
-
+ICEDTEA_PARALLEL_MAKE := "${PARALLEL_MAKE}"
+PARALLEL_MAKE = ""
 def get_jdk7_native_jobs(d):
-        import bb
+    import bb
+
+    pm = bb.data.getVar('ICEDTEA_PARALLEL_MAKE', d, 1);
+    if not pm:
+        return "1"
 
-        ret = 1
-        pmoo = bb.data.getVar('PARALLEL_MAKE', d, 1)
-        if pmoo:
-               bb.data.setVar('PARALLEL_MAKE', "", d)
+    pm = pm.split("j");
+    if (len(pm) == 2):
+        return pm[1].strip()
 
-        pm = bb.data.getVar('PARALLEL_MAKE_ICEDTEA', d, 1)
-        if pm:
-              ret = pm
-        return ret
+    # Whatever found in PARALLEL_MAKE was not suitable.
+    return "1"
 
 JDK_JOBS = "${@get_jdk7_native_jobs(d)}"
 
@@ -97,10 +87,10 @@ JDK_DIR = "icedtea7-native"
 JDK_INSTALL_DIR = "${D}/${libdir_jvm}/${JDK_DIR}"
 
 do_configure_prepend() {
-        echo "Configure with parallel-jobs: ${PARALLEL}"
+        echo "Configure with parallel-jobs: ${JDK_JOBS}"
 
-        case "${TARGET_ARCH}" in
-                x86_64)
+        case "${TRANSLATED_TARGET_ARCH}" in
+                x86-64)
                         libarch=amd64
                 ;;
                 i386|i486|i586|i686)
@@ -160,7 +150,7 @@ do_configure_append() {
 }
 
 EXTRA_OEMAKE = ' \
-		OE_CFLAGS="${CFLAGS}" \
+                OE_CFLAGS="${CFLAGS}" \
                 OE_CPPFLAGS="${CPPFLAGS}" \
                 OE_CXXFLAGS="${CXXFLAGS}" \
                 OE_LDFLAGS="${LDFLAGS}" \
@@ -170,8 +160,8 @@ EXTRA_OEMAKE = ' \
 do_compile() {
 	# OpenJDK uses slightly different names for certain arches. We need to know
 	#	this to create some files which are expected by the build.
-	case "${TARGET_ARCH}" in
-		x86_64)
+	case "${TRANSLATED_TARGET_ARCH}" in
+		x86-64)
 			arch=amd64
 			libarch=amd64
 		;;
@@ -213,18 +203,18 @@ do_compile() {
 def jdk_arch(d):
         import bb
 
-        target_arch = bb.data.getVar('TARGET_ARCH', d, 1)
+        target_arch = bb.data.getVar('TRANSLATED_TARGET_ARCH', d, 1)
 
         if target_arch in ['i386', 'i486', 'i586', 'i686']:
             return "x86"
-        elif target_arch in ['x86_64']:
+        elif target_arch in ['x86-64']:
             return "amd64"
 
         return target_arch
 
 do_install() {
-	case "${TARGET_ARCH}" in
-		x86_64)
+	case "${TRANSLATED_TARGET_ARCH}" in
+		x86-64)
 			JDK_ARCH=amd64
 		;;
 		i386|i486|i586|i686)
diff --git a/recipes-core/icedtea/icedtea7-native_2.1.bb b/recipes-core/icedtea/icedtea7-native_2.1.bb
deleted file mode 100644
index 97e35d6..0000000
--- a/recipes-core/icedtea/icedtea7-native_2.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require openjdk-7-release-03b147.inc
-
-PR = "${INC_PR}.1"
-
-ICEDTEA = "icedtea-2.1"
-
-SRC_URI[iced.md5sum] = "60395bbd1e2820c4a35e61c80330df14"
-SRC_URI[iced.sha256sum] = "8492920dccae8b76bcb41f91f8d98b2dc619380531a679f1f9ea4e166ad02ec6"
diff --git a/recipes-core/icedtea/openjdk-7-03b147/icedtea-remove_sparc_compiler_option.patch b/recipes-core/icedtea/openjdk-7-03b147/icedtea-remove_sparc_compiler_option.patch
deleted file mode 100644
index be5ad85..0000000
--- a/recipes-core/icedtea/openjdk-7-03b147/icedtea-remove_sparc_compiler_option.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: openjdk/jdk/make/common/shared/Compiler-gcc.gmk
-===================================================================
---- openjdk/jdk/make/common/shared/Compiler-gcc.gmk	2012-05-26 14:43:49.342875981 +0200
-+++ openjdk/jdk/make/common/shared/Compiler-gcc.gmk	2012-05-26 15:21:25.514903711 +0200
-@@ -133,7 +133,7 @@
-     REQUIRED_GCC_VER = 4.0.*
-   endif
-   # Option used to create a shared library
--  SHARED_LIBRARY_FLAG = -shared -mimpure-text
-+  SHARED_LIBRARY_FLAG = -shared
-   SUN_COMP_VER := $(shell $(CC) --verbose 2>&1 )
- 
- endif
diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
index e021ffc..0932e22 100644
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
@@ -18,11 +18,11 @@ OPENJDK_URI = "${ICEDTEA_HG_URL}/archive/${OPENJDK_FILE};name=openjdk;unpack=fal
 SRC_URI[openjdk.md5sum] = "f98b0f7a69f9427a5b3775dddddc89cb"
 SRC_URI[openjdk.sha256sum] = "758227833982371e3a94def84226a947f8dbbd176517f313b8cb96840bdea41e"
 
-HOTSPOT_CHANGESET = "0e651e004747"
+HOTSPOT_CHANGESET = "8b7c4c5f6ba9"
 HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.gz"
 HOTSPOT_URI = "${ICEDTEA_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
-SRC_URI[hotspot.md5sum] = "edd627c8781161eb33006ed668d833e0"
-SRC_URI[hotspot.sha256sum] = "d68455e5cdb14280cd61155a4e9d531e90b073607f4367e93ead0fcf34476ae1"
+SRC_URI[hotspot.md5sum] = "cb45a8f19d77acc1f4f48e75e36a27fe"
+SRC_URI[hotspot.sha256sum] = "22866990d143e76ced94b76defa3051e5e5d9a51fd272d63daa0df272d6406a2"
 
 CORBA_CHANGESET = "5617f6c5cc94"
 CORBA_FILE = "${CORBA_CHANGESET}.tar.gz"
@@ -30,11 +30,11 @@ CORBA_URI = "${ICEDTEA_HG_URL}/corba/archive/${CORBA_FILE};name=corba;unpack=fal
 SRC_URI[corba.md5sum] = "920f1a788a7fdef29a5cd70892331251"
 SRC_URI[corba.sha256sum] = "963915483530f311ff313635f79ed11ea7ce5a1c0dbee5d1acb1994132857fa3"
 
-JAXP_CHANGESET = "1cf75c0e2c96"
+JAXP_CHANGESET = "7a8825b15df6"
 JAXP_FILE = "${JAXP_CHANGESET}.tar.gz"
 JAXP_URI = "${ICEDTEA_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpack=false"
-SRC_URI[jaxp.md5sum] = "56e609548b322149cb84604f232a4602"
-SRC_URI[jaxp.sha256sum] = "8ce48c704f38285207ee6dc56c45b2d214083b4d4d36be02901401b594ce701e"
+SRC_URI[jaxp.md5sum] = "a0982b6df79739127871e355a40ca5a6"
+SRC_URI[jaxp.sha256sum] = "297c8dbeed5afa5395b6be06b17282d53f8a888c2909074dfc1605afc0daf1c2"
 
 JAXWS_CHANGESET = "7edfbfe974f2"
 JAXWS_FILE = "${JAXWS_CHANGESET}.tar.gz"
@@ -42,11 +42,11 @@ JAXWS_URI = "${ICEDTEA_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;unpack=fal
 SRC_URI[jaxws.md5sum] = "2deecec809ea8e38835678889c2bc3ac"
 SRC_URI[jaxws.sha256sum] = "823ca6b8fd780bf1b1565a90cfc8ec6f0ee422a5d25ffb20b1ce0272dc4955aa"
 
-JDK_CHANGESET = "50f6f276a06c"
+JDK_CHANGESET = "d5ddeffc4651"
 JDK_FILE = "${JDK_CHANGESET}.tar.gz"
 JDK_URI = "${ICEDTEA_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=false"
-SRC_URI[jdk.md5sum] = "7ee77eeeff600c5a4763b4ac76fd62bc"
-SRC_URI[jdk.sha256sum] = "5f8b5edbebb358730425e64a31eaa11c346467ba10ffe1848f2d2ad2ea53bc3d"
+SRC_URI[jdk.md5sum] = "27c28d6be213df818490e69f12efe475"
+SRC_URI[jdk.sha256sum] = "e83e6234842376147a4c32451f23d629ba107e908ebdb0f367657f9cc6c1be98"
 
 LANGTOOLS_CHANGESET = "b534c4c6cd9b"
 LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.gz"
@@ -81,7 +81,6 @@ OPENJDK_PATCHES = " \
         file://icedtea-hotspot-make-arch-sane-for-x86.patch;apply=no \
         file://icedtea-jdk-sane-x86-arch.patch;apply=no \
 	file://icedtea-flags.patch;apply=no \
-        file://icedtea-remove_sparc_compiler_option.patch;apply=no \
         "
 
 #	file://icedtea-disable-desktop-dirs.patch;apply=no \
@@ -94,7 +93,6 @@ export DISTRIBUTION_PATCHES = " \
         patches/icedtea-hotspot-make-arch-sane-for-x86.patch \
         patches/icedtea-jdk-sane-x86-arch.patch \
 	patches/icedtea-flags.patch \
-        patches/icedtea-remove_sparc_compiler_option.patch \
         "
 
 #	patches/icedtea-disable-desktop-dirs.patch \
-- 
1.7.9.5



