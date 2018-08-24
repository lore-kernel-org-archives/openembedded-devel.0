Return-Path: <prvs=767db467e=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 0AE91795AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 07:09:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,281,1531778400"; 
   d="scan'208";a="1622953"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Aug 2018 09:10:29 +0200
Message-ID: <20180824071029.27238-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH] oeqa: runtime: java: enable test_java8_jar_comp_mode for armv7
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
X-List-Received-Date: Fri, 24 Aug 2018 07:09:55 -0000
Content-Type: text/plain

As commit "openjdk-8: add aarch32 port 8u172b11" introduced support for
the aarch32 port of openjdk-8 enable the test_java8_jar_comp_mode test
for ARMv7 machines. This is done by skipping the test only for machines
which have armv{4-6} in their tunes.

Furthermore update the "Known Limitations" section in the README.

This patch depends on OE-Core rev 10b935c713748346aea6c36c2f41e0ae6c320821,
named "oeqa/core/decorator: add skipIfInDataVar"

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 README                         | 2 +-
 lib/oeqa/runtime/cases/java.py | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/README b/README
index f7b8782..0f510d7 100644
--- a/README
+++ b/README
@@ -78,7 +78,7 @@ Known Limitations/Bugs
 OpenJDK:
 	The following OpenJDK version/target-architecture combinations currently
 	only support "interpreted mode":
-		openjdk-8 on arm
+		openjdk-8 on arm except armv7
 		openjdk-7 on aarch64
 		openjdk-7 on x86
 		openjdk-7 on x86-64
diff --git a/lib/oeqa/runtime/cases/java.py b/lib/oeqa/runtime/cases/java.py
index f2375a4..661b208 100644
--- a/lib/oeqa/runtime/cases/java.py
+++ b/lib/oeqa/runtime/cases/java.py
@@ -3,7 +3,7 @@ import os
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
-from oeqa.core.decorator.data import skipIfDataVar
+from oeqa.core.decorator.data import skipIfDataVar, skipIfInDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class JavaTest(OERuntimeTestCase):
@@ -70,7 +70,9 @@ class JavaTest(OERuntimeTestCase):
     # test for now.
     @OEHasPackage(["openjre-8", "openjdk-8"])
     @OETestDepends(['java.JavaTest.test_java_exists'])
-    @skipIfDataVar('ARCH', 'arm', 'OpenJDK 8 compiled mode not yet supported for arm')
+    @skipIfInDataVar('TUNE_FEATURES', 'armv4', 'OpenJDK 8 compiled mode not yet supported for armv4')
+    @skipIfInDataVar('TUNE_FEATURES', 'armv5', 'OpenJDK 8 compiled mode not yet supported for armv5')
+    @skipIfInDataVar('TUNE_FEATURES', 'armv6', 'OpenJDK 8 compiled mode not yet supported for armv6')
     def test_java8_jar_comp_mode(self):
         status, output = self.target.run('java -showversion -Xcomp -jar /tmp/test.jar')
         msg = 'Exit status was not 0. Output: %s' % output
-- 
2.11.0


