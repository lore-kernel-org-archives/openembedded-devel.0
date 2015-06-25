Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 083E0605D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 12:36:34 +0000 (UTC)
Received: by wicgi11 with SMTP id gi11so74462129wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 05:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=9q/gsQUsKE8WVxNFA7TUr0Wfec1NFLSS+FGnvcd5rRk=;
	b=Sd4/eV46Ixt64Eimn3B49/Oy9jF5thHFi9D0XO4H0TPTXyAl92hMaOao4D5BLK77xb
	0xr78va0z4aZYtKxD5ZUqcVrH3KpEc0YfFyvdMDAb5cNQMi8iFT08O7nc4ByLTkmSSWo
	kJgnnc4BKUR4VhBL9Zs9JCrSbVhn5IrGwNWcn0Ap2mIl8Raum3eq9x1GHy113Xbng7qH
	CuL7pV352ytp3238yBOEIW9/Zen+1LqcQKzwS9g3g6B3ckjaWLt+gbD0f5xObssGxbp0
	vAqdKTgH8JGbrBzArIe7TLk1mvjt56YI2OKOLrkq7CjNwj3aAg7Wp8MFXgh1yrUhuw8Y
	YhPw==
X-Received: by 10.194.93.198 with SMTP id cw6mr11666662wjb.113.1435235795610; 
	Thu, 25 Jun 2015 05:36:35 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id
	pg1sm45655780wjb.39.2015.06.25.05.36.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 05:36:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jun 2015 14:35:53 +0200
Message-Id: <1435235754-7339-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
References: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] xfdesktop: fix settings for monitors containing white spaces
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Jun 2015 12:36:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...espaces-from-monitor-name-when-accessing-.patch | 138 +++++++++++++++++++++
 .../recipes-xfce/xfdesktop/xfdesktop_4.12.2.bb     |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/xfdesktop/files/0001-Remove-whitespaces-from-monitor-name-when-accessing-.patch

