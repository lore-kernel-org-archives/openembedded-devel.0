Return-Path: <prvs=7639e01b5=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id BA24D748D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 21:14:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,266,1531778400"; d="scan'208";a="11913554"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Aug 2018 23:14:38 +0200
Message-ID: <20180820211443.32757-3-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180820211443.32757-1-richard.leitner@skidata.com>
References: <20180820211443.32757-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 2/7] openjdk-8: use openjdk_build_helper's ARCH translation functions
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
 recipes-core/openjdk/openjdk-8-common.inc | 43 +++----------------------------
 1 file changed, 3 insertions(+), 40 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 7348657..e45bcf4 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -160,46 +160,9 @@ do_configure_prepend() {
         export ${@jdk_environment_options(d)}
 }
 
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
-# Provides the target architecture to the configure script.
-export LLVM_CONFIGURE_ARCH="${@get_llvm_configure_arch(d)}"
-
-# OpenJDK uses slightly different names for certain arches. We need to know
-# this to create some files which are expected by the build.
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
+# Provide the translated target architectures
+export LLVM_CONFIGURE_ARCH="${@openjdk_build_helper_get_llvm_configure_arch(d)}"
+JDK_ARCH = "${@openjdk_build_helper_get_jdk_arch(d)}"
 
 export DEBUG_BINARIES = "true"
 
-- 
2.11.0


