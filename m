Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LT29n-0008VI-J5
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jan 2009 23:48:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 4B7361417186
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2009 23:40:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pa+wQ6oqeA0r
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2009 23:40:29 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id B577F1416BC5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2009 23:40:28 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jan 2009 23:40:26 +0100
Message-Id: <1233355226.6518.16.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: how to fix gail x gtk+ shared library conflict in repos?
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
X-List-Received-Date: Fri, 30 Jan 2009 22:48:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hallo.

Here is a partial attempt to fix gail x gtk+ conflict: [PATCH below]

gail provided libgailutil18 library up to GNOME 2.22.
Since GNOME 2.23 (gtk+-2.13) it is provided by gtk+.

As several distros still use old gtk+, we cannot simply drop gail.
That is why I created virtual/gail.

The patch fixes it on build level (gail is no more built), but it can
still fail during installation, especially if more feeds are subscribed.

Problems:

1)
Library libgailutil18 is packaged inside the gtk+ package, not following
shared library packaging conventions.

=> When old version of libgailutil18 package is present in _any_
subscribed feed, it is preferred over new version inside gtk+
=> file conflict.

I see no way to fix than splitting gtk+ package according to shared
library packaging conventions (or at least splitting off libgailutil18).

2)
Package libgailutil18 contains two additional modules, now packaged
separately: gtk-module-gail and gtk-module-ferret.

=> How to specify, that packages require:
EITHER (libgailutil18) OR (gtk+ AND gtk-module-gail AND gtk-module-ferret)

I see no other solution than guessing from PREFERRED_VERSION_gtk+.

3)
All packages linking to libgailutil18, directly or indirectly, may
require PR update to not break rolling update.

(On other hand, these packages are just now compilable, but not
installable.)

4)
I don't know, how to do RREPLACES/ROBSOLETES for locale packages.


diff --git a/conf/distro/include/preferred-om-2008-versions.inc b/conf/distro/include/preferred-om-2008-versions.inc
index 8bcb655..906ac4f 100644
--- a/conf/distro/include/preferred-om-2008-versions.inc
+++ b/conf/distro/include/preferred-om-2008-versions.inc
@@ -410,7 +410,6 @@ PREFERRED_VERSION_fuse-module ?= "2.6.5"
 PREFERRED_VERSION_fush ?= "0.9.0"
 PREFERRED_VERSION_fxload ?= "0.0.20020411"
 PREFERRED_VERSION_g15daemon ?= "1.2.6a"
-PREFERRED_VERSION_gail ?= "1.20.0"
 PREFERRED_VERSION_gaim ?= "1.5.0"
 PREFERRED_VERSION_gal-2.0 ?= "1.99.11"
 PREFERRED_VERSION_gal-2.1 ?= "2.1.10"
diff --git a/packages/eel/eel_2.24.1.bb b/packages/eel/eel_2.24.1.bb
index 0435379..afe9406 100644
--- a/packages/eel/eel_2.24.1.bb
+++ b/packages/eel/eel_2.24.1.bb
@@ -8,7 +8,7 @@ LICENSE="GPL"
 
 SRC_URI += "file://eel-no-strftime.patch;patch=1"
 
