Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NqCZq-0003pj-Rd
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 22:39:33 +0100
Received: by fxm20 with SMTP id 20so1607394fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 13:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=NVGwf009vMR9t5qZDp+8WkzjZEn799hSYrDfjK5b7qk=;
	b=Wi0sdxnvUZ4/UKDVlAowCxqih3F1H8lOx6tzw4w0a6C+4TBRv22IB6VekFfifEdWxy
	Xf0vSjkAXr0xbkkLqJYqH9M4aZorJE8Cl6lI7ZJTAMrVm8hsnoMo/prEdTC+g7JfUELM
	d/uHRADvs9G2c+nWXWrFsKgT/oGcau/KRaWD8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=kVMria0ZnsKxQ0XqOnBYIfrsTXoGojd9SwaqGyOUUtHrvk4b1FmsSheZpYfC5DhK+A
	WsknwlEU+NoxV8v3Q8v1cuxuKE0iOEgrRCP8Z97KRFTlCbV49Exg5nieKjVo4wr6X4Ns
	iho9Go7WvVHh5kEhaUjWEFIgJHtKkzU5n4NTU=
Received: by 10.103.3.7 with SMTP id f7mr2038408mui.62.1268429787377;
	Fri, 12 Mar 2010 13:36:27 -0800 (PST)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id y2sm7038518mug.51.2010.03.12.13.36.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 12 Mar 2010 13:36:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Mar 2010 13:36:16 -0800
Message-Id: <1268429776-32114-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gtk+-native: Override RRECOMMENDS for native recipe
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
X-List-Received-Date: Fri, 12 Mar 2010 21:39:33 -0000

* Remove old style native recipes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gtk+/gtk+-native-1.2_1.2.10.bb |   58 --------------------------------
 recipes/gtk+/gtk+-native_2.12.11.bb    |   20 -----------
 recipes/gtk+/gtk+_2.18.6.bb            |    3 +-
 3 files changed, 2 insertions(+), 79 deletions(-)
 delete mode 100644 recipes/gtk+/gtk+-native-1.2_1.2.10.bb
 delete mode 100644 recipes/gtk+/gtk+-native_2.12.11.bb

