Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f54.google.com (mail-yw1-f54.google.com
	[209.85.161.54])
	by mail.openembedded.org (Postfix) with ESMTP id F276178F78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 15:09:23 +0000 (UTC)
Received: by mail-yw1-f54.google.com with SMTP id j68-v6so13795444ywg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IPe+FVcC/XTlK8tRgLkpraYHJ+JoRsOwToRMy678FB4=;
	b=pOMD/uITSti2RNcOOeOMQ2tXkvkIq7wFHTpduoWzElMXgrgGsLUK4687PFKuO7JF0D
	WyJuMnDKzCeudh/OcKT7dg4IXVD9xmVPPvGe1ZayytIIwMCzxmpM30TnU7w+UaoPFH7u
	e92937BKyGY63OqnPTT/5ddcnQbw2+qHu77w/Bx1EyH0FsAuXOV4FRcw6nHLfAoXvRDr
	iQ0NMuSq1ypqZStkJ/crMZBGDxhqF2rTjp15LK4/vGDRbGSjiCA3WOecarZQZZmw9Srf
	OP170lU7d8Y1Eam6OFyGPGhLbl7xVySKctWiEyrw19wbGcB2S8wjHBr3KG4slfeCSCql
	u7cg==
X-Gm-Message-State: AOUpUlGm+eaP+v5deyhvL6zjHrJCSzhDbJG78uDWXFFGaid4GWluy/xo
	PqGAKT3pNt9T5nIqvbENkfltvr82
X-Google-Smtp-Source: AA+uWPxq+6g72c5VUbkGhF7pkPd2XiCuHEBSK0SikFKwudgWrBJXzFS9CbH6fN6C4mYWTPZ1gcKuTw==
X-Received: by 2002:a25:3624:: with SMTP id
	d36-v6mr9928530yba.292.1534172964496; 
	Mon, 13 Aug 2018 08:09:24 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	x19-v6sm8064106ywg.72.2018.08.13.08.09.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 08:09:23 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 16:09:17 +0100
Message-Id: <20180813150918.26582-2-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813150918.26582-1-git@andred.net>
References: <20180813150918.26582-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][PATCH v2 1/2] java.bbclass: move openjdk/icedtea specific code into new class
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
X-List-Received-Date: Mon, 13 Aug 2018 15:09:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The code moved is not relevant to anything using java, just for
compiling java itself. It doesn't make sense to have here.

Move it into openjdk-build-helper

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 classes/java.bbclass                      | 17 -----------------
 classes/openjdk-build-helper.bbclass      | 16 ++++++++++++++++
 recipes-core/icedtea/icedtea7-native.inc  |  3 ++-
 recipes-core/openjdk/openjdk-7-common.inc |  2 +-
 recipes-core/openjdk/openjdk-8-common.inc |  1 +
 recipes-core/openjdk/openjdk-8-cross.inc  |  2 +-
 recipes-core/openjdk/openjdk-8-native.inc |  2 +-
 recipes-core/openjdk/openjdk-common.inc   |  1 +
 8 files changed, 23 insertions(+), 21 deletions(-)
 create mode 100644 classes/openjdk-build-helper.bbclass

diff --git a/classes/java.bbclass b/classes/java.bbclass
index aa012ab..fc97295 100644
--- a/classes/java.bbclass
+++ b/classes/java.bbclass
@@ -21,23 +21,6 @@ STAGING_DATADIR_JAVA_NATIVE ?= "${STAGING_DATADIR_NATIVE}/java"
 STAGING_LIBDIR_JNI_NATIVE ?= "${STAGING_LIBDIR_NATIVE}/jni"
 STAGING_LIBDIR_JVM_NATIVE ?= "${STAGING_LIBDIR_NATIVE}/jvm"
 
