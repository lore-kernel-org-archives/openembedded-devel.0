Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TbvLb-0007Ny-Ro
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 16:39:19 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 774B24A026;
	Fri, 23 Nov 2012 16:25:22 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Nov 2012 16:24:39 +0100
Message-Id: <1353684287-19180-2-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 1/9] navit: remove from repository due to lack of gypsy
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
X-List-Received-Date: Fri, 23 Nov 2012 15:39:20 -0000

ERROR: Nothing PROVIDES 'gypsy' (but meta-openembedded/meta-oe/recipes-navigation/navit/navit_svn.bb DEPENDS on or otherwise requires it)
ERROR: Required build target 'navit' has no buildable providers.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-navigation/navit/navit-fpu.inc     |  6 --
 meta-oe/recipes-navigation/navit/navit.inc         | 88 ----------------------
 meta-oe/recipes-navigation/navit/navit/maps.xml    | 24 ------
 meta-oe/recipes-navigation/navit/navit/navit.xml   | 45 -----------
 meta-oe/recipes-navigation/navit/navit/osd.xml     | 15 ----
 meta-oe/recipes-navigation/navit/navit/plugins.xml |  6 --
 meta-oe/recipes-navigation/navit/navit/speech.xml  |  8 --
 .../navit/taking-address-of-temporary-array.patch  | 76 -------------------
 meta-oe/recipes-navigation/navit/navit_svn.bb      | 10 ---
 9 files changed, 278 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/navit/navit-fpu.inc
 delete mode 100644 meta-oe/recipes-navigation/navit/navit.inc
 delete mode 100644 meta-oe/recipes-navigation/navit/navit/maps.xml
 delete mode 100644 meta-oe/recipes-navigation/navit/navit/navit.xml
 delete mode 100644 meta-oe/recipes-navigation/navit/navit/osd.xml
 delete mode 100644 meta-oe/recipes-navigation/navit/navit/plugins.xml
 delete mode 100644 meta-oe/recipes-navigation/navit/navit/speech.xml
 delete mode 100644 meta-oe/recipes-navigation/navit/navit/taking-address-of-temporary-array.patch
 delete mode 100644 meta-oe/recipes-navigation/navit/navit_svn.bb

