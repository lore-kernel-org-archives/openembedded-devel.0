Return-Path: <prvs=7639e01b5=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 4FEB978C7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 21:14:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,266,1531778400"; 
   d="scan'208";a="1615970"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Aug 2018 23:14:37 +0200
Message-ID: <20180820211443.32757-2-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180820211443.32757-1-richard.leitner@skidata.com>
References: <20180820211443.32757-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 1/7] openjdk-build-helper: add get_*_arch functions
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
X-List-Received-Date: Mon, 20 Aug 2018 21:14:14 -0000
Content-Type: text/plain

As different parts of OpenJDK use sightly different names for ARCH'es we
provide those translations functions centrally in our
openjdk-build-helper class.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 classes/openjdk-build-helper.bbclass | 51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/classes/openjdk-build-helper.bbclass b/classes/openjdk-build-helper.bbclass
index 78906b0..01ed591 100644
--- a/classes/openjdk-build-helper.bbclass
+++ b/classes/openjdk-build-helper.bbclass
@@ -49,3 +49,54 @@ def openjdk_build_helper_get_target_cflags(d):
     if match:
         version = version[match.start():]
     return openjdk_build_helper_get_cflags_by_cc_version(d, version)
+
+# OpenJDK uses slightly different names for certain arches. We need to know
+# this to create some files which are expected by the build.
+def openjdk_build_helper_get_jdk_arch(d):
+    import bb
+
+    jdk_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
+    if jdk_arch == "x86-64":
+        jdk_arch = "amd64"
+    elif jdk_arch == "powerpc":
+        jdk_arch = "ppc"
+    elif jdk_arch == "powerpc64":
+        jdk_arch = "ppc64"
+    elif jdk_arch in ['i486', 'i586', 'i686']:
+        jdk_arch = "i386"
+
+    return jdk_arch
+
+# Shark also needs slightly different names for certain arches. Due to the fact
+# these differ from the "normal" OpenJDK arch names we have a separate function
+# for Shark here. Furthermore we warn if we think Shark doesn't support the arch
+def openjdk_build_helper_get_llvm_configure_arch(d):
+    import bb;
+
+    arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
+    if arch in ['i386', 'i486', 'i586', 'i686', 'x86-64']:
+        arch = "x86"
+    elif arch in ['mipsel', 'mips']:
+        arch = "mips"
+    elif arch in ['powerpc', 'powerpc64']:
+        arch = "powerpc"
+    elif arch == "arm":
+        arch = "arm"
+    else:
+        if 'shark' in d.getVar('PACKAGECONFIG').split():
+            bb.warn("%s does not support %s in Shark builds yet" % (d.getVar('PN', True), arch) );
+
+    return arch
+
+# Again it seems IcedTea native also needs slightly different names for certain
+# arches. Therefore provide the translation.
+def openjdk_build_helper_get_icedtea_arch(d):
+    import bb;
+
+    arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
+    if arch == "x86-64":
+        arch = "amd64"
+    elif arch in ['i386', 'i486', 'i586', 'i686']:
+        arch = "x86"
+
+    return arch
-- 
2.11.0


