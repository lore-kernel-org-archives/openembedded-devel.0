Received: from mail-la0-f48.google.com ([209.85.215.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrgWP-0005rS-JG
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 04:03:42 +0100
Received: by mail-la0-f48.google.com with SMTP id ej20so12449197lab.35
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jan 2013 18:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=emaTlZwAidIT2ELgVqmWXF86zWs/ll0f/HDc45RnxCs=;
	b=pBd72ASeDQc528sQpYF42U6VLIDjipG+fY0zqccm8XgqF2dS+lZYmmL1Gq9UzY8pbF
	cqKudlydVvoB/jebnQtpG9Tm01CHl+JaLS8wtxfDd7znEbDpfYPYLrvSS2aESXHE9Ov8
	S5vn/FMrP/IGU1lultLvsdR4NkeKA9S9iWzImrS2+ILHZmmOYhxHLDNPmN3GiiBgifiL
	PhU1fKQL7zTpTNbHpzaclo7oVxmHGoeiFYIBpEDZC31xe7Zicf8opEnoh1SR5vmk08yX
	Zjt9ni8VdgFPxY/yKYa2g/doOaL3BMZHhYf9yVue9TaS+Kg8aeMUUsrXKann7sgyyvRR
	TgvQ==
X-Received: by 10.112.17.170 with SMTP id p10mr23352869lbd.53.1357440510338;
	Sat, 05 Jan 2013 18:48:30 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id
	lr20sm21018224lab.17.2013.01.05.18.48.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 05 Jan 2013 18:48:29 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TrgHi-0003PL-SN; Sun, 06 Jan 2013 04:48:26 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 04:48:24 +0200
Message-Id: <1357440504-13057-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357440504-13057-1-git-send-email-cazfi74@gmail.com>
References: <1357440504-13057-1-git-send-email-cazfi74@gmail.com>
Subject: [meta-gnome][PATCH] gtk+3: update to upstream version 3.4.4
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
X-List-Received-Date: Sun, 06 Jan 2013 03:03:43 -0000

* fix.build.automake-1.12.x.patch dropped as upstream has fixed
  the problem addressed.
* COPYING has had formatting changes
* In license segments of source files FSF street address is replaced
  with URL.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../gtk+/gtk+3/fix.build.automake-1.12.x.patch     |   27 --------------------
 .../gtk+/{gtk+3_3.2.3.bb => gtk+3_3.4.4.bb}        |   25 ++++++++++--------
 2 files changed, 15 insertions(+), 37 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gtk+/gtk+3/fix.build.automake-1.12.x.patch
 rename meta-gnome/recipes-gnome/gtk+/{gtk+3_3.2.3.bb => gtk+3_3.4.4.bb} (79%)

diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3/fix.build.automake-1.12.x.patch b/meta-gnome/recipes-gnome/gtk+/gtk+3/fix.build.automake-1.12.x.patch
deleted file mode 100644
index 3cbf7dd..0000000
--- a/meta-gnome/recipes-gnome/gtk+/gtk+3/fix.build.automake-1.12.x.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-diff -uNr gtk+-3.2.3.orig/gtk/Makefile.am gtk+-3.2.3/gtk/Makefile.am
---- gtk+-3.2.3.orig/gtk/Makefile.am	2011-12-19 14:58:28.000000000 +0100
-+++ gtk+-3.2.3/gtk/Makefile.am	2012-07-18 02:01:59.042628402 +0200
-@@ -942,7 +942,7 @@
- 
- if USE_QUARTZ
- install-mac-key-theme:
--	$(mkdir_p) $(DESTDIR)$(datadir)/themes/Mac/gtk-3.0
-+	$(MKDIR_P) $(DESTDIR)$(datadir)/themes/Mac/gtk-3.0
- 	$(INSTALL_DATA) $(srcdir)/gtk-keys.css.mac $(DESTDIR)$(datadir)/themes/Mac/gtk-3.0/gtk-keys.css
- uninstall-mac-key-theme:
- 	rm -f $(DESTDIR)$(datadir)/themes/Mac/gtk-3.0/gtk-keys.css
-@@ -985,11 +985,11 @@
- 
- # Install a RC file for the default GTK+ theme, and key themes
- install-data-local: install-ms-lib install-def-file install-mac-key-theme
--	$(mkdir_p) $(DESTDIR)$(datadir)/themes/Raleigh/gtk-3.0
-+	$(MKDIR_P) $(DESTDIR)$(datadir)/themes/Raleigh/gtk-3.0
- 	$(INSTALL_DATA) $(srcdir)/gtk.css.raleigh $(DESTDIR)$(datadir)/themes/Raleigh/gtk-3.0/gtk.css
--	$(mkdir_p) $(DESTDIR)$(datadir)/themes/Default/gtk-3.0
-+	$(MKDIR_P) $(DESTDIR)$(datadir)/themes/Default/gtk-3.0
- 	$(INSTALL_DATA) $(srcdir)/gtk-keys.css.default $(DESTDIR)$(datadir)/themes/Default/gtk-3.0/gtk-keys.css
--	$(mkdir_p) $(DESTDIR)$(datadir)/themes/Emacs/gtk-3.0
-+	$(MKDIR_P) $(DESTDIR)$(datadir)/themes/Emacs/gtk-3.0
- 	$(INSTALL_DATA) $(srcdir)/gtk-keys.css.emacs $(DESTDIR)$(datadir)/themes/Emacs/gtk-3.0/gtk-keys.css
- 
- uninstall-local: uninstall-ms-lib uninstall-def-file uninstall-mac-key-theme
diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.4.4.bb
similarity index 79%
rename from meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
rename to meta-gnome/recipes-gnome/gtk+/gtk+3_3.4.4.bb
index 55397cc..ce09615 100644
--- a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
+++ b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.4.4.bb
@@ -11,18 +11,18 @@ DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
 
 LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://gtk/gtk.h;endline=27;md5=c59e0b4490dd135a5726ebf851f9b17f \
-                    file://gdk/gdk.h;endline=27;md5=07db285ec208fb3e0bf7d861b0614202 \
-                    file://tests/testgtk.c;endline=27;md5=ac85be7b810a1e9b00479af8e2018053"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
+                    file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
+                    file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
+                    file://tests/testgtk.c;endline=25;md5=cb732daee1d82af7a2bf953cf3cf26f1"
 
-SRC_URI = "http://download.gnome.org/sources/gtk+/3.2/gtk+-${PV}.tar.xz \
-  file://fix.build.automake-1.12.x.patch \
+SRC_URI = "http://download.gnome.org/sources/gtk+/3.4/gtk+-${PV}.tar.xz \
 "
-SRC_URI[md5sum] = "b4edcc69e39159dd7be17828249afb46"
-SRC_URI[sha256sum] = "e2cf20f2510ebbc7be122a1a33dd1f472a7d06aaf16b4f2a63eb048cd9141d3d"
 
-PR = "r2"
+SRC_URI[md5sum] = "1b2cf29502a6394e8d4b30f7f5bb9131"
+SRC_URI[sha256sum] = "f154e460075034da4c0ce89c320025dcd459da2a1fdf32d92a09522eaca242c7"
+
+PR = "r0"
 
 inherit autotools pkgconfig
 
@@ -45,12 +45,17 @@ do_configure_prepend() {
 PACKAGES =+ "${PN}-demo"
 LIBV = "3.0.0"
 
-FILES_${PN}-demo = "${bindir}/gtk3-demo ${datadir}/gtk-3.0/demo"
+FILES_${PN}-demo = "${bindir}/gtk3-demo \
+                    ${datadir}/gtk-3.0/demo \
+                    ${bindir}/gtk3-demo-application \
+                    ${bindir}/gtk3-widget-factory \
+"
 
 FILES_${PN} = "${bindir}/gtk-update-icon-cache \
                ${bindir}/gtk-query-immodules-3.0 \
                ${libdir}/lib*${SOLIBS} \
                ${datadir}/themes ${sysconfdir} ${datadir}/glib-2.0/schemas/ \
+               ${datadir}/gtk-3.0/gtkbuilder.rng \
                ${libdir}/gtk-3.0/${LIBV}/engines/libpixmap.so \
                ${libdir}/gtk-3.0/modules/*.so"
 
-- 
1.7.10.4



