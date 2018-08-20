Return-Path: <prvs=7639e01b5=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 5B944748D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 21:14:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,266,1531778400"; d="scan'208";a="11913555"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Aug 2018 23:14:40 +0200
Message-ID: <20180820211443.32757-5-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180820211443.32757-1-richard.leitner@skidata.com>
References: <20180820211443.32757-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 4/7] icedtea7-native: use openjdk_build_helper's ARCH translation functions
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

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 42 +++-----------------------------
 1 file changed, 3 insertions(+), 39 deletions(-)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 30fb24a..69f5d25 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -175,22 +175,8 @@ do_compile() {
 	# in order to start java when the amount of RAM is limited for the user.
 	export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS}"
 
-	# OpenJDK uses slightly different names for certain arches. We need to know
-	#	this to create some files which are expected by the build.
-	case "${TRANSLATED_TARGET_ARCH}" in
-		x86-64)
-			arch=amd64
-			libarch=amd64
-		;;
-		i386|i486|i586|i686)
-			arch=x86
-			libarch=x86
-		;;
-		*)
-			arch=${TARGET_ARCH}
-			libarch=${TARGET_ARCH}
-		;;
-	esac
+	arch="${@openjdk_build_helper_get_icedtea_arch(d)}"
+	libarch="${@openjdk_build_helper_get_icedtea_arch(d)}"
 
         install -d openjdk-boot/control/build/linux-$arch/hotspot/import/jre/lib
         if [ $libarch != $arch ]; then
@@ -217,30 +203,8 @@ do_compile() {
         oe_runmake icedtea
 }
 
-def jdk_arch(d):
-        import bb
-
-        target_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
-
-        if target_arch in ['i386', 'i486', 'i586', 'i686']:
-            return "x86"
-        elif target_arch in ['x86-64']:
-            return "amd64"
-
-        return target_arch
-
 do_install() {
-	case "${TRANSLATED_TARGET_ARCH}" in
-		x86-64)
-			JDK_ARCH=amd64
-		;;
-		i386|i486|i586|i686)
-			JDK_ARCH=x86
-		;;
-		*)
-			JDK_ARCH=${TARGET_ARCH}
-		;;
-	esac
+	JDK_ARCH="${@openjdk_build_helper_get_icedtea_arch(d)}"
 
 	install -d ${JDK_INSTALL_DIR}
 
-- 
2.11.0


