Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9024777CE8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:15 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id u2so32068875wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=D+ZyckdVqb2k+070FMUdAv66zY/6CsogiMsUSytTgww=;
	b=tPE0GnrX2LZ9gdwOWpRQ7/6b0QPQw5M3w+MMImtQtpCEujXRMcl8G5fmRug2PkcNDi
	ojy7LnCI9jZ9wV7sEio8h90zym3i6lllxbm7jgIPf2Uu0+QnHHHggIyQr+NZ93Yzlbii
	dCIY71Qjxoi4FdzBraSREuXvJoYoXBoRv+6pam2K0xqOMmr6bDI+Z3iJPAFV+Lp8lZm3
	GP/I1k81npvwnsvNbOotODZ/TmW4Js3w22HLsswbRnfak9nu9LcGXzRneE0nXODjsiim
	TJysv56bolLcllpADL4z+DFs56BpabqbsVhVAs0ewcJmxpsH3yRNtF0H7oR0pMC/fOuC
	CBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=D+ZyckdVqb2k+070FMUdAv66zY/6CsogiMsUSytTgww=;
	b=K7fum9HCcaRqdBH5bbQzj1+eRmTqePNrt7ZLIyH8tg4KryQcc9shNWolwYzTjFGcJd
	+0tr/KfbmZkTnzDtyHG4qhdOD/yKB/HcP9B4s1RjK/43qbjBo4snsj521w1SaqmXZjxy
	8BSe6DHQHbEAIwRQtJ9/J29cBSHCHZuBoZjQYu39+fSjFGdD16r10kHH5iGLpJt5zLCc
	ep+9Nnyl1b+OnD85y0iVb01SK2kyIxea7eoL4QebCyuRRCXRdHAO4paUMM7jIytTZLi+
	xmJ1gloQ0n+aZfLWcNZdtxHq80fjs3Pfs9aZxkWI1PX9i+D24WEKQziLLxI7YgFoCsah
	Gdag==
X-Gm-Message-State: AN3rC/5LBwlOlgXxa4eKVlCA0xAJdPCE2nHCGxnZJx66wgEt6LqGUpT5
	icFPCsK2ZT3czY0b
X-Received: by 10.28.147.21 with SMTP id v21mr21040595wmd.45.1492027036352;
	Wed, 12 Apr 2017 12:57:16 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:36 +0200
Message-Id: <20170412195638.3243-28-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 27/29] xfce4-closebutton-plugin: Upstream clang-fix-patch
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...n_val_if_fail-in-functions-expecting-a-re.patch | 62 ----------------------
 .../closebutton/xfce4-closebutton-plugin_git.bb    |  6 +--
 2 files changed, 2 insertions(+), 66 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin/0001-Use-g_return_val_if_fail-in-functions-expecting-a-re.patch

diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin/0001-Use-g_return_val_if_fail-in-functions-expecting-a-re.patch b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin/0001-Use-g_return_val_if_fail-in-functions-expecting-a-re.patch
deleted file mode 100644
index 2e824ec..0000000
--- a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin/0001-Use-g_return_val_if_fail-in-functions-expecting-a-re.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From b0bda2dfc2d8d7bb244e59897b5bf0776f4fe44c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 22 Mar 2017 15:07:26 -0700
-Subject: [PATCH] Use g_return_val_if_fail() in functions expecting a return
- value
-
-Clang detects that we are not returning any value when function
-expects it.
-
-Fixes
-
-| ../../git/panel-plugin/closebutton.c:170:3: error: non-void function 'closebutton_plugin_set_icon' should return a value [-Wreturn-type]
-|   g_return_if_fail (XFCE_IS_PANEL_IMAGE (icon));
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- panel-plugin/closebutton-settings.c | 2 +-
- panel-plugin/closebutton.c          | 6 +++---
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/panel-plugin/closebutton-settings.c b/panel-plugin/closebutton-settings.c
-index f2fa370..d4e6b0c 100644
---- a/panel-plugin/closebutton-settings.c
-+++ b/panel-plugin/closebutton-settings.c
-@@ -60,7 +60,7 @@ closebutton_builder_new (XfcePanelPlugin  *panel_plugin,
-   GtkBuilder  *builder;
-   GObject     *dialog, *button;
- 
--  g_return_if_fail (XFCE_IS_PANEL_PLUGIN (panel_plugin));
-+  g_return_val_if_fail (XFCE_IS_PANEL_PLUGIN (panel_plugin), 0);
- 
-   builder = gtk_builder_new ();
-   if (gtk_builder_add_from_string (builder, buffer, length, &error))
-diff --git a/panel-plugin/closebutton.c b/panel-plugin/closebutton.c
-index fd0a7b5..2120728 100644
---- a/panel-plugin/closebutton.c
-+++ b/panel-plugin/closebutton.c
-@@ -167,8 +167,8 @@ closebutton_plugin_set_icon (CloseButtonPlugin *plugin, gboolean force_reload)
-   XfcePanelPlugin   *panel_plugin = XFCE_PANEL_PLUGIN (plugin);
-   XfcePanelImage    *icon = XFCE_PANEL_IMAGE (plugin->icon);
- 
--  g_return_if_fail (XFCE_IS_PANEL_IMAGE (icon));
--  g_return_if_fail (XFCE_IS_CLOSEBUTTON_PLUGIN (plugin));
-+  g_return_val_if_fail (XFCE_IS_PANEL_IMAGE (icon), 0);
-+  g_return_val_if_fail (XFCE_IS_CLOSEBUTTON_PLUGIN (plugin), 0);
- 
-   window = closebutton_plugin_get_effective_window (plugin);
-   if (window != NULL)
-@@ -404,7 +404,7 @@ closebutton_plugin_size_changed (XfcePanelPlugin *panel_plugin,
-                                  gint             size)
- {
-   CloseButtonPlugin *plugin = XFCE_CLOSEBUTTON_PLUGIN (panel_plugin);
--  g_return_if_fail (XFCE_IS_CLOSEBUTTON_PLUGIN (plugin));
-+  g_return_val_if_fail (XFCE_IS_CLOSEBUTTON_PLUGIN (plugin), 0);
- 
- #if LIBXFCE4PANEL_CHECK_VERSION(4,9,0)
-   size /= xfce_panel_plugin_get_nrows (panel_plugin);
--- 
-2.12.0
-
diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
index 746b122..3cd4ee6 100644
--- a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
+++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
@@ -9,10 +9,8 @@ DEPENDS += "exo-native libwnck xfconf"
 
 PV = "0.1.0+gitr${SRCPV}"
 
-SRC_URI = "git://github.com/schnitzeltony/xfce4-closebutton-plugin.git;branch=master \
-           file://0001-Use-g_return_val_if_fail-in-functions-expecting-a-re.patch \
-          "
-SRCREV = "bd76154afe26ba8a5251a1887d88f9d855301850"
+SRC_URI = "git://github.com/schnitzeltony/xfce4-closebutton-plugin.git;branch=master"
+SRCREV = "02b74f13ad6f639234c8db1854963038b2780a2c"
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--enable-maintainer-mode"
-- 
2.9.3


