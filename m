Return-Path: <stefan@datenfreihafen.org>
Received: from sirius.lasnet.de (sirius.lasnet.de [78.47.116.19])
	by mail.openembedded.org (Postfix) with ESMTP id C084C61844
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2013 22:25:25 +0000 (UTC)
Received: from host-78-149-139-187.as13285.net ([78.149.139.187]
	helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.69 #1)
	id 1VQ2x1-00011l-VQ by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Sun, 29 Sep 2013 00:25:26 +0200
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.80)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1VQ2x1-0000cs-OB; Sat, 28 Sep 2013 23:25:23 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Sep 2013 23:25:15 +0100
Message-Id: <1380407119-2352-2-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1380407119-2352-1-git-send-email-stefan@datenfreihafen.org>
References: <1380407119-2352-1-git-send-email-stefan@datenfreihafen.org>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: [PATCH 2/6] maliit-framework-qt5: Build with qt5
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
* Update SRCREV and remove patches which now longer apply
* Disable doc generation and xcb
* Fix packaging
---
 recipes-qt/maliit/maliit-framework-qt5_git.bb | 36 +++++++++++++++------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/maliit/maliit-framework-qt5_git.bb
index 9f67452..7b336ff 100644
--- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
@@ -4,43 +4,45 @@ HOMEPAGE = "https://wiki.maliit.org/Main_Page"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
 
-#inherit autotools qt4x11 gtk-immodules-cache
+inherit qmake5
 
+# Set path of qt5 headers as qmake5_base.bbclass sets this to just ${includedir}
+# but
+# actually it is ${includedir}/qt5
+OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
 
-SRC_URI = "git://gitorious.org/maliit/maliit-framework.git;branch=master \
+
+SRC_URI = "git://github.com/maliit/framework.git;branch=master \
     file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
-    file://0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch \
-    file://0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch \
     file://maliit-server.desktop \
 "
 
-SRCREV = "750842dec74a9b17dca91ef779c4fc5a43c4d9dc"
-PV = "0.92.3+git${SRCPV}"
+SRCREV = "dbc0403f329d7f6ce2f5a09e6ff5adbd2548a8c9"
+PV = "0.99.0+git${SRCPV}"
 
 
 PACKAGES =+ "${PN}-gtk"
 GTKIMMODULES_PACKAGES = "${PN}-gtk"
 
-RDEPENDS_${PN} = "qt4-plugin-inputmethod-imsw-multi libqtsvg4"
-
-RRECOMMENDS_${PN} = "maliit-plugins"
+# FIXME: Do we need something like this with qt5?
+#RDEPENDS_${PN} = "qt4-plugin-inputmethod-imsw-multi libqtsvg4"
 
+RRECOMMENDS_${PN} = "maliit-plugins-qt5"
 
 FILES_${PN} += "\
-    ${libdir}/maliit/plugins-*/factories/libmaliit-plugins-quick-factory-*.so \
-    ${libdir}/qt4/plugins/inputmethods/*.so \
+    ${libdir}/*.so* \
+    ${libdir}/pkgconfig \
+    ${libdir}/qt5 \
+    ${bindir}/maliit-server \
+    ${includedir}/maliit \
     ${datadir}/applications/maliit-server.desktop \
 "
 
 FILES_${PN}-dbg += "\
     ${libdir}/maliit-framework-tests \
-    ${libdir}/gtk-*/*/immodules/.debug \
-    ${libdir}/maliit/plugins-*/factories/.debug \
-    ${libdir}/qt4/plugins/.debug \
-    ${libdir}/qt4/plugins/inputmethods/.debug \
 "
 
-FILES_${PN}-dev += "${datadir}/qt4"
+FILES_${PN}-dev += "${datadir}"
 
 FILES_${PN}-gtk +="\
     ${bindir}/maliit-exampleapp-gtk* \
@@ -58,6 +60,8 @@ EXTRA_QMAKEVARS_PRE = "\
     CONFIG+=disable-gtk-cache-update \
     CONFIG+=local-install \
     CONFIG+=nosdk \
+    CONFIG+=nodoc \
+    CONFIG+=noxcb \
 "
 
 EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
-- 
1.8.4.rc3


