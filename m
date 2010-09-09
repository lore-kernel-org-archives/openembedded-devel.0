Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1OtkAX-0001aO-TO
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 18:40:17 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Otk9p-0002fY-OM from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 09:39:29 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 9 Sep 2010 18:30:44 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Sep 2010 21:30:47 +0500
Message-Id: <1284049847-22660-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 09 Sep 2010 16:30:44.0486 (UTC)
	FILETIME=[59C9FA60:01CB503C]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] omniorb_4.1.4: merged native and non-native recipes
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
X-List-Received-Date: Thu, 09 Sep 2010 16:40:17 -0000

* removed the omniorb-native_4.1.4.bb file
* added DEPENDS_pn-omniorb = "omniorb-native" and DEPENDS_pn-omniorb-native += "python-native" to handle different dependencies for native and target recipes, thanks to Vitus Jensen for guidance
* added NATIVE_INSTALL_WORKS = "1"
* added BBCLASSEXTEND = "native"
* added do_install_virtclass-native and converted do_stage from native recipe to do_install_virtclass-native_append in the combined recipe
* bumped PR

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/omniorb/omniorb-native_4.1.4.bb |   23 ---------------------
 recipes/omniorb/omniorb_4.1.4.bb        |   33 +++++++++++++++++++++++++-----
 2 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/recipes/omniorb/omniorb-native_4.1.4.bb b/recipes/omniorb/omniorb-native_4.1.4.bb
deleted file mode 100644
index c5c550d..0000000
--- a/recipes/omniorb/omniorb-native_4.1.4.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SECTION = "devel"
-DEPENDS += "python-native"
-PR = "r0"
-
-SRC_URI = "http://downloads.sourceforge.net/omniorb/omniORB-4.1.4.tar.gz;name=omniORB414targz \
-	  file://omniorb_4.1.4.patch \
-"
-
-SRC_URI[omniORB414targz.md5sum] = "1f6070ff9b6339876976d61981eeaa6a"
-SRC_URI[omniORB414targz.sha256sum] = "84fb9790c25d6e46248c9773747e393b429573190da2150850d4a49debda4e8e"
-
-S = "${WORKDIR}/omniORB-${PV}"
-
-inherit native autotools
-
-do_compile () {
-        oe_runmake
-}
-# Ugly hack so libtool does not find native libs when building cross packages
-# We really only build this package for omniidl anyway
-do_stage_append() {
-        rm -f  ${STAGING_LIBDIR_NATIVE}/libomni*
-}
diff --git a/recipes/omniorb/omniorb_4.1.4.bb b/recipes/omniorb/omniorb_4.1.4.bb
index a4c032c..03a1554 100644
--- a/recipes/omniorb/omniorb_4.1.4.bb
+++ b/recipes/omniorb/omniorb_4.1.4.bb
@@ -2,8 +2,9 @@ DESCRIPTION = "OmniORB High Performance ORB"
 SECTION = "devel"
 PRIORITY = "optional"
 LICENSE = "LGPL"
-DEPENDS = "omniorb-native"
-PR = "r0"
+DEPENDS_pn-omniorb = "omniorb-native"
+DEPENDS_pn-omniorb-native += "python-native"
+PR = "r1"
 
 SRC_URI = "http://downloads.sourceforge.net/omniorb/omniORB-4.1.4.tar.gz;name=omniORB414targz \
 file://omniorb_4.1.4.patch \ 
@@ -12,6 +13,10 @@ file://omniORB-cross.patch \
 file://omniORB_embedded_appl.patch \
 file://rm_LongDouble.patch \
 "
+SRC_URI_virtclass-native = "http://downloads.sourceforge.net/omniorb/omniORB-4.1.4.tar.gz;name=omniORB414targz \
+	  file://omniorb_4.1.4.patch \
+"
+
 
 SRC_URI[omniORB414targz.md5sum] = "1f6070ff9b6339876976d61981eeaa6a"
 SRC_URI[omniORB414targz.sha256sum] = "84fb9790c25d6e46248c9773747e393b429573190da2150850d4a49debda4e8e"
@@ -29,9 +34,14 @@ do_compile () {
 	oe_runmake
 	
 }
+
+do_compile_virtclass-native() {
+        oe_runmake
+}
+
 do_install () {
         export EmbeddedSystem=1
-        make DESTDIR=${D} install
+        autotools_do_install
         install -d ${D}${sysconfdir}
         install -m 0644 ${WORKDIR}/omniORB.cfg ${D}${sysconfdir}
         install -d ${D}${localstatedir}/omninames
@@ -39,7 +49,18 @@ do_install () {
 	#only executable libraries are stripped by the stripper
 	chmod +x ${WORKDIR}/image/usr/lib/lib*
 }
-do_stage () {
-        export EmbeddedSystem=1
-        autotools_stage_all
+
+do_install_virtclass-native() {
+        autotools_do_install
+}
+
+# The following comment is from the omniorb-native recipe which is now merged into this one...
+# Ugly hack so libtool does not find native libs when building cross packages
+# We really only build this package for omniidl anyway
+do_install_virtclass-native_append() {
+        rm -f  ${D}${libdir}/libomni*
 }
+
+BBCLASSEXTEND = "native"
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



