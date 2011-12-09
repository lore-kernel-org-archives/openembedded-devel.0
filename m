Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RZ3v8-0001xO-4B
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 18:07:38 +0100
Received: by localhost (Postfix, from userid 1000)
	id 095F7440C47; Fri,  9 Dec 2011 18:00:46 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Dec 2011 18:00:27 +0100
Message-Id: <1323450027-31964-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
Cc: Steffen Sledz <sledz@dresearch.de>
Subject: [PATCH] icedtea6-native: fix problem on build hosts with linux kernel 3.x
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
X-List-Received-Date: Fri, 09 Dec 2011 17:07:38 -0000

From: Steffen Sledz <sledz@dresearch.de>

see http://bugs.sun.com/bugdatabase/view_bug.do?bug_id=7072341

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/icedtea/icedtea6-native.inc |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/recipes/icedtea/icedtea6-native.inc b/recipes/icedtea/icedtea6-native.inc
index 06da7c0..91d6075 100644
--- a/recipes/icedtea/icedtea6-native.inc
+++ b/recipes/icedtea/icedtea6-native.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Harness to build the source code from OpenJDK using Free Software build tools"
 HOMEPAGE = "http://icedtea.classpath.org"
 LICENSE  = "GPL with Classpath Exception"
-INC_PR = "r4"
+INC_PR = "r5"
 
 DEPENDS = "virtual/javac-native classpath-tools-native \
 	   virtual/java-native classpath-native \
@@ -108,6 +108,13 @@ do_configure_append() {
 			-e"s|g++\$(GCC_SUFFIX)|${CXX}|" \
 			$F
 	done
+
+	for F in openjdk/hotspot/make/linux/Makefile openjdk-ecj/hotspot/make/linux/Makefile ;
+	do
+		sed -i \
+			-e"s|SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 2.7%|SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3%|" \
+			$F
+	done
 }
 
 EXTRA_OEMAKE = ' \
-- 
1.7.7



