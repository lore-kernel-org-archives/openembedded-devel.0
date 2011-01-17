Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PeriZ-0002EY-Bg
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 17:14:07 +0100
Received: (qmail invoked by alias); 17 Jan 2011 16:06:49 -0000
Received: from p5DE49076.dip.t-dialin.net (EHLO
	localhost.localdomain.localdomain) [93.228.144.118]
	by mail.gmx.net (mp007) with SMTP; 17 Jan 2011 17:06:49 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX191m8UajNJ1i52HWFpWYCGfg9lxRSDuYJTno1C2j/
	vlG0DDhoF214qy
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jan 2011 18:06:08 +0100
Message-Id: <1295283968-2540-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.2.3
X-Y-GMX-Trusted: 0
Subject: [PATCH] clutter: configure all libs with "--disable-introspection"
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
X-List-Received-Date: Mon, 17 Jan 2011 16:14:07 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/clutter/clutter-box2d.inc |    4 +++-
 recipes/clutter/clutter-gst.inc   |    4 +++-
 recipes/clutter/clutter-gtk.inc   |    4 +++-
 recipes/clutter/clutter.inc       |    4 ++--
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/recipes/clutter/clutter-box2d.inc b/recipes/clutter/clutter-box2d.inc
index 7541335..395109e 100644
--- a/recipes/clutter/clutter-box2d.inc
+++ b/recipes/clutter/clutter-box2d.inc
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2.1"
 
 DEPENDS = "clutter"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 # The main clutter lib is machine specific so we need to be too
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -13,6 +13,8 @@ inherit autotools pkgconfig gtk-doc
 
 require clutter-common.inc
 
+EXTRA_OECONF = "--disable-introspection"
+
 do_configure_prepend() {
 	make_all_execs_installable
 }
diff --git a/recipes/clutter/clutter-gst.inc b/recipes/clutter/clutter-gst.inc
index b25f31e..814f493 100644
--- a/recipes/clutter/clutter-gst.inc
+++ b/recipes/clutter/clutter-gst.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Clutter GStreamer integration library"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2.1"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 DEPENDS = "clutter gstreamer gst-plugins-base"
 
@@ -10,6 +10,8 @@ require clutter-common.inc
 
 inherit autotools pkgconfig
 
+EXTRA_OECONF = "--disable-introspection"
+
 align_examples_data_location() {
 	for full_name in $(find ${S}/examples -name *.png) ; do
 		data_name=${full_name##*/}
diff --git a/recipes/clutter/clutter-gtk.inc b/recipes/clutter/clutter-gtk.inc
index 6e624c5..a4ada7f 100644
--- a/recipes/clutter/clutter-gtk.inc
+++ b/recipes/clutter/clutter-gtk.inc
@@ -2,13 +2,15 @@ DESCRIPTION = "Clutter GTK+ integration library"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2.1"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 DEPENDS = "gtk+ clutter"
 require clutter-common.inc
 
 inherit autotools pkgconfig gtk-doc
 
+EXTRA_OECONF = "--disable-introspection"
+
 do_configure_prepend() {
 	make_all_execs_installable
 
diff --git a/recipes/clutter/clutter.inc b/recipes/clutter/clutter.inc
index 84a7af9..2a061af 100644
--- a/recipes/clutter/clutter.inc
+++ b/recipes/clutter/clutter.inc
@@ -9,7 +9,7 @@ INC_SRC_URI = "file://sample.desktop \
 PARALLEL_MAKE = ""
 
 STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gtk+"
-BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)} --enable-conformance "
+BASE_CONF = "--disable-introspection --disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)} --enable-conformance "
 
 DEPENDS = "${STDDEPENDS} virtual/libgl"
 EXTRA_OECONF = "${BASE_CONF} --with-flavour=glx"
@@ -41,7 +41,7 @@ EXTRA_OECONF_mx31ads = "${BASE_CONF} --with-flavour=eglnative"
 PACKAGE_ARCH_mx31ads = "${MACHINE_ARCH}"
 LDFLAGS_append_mx31ads = " -lpvrNULLWSEGL -lstdc++ "
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 inherit autotools pkgconfig gtk-doc
 
-- 
1.7.2.3



