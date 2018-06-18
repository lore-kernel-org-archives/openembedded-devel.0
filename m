Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3911D75318
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 23:26:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5INQ8TM028224
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 16:26:28 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 18 Jun 2018 16:26:06 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Jun 2018 19:26:03 -0400
Message-ID: <1529364363-19274-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] xfce4: package libtool files if they are installed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2018 23:26:38 -0000
Content-Type: text/plain

This is a partial revert of commit 2ad5ceafa53f [various classes
recipes: Remove FILES entries for dbg/dev packages] to restore the
packaging of libtool (.la) files. It is generally recommended to
include 'remove-libtool' in your distro features to purge libtool
files as a do_install postfunc for all recipes, as is the documented
recommendation for handling of libtool files (unless the .la have been
determined to be absolutely necessary, in which case a recipe can use
the REMOVE_LIBTOOL_LA to prevent the cleanup). However, if the
'remove-libtool' distro feature is not specified we need to ensure
that if after a recipe completes do_install() and there are libtool
files present in the image, we must package them or we will hit
'installed-vs-shipped' QA issues.

NOTE: that even with respect to libtool files this is not a 1:1
partial revert of commit 2ad5ceafa53f, adjustments are made according
to the current state of the build today.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

This is follow up to my original patch submission
http://lists.openembedded.org/pipermail/openembedded-devel/2018-June/118896.html

As the discussion concludes we need to ensure that using the
'remove-libtool' distro feature is in fact optional and that means
either libtool files that are 'installed' must be packaged or deleted,
the former being the preferred.

 meta-xfce/classes/thunar-plugin.bbclass                         | 2 ++
 meta-xfce/classes/xfce-panel-plugin.bbclass                     | 1 +
 meta-xfce/recipes-apps/orage/orage_4.12.1.bb                    | 2 +-
 meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb             | 2 ++
 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb | 5 +++++
 meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb                 | 4 ++++
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb        | 2 ++
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb    | 4 ++++
 8 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/classes/thunar-plugin.bbclass b/meta-xfce/classes/thunar-plugin.bbclass
index 692f121..76b0e72 100644
--- a/meta-xfce/classes/thunar-plugin.bbclass
+++ b/meta-xfce/classes/thunar-plugin.bbclass
@@ -7,3 +7,5 @@ DEPENDS += "thunar"
 SRC_URI = "http://archive.xfce.org/src/thunar-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
 
 FILES_${PN} += "${libdir}/thunarx-3/*.so"
+
+FILES_${PN}-dev += "${libdir}/thunarx-3/*.la"
diff --git a/meta-xfce/classes/xfce-panel-plugin.bbclass b/meta-xfce/classes/xfce-panel-plugin.bbclass
index fbc754c..29c1245 100644
--- a/meta-xfce/classes/xfce-panel-plugin.bbclass
+++ b/meta-xfce/classes/xfce-panel-plugin.bbclass
@@ -11,3 +11,4 @@ FILES_${PN} += "${datadir}/xfce4/panel/plugins/"
 FILES_${PN} += "${libdir}/xfce4/panel-plugins/*.so"
 FILES_${PN} += "${libdir}/xfce4/panel/plugins/*.so"
 
+FILES_${PN}-dev += "${libdir}/xfce4/panel/plugins/*.la"
\ No newline at end of file
diff --git a/meta-xfce/recipes-apps/orage/orage_4.12.1.bb b/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
index 22af379..eb9da2d 100644
--- a/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
+++ b/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
@@ -15,4 +15,4 @@ PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
 PACKAGES =+ "xfce4-orageclock-plugin"
 FILES_${PN} += "${datadir}/dbus-1"
 FILES_xfce4-orageclock-plugin = "${libdir}/xfce4/panel/plugins/*.so ${datadir}/xfce4/panel/plugins"
-
+FILES_${PN}-dev += "${libdir}/xfce4/panel/plugins/*.la"
diff --git a/meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb b/meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb
index 7e11b77..2b4e974 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb
@@ -34,3 +34,5 @@ FILES_${PN} += " \
     ${datadir}/appdata \
     ${libdir}/parole-0/*.so \
 "
+
+FILES_${PN}-dev += "${libdir}/parole-0/*.la"
diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
index aae07e1..805e893 100644
--- a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
+++ b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
@@ -21,5 +21,10 @@ FILES_${PN} += "${libdir}/gtk-2.0/*/engines/*.so"
 FILES_gtk3-xfce-engine += "${libdir}/gtk-3.0/*/theming-engines/*.so"
 FILES_${PN}-themes += "${datadir}/themes"
 
+FILES_${PN}-dev += " \
+    ${libdir}/gtk-2.0/*/engines/*.la \
+    ${libdir}/gtk-3.0/*/theming-engines/*.la \
+"
+
 RDEPENDS_${PN} += "${PN}-themes"
 RDEPENDS_gtk3-xfce-engine += "${PN}-themes"
diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb
index 6113150..9d26694 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.0.bb
@@ -26,3 +26,7 @@ FILES_${PN} += "${datadir}/dbus-1/services \
                 ${libdir}/tumbler-1/plugins/*.so \
                 ${libdir}/tumbler-1/plugins/cache/*.so \
 "
+
+FILES_${PN}-dev += "${libdir}/tumbler-1/plugins/*.la \
+                    ${libdir}/tumbler-1/plugins/cache/*.la \
+"
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb
index 6625f05..42118a0 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb
@@ -32,6 +32,8 @@ PACKAGES =+ "${PN}-gtk3"
 FILES_${PN} += "${libdir}/xfce4/panel/migrate \
                 ${libdir}/xfce4/panel/wrapper-1.0"
 
+FILES_${PN}-dev += "${libdir}/xfce4/panel/plugins/*.la"
+
 FILES_${PN}-gtk3 = " \
     ${libdir}/libxfce4panel-2.0${SOLIBS} \
     ${libdir}/xfce4/panel/wrapper-2.0 \
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
index 899edbf..712597b 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
@@ -27,4 +27,8 @@ FILES_${PN} += " \
     ${datadir}/polkit-1 \
 "
 
+FILES_${PN} += " \
+    ${libdir}/xfce4/session/splash-engines/*.la \
+"
+
 RDEPENDS_${PN} += "machine-host"
-- 
2.7.4


