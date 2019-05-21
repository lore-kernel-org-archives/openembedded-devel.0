Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id B106A7E161
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:53 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id p15so7735934pll.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tmnt1n0eSiYBKMBsLzFm14qXtgOJnEVJ2l7tVTMqjS0=;
	b=A2KVDbliWTVQXNNIh5N/5GvzlA6kmVHsaHIFat2tBPQ4+skkA8/4eZRikCUPQndtWG
	QGZBgm5s2kc12rrFVjEnT+A5du6XIa0U7RBy6HSrrd69gFrgfg4At4gXGuG1DpWflYY8
	hHHrubGshcUtX5lNaRhoi1NfgNU8i6TcXK55+3Mbx5pTmp0EQ5Qmqtsbt9Ep+uXSgH8Y
	2Yj1J7PVVouzXem240f1fpyW4lqpSDme8i2xscGxhnfOVP7v5fGIUxBeibHxR1Cpy1fA
	j8Ba3oTnj9wGiDzP15RrQbCRPGzSU64Cfcx9y9KWYvynC8B5dnBBT2ZuvIODpmkfiL7L
	i+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tmnt1n0eSiYBKMBsLzFm14qXtgOJnEVJ2l7tVTMqjS0=;
	b=ghQ2xkEbPDRbUCP69jJdiiQ4xuYqRZUPRkYyKEejZhHQHbRmYNCprmz7J9yNO2xzs3
	kwE2p3y1n5WnwhTNmfyxQBxPNrBJri1/YxmgJarO+B6UO9ZWNUjpZnFOBqFndrc4y8tn
	6R+cD27itKUvgd6E3/k99+WJlPY/JqrHJCTywFGAQJnJ36QuKDUHVqTMGGgd79UfYH3h
	YHZ3xlb80aNhmqXVCYZ1sxoWAMBqm9+sQt1amIslbH6iCrw+0gb1+rbaZLQ8a9hI0VWK
	PbsdkUxp12Q71DcllbEgO+h9/P8BgyQ5AEIGO+mz/FWJm5jWaXTaRjfYJIeJPR+xwWCi
	d+Fg==
X-Gm-Message-State: APjAAAXOoq0COf0DNpeBvey9/+MqfuoNpt8v80HXgs2QOozXOkWuy+p+
	Au58CXT7teUIEndVYoVjfauoRLit
X-Google-Smtp-Source: APXvYqxaSuQUDCY2k8wwOGNAJVu+RKM+QMEtuptAchxiqv0CzpDkwvA1ZgibVGTsckffiN4Jt+/QVA==
X-Received: by 2002:a17:902:9007:: with SMTP id
	a7mr78899969plp.221.1558411014694; 
	Mon, 20 May 2019 20:56:54 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:20 -0700
Message-Id: <5a2e43b22c72124f4b222e50abbd2d7f69ab77e2.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [warrior][patch 20/34] xfce4-cpufreq-plugin: Fix memory leak and reduce CPU load
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
X-List-Received-Date: Tue, 21 May 2019 03:56:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-memory-leak-and-reduce-cpu-load-slightly.patch | 121 +++++++++++++++++++++
 .../cpufreq/xfce4-cpufreq-plugin_1.2.1.bb          |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/0001-Fix-memory-leak-and-reduce-cpu-load-slightly.patch

diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/0001-Fix-memory-leak-and-reduce-cpu-load-slightly.patch b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/0001-Fix-memory-leak-and-reduce-cpu-load-slightly.patch
new file mode 100644
index 0000000..92a6e83
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
index 3f5587d..6addc3b 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.1.bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.1.bb
@@ -7,3 +7,4 @@ inherit xfce-panel-plugin
 
 SRC_URI[md5sum] = "ccd8f0f7aef51bc4caf1049986d9614f"
 SRC_URI[sha256sum] = "c5e044c0dc401d2066f208a3df82a588b3e51ff01425f155d0a1d0f8fce8f5b5"
+SRC_URI += "file://0001-Fix-memory-leak-and-reduce-cpu-load-slightly.patch"
-- 
2.7.4


