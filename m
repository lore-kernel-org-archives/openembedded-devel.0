Return-Path: <mohamad.noor.alim.hussin@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2707FA27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 07:21:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Dec 2019 23:21:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,378,1571727600"; d="scan'208";a="213554993"
Received: from hussinmo-desk.png.intel.com ([172.30.199.124])
	by orsmga008.jf.intel.com with ESMTP; 30 Dec 2019 23:21:45 -0800
From: mohamad.noor.alim.hussin@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2019 15:19:48 +0800
Message-Id: <20191231071948.28950-3-mohamad.noor.alim.hussin@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191231071948.28950-1-mohamad.noor.alim.hussin@intel.com>
References: <20191231071948.28950-1-mohamad.noor.alim.hussin@intel.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH v3 2/2] openjdk-12: Add test cases for openjdk-12
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
X-List-Received-Date: Tue, 31 Dec 2019 07:21:45 -0000
Content-Transfer-Encoding: 8bit

From: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>

There are 2 test cases added. Test case number 1 specifically to
test openjdk-12. The list of test cases as follows

 1) test_java12_jar_comp_mode
 2) test_java_runtime

1) test_java12_jar_comp_mode
This test case will execute java code in jar format using jvm compilation mode.

2) test_java_runtime
This test case will compile java code and execute with classpath.

Signed-off-by: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
---
 lib/oeqa/files/hello.java       |  5 +++++
 lib/oeqa/runtime/cases/java.py  | 15 +++++++++++++++
 lib/oeqa/runtime/cases/javac.py | 27 +++++++++++++++++++++++----
 3 files changed, 43 insertions(+), 4 deletions(-)
 create mode 100644 lib/oeqa/files/hello.java

diff --git a/lib/oeqa/files/hello.java b/lib/oeqa/files/hello.java
new file mode 100644
index 0000000..b750670
--- /dev/null
+++ b/lib/oeqa/files/hello.java
@@ -0,0 +1,5 @@
+class hello {
+    public static void main(String args[]){
+        System.out.println("Hello Java here!");
+    }
+}
diff --git a/lib/oeqa/runtime/cases/java.py b/lib/oeqa/runtime/cases/java.py
index c1e1498..9a73311 100644
--- a/lib/oeqa/runtime/cases/java.py
+++ b/lib/oeqa/runtime/cases/java.py
@@ -81,3 +81,18 @@ class JavaTest(OERuntimeTestCase):
 
         msg = 'Incorrect mode: %s' % output
         self.assertIn(', compiled mode)', output, msg=msg)
+
+    # As OpenJDK-12 doesn't support compiled mode (JIT) for arm yet we skip this
+    # test for now.
+    @OEHasPackage(["openjre-12", "openjdk-12"])
+    @OETestDepends(['java.JavaTest.test_java_exists'])
+    @skipIfInDataVar('TUNE_FEATURES', 'armv4', 'OpenJDK 12 compiled mode not yet supported for armv4')
+    @skipIfInDataVar('TUNE_FEATURES', 'armv5', 'OpenJDK 12 compiled mode not yet supported for armv5')
+    @skipIfInDataVar('TUNE_FEATURES', 'armv6', 'OpenJDK 12 compiled mode not yet supported for armv6')
+    def test_java12_jar_comp_mode(self):
+        status, output = self.target.run('java -showversion -Xcomp -jar /tmp/test.jar')
+        msg = 'Exit status was not 0. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        msg = 'Incorrect mode: %s' % output
+        self.assertIn(', compiled mode)', output, msg=msg)
diff --git a/lib/oeqa/runtime/cases/javac.py b/lib/oeqa/runtime/cases/javac.py
index 39ae298..06905b4 100644
--- a/lib/oeqa/runtime/cases/javac.py
+++ b/lib/oeqa/runtime/cases/javac.py
@@ -9,13 +9,22 @@ class JavacTest(OERuntimeTestCase):
     @classmethod
     def setUpClass(cls):
         myfilesdir = os.path.join(os.path.dirname(os.path.realpath(__file__)), '../../files/')
-        src = os.path.join(myfilesdir, 'test.java')
-        dst = '/tmp/test.java'
-        cls.tc.target.copyTo(src, dst)
+        java_src = ['test.java', 'hello.java']
+        for j in java_src:
+            src = os.path.join(myfilesdir, j)
+            dst = '/tmp/%s' % j
+            cls.tc.target.copyTo(src, dst)
 
     @classmethod
     def tearDownClass(cls):
-        dst = '/tmp/test.java /tmp/test.class'
+        java_src = ['test.java', 'hello.java']
+        dst = []
+        d = '/tmp'
+        for j in java_src:
+            jc = j.replace('.java', '.class')
+            dst.append(os.path.join(d, j))
+            dst.append(os.path.join(d, jc))
+        dst = ' '.join(dst)
         cls.tc.target.run('rm %s' % dst)
 
     @OETestDepends(['java.JavaTest.test_java_exists'])
@@ -29,3 +38,13 @@ class JavacTest(OERuntimeTestCase):
         status, output = self.target.run('javac /tmp/test.java')
         msg = 'Exit status was not 0. Output: %s' % output
         self.assertEqual(status, 0, msg=msg)
+
+    @OETestDepends(['javac.JavacTest.test_javac_works'])
+    def test_java_runtime(self):
+        status, output = self.target.run('javac /tmp/hello.java')
+        msg = 'Exit status was not 0. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        status, output = self.target.run('java -cp /tmp hello')
+        msg = 'Exit status was not 0. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
-- 
2.19.1


