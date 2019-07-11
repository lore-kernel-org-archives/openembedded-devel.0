Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5611F7E790
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 10:04:25 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g67so970920wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 03:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=U0gzurt3PuGTyUXhaL6vGGNn1yhlpXNqqjZLlgt6pp0=;
	b=VmR+DpJA28vR/h4SodLEuwz50LrjzSmSPNpGh+TDdqv5L3XYXI+pTVfZPnMePhtAw/
	6bqS3/yPD1nvplIXH6P4AIW0885MoW+CvG8ideLS4Zj1U5UAZS3F5vZkbXhCJGoSgUqm
	4Iax3VvZ/bwGWEGJxlcy59vST6knkO550kvj+jGUdxwR5VV2HvAAVNLkY03QVTxgQZu5
	/ZjdGS7xbDeHQhLzrPxfkY/o7b0a8NJZm2Qvc8K/JgCeIaNVRCDQL5eNqbdXQD1/OIlx
	hpbV4hx2yY5NRIxtCJYeCn9LF8IQThYgzR9coR79/DAC8KqS8ButaM7jjqGdCARIZU6/
	8PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=U0gzurt3PuGTyUXhaL6vGGNn1yhlpXNqqjZLlgt6pp0=;
	b=K0Er4/388j6h7cbARfWRJOfc0lCCvDOoak3hC8G1B2pRxdRwbeh8vjtju8CtGEesV3
	Q96/+upcaasGigTO9u23zLGSJDy5LhfMp2+S1DkhqCw/DK+LbrB8cocZVDvyDtq4gsWY
	oHcSpRm09m2ZgUIFsRQz3cKU2dP2s12o18aUc3+yrrlSugAp/MuxjhcghIKHGJgzuM0K
	RsLB1Yslpvg4XvTYLGsT63hxNS5xe+MdVaAZ01ip1/kOpFJXu/G+XmcgvmCbrxJnOaXS
	nH7WB8EwoqIovQJngPwx2AZMTeGCDF+1yYVCLdDsHOv5oLDkERRoHzkZ9YcDhTH7/lUb
	zcIg==
X-Gm-Message-State: APjAAAU5LHw8lZS3UhBemu9nX56wXkgUz2NjE7XvlVIbbELXEm2y3wWo
	ZfDi3qr+oxObGRuLYxcW5LpjRfVl3l0=
X-Google-Smtp-Source: APXvYqwpbO7uYQbr+c1ZcWXQMdcRqG1qkZoCMh5gTz3oqDfKpbxTDTaIQbNfeSVTcVUFNjY4aKV7Bw==
X-Received: by 2002:a1c:63c4:: with SMTP id x187mr3251574wmb.4.1562839465026; 
	Thu, 11 Jul 2019 03:04:25 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y12sm3113563wrm.79.2019.07.11.03.04.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 11 Jul 2019 03:04:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Jul 2019 11:04:20 +0100
Message-Id: <20190711100421.777-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] gtk+: add (from oe-core)
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
X-List-Received-Date: Thu, 11 Jul 2019 10:04:25 -0000
Content-Transfer-Encoding: 8bit

This is GTK+ 2, which is obsolete.  It has just been removed from oe-core, so
add it into meta-oe for any remaining users.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-gnome/gtk+/gtk+.inc           | 107 ++++++++++++++++++
 ...to-HOME-when-looking-for-gtk-modules.patch |  29 +++++
 .../recipes-gnome/gtk+/gtk+/doc-fixes.patch   |  22 ++++
 .../gtk+/gtk+/hardcoded_libtool.patch         |  36 ++++++
 .../gtk+/gtk+/strict-prototypes.patch         |  24 ++++
 .../recipes-gnome/gtk+/gtk+/toggle-font.diff  | 102 +++++++++++++++++
 .../recipes-gnome/gtk+/gtk+/xsettings.patch   |  20 ++++
 meta-oe/recipes-gnome/gtk+/gtk+_2.24.32.bb    |  35 ++++++
 8 files changed, 375 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtk+.inc
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtk+/doc-fixes.patch
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtk+/strict-prototypes.patch
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtk+/toggle-font.diff
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtk+/xsettings.patch
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtk+_2.24.32.bb

