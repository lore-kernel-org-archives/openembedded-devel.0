Return-Path: <prvs=883751090=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 606226067C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 15:02:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,368,1539640800"; d="scan'208";a="14055426"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Dec 2018 16:02:24 +0100
Message-ID: <20181218150224.23910-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH] oeqa: runtime: java: skip java7 comp test for powerpc
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
X-List-Received-Date: Tue, 18 Dec 2018 15:02:31 -0000
Content-Type: text/plain

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 lib/oeqa/runtime/cases/java.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/oeqa/runtime/cases/java.py b/lib/oeqa/runtime/cases/java.py
index 6bcdd03..142a49c 100644
--- a/lib/oeqa/runtime/cases/java.py
+++ b/lib/oeqa/runtime/cases/java.py
@@ -59,6 +59,7 @@ class JavaTest(OERuntimeTestCase):
     @skipIfDataVar('ARCH', 'x86', 'OpenJDK 7 compiled mode not yet supported for x86')
     @skipIfDataVar('ARCH', 'x86-64', 'OpenJDK 7 compiled mode not yet supported for x86-64')
     @skipIfDataVar('ARCH', 'ppc', 'OpenJDK 7 compiled mode not yet supported for ppc')
+    @skipIfDataVar('ARCH', 'powerpc', 'OpenJDK 7 compiled mode not yet supported for powerpc')
     def test_java7_jar_comp_mode(self):
         status, output = self.target.run('java -showversion -Xcomp -jar /tmp/test.jar')
         msg = 'Exit status was not 0. Output: %s' % output
-- 
2.11.0


