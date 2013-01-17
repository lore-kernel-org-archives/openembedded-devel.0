Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tvpci-0004Ob-KI
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2013 14:35:24 +0100
Received: by mail-pb0-f51.google.com with SMTP id ro12so1393908pbb.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2013 05:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=7/NjQ1HrtlIL6i9VpSGnbgWgB1yRJc5qEb1/7+/ZVGw=;
	b=gOIV0Qt0v8zKtK2rkCvCJqBTniK/65K6evAZxcZYEbM0B7mYqL6AWafWTN10TFBHvU
	cPmxLx6ch0hDrBwDxd0bYA4AZOtwFIQyxaBFwPx0N64AGVgx7uWwmKDndbkPEpQRnPap
	vb/d1AcAowQOCyUQYbRYgDXgtz711fMEuyNbg3PmnKr3LrpY+au65a0DdsU0UjwnyYTl
	IoPFLki+rX21XRo0NkiXNFRSJbIcYX453/wFNMR7NwXNsNkIQGfLQDSOuy+d+UfzWv58
	nyTImf358cOwTOssLedjlMjZCU0eRLd+6Q6ObFVV9Al9dVXg+O1N/dz80fXus7ToeCar
	pjlA==
X-Received: by 10.66.90.34 with SMTP id bt2mr10420465pab.29.1358428792850;
	Thu, 17 Jan 2013 05:19:52 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id wg3sm1075697pbc.28.2013.01.17.05.19.50
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 05:19:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Jan 2013 14:19:44 +0100
Message-Id: <1358428784-30885-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
Subject: [PATCH][meta-gnome] gtk+3: drop recipe, now in oe-core
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
X-List-Received-Date: Thu, 17 Jan 2013 13:35:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.4.4.bb | 104 ---------------------------
 1 file changed, 104 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gtk+/gtk+3_3.4.4.bb

diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.4.4.bb b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.4.4.bb
deleted file mode 100644
index ce09615..0000000
--- a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.4.4.bb
+++ /dev/null
@@ -1,104 +0,0 @@
-SUMMARY = "Multi-platform toolkit for creating GUIs"
-DESCRIPTION = "GTK+ is a multi-platform toolkit for creating graphical user interfaces. Offering a complete \
-set of widgets, GTK+ is suitable for projects ranging from small one-off projects to complete application suites."
-HOMEPAGE = "http://www.gtk.org"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-SECTION = "libs"
-
-DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
-           gtk-doc-native docbook-utils-native libxrandr libgcrypt \
-           libxdamage libxrender libxcomposite libxi cairo gdk-pixbuf gtk+-native"
-
-LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
-                    file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-                    file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
-                    file://tests/testgtk.c;endline=25;md5=cb732daee1d82af7a2bf953cf3cf26f1"
-
-SRC_URI = "http://download.gnome.org/sources/gtk+/3.4/gtk+-${PV}.tar.xz \
-"
-
-SRC_URI[md5sum] = "1b2cf29502a6394e8d4b30f7f5bb9131"
-SRC_URI[sha256sum] = "f154e460075034da4c0ce89c320025dcd459da2a1fdf32d92a09522eaca242c7"
-
-PR = "r0"
-
-inherit autotools pkgconfig
-
-S = "${WORKDIR}/gtk+-${PV}"
-
-# Make it parallel installable with gtk+ 2.x
-# The helper apps like gtk-update-iconcache won't get built here
-EXTRA_OECONF += " \
-                 --enable-gtk2-dependency \
-                 --disable-glibtest \
-                 --enable-modules \
-                 --disable-cups \
-"
-
-# Make a symlink to our libtool
-do_configure_prepend() {
-	ln -s ${TARGET_PREFIX}libtool libtool || true
-}
-
-PACKAGES =+ "${PN}-demo"
-LIBV = "3.0.0"
-
-FILES_${PN}-demo = "${bindir}/gtk3-demo \
-                    ${datadir}/gtk-3.0/demo \
-                    ${bindir}/gtk3-demo-application \
-                    ${bindir}/gtk3-widget-factory \
-"
-
-FILES_${PN} = "${bindir}/gtk-update-icon-cache \
-               ${bindir}/gtk-query-immodules-3.0 \
-               ${libdir}/lib*${SOLIBS} \
-               ${datadir}/themes ${sysconfdir} ${datadir}/glib-2.0/schemas/ \
-               ${datadir}/gtk-3.0/gtkbuilder.rng \
-               ${libdir}/gtk-3.0/${LIBV}/engines/libpixmap.so \
-               ${libdir}/gtk-3.0/modules/*.so"
-
-FILES_${PN}-dev += " \
-                    ${datadir}/gtk-3.0/include \
-                    ${libdir}/gtk-3.0/include \
-                    ${libdir}/gtk-3.0/${LIBV}/loaders/*.la \
-                    ${libdir}/gtk-3.0/${LIBV}/immodules/*.la \
-                    ${libdir}/gtk-3.0/3.0.0/printbackends/*.la \
-                    ${libdir}/gtk-3.0/${LIBV}/engines/*.la \
-                    ${libdir}/gtk-3.0/modules/*.la \
-                    ${bindir}/gtk-builder-convert"
-
-FILES_${PN}-dbg += " \
-                    ${libdir}/gtk-3.0/${LIBV}/loaders/.debug \
-                    ${libdir}/gtk-3.0/${LIBV}/immodules/.debug \
-                    ${libdir}/gtk-3.0/${LIBV}/engines/.debug \
-                    ${libdir}/gtk-3.0/${LIBV}/printbackends/.debug \
-                    ${libdir}/gtk-3.0/modules/.debug"
-
-
-PACKAGES_DYNAMIC += "^gtk3-immodule-.* ^gtk3-printbackend-.*"
-
-python populate_packages_prepend () {
-    import os.path
-
-    prologue = d.getVar("postinst_prologue", 1)
-
-    gtk_libdir = d.expand('${libdir}/gtk-3.0/${LIBV}')
-    immodules_root = os.path.join(gtk_libdir, 'immodules')
-    printmodules_root = os.path.join(gtk_libdir, 'printbackends');
-
-    do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for %s', prologue + 'gtk-query-immodules-3.0 > /etc/gtk-3.0/gtk.immodules')
-    do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
-
-    if (d.getVar('DEBIAN_NAMES', 1)):
-        d.setVar('PKG_${PN}', 'libgtk-3.0')
-}
-
-postinst_prologue() {
-if [ "x$D" != "x" ]; then
-  exit 1
-fi
-
-}
-
-- 
1.8.1.1



