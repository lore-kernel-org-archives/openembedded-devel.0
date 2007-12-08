Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1J0wXa-0006Hw-HB
	for openembedded-devel@openembedded.org; Sat, 08 Dec 2007 11:04:10 +0100
Received: from Powerbook-2.local (vpn006012.vpn.utwente.nl [130.89.6.12])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lB8A0Ank031105 for <openembedded-devel@lists.openembedded.org>;
	Sat, 8 Dec 2007 11:00:11 +0100
Message-ID: <475A6B2A.9000103@dominion.kabel.utwente.nl>
Date: Sat, 08 Dec 2007 11:00:10 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Webkit update patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Dec 2007 10:04:10 -0000
Content-Type: multipart/mixed; boundary="------------010708030805020104020005"

--------------010708030805020104020005
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

If people want to try a more recent revision of webkit, they should use
this patch:

* update to sane-srcrevs.inc to move to the current head
* add midori 0.13 to test the library
* Merge dftables compile fix from poky
* update .pro and .pri files
* add comment in webkit.inc on how to enable HTML5 media support

This patch hasn't been applied yet since openmoko-browser2 and
openmoko-feedreader2 still use the old non-WebView API. I asked Holger
to update those apps. Once that happens this patch will go in.

happy testing,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHWmsqMkyGM64RGpERAn3mAJ9Y13h/UoIOSkC+4X2BlZ9AaSnXzwCfQK/x
UfQgxLyo9cyQOy8p5N978X0=
=mTyE
-----END PGP SIGNATURE-----
#
# old_revision [e4b084b8f4ff19d7fce5d62b50abc1a6cd0d6347]
#
# add_file "packages/gtk-webcore/midori_0.0.13.bb"
#  content [248eb3a40d4c7bdb50c581812cdbeaeb356a89fd]
# 
# patch "conf/distro/include/sane-srcrevs.inc"
#  from [8cad7fba1595a9a46320eb14f7b63799769241ec]
#    to [7afe0b40afc79605def10b9b3d1c8d518df12928]
# 
# patch "packages/webkit/files/WebKit.pri"
#  from [076f1c82b227a8d1472f9fa12e2fee65bd0c833c]
#    to [2f02fb401cafe257b844462e5cc84a587d1c37fa]
# 
# patch "packages/webkit/files/WebKit.pro"
#  from [dd444c86e92aeb8c404efbd945a61ec54293c346]
#    to [ecf886ef5178fc86bdf74101c5bb563cb326002b]
# 
# patch "packages/webkit/webkit-gtk_svn.bb"
#  from [cda8f2a66ffa21e54d42abd299bfb7e2162a58a5]
#    to [cd0fdf72f4022613efe91cecfdf8f3a71258fca4]
# 
# patch "packages/webkit/webkit.inc"
#  from [a9b135977d33b8fecb08b3e6b9ca8bae313ed7e2]
#    to [1b435431285f60a2f3bb6f118ed12807b76bee80]
#
============================================================
--- packages/gtk-webcore/midori_0.0.13.bb	248eb3a40d4c7bdb50c581812cdbeaeb356a89fd
+++ packages/gtk-webcore/midori_0.0.13.bb	248eb3a40d4c7bdb50c581812cdbeaeb356a89fd
@@ -0,0 +1,11 @@
+DESCRIPTION = "Midori is a lightweight web browser."
+LICENSE = "GPLv2"
+
+DEPENDS = "webkit-gtk libsexy" 
+
+inherit autotools pkgconfig
+
+SRC_URI = "http://software.twotoasts.de/media/midori/midori-${PV}.tar.gz \ 
+          "
+
+
============================================================
--- conf/distro/include/sane-srcrevs.inc	8cad7fba1595a9a46320eb14f7b63799769241ec
+++ conf/distro/include/sane-srcrevs.inc	7afe0b40afc79605def10b9b3d1c8d518df12928
@@ -121,9 +121,9 @@ SRCREV_pn-tmut ?= "60"
 SRCREV_pn-sjf2410-linux-native ?= "933"
 SRCREV_pn-sphyrna ?= "45"
 SRCREV_pn-tmut ?= "60"
-SRCREV_pn-webkit-gtk ?= "27222"
-SRCREV_pn-webkit-qt ?= "27222"
-SRCREV_pn-webkit-qtopia ?= "27222"
+SRCREV_pn-webkit-gtk ?= "28558"
+SRCREV_pn-webkit-qt ?= "28558"
+SRCREV_pn-webkit-qtopia ?= "28558"
 SRCREV_pn-wesnoth ?= "22021"
 SRCREV_pn-xoo ?= "1623"
 SRCREV_pn-mplayer ?= "24587"
