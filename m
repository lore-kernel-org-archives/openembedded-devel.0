Return-Path: <bkylerussell@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2DCA3770B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 21:58:14 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id d65so2029429ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 14:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t1LsPRfYve0WtcFMQeywp10gKmSCA+lBQGe6jWTTr/U=;
	b=GB+ipmCBvI+2pz10fZ56C9mGq2QfN4/hfInxPpqPTH/j4z2dXPuP2tqRer4ZD2O5EF
	DP1lRbAk6M59KhGmUu4Ifj4aqWYv/qsEapzmaYzjqXmgzK2aEmhjYlre2n5XKbVdMT4d
	V11MtOVNFYjRWK4zSqM6DzpEEHI8ezSU0aeYHrKfR1IiUdPih/JJy+bAmj6jNgF+fnpV
	D9tUukFprzOmg8MKfk3RFNxFdVHJzi01OB1yBb3Q/0XDeqybvWRcB/zOYoDWr2dctNnX
	1Bla76SyjLafnMLwUhnU55oPFnTglVwTECjNDtek8+UBikACEpSFZJhqhXg3Ela+16vE
	A9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t1LsPRfYve0WtcFMQeywp10gKmSCA+lBQGe6jWTTr/U=;
	b=XOT7mVTTq/hFlPTnv1hyrxKmTTAhY2SYMJbW2GMDUH7SHqYO2VsFpplrP0rSmceQXk
	5O9qETVGE6c4Lb3G4Z6zHKTXI7gzZr8tazsjN20kwrRwmb78xGbJMZG50J9P+GDi2uda
	stblYv+g3/oym6amqK7Ms9/J6GJu33vuUWZLK+qK0V8wmz5rznfhzLmVARbR0PNWtMvj
	uSCwMT0TdJfd6PRVB2Lx5Vt1mFO2sU8eCylMZFDjuGKJ52+kdjtITK9twZmuTcBzX9WL
	BpQeyUHyTb+qTfvbHEnaI7G88+RKowpU0cwL9MDuvLXh9CEK2LDm4FkZR1s3SugWfcaL
	JAnw==
X-Gm-Message-State: AEkoouv5hprduH54+A2BYd4vME2ijOFRt1sy+l/YTE4b1NxuBOHtkIW1al+ilO/Qd/OaHA==
X-Received: by 10.36.65.198 with SMTP id b67mr8123298itd.53.1471643894740;
	Fri, 19 Aug 2016 14:58:14 -0700 (PDT)
Received: from brrussell-Latitude-E6530.natcky.rr.com
	([2605:a000:1707:fb:9d01:5959:8426:336])
	by smtp.gmail.com with ESMTPSA id 16sm4207616iol.23.2016.08.19.14.58.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Aug 2016 14:58:14 -0700 (PDT)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Aug 2016 17:58:02 -0400
Message-Id: <1471643882-14235-2-git-send-email-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1471643882-14235-1-git-send-email-bkylerussell@gmail.com>
References: <1471643882-14235-1-git-send-email-bkylerussell@gmail.com>
Subject: [meta-java][PATCH 2/2] Reimplement helper method for parallelizing JDK builds
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
X-List-Received-Date: Fri, 19 Aug 2016 21:58:14 -0000

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
index 759b426..ba738cf 100644
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
     --disable-tests \
     --disable-hotspot-tests \
@@ -106,7 +82,7 @@ EXTRA_OECONF = " \
     --with-jdk-src-zip=${WORKDIR}/${JDK_FILE} \
     --with-langtools-src-zip=${WORKDIR}/${LANGTOOLS_FILE} \
     \
-    --with-parallel-jobs=${JDK_JOBS} \
+    --with-parallel-jobs=${@java_get_parallel_make(d)} \
     \
     --with-pkgversion=${PV} \
     --with-cc-for-build=${BUILD_CC} \
@@ -121,8 +97,6 @@ EXTRA_OECONF += " \
 "
 
 do_configure_prepend() {
-    echo "Configure with parallel-jobs: ${JDK_JOBS}"
-
     # Automatically copy everything that starts with "icedtea" (or "cacao") and ends with
     # ".patch" into the patches directory.
     find ${WORKDIR} -maxdepth 1 -name "icedtea*.patch" -exec cp {} ${S}/patches \;
@@ -136,10 +110,6 @@ do_configure_append() {
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


