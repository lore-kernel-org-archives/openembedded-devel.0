Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CFA796081A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 07:42:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t487h1nk002281
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 8 May 2015 00:43:01 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 8 May 2015 00:43:00 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 May 2015 15:42:23 +0800
Message-ID: <1431070955-7100-8-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 08/20] navit: fix PN -> BPN for multilib
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
X-List-Received-Date: Fri, 08 May 2015 07:43:00 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-navigation/navit/navit.inc    |   24 ++++++++++++------------
 meta-oe/recipes-navigation/navit/navit_svn.bb |    2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-navigation/navit/navit.inc b/meta-oe/recipes-navigation/navit/navit.inc
index 9d4f4ec..e39008e 100644
--- a/meta-oe/recipes-navigation/navit/navit.inc
+++ b/meta-oe/recipes-navigation/navit/navit.inc
@@ -57,19 +57,19 @@ SRC_URI += "file://navit.xml \
             file://plugins.xml \
 "
 
-FILES_${PN} += "${libdir}/${PN}/*/*.so ${datadir}/icons"
-FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug"
+FILES_${PN} += "${libdir}/${BPN}/*/*.so ${datadir}/icons"
+FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
 FILES_${PN}-maptool = " ${bindir}/maptool "
 FILES_${PN}-config = " ${datadir}/navit/*.xml "
-FILES_${PN}-dbus = " ${datadir}/dbus-1/services/ ${libdir}/${PN}/binding/libbinding_dbus.so "
-FILES_${PN}-speech-cmdline = " ${libdir}/${PN}/speech/libspeech_cmdline.so "
-FILES_${PN}-speech-dbus = " ${libdir}/${PN}/speech/libspeech_dbus.so "
-FILES_${PN}-gui-gtk = " ${libdir}/${PN}/gui/libgui_gtk.so "
-FILES_${PN}-gui-qml = " ${libdir}/${PN}/gui/libgui_qml.so ${datadir}/navit/skins/ "
-FILES_${PN}-gui-internal = " ${libdir}/${PN}/gui/libgui_internal.so "
-FILES_${PN}-graphics-sdl = " ${libdir}/${PN}/graphics/libgraphics_sdl.so "
-FILES_${PN}-graphics-qt = " ${libdir}/${PN}/graphics/libgraphics_qt_qpainter.so "
-FILES_${PN}-graphics-gtk = " ${libdir}/${PN}/graphics/libgraphics_gtk_drawing_area.so "
+FILES_${PN}-dbus = " ${datadir}/dbus-1/services/ ${libdir}/${BPN}/binding/libbinding_dbus.so "
+FILES_${PN}-speech-cmdline = " ${libdir}/${BPN}/speech/libspeech_cmdline.so "
+FILES_${PN}-speech-dbus = " ${libdir}/${BPN}/speech/libspeech_dbus.so "
+FILES_${PN}-gui-gtk = " ${libdir}/${BPN}/gui/libgui_gtk.so "
+FILES_${PN}-gui-qml = " ${libdir}/${BPN}/gui/libgui_qml.so ${datadir}/navit/skins/ "
+FILES_${PN}-gui-internal = " ${libdir}/${BPN}/gui/libgui_internal.so "
+FILES_${PN}-graphics-sdl = " ${libdir}/${BPN}/graphics/libgraphics_sdl.so "
+FILES_${PN}-graphics-qt = " ${libdir}/${BPN}/graphics/libgraphics_qt_qpainter.so "
+FILES_${PN}-graphics-gtk = " ${libdir}/${BPN}/graphics/libgraphics_gtk_drawing_area.so "
 FILES_${PN}-icons = "/usr/share/navit/xpm/"
 
 do_configure_prepend() {
@@ -81,7 +81,7 @@ do_install_append() {
     # fix QA issue
     sed -i 's#Categories=GTK;Utility;Geography;#Categories=Graphics;#g' ${D}${datadir}/applications/navit.desktop
 
-    rm ${D}${libdir}/${PN}/*/*.la
+    rm ${D}${libdir}/${BPN}/*/*.la
 
     #Use split config
     mv ${D}${datadir}/navit/navit.xml ${D}${datadir}/navit/navit.default.xml
diff --git a/meta-oe/recipes-navigation/navit/navit_svn.bb b/meta-oe/recipes-navigation/navit/navit_svn.bb
index eff1eb3..bdfbb4b 100644
--- a/meta-oe/recipes-navigation/navit/navit_svn.bb
+++ b/meta-oe/recipes-navigation/navit/navit_svn.bb
@@ -4,7 +4,7 @@ SRCREV = "5310"
 PV = "0.2.0+svnr${SRCPV}"
 PR = "${INC_PR}.3"
 
-S = "${WORKDIR}/${PN}"
+S = "${WORKDIR}/${BPN}"
 SRC_URI += "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;protocol=http \
     file://freetype-include-path.patch \
     file://configure.add.imlib2.option.patch \
-- 
1.7.9.5


