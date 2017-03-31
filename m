Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id BF15F77E47
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:04 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id x125so76087541pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1aCYLgPYxPZzZtZLsuGTnLPpiJaxJxIYSJ4ctfBttgc=;
	b=N+O+gyNkyyoh2UBk6KPEpMX7RFHSLYlwcsJyBX8tzwBazLfCZDCS2FsTQ05dgmmYNt
	kc6uoA2Qn6KgpOrG0U+bJJCGiTdNKXP9DbmyEwr0Me6WADUQj9SYUw5UKsWYBQuiylee
	/HCl2BQZKRLL3c3Ya3o/o7/nnRjpKb/NsDQB16i/iuIahj6ywlQ0akbfFmlKdvd3V8vs
	QM2wpbW4ows4eDPLTclCkyrI61CilZp+SJY9w2MYVqDd6N/Y8Xh48ccHOnmm6fpDfoiH
	nwOgsDAH9vdpEkAYKxeFFkOT4Ez04ObXuMGurpzGtIfhZ4/eUMQA1a9goSSdFEg0MK4N
	KXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1aCYLgPYxPZzZtZLsuGTnLPpiJaxJxIYSJ4ctfBttgc=;
	b=TWDlKFKacYvje0uYSNQTg7w2v3EHmZRDji4fZi9IigFPlOSaNK9yRpL9MDqTw20Pwq
	SVSkjcEV8SpI5+vpuXleqeQFflisvGsuQDSbhn8FbfhktEGwA95TkfFHfFhSaaH5Fpor
	ZRDCXl6lGKQNyt4RFgAMmmVcVm47tIM/SQE93shkhSDct8mAPQ8Gh7fX8AqubbvHZG9M
	HDsEWuLharR+h3J4/+i1BI6CXGa8UzJiC3elOq7XuZSmHQo13wuj35fO1znLYuoHZi9D
	r1X8Hh3ZbteYAFOd9moRmmi6SZ85wQazG8bd7pz48tMFR0WBdIKlWjnL7Cs36qdgF9+K
	bh8A==
X-Gm-Message-State: AFeK/H2noubEbofQB0cts0zAw7rLO80Ug4G9erZGn9GewoUkQlPFH12BqtTvr4SG99cyXw==
X-Received: by 10.99.175.66 with SMTP id s2mr4185389pgo.30.1490978585818;
	Fri, 31 Mar 2017 09:43:05 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:12 -0700
Message-Id: <20170331164247.5052-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 08/43] xfce4-closebutton-plugin: Fix build with clang
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:05 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...n_val_if_fail-in-functions-expecting-a-re.patch | 62 ++++++++++++++++++++++
 .../closebutton/xfce4-closebutton-plugin_git.bb    |  4 +-
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin/0001-Use-g_return_val_if_fail-in-functions-expecting-a-re.patch

diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin/0001-Use-g_return_val_if_fail-in-functions-expecting-a-re.patch b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin/0001-Use-g_return_val_if_fail-in-functions-expecting-a-re.patch
new file mode 100644
index 000000000..2e824ec0d
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin/0001-Use-g_return_val_if_fail-in-functions-expecting-a-re.patch
@@ -0,0 +1,62 @@
+From b0bda2dfc2d8d7bb244e59897b5bf0776f4fe44c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Mar 2017 15:07:26 -0700
+Subject: [PATCH] Use g_return_val_if_fail() in functions expecting a return
+ value
+
+Clang detects that we are not returning any value when function
+expects it.
+
+Fixes
+
+| ../../git/panel-plugin/closebutton.c:170:3: error: non-void function 'closebutton_plugin_set_icon' should return a value [-Wreturn-type]
+|   g_return_if_fail (XFCE_IS_PANEL_IMAGE (icon));
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ panel-plugin/closebutton-settings.c | 2 +-
+ panel-plugin/closebutton.c          | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/panel-plugin/closebutton-settings.c b/panel-plugin/closebutton-settings.c
+index f2fa370..d4e6b0c 100644
+--- a/panel-plugin/closebutton-settings.c
++++ b/panel-plugin/closebutton-settings.c
+@@ -60,7 +60,7 @@ closebutton_builder_new (XfcePanelPlugin  *panel_plugin,
+   GtkBuilder  *builder;
+   GObject     *dialog, *button;
+ 
+-  g_return_if_fail (XFCE_IS_PANEL_PLUGIN (panel_plugin));
++  g_return_val_if_fail (XFCE_IS_PANEL_PLUGIN (panel_plugin), 0);
+ 
+   builder = gtk_builder_new ();
+   if (gtk_builder_add_from_string (builder, buffer, length, &error))
+diff --git a/panel-plugin/closebutton.c b/panel-plugin/closebutton.c
+index fd0a7b5..2120728 100644
+--- a/panel-plugin/closebutton.c
++++ b/panel-plugin/closebutton.c
+@@ -167,8 +167,8 @@ closebutton_plugin_set_icon (CloseButtonPlugin *plugin, gboolean force_reload)
+   XfcePanelPlugin   *panel_plugin = XFCE_PANEL_PLUGIN (plugin);
+   XfcePanelImage    *icon = XFCE_PANEL_IMAGE (plugin->icon);
+ 
+-  g_return_if_fail (XFCE_IS_PANEL_IMAGE (icon));
+-  g_return_if_fail (XFCE_IS_CLOSEBUTTON_PLUGIN (plugin));
++  g_return_val_if_fail (XFCE_IS_PANEL_IMAGE (icon), 0);
++  g_return_val_if_fail (XFCE_IS_CLOSEBUTTON_PLUGIN (plugin), 0);
+ 
+   window = closebutton_plugin_get_effective_window (plugin);
+   if (window != NULL)
+@@ -404,7 +404,7 @@ closebutton_plugin_size_changed (XfcePanelPlugin *panel_plugin,
+                                  gint             size)
+ {
+   CloseButtonPlugin *plugin = XFCE_CLOSEBUTTON_PLUGIN (panel_plugin);
+-  g_return_if_fail (XFCE_IS_CLOSEBUTTON_PLUGIN (plugin));
++  g_return_val_if_fail (XFCE_IS_CLOSEBUTTON_PLUGIN (plugin), 0);
+ 
+ #if LIBXFCE4PANEL_CHECK_VERSION(4,9,0)
+   size /= xfce_panel_plugin_get_nrows (panel_plugin);
+-- 
+2.12.0
+
diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
index 341107fa1..746b1222a 100644
--- a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
+++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
@@ -9,7 +9,9 @@ DEPENDS += "exo-native libwnck xfconf"
 
 PV = "0.1.0+gitr${SRCPV}"
 
-SRC_URI = "git://github.com/schnitzeltony/xfce4-closebutton-plugin.git;branch=master"
+SRC_URI = "git://github.com/schnitzeltony/xfce4-closebutton-plugin.git;branch=master \
+           file://0001-Use-g_return_val_if_fail-in-functions-expecting-a-re.patch \
+          "
 SRCREV = "bd76154afe26ba8a5251a1887d88f9d855301850"
 S = "${WORKDIR}/git"
 
-- 
2.12.1