diff --git a/meta-oe/recipes-gnome/gtk+/gtk+.inc b/meta-oe/recipes-gnome/gtk+/gtk+.inc
new file mode 100644
index 0000000000..d6d14a79d5
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtk+.inc
@@ -0,0 +1,107 @@
+SUMMARY = "Multi-platform toolkit for creating GUIs"
+DESCRIPTION = "GTK+ is a multi-platform toolkit for creating graphical user interfaces. Offering a complete \
+set of widgets, GTK+ is suitable for projects ranging from small one-off projects to complete application suites."
+HOMEPAGE = "http://www.gtk.org"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+
+SECTION = "libs"
+
+inherit distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+
+# This picks stable releases in the 2.x series (but not 2.90 onwards,
+# which were GNOME 3 betas).
+UPSTREAM_CHECK_REGEX = "(?P<pver>2\.([0-8]*[02468])+(\.\d+)+)"
+
+X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
+DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native \
+ cairo gdk-pixbuf"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb x11', d)}"
+
+PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
+# without --with-gdktarget=directfb it will check for cairo-xlib which isn't available without X11 DISTRO_FEATURE
+PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"
+PACKAGECONFIG[manpages] = "--enable-man --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog, --disable-man, libxslt-native xmlto-native"
+
+inherit autotools gtk-doc pkgconfig update-alternatives gtk-immodules-cache gobject-introspection manpages
+
+PACKAGES += "libgail gtk-demo"
+
+FILES_${PN} += "${bindir}/gtk-update-icon-cache-2.0 \
+	${bindir}/gtk-query-immodules-2.0 \
+	${datadir}/themes ${sysconfdir} \
+	${libdir}/gtk-2.0/${LIBV}/engines/libpixmap.so"
+
+FILES_${PN}-dev += " \
+        ${datadir}/gtk-2.0/include \
+	${libdir}/gtk-2.0/include \
+	${libdir}/gtk-2.0/modules/*.la \
+	${libdir}/gtk-2.0/${LIBV}/loaders/*.la \
+	${libdir}/gtk-2.0/${LIBV}/immodules/*.la \
+	${libdir}/gtk-2.0/${LIBV}/printbackends/*.la \
+	${libdir}/gtk-2.0/${LIBV}/engines/*.la \
+	${bindir}/gtk-builder-convert"
+
+FILES_gtk-demo = " \
+ ${datadir}/gtk-2.0/demo/* \
+ ${bindir}/gtk-demo \
+ "
+
+FILES_libgail = " \
+	${libdir}/gtk-2.0/modules/libgail.so \
+	${libdir}/gtk-2.0/modules/libferret.so \
+	"
+
+GTKBASE_RRECOMMENDS ?= "liberation-fonts \
+                        gdk-pixbuf-loader-png \
+                        gdk-pixbuf-loader-jpeg \
+                        gdk-pixbuf-loader-gif \
+                        gdk-pixbuf-loader-xpm \
+                        shared-mime-info \
+                        gnome-theme-adwaita \
+                        "
+GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
+
+RRECOMMENDS_${PN} = "${GTKBASE_RRECOMMENDS}"
+RRECOMMENDS_${PN}_libc-glibc = "${GTKGLIBC_RRECOMMENDS}"
+
+ALTERNATIVE_${PN} = "gtk-update-icon-cache"
+ALTERNATIVE_TARGET[gtk-update-icon-cache] = "${bindir}/gtk-update-icon-cache-2.0"
+
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/gdk/.libs"
+}
+
+do_install () {
+	autotools_do_install
+
+	install -d ${D}${sysconfdir}/gtk-2.0
+
+	mkdir -p ${D}${libdir}/gtk-2.0/include
+	install -m 0644 gdk/gdkconfig.h ${D}${libdir}/gtk-2.0/include/gdkconfig.h
+
+	install -m 0644 ${S}/gtk/gtkfilechooserprivate.h ${D}${includedir}/gtk-2.0/gtk/
+	install -m 0644 ${S}/gtk/gtkfilechooserutils.h   ${D}${includedir}/gtk-2.0/gtk/
+	install -m 0644 ${S}/gtk/gtkfilesystemmodel.h    ${D}${includedir}/gtk-2.0/gtk/
+
+	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-2.0
+
+    # duplicate gtk-query-immodules for post install script update_gtk_immodules_cache
+    mkdir -p ${D}${libexecdir}
+    ln ${D}${bindir}/gtk-query-immodules-2.0 ${D}${libexecdir}/${MLPREFIX}gtk-query-immodules-2.0
+}
+
+SYSROOT_PREPROCESS_FUNCS += "gtk_sysroot_preprocess"
+
+gtk_sysroot_preprocess () {
+	if [ -e ${D}${bindir}/gtk-builder-convert ]; then
+		install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+		install -m 755 ${D}${bindir}/gtk-builder-convert ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+	fi
+}
+
diff --git a/meta-oe/recipes-gnome/gtk+/gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch b/meta-oe/recipes-gnome/gtk+/gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch
new file mode 100644
index 0000000000..83be39c3bf
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch
@@ -0,0 +1,29 @@
+From 34ce93e1c50bfb88f92a687d4f82de55584f3f6a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 11 Apr 2018 14:20:39 +0300
+Subject: [PATCH] Do not look into $HOME when looking for gtk modules
+
+On the host it causes host contamination, on the target it's a
+potential security issue. Gtk+3 has already removed this.
+
+Upstream-Status: Inappropriate [gtk2 is in maintenance mode]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gtk/gtkmodules.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/gtk/gtkmodules.c b/gtk/gtkmodules.c
+index 50729b6..e09b583 100644
+--- a/gtk/gtkmodules.c
++++ b/gtk/gtkmodules.c
+@@ -65,10 +65,6 @@ get_module_path (void)
+   if (result)
+     return result;
+ 
+-  home_dir = g_get_home_dir();
+-  if (home_dir)
+-    home_gtk_dir = g_build_filename (home_dir, ".gtk-2.0", NULL);
+-
+   module_path_env = g_getenv ("GTK_PATH");
+   exe_prefix = g_getenv ("GTK_EXE_PREFIX");
+ 
diff --git a/meta-oe/recipes-gnome/gtk+/gtk+/doc-fixes.patch b/meta-oe/recipes-gnome/gtk+/gtk+/doc-fixes.patch
new file mode 100644
index 0000000000..74e479fd1b
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtk+/doc-fixes.patch
@@ -0,0 +1,22 @@
+There are issues building the gtk+ tutorial and faq documentation.
+Since they were removed in gtk+ upstream and are superfluous in
+embedded applications, just don't build them.
+
+Thanks to Joshua Lock for suggesting this approach.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+
+diff -urN gtk+-2.22.1.orig/docs/Makefile.am gtk+-2.22.1/docs/Makefile.am
+--- gtk+-2.22.1.orig/docs/Makefile.am	2010-11-15 04:13:09.000000000 -0800
++++ gtk+-2.22.1/docs/Makefile.am	2011-02-23 19:25:16.914815097 -0800
+@@ -1,7 +1,7 @@
+ ## Process this file with automake to produce Makefile.in
+ include $(top_srcdir)/Makefile.decl
+ 
+-SUBDIRS = tutorial faq reference tools
++SUBDIRS = reference tools
+ 
+ EXTRA_DIST += \
+ 	defsformat.txt			\
diff --git a/meta-oe/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch b/meta-oe/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch
new file mode 100644
index 0000000000..9eb7f6bf5c
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Updated to apply to gtk+-2.24.15
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+Index: gtk+-2.24.31/configure.ac
+===================================================================
+--- gtk+-2.24.31.orig/configure.ac
++++ gtk+-2.24.31/configure.ac
+@@ -415,7 +415,7 @@ AC_MSG_CHECKING([Whether to write depend
+ case $enable_explicit_deps in
+   auto)
+     export SED
+-    deplibs_check_method=`(./libtool --config; echo 'eval echo \"$deplibs_check_method\"') | sh`
++    deplibs_check_method=`(./$host_alias-libtool --config; echo 'eval echo \"$deplibs_check_method\"') | sh`
+     if test "x$deplibs_check_method" '!=' xpass_all || test "x$enable_static" = xyes ; then
+       enable_explicit_deps=yes  
+     else
+@@ -772,7 +772,7 @@ else
+     dnl Now we check to see if our libtool supports shared lib deps
+     dnl (in a rather ugly way even)
+     if $dynworks; then
+-        module_libtool_config="${CONFIG_SHELL-/bin/sh} ./libtool --config"
++        module_libtool_config="${CONFIG_SHELL-/bin/sh} $host_alias-libtool --config"
+         module_deplibs_check=`$module_libtool_config | \
+             grep '^[[a-z_]]*check[[a-z_]]*_method=[['\''"]]' | \
+             sed 's/.*[['\''"]]\(.*\)[['\''"]]$/\1/'`
+@@ -1579,7 +1579,7 @@ fi
+ # We are using gmodule-no-export now, but I'm leaving the stripping
+ # code in place for now, since pango and atk still require gmodule.
+ export SED
+-export_dynamic=`(./libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
++export_dynamic=`($host_alias-libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
+ if test -n "$export_dynamic"; then
+   GDK_DEP_LIBS=`echo $GDK_DEP_LIBS | sed -e "s/$export_dynamic//"`
+   GTK_DEP_LIBS=`echo $GTK_DEP_LIBS | sed -e "s/$export_dynamic//"`
diff --git a/meta-oe/recipes-gnome/gtk+/gtk+/strict-prototypes.patch b/meta-oe/recipes-gnome/gtk+/gtk+/strict-prototypes.patch
new file mode 100644
index 0000000000..96e1f5feac
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtk+/strict-prototypes.patch
@@ -0,0 +1,24 @@
+Fixes
+
+include/gtk-2.0/gtk/gtkitemfactory.h:47:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
+ typedef void (*GtkItemFactoryCallback)  ();
+
+gcc5 has -Wstrict-prototypes on by default for -Werror so this becomes a build failure for consumers
+of this header e.g. matchbox-panel-2
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: gtk+-2.24.27/gtk/gtkitemfactory.h
+===================================================================
+--- gtk+-2.24.27.orig/gtk/gtkitemfactory.h
++++ gtk+-2.24.27/gtk/gtkitemfactory.h
+@@ -44,7 +44,7 @@ typedef void	(*GtkPrintFunc)		   (gpoint
+  * (Note that if we are included from a C++ program () will mean
+  * (void) so an explicit cast will be needed.)
+  */
+-typedef	void	(*GtkItemFactoryCallback)  ();
++typedef	void	(*GtkItemFactoryCallback)  (void);
+ typedef	void	(*GtkItemFactoryCallback1) (gpointer		 callback_data,
+ 					    guint		 callback_action,
+ 					    GtkWidget		*widget);
diff --git a/meta-oe/recipes-gnome/gtk+/gtk+/toggle-font.diff b/meta-oe/recipes-gnome/gtk+/gtk+/toggle-font.diff
new file mode 100644
index 0000000000..340d12008b
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtk+/toggle-font.diff
@@ -0,0 +1,102 @@
+Upstream-Status: Pending
+
+Index: gtk/gtkcellrenderertoggle.c
+===================================================================
+--- gtk/gtkcellrenderertoggle.c.orig	2010-06-22 18:11:33.000000000 +0800
++++ gtk/gtkcellrenderertoggle.c	2010-06-22 18:11:43.000000000 +0800
+@@ -71,6 +71,8 @@
+   PROP_INDICATOR_SIZE
+ };
+ 
++/* This is a hard-coded default which promptly gets overridden by a size
++   calculated from the font size. */
+ #define TOGGLE_WIDTH 13
+ 
+ static guint toggle_cell_signals[LAST_SIGNAL] = { 0 };
+@@ -80,8 +82,9 @@
+ typedef struct _GtkCellRendererTogglePrivate GtkCellRendererTogglePrivate;
+ struct _GtkCellRendererTogglePrivate
+ {
+-  gint indicator_size;
+-
++  gint indicator_size; /* This is the real size */
++  gint override_size; /* This is the size set from the indicator-size property */
++  GtkWidget *cached_widget;
+   guint inconsistent : 1;
+ };
+ 
+@@ -104,6 +107,7 @@
+   GTK_CELL_RENDERER (celltoggle)->ypad = 2;
+ 
+   priv->indicator_size = TOGGLE_WIDTH;
++  priv->override_size = 0;
+   priv->inconsistent = FALSE;
+ }
+ 
+@@ -210,7 +214,7 @@
+       g_value_set_boolean (value, celltoggle->radio);
+       break;
+     case PROP_INDICATOR_SIZE:
+-      g_value_set_int (value, priv->indicator_size);
++      g_value_set_int (value, priv->override_size ? priv->override_size : priv->indicator_size);
+       break;
+     default:
+       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, param_id, pspec);
+@@ -245,7 +249,7 @@
+       celltoggle->radio = g_value_get_boolean (value);
+       break;
+     case PROP_INDICATOR_SIZE:
+-      priv->indicator_size = g_value_get_int (value);
++      priv->override_size = g_value_get_int (value);
+       break;
+     default:
+       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, param_id, pspec);
+@@ -273,6 +277,27 @@
+ }
+ 
+ static void
++on_widget_style_set (GtkWidget *widget, GtkStyle *previous, gpointer user_data)
++{
++  GtkCellRendererTogglePrivate *priv = user_data;
++  PangoContext *context;
++  PangoFontMetrics *metrics;
++  int height;
++  
++  context = gtk_widget_get_pango_context (widget);
++  metrics = pango_context_get_metrics (context,
++                                       widget->style->font_desc,
++                                       pango_context_get_language (context));
++
++  height = pango_font_metrics_get_ascent (metrics) +
++    pango_font_metrics_get_descent (metrics);
++  
++  pango_font_metrics_unref (metrics);
++  
++  priv->indicator_size = PANGO_PIXELS (height * 0.85);
++}
++
++static void
+ gtk_cell_renderer_toggle_get_size (GtkCellRenderer *cell,
+ 				   GtkWidget       *widget,
+ 				   GdkRectangle    *cell_area,
+@@ -287,6 +312,20 @@
+ 
+   priv = GTK_CELL_RENDERER_TOGGLE_GET_PRIVATE (cell);
+ 
++  if (priv->override_size) {
++    priv->indicator_size = priv->override_size;
++  } else if (priv->cached_widget != widget) {
++    if (priv->cached_widget) {
++      g_object_remove_weak_pointer (widget, &priv->cached_widget);
++      g_signal_handlers_disconnect_by_func (priv->cached_widget, on_widget_style_set, priv);
++    }
++    priv->cached_widget = widget;
++    g_object_add_weak_pointer (widget, &priv->cached_widget);
++    g_signal_connect (widget, "style-set", on_widget_style_set, priv);
++    
++    on_widget_style_set (widget, NULL, priv);
++  }
++
+   calc_width = (gint) cell->xpad * 2 + priv->indicator_size;
+   calc_height = (gint) cell->ypad * 2 + priv->indicator_size;
+ 
diff --git a/meta-oe/recipes-gnome/gtk+/gtk+/xsettings.patch b/meta-oe/recipes-gnome/gtk+/gtk+/xsettings.patch
new file mode 100644
index 0000000000..d0a970ad4d
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtk+/xsettings.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Pending
+
+Index: gtk+-2.21.2/gdk/x11/gdkevents-x11.c
+===================================================================
+--- gtk+-2.21.2.orig/gdk/x11/gdkevents-x11.c	2010-06-22 17:28:04.000000000 +0800
++++ gtk+-2.21.2/gdk/x11/gdkevents-x11.c	2010-06-22 17:28:06.000000000 +0800
+@@ -3062,10 +3062,9 @@
+ {
+   GdkScreenX11 *screen = data;
+   
+-  if (xsettings_client_process_event (screen->xsettings_client, (XEvent *)xevent))
+-    return GDK_FILTER_REMOVE;
+-  else
+-    return GDK_FILTER_CONTINUE;
++  xsettings_client_process_event (screen->xsettings_client, (XEvent *)xevent);
++
++  return GDK_FILTER_CONTINUE;
+ }
+ 
+ static Bool
diff --git a/meta-oe/recipes-gnome/gtk+/gtk+_2.24.32.bb b/meta-oe/recipes-gnome/gtk+/gtk+_2.24.32.bb
new file mode 100644
index 0000000000..682d31e49e
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtk+_2.24.32.bb
@@ -0,0 +1,35 @@
+require gtk+.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://gtk/gtk.h;endline=27;md5=c59e0b4490dd135a5726ebf851f9b17f \
+                    file://gdk/gdk.h;endline=27;md5=07db285ec208fb3e0bf7d861b0614202 \
+                    file://tests/testgtk.c;endline=27;md5=262db5db5f776f9863e56df31423e24c"
+SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
+           file://xsettings.patch \
+           file://hardcoded_libtool.patch \
+           file://toggle-font.diff;striplevel=0 \
+           file://doc-fixes.patch \
+           file://strict-prototypes.patch \
+           file://0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch \
+           "
+
+SRC_URI[md5sum] = "d5742aa42275203a499b59b4c382a784"
+SRC_URI[sha256sum] = "b6c8a93ddda5eabe3bfee1eb39636c9a03d2a56c7b62828b359bf197943c582e"
+
+EXTRA_OECONF = "--enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
+
+LIBV = "2.10.0"
+
+PACKAGES_DYNAMIC += "^gtk-immodule-.* ^gtk-printbackend-.*"
+
+python populate_packages_prepend () {
+    gtk_libdir = d.expand('${libdir}/gtk-2.0/${LIBV}')
+    immodules_root = os.path.join(gtk_libdir, 'immodules')
+    printmodules_root = os.path.join(gtk_libdir, 'printbackends');
+
+    d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immodules_root, r'^im-(.*)\.so$', 'gtk-immodule-%s', 'GTK input module for %s')))
+    do_split_packages(d, printmodules_root, r'^libprintbackend-(.*)\.so$', 'gtk-printbackend-%s', 'GTK printbackend module for %s')
+
+    if (d.getVar('DEBIAN_NAMES')):
+        d.setVar(d.expand('PKG_${PN}'), '${MLPREFIX}libgtk-2.0')
+}
-- 
2.20.1


