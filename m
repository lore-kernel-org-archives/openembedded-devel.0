Return-Path: <bkylerussell@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id A0D726057A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 13:28:58 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id e63so2182460ith.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 06:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QZw8kd2+bvOEq1v/FU/dssOpv7v+Zp7UHfb3GFv49Nk=;
	b=UB+jasN8+NwHYASQ3hFFYyYOhJV/2xt+ANVAIalPZILquX8byVfZztULswK6hTL6FH
	X9osfQNPB/wFHegxPM1cYqLMEzw3F2p/XjJgwqXiZmO++ngcgsRxn3DTdo6REwECVBMl
	OFrCkeEV0lbrtUs4nErvY67YKR0U8OHcBvNFuQBCYiVk7XCblrBlv0IiVXzmaLsSyYQ3
	7H2Tv9luvwPvUmVpcbpZpWdX9LQ3WucycdK0JYNPISpar3KLL3N6N6UoCAGufyC2CpLr
	max+W8BA/gLXrM7iyAiHiBjGeamdrpP6aymF/Bvy05cgbLjXWdPa4yuR1JhXpmefLk4c
	fU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QZw8kd2+bvOEq1v/FU/dssOpv7v+Zp7UHfb3GFv49Nk=;
	b=cTYhAW602Bq0JdCqtgMPMW8LSzo8g28rQ2Ub0yqQ+quuVVXnSBa08kT7hElOTjUMbr
	aMiytg9XAkdtSCJCRQ6deY4ODkxaMS641WjlT6F0HQYXBFh0u4tT0K0E+Cbv+m5DoY1K
	L8VKf6sd+ffhi6pgcGg157lJeAB7mOwjhE970A8MCA6l0i757TkNz/Kss1cYQF1v2G1q
	j8WpGCyOiWlZrHlTaW/jnTZHKvowcKHup8Ys+O1SdpKXK5DboNcGFDOgS6CjuwQU/+RJ
	5+d/KugORM/kgZ2ItJQulibH1VZcH2sMD4+SIbhJ4iqBI1bPuvgdg9JcwQl9ewjvk11A
	Gjag==
X-Gm-Message-State: AEkoousejUfkVf3wVJAiS3EnCjHFsbtwM8yK+Bdv5wYKsIJ7Y6Dm4fs0uDKKpw+cmP5j1g==
X-Received: by 10.36.115.200 with SMTP id y191mr4308623itb.3.1472045338696;
	Wed, 24 Aug 2016 06:28:58 -0700 (PDT)
Received: from brrussell-Latitude-E6530.dhcp.lexmark.com ([192.146.101.8])
	by smtp.gmail.com with ESMTPSA id x196sm805210ite.3.2016.08.24.06.28.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Aug 2016 06:28:57 -0700 (PDT)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Aug 2016 09:28:40 -0400
Message-Id: <1472045320-26803-1-git-send-email-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-java][PATCH] Reimplement helper method for parallelizing JDK builds
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
X-List-Received-Date: Wed, 24 Aug 2016 13:28:58 -0000

Simplifies duplicated implementation across multiple recipes that all
inherited from java.bbclass.

Previously implementation was not flexible in supporting other make
job-limiting flags (like -l for load) that are typically passed in
through PARALLEL_MAKE.  (OpenJDK doesn't know about these other flags
that might have gotten tagged on after the value for -j.)

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 classes/java.bbclass                      | 17 ++++++++++++++++
 recipes-core/icedtea/icedtea7-native.inc  | 23 +---------------------
 recipes-core/openjdk/openjdk-7-common.inc | 32 +------------------------------
 recipes-core/openjdk/openjdk-8-common.inc | 21 --------------------
 recipes-core/openjdk/openjdk-8-cross.inc  |  6 +++---
 recipes-core/openjdk/openjdk-8-native.inc |  2 +-
 6 files changed, 23 insertions(+), 78 deletions(-)

diff --git a/classes/java.bbclass b/classes/java.bbclass
index fc97295..aa012ab 100644
--- a/classes/java.bbclass
+++ b/classes/java.bbclass
@@ -21,6 +21,23 @@ STAGING_DATADIR_JAVA_NATIVE ?= "${STAGING_DATADIR_NATIVE}/java"
 STAGING_LIBDIR_JNI_NATIVE ?= "${STAGING_LIBDIR_NATIVE}/jni"
 STAGING_LIBDIR_JVM_NATIVE ?= "${STAGING_LIBDIR_NATIVE}/jvm"
 
