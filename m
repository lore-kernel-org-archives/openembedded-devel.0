Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1Okz9I-0001bK-D3
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 14:50:51 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Okz90-00077x-4r from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 05:50:26 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 16 Aug 2010 14:50:24 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 17:52:20 +0500
Message-Id: <1281963140-29565-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 16 Aug 2010 12:50:24.0749 (UTC)
	FILETIME=[984C31D0:01CB3D41]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Fahad Usman <fahad_usman@mentor.com>
Subject: [PATCH] dcopidl-native_3.5.8.bb: Removed legacy style staging
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
X-List-Received-Date: Mon, 16 Aug 2010 12:50:51 -0000

* converted do_stage to do_install and replaced ${STAGING_BINDIR} with ${D}${bindir}

* and treated the source with oe-stylize.py script

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/dcop/dcopidl-native_3.5.8.bb |   29 ++++++++++++++++-------------
 1 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/recipes/dcop/dcopidl-native_3.5.8.bb b/recipes/dcop/dcopidl-native_3.5.8.bb
index df3f761..1b20e49 100644
--- a/recipes/dcop/dcopidl-native_3.5.8.bb
+++ b/recipes/dcop/dcopidl-native_3.5.8.bb
@@ -1,16 +1,19 @@
 DESCRIPTION = "DCOP IDL parser"
 SECTION = "kde/devel"
-PRIORITY    = "optional"
-LICENSE     = "GPL"
-DEPENDS     = "uicmoc3-native"
+PRIORITY = "optional"
+LICENSE = "GPL"
+DEPENDS = "uicmoc3-native"
+PR = "r2"
 
-SRC_URI     = "ftp://download.kde.org/pub/kde/stable/${PV}/src/kdelibs-${PV}.tar.bz2 \
-	      file://dcopidl-compile.patch "
-S           = "${WORKDIR}/kdelibs-${PV}/dcop/dcopidl"
+SRC_URI = "ftp://download.kde.org/pub/kde/stable/${PV}/src/kdelibs-${PV}.tar.bz2 \
+           file://dcopidl-compile.patch "
+SRC_URI[md5sum] = "acaa37e79e840d10dca326277a20863c"
+SRC_URI[sha256sum] = "779f563fdf0385b973f2238f04d82b5729aefe1c949e4d29482b6bb170aa3fe6"
+
+S = "${WORKDIR}/kdelibs-${PV}/dcop/dcopidl"
 
 inherit native qmake qt3e
 
-export OE_QMAKE_LINK="${CXX}"
 EXTRA_QMAKEVARS_POST_append = "LIBS+=-ldl "
 EXTRA_QMAKEVARS_POST_append = "CONFIG-=thread "
 
@@ -19,11 +22,11 @@ do_configure_prepend() {
      echo "SOURCES += main.cpp yacc.cc scanner.cc " > dcopidl.pro
      echo "HEADERS += yacc.cc.h " >> dcopidl.pro
 }
-
-do_stage() {
-     install -d ${STAGING_BINDIR}
-     install -m 0755 dcopidl ${STAGING_BINDIR}
+do_install() {
+     install -d ${D}${bindir}
+     install -m 0755 dcopidl ${D}${bindir}
 }
 
-SRC_URI[md5sum] = "acaa37e79e840d10dca326277a20863c"
-SRC_URI[sha256sum] = "779f563fdf0385b973f2238f04d82b5729aefe1c949e4d29482b6bb170aa3fe6"
+export OE_QMAKE_LINK="${CXX}"
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



