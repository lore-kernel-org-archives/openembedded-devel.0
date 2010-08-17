Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1OlK03-0001uy-T9
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 13:06:46 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OlJzV-0001Et-HH from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 04:06:01 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 17 Aug 2010 13:06:00 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Aug 2010 16:08:34 +0500
Message-Id: <1282043314-17275-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 17 Aug 2010 11:06:00.0213 (UTC)
	FILETIME=[2CC19C50:01CB3DFC]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Fahad Usman <fahad_usman@mentor.com>
Subject: [PATCH] cacaoh-native: Removed legacy style staging
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
X-List-Received-Date: Tue, 17 Aug 2010 11:06:46 -0000

* converted do_stage to do_install

* replaced ${STAGING_BINDIR} with ${D}${bindir}

* bumped the PR in the .bb files

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/cacao/cacaoh-native.inc       |    6 +++---
 recipes/cacao/cacaoh-native_0.99.3.bb |    2 +-
 recipes/cacao/cacaoh-native_0.99.4.bb |    2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes/cacao/cacaoh-native.inc b/recipes/cacao/cacaoh-native.inc
index a44c503..d255df4 100644
--- a/recipes/cacao/cacaoh-native.inc
+++ b/recipes/cacao/cacaoh-native.inc
@@ -20,7 +20,7 @@ do_compile() {
   oe_runmake -C src/vmcore libvmcore.la
   oe_runmake -C src/cacaoh cacaoh
 }
-
-do_stage() {
-	install -m 0755 src/cacaoh/.libs/cacaoh ${STAGING_BINDIR}/cacaoh-${PV}
+do_install() {
+	install -d ${D}${bindir}/cacaoh-${PV}
+	install -m 0755 src/cacaoh/.libs/cacaoh ${D}${bindir}/cacaoh-${PV}
 }
diff --git a/recipes/cacao/cacaoh-native_0.99.3.bb b/recipes/cacao/cacaoh-native_0.99.3.bb
index b3baee0..b321329 100644
--- a/recipes/cacao/cacaoh-native_0.99.3.bb
+++ b/recipes/cacao/cacaoh-native_0.99.3.bb
@@ -1,6 +1,6 @@
 require cacaoh-native.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-${PV}.tar.bz2"
 
diff --git a/recipes/cacao/cacaoh-native_0.99.4.bb b/recipes/cacao/cacaoh-native_0.99.4.bb
index a9effc0..e269e43 100644
--- a/recipes/cacao/cacaoh-native_0.99.4.bb
+++ b/recipes/cacao/cacaoh-native_0.99.4.bb
@@ -1,6 +1,6 @@
 require cacaoh-native.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-${PV}.tar.bz2"
 
-- 
1.6.3.3



