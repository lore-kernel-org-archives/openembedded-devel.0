Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PKJpc-0005lQ-FO
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 01:00:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 84108314AEA1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 00:59:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id fA3a8B9Mo07Z
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 00:59:13 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id EEDF5314AE9D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 00:59:11 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Sun, 21 Nov 2010 23:59:11 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Nov 2010 23:59:09 +0000
Message-Id: <1290383951-6683-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] gtk+-1.2: convert to new style staging (fixes xmms build)
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
X-List-Received-Date: Mon, 22 Nov 2010 00:00:30 -0000

* gtk+-1.2 didn't install its pkg-config file, but gtk-config
  depended on it and went crazy without it. xmms uses gtk-config.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Tested-by: Yury Bushmelev <jay4mail@gmail.com>
---
 recipes/gtk+/gtk+-1.2_1.2.10.bb |   30 ++----------------------------
 1 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/recipes/gtk+/gtk+-1.2_1.2.10.bb b/recipes/gtk+/gtk+-1.2_1.2.10.bb
index 2e5f86d..a503eab 100644
--- a/recipes/gtk+/gtk+-1.2_1.2.10.bb
+++ b/recipes/gtk+/gtk+-1.2_1.2.10.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.gtk.org"
 SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS = "glib-1.2 jpeg libpng libxext"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.gtk.org/pub/gtk/v1.2/gtk+-${PV}.tar.gz \
            file://timezone-fix.patch \
@@ -15,7 +15,7 @@ SRC_URI_append_jlime = " file://small-filesel.patch "
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-inherit autotools pkgconfig flow-lossage
+inherit autotools pkgconfig flow-lossage binconfig
 
 do_configure_prepend() {
 	install -d m4
@@ -28,32 +28,6 @@ FILES_${PN}-dev += "${datadir}/gtk-1.2/include ${libdir}/gtk-1.2/include"
 
 
 EXTRA_OECONF = "--enable-debug=no --disable-glibtest --disable-xim"
-# --disable-cruft
-
-LIBV = "1.2.10"
-
-gtk_include = "fnmatch.h gtk.h gtkaccelgroup.h gtkaccellabel.h gtkadjustment.h gtkalignment.h gtkarg.h gtkarrow.h gtkaspectframe.h gtkbbox.h gtkbin.h gtkbindings.h gtkbox.h gtkbutton.h gtkcalendar.h gtkcheckbutton.h gtkcheckmenuitem.h gtkclist.h gtkcolorsel.h gtkcombo.h gtkcompat.h gtkcontainer.h gtkctree.h gtkcurve.h gtkdata.h gtkdebug.h gtkdialog.h gtkdnd.h gtkdrawingarea.h gtkeditable.h gtkentry.h gtkenums.h gtkeventbox.h gtkfeatures.h gtkfilesel.h gtkfixed.h gtkfontsel.h gtkframe.h gtkgamma.h gtkgc.h gtkhandlebox.h gtkhbbox.h gtkhbox.h gtkhpaned.h gtkhruler.h gtkhscale.h gtkhscrollbar.h gtkhseparator.h gtkimage.h gtkinputdialog.h gtkintl.h gtkinvisible.h gtkitem.h gtkitemfactory.h gtklabel.h gtklayout.h gtklist.h gtklistitem.h gtkmain.h gtkmarshal.h gtkmenu.h gtkmenubar.h gtkmenufactory.h gtkmenuitem.h gtkmenushell.h gtkmisc.h gtknotebook.h gtkobject.h gtkoptionmenu.h gtkpacker.h gtkpaned.h gtkpixmap.h gtkplug.h gtkpreview.h gtkprivate.h gtkprogress.h gtkprogressbar.h gt
 kradiobutton.h gtkradiomenuitem.h gtkrange.h gtkrc.h gtkruler.h gtkscale.h gtkscrollbar.h gtkscrolledwindow.h gtkselection.h gtkseparator.h gtksignal.h gtksocket.h gtkspinbutton.h gtkstatusbar.h gtkstyle.h gtktable.h gtktearoffmenuitem.h gtktext.h gtkthemes.h gtktipsquery.h gtktogglebutton.h gtktoolbar.h gtktooltips.h gtktree.h gtktreeitem.h gtktypebuiltins.h gtktypeutils.h gtkvbbox.h gtkvbox.h gtkviewport.h gtkvpaned.h gtkvruler.h gtkvscale.h gtkvscrollbar.h gtkvseparator.h gtkwidget.h gtkwindow.h makeenums.h stamp-gtkmarshal.h stamp-gtktypebuiltins.h"
-gdk_include = "MwmUtil.h gdk.h gdkcursors.h gdki18n.h gdkinput.h gdkinputcommon.h gdkinputgxi.h gdkinputnone.h gdkinputxfree.h gdkkeysyms.h gdkprivate.h gdkrgb.h gdktypes.h gdkx.h gxid_lib.h gxid_proto.h"
-
-do_stage () {
-	oe_libinstall -so -C gtk libgtk ${STAGING_LIBDIR}
-	oe_libinstall -so -C gdk libgdk ${STAGING_LIBDIR}
-
-	mkdir -p ${STAGING_INCDIR}/gtk-1.2/gtk
-	for i in ${gtk_include}; do
-		install -m 0644 gtk/$i ${STAGING_INCDIR}/gtk-1.2/gtk/$i
-	done
-
-	mkdir -p ${STAGING_INCDIR}/gtk-1.2/gdk
-	for i in ${gdk_include}; do
-		install -m 0644 gdk/$i ${STAGING_INCDIR}/gtk-1.2/gdk/$i
-	done
-
-	mkdir -p ${STAGING_LIBDIR}/gtk-1.2/include
-
-	install -m 0644 gtk.m4 ${STAGING_DATADIR}/aclocal/
-	install -m 0755 gtk-config ${STAGING_BINDIR_CROSS}/
-}
 
 do_install_append () {
 	install -d ${D}${sysconfdir}/gtk-1.2
-- 
1.7.1



