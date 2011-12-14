Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RanJk-0004rB-4S
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 12:48:12 +0100
Received: by localhost (Postfix, from userid 1000)
	id BFF93440BFE; Wed, 14 Dec 2011 12:41:14 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2011 12:40:59 +0100
Message-Id: <45001489b044a53dce293335af5435f068d0d761.1323862499.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <a992bc4a3733a7074206ff7d767f6058fcdcfd14.1323862499.git.sledz@dresearch-fe.de>
References: <a992bc4a3733a7074206ff7d767f6058fcdcfd14.1323862499.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1323862499.git.sledz@dresearch-fe.de>
References: <cover.1323862499.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 4/5] icedtea6-native: fix problem on build hosts with linux kernel 3.x
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
X-List-Received-Date: Wed, 14 Dec 2011 11:48:12 -0000

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



