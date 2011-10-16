Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RFaVB-0007wn-CW
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 01:52:21 +0200
Received: (qmail invoked by alias); 16 Oct 2011 23:46:33 -0000
Received: from p5B0A1665.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.22.101]
	by mail.gmx.net (mp053) with SMTP; 17 Oct 2011 01:46:33 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/MoNFCTHnMBMMIi45ZvdvPC5Gtjy6o8BT5ioKOQ2
	oNcXyW6SkEbp/R
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Oct 2011 01:51:07 +0200
Message-Id: <1318809068-16742-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-gnome 1/2] nautilus: fix compile errors by removing G_DISABLE_DEPRECATED
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
X-List-Received-Date: Sun, 16 Oct 2011 23:52:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build tested
* reported gnome-bugzills [1]
* error messages:
| In file included from eel-alert-dialog.c:24:0:
| eel-i18n.h:31:16: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'char'
| eel-alert-dialog.c: In function 'eel_alert_dialog_class_init':
| eel-alert-dialog.c:114:43: warning: passing argument 2 of 'g_param_spec_int' makes pointer from integer without a cast
| /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/glib-2.0/gobject/gparamspecs.h:993:13: note: expected 'const gchar *' but argument is of type 'int'
| eel-alert-dialog.c:114:43: warning: passing argument 3 of 'g_param_spec_int' makes pointer from integer without a cast
| /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/glib-2.0/gobject/gparamspecs.h:993:13: note: expected 'const gchar *' but argument is of type 'int'
| eel-alert-dialog.c:123:35: warning: passing argument 2 of 'g_param_spec_enum' makes pointer from integer without a cast
| /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/glib-2.0/gobject/gparamspecs.h:1040:13: note: expected 'const gchar *' but argument is of type 'int'
| eel-alert-dialog.c:123:35: warning: passing argument 3 of 'g_param_spec_enum' makes pointer from integer without a cast
| /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/glib-2.0/gobject/gparamspecs.h:1040:13: note: expected 'const gchar *' but argument is of type 'int'
| eel-alert-dialog.c:132:35: warning: passing argument 2 of 'g_param_spec_enum' makes pointer from integer without a cast
| /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/glib-2.0/gobject/gparamspecs.h:1040:13: note: expected 'const gchar *' but argument is of type 'int'
| eel-alert-dialog.c:132:35: warning: passing argument 3 of 'g_param_spec_enum' makes pointer from integer without a cast
| /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/glib-2.0/gobject/gparamspecs.h:1040:13: note: expected 'const gchar *' but argument is of type 'int'
| eel-alert-dialog.c: In function 'eel_alert_dialog_init':
| eel-alert-dialog.c:193:2: warning: passing argument 1 of 'gtk_expander_new_with_mnemonic' makes pointer from integer without a cast
| /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/gtk-2.0/gtk/gtkexpander.h:66:12: note: expected 'const gchar *' but argument is of type 'int'

and

| In file included from nautilus-file.h:31:0,
|                  from nautilus-bookmark.c:28:
| ../libnautilus-private/nautilus-icon-info.h:75:16: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'char'
| ../libnautilus-private/nautilus-icon-info.h:76:16: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'char'
| make[2]: *** [nautilus-bookmark.lo] Error 1

[1] https://bugzilla.gnome.org/show_bug.cgi?id=661949

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../nautilus/no-G_DISABLE_DEPRECATED.patch         |   44 ++++++++++++++++++++
 .../recipes-gnome/nautilus/nautilus_2.32.2.bb      |    3 +-
 2 files changed, 46 insertions(+), 1 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/no-G_DISABLE_DEPRECATED.patch

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus/no-G_DISABLE_DEPRECATED.patch b/meta-gnome/recipes-gnome/nautilus/nautilus/no-G_DISABLE_DEPRECATED.patch
new file mode 100644
index 0000000..43a6152
--- /dev/null
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus/no-G_DISABLE_DEPRECATED.patch
@@ -0,0 +1,44 @@
+From e7233d98c114b03c7c8b96d1f41770452da14aa7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
+Date: Mon, 17 Oct 2011 00:59:01 +0200
+Subject: [PATCH] nautilus build fails for newer glib versions
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+build with glib-2.0 v2.30.0 run into errors for at least G_CONST_RETURN missing
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
+---
+ configure.in    |    2 +-
+ eel/Makefile.am |    1 -
+ 2 files changed, 1 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 97e171e..859a097 100644
+--- a/configure.in
++++ b/configure.in
+@@ -342,7 +342,7 @@ AC_SUBST(CORE_CFLAGS)
+ CORE_LIBS="`$PKG_CONFIG --libs $CORE_MODULES` $x_libs"
+ AC_SUBST(CORE_LIBS)
+ 
+-DISABLE_DEPRECATED_CFLAGS="-DG_DISABLE_DEPRECATED -DGDK_PIXBUF_DISABLE_DEPRECATED"
++DISABLE_DEPRECATED_CFLAGS="-DGDK_PIXBUF_DISABLE_DEPRECATED"
+ AC_SUBST(DISABLE_DEPRECATED_CFLAGS)
+ 
+ dnl Multimedia keys
+diff --git a/eel/Makefile.am b/eel/Makefile.am
+index b1fe356..c1d56cd 100644
+--- a/eel/Makefile.am
++++ b/eel/Makefile.am
+@@ -10,7 +10,6 @@ INCLUDES =						\
+ 	-DDATADIR=\""$(datadir)"\"			\
+ 	-DSOURCE_DATADIR=\""$(top_srcdir)/data"\"	\
+ 	-DGNOMELOCALEDIR=\""$(prefix)/${DATADIRNAME}/locale"\"	\
+-	-DG_DISABLE_DEPRECATED				\
+ 	-DGDK_PIXBUF_DISABLE_DEPRECATED			\
+ 	-DGMENU_I_KNOW_THIS_IS_UNSTABLE			\
+ 	$(NULL)
+-- 
+1.7.4.4
+
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
index 334679c..f34cbbe 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
@@ -6,7 +6,7 @@ LICENSE="GPLv2 && LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0048536e43642a1f3a724c2909872b \
                     file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
-PR = "r4"
+PR = "r5"
 
 DEPENDS = "libunique gvfs librsvg libexif esound gnome-desktop orbit2-native"
 # optional: tracker
@@ -18,6 +18,7 @@ SRC_URI[archive.sha256sum] = "2d4ff28c7a7aa5d40eb2468149954a564c257a305183773057
 
 SRC_URI += "file://idl-sysroot.patch \
             file://no-try-run-strftime.diff \
+            file://no-G_DISABLE_DEPRECATED.patch \
 "
 
 
-- 
1.7.4.4