diff --git a/meta-xfce/recipes-xfce/xfdesktop/files/0001-Remove-whitespaces-from-monitor-name-when-accessing-.patch b/meta-xfce/recipes-xfce/xfdesktop/files/0001-Remove-whitespaces-from-monitor-name-when-accessing-.patch
new file mode 100644
index 0000000..3390f28
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfdesktop/files/0001-Remove-whitespaces-from-monitor-name-when-accessing-.patch
@@ -0,0 +1,138 @@
+From f384bfc86322096c62f0b843bacf5e9633e18035 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 25 Jun 2015 13:08:29 +0200
+Subject: [PATCH] Remove whitespaces from monitor name when accessing settings
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Desktop wallpaper could not be set here. Running
+'xfdesktop-settings --enable-debug' lead to:
+
+| Saving to /backdrop/screen0/monitorDISP3 BG - DI1/workspace0/last-image//usr/share/backgrounds/xfce/xfce-blue.jpg
+
+and no change was found tracking with Settings Editor.
+
+Upstream-Status: Submitted [1]
+
+[1] https://bugzilla.xfce.org/show_bug.cgi?id=12015
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ common/xfdesktop-common.c | 26 ++++++++++++++++++++++++++
+ common/xfdesktop-common.h |  1 +
+ settings/main.c           |  4 ++--
+ src/xfce-workspace.c      | 11 +++++------
+ 4 files changed, 34 insertions(+), 8 deletions(-)
+
+diff --git a/common/xfdesktop-common.c b/common/xfdesktop-common.c
+index 5d2c255..1f180df 100644
+--- a/common/xfdesktop-common.c
++++ b/common/xfdesktop-common.c
+@@ -194,6 +194,32 @@ xfdesktop_popup_keyboard_grab_available(GdkWindow *win)
+ }
+ 
+ 
++/*
++ * xfdesktop_remove_whitspaces:
++ * remove all whitespaces from string (not only trailing or leading)
++ */
++gchar*
++xfdesktop_remove_whitspaces(gchar* str)
++{
++    gchar* dest;
++    gint offs, curr;
++
++    g_return_val_if_fail(str, NULL);
++
++    offs = 0;
++    dest = str;
++    for(curr=0; curr<=strlen(str); curr++) {
++        if(*dest == ' ' || *dest == '\t')
++            offs++;
++        else if(0 != offs)
++            *(dest-offs) = *dest;
++        dest++;
++    }
++
++    return str;
++}
++
++
+ #ifdef G_ENABLE_DEBUG
+ /* With --enable-debug=full turn on debugging messages from the start */
+ static gboolean enable_debug = TRUE;
+diff --git a/common/xfdesktop-common.h b/common/xfdesktop-common.h
+index d1a2745..9e76e78 100644
+--- a/common/xfdesktop-common.h
++++ b/common/xfdesktop-common.h
+@@ -100,6 +100,7 @@ gint xfce_translate_image_styles(gint input);
+ 
+ guint32 xfdesktop_popup_keyboard_grab_available(GdkWindow *win);
+ 
++gchar* xfdesktop_remove_whitspaces(gchar* str);
+ 
+ #if defined(G_HAVE_ISO_VARARGS)
+ 
+diff --git a/settings/main.c b/settings/main.c
+index bc68099..b37abad 100644
+--- a/settings/main.c
++++ b/settings/main.c
+@@ -795,9 +795,9 @@ xfdesktop_settings_generate_per_workspace_binding_string(AppearancePanel *panel,
+                               panel->screen, panel->monitor, panel->workspace,
+                               property);
+     } else {
+-        buf = g_strdup_printf("/backdrop/screen%d/monitor%s/workspace%d/%s",
++        buf = xfdesktop_remove_whitspaces(g_strdup_printf("/backdrop/screen%d/monitor%s/workspace%d/%s",
+                               panel->screen, panel->monitor_name, panel->workspace,
+-                              property);
++                              property));
+     }
+ 
+     XF_DEBUG("name %s", buf);
+diff --git a/src/xfce-workspace.c b/src/xfce-workspace.c
+index 6d3b3e6..13e1187 100644
+--- a/src/xfce-workspace.c
++++ b/src/xfce-workspace.c
+@@ -157,7 +157,7 @@ xfce_workspace_set_xfconf_property_string(XfceWorkspace *workspace,
+                    workspace->priv->property_prefix, monitor_num, workspace->priv->workspace_num, property);
+     } else {
+         g_snprintf(buf, sizeof(buf), "%smonitor%s/workspace%d/%s",
+-                   workspace->priv->property_prefix, monitor_name, workspace->priv->workspace_num, property);
++                   workspace->priv->property_prefix, xfdesktop_remove_whitspaces(monitor_name), workspace->priv->workspace_num, property);
+ 
+         g_free(monitor_name);
+     }
+@@ -191,7 +191,7 @@ xfce_workspace_set_xfconf_property_value(XfceWorkspace *workspace,
+                    workspace->priv->property_prefix, monitor_num, workspace->priv->workspace_num, property);
+     } else {
+         g_snprintf(buf, sizeof(buf), "%smonitor%s/workspace%d/%s",
+-                   workspace->priv->property_prefix, monitor_name, workspace->priv->workspace_num, property);
++                   workspace->priv->property_prefix, xfdesktop_remove_whitspaces(monitor_name), workspace->priv->workspace_num, property);
+ 
+         g_free(monitor_name);
+     }
+@@ -609,8 +609,9 @@ xfce_workspace_connect_backdrop_settings(XfceWorkspace *workspace,
+                    workspace->priv->property_prefix, monitor, workspace->priv->workspace_num);
+     } else {
+         g_snprintf(buf, sizeof(buf), "%smonitor%s/workspace%d/",
+-                   workspace->priv->property_prefix, monitor_name, workspace->priv->workspace_num);
+-    }
++                   workspace->priv->property_prefix, xfdesktop_remove_whitspaces(monitor_name), workspace->priv->workspace_num);
++        g_free(monitor_name);
++   }
+     pp_len = strlen(buf);
+ 
+     XF_DEBUG("prefix string: %s", buf);
+@@ -674,8 +675,6 @@ xfce_workspace_connect_backdrop_settings(XfceWorkspace *workspace,
+     xfconf_g_property_bind(channel, buf, G_TYPE_STRING,
+                            G_OBJECT(backdrop), "image-filename");
+ 
+-
+-    g_free(monitor_name);
+ }
+ 
+ static void
+-- 
+1.9.3
+
diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.2.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.2.bb
index 9c72028..95b5f40 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.2.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.2.bb
@@ -8,6 +8,7 @@ inherit xfce
 
 SRC_URI[md5sum] = "9a29c8e6b8a931fecd29f1ea736a6a70"
 SRC_URI[sha256sum] = "c9788883163b57bac39d12e5f8310c869d176454879defb78b67f8e9f1ad5225"
+SRC_URI += "file://0001-Remove-whitespaces-from-monitor-name-when-accessing-.patch"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
1.9.3


