Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1P0dQC-0005I0-OA
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 18:52:56 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1P0dPv-0003iw-OI from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 09:52:35 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 28 Sep 2010 18:52:02 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Sep 2010 21:53:25 +0500
Message-Id: <1285692805-5790-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 28 Sep 2010 16:52:02.0348 (UTC)
	FILETIME=[794D7EC0:01CB5F2D]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] python-twisted: mergerd natinve and target
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
X-List-Received-Date: Tue, 28 Sep 2010 16:52:56 -0000

* merged native and targer recipes and converted to new style staging
* bumped PR
* added BBCLASSEXTEND = "native" and NATIVE_INSTALL_WORKS = "1"
* note: the ipk file created by building python-twisted-native does not contain easy-install.pth which was being packaged in case of non-legacy staging, this is because its explicitly removed in distutils_do_install function.

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/python/python-twisted-native_8.2.0.bb |   12 ------------
 recipes/python/python-twisted_8.2.0.bb        |   11 ++++++++++-
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/recipes/python/python-twisted-native_8.2.0.bb b/recipes/python/python-twisted-native_8.2.0.bb
deleted file mode 100644
index 4631fb0..0000000
--- a/recipes/python/python-twisted-native_8.2.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require python-twisted_${PV}.bb
-
-RDEPENDS_${PN} = ""
-
-inherit native
-
-do_stage() {
-	distutils_stage_all
-}
-
-SRC_URI[md5sum] = "c85f151999df3ecf04c49a781b4438d2"
-SRC_URI[sha256sum] = "e0602bb05e31f6100b6f9ab35cfa93ab9f7a1c50a351a0ddfcd236a923bddfb0"
diff --git a/recipes/python/python-twisted_8.2.0.bb b/recipes/python/python-twisted_8.2.0.bb
index 7ecbf6c..6eac0b4 100644
--- a/recipes/python/python-twisted_8.2.0.bb
+++ b/recipes/python/python-twisted_8.2.0.bb
@@ -5,11 +5,15 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 SECTION = "console/network"
 PRIORITY = "optional"
 LICENSE = "LGPL"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://tmrc.mit.edu/mirror/twisted/Twisted/8.2/Twisted-${PV}.tar.bz2 "
 S = "${WORKDIR}/Twisted-${PV}"
 
+do_install_virtclass-native() {
+    distutils_do_install
+}
+
 inherit setuptools
 
 PACKAGES += "\
@@ -42,6 +46,7 @@ RDEPENDS_${PN} += "\
   ${PN}-web \
   ${PN}-words \
 "
+RDEPENDS_${PN}_virtclass-native = ""
 
 ALLOW_EMPTY = "1"
 FILES_${PN} = ""
@@ -213,3 +218,7 @@ ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/.debug \
 
 SRC_URI[md5sum] = "c85f151999df3ecf04c49a781b4438d2"
 SRC_URI[sha256sum] = "e0602bb05e31f6100b6f9ab35cfa93ab9f7a1c50a351a0ddfcd236a923bddfb0"
+
+BBCLASSEXTEND = "native"
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



