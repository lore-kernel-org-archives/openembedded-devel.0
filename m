Received: from [195.135.220.15] (helo=mx2.suse.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LpMvG-0007HV-DX
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 15:26:06 +0200
Received: from Relay2.suse.de (relay-ext.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id D1EF774862
	for <openembedded-devel@openembedded.org>;
	Thu,  2 Apr 2009 15:23:09 +0200 (CEST)
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 7671E62806A
	for <openembedded-devel@openembedded.org>;
	Thu,  2 Apr 2009 15:23:09 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Date: Thu, 02 Apr 2009 15:23:07 +0200
Message-Id: <1238678587.27664.36.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.25.92 
X-SA-Exim-Connect-IP: 195.135.220.15
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_20,RCVD_IN_DNSWL_MED,
	RDNS_NONE,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] introduction of virtual/gail
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
X-List-Received-Date: Thu, 02 Apr 2009 13:26:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

gtk+ >= 2.13.0 already includes gail. However build of gail package may
be still triggered by a number of package that require it explicitly. It
causes runtime problems having two different packages providing the same
library.

This patch introduces virtual/gail, which can be satisfied by gtk+ >=
2.13.0 or gail, depending on preferred version of gtk+ of a particular
distro.

diff --git a/recipes/eel/eel_2.12.2.bb b/recipes/eel/eel_2.12.2.bb
index 92bfc88..e56ebdd 100644
--- a/recipes/eel/eel_2.12.2.bb
+++ b/recipes/eel/eel_2.12.2.bb
@@ -7,7 +7,7 @@ inherit gnome
 LICENSE="GPL"
 SRC_URI += "file://configure.patch;patch=1"
 
-DEPENDS = "gnome-vfs gnome-desktop gnome-menus libgnomeui gail"
+DEPENDS = "gnome-vfs gnome-desktop gnome-menus libgnomeui virtual/gail"
 EXTRA_OECONF = "--disable-gtk-doc"
 
 
diff --git a/recipes/eel/eel_2.22.2.bb b/recipes/eel/eel_2.22.2.bb
index 0435379..afe9406 100644
--- a/recipes/eel/eel_2.22.2.bb
+++ b/recipes/eel/eel_2.22.2.bb
@@ -8,7 +8,7 @@ LICENSE="GPL"
 
 SRC_URI += "file://eel-no-strftime.patch;patch=1"
 
-DEPENDS = "gnome-vfs gnome-desktop gnome-menus libgnomeui gail"
+DEPENDS = "gnome-vfs gnome-desktop gnome-menus libgnomeui virtual/gail"
 EXTRA_OECONF = "--disable-gtk-doc"
 
 do_stage() {
diff --git a/recipes/eel/eel_2.24.1.bb b/recipes/eel/eel_2.24.1.bb
index 0435379..afe9406 100644
--- a/recipes/eel/eel_2.24.1.bb
+++ b/recipes/eel/eel_2.24.1.bb
@@ -8,7 +8,7 @@ LICENSE="GPL"
 
 SRC_URI += "file://eel-no-strftime.patch;patch=1"
 
-DEPENDS = "gnome-vfs gnome-desktop gnome-menus libgnomeui gail"
+DEPENDS = "gnome-vfs gnome-desktop gnome-menus libgnomeui virtual/gail"
 EXTRA_OECONF = "--disable-gtk-doc"
 
 do_stage() {
diff --git a/recipes/eel/eel_2.6.1.bb b/recipes/eel/eel_2.6.1.bb
index f123a4a..9de6873 100644
--- a/recipes/eel/eel_2.6.1.bb
+++ b/recipes/eel/eel_2.6.1.bb
@@ -7,7 +7,7 @@ inherit gnome
 LICENSE="GPL"
 SRC_URI += "file://configure.patch;patch=1"
 
-DEPENDS="libgnomeui gail"
+DEPENDS="libgnomeui virtual/gail"
 EXTRA_OECONF = "--disable-gtk-doc"
 
 edir="${STAGING_INCDIR}/eel-2/eel"
diff --git a/recipes/gnome/gail_1.20.0.bb b/recipes/gnome/gail_1.20.0.bb
index 58168a0..13346f3 100644
--- a/recipes/gnome/gail_1.20.0.bb
+++ b/recipes/gnome/gail_1.20.0.bb
@@ -3,6 +3,7 @@ SECTION = "x11/libs"
 PR = "r0"
 DESCRIPTION = "GNOME Accessibility Implementation Library"
 DEPENDS = "gtk+"
+PROVIDES = "virtual/gail"
 
 inherit gnome
 
diff --git a/recipes/gnome/libgnomecanvas_2.20.0.bb b/recipes/gnome/libgnomecanvas_2.20.0.bb
index 8e13c95..9396ea4 100644
--- a/recipes/gnome/libgnomecanvas_2.20.0.bb
+++ b/recipes/gnome/libgnomecanvas_2.20.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "A powerful object-oriented display"
 
 inherit gnome
 
-DEPENDS = "libglade libart-lgpl gail"
+DEPENDS = "libglade libart-lgpl virtual/gail"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
diff --git a/recipes/gtk+/gtk+.inc b/recipes/gtk+/gtk+.inc
index e17a91d..c0b9ed5 100644
--- a/recipes/gtk+/gtk+.inc
+++ b/recipes/gtk+/gtk+.inc
@@ -44,6 +44,9 @@ do_stage () {
 	oe_libinstall -so -C gdk libgdk-x11-2.0 ${STAGING_LIBDIR}
 	oe_libinstall -so -C contrib/gdk-pixbuf-xlib libgdk_pixbuf_xlib-2.0 ${STAGING_LIBDIR}
 	oe_libinstall -so -C gdk-pixbuf libgdk_pixbuf-2.0 ${STAGING_LIBDIR}
+	if test -d modules/other/gail/libgail-util ; then
+		oe_libinstall -so -C modules/other/gail/libgail-util libgailutil ${STAGING_LIBDIR}
+	fi
 
 	autotools_stage_includes
 
diff --git a/recipes/gtk+/gtk+_2.14.2.bb b/recipes/gtk+/gtk+_2.14.2.bb
index 259c0ac..84fe2fb 100644
--- a/recipes/gtk+/gtk+_2.14.2.bb
+++ b/recipes/gtk+/gtk+_2.14.2.bb
@@ -39,6 +39,8 @@ python populate_packages_prepend () {
                 bb.data.setVar('PKG_${PN}', 'libgtk-2.0', d)
 }
 
+# gail is part of gtk+ since gtk+-2.13.0 (targetting >=GNOME 2.23):
+PROVIDES = "virtual/gail"
 RPROVIDES_${PN} = "libgailutil18"
 RCONFLICTS_${PN} = "libgailutil18"
 RREPLACES_${PN} = "libgailutil18"
diff --git a/recipes/gtk+/gtk+_2.16.0.bb b/recipes/gtk+/gtk+_2.16.0.bb
index b5f7c71..7860d62 100644
--- a/recipes/gtk+/gtk+_2.16.0.bb
+++ b/recipes/gtk+/gtk+_2.16.0.bb
@@ -40,6 +40,8 @@ python populate_packages_prepend () {
                 bb.data.setVar('PKG_${PN}', 'libgtk-2.0', d)
 }
 
+# gail is part of gtk+ since gtk+-2.13.0 (targetting >=GNOME 2.23):
+PROVIDES = "virtual/gail"
 RPROVIDES_${PN} = "libgailutil18"
 RCONFLICTS_${PN} = "libgailutil18"
 RREPLACES_${PN} = "libgailutil18"
diff --git a/recipes/gtkhtml/gtkhtml-2.0_2.6.3.bb b/recipes/gtkhtml/gtkhtml-2.0_2.6.3.bb
index f44e8b5..c31bc7e 100644
--- a/recipes/gtkhtml/gtkhtml-2.0_2.6.3.bb
+++ b/recipes/gtkhtml/gtkhtml-2.0_2.6.3.bb
@@ -1,6 +1,6 @@
 require gtkhtml.inc
 
-DEPENDS = "gtk+ gail libbonoboui libgnomeprintui libgnomeui gal-2.0"
+DEPENDS = "gtk+ virtual/gail libbonoboui libgnomeprintui libgnomeui gal-2.0"
 PR = "r0"
 
 SRC_URI = "http://ftp.debian.org/debian/pool/main/libg/libgtkhtml2/libgtkhtml2_2.6.3.orig.tar.gz"
diff --git a/recipes/gtkhtml/gtkhtml-3.0_3.0.10.bb b/recipes/gtkhtml/gtkhtml-3.0_3.0.10.bb
index 66993ce..f68b433 100644
--- a/recipes/gtkhtml/gtkhtml-3.0_3.0.10.bb
+++ b/recipes/gtkhtml/gtkhtml-3.0_3.0.10.bb
@@ -1,6 +1,6 @@
 require gtkhtml.inc
 
-DEPENDS = "gtk+ gail libbonoboui libgnomeprintui libgnomeui gal-2.0"
+DEPENDS = "gtk+ virtual/gail libbonoboui libgnomeprintui libgnomeui gal-2.0"
 PR = "r2"
 
 SRC_URI = "${GNOME_MIRROR}/gtkhtml/3.0/gtkhtml-${PV}.tar.bz2 \
diff --git a/recipes/gtkhtml/gtkhtml-3.1_3.1.16.bb b/recipes/gtkhtml/gtkhtml-3.1_3.1.16.bb
index 1e389da..904254c 100644
--- a/recipes/gtkhtml/gtkhtml-3.1_3.1.16.bb
+++ b/recipes/gtkhtml/gtkhtml-3.1_3.1.16.bb
@@ -1,6 +1,6 @@
 require gtkhtml.inc
 
-DEPENDS = "gtk+ gail libbonoboui libgnomeprintui libgnomeui"
+DEPENDS = "gtk+ virtual/gail libbonoboui libgnomeprintui libgnomeui"
 
 SRC_URI = "${GNOME_MIRROR}/gtkhtml/3.1/gtkhtml-${PV}.tar.bz2"
 FILES_${PN} += "${datadir}/gtkhtml-3.1"
diff --git a/recipes/gtkhtml/gtkhtml-3.6_3.6.2.bb b/recipes/gtkhtml/gtkhtml-3.6_3.6.2.bb
index cb2b8b2..04c4ded 100644
--- a/recipes/gtkhtml/gtkhtml-3.6_3.6.2.bb
+++ b/recipes/gtkhtml/gtkhtml-3.6_3.6.2.bb
@@ -1,6 +1,6 @@
 require gtkhtml.inc
 
-DEPENDS = "gtk+ gail libbonoboui libgnomeprintui libgnomeui"
+DEPENDS = "gtk+ virtual/gail libbonoboui libgnomeprintui libgnomeui"
 
 SRC_URI = "${GNOME_MIRROR}/gtkhtml/3.6/gtkhtml-${PV}.tar.bz2 \
 	file://cross-includedir.patch;patch=1"
diff --git a/recipes/gtkhtml/gtkhtml-3.8_3.12.3.bb b/recipes/gtkhtml/gtkhtml-3.8_3.12.3.bb
index e8727bd..68d6fbb 100644
--- a/recipes/gtkhtml/gtkhtml-3.8_3.12.3.bb
+++ b/recipes/gtkhtml/gtkhtml-3.8_3.12.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "HTML rendering/editing library"
 SECTION = "x11/libs"
 PRIORITY = "optional"
 LICENSE = "GPL"
-DEPENDS = "gtk+ gail libbonoboui libgnomeprintui libgnomeui"
+DEPENDS = "gtk+ virtual/gail libbonoboui libgnomeprintui libgnomeui"
 
 SRC_URI = "${GNOME_MIRROR}/gtkhtml/3.12/gtkhtml-${PV}.tar.bz2 \
            file://60_glib-2.15-g-gnuc-function.patch;patch=1"
diff --git a/recipes/gtkhtml/gtkhtml-3.8_3.18.0.bb b/recipes/gtkhtml/gtkhtml-3.8_3.18.0.bb
index e678bc3..e47f0a4 100644
--- a/recipes/gtkhtml/gtkhtml-3.8_3.18.0.bb
+++ b/recipes/gtkhtml/gtkhtml-3.8_3.18.0.bb
@@ -1,6 +1,6 @@
 require gtkhtml.inc
 
-DEPENDS = "gtk+ gail libbonoboui libgnomeprintui libgnomeui"
+DEPENDS = "gtk+ virtual/gail libbonoboui libgnomeprintui libgnomeui"
 
 SRC_URI = "${GNOME_MIRROR}/gtkhtml/3.18/gtkhtml-${PV}.tar.bz2"
 FILES_${PN} += "${datadir}/gtkhtml-3.8"
diff --git a/recipes/gtkhtml/gtkhtml-3.8_3.8.2.bb b/recipes/gtkhtml/gtkhtml-3.8_3.8.2.bb
index cc177de..f7bcbea 100644
--- a/recipes/gtkhtml/gtkhtml-3.8_3.8.2.bb
+++ b/recipes/gtkhtml/gtkhtml-3.8_3.8.2.bb
@@ -1,6 +1,6 @@
 require gtkhtml.inc
 
-DEPENDS = "gtk+ gail libbonoboui libgnomeprintui libgnomeui"
+DEPENDS = "gtk+ virtual/gail libbonoboui libgnomeprintui libgnomeui"
 
 SRC_URI = "${GNOME_MIRROR}/gtkhtml/3.8/gtkhtml-${PV}.tar.bz2"
 FILES_${PN} += "${datadir}/gtkhtml-3.8"
diff --git a/recipes/gtkhtml/gtkhtml-lite-3.0_3.0.10.bb b/recipes/gtkhtml/gtkhtml-lite-3.0_3.0.10.bb
index 44a96d6..f853150 100644
--- a/recipes/gtkhtml/gtkhtml-lite-3.0_3.0.10.bb
+++ b/recipes/gtkhtml/gtkhtml-lite-3.0_3.0.10.bb
@@ -1,6 +1,6 @@
 require gtkhtml.inc
 
-DEPENDS = "gtk+ gail libgnomeprint orbit2-native"
+DEPENDS = "gtk+ virtual/gail libgnomeprint orbit2-native"
 PR = "r1"
 
 SRC_URI = "http://stag.mind.be/gtkhtml-lite-3.0.10.tar.bz2"
diff --git a/recipes/nonworking/sword/gnomesword_2.1.2.bb b/recipes/nonworking/sword/gnomesword_2.1.2.bb
index a4ec60d..061822e 100644
--- a/recipes/nonworking/sword/gnomesword_2.1.2.bb
+++ b/recipes/nonworking/sword/gnomesword_2.1.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "GUI frontend for sword"
 HOMEPAGE = "http://gnomesword.sf.net"
 LICENSE = "GPLv3"
-DEPENDS = "gail libgnomeui gtkhtml-3.6 gail sword"
+DEPENDS = "libgnomeui gtkhtml-3.6 virtual/gail sword"
 
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.gz"


-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