diff --git a/meta-oe/recipes-navigation/navit/navit-fpu.inc b/meta-oe/recipes-navigation/navit/navit-fpu.inc
deleted file mode 100644
index d963702..0000000
--- a/meta-oe/recipes-navigation/navit/navit-fpu.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-
-def get_navit_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
-        return "--enable-avoid-float"
-    return ""
-
diff --git a/meta-oe/recipes-navigation/navit/navit.inc b/meta-oe/recipes-navigation/navit/navit.inc
deleted file mode 100644
index dc2370b..0000000
--- a/meta-oe/recipes-navigation/navit/navit.inc
+++ /dev/null
@@ -1,88 +0,0 @@
-DESCRIPTION = "Navit is a car navigation system with routing engine."
-LICENSE = "GPLv2 LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ed539d099d6ce08de6ea0dfed9ecb333 \
-                    file://LGPL-2;md5=3214f080875748938ba060314b4f727d \
-                    file://GPL-2;md5=751419260aa954499f7abaabaa882bbe \
-"
-
-SECTION = "x11/applications"
-DEPENDS = "glib-2.0 gtk+ qt4-x11-free gd gypsy librsvg-native"
-RDEPENDS_${PN} = " ${PN}-icons ${PN}-config "
-RDEPENDS_${PN}-gui-qml = "qt4-plugin-imageformat-svg"
-RRECOMMENDS_${PN} = "gpsd ${PN}-dbus ${PN}-speech-cmdline ${PN}-gui-internal ${PN}-graphics-gtk"
-RSUGGESTS_${PN} = "flite-alsa espeak ${PN}-speech-dbus ${PN}-gui-gtk ${PN}-gui-qml ${PN}-graphics-sdl ${PN}-graphics-qt ${PN}-maptool"
-
-PE = "1"
-INC_PR = "r9"
-
-inherit autotools gettext
-
-EXTRA_OECONF += " \
-  --disable-binding-python \
-  --disable-samplemap \
-  --enable-avoid-unaligned \
-  --enable-graphics-qt-qpainter \
-  --enable-gui-qml \
-  --enable-svg2png-scaling-flag=32 \
-  --disable-speech-speech-dispatcher \
-  --enable-cache-size=20971520 \
-"
-
-#  --enable-avoid-float \
-#check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
-require navit-fpu.inc
-EXTRA_OECONF += "${@get_navit_fpu_setting(bb, d)}"
-
-PACKAGES =+ "${PN}-maptool ${PN}-config ${PN}-dbus ${PN}-speech-cmdline ${PN}-speech-dbus ${PN}-gui-gtk ${PN}-gui-internal ${PN}-gui-qml ${PN}-graphics-sdl ${PN}-graphics-gtk ${PN}-graphics-qt ${PN}-icons"
-
-EXTRA_AUTORECONF = " -I m4"
-
-CONFFILES_${PN}-config += "${datadir}/navit/navit.default.xml \
-                    ${datadir}/navit/navit.xml \
-                    ${datadir}/navit/maps.xml \
-                    ${datadir}/navit/osd.xml \
-                    ${datadir}/navit/speech.xml \
-                    ${datadir}/navit/plugins.xml \
-                   "
-
-SRC_URI += "file://navit.xml \
-            file://maps.xml \
-            file://osd.xml \
-            file://speech.xml \
-            file://plugins.xml \
-           "
-
-FILES_${PN} += "${libdir}/${PN}/*/*.so ${datadir}/icons"
-FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug"
-FILES_${PN}-maptool = " ${bindir}/maptool "
-FILES_${PN}-config = " ${datadir}/navit/*.xml "
-FILES_${PN}-dbus = " ${datadir}/dbus-1/services/ ${libdir}/${PN}/binding/libbinding_dbus.so "
-FILES_${PN}-speech-cmdline = " ${libdir}/${PN}/speech/libspeech_cmdline.so "
-FILES_${PN}-speech-dbus = " ${libdir}/${PN}/speech/libspeech_dbus.so "
-FILES_${PN}-gui-gtk = " ${libdir}/${PN}/gui/libgui_gtk.so "
-FILES_${PN}-gui-qml = " ${libdir}/${PN}/gui/libgui_qml.so ${datadir}/navit/skins/ "
-FILES_${PN}-gui-internal = " ${libdir}/${PN}/gui/libgui_internal.so "
-FILES_${PN}-graphics-sdl = " ${libdir}/${PN}/graphics/libgraphics_sdl.so "
-FILES_${PN}-graphics-qt = " ${libdir}/${PN}/graphics/libgraphics_qt_qpainter.so "
-FILES_${PN}-graphics-gtk = " ${libdir}/${PN}/graphics/libgraphics_gtk_drawing_area.so "
-FILES_${PN}-icons = "/usr/share/navit/xpm/"
-
-do_configure_prepend() {
-  # MOC=`$PKG_CONFIG QtGui --variable=moc_location` returns only /usr/bin/moc4 which is not available on hosts without Qt
-  sed -i "s#MOC=#MOC=${STAGING_DIR_NATIVE}#g" ${S}/configure.in
-}
-
-do_install_append() {
-	# fix QA issue
-	sed -i 's#Categories=GTK;Utility;Geography;#Categories=Graphics;#g' ${D}${datadir}/applications/navit.desktop
-
-	rm ${D}${libdir}/${PN}/*/*.la
-
-        #Use split config
-        mv ${D}${datadir}/navit/navit.xml ${D}${datadir}/navit/navit.default.xml
-        install -m 0644 ${WORKDIR}/navit.xml ${D}${datadir}/navit/navit.xml
-        install -m 0644 ${WORKDIR}/maps.xml ${D}${datadir}/navit/maps.xml
-        install -m 0644 ${WORKDIR}/osd.xml ${D}${datadir}/navit/osd.xml
-        install -m 0644 ${WORKDIR}/speech.xml ${D}${datadir}/navit/speech.xml
-        install -m 0644 ${WORKDIR}/plugins.xml ${D}${datadir}/navit/plugins.xml
-}
diff --git a/meta-oe/recipes-navigation/navit/navit/maps.xml b/meta-oe/recipes-navigation/navit/navit/maps.xml
deleted file mode 100644
index 6f59f20..0000000
--- a/meta-oe/recipes-navigation/navit/navit/maps.xml
+++ /dev/null
@@ -1,24 +0,0 @@
-                <!-- If you have the reiseplaner maps installed, set enabled="yes" in the next line and set the path correctly -->
-                <mapset enabled="no">
-                        <map type="mg" enabled="yes" data="/opt/reiseplaner/travel/DE.map"/>
-                        <map type="mg" enabled="yes" data="/opt/reiseplaner/travel/DE.map/smp1.smp"/>
-                        <map type="mg" enabled="yes" data="/opt/reiseplaner/travel/DE.map/smp2.smp"/>
-                        <map type="mg" enabled="yes" data="/opt/reiseplaner/travel/DE.map/smp3.smp"/>
-                        <map type="mg" enabled="yes" data="/opt/reiseplaner/travel/DE.map/smp4.smp"/>
-                        <map type="mg" enabled="yes" data="/opt/reiseplaner/travel/DE.map/smp5.smp"/>
-                </mapset>
-
-                <!-- If you dont want to use the sample map, either set enabled="no" in the next line or remove the xml file from the maps directory -->
-                <mapset enabled="no">
-                        <xi:include href="$NAVIT_SHAREDIR/maps/*.xml"/>
-                </mapset>
-
-                <!-- Mapset template for openstreetmaps -->
-                <mapset enabled="yes">
-                        <map type="binfile" enabled="yes" data="/media/mmc2/MapsNavit/osm_europe.bin"/>
-                </mapset>
-
-                <!-- Mapset template for garmin maps -->
-                <mapset enabled="no">
-                        <map type="garmin" enabled="yes" data="/path/to/img" debug="4"/>
-                </mapset>
diff --git a/meta-oe/recipes-navigation/navit/navit/navit.xml b/meta-oe/recipes-navigation/navit/navit/navit.xml
deleted file mode 100644
index 58c8c22..0000000
--- a/meta-oe/recipes-navigation/navit/navit/navit.xml
+++ /dev/null
@@ -1,45 +0,0 @@
-<?xml version="1.0" encoding="UTF-8"?>
-<!DOCTYPE config SYSTEM "navit.dtd">
-<config xmlns:xi="http://www.w3.org/2001/XInclude">
-	<xi:include href="/usr/share/navit/plugins.xml"/>
-	<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/debug)"/>
-
-	<navit center="4808 N 1134 E" zoom="256" tracking="1" orientation="-1" recent_dest="10" drag_bitmap="1">
-		<graphics type="gtk_drawing_area"/>
-		<gui type="gtk" enabled="no" menubar="1" toolbar="1" statusbar="1"/>
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/gui[@type='internal'])"/>
-		<!-- or comment gtk version above and try:
-		opkg install navit-graphics-qt
-		opkg install navit-gui-qml
-		<graphics type="qt_qpainter"/>
-		<gui type="qml" enabled="yes" menubar="1" toolbar="1" statusbar="1"/>
-		-->
-		<xi:include href="/usr/share/navit/osd.xml"/>
-		<log enabled="no" type="textfile_debug" data="debug_%Y%m%d-%i.txt" flush_size="1000" flush_time="30"/>
-		<vehicle name="Local GPS" profilename="car" enabled="yes" active="1" source="gpsd://localhost" gpsd_query="w+xj">
-			<!-- <log type="gpx" attr_types="position_time_iso8601,position_direction,position_speed,profilename,position_radius" data="track_%Y%m%d-%i.gpx" flush_size="1000" flush_time="30"/> -->
-		</vehicle>
-
-		<vehicle name="Demo" profilename="car" enabled="no" active="yes" source="demo://"/>
-
-		<!-- For the cumulative displacement filter to be enabled, set cdf_histsize="x" here, with x being an integer somewhere around 4 -->
-		<tracking cdf_histsize="0"/>
-
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/vehicleprofile[@name='car'])"/>
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/vehicleprofile[@name='bike'])"/>
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/vehicleprofile[@name='pedestrian'])"/>
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/vehicleprofile[@name='horse'])"/>
-
-		<route destination_distance="50"/>
-
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/navigation)"/>
-
-		<xi:include href="/usr/share/navit/speech.xml"/>
-		<xi:include href="/usr/share/navit/maps.xml"/>
-
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/layout[@name='Car'])"/>
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/layout[@name='Car-dark'])"/>
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/layout[@name='Bike'])"/>
-		<xi:include href="/usr/share/navit/navit.default.xml" xpointer="xpointer(/config/navit/layout[@name='T@H'])"/>
-	</navit>
-</config>
diff --git a/meta-oe/recipes-navigation/navit/navit/osd.xml b/meta-oe/recipes-navigation/navit/navit/osd.xml
deleted file mode 100644
index 2d0f9ff..0000000
--- a/meta-oe/recipes-navigation/navit/navit/osd.xml
+++ /dev/null
@@ -1,15 +0,0 @@
-                <!-- osd items allow to position display and control items directly on top of the map: -->
-                <osd enabled="no" type="compass"/>
-                <osd enabled="no" type="eta"/>
-                <osd enabled="no" type="navigation_distance_to_target"/>
-                <osd enabled="no" type="navigation"/>
-                <osd enabled="no" type="navigation_distance_to_next"/>
-                <osd enabled="no" type="navigation_next_turn"/>
-
-                <!-- Commands include gui_internal_menu, gui_internal_fullscreen, zoom_in and zoom_out.
-                         Usage of negative values change the button origins. x="0" y="0" specifies the top left, x="-0" y="-0" the bottom right corner.
-                         It's always the top left corner of the icon, so you need to consider the icon's size when you enter the values. -->
-                <osd enabled="no" type="button" x="0" y="0" command="gui.fullscreen()" src="toggle_fullscreen.xpm"/>
-                <osd enabled="no" type="button" x="-96" y="0" command="gui.menu()" src="menu.xpm"/>
-                <osd enabled="no" type="button" x="-96" y="-96" command="zoom_in()" src="zoom_in.xpm"/>
-                <osd enabled="no" type="button" x="0" y="-96" command="zoom_out()" src="zoom_out.xpm"/>
diff --git a/meta-oe/recipes-navigation/navit/navit/plugins.xml b/meta-oe/recipes-navigation/navit/navit/plugins.xml
deleted file mode 100644
index 015b055..0000000
--- a/meta-oe/recipes-navigation/navit/navit/plugins.xml
+++ /dev/null
@@ -1,6 +0,0 @@
-<plugins>
-	<plugin path="$NAVIT_LIBDIR/*/${NAVIT_LIBPREFIX}lib*.so" ondemand="yes"/>
-	<plugin path="$NAVIT_LIBDIR/autoload/${NAVIT_LIBPREFIX}lib*.so"/>
-	<plugin path="$NAVIT_LIBDIR/*/${NAVIT_LIBPREFIX}libbinding_dbus.so" active="yes"/>
-	<plugin path="$NAVIT_LIBDIR/*/${NAVIT_LIBPREFIX}libgraphics_null.so" active="no"/>
-</plugins>
diff --git a/meta-oe/recipes-navigation/navit/navit/speech.xml b/meta-oe/recipes-navigation/navit/navit/speech.xml
deleted file mode 100644
index 28c4990..0000000
--- a/meta-oe/recipes-navigation/navit/navit/speech.xml
+++ /dev/null
@@ -1,8 +0,0 @@
-                <!-- Navit provides speech output in text format.
-                         If you have a speech synthesizer like festival lite installed, you can get turn by turn directions out of navit. Please set the "cps"-value to how many characters your tts engine approximately speaks per second.
-                         The default is text output to the shell -->
-                <!-- <speech type="cmdline" data="echo 'Fix the speech tag in navit.xml to let navit say:' '%s'" cps="15"/> -->
-                <!-- <speech type="cmdline" data="espeak -s 150 -v czech '%s' &amp;"/> -->
-                <!-- <speech type="cmdline" data="flite -t '%s'"/> -->
-                <!-- <speech type="cmdline" data="/usr/local/bin/say.sh '%s'"/> -->
-                <speech type="cmdline" data="espeak '%s' &amp;"/>
diff --git a/meta-oe/recipes-navigation/navit/navit/taking-address-of-temporary-array.patch b/meta-oe/recipes-navigation/navit/navit/taking-address-of-temporary-array.patch
deleted file mode 100644
index 8d3a416..0000000
--- a/meta-oe/recipes-navigation/navit/navit/taking-address-of-temporary-array.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-Upstream-Status: Pending
-
-Description: Fix g++ error "taking address of temporary array"
-Author: Gilles Filippini <pini@debian.org>
-Forwarded: no
-Bug-Debian: http://bugs.debian.org/676006
-Last-Update: 2012-06-05
-Index: navit/navit/graphics/qt_qpainter/RenderArea.cpp
-===================================================================
---- navit.orig/navit/graphics/qt_qpainter/RenderArea.cpp	2012-06-05 23:16:42.000000000 +0200
-+++ navit/navit/graphics/qt_qpainter/RenderArea.cpp	2012-06-05 23:15:47.000000000 +0200
-@@ -239,13 +239,14 @@
- #else
- 	const char *text=str.toUtf8().constData();
- #endif
-+	char text1[2] = { '\0', '\0' };
- 	dbg(0,"enter text='%s' 0x%x (%d) key=%d\n", text, text[0], strlen(text), event->key());
- 	if (!text || !text[0] || text[0] == 0x7f) {
- 		dbg(0,"special key\n");
- 		switch (event->key()) {
- 		case 4099:
- 			{
--				text=(char []){NAVIT_KEY_BACKSPACE,'\0'};
-+				text1[0] = NAVIT_KEY_BACKSPACE;
- 			}
- 			break;
- 		case 4101:
-@@ -253,7 +254,7 @@
- 		QT_QPAINTER_CUSTOM_RETURN
- #endif
- 			{
--				text=(char []){NAVIT_KEY_RETURN,'\0'};
-+				text1[0] = NAVIT_KEY_RETURN;
- 			}
- 			break;
- 		case 4114:
-@@ -261,7 +262,7 @@
- 		QT_QPAINTER_CUSTOM_LEFT
- #endif
- 			{
--				text=(char []){NAVIT_KEY_LEFT,'\0'};
-+				text1[0] = NAVIT_KEY_LEFT;
- 			}
- 			break;
- 		case 4115:
-@@ -269,7 +270,7 @@
- 		QT_QPAINTER_CUSTOM_UP
- #endif
- 			{
--				text=(char []){NAVIT_KEY_UP,'\0'};
-+				text1[0] = NAVIT_KEY_UP;
- 			}
- 			break;
- 		case 4116:
-@@ -277,7 +278,7 @@
- 		QT_QPAINTER_CUSTOM_RIGHT
- #endif
- 			{
--				text=(char []){NAVIT_KEY_RIGHT,'\0'};
-+				text1[0] = NAVIT_KEY_RIGHT;
- 			}
- 			break;
- 		case 4117:
-@@ -285,10 +286,11 @@
- 		QT_QPAINTER_CUSTOM_DOWN
- #endif
- 			{
--				text=(char []){NAVIT_KEY_DOWN,'\0'};
-+				text1[0] = NAVIT_KEY_DOWN;
- 			}
- 			break;
- 		}
-+		if (text1[0]) text = text1;
- 	}
- 	callback_list_call_attr_1(this->cbl, attr_keypress, (void *)text);
- 	event->accept();
diff --git a/meta-oe/recipes-navigation/navit/navit_svn.bb b/meta-oe/recipes-navigation/navit/navit_svn.bb
deleted file mode 100644
index a8df317..0000000
--- a/meta-oe/recipes-navigation/navit/navit_svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require navit.inc
-
-SRCREV = "5159"
-PV = "0.2.0+svnr${SRCPV}"
-PR = "${INC_PR}.3"
-
-S = "${WORKDIR}/${PN}"
-SRC_URI += "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;protocol=http \
-  file://taking-address-of-temporary-array.patch \
-"
-- 
1.8.0



