Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1Oqluh-0006Vd-21
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 13:55:40 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Oqlu7-0001QM-HC from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 04:54:59 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 1 Sep 2010 13:54:57 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Sep 2010 16:54:55 +0500
Message-Id: <1283342095-7236-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 01 Sep 2010 11:54:58.0096 (UTC)
	FILETIME=[80113B00:01CB49CC]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] docbook-sgml-dtd-native: converted to new style staging
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
X-List-Received-Date: Wed, 01 Sep 2010 11:55:41 -0000

* Converted do_stage to do_install.
* Moved the catalog files from ${sysconfdir}/sgml to ${D}${sysconfdir}/sgml so that they get included in the package file resulting with the new style staging.
* Added a function docbook_sgml_dtd_native_mangle, to correct the path in .cat file and added it to SYSROOT_PREPROCESS_FUNCS.
* Added INC_PR = "r1" to the .inc file and PR = "${INC_PR}.0" to the .bb files

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 .../docbook-sgml-dtd-3.1-native.bb                 |    2 +
 .../docbook-sgml-dtd-4.1-native.bb                 |    2 +
 .../docbook-sgml-dtd-4.4-native.bb                 |    2 +
 .../docbook-sgml-dtd-4.5-native.bb                 |    2 +
 .../docbook-sgml-dtd/docbook-sgml-dtd-native.inc   |   27 ++++++++++++++-----
 5 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/recipes/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native.bb b/recipes/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native.bb
index 939fd53..7f5e19e 100644
--- a/recipes/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native.bb
+++ b/recipes/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native.bb
@@ -2,6 +2,8 @@ require docbook-sgml-dtd-native.inc
 
 DTD_VERSION = "3.1"
 
+PR = "${INC_PR}.0"
+
 SRC_URI = "http://www.docbook.org/sgml/3.1/docbk31.zip;md5sum=432749c0c806dbae81c8bcb70da3b5d3"
 
 do_compile() {
diff --git a/recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb b/recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb
index 2bc43e1..e6650ed 100644
--- a/recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb
+++ b/recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb
@@ -2,6 +2,8 @@ require docbook-sgml-dtd-native.inc
 
 DTD_VERSION = "4.1"
 
+PR = "${INC_PR}.0"
+
 SRC_URI = "http://docbook.org/sgml/4.1/docbk41.zip"
 
 do_compile() {
diff --git a/recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.4-native.bb b/recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.4-native.bb
index 9e51964..537e8b2 100644
--- a/recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.4-native.bb
+++ b/recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.4-native.bb
@@ -2,6 +2,8 @@ require docbook-sgml-dtd-native.inc
 
 DTD_VERSION = "4.4"
 
+PR = "${INC_PR}.0"
+
 do_compile() {
     # Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/sgml-dtd.html
     # for details.
diff --git a/recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb b/recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
index f5e257c..82deb33 100644
--- a/recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
+++ b/recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
@@ -2,6 +2,8 @@ require docbook-sgml-dtd-native.inc
 
 DTD_VERSION = "4.5"
 
+PR = "${INC_PR}.0"
+
 do_compile() {
     # Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/sgml-dtd.html
     # for details.
diff --git a/recipes/docbook-sgml-dtd/docbook-sgml-dtd-native.inc b/recipes/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
index 69c9811..06db68d 100644
--- a/recipes/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
+++ b/recipes/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
@@ -12,20 +12,33 @@ SRC_URI = "http://www.docbook.org/sgml/${DTD_VERSION}/docbook-${DTD_VERSION}.zip
 
 S = "${WORKDIR}"
 
+INC_PR = "r1"
+
+SYSROOT_PREPROCESS_FUNCS += "docbook_sgml_dtd_native_mangle"
+
 inherit native
 
-do_stage () {
+do_install () {
     # Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/sgml-dtd.html
     # for details.
-    install -d -m 755 ${STAGING_DATADIR}/sgml/docbook/sgml-dtd-${DTD_VERSION}
-    install docbook.cat ${STAGING_DATADIR}/sgml/docbook/sgml-dtd-${DTD_VERSION}/catalog
-    cp -dpr *.dtd *.mod *.dcl ${STAGING_DATADIR}/sgml/docbook/sgml-dtd-${DTD_VERSION}
-    
+    install -d -m 755 ${D}${datadir}/sgml/docbook/sgml-dtd-${DTD_VERSION}
+    install docbook.cat ${D}${datadir}/sgml/docbook/sgml-dtd-${DTD_VERSION}/catalog
+    cp -dpr *.dtd *.mod *.dcl ${D}${datadir}/sgml/docbook/sgml-dtd-${DTD_VERSION}
+
     install-catalog --add ${sysconfdir}/sgml/sgml-docbook-dtd-${DTD_VERSION}.cat \
-      ${STAGING_DATADIR}/sgml/docbook/sgml-dtd-${DTD_VERSION}/catalog
-	
+      ${D}${datadir}/sgml/docbook/sgml-dtd-${DTD_VERSION}/catalog
     install-catalog --add ${sysconfdir}/sgml/sgml-docbook-dtd-${DTD_VERSION}.cat \
       ${sysconfdir}/sgml/sgml-docbook.cat
+    # Moving them to image directory so that they get included in the .ipk file 
+    # generated by new style staging.
+    install -d ${D}${sysconfdir}/sgml
+    cp ${sysconfdir}/sgml/sgml-docbook-dtd-${DTD_VERSION}.cat ${D}${sysconfdir}/sgml/sgml-docbook-dtd-${DTD_VERSION}.cat
+    cp ${sysconfdir}/sgml/catalog ${D}${sysconfdir}/sgml/
 }
 
 PACKAGES = ""
+docbook_sgml_dtd_native_mangle () {
+    # Removing the image directory path (${D}) from the .cat file.
+    sed -i -e "s|${D}||g" ${SYSROOT_DESTDIR}${sysconfdir}/sgml/sgml-docbook-dtd-${DTD_VERSION}.cat
+}
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