+# Icedtea's makefile is not compatible to parallelization so we cannot allow
+# passing a valid ${PARALLEL_MAKE} to it. OTOH OpenJDK's makefiles are
+# parallelizable and we need ${PARALLEL_MAKE} to derive the proper value.
+# The base for this quirk is that GNU Make only considers the last "-j" option.
+EXTRA_OEMAKE_remove_task-compile = "${PARALLEL_MAKE}"
+EXTRA_OEMAKE_remove_task-install = "${PARALLEL_MAKEINST}"
+
+# OpenJDK supports parallel compilation but uses a plain number for this.
+# In OE we have PARALLEL_MAKE which is the actual option passed to make,
+# e.g. "-j 4".
+def java_get_parallel_make(d):
+    pm = d.getVar('PARALLEL_MAKE', True);
+    if not pm or '-j' not in pm:
+        return 1
+
+    return pm.partition('-j')[2].strip().split(' ')[0]
+
 oe_jarinstall() {
   # Purpose: Install a jar file and create all the given symlinks to it.
   # Example:
diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 3344acb..d4c5c29 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -54,27 +54,8 @@ export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
 # which is already stripped.
 INSANE_SKIP_${PN} = "already-stripped"
 
-# OpenJDK supports parallel compilation but uses a plain number for this.
-# In OE we have PARALLEL_MAKE which is the actual option passed to make,
-# e.g. "-j 4".
-ICEDTEA_PARALLEL_MAKE := "${PARALLEL_MAKE}"
-PARALLEL_MAKE = ""
-def get_jdk7_native_jobs(d):
-    import bb
-
-    pm = bb.data.getVar('ICEDTEA_PARALLEL_MAKE', d, 1);
-    if not pm:
-        return "1"
-
-    pm = pm.split("j");
-    if (len(pm) == 2):
-        return pm[1].strip()
-
-    # Whatever found in PARALLEL_MAKE was not suitable.
-    return "1"
-
 EXTRA_OECONF = "\
-	--with-parallel-jobs=${@get_jdk7_native_jobs(d)} \
+	--with-parallel-jobs=${@java_get_parallel_make(d)} \
 	\
         --disable-tests \
         --disable-hotspot-tests \
@@ -273,5 +254,3 @@ do_install() {
 	# Fix missing write permissions on the files.
 	chmod ug+w -R ${JDK_INSTALL_DIR}
 }
-
-get_jdk7_native_jobs[vardepsexclude] += "ICEDTEA_PARALLEL_MAKE"
diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index f848a06..c491195 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -59,30 +59,6 @@ export CACAO_CONFIGURE_ARGS = " \
 
 JAVA_HOME[unexport] = "1"
 
-# OpenJDK supports parallel compilation but uses a plain number for this.
-# In OE we have PARALLEL_MAKE which is the actual option passed to make,
-# e.g. "-j 4".
-
-OPENJDK_PARALLEL_MAKE := "${PARALLEL_MAKE}"
-PARALLEL_MAKE =  ""
-
-def get_jdk7_jobs(d):
-    import bb
-
-    pm = bb.data.getVar('OPENJDK_PARALLEL_MAKE', d, 1);
-    if not pm:
-        return "1"
-
-    pm = pm.split("j");
-    if (len(pm) == 2):
-        return pm[1].strip()
-
-    # Whatever found in PARALLEL_MAKE was not suitable.
-    return "1"
-
-get_jdk7_jobs[vardepsexclude] += "OPENJDK_PARALLEL_MAKE"
-JDK_JOBS = "${@get_jdk7_jobs(d)}"
-
 EXTRA_OECONF = " \
     --enable-downloading=no \
     \
@@ -108,7 +84,7 @@ EXTRA_OECONF = " \
     --with-jdk-src-zip=${WORKDIR}/${JDK_FILE} \
     --with-langtools-src-zip=${WORKDIR}/${LANGTOOLS_FILE} \
     \
-    --with-parallel-jobs=${JDK_JOBS} \
+    --with-parallel-jobs=${@java_get_parallel_make(d)} \
     \
     --with-pkgversion=${PV} \
     --with-cc-for-build=${BUILD_CC} \
