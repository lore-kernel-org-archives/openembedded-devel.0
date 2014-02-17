Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id D32876B89F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 21:05:10 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N150023RRWE9YQ0@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	17 Feb 2014 15:05:03 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B749B20018; Mon,
	17 Feb 2014 16:05:02 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2014 16:05:02 -0500
Message-id: <1392671102-13391-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] nativesdk-qtbase: do qmake replacement in ${D} instead of ${B}
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Feb 2014 21:05:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

This way we don't mangle ${B} and can repeat do_install if necessary. And
previously it would require running do_compile again to restore the proper
state of ${B}.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-qt/qt5/nativesdk-qtbase.inc | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index a7809d3..14a3cbe 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -189,14 +189,12 @@ do_install() {
     # Fix install paths for all
     find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
 
-    # switch back the proper qmake
-    if [ -e ${B}/bin/qmake-real ]; then
-        rm ${B}/bin/qmake
-        mv ${B}/bin/qmake-real ${B}/bin/qmake
-    fi
-
     oe_runmake install INSTALL_ROOT=${D}
 
+    # replace the native qmake installed above with nativesdk version
+    rm -rf ${D}${bindir}/qmake
+    install -m 755 ${B}/bin/qmake-real ${D}${bindir}/qmake
+
     # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
     # e.g. qt3d, qtwayland
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
-- 
1.8.3.2


