Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NUjZY-00021b-3v
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 17:26:27 +0100
Received: (qmail 18560 invoked by uid 813007); 12 Jan 2010 16:24:16 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 Jan 2010 16:24:16 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jan 2010 17:24:00 +0100
Message-Id: <1263313440-14774-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.6
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [STABLE][PATCH] classpath-native: disable-gjdoc, it calls antlr and fails without antlr installed on buildhost (runantlr from antlr-native is found by configure, but antlr.jar from staging doesn't work)
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
X-List-Received-Date: Tue, 12 Jan 2010 16:26:27 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/classpath/classpath-native.inc       |    1 +
 recipes/classpath/classpath-native_0.97.2.bb |    2 +-
 recipes/classpath/classpath-native_0.98.bb   |    2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/classpath/classpath-native.inc b/recipes/classpath/classpath-native.inc
index e7570c4..35a2485 100644
--- a/recipes/classpath/classpath-native.inc
+++ b/recipes/classpath/classpath-native.inc
@@ -30,6 +30,7 @@ EXTRA_OECONF = "\
   --disable-gtk-peer \
   --disable-plugin \
   --disable-dssi \
+  --disable-gjdoc \
   --enable-examples \
   --enable-tools \
   --includedir=${STAGING_INCDIR}/classpath \
diff --git a/recipes/classpath/classpath-native_0.97.2.bb b/recipes/classpath/classpath-native_0.97.2.bb
index 4de5602..b026f40 100644
--- a/recipes/classpath/classpath-native_0.97.2.bb
+++ b/recipes/classpath/classpath-native_0.97.2.bb
@@ -1,6 +1,6 @@
 require classpath-native.inc
 
-PR = "r6"
+PR = "r7"
 
 # The code affected by the javanet-local patch
 # is usually not compiled. However if someone changes
diff --git a/recipes/classpath/classpath-native_0.98.bb b/recipes/classpath/classpath-native_0.98.bb
index 6659178..a924b8a 100644
--- a/recipes/classpath/classpath-native_0.98.bb
+++ b/recipes/classpath/classpath-native_0.98.bb
@@ -3,7 +3,7 @@ require classpath-native.inc
 # Deadlocks occur on at least amd64 hosts.
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r2"
+PR = "r3"
 
 # The code affected by the javanet-local patch
 # is usually not compiled. However if someone changes
-- 
1.6.6





