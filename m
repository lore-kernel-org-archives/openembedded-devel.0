Return-Path: <prvs=7639e01b5=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id E8EDC78C7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 21:15:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,266,1531778400"; d="scan'208";a="11913586"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Aug 2018 23:16:13 +0200
Message-ID: <20180820211615.404-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180820211443.32757-1-richard.leitner@skidata.com>
References: <20180820211443.32757-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 5/7] openjdk-7: remove version dependent stuff from openjdk-common
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
X-List-Received-Date: Mon, 20 Aug 2018 21:15:42 -0000
Content-Type: text/plain

openjdk-common.inc should not contain any OpenJDK-7 dependet stuff.
Therefore move it to the openjdk-7-common.inc.

Furhtermore this is a preparation for having openjdk-common.inc for all
OpenJDK versions.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 38 +++++++++++++++++++++++++++++++
 recipes-core/openjdk/openjdk-common.inc   | 37 ------------------------------
 2 files changed, 38 insertions(+), 37 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 6b02a4f..6005394 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -1,4 +1,42 @@
+SUMMARY = "Java runtime based upon the OpenJDK- and Icedtea Project"
+HOMEPAGE = "http://icedtea.classpath.org"
+LICENSE  = "GPL-2.0-with-classpath-exception"
+PRIORITY = "optional"
+SECTION  = "libs"
+
+ICEDTEA_VERSION = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[1].split("-")[1] or '1.0'}"
+
+S = "${WORKDIR}/${ICEDTEA}"
+
+DEPENDS_append_libc-uclibc = " virtual/libiconv "
+
+# The OpenJDK build with interpreter optimizations for ARM depends on a binary
+# that generates constants for an assembler source file. There is no other
+# way than to generate this on a pseudo machine. Cross-compiling would not help
+# because structure sizes and/or alignment may differ.
+DEPENDS_append = " qemu-native "
+
+B = "${S}/build"
+
+JDK_HOME = "${libdir_jvm}/${JDK_DIR}"
+JDK_FAKE = "${WORKDIR}/fake-jdk"
+
+# Puts an OE specific string into the binary making it possible for the user
+# to know where it comes from (and blame the right people ...).
+DIST_ID = "Built for ${DISTRO}"
+DIST_NAME = "${DISTRO}"
+EXTRA_OEMAKE = 'DIST_NAME="${DIST_NAME}" DIST_ID="${DIST_ID}"'
+
+# llvm configure and compiles stuff
+export WANT_LLVM_RELEASE = "2.8"
+
+# Large stack is required at least on x86_64 host, otherwise random segfaults appear:
+QEMU = "${@qemu_target_binary(d)} ${QEMU_OPTIONS} -s 2097152"
+
+EXTRA_OEMAKE += 'QEMU="${QEMU}"'
+
 require openjdk-common.inc
+
 ICEDTEA = "icedtea-${ICEDTEA_VERSION}"
 
 INC_PR = "r6"
diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-core/openjdk/openjdk-common.inc
index ce3e39e..01a0a2a 100644
--- a/recipes-core/openjdk/openjdk-common.inc
+++ b/recipes-core/openjdk/openjdk-common.inc
@@ -1,44 +1,7 @@
-SUMMARY = "Java runtime based upon the OpenJDK- and Icedtea Project"
-HOMEPAGE = "http://icedtea.classpath.org"
-LICENSE  = "GPL-2.0-with-classpath-exception"
-PRIORITY = "optional"
-SECTION  = "libs"
-
-ICEDTEA_VERSION = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[1].split("-")[1] or '1.0'}"
-
-S = "${WORKDIR}/${ICEDTEA}"
-
-DEPENDS_append_libc-uclibc = " virtual/libiconv "
-
-# The OpenJDK build with interpreter optimizations for ARM depends on a binary
-# that generates constants for an assembler source file. There is no other
-# way than to generate this on a pseudo machine. Cross-compiling would not help
-# because structure sizes and/or alignment may differ.
-DEPENDS_append = " qemu-native "
-
 inherit java autotools gettext qemu pkgconfig
 inherit openjdk-build-helper
 
-B = "${S}/build"
-
 JDK_ARCH = "${@openjdk_build_helper_get_jdk_arch(d)}"
-JDK_HOME = "${libdir_jvm}/${JDK_DIR}"
-JDK_FAKE = "${WORKDIR}/fake-jdk"
-
-# Puts an OE specific string into the binary making it possible for the user
-# to know where it comes from (and blame the right people ...).
-DIST_ID = "Built for ${DISTRO}"
-DIST_NAME = "${DISTRO}"
-EXTRA_OEMAKE = 'DIST_NAME="${DIST_NAME}" DIST_ID="${DIST_ID}"'
-
-# llvm configure and compiles stuff
-
-export WANT_LLVM_RELEASE = "2.8"
 
 # Provides the target architecture to the configure script.
 export LLVM_CONFIGURE_ARCH="${@openjdk_build_helper_get_llvm_configure_arch(d)}"
-
-# Large stack is required at least on x86_64 host, otherwise random segfaults appear:
-QEMU = "${@qemu_target_binary(d)} ${QEMU_OPTIONS} -s 2097152"
-
-EXTRA_OEMAKE += 'QEMU="${QEMU}"'
-- 
2.11.0


