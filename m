Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web08.3859.1615866157179586751
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 20:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12G3gMBP004916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Mar 2021 20:42:23 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 20:42:12 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 20:42:11 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <schnitzeltony@gmail.com>
Subject: [meta-xfce][PATCH 1/7] xfce4-cpufreq-plugin: 1.2.2 -> 1.2.5
Date: Tue, 16 Mar 2021 11:41:56 +0800
Message-ID: <20210316034202.21134-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316034202.21134-1-kai.kang@windriver.com>
References: <20210316034202.21134-1-kai.kang@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 12G3gMBP004916
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Kai Kang <kai.kang@windriver.com>

Upgrade xfce4-cpufreq-plugin from 1.2.2 to 1.2.5:

* drop patches which are fixed in upstream already

Release notes for 1.2.3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- configure.ac: use AC_PROG_CC_C99
- Remove duplicate information from configuration window's title
- Fix missing-prototypes
- Remove GSourceFunc casts
- Fix font color memory leak
- Fix fatal compiler warnings
- Record release date in the NEWS file like in all previous releases
- Fix CSS provider memory leak and an invalid line ordering in an
  if-statement
- Use heap allocations instead of stack allocations
- Better handling of changes in the number of installed CPUs
- Display the actual governor instead of "current"
- Fix font size (#5)
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Basque, Belarusian, Bulgarian,
  Catalan, Chinese (China), Chinese (Taiwan), Croatian, Czech, Danish,
  Dutch, Eastern Armenian, English (Australia), English (United
  Kingdom), Finnish, French, Galician, German, Greek, Hebrew,
  Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
  Korean, Lithuanian, Malay, Norwegian Bokm=C3=A5l, Occitan (post 1500),
  Polish, Portuguese, Portuguese (Brazil), Russian, Serbian, Slovak,
  Slovenian, Spanish, Swedish, Thai, Turkish, Ukrainian, Uyghur

Release notes for 1.2.4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Display governors even if they differ among CPU cores
- Enable fixed units in the frequency text box
- Create the label widget if it does not exist
- Code cleanup: Rename label to label_orNull
- Code cleanup: Use local pointers to cpuFreq->options
- Fix compilation warnings
- AC_CONFIG_MACRO_DIR =E2=86=92 AC_CONFIG_MACRO_DIRS.
- Update copyright year
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Basque, Belarusian, Bulgarian,
  Catalan, Chinese (China), Chinese (Taiwan), Croatian, Czech, Danish,
  Dutch, Eastern Armenian, English (Australia), English (United
  Kingdom), Finnish, French, Galician, German, Greek, Hebrew,
  Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
  Korean, Lithuanian, Malay, Norwegian Bokm=C3=A5l, Occitan (post 1500),
  Polish, Portuguese, Portuguese (Brazil), Russian, Serbian, Slovak,
  Slovenian, Spanish, Swedish, Thai, Turkish, Ukrainian, Uyghur

Release notes for 1.2.5
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Code cleanup: Fix percentile variable names
- Use 99th percentile as the maximum frequency when adjusting icon color
- Display text using a drawing area instead of using a label with CSS
- Fix a minor memory leak
- Code cleanup: Remove function parameter having value of a global variab=
le
- Code cleanup: Avoid old-style C function definitions
- Enable font color reset
- Disable font settings when not displaying text
- Switch to symbolic close icons
- Bump required version of Xfce UI to 4.14
- Add NetBeans project directory to .gitignore
- Code cleanup: Remove declarations from for-loops
- Unconditionally remove label's old CSS style
- Avoid redundant calls to GTK+ set functions when updating the label
- Adjust CPU icon color according to frequency
- Code cleanup: Remove inline keywords
- Fix invalid iteration over an array
- Do not ignore the return value of fscanf()
- Code cleanup: Remove redundant zeroing after g_new0()
- Code cleanup: Minor code simplification
- Compute max_freq and min_freq when calculating avg/min/max
- Code cleanup: Update code to match the coding style
- Fix a minor memory leak
- Code cleanup: Sink variables to inner block scopes
- Initialize global variable to NULL
- Fix conditional memory leak and remove redundant g_strdup() calls
- Allocate space for fgets() on the stack instead of on the heap
- Code cleanup: Move config validation and sensitivity to separate functi=
ons
- Code cleanup: Use a single bit to store boolean values
- Delete font name from RC file if using the default font
- Translation Updates:
  Albanian, Basque, Catalan, Chinese (Taiwan), Danish, Dutch, French,
  Galician, German, Greek, Italian, Japanese, Lithuanian, Norwegian
  Bokm=C3=A5l, Portuguese, Portuguese (Brazil), Serbian, Slovak, Spanish,
  Swedish, Turkish

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ry-leak-and-reduce-cpu-load-slightly.patch | 121 ------------------
 ...e4-cpufreq-plugin-1.2.1-gcc10-common.patch |  41 ------
 ...1.2.2.bb =3D> xfce4-cpufreq-plugin_1.2.5.bb} |   6 +-
 3 files changed, 1 insertion(+), 167 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq=
