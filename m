Return-Path: <prvs=7572862bc=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id E54B878F73
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 10:11:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,237,1531778400"; 
   d="scan'208";a="1606432"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Aug 2018 12:11:50 +0200
Message-ID: <20180814101150.6817-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH] oeqa: runtime: java: skip not supported version/arch combinations
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
X-List-Received-Date: Tue, 14 Aug 2018 10:11:29 -0000
Content-Type: text/plain

The following OpenJDK Version/Target architecture combinations are
currently not supported with "compiled mode" aka JIT:

    OpenJRE-8 on arm
    OpenJDK-7 on aarch64
    OpenJDK-7 on x86
    OpenJDK-7 on x86-64

Therefore we skip the correspoding oeqa runtime tests for now.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 lib/oeqa/runtime/cases/java.py | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/lib/oeqa/runtime/cases/java.py b/lib/oeqa/runtime/cases/java.py
index feb572b..f2375a4 100644
--- a/lib/oeqa/runtime/cases/java.py
+++ b/lib/oeqa/runtime/cases/java.py
@@ -3,6 +3,7 @@ import os
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class JavaTest(OERuntimeTestCase):
@@ -50,8 +51,27 @@ class JavaTest(OERuntimeTestCase):
         msg = 'Incorrect mode: %s' % output
         self.assertIn(', interpreted mode)', output, msg=msg)
 
+    # As OpenJDK-7 doesn't support compiled mode (JIT) for all architectures yet
+    # we skip these tests for now.
+    @OEHasPackage(["openjdk-7-jre", "openjdk-7"])
     @OETestDepends(['java.JavaTest.test_java_exists'])
-    def test_java_jar_comp_mode(self):
+    @skipIfDataVar('ARCH', 'arm64', 'OpenJDK 7 compiled mode not yet supported for aarch64')
+    @skipIfDataVar('ARCH', 'x86', 'OpenJDK 7 compiled mode not yet supported for x86')
+    @skipIfDataVar('ARCH', 'x86-64', 'OpenJDK 7 compiled mode not yet supported for x86-64')
+    def test_java7_jar_comp_mode(self):
+        status, output = self.target.run('java -showversion -Xcomp -jar /tmp/test.jar')
+        msg = 'Exit status was not 0. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        msg = 'Incorrect mode: %s' % output
+        self.assertIn(', compiled mode)', output, msg=msg)
+
+    # As OpenJDK-8 doesn't support compiled mode (JIT) for arm yet we skip this
+    # test for now.
+    @OEHasPackage(["openjre-8", "openjdk-8"])
+    @OETestDepends(['java.JavaTest.test_java_exists'])
+    @skipIfDataVar('ARCH', 'arm', 'OpenJDK 8 compiled mode not yet supported for arm')
+    def test_java8_jar_comp_mode(self):
         status, output = self.target.run('java -showversion -Xcomp -jar /tmp/test.jar')
         msg = 'Exit status was not 0. Output: %s' % output
         self.assertEqual(status, 0, msg=msg)
-- 
2.11.0


