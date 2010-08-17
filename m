Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1OlKGt-00029D-1S
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 13:24:01 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OlKGZ-0002Um-L8 from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 04:23:39 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 17 Aug 2010 13:23:38 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Aug 2010 16:26:13 +0500
Message-Id: <1282044373-17782-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 17 Aug 2010 11:23:38.0295 (UTC)
	FILETIME=[A36C1C70:01CB3DFE]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Fahad Usman <fahad_usman@mentor.com>
Subject: [PATCH] cacaoh-native: used oe-stylize.py
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
X-List-Received-Date: Tue, 17 Aug 2010 11:24:01 -0000

* just incorporated the output of oe-stylize.py, no functionality is changed

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/cacao/cacaoh-native.inc       |    7 +++----
 recipes/cacao/cacaoh-native_0.99.3.bb |    5 ++---
 recipes/cacao/cacaoh-native_0.99.4.bb |    5 ++---
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/recipes/cacao/cacaoh-native.inc b/recipes/cacao/cacaoh-native.inc
index d255df4..fcbe93b 100644
--- a/recipes/cacao/cacaoh-native.inc
+++ b/recipes/cacao/cacaoh-native.inc
@@ -1,7 +1,6 @@
 DESCRIPTION = "Header generator for Cacao JVM - Needed for cross-compilation builds"
 HOMEPAGE = "http://www.cacaojvm.org/"
-LICENSE  = "GPL"
-
+LICENSE = "GPL"
 DEPENDS = "libtool-native zlib-native virtual/javac-native classpath-native"
 
 S = "${WORKDIR}/cacao-${PV}"
@@ -21,6 +20,6 @@ do_compile() {
   oe_runmake -C src/cacaoh cacaoh
 }
 do_install() {
-	install -d ${D}${bindir}/cacaoh-${PV}
-	install -m 0755 src/cacaoh/.libs/cacaoh ${D}${bindir}/cacaoh-${PV}
+  install -d ${D}${bindir}/cacaoh-${PV}
+  install -m 0755 src/cacaoh/.libs/cacaoh ${D}${bindir}/cacaoh-${PV}
 }
diff --git a/recipes/cacao/cacaoh-native_0.99.3.bb b/recipes/cacao/cacaoh-native_0.99.3.bb
index b321329..1bc3b84 100644
--- a/recipes/cacao/cacaoh-native_0.99.3.bb
+++ b/recipes/cacao/cacaoh-native_0.99.3.bb
@@ -1,8 +1,7 @@
-require cacaoh-native.inc
-
 PR = "r2"
 
 SRC_URI = "http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-${PV}.tar.bz2"
-
 SRC_URI[md5sum] = "db93ab31c6d1b7f1e213771bb81bde58"
 SRC_URI[sha256sum] = "1ea5bd257f755ffcae2c7a1935c37147c7392478922410e0870361eea08b6c27"
+
+require cacaoh-native.inc
diff --git a/recipes/cacao/cacaoh-native_0.99.4.bb b/recipes/cacao/cacaoh-native_0.99.4.bb
index e269e43..d0fc1c0 100644
--- a/recipes/cacao/cacaoh-native_0.99.4.bb
+++ b/recipes/cacao/cacaoh-native_0.99.4.bb
@@ -1,8 +1,7 @@
-require cacaoh-native.inc
-
 PR = "r1"
 
 SRC_URI = "http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-${PV}.tar.bz2"
-
 SRC_URI[md5sum] = "63220327925ace13756ae334c55a3baa"
 SRC_URI[sha256sum] = "1dfc4903dc0172286df4f1740fd0f12749ac81d51c602290b47cbe83d51e1d56"
+
+require cacaoh-native.inc
-- 
1.6.3.3