@@ -123,8 +99,6 @@ EXTRA_OECONF += " \
 "
 
 do_configure_prepend() {
-    echo "Configure with parallel-jobs: ${JDK_JOBS}"
-
     # Automatically copy everything that starts with "icedtea" (or "cacao") and ends with
     # ".patch" into the patches directory.
     find ${WORKDIR} -maxdepth 1 -name "icedtea*.patch" -exec cp {} ${S}/patches \;
@@ -138,10 +112,6 @@ do_configure_append() {
 # Work around broken variable quoting in oe-stable 2009 and provide the variable
 # via the environment which then overrides the erroneous value that was written
 # into '${ICETDEA}/Makefile'.
-# Icedtea's makefile is not compatible to parallelization so we cannot allow
-# passing a valid ${PARALLEL_MAKE} to it. OTOH OpenJDK's makefiles are
-# parallelizable and we need ${PARALLEL_MAKE} to derive the proper value.
-# The base for this quirk is that GNU Make only considers the last "-j" option.
 EXTRA_OEMAKE += 'CC="${CC}" CCC="${CXX}" CPP="${CPP}" CXX="${CXX}" CC_FOR_BUILD="${BUILD_CC}"'
 
 EXTRA_OEMAKE += ' \
diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index c2f9eb4..c339985 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -167,27 +167,6 @@ do_configure_prepend() {
         export ${@jdk_environment_options(d)}
 }
 
-# OpenJDK supports parallel compilation but uses a plain number for this.
-# In OE we have PARALLEL_MAKE which is the actual option passed to make,
-# e.g. "-j 4".
-OPENJDK8_PARALLEL_MAKE := "${PARALLEL_MAKE}"
-PARALLEL_MAKE = ""
-def get_jdk8_native_jobs(d):
-    import bb
-
-    pm = bb.data.getVar('OPENJDK8_PARALLEL_MAKE', d, 1);
-    if not pm:
-        return "1"
-
-    pm = pm.split("j");
-    if (len(pm) == 2):
-        return pm[1].strip()
-
-    # Whatever found in PARALLEL_MAKE was not suitable.
-    return "1"
-
-get_jdk8_native_jobs[vardepsexclude] += "OPENJDK8_PARALLEL_MAKE"
-
 # A function that is needed in the Shark builds.
 def get_llvm_configure_arch(d):
     import bb;
diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index 11e94ce..47fe35d 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -40,7 +40,7 @@ SRC_URI_append = "\
 "
 
 EXTRA_OECONF_append = "\
-    --with-jobs=${@get_jdk8_native_jobs(d)} \
+    --with-jobs=${@java_get_parallel_make(d)} \
     \
     --with-sys-root=${STAGING_DIR} \
     --with-tools-dir=${STAGING_DIR_NATIVE} \
@@ -65,13 +65,13 @@ do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'repack', 'true', 'false', d)} ; then
       if [ -d ${D}${JDK_HOME} ] ; then
         find ${D}${JDK_HOME} -name "*.jar" -print0 | \
-          xargs -0 -n1 -P ${@get_jdk8_native_jobs(d)} sh -c ' \
+          xargs -0 -n1 -P ${@java_get_parallel_make(d)} sh -c ' \
               echo "Repacking" "$0" ; \
               pack200 --repack --effort=9 --segment-limit=-1 --modification-time=latest --strip-debug "$0"'
       fi
       if [ -d ${D}${JRE_HOME} ] ; then
         find ${D}${JRE_HOME} -name "*.jar" -print0 | \
-          xargs -0 -n1 -P ${@get_jdk8_native_jobs(d)} sh -c ' \
+          xargs -0 -n1 -P ${@java_get_parallel_make(d)} sh -c ' \
               echo "Repacking" "$0" ; \
               pack200 --repack --effort=9 --segment-limit=-1 --modification-time=latest --strip-debug "$0"'
       fi
diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
index 91080d2..c7d3992 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -16,7 +16,7 @@ PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib-native"
 PACKAGECONFIG[jce] = "--enable-unlimited-crypto,,"
 
 EXTRA_OECONF_append = "\
-    --with-jobs=${@get_jdk8_native_jobs(d)} \
+    --with-jobs=${@java_get_parallel_make(d)} \
     \
     --with-sys-root=${STAGING_DIR_NATIVE} \
     --with-tools-dir=${STAGING_DIR_NATIVE} \
-- 
2.7.4