-# Icedtea's makefile is not compatible to parallelization so we cannot allow
-# passing a valid ${PARALLEL_MAKE} to it. OTOH OpenJDK's makefiles are
-# parallelizable and we need ${PARALLEL_MAKE} to derive the proper value.
-# The base for this quirk is that GNU Make only considers the last "-j" option.
-EXTRA_OEMAKE_remove_task-compile = "${PARALLEL_MAKE}"
-EXTRA_OEMAKE_remove_task-install = "${PARALLEL_MAKEINST}"
-
-# OpenJDK supports parallel compilation but uses a plain number for this.
-# In OE we have PARALLEL_MAKE which is the actual option passed to make,
-# e.g. "-j 4".
-def java_get_parallel_make(d):
-    pm = d.getVar('PARALLEL_MAKE', True);
-    if not pm or '-j' not in pm:
-        return 1
-
-    return pm.partition('-j')[2].strip().split(' ')[0]
-
 oe_jarinstall() {
   # Purpose: Install a jar file and create all the given symlinks to it.
   # Example:
diff --git a/classes/openjdk-build-helper.bbclass b/classes/openjdk-build-helper.bbclass
new file mode 100644
index 0000000..785ddf0
--- /dev/null
+++ b/classes/openjdk-build-helper.bbclass
@@ -0,0 +1,16 @@
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
+def openjdk_build_helper_get_parallel_make(d):
+    pm = d.getVar('PARALLEL_MAKE', True);
+    if not pm or '-j' not in pm:
+        return 1
+
+    return pm.partition('-j')[2].strip().split(' ')[0]
diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 93463be..30fb24a 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -25,6 +25,7 @@ CXXFLAGS_append = " -fno-tree-dse"
 CXX_append = " -std=gnu++98"
 
 inherit native java autotools pkgconfig
+inherit openjdk-build-helper
 
 JAVA_HOME[unexport] = "1"
 
@@ -58,7 +59,7 @@ export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
 INSANE_SKIP_${PN} = "already-stripped"
 
 EXTRA_OECONF = "\
-	--with-parallel-jobs=${@java_get_parallel_make(d)} \
+	--with-parallel-jobs=${@openjdk_build_helper_get_parallel_make(d)} \
 	\
         --disable-tests \
         --disable-hotspot-tests \
diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 1ac3154..0ef6758 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -84,7 +84,7 @@ EXTRA_OECONF = " \
     --with-jdk-src-zip=${WORKDIR}/${JDK_FILE} \
     --with-langtools-src-zip=${WORKDIR}/${LANGTOOLS_FILE} \
     \
-    --with-parallel-jobs=${@java_get_parallel_make(d)} \
+    --with-parallel-jobs=${@openjdk_build_helper_get_parallel_make(d)} \
     \
     --with-pkgversion=${PV} \
     --with-cc-for-build=${BUILD_CC} \
diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index aaa4483..97bf6e1 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -5,6 +5,7 @@ LICENSE  = "GPL-2.0-with-classpath-exception"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3e0b59f8fac05c3c03d4a26bbda13f8f"
 
 inherit java autotools gettext qemu pkgconfig
+inherit openjdk-build-helper
 
 AUTOTOOLS_SCRIPT_PATH = "${S}/common/autoconf/"
 export AUTOCONF_DIR="${AUTOTOOLS_SCRIPT_PATH}"
diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index d0b2ec8..939155b 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -52,7 +52,7 @@ SRC_URI_append = "\
 "
 
 EXTRA_OECONF_append = "\
-    --with-jobs=${@java_get_parallel_make(d)} \
+    --with-jobs=${@openjdk_build_helper_get_parallel_make(d)} \
     \
     --with-sys-root=${STAGING_DIR_HOST} \
     --with-tools-dir=${STAGING_DIR_NATIVE} \
diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
index b782c32..e6f7933 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -20,7 +20,7 @@ PACKAGECONFIG[png] = "--with-libpng=system,--with-libpng=bundled,libpng-native"
 PACKAGECONFIG[zlib] = "--with-zlib=system,--with-zlib=bundled,zlib-native"
 
 EXTRA_OECONF_append = "\
-    --with-jobs=${@java_get_parallel_make(d)} \
+    --with-jobs=${@openjdk_build_helper_get_parallel_make(d)} \
     \
     --with-sys-root=${STAGING_DIR_NATIVE} \
     --with-tools-dir=${STAGING_DIR_NATIVE} \
diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-core/openjdk/openjdk-common.inc
index 816b463..8aa04f5 100644
--- a/recipes-core/openjdk/openjdk-common.inc
+++ b/recipes-core/openjdk/openjdk-common.inc
@@ -17,6 +17,7 @@ DEPENDS_append_libc-uclibc = " virtual/libiconv "
 DEPENDS_append = " qemu-native "
 
 inherit java autotools gettext qemu pkgconfig
+inherit openjdk-build-helper
 
 B = "${S}/build"
 
-- 
2.18.0


