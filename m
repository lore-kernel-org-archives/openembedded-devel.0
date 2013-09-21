Return-Path: <superandy@localhost.localdomain>
Received: from localhost.localdomain (p5B0A2F3E.dip0.t-ipconnect.de
	[91.10.47.62])
	by mail.openembedded.org (Postfix) with ESMTP id 087B06CA20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2013 10:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.7/8.14.7) with ESMTP id r8LAfxo7013446; 
	Sat, 21 Sep 2013 12:41:59 +0200
Received: (from superandy@localhost)
	by localhost.localdomain (8.14.7/8.14.7/Submit) id r8LAfvRZ013445;
	Sat, 21 Sep 2013 12:41:57 +0200
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Sep 2013 12:41:36 +0200
Message-Id: <1379760101-13380-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 05/10] libcanberra avoid gtk3 dragged in at gtk2 environments
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
X-List-Received-Date: Sat, 21 Sep 2013 10:42:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build two versions of canberra-gtk-play for gtk2 and gtk3.
* move canberra-gtk-play to libcanberra-gtk2 and canberra-gtk3-play to
  libcanberra-gtk2.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...tk-and-gtk3-version-for-canberra_gtk_play.patch | 92 ++++++++++++++++++++++
 .../libcanberra/libcanberra_0.29.bb                | 13 ++-
 2 files changed, 101 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch

diff --git a/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch b/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch
new file mode 100644
index 0000000..4e0984f
--- /dev/null
+++ b/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch
@@ -0,0 +1,92 @@
+From 4a89ddffbb14d747adbe3365ace4db87de52ba39 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 16 Sep 2013 16:08:28 +0200
+Subject: [PATCH] build gtk- and gtk3-version for canberra_gtk_play
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/Makefile.am |   25 +++++++++++++++----------
+ 1 files changed, 15 insertions(+), 10 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 56ed96d..fc72e1f 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -319,9 +319,6 @@ endif
+ 
+ if HAVE_GTK_ANY
+ 
+-bin_PROGRAMS += \
+-	canberra-gtk-play
+-
+ include_HEADERS += \
+ 	canberra-gtk.h
+ 
+@@ -329,6 +326,9 @@ endif
+ 
+ if HAVE_GTK3
+ 
++bin_PROGRAMS += \
++	canberra-gtk3-play
++
+ lib_LTLIBRARIES += \
+ 	libcanberra-gtk3.la
+ 
+@@ -367,6 +367,9 @@ endif
+ 
+ if HAVE_GTK
+ 
++bin_PROGRAMS += \
++	canberra-gtk-play
++
+ lib_LTLIBRARIES += \
+ 	libcanberra-gtk.la
+ 
+@@ -399,14 +402,17 @@ endif
+ 
+ if HAVE_GTK3
+ 
+-canberra_gtk_play_LDADD = \
++canberra_gtk3_play_LDADD = \
+ 	$(GTK3_LIBS) \
+ 	libcanberra.la \
+ 	libcanberra-gtk3.la
+-canberra_gtk_play_CFLAGS = \
++canberra_gtk3_play_CFLAGS = \
+ 	$(GTK3_CFLAGS)
+ 
+-else
++canberra_gtk3_play_SOURCES = \
++	canberra-gtk-play.c
++
++endif
+ if HAVE_GTK
+ 
+ canberra_gtk_play_LDADD = \
+@@ -416,7 +422,9 @@ canberra_gtk_play_LDADD = \
+ canberra_gtk_play_CFLAGS = \
+ 	$(GTK_CFLAGS)
+ 
+-endif
++canberra_gtk_play_SOURCES = \
++	canberra-gtk-play.c
++
+ endif
+ 
+ if HAVE_GTK_ANY
+@@ -424,9 +432,6 @@ if HAVE_GTK_ANY
+ dist_gsdgtkmodules_DATA = \
+ 	canberra-gtk-module.desktop
+ 
+-canberra_gtk_play_SOURCES = \
+-	canberra-gtk-play.c
+-
+ EXTRA_DIST += \
+ 	libcanberra-login-sound.desktop.in \
+ 	libcanberra-ready-sound.desktop.in \
+-- 
+1.7.6.5
+
diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
index da94c20..8b771bf 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
@@ -8,7 +8,10 @@ DEPENDS = "gstreamer gtk+ gtk+3 libtool libvorbis"
 
 inherit autotools
 
-SRC_URI = "http://0pointer.de/lennart/projects/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI = " \
+    http://0pointer.de/lennart/projects/${BPN}/${BPN}-${PV}.tar.xz \
+    file://0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch \
+"
 SRC_URI[md5sum] = "2594093a5d61047bd9cc87e955f86df8"
 SRC_URI[sha256sum] = "127a5ef07805856d63758e5180ebfb241d1f80094fd301c287591a15b8cfcd72"
 
@@ -39,19 +42,21 @@ PACKAGES_DYNAMIC += "^libcanberra-.*"
 
 FILES_${PN} = "${bindir}/ ${libdir}/${BPN}.so.*"
 
-FILES_${PN}-dev += "${datadir}/vala/vapi"
+FILES_${PN}-dev += "${datadir}/vala/vapi ${libdir}/*/modules/*.la ${libdir}/*/*.la"
 
 FILES_${PN}-dbg += "${libdir}/${P}/.debug ${libdir}/gtk-*/modules/.debug"
 
 FILES_${PN}-gtk2 = "${libdir}/${BPN}-gtk.so.* \
                     ${libdir}/gtk-2.0/modules/*.la \
-                    ${libdir}/gtk-2.0/modules/*.so"
+                    ${libdir}/gtk-2.0/modules/*.so \
+                    ${bindir}/canberra-gtk-play"
 
 # -gtk3 ships a symlink to a .so
 INSANE_SKIP_${PN}-gtk3 = "dev-so"
 FILES_${PN}-gtk3 = "${libdir}/${BPN}-gtk3.so.* \
                     ${libdir}/gtk-3.0/modules/*.la \
-                    ${libdir}/gtk-3.0/modules/*.so"
+                    ${libdir}/gtk-3.0/modules/*.so \
+                    ${bindir}/canberra-gtk3-play"
 
 FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/ \
                      ${datadir}/gdm/ ${datadir}/gnome/"
-- 
1.8.3.1