-plugin/0001-Fix-memory-leak-and-reduce-cpu-load-slightly.patch
 delete mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq=
-plugin/xfce4-cpufreq-plugin-1.2.1-gcc10-common.patch
 rename meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.2=
.2.bb =3D> xfce4-cpufreq-plugin_1.2.5.bb} (51%)

diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin=
/0001-Fix-memory-leak-and-reduce-cpu-load-slightly.patch b/meta-xfce/reci=
pes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/0001-Fix-memory-leak-and-r=
educe-cpu-load-slightly.patch
deleted file mode 100644
index ae8bc5279..000000000
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/0001-F=
ix-memory-leak-and-reduce-cpu-load-slightly.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From f86486e128f62ed5a531163535d11f0aa0268928 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-Date: Sun, 5 May 2019 20:45:26 +0200
-Subject: [PATCH] Fix memory-leak and reduce cpu-load slightly
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-* when setting font remove old css provider befor setting new
-  -> fix memory leak
-* do call cpufreq_label_set_font only on init and when font was changed
-  -> reduce cpu-load
-
-Fixes https://bugzilla.xfce.org/show_bug.cgi?id=3D15218
-
-Upstream-Status: Submitted [1]
-
-[1] https://bugzilla.xfce.org/attachment.cgi?id=3D8492
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
-
----
- panel-plugin/xfce4-cpufreq-configure.c |  4 ++++
- panel-plugin/xfce4-cpufreq-plugin.c    | 13 +++++++++++--
- panel-plugin/xfce4-cpufreq-plugin.h    |  2 ++
- 3 files changed, 17 insertions(+), 2 deletions(-)
-
-diff --git a/panel-plugin/xfce4-cpufreq-configure.c b/panel-plugin/xfce4=
-cpufreq-configure.c
-index 1205fc9..48e72ff 100644
---- a/panel-plugin/xfce4-cpufreq-configure.c
-+++ b/panel-plugin/xfce4-cpufreq-configure.c
-@@ -85,7 +85,10 @@ button_fontname_update(GtkWidget *button, gboolean up=
date_plugin)
-   }
-=20
-   if (update_plugin)
-+  {
-+    cpufreq_label_set_font ();
-     cpufreq_update_plugin (TRUE);
-+  }
- }
-=20
-=20
-@@ -155,6 +158,7 @@ button_fontcolor_clicked (GtkWidget *button, void *d=
ata)
-   gtk_color_chooser_get_rgba (GTK_COLOR_CHOOSER (button), color);
-   cpuFreq->options->fontcolor =3D gdk_rgba_to_string (color);
-   g_free (color);
-+  cpufreq_label_set_font ();
-   cpufreq_update_plugin (TRUE);
- }
-=20
-diff --git a/panel-plugin/xfce4-cpufreq-plugin.c b/panel-plugin/xfce4-cp=
ufreq-plugin.c
-index e886121..8d7c9e5 100644
---- a/panel-plugin/xfce4-cpufreq-plugin.c
-+++ b/panel-plugin/xfce4-cpufreq-plugin.c
-@@ -44,6 +44,7 @@ cpufreq_label_set_font (void)
- {
-   gchar *css =3D NULL, *css_font =3D NULL, *css_color =3D NULL;
-   GtkCssProvider *provider;
-+  GtkStyleContext *context;
-   PangoFontDescription *font;
-=20
-   if (G_UNLIKELY (cpuFreq->label =3D=3D NULL))
-@@ -76,11 +77,17 @@ cpufreq_label_set_font (void)
-   if (css)
-   {
-     provider =3D gtk_css_provider_new ();
-+    context =3D GTK_STYLE_CONTEXT (gtk_widget_get_style_context (GTK_WI=
DGET (cpuFreq->label)));
-+
-+    if (currentProvider)
-+      gtk_style_context_remove_provider (context, currentProvider);
-=20
-     gtk_css_provider_load_from_data (provider, css, -1, NULL);
-     gtk_style_context_add_provider (
--      GTK_STYLE_CONTEXT (gtk_widget_get_style_context (GTK_WIDGET (cpuF=
req->label))),
-+      context,
-       GTK_STYLE_PROVIDER (provider), GTK_STYLE_PROVIDER_PRIORITY_APPLIC=
ATION);
-+
-+    currentProvider =3D provider;
-   }
-=20
-   g_free (css);
-@@ -420,7 +427,6 @@ cpufreq_update_plugin (gboolean reset_label_size)
-=20
-   if (cpuFreq->layout_changed)
-   {
--    cpufreq_label_set_font ();
-     cpufreq_widgets_layout ();
-   }
-=20
-@@ -601,6 +607,7 @@ cpufreq_widgets (void)
-=20
-   gtk_widget_show_all (cpuFreq->button);
-=20
-+  cpufreq_label_set_font ();
-   cpufreq_update_plugin (TRUE);
- }
-=20
-@@ -775,6 +782,8 @@ cpufreq_construct (XfcePanelPlugin *plugin)
- {
-   xfce_textdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR, "UTF-8");
-=20
-+  currentProvider =3D NULL;
-+
-   cpuFreq =3D g_new0 (CpuFreqPlugin, 1);
-   cpuFreq->options =3D g_new0 (CpuFreqPluginOptions, 1);
-   cpuFreq->plugin =3D plugin;
-diff --git a/panel-plugin/xfce4-cpufreq-plugin.h b/panel-plugin/xfce4-cp=
ufreq-plugin.h
-index a6895e4..6338698 100644
---- a/panel-plugin/xfce4-cpufreq-plugin.h
-+++ b/panel-plugin/xfce4-cpufreq-plugin.h
-@@ -95,6 +95,8 @@ typedef struct
-=20
- extern CpuFreqPlugin *cpuFreq;
-=20
-+GtkCssProvider *currentProvider;
-+
- G_BEGIN_DECLS
-=20
- void
----
-2.20.1
diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin=
/xfce4-cpufreq-plugin-1.2.1-gcc10-common.patch b/meta-xfce/recipes-panel-=
plugins/cpufreq/xfce4-cpufreq-plugin/xfce4-cpufreq-plugin-1.2.1-gcc10-com=
mon.patch
deleted file mode 100644
index 95605f83a..000000000
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/xfce4-=
cpufreq-plugin-1.2.1-gcc10-common.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Fix build with -fno-common
-
-Part of Patch from https://src.fedoraproject.org/rpms/xfce4-cpufreq-plug=
in/raw/master/f/xfce4-cpufreq-plugin-1.2.1-gcc10-common.patch
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Refresh for xfce4-cpufreq-plugin 1.2.2.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
----
- panel-plugin/xfce4-cpufreq-plugin.c | 1 +
- panel-plugin/xfce4-cpufreq-plugin.h | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/panel-plugin/xfce4-cpufreq-plugin.c b/panel-plugin/xfce4-cp=
ufreq-plugin.c
-index 1e33492..ce9e302 100644
---- a/panel-plugin/xfce4-cpufreq-plugin.c
-+++ b/panel-plugin/xfce4-cpufreq-plugin.c
-@@ -38,6 +38,7 @@
- #endif /* __linux__ */
-=20
- CpuFreqPlugin *cpuFreq;
-+GtkCssProvider *currentProvider;
-=20
- void
- cpufreq_label_set_font (void)
-diff --git a/panel-plugin/xfce4-cpufreq-plugin.h b/panel-plugin/xfce4-cp=
ufreq-plugin.h
-index 8cd0d33..7dbccef 100644
---- a/panel-plugin/xfce4-cpufreq-plugin.h
-+++ b/panel-plugin/xfce4-cpufreq-plugin.h
-@@ -95,7 +95,7 @@ typedef struct
-=20
- extern CpuFreqPlugin *cpuFreq;
-=20
--GtkCssProvider *currentProvider;
-+extern GtkCssProvider *currentProvider;
-=20
- G_BEGIN_DECLS
-=20
diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin=
_1.2.2.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_=
1.2.5.bb
similarity index 51%
rename from meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_=
1.2.2.bb
rename to meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.=
2.5.bb
index 3b7b9ec5d..8fef52027 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.2.=
bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.5.=
bb
@@ -5,8 +5,4 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1f6f1c0be32491=
a0c8d2915607a28f36"
=20
 inherit xfce-panel-plugin
=20
-SRC_URI[sha256sum] =3D "500f04b8d857c96da8c8c7a4eecba30a903d0fce6e35a05e=
674529e43b47e498"
-
-SRC_URI +=3D "file://0001-Fix-memory-leak-and-reduce-cpu-load-slightly.p=
atch \
-            file://xfce4-cpufreq-plugin-1.2.1-gcc10-common.patch \
-           "
+SRC_URI[sha256sum] =3D "f8bd728de2d33e7ab30c682716b1cac4776b9884ce48b03f=
d7c32c9b24b13498"
--=20
2.17.1

