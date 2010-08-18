Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OldVY-0001So-Il
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 09:56:45 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OldV6-0000wN-3T from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 00:55:56 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 18 Aug 2010 09:55:53 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Aug 2010 13:53:58 +0600
Message-Id: <1282118038-23245-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 18 Aug 2010 07:55:53.0698 (UTC)
	FILETIME=[C85B4C20:01CB3EAA]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] uicmoc3-native: convert to new style staging, remove 'do_stage()'
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
X-List-Received-Date: Wed, 18 Aug 2010 07:56:45 -0000

* Rename do_stage function name and set the new name as do_install.
* Replace OE_QMAKE_INCDIR_QT with ${D}${includedir}/qte3/include, OE_QMAKE_LIBDIR_QT with ${D}${libdir}/qte3/lib, OE_QMAKE_MOC with ${D}${bindir}/moc3, OE_QMAKE_UIC with ${D}${bindir}/uic3, OE_QMAKE_LIBDIR_QT with ${D}${libdir}/qte3/lib. These variables are exported in qt3e.bbclass.
* Add NATIVE_INSTALL_WORKS = "1"
* bump PR = "r4"

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/uicmoc/uicmoc3-native_3.3.5.bb |   26 +++++++++++++++-----------
 1 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/recipes/uicmoc/uicmoc3-native_3.3.5.bb b/recipes/uicmoc/uicmoc3-native_3.3.5.bb
index ab4ab80..76cd1b3 100644
--- a/recipes/uicmoc/uicmoc3-native_3.3.5.bb
+++ b/recipes/uicmoc/uicmoc3-native_3.3.5.bb
@@ -4,7 +4,7 @@ SECTION = "devel"
 PRIORITY = "optional"
 LICENSE = "GPL QPL"
 DEPENDS = "qmake-native"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-free-${PV}.tar.bz2 \
            file://no-examples.patch \
@@ -36,19 +36,23 @@ do_compile() {
     oe_runmake sub-tools || die "Building tools failed"
 }
 
-do_stage() {
-	install -d ${OE_QMAKE_INCDIR_QT}
-	install -d ${OE_QMAKE_LIBDIR_QT}
+do_install() {
+        install -d ${D}${includedir}/qte3/include
+        install -d ${D}${libdir}/qte3/lib
+        install -d ${D}${bindir}/
+        install -d ${D}${bindir}/
 
-	install -m 0755 bin/moc ${OE_QMAKE_MOC}
-	install -m 0755 bin/uic ${OE_QMAKE_UIC}
-	install -m 0655 lib/*.a ${OE_QMAKE_LIBDIR_QT}
+        install -m 0755 bin/moc ${D}${bindir}/moc3
+        install -m 0755 bin/uic ${D}${bindir}/uic3
+        install -m 0655 lib/*.a ${D}${libdir}/qte3/lib
 
-	for f in include/*.h
-	do
-		install -m 0644 $f ${OE_QMAKE_INCDIR_QT}/
-	done
+        for f in include/*.h
+        do
+                install -m 0644 $f ${D}${includedir}/qte3/include/
+        done
 }
 
+NATIVE_INSTALL_WORKS = "1"
+
 SRC_URI[md5sum] = "022d7a3c572b554f3c47b12cae71a8a4"
 SRC_URI[sha256sum] = "a97656796c0ef8e87dd83e6138bc406e31830d08f9b213e039d8be39ea65c8e4"
-- 
1.6.3.3



