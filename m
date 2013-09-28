Return-Path: <stefan@datenfreihafen.org>
Received: from sirius.lasnet.de (sirius.lasnet.de [78.47.116.19])
	by mail.openembedded.org (Postfix) with ESMTP id F1DE36B109
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2013 22:25:26 +0000 (UTC)
Received: from host-78-149-139-187.as13285.net ([78.149.139.187]
	helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.69 #1)
	id 1VQ2x2-00011m-Fd by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Sun, 29 Sep 2013 00:25:28 +0200
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.80)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1VQ2x2-0000d1-DT; Sat, 28 Sep 2013 23:25:24 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Sep 2013 23:25:16 +0100
Message-Id: <1380407119-2352-3-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1380407119-2352-1-git-send-email-stefan@datenfreihafen.org>
References: <1380407119-2352-1-git-send-email-stefan@datenfreihafen.org>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: [PATCH 3/6] maliit-plugins-qt5: Build with qt5.
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
X-List-Received-Date: Sat, 28 Sep 2013 22:25:27 -0000

* Switch to new github repo
* Update SRCREV and PV
* Fix packaging
---
 recipes-qt/maliit/maliit-plugins-qt5_git.bb | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/recipes-qt/maliit/maliit-plugins-qt5_git.bb b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
index fdca8c0..9d5b0e2 100644
--- a/recipes-qt/maliit/maliit-plugins-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
@@ -4,16 +4,22 @@ HOMEPAGE = "https://wiki.maliit.org/Main_Page"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f29b21caa8e460097bfad9c026a33621"
 
-inherit autotools qt4x11
+inherit qmake5
+
+# Set path of qt5 headers as qmake5_base.bbclass sets this to just ${includedir}
+# but
+# actually it is ${includedir}/qt5
+OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
 
 DEPENDS = "maliit-framework-qt5"
 
-RDEPENDS_${PN} += "qt4-plugin-iconengine-svgicon qt4-plugin-imageformat-svg"
+# FIXME: Do we need something like this with qt5?
+#RDEPENDS_${PN} += "qt4-plugin-iconengine-svgicon qt4-plugin-imageformat-svg"
 
-SRC_URI = "git://gitorious.org/maliit/maliit-plugins.git;branch=master"
+SRC_URI = "git://github.com/maliit/plugins.git;branch=master"
 
-SRCREV = "0760e585df494b394df1b887e5138ffef19c481f"
-PV = "0.92.3+git${SRCPV}"
+SRCREV = "c6a348592607248a771a3dde5a0e33dc3c433a2a"
+PV = "0.99.0+git${SRCPV}"
 
 EXTRA_QMAKEVARS_PRE = "\
     PREFIX=${prefix} \
@@ -26,7 +32,7 @@ FILES_${PN} += "\
     ${datadir} \
 "
 
-FILES_${PN}-dbg += "${libdir}/maliit/plugins-*/.debug"
+FILES_${PN}-dbg += "${libdir}/maliit/plugins/.debug"
 
 S= "${WORKDIR}/git"
 
-- 
1.8.4.rc3


