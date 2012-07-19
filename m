Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srl6u-0005qy-Ep
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 09:25:20 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1927955wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 00:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=v1N8c9JXIZFj5bExsD5N8faOQ1hvcRA8ZwpTjduX0i8=;
	b=m2fk88i/+NoW7ofWyshYioB27Vs5+NjrKp8vKTQd02SoYiilD3ZjG/PldpFWNFH7eP
	xb5XCt/52qJVDuwGtA/FQQ9DdmpuZ0QYYso738kWLVFPqxoW2BOsAaoSTdre6LYGykKO
	+7jsERhRNx6u6gLi5QKeQWMIS9byOXXndrybzDWgnemKGP8X1TFFVRBsEMZll5S87WTB
	ZxVPm3OzCZ8C65LH0FyIGgpruPc7q9OnLa1ca1XuAO/5bIrLPLYTc1j6mnpBvXwgAR34
	fosZGbTMXcT3xh0wgdDkXQ0U0S9SvBRhfcgjaoYpDNy7qEdwMPDmDeTrYhpngNJ46aSO
	BZ+g==
Received: by 10.180.106.97 with SMTP id gt1mr13424808wib.5.1342682041046;
	Thu, 19 Jul 2012 00:14:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex20sm3927856wid.7.2012.07.19.00.13.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 00:14:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 09:13:47 +0200
Message-Id: <753a07002d7b5144bd4df62bde0e129b3abacb91.1342681929.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342681929.git.Martin.Jansa@gmail.com>
References: <cover.1342681929.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342681929.git.Martin.Jansa@gmail.com>
References: <cover.1342681929.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-gnome][PATCH 3/4] gtk+3: fix build with automake-1.12.x
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
X-List-Received-Date: Thu, 19 Jul 2012 07:25:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gtk+/gtk+3/fix.build.automake-1.12.x.patch     |   27 ++++++++++++++++++++
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb       |    6 +++-
 2 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gtk+/gtk+3/fix.build.automake-1.12.x.patch

diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3/fix.build.automake-1.12.x.patch b/meta-gnome/recipes-gnome/gtk+/gtk+3/fix.build.automake-1.12.x.patch
new file mode 100644
index 0000000..3cbf7dd
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gtk+/gtk+3/fix.build.automake-1.12.x.patch
@@ -0,0 +1,27 @@
+diff -uNr gtk+-3.2.3.orig/gtk/Makefile.am gtk+-3.2.3/gtk/Makefile.am
+--- gtk+-3.2.3.orig/gtk/Makefile.am	2011-12-19 14:58:28.000000000 +0100
++++ gtk+-3.2.3/gtk/Makefile.am	2012-07-18 02:01:59.042628402 +0200
+@@ -942,7 +942,7 @@
+ 
+ if USE_QUARTZ
+ install-mac-key-theme:
+-	$(mkdir_p) $(DESTDIR)$(datadir)/themes/Mac/gtk-3.0
++	$(MKDIR_P) $(DESTDIR)$(datadir)/themes/Mac/gtk-3.0
+ 	$(INSTALL_DATA) $(srcdir)/gtk-keys.css.mac $(DESTDIR)$(datadir)/themes/Mac/gtk-3.0/gtk-keys.css
+ uninstall-mac-key-theme:
+ 	rm -f $(DESTDIR)$(datadir)/themes/Mac/gtk-3.0/gtk-keys.css
+@@ -985,11 +985,11 @@
+ 
+ # Install a RC file for the default GTK+ theme, and key themes
+ install-data-local: install-ms-lib install-def-file install-mac-key-theme
+-	$(mkdir_p) $(DESTDIR)$(datadir)/themes/Raleigh/gtk-3.0
++	$(MKDIR_P) $(DESTDIR)$(datadir)/themes/Raleigh/gtk-3.0
+ 	$(INSTALL_DATA) $(srcdir)/gtk.css.raleigh $(DESTDIR)$(datadir)/themes/Raleigh/gtk-3.0/gtk.css
+-	$(mkdir_p) $(DESTDIR)$(datadir)/themes/Default/gtk-3.0
++	$(MKDIR_P) $(DESTDIR)$(datadir)/themes/Default/gtk-3.0
+ 	$(INSTALL_DATA) $(srcdir)/gtk-keys.css.default $(DESTDIR)$(datadir)/themes/Default/gtk-3.0/gtk-keys.css
+-	$(mkdir_p) $(DESTDIR)$(datadir)/themes/Emacs/gtk-3.0
++	$(MKDIR_P) $(DESTDIR)$(datadir)/themes/Emacs/gtk-3.0
+ 	$(INSTALL_DATA) $(srcdir)/gtk-keys.css.emacs $(DESTDIR)$(datadir)/themes/Emacs/gtk-3.0/gtk-keys.css
+ 
+ uninstall-local: uninstall-ms-lib uninstall-def-file uninstall-mac-key-theme
diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
index 2dc4c64..8553eb8 100644
--- a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
+++ b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
@@ -16,10 +16,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://gdk/gdk.h;endline=27;md5=07db285ec208fb3e0bf7d861b0614202 \
                     file://tests/testgtk.c;endline=27;md5=ac85be7b810a1e9b00479af8e2018053"
 
-SRC_URI = "http://download.gnome.org/sources/gtk+/3.2/gtk+-${PV}.tar.xz"
+SRC_URI = "http://download.gnome.org/sources/gtk+/3.2/gtk+-${PV}.tar.xz \
+  file://fix.build.automake-1.12.x.patch \
+"
 SRC_URI[md5sum] = "b4edcc69e39159dd7be17828249afb46"
 SRC_URI[sha256sum] = "e2cf20f2510ebbc7be122a1a33dd1f472a7d06aaf16b4f2a63eb048cd9141d3d"
 
+PR = "r1"
+
 inherit autotools pkgconfig
 
 S = "${WORKDIR}/gtk+-${PV}"
-- 
1.7.8.6



