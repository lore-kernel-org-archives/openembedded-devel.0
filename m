Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0269F71AC1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 08:54:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA28sL97019700
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Nov 2017 01:54:22 -0700 (PDT)
Received: from pek-lpgtest5.wrs.com (128.224.153.85) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 2 Nov 2017 01:54:21 -0700
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Nov 2017 16:33:12 +0800
Message-ID: <1509611592-22825-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk-8-native, icedtea7-native: use JAVA_TOOL_OPTIONS from environment
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
X-List-Received-Date: Thu, 02 Nov 2017 08:54:21 -0000
Content-Type: text/plain

Solution on how to be able to build openjdk for a build
host that need the environment variable JAVA_TOOL_OPTIONS.
Use JAVA_TOOL_OPTIONS from environment. On some machines this is needed
in order to start java when the amount of RAM is limited for the user.

Author: Peter Bergin <peter.bergin@windriver.com>
Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 recipes-core/icedtea/icedtea7-native.inc                |  4 ++++
 recipes-core/openjdk/openjdk-8-native.inc               | 10 ++++++++++
 .../openjdk/patches-openjdk-8/handle_extra_output.patch | 17 +++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/handle_extra_output.patch

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 7d625eb..d4cf7ac 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -170,6 +170,10 @@ EXTRA_OEMAKE = ' \
                '
 
 do_compile() {
+	# Use JAVA_TOOL_OPTIONS from environment. On some machines this is needed
+	# in order to start java when the amount of RAM is limited for the user.
+	export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS}"
+
 	# OpenJDK uses slightly different names for certain arches. We need to know
 	#	this to create some files which are expected by the build.
 	case "${TRANSLATED_TARGET_ARCH}" in
diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
index fd97eff..20e1743 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -9,6 +9,8 @@ DEPENDS = "\
     ca-certificates-native openssl-native coreutils-native \
 "
 
+SRC_URI_append += "file://handle_extra_output.patch"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[x11] = "--with-x,,libx11-native xproto-native libxt-native libxext-native libxrender-native"
 PACKAGECONFIG[cups] = "--with-cups,,cups"
@@ -47,6 +49,14 @@ EXTRA_OEMAKE_append = ' \
     images \
 '
 
+do_configure_prepend() {
+    export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS}"
+}
+
+do_compile_prepend() {
+    export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS}"
+}
+
 do_compile_append() {
     set -x
     mkdir -p ${B}/certs
diff --git a/recipes-core/openjdk/patches-openjdk-8/handle_extra_output.patch b/recipes-core/openjdk/patches-openjdk-8/handle_extra_output.patch
new file mode 100644
index 0000000..52aad95
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/handle_extra_output.patch
@@ -0,0 +1,17 @@
+When adding the environment variable JAVA_TOOL_OPTIONS an extra line
+in the output from 'java -version' is produced. As this output is
+parsed by configure script the extra line has to be filtered out.
+
+Index: jdk8u-e8bed1496ff2/common/autoconf/boot-jdk.m4
+===================================================================
+--- jdk8u-e8bed1496ff2.orig/common/autoconf/boot-jdk.m4
++++ jdk8u-e8bed1496ff2/common/autoconf/boot-jdk.m4
+@@ -51,7 +51,7 @@ AC_DEFUN([BOOTJDK_DO_CHECK],
+             BOOT_JDK_FOUND=no
+           else
+             # Oh, this is looking good! We probably have found a proper JDK. Is it the correct version?
+-            BOOT_JDK_VERSION=`"$BOOT_JDK/bin/java" -version 2>&1 | head -n 1`
++            BOOT_JDK_VERSION=`"$BOOT_JDK/bin/java" -version 2>&1 | grep -v JAVA_TOOL_OPTIONS | head -n 1`
+ 
+             # Extra M4 quote needed to protect [] in grep expression.
+             [FOUND_VERSION_78=`echo $BOOT_JDK_VERSION | grep  '\"1\.[78]\.'`]
-- 
1.9.1


