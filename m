Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1O1E39-0007Vo-FT
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Apr 2010 09:27:17 +0200
Received: (qmail 2157 invoked by uid 813007); 12 Apr 2010 07:23:50 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 Apr 2010 07:23:50 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Apr 2010 09:24:01 +0200
Message-Id: <1271057041-23857-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Robert Schuster <robertschuster@fsfe.org>
Subject: [STABLE][PATCH] classpath: Depend on antlr-native, increased resp. PRs.
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
X-List-Received-Date: Mon, 12 Apr 2010 07:27:17 -0000

From: Robert Schuster <robertschuster@fsfe.org>

Acked-by: Marcin Juszkiewicz <marcin@buglabs.net>

---
 recipes/classpath/classpath.inc       |    3 ++-
 recipes/classpath/classpath_0.95.bb   |    2 +-
 recipes/classpath/classpath_0.96.1.bb |    2 +-
 recipes/classpath/classpath_0.97.2.bb |    2 +-
 recipes/classpath/classpath_0.98.bb   |    2 +-
 5 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/recipes/classpath/classpath.inc b/recipes/classpath/classpath.inc
index bf630bf..06e236c 100644
--- a/recipes/classpath/classpath.inc
+++ b/recipes/classpath/classpath.inc
@@ -5,7 +5,7 @@ PRIORITY = "optional"
 LICENSE = "Classpath"
 PBN = "classpath"
 
-DEPENDS = "virtual/javac-native fastjar-native zip-native gmp"
+DEPENDS = "virtual/javac-native fastjar-native zip-native gmp antlr-native"
 RPROVIDES = ""
 
 RDEPENDS_${PN} = "${PBN}-common (>= ${PV})"
@@ -30,6 +30,7 @@ EXTRA_OECONF = "\
   --includedir=${includedir}/classpath \
   --with-vm=java \
   --disable-Werror \
+  --with-antlr-jar=${STAGING_DATADIR_JAVA_NATIVE}/antlr.jar \
   "
 
 inherit autotools
diff --git a/recipes/classpath/classpath_0.95.bb b/recipes/classpath/classpath_0.95.bb
index 6952cda..ccc1ece 100644
--- a/recipes/classpath/classpath_0.95.bb
+++ b/recipes/classpath/classpath_0.95.bb
@@ -6,7 +6,7 @@ SRC_URI += "\
   file://javanet-local.patch;patch=1;pnum=0 \
   "
 
-PR = "r6"
+PR = "r7"
 
 DEPENDS += "gtk+ gconf libxtst"
 
diff --git a/recipes/classpath/classpath_0.96.1.bb b/recipes/classpath/classpath_0.96.1.bb
index cc3505a..4e1288f 100644
--- a/recipes/classpath/classpath_0.96.1.bb
+++ b/recipes/classpath/classpath_0.96.1.bb
@@ -6,7 +6,7 @@ SRC_URI += "\
   file://javanet-local.patch;patch=1;pnum=0 \
   "
 
-PR = "r8"
+PR = "r9"
 
 DEPENDS += "gtk+ gconf libxtst"
 
diff --git a/recipes/classpath/classpath_0.97.2.bb b/recipes/classpath/classpath_0.97.2.bb
index 1daaa1a..e3b22fb 100644
--- a/recipes/classpath/classpath_0.97.2.bb
+++ b/recipes/classpath/classpath_0.97.2.bb
@@ -12,7 +12,7 @@ SRC_URI += "\
   file://gtk-fix.patch;patch=1;pnum=0 \
   "
 
-PR = "r8"
+PR = "r9"
 
 DEPENDS += "gtk+ gconf libxtst"
 
diff --git a/recipes/classpath/classpath_0.98.bb b/recipes/classpath/classpath_0.98.bb
index 13f7a72..6dc1e9e 100644
--- a/recipes/classpath/classpath_0.98.bb
+++ b/recipes/classpath/classpath_0.98.bb
@@ -7,7 +7,7 @@ SRC_URI += "\
   file://fix-gmp.patch;patch=1 \
   "
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS += "gtk+ gconf libxtst"
 
-- 
1.7.0.4





