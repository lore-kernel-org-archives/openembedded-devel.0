Return-Path: <prvs=745a9cfa4=Andreas.Obergschwandtner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id B07E178BED
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2018 14:45:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,436,1526335200"; 
   d="scan'208";a="1587577"
From: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Aug 2018 16:45:22 +0200
Message-ID: <20180802144523.28023-1-andreas.obergschwandtner@skidata.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex4srv.skidata.net (192.168.111.82)
Subject: [meta-java][PATCH 1/2] classes:java: move version_specific_cflags to java.bbclass
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
X-List-Received-Date: Thu, 02 Aug 2018 14:45:34 -0000
Content-Type: text/plain

moved version_specific_cflags from openjfdk-8-common.inc to java.bbclass and
renamed it to java_version_specific_cflags because it will be used for a fix
in icedtea7

Signed-off-by: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
---
 classes/java.bbclass                      | 29 +++++++++++++++++++++
 recipes-core/openjdk/openjdk-8-common.inc | 31 ++---------------------
 2 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/classes/java.bbclass b/classes/java.bbclass
index aa012ab..906bf8e 100644
--- a/classes/java.bbclass
+++ b/classes/java.bbclass
@@ -28,6 +28,35 @@ STAGING_LIBDIR_JVM_NATIVE ?= "${STAGING_LIBDIR_NATIVE}/jvm"
 EXTRA_OEMAKE_remove_task-compile = "${PARALLEL_MAKE}"
 EXTRA_OEMAKE_remove_task-install = "${PARALLEL_MAKEINST}"
 
+# Determine the version specific compiler flags depending on the used
+# host gcc version
+def java_version_specific_cflags(d):
+    import re
+
+    extraflags = None
+    version = None
+
+    if bb.data.inherits_class('native', d):
+        from subprocess import Popen, PIPE
+
+        cmd = d.expand('${CC} -dumpversion').split()
+        cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
+        version = cc.communicate()[0].decode('utf-8')[0]
+    else:
+        # in the cross case, trust that GCCVERSION is correct. This won't
+        # work if the native toolchain is Clang, but as of this writing that
+        # doesn't work anyway.
+        version = d.getVar('GCCVERSION', expand=True)[0]
+        # skip non digit characters at the beginning, e.g. from "linaro-6.2%"
+        match = re.search("\d", version)
+        if match:
+            version = version[match.start():]
+
+    if version.isdigit():
+        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
+        return extraflags
+    return ''
+
 # OpenJDK supports parallel compilation but uses a plain number for this.
 # In OE we have PARALLEL_MAKE which is the actual option passed to make,
 # e.g. "-j 4".
diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 0af320d..5fae03a 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -224,33 +224,6 @@ FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 # version is and only add the flags that are appropriate for that GCC
 # version.
 
-def version_specific_cflags(d):
-    import re
-
-    extraflags = None
-    version = None
-
-    if bb.data.inherits_class('native', d):
-        from subprocess import Popen, PIPE
-
-        cmd = d.expand('${CC} -dumpversion').split()
-        cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
-        version = cc.communicate()[0].decode('utf-8')[0]
-    else:
-        # in the cross case, trust that GCCVERSION is correct. This won't
-        # work if the native toolchain is Clang, but as of this writing that
-        # doesn't work anyway.
-        version = d.getVar('GCCVERSION', expand=True)[0]
-        # skip non digit characters at the beginning, e.g. from "linaro-6.2%"
-        match = re.search("\d", version)
-        if match:
-            version = version[match.start():]
-
-    if version.isdigit():
-        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
-        return extraflags
-    return ''
-
-CFLAGS_append = " ${@version_specific_cflags(d)}"
-CXXFLAGS_append = " ${@version_specific_cflags(d)}"
+CFLAGS_append = " ${@java_version_specific_cflags(d)}"
+CXXFLAGS_append = " ${@java_version_specific_cflags(d)}"
 CXX_append = " -std=gnu++98"
-- 
2.17.1


