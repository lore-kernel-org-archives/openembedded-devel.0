Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NXapj-0001Mb-NE
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 14:42:58 +0100
Received: (qmail 11952 invoked by uid 813007); 20 Jan 2010 13:40:41 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 Jan 2010 13:40:40 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jan 2010 14:40:00 +0100
Message-Id: <1263994800-27565-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.6
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Robert Schuster <robertschuster@fsfe.org>
Subject: [STABLE][PATCH] jamvm-initial 1.x.y: Use 512MB for Xmx by default, install libjvm in private directory.
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
X-List-Received-Date: Wed, 20 Jan 2010 13:42:59 -0000

From: Robert Schuster <robertschuster@fsfe.org>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/jamvm/jamvm-initial_1.4.5.bb |    8 ++++++--
 recipes/jamvm/jamvm-initial_1.5.0.bb |    6 +++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/recipes/jamvm/jamvm-initial_1.4.5.bb b/recipes/jamvm/jamvm-initial_1.4.5.bb
index c71811d..1566deb 100644
--- a/recipes/jamvm/jamvm-initial_1.4.5.bb
+++ b/recipes/jamvm/jamvm-initial_1.4.5.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 
 DEPENDS = "zlib-native classpath-initial jikes-initial"
 
-PR = "r0"
+PR = "r1"
 
 PROVIDES = "virtual/java-initial"
 
@@ -19,12 +19,16 @@ ARM_INSTRUCTION_SET = "arm"
 
 inherit native autotools
 
+# libdir must be modified so that jamvm-initial and -native
+# do not interfere
 EXTRA_OECONF = "\
   --with-classpath-install-dir=${prefix} \
   --program-suffix=-initial \
+  --libdir=${STAGING_LIBDIR}/jamvm-initial \
   "
 
-CFLAGS += "-DDEFAULT_MAX_HEAP=16*MB"
+# jamvm-initial has to run some binaries which need lots of memory.
+CFLAGS += "-DDEFAULT_MAX_HEAP=512*MB"
 
 do_compile() {
   oe_runmake \
diff --git a/recipes/jamvm/jamvm-initial_1.5.0.bb b/recipes/jamvm/jamvm-initial_1.5.0.bb
index a1c415d..1566deb 100644
--- a/recipes/jamvm/jamvm-initial_1.5.0.bb
+++ b/recipes/jamvm/jamvm-initial_1.5.0.bb
@@ -19,12 +19,16 @@ ARM_INSTRUCTION_SET = "arm"
 
 inherit native autotools
 
+# libdir must be modified so that jamvm-initial and -native
+# do not interfere
 EXTRA_OECONF = "\
   --with-classpath-install-dir=${prefix} \
   --program-suffix=-initial \
+  --libdir=${STAGING_LIBDIR}/jamvm-initial \
   "
 
-CFLAGS += "-DDEFAULT_MAX_HEAP=16*MB"
+# jamvm-initial has to run some binaries which need lots of memory.
+CFLAGS += "-DDEFAULT_MAX_HEAP=512*MB"
 
 do_compile() {
   oe_runmake \
-- 
1.6.6