diff --git a/recipes/gtk+/gtk+-native-1.2_1.2.10.bb b/recipes/gtk+/gtk+-native-1.2_1.2.10.bb
deleted file mode 100644
index f5ad1a5..0000000
--- a/recipes/gtk+/gtk+-native-1.2_1.2.10.bb
+++ /dev/null
@@ -1,58 +0,0 @@
-DESCRIPTION = "GTK+1.2 is a deprecated library provided for running programs not yet converted to GTK+2.0"
-HOMEPAGE = "http://www.gtk.org"
-SECTION = "libs"
-LICENSE = "LGPL"
-PRIORITY = "optional"
-DEPENDS = "glib-1.2 jpeg libpng libxext"
-
-PR = "r1"
-
-FILESPATH =+ "${FILE_DIRNAME}/gtk+-1.2-1.2.10:"
-SRC_URI = "ftp://ftp.gtk.org/pub/gtk/v1.2/gtk+-${PV}.tar.gz \
-           file://gtk+1.2-reconf-fix;patch=1 \
-           file://no-xwc;patch=1"
-S = "${WORKDIR}/gtk+-${PV}"
-
-inherit autotools pkgconfig flow-lossage
-
-do_configure_prepend() {
-	install -d m4
-	rm -f ltconfig libtool ltmain.sh
-	libtoolize --force
-}
-
-FILES_${PN} += "${datadir}/themes"
-FILES_${PN}-dev += "${datadir}/gtk-1.2/include ${libdir}/gtk-1.2/include"
-
-
-EXTRA_OECONF = "--enable-debug=no --disable-glibtest --disable-xim"
-# --disable-cruft
-
-LIBV = "1.2.10"
-
-gtk_include = "fnmatch.h gtk.h gtkaccelgroup.h gtkaccellabel.h gtkadjustment.h gtkalignment.h gtkarg.h gtkarrow.h gtkaspectframe.h gtkbbox.h gtkbin.h gtkbindings.h gtkbox.h gtkbutton.h gtkcalendar.h gtkcheckbutton.h gtkcheckmenuitem.h gtkclist.h gtkcolorsel.h gtkcombo.h gtkcompat.h gtkcontainer.h gtkctree.h gtkcurve.h gtkdata.h gtkdebug.h gtkdialog.h gtkdnd.h gtkdrawingarea.h gtkeditable.h gtkentry.h gtkenums.h gtkeventbox.h gtkfeatures.h gtkfilesel.h gtkfixed.h gtkfontsel.h gtkframe.h gtkgamma.h gtkgc.h gtkhandlebox.h gtkhbbox.h gtkhbox.h gtkhpaned.h gtkhruler.h gtkhscale.h gtkhscrollbar.h gtkhseparator.h gtkimage.h gtkinputdialog.h gtkintl.h gtkinvisible.h gtkitem.h gtkitemfactory.h gtklabel.h gtklayout.h gtklist.h gtklistitem.h gtkmain.h gtkmarshal.h gtkmenu.h gtkmenubar.h gtkmenufactory.h gtkmenuitem.h gtkmenushell.h gtkmisc.h gtknotebook.h gtkobject.h gtkoptionmenu.h gtkpacker.h gtkpaned.h gtkpixmap.h gtkplug.h gtkpreview.h gtkprivate.h gtkprogress.h gtkprogressbar.h gtkradiobutton.h gtkradiomenuitem.h gtkrange.h gtkrc.h gtkruler.h gtkscale.h gtkscrollbar.h gtkscrolledwindow.h gtkselection.h gtkseparator.h gtksignal.h gtksocket.h gtkspinbutton.h gtkstatusbar.h gtkstyle.h gtktable.h gtktearoffmenuitem.h gtktext.h gtkthemes.h gtktipsquery.h gtktogglebutton.h gtktoolbar.h gtktooltips.h gtktree.h gtktreeitem.h gtktypebuiltins.h gtktypeutils.h gtkvbbox.h gtkvbox.h gtkviewport.h gtkvpaned.h gtkvruler.h gtkvscale.h gtkvscrollbar.h gtkvseparator.h gtkwidget.h gtkwindow.h makeenums.h stamp-gtkmarshal.h stamp-gtktypebuiltins.h"
-gdk_include = "MwmUtil.h gdk.h gdkcursors.h gdki18n.h gdkinput.h gdkinputcommon.h gdkinputgxi.h gdkinputnone.h gdkinputxfree.h gdkkeysyms.h gdkprivate.h gdkrgb.h gdktypes.h gdkx.h gxid_lib.h gxid_proto.h"
-
-do_stage () {
-	oe_libinstall -so -C gtk libgtk-1.2 ${STAGING_LIBDIR}
-	oe_libinstall -so -C gdk libgdk-1.2 ${STAGING_LIBDIR}
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
-}
-
-do_install_append () {
-	install -d ${D}${sysconfdir}/gtk-1.2
-}
-
diff --git a/recipes/gtk+/gtk+-native_2.12.11.bb b/recipes/gtk+/gtk+-native_2.12.11.bb
deleted file mode 100644
index a53dcde..0000000
--- a/recipes/gtk+/gtk+-native_2.12.11.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-
-require gtk+_2.12.11.bb
-
-inherit native
-
-DEPENDS += "atk-native pango-native cairo-native libx11-native libxext-native libxrender-native"
-PROVIDES = "gtk+-native"
-
-EXTRA_OECONF += "--without-libtiff --disable-modules --disable-cups"
-
-PR = "r3"
-
-do_install_append() {
-
-    # this tool is required by gnome-keyring 2.26.0 to get built
-    # it is written in Python and use only Python xml
-    install -d ${STAGING_BINDIR_NATIVE}
-    install -m 0755 ${S}/gtk/gtk-builder-convert ${STAGING_BINDIR_NATIVE}
-}
-
diff --git a/recipes/gtk+/gtk+_2.18.6.bb b/recipes/gtk+/gtk+_2.18.6.bb
index 1c2ca79..69f8ff5 100644
--- a/recipes/gtk+/gtk+_2.18.6.bb
+++ b/recipes/gtk+/gtk+_2.18.6.bb
@@ -3,11 +3,12 @@ require gtk+.inc
 SRC_URI_append_virtclass-native = " file://no-demos.patch;patch=1 \
 "
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 BBCLASSEXTEND = "native"
 
 DEPENDS_virtclass-native = "libpng-native atk-native pango-native cairo-native libxrender-native libxext-native"
+RRECOMMENDS_${PN}_virtclass-native = ""
 PROVIDES_virtclass-native = "gdk-pixbuf-csource-native"
 
 # Enable xkb selectively
-- 
1.7.0



