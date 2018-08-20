Return-Path: <prvs=7639e01b5=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 0AEBF7909D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 21:14:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,266,1531778400"; 
   d="scan'208";a="1615971"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Aug 2018 23:14:39 +0200
Message-ID: <20180820211443.32757-4-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180820211443.32757-1-richard.leitner@skidata.com>
References: <20180820211443.32757-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 3/7] openjdk-7: use openjdk_build_helper's ARCH translation functions
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
X-List-Received-Date: Mon, 20 Aug 2018 21:14:15 -0000
Content-Type: text/plain

As the openjdk_build_helper now provides the ARCH translation function
use those and drop the local ones.

Furthermore remove the duplicated LLVM_CONFIGURE_ARCH export.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-7-common.inc |  3 ---
 recipes-core/openjdk/openjdk-common.inc   | 40 ++-----------------------------
 2 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 0ef6758..6b02a4f 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -126,9 +126,6 @@ EXTRA_OEMAKE += ' \
     UNZIP_BIN="${STAGING_BINDIR_NATIVE}/unzip" \
 '
 
-# Provides the target architecture to the configure script.
-export LLVM_CONFIGURE_ARCH="${@get_llvm_configure_arch(d)}"
-
 OE_LAUNCHER_LDFLAGS = "-Wl,-rpath-link,${STAGING_LIBDIR}/llvm${WANT_LLVM_RELEASE} -Wl,-rpath,${libdir}/llvm${WANT_LLVM_RELEASE}"
 
 OE_LAUNCHER_LDFLAGS_arm = ""
diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-core/openjdk/openjdk-common.inc
index 4e2eb94..ce3e39e 100644
--- a/recipes-core/openjdk/openjdk-common.inc
+++ b/recipes-core/openjdk/openjdk-common.inc
@@ -21,46 +21,10 @@ inherit openjdk-build-helper
 
 B = "${S}/build"
 
-# OpenJDK uses slightly different names for certain arches. We need to know
-#	this to create some files which are expected by the build.
-def get_jdk_arch(d):
-    import bb
-
-    jdk_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
-    if jdk_arch == "x86-64":
-        jdk_arch = "amd64"
-    elif jdk_arch == "powerpc":
-        jdk_arch = "ppc"
-    elif jdk_arch == "powerpc64":
-        jdk_arch = "ppc64"
-    elif (jdk_arch == "i486" or jdk_arch == "i586" or jdk_arch == "i686"):
-        jdk_arch = "i386"
-
-    return jdk_arch
-
-JDK_ARCH = "${@get_jdk_arch(d)}"
+JDK_ARCH = "${@openjdk_build_helper_get_jdk_arch(d)}"
 JDK_HOME = "${libdir_jvm}/${JDK_DIR}"
 JDK_FAKE = "${WORKDIR}/fake-jdk"
 
-# A function that is needed in the Shark builds.
-def get_llvm_configure_arch(d):
-    import bb;
-
-    arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
-    if arch == "x86-64" or arch == "i486" or arch == "i586" or arch == "i686":
-        arch = "x86"
-    elif arch == "arm":
-        arch = "arm"
-    elif arch == "mipsel" or arch == "mips":
-        arch = "mips"
-    elif arch == "powerpc" or arch == "powerpc64":
-        arch = "powerpc"
-    else:
-        if 'shark' in d.getVar('PACKAGECONFIG').split():
-            bb.warn("%s does not support %s in Shark builds yet" % (d.getVar('PN', True), arch) );
-
-    return arch
-
 # Puts an OE specific string into the binary making it possible for the user
 # to know where it comes from (and blame the right people ...).
 DIST_ID = "Built for ${DISTRO}"
@@ -72,7 +36,7 @@ EXTRA_OEMAKE = 'DIST_NAME="${DIST_NAME}" DIST_ID="${DIST_ID}"'
 export WANT_LLVM_RELEASE = "2.8"
 
 # Provides the target architecture to the configure script.
-export LLVM_CONFIGURE_ARCH="${@get_llvm_configure_arch(d)}"
+export LLVM_CONFIGURE_ARCH="${@openjdk_build_helper_get_llvm_configure_arch(d)}"
 
 # Large stack is required at least on x86_64 host, otherwise random segfaults appear:
 QEMU = "${@qemu_target_binary(d)} ${QEMU_OPTIONS} -s 2097152"
-- 
2.11.0


