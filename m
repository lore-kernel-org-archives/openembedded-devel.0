Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Psll9-0003RE-BD
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 01:42:15 +0100
Received: from gandalf.denix.org ([unknown] [71.251.49.88])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LH5001LHDVUW9R2@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	24 Feb 2011 18:40:43 -0600 (CST)
Received: from elrond.denix.org (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BBDAA14AF6A; Thu,
	24 Feb 2011 19:40:42 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Feb 2011 19:40:38 -0500
Message-id: <1298594438-8997-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/3][resend] bitbake.conf, native*.bbclass: pass --sysroot to TOOLCHAIN_OPTIONS
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
X-List-Received-Date: Fri, 25 Feb 2011 00:42:15 -0000

From: Denys Dmytriyenko <denys@ti.com>

Commit 9c5b9db29738a89837917b1a2d8ee5a1cae0b4cc (bitbake.conf: Simplify
TARGET_CPPFLAGS/LDFLAGS) potentially breaks external toolchains, when their
default sysroot is different from our sysroot/staging location.

Pass default --sysroot to compiler/linker through TOOLCHAIN_OPTIONS, avoiding
native and nativesdk packages. This matches the corresponding changes in Poky.
cross.bbclass was already doing it, since it originated from Poky, AFAIK.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 classes/native.bbclass    |    2 ++
 classes/nativesdk.bbclass |    2 ++
 conf/bitbake.conf         |    2 +-
 3 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/classes/native.bbclass b/classes/native.bbclass
index 000ad61..b8a792f 100644
--- a/classes/native.bbclass
+++ b/classes/native.bbclass
@@ -37,6 +37,8 @@ CXXFLAGS = "${BUILD_CFLAGS}"
 LDFLAGS = "${BUILD_LDFLAGS}"
 LDFLAGS_build-darwin = "-L${STAGING_LIBDIR_NATIVE} "
 
+TOOLCHAIN_OPTIONS = ""
+
 STAGING_BINDIR = "${STAGING_BINDIR_NATIVE}"
 STAGING_BINDIR_CROSS = "${STAGING_BINDIR_NATIVE}"
 
diff --git a/classes/nativesdk.bbclass b/classes/nativesdk.bbclass
index 6f21534..6689399 100644
--- a/classes/nativesdk.bbclass
+++ b/classes/nativesdk.bbclass
@@ -36,6 +36,8 @@ CFLAGS = "${BUILDSDK_CFLAGS}"
 CXXFLAGS = "${BUILDSDK_CFLAGS}"
 LDFLAGS = "${BUILDSDK_LDFLAGS}"
 
+TOOLCHAIN_OPTIONS = ""
+
 # Change to place files in SDKPATH
 prefix = "${SDKPATH}"
 exec_prefix = "${SDKPATH}"
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 34f7726..1002c01 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -460,7 +460,7 @@ export PATH
 ##################################################################
 
 CCACHE ?= ""
-TOOLCHAIN_OPTIONS = ""
+TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 TOOLCHAIN_PATH ?= "${STAGING_DIR_NATIVE}${prefix_native}/${BASE_PACKAGE_ARCH}"
 TOOLCHAIN_SYSPATH ?= "${TOOLCHAIN_PATH}/${TARGET_SYS}"
 
-- 
1.7.0.4