============================================================
--- packages/webkit/files/WebKit.pri	076f1c82b227a8d1472f9fa12e2fee65bd0c833c
+++ packages/webkit/files/WebKit.pri	2f02fb401cafe257b844462e5cc84a587d1c37fa
@@ -11,13 +11,44 @@ qt-port:!building-libs {
 qt-port:!building-libs {
     QMAKE_LIBDIR = $$OUTPUT_DIR/lib $$QMAKE_LIBDIR
     LIBS += -lQtWebKit
+    DEPENDPATH += $$PWD/WebKit/qt/Api
 }
-gtk-port:CONFIG += link_pkgconfig
-gtk-port:PKGCONFIG += cairo cairo-ft gdk-2.0 gtk+-2.0 libcurl
-gtk-port:DEFINES += BUILDING_GTK__=1 BUILDING_CAIRO__
-gtk-port:LIBS += -L$$OUTPUT_DIR/lib -lWebKitGtk $$system(icu-config --ldflags) -ljpeg -lpng
-gtk-port:QMAKE_CXXFLAGS += $$system(icu-config --cppflags)
 
+gtk-port:!building-libs {
+    QMAKE_LIBDIR = $$OUTPUT_DIR/lib $$QMAKE_LIBDIR
+    LIBS += -lWebKitGtk
+    DEPENDPATH += $$PWD/WebKit/gtk/WebView $$PWD/WebKit/gtk/WebCoreSupport
+}
+
+gtk-port {
+    CONFIG += link_pkgconfig
+
+    DEFINES += BUILDING_CAIRO__=1 BUILDING_GTK__=1
+
+    # We use FreeType directly with Cairo
+    PKGCONFIG += cairo-ft
+
+    directfb: PKGCONFIG += cairo-directfb gtk+-directfb-2.0
+    else: PKGCONFIG += cairo gtk+-2.0
+
+    # Set a CONFIG flag for the GTK+ target (x11, quartz, win32, directfb)
+    CONFIG += $$system(pkg-config --variable=target $$PKGCONFIG)
+
+    # We use the curl http backend on all platforms
+    PKGCONFIG += libcurl
+
+    LIBS += -lWebKitGtk -ljpeg -lpng
+
+    QMAKE_CXXFLAGS += $$system(icu-config --cppflags)
+    QMAKE_LIBS += $$system(icu-config --ldflags)
+
+    # This set of warnings is borrowed from the Mac build
+    QMAKE_CXXFLAGS += -Wall -W -Wcast-align -Wchar-subscripts -Wformat-security -Wmissing-format-attribute -Wpointer-arith -Wwrite-strings -Wno-format-y2k -Wno-unused-parameter -Wundef
+
+    DEPENDPATH += $$PWD/JavaScriptCore/API
+    INCLUDEPATH += $$PWD
+}
+
 DEFINES += USE_SYSTEM_MALLOC
 CONFIG(release) {
     DEFINES += NDEBUG
@@ -32,7 +63,7 @@ gtk-port:INCLUDEPATH += \
     $$BASE_DIR/WebCore/platform/graphics/cairo \
     $$BASE_DIR/WebCore/loader/gtk \
     $$BASE_DIR/WebCore/page/gtk \
-    $$BASE_DIR/WebKit/gtk/Api \
+    $$BASE_DIR/WebKit/gtk/WebView \
     $$BASE_DIR/WebKit/gtk/WebCoreSupport
 INCLUDEPATH += \
     $$BASE_DIR/JavaScriptCore/ \
============================================================
--- packages/webkit/files/WebKit.pro	dd444c86e92aeb8c404efbd945a61ec54293c346
+++ packages/webkit/files/WebKit.pro	ecf886ef5178fc86bdf74101c5bb563cb326002b
@@ -1,11 +1,17 @@ SUBDIRS += \
 TEMPLATE = subdirs
 CONFIG += ordered
 !gtk-port:CONFIG += qt-port
 qt-port:!win32-*:SUBDIRS += WebKit/qt/Plugins
 SUBDIRS += \
-        WebCore
+        WebCore \
+        JavaScriptCore/kjs/testkjs.pro
 
-qt-port:SUBDIRS += \
-        WebKit/qt/QtLauncher
+qt-port {
+    SUBDIRS += WebKit/qt/QtLauncher
+
+    !win32-*: SUBDIRS += WebKitTools/DumpRenderTree/qt/DumpRenderTree.pro
+}
+
 gtk-port:SUBDIRS += \
+        WebKitTools/GtkLauncher \
+        WebKitTools/DumpRenderTree/gtk/DumpRenderTree.pro
-        WebKitTools/GtkLauncher
============================================================
--- packages/webkit/webkit-gtk_svn.bb	cda8f2a66ffa21e54d42abd299bfb7e2162a58a5
+++ packages/webkit/webkit-gtk_svn.bb	cd0fdf72f4022613efe91cecfdf8f3a71258fca4
@@ -1,6 +1,9 @@ DEPENDS = "curl icu libxml2 cairo libxsl
 DEPENDS = "curl icu libxml2 cairo libxslt libidn gnutls gtk+"
 
+# If you activate HTML5 media support (ENABLE_VIDEO=1) you'll need:
+# DEPENDS += " gstreamer gst-plugins-base gnome-vfs "
 
+
 WEBKIT_PORT = "gtk-port"
 WEBKIT_EXTRA_OPTIONS = "CONFIG-=qt"
 
============================================================
--- packages/webkit/webkit.inc	a9b135977d33b8fecb08b3e6b9ca8bae313ed7e2
+++ packages/webkit/webkit.inc	1b435431285f60a2f3bb6f118ed12807b76bee80
@@ -34,7 +34,13 @@ do_compile_prepend() {
 do_compile_prepend() {
 	mkdir -p ${S}/WebKitBuilds/Debug/JavaScriptCore/pcre/tmp/
 	cd ${S}/JavaScriptCore/pcre 
-	${BUILD_CC} dftables.c -o dftables -I. -I../wtf
+	if test -e dftables.c
+	then
+	    ${BUILD_CC} dftables.c -o dftables -I. -I../wtf
+	elif test -e dftables.cpp
+	then
+	    ${BUILD_CXX} dftables.cpp -o dftables -I. -I../wtf
+	fi
 	cp dftables ${S}/WebKitBuilds/Debug/JavaScriptCore/pcre/tmp/
 	cd ${S}/WebKitBuilds/Debug
 }

--------------010708030805020104020005--