-DEPENDS = "gnome-vfs gnome-desktop gnome-menus libgnomeui gail"
+DEPENDS = "gnome-vfs gnome-desktop gnome-menus libgnomeui virtual/gail"
 EXTRA_OECONF = "--disable-gtk-doc"
 
 do_stage() {
diff --git a/packages/gnome/gail_1.20.0.bb b/packages/gnome/gail_1.20.0.bb
index 58168a0..13346f3 100644
--- a/packages/gnome/gail_1.20.0.bb
+++ b/packages/gnome/gail_1.20.0.bb
@@ -3,6 +3,7 @@ SECTION = "x11/libs"
 PR = "r0"
 DESCRIPTION = "GNOME Accessibility Implementation Library"
 DEPENDS = "gtk+"
+PROVIDES = "virtual/gail"
 
 inherit gnome
 
diff --git a/packages/gnome/libgnomecanvas_2.20.0.bb b/packages/gnome/libgnomecanvas_2.20.0.bb
index 8e13c95..9396ea4 100644
--- a/packages/gnome/libgnomecanvas_2.20.0.bb
+++ b/packages/gnome/libgnomecanvas_2.20.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "A powerful object-oriented display"
 
 inherit gnome
 
-DEPENDS = "libglade libart-lgpl gail"
+DEPENDS = "libglade libart-lgpl virtual/gail"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
diff --git a/packages/gtk+/gtk+_2.14.2.bb b/packages/gtk+/gtk+_2.14.2.bb
index b0002b8..e22b4e9 100644
--- a/packages/gtk+/gtk+_2.14.2.bb
+++ b/packages/gtk+/gtk+_2.14.2.bb
@@ -1,9 +1,24 @@
 require gtk+.inc
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS += "cairo jasper"
 
+# gail is part of gtk+ since gtk+-2.13.0 (targetting >=GNOME 2.23):
+PROVIDES = "virtual/gail"
+RPROVIDES_gtk-module-gail = "libgailutil18"
+RPROVIDES_gtk-module-ferret = "libgailutil18"
+RREPLACES_${PN} = "libgailutil18"
+RPROVIDES_${PN}-dev = "libgailutil-dev"
+RREPLACES_${PN}-dev = "libgailutil-dev"
+RPROVIDES_${PN}-doc = "libgailutil-doc"
+RREPLACES_${PN}-doc = "libgailutil-doc"
+RPROVIDES_${PN}-dbg = "libgailutil-dbg"
+RREPLACES_${PN}-dbg = "libgailutil-dbg"
+# FIXME: replace locales as well
+
+FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug"
+
 # disabled per default - this uses as little patches as possible
 DEFAULT_PREFERENCE = "-1" 
 
diff --git a/packages/gtkhtml/gtkhtml-3.8_3.12.3.bb b/packages/gtkhtml/gtkhtml-3.8_3.12.3.bb
index e8727bd..68d6fbb 100644
--- a/packages/gtkhtml/gtkhtml-3.8_3.12.3.bb
+++ b/packages/gtkhtml/gtkhtml-3.8_3.12.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "HTML rendering/editing library"
 SECTION = "x11/libs"
 PRIORITY = "optional"
 LICENSE = "GPL"
-DEPENDS = "gtk+ gail libbonoboui libgnomeprintui libgnomeui"
+DEPENDS = "gtk+ virtual/gail libbonoboui libgnomeprintui libgnomeui"
 
 SRC_URI = "${GNOME_MIRROR}/gtkhtml/3.12/gtkhtml-${PV}.tar.bz2 \
            file://60_glib-2.15-g-gnuc-function.patch;patch=1"
diff --git a/packages/gtkhtml/gtkhtml-3.8_3.18.0.bb b/packages/gtkhtml/gtkhtml-3.8_3.18.0.bb
index e678bc3..e47f0a4 100644
--- a/packages/gtkhtml/gtkhtml-3.8_3.18.0.bb
+++ b/packages/gtkhtml/gtkhtml-3.8_3.18.0.bb
@@ -1,6 +1,6 @@
 require gtkhtml.inc
 
-DEPENDS = "gtk+ gail libbonoboui libgnomeprintui libgnomeui"
+DEPENDS = "gtk+ virtual/gail libbonoboui libgnomeprintui libgnomeui"
 
 SRC_URI = "${GNOME_MIRROR}/gtkhtml/3.18/gtkhtml-${PV}.tar.bz2"
 FILES_${PN} += "${datadir}/gtkhtml-3.8"
diff --git a/packages/nonworking/sword/gnomesword_2.1.2.bb b/packages/nonworking/sword/gnomesword_2.1.2.bb
index a4ec60d..061822e 100644
--- a/packages/nonworking/sword/gnomesword_2.1.2.bb
+++ b/packages/nonworking/sword/gnomesword_2.1.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "GUI frontend for sword"
 HOMEPAGE = "http://gnomesword.sf.net"
 LICENSE = "GPLv3"
-DEPENDS = "gail libgnomeui gtkhtml-3.6 gail sword"
+DEPENDS = "libgnomeui gtkhtml-3.6 virtual/gail sword"
 
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.gz"



________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



