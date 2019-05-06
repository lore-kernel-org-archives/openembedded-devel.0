Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id CCC936C154
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 08:15:57 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id a12so5925645wrn.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 01:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mDzezkGWfTV4DK82Pmut6YHZQwEtpGUeOH7EqocGKzY=;
	b=buLqKsrC36ymQnQFX6eP7t5Mwh7+gdUX5EhZryPvSn7BXanbamI5v4nNNjXhfce2WX
	bsuMn0ExU+IbWfzLpQD8+oEhS/puXJsG0wuhTra6dLiKRdvVVzvJ6mSM/vckBk1t1VXI
	qTQ++/wO98RvC8qemIZesXXoePAeGvAPKgdeNeuKAwov/1ooA1jRXfVwe95EsERLGJcG
	qapBkOwW3ffJBeDTcK3ln6e9sWgC0PCmmc3oJygv0mmYQbB4CpxaYPgwx/TUM8y3I+5S
	/8x6RW3H0ROVKtwjb8WKyoy/oQzhmoFaNS12aiThYSjHltzK82VvjReg5kOnwMvSvZsr
	nvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mDzezkGWfTV4DK82Pmut6YHZQwEtpGUeOH7EqocGKzY=;
	b=FGO5T6nt7V9kFVXqTkgPVO3xsMgpmYC2TZeZ5x7nbw8VxqrDP2I1q9monmJ60lFJ3H
	400AUeB89TLxhdAe/WvLoJdCBZCVKN7Db07vdVXHtHMCsPI7VOjFCDFhEt6YE07gukuo
	csghMDWBFRmatKwl367i5g5cpdUoRU2oAMtRHnHkTZmSJkHHB1j74Faaw9ijNv3snjcS
	l4qJhkmcssWNRciQmHD1uJkN0WDQF8p+lNLPw6lXbibM0DPOmfaZdsPMV0Z/UAjhV41A
	q+6H/6Q11hFRuXXx5bBKggwDg/qRnr520t9zNkBi0wHh69UGVukhBXrm7vTpEyx/Vuem
	7ZEQ==
X-Gm-Message-State: APjAAAVCv121y646meK5R7FoGLZQ/HcjSY9lCoYBtN0FNCDOI7cQaakd
	5Wq1nY6//XWSnys8OG1JA7RSJqb3
X-Google-Smtp-Source: APXvYqwv63M6JTSjwCa89Fw3rEnRAQiTlfYBLCRb1/iQm9x42x1dSJV9SeXboJvllXYLiLqjg1Nbgg==
X-Received: by 2002:a5d:4245:: with SMTP id s5mr7522795wrr.147.1557130558240; 
	Mon, 06 May 2019 01:15:58 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id o8sm7012512wrx.50.2019.05.06.01.15.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 01:15:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 10:15:43 +0200
Message-Id: <20190506081545.21460-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] xfce4-cpufreq-plugin: Fix memory leak and reduce CPU load
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
X-List-Received-Date: Mon, 06 May 2019 08:15:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ry-leak-and-reduce-cpu-load-slightly.patch | 121 ++++++++++++++++++
 .../cpufreq/xfce4-cpufreq-plugin_1.2.1.bb     |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/0001-Fix-memory-leak-and-reduce-cpu-load-slightly.patch

diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/0001-Fix-memory-leak-and-reduce-cpu-load-slightly.patch b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/0001-Fix-memory-leak-and-reduce-cpu-load-slightly.patch
new file mode 100644
index 000000000..92a6e8384
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/0001-Fix-memory-leak-and-reduce-cpu-load-slightly.patch
@@ -0,0 +1,121 @@
+From f86486e128f62ed5a531163535d11f0aa0268928 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sun, 5 May 2019 20:45:26 +0200
+Subject: [PATCH] Fix memory-leak and reduce cpu-load slightly
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* when setting font remove old css provider befor setting new
+  -> fix memory leak
+* do call cpufreq_label_set_font only on init and when font was changed
+  -> reduce cpu-load
+
+Fixes https://bugzilla.xfce.org/show_bug.cgi?id=15218
+
+Upstream-Status: Submitted [1]
+
+[1] https://bugzilla.xfce.org/attachment.cgi?id=8492
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ panel-plugin/xfce4-cpufreq-configure.c |  4 ++++
+ panel-plugin/xfce4-cpufreq-plugin.c    | 13 +++++++++++--
+ panel-plugin/xfce4-cpufreq-plugin.h    |  2 ++
+ 3 files changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/panel-plugin/xfce4-cpufreq-configure.c b/panel-plugin/xfce4-cpufreq-configure.c
+index 1205fc9..48e72ff 100644
+--- a/panel-plugin/xfce4-cpufreq-configure.c
++++ b/panel-plugin/xfce4-cpufreq-configure.c
+@@ -85,7 +85,10 @@ button_fontname_update(GtkWidget *button, gboolean update_plugin)
+   }
+ 
+   if (update_plugin)
++  {
++    cpufreq_label_set_font ();
+     cpufreq_update_plugin (TRUE);
++  }
+ }
+ 
+ 
+@@ -155,6 +158,7 @@ button_fontcolor_clicked (GtkWidget *button, void *data)
+   gtk_color_chooser_get_rgba (GTK_COLOR_CHOOSER (button), color);
+   cpuFreq->options->fontcolor = gdk_rgba_to_string (color);
+   g_free (color);
++  cpufreq_label_set_font ();
+   cpufreq_update_plugin (TRUE);
+ }
+ 
+diff --git a/panel-plugin/xfce4-cpufreq-plugin.c b/panel-plugin/xfce4-cpufreq-plugin.c
+index e886121..8d7c9e5 100644
+--- a/panel-plugin/xfce4-cpufreq-plugin.c
++++ b/panel-plugin/xfce4-cpufreq-plugin.c
+@@ -44,6 +44,7 @@ cpufreq_label_set_font (void)
+ {
+   gchar *css = NULL, *css_font = NULL, *css_color = NULL;
+   GtkCssProvider *provider;
++  GtkStyleContext *context;
+   PangoFontDescription *font;
+ 
+   if (G_UNLIKELY (cpuFreq->label == NULL))
+@@ -76,11 +77,17 @@ cpufreq_label_set_font (void)
+   if (css)
+   {
+     provider = gtk_css_provider_new ();
++    context = GTK_STYLE_CONTEXT (gtk_widget_get_style_context (GTK_WIDGET (cpuFreq->label)));
++
++    if (currentProvider)
++      gtk_style_context_remove_provider (context, currentProvider);
+ 
+     gtk_css_provider_load_from_data (provider, css, -1, NULL);
+     gtk_style_context_add_provider (
+-      GTK_STYLE_CONTEXT (gtk_widget_get_style_context (GTK_WIDGET (cpuFreq->label))),
++      context,
+       GTK_STYLE_PROVIDER (provider), GTK_STYLE_PROVIDER_PRIORITY_APPLICATION);
++
++    currentProvider = provider;
+   }
+ 
+   g_free (css);
+@@ -420,7 +427,6 @@ cpufreq_update_plugin (gboolean reset_label_size)
+ 
+   if (cpuFreq->layout_changed)
+   {
+-    cpufreq_label_set_font ();
+     cpufreq_widgets_layout ();
+   }
+ 
+@@ -601,6 +607,7 @@ cpufreq_widgets (void)
+ 
+   gtk_widget_show_all (cpuFreq->button);
+ 
++  cpufreq_label_set_font ();
+   cpufreq_update_plugin (TRUE);
+ }
+ 
+@@ -775,6 +782,8 @@ cpufreq_construct (XfcePanelPlugin *plugin)
+ {
+   xfce_textdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR, "UTF-8");
+ 
++  currentProvider = NULL;
++
+   cpuFreq = g_new0 (CpuFreqPlugin, 1);
+   cpuFreq->options = g_new0 (CpuFreqPluginOptions, 1);
+   cpuFreq->plugin = plugin;
+diff --git a/panel-plugin/xfce4-cpufreq-plugin.h b/panel-plugin/xfce4-cpufreq-plugin.h
+index a6895e4..6338698 100644
+--- a/panel-plugin/xfce4-cpufreq-plugin.h
++++ b/panel-plugin/xfce4-cpufreq-plugin.h
+@@ -95,6 +95,8 @@ typedef struct
+ 
+ CpuFreqPlugin *cpuFreq;
+ 
++GtkCssProvider *currentProvider;
++
+ G_BEGIN_DECLS
+ 
+ void
+-- 
+2.20.1
+
diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.1.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.1.bb
index 3f5587d80..6addc3b65 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.1.bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.1.bb
@@ -7,3 +7,4 @@ inherit xfce-panel-plugin
 
 SRC_URI[md5sum] = "ccd8f0f7aef51bc4caf1049986d9614f"
 SRC_URI[sha256sum] = "c5e044c0dc401d2066f208a3df82a588b3e51ff01425f155d0a1d0f8fce8f5b5"
+SRC_URI += "file://0001-Fix-memory-leak-and-reduce-cpu-load-slightly.patch"
-- 
2.20.1


