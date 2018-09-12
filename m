Return-Path: <prvs=786b59e7b=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 654D979636
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 07:02:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,363,1531778400"; 
   d="scan'208";a="1655785"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Sep 2018 09:03:42 +0200
Message-ID: <20180912070342.25022-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH] oeqa: runtime: java: skip java7 comp test for ppc
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
X-List-Received-Date: Wed, 12 Sep 2018 07:02:54 -0000
Content-Type: text/plain

Furthermore adapt the Known Limitations sections in the README.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 README                         | 33 ++++++++++++++++++++-------------
 lib/oeqa/runtime/cases/java.py |  1 +
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/README b/README
index 0f510d7..4119198 100644
--- a/README
+++ b/README
@@ -75,19 +75,26 @@ into your test image. More information on image testing is available at:
 Known Limitations/Bugs
 ----------------------
 
-OpenJDK:
-	The following OpenJDK version/target-architecture combinations currently
-	only support "interpreted mode":
-		openjdk-8 on arm except armv7
-		openjdk-7 on aarch64
-		openjdk-7 on x86
-		openjdk-7 on x86-64
-
-	The following target-architectures currently fail building
-	openjdk-7-jre, openjdk-7, openjdk-8 and openjre-8:
-		mips (tested with qemumips)
-		mips64 (tested with qemumips64)
-		ppc (tested with qemuppc)
+OpenJDK version/libc/target architecture support matrix:
+-------+-----------------+-----------------+-----------------+-----------------+
+       | OpenJDK-7/glibc | OpenJDK-7/musl  | OpenJDK-8/glibc | OpenJDK-8/musl  |
+-------+-----------------+-----------------+-----------------+-----------------+
+arm    |       O K       |  build failure  |    int. mode    |    int. mode    |
+-------+-----------------+-----------------+-----------------+-----------------+
+armv7  |       O K       |  build failure  |       O K       |       O K       |
+-------+-----------------+-----------------+-----------------+-----------------+
+arm64  |    int. mode    |  build failure  |       O K       |       O K       |
+-------+-----------------+-----------------+-----------------+-----------------+
+x86    |    int. mode    |  build failure  |       O K       |  build failure  |
+-------+-----------------+-----------------+-----------------+-----------------+
+x86-64 |    int. mode    |  build failure  |       O K       |       O K       |
+-------+-----------------+-----------------+-----------------+-----------------+
+mips   |  build failure  |  build failure  |  build failure  |  build failure  |
+-------+-----------------+-----------------+-----------------+-----------------+
+mips64 |  build failure  |  build failure  |  build failure  |  build failure  |
+-------+-----------------+-----------------+-----------------+-----------------+
+ppc    |    int. mode    |  build failure  |  build failure  |  build failure  |
+-------+-----------------+-----------------+-----------------+-----------------+
 
 If you encounter any other problems or bugs please report them to our mailing
 list at openembedded-devel@lists.openembedded.org.
diff --git a/lib/oeqa/runtime/cases/java.py b/lib/oeqa/runtime/cases/java.py
index 661b208..6bcdd03 100644
--- a/lib/oeqa/runtime/cases/java.py
+++ b/lib/oeqa/runtime/cases/java.py
@@ -58,6 +58,7 @@ class JavaTest(OERuntimeTestCase):
     @skipIfDataVar('ARCH', 'arm64', 'OpenJDK 7 compiled mode not yet supported for aarch64')
     @skipIfDataVar('ARCH', 'x86', 'OpenJDK 7 compiled mode not yet supported for x86')
     @skipIfDataVar('ARCH', 'x86-64', 'OpenJDK 7 compiled mode not yet supported for x86-64')
+    @skipIfDataVar('ARCH', 'ppc', 'OpenJDK 7 compiled mode not yet supported for ppc')
     def test_java7_jar_comp_mode(self):
         status, output = self.target.run('java -showversion -Xcomp -jar /tmp/test.jar')
         msg = 'Exit status was not 0. Output: %s' % output
-- 
2.11.0


