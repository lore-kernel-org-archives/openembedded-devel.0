Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.9420.1609946284871568753
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EQdgx1t4;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id c7so4711308edv.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VFv12tfkXCXOSNc0GW0haFEGhR+tWP2FA8MPGk9tIYc=;
        b=EQdgx1t4KGugdZvOBVBMcjYu1mQLMCvYA7xCc4XA4EVcAxmLeZW8HRY72D8I531nEX
         ZvK0OOPCjg2guWsh3n04yDVl4PUPGOgFRQMNkEsfLIyv3sEbw8rRiicp0SyuVtB5gGt0
         2dQzVf6CafGK6m1Na8BiXDVzNH6CPYtX0c/p97zdbWJIJNyd8otFcK9mVSvK6gtZ0a04
         XT0/HKrt81xlSGXStIdt74dqv/nIGCWKvnG7JcjVAe2lgttPnQdmlSEK7S5QhcfaJV8L
         GHtxLhUVffR1vPm5gEaCIBUvXf19rVOL8XB6qUk+k4zDEpXH8ztoYfomnLgcnPZ4niEw
         AwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VFv12tfkXCXOSNc0GW0haFEGhR+tWP2FA8MPGk9tIYc=;
        b=IdyRWXYajhVe+twp/5wHxC1AWr3kyn8GvKEstOCa4Q0JWj1nPIDdwkQSVVlCD2MmML
         mSm5/ch0XbQLjFTBENpTMXKNtZK3JQp0Dgh+An/+uML28WuwPq0wuRkt5jmX46spcVgI
         8guNKFQikqIB5iX9YIwXcvhUTU+0VrYOhsk6P7q+x/ZnuCzqesvnTqgeuPpVexu32ye7
         uRRD147A2swlCbemg5QhRLT7g6owOh3qCyLEX1qAtcDUIoxAb3m8hKHI6rjZmCQLJ748
         +Cf6ODWd4bcll52BVvtCNirLRz7aL2WU60ZXjQ6EZn3MpaPwjj9fTAdc7hokMbY7G2fa
         d9aQ==
X-Gm-Message-State: AOAM5310Ip0+LymbTvhUeVKt9GQzKb+OHgAYfzK7AJwlWje6o3j55aur
	kdrpw/qPZCd4greXn/EKNFbj6eGoeKTujg==
X-Google-Smtp-Source: ABdhPJzaNsS7t5paY52Ezj/OqSSOg8gHEWL6Zcsnfr+u712bIAI893Dmru7ZiiLxcJkXGDud4dY6/w==
X-Received: by 2002:a50:9f4a:: with SMTP id b68mr4266434edf.296.1609946283512;
        Wed, 06 Jan 2021 07:18:03 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.18.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:18:02 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 26/28] xfce4-notes-plugin: remove for now
Date: Wed,  6 Jan 2021 16:17:15 +0100
Message-Id: <20210106151717.1779543-26-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* It is broken since xfce 4.16
* GTK3 support was merged to master. Tried to build from git but that requires
  vala support all over the place causing build failures and is beyond worth it
* As soon as a working version is released it will be re-added

[1] https://gitlab.xfce.org/panel-plugins/xfce4-notes-plugin/-/merge_requests/2

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...icon.c-remove-deprecated-g_type_init.patch | 32 -----------
 .../notes/files/01_fix_format-string.patch    | 53 -------------------
 .../notes/xfce4-notes-plugin_1.8.1.bb         | 20 -------
 .../packagegroup-xfce-extended.bb             |  1 -
 4 files changed, 106 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/notes/files/0001-main-status-icon.c-remove-deprecated-g_type_init.patch
 delete mode 100644 meta-xfce/recipes-panel-plugins/notes/files/01_fix_format-string.patch
 delete mode 100644 meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb

diff --git a/meta-xfce/recipes-panel-plugins/notes/files/0001-main-status-icon.c-remove-deprecated-g_type_init.patch b/meta-xfce/recipes-panel-plugins/notes/files/0001-main-status-icon.c-remove-deprecated-g_type_init.patch
deleted file mode 100644
index e1ede27c4..000000000
--- a/meta-xfce/recipes-panel-plugins/notes/files/0001-main-status-icon.c-remove-deprecated-g_type_init.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0218e5ebf38f94d58b908fca451ba3789efa8899 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 20 Sep 2013 23:09:25 +0200
-Subject: [PATCH] main-status-icon.c remove deprecated g_type_init
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-this file was auto created by valac and xfce-vala when creating tarball. So
-
-Upstream-Status: Inappropriate [other]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/main-status-icon.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/main-status-icon.c b/src/main-status-icon.c
-index c6d73f8..f7db773 100644
---- a/src/main-status-icon.c
-+++ b/src/main-status-icon.c
-@@ -290,7 +290,6 @@ gint _vala_main (char** args, int args_length1) {
- 
- 
- int main (int argc, char ** argv) {
--	g_type_init ();
- 	return _vala_main (argv, argc);
- }
- 
--- 
-1.8.3.1
-
diff --git a/meta-xfce/recipes-panel-plugins/notes/files/01_fix_format-string.patch b/meta-xfce/recipes-panel-plugins/notes/files/01_fix_format-string.patch
deleted file mode 100644
index 8066df004..000000000
--- a/meta-xfce/recipes-panel-plugins/notes/files/01_fix_format-string.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Fix formatting strings when compiling with Wformat options
-
-Imported from debian
-
---- a/lib/application.c
-+++ b/lib/application.c
-@@ -352,7 +352,7 @@ static void xnp_application_update_notes
- 			XfconfChannel* _tmp16_;
- 			const gchar* _tmp17_;
- 			_tmp9_ = _ ("Select notes path");
--			_tmp10_ = (GtkMessageDialog*) gtk_message_dialog_new (NULL, 0, GTK_MESSAGE_ERROR, GTK_BUTTONS_CLOSE, _tmp9_);
-+			_tmp10_ = (GtkMessageDialog*) gtk_message_dialog_new (NULL, 0, GTK_MESSAGE_ERROR, GTK_BUTTONS_CLOSE, "%s", _tmp9_);
- 			g_object_ref_sink (_tmp10_);
- 			error_dialog = _tmp10_;
- 			_tmp11_ = error_dialog;
-@@ -419,7 +419,7 @@ static void xnp_application_update_notes
- 		XfconfChannel* _tmp35_;
- 		const gchar* _tmp36_;
- 		_tmp27_ = _ ("Select notes path");
--		_tmp28_ = (GtkMessageDialog*) gtk_message_dialog_new (NULL, 0, GTK_MESSAGE_ERROR, GTK_BUTTONS_CLOSE, _tmp27_);
-+		_tmp28_ = (GtkMessageDialog*) gtk_message_dialog_new (NULL, 0, GTK_MESSAGE_ERROR, GTK_BUTTONS_CLOSE, "%s", _tmp27_);
- 		g_object_ref_sink (_tmp28_);
- 		error_dialog = _tmp28_;
- 		_tmp29_ = error_dialog;
-@@ -2082,7 +2082,7 @@ static void xnp_application_delete_windo
- 		gint _tmp9_;
- 		_tmp3_ = window;
- 		_tmp4_ = _ ("Are you sure you want to delete this group?");
--		_tmp5_ = (GtkMessageDialog*) gtk_message_dialog_new ((GtkWindow*) _tmp3_, GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_QUESTION, GTK_BUTTONS_YES_NO, _tmp4_);
-+		_tmp5_ = (GtkMessageDialog*) gtk_message_dialog_new ((GtkWindow*) _tmp3_, GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_QUESTION, GTK_BUTTONS_YES_NO, "%s", _tmp4_);
- 		g_object_ref_sink (_tmp5_);
- 		dialog = _tmp5_;
- 		_tmp6_ = dialog;
-@@ -2721,7 +2721,7 @@ void xnp_application_open_settings_dialo
- 		e = _inner_error_;
- 		_inner_error_ = NULL;
- 		_tmp0_ = _ ("Unable to open the settings dialog");
--		_tmp1_ = (GtkMessageDialog*) gtk_message_dialog_new (NULL, GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_ERROR, GTK_BUTTONS_CLOSE, _tmp0_);
-+		_tmp1_ = (GtkMessageDialog*) gtk_message_dialog_new (NULL, GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_ERROR, GTK_BUTTONS_CLOSE, "%s", _tmp0_);
- 		g_object_ref_sink (_tmp1_);
- 		error_dialog = _tmp1_;
- 		_tmp2_ = error_dialog;
---- a/lib/window.c
-+++ b/lib/window.c
-@@ -3542,7 +3542,7 @@ void xnp_window_delete_note (XnpWindow*
- 		GtkMessageDialog* _tmp13_;
- 		gint _tmp14_;
- 		_tmp9_ = _ ("Are you sure you want to delete this note?");
--		_tmp10_ = (GtkMessageDialog*) gtk_message_dialog_new ((GtkWindow*) self, GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_QUESTION, GTK_BUTTONS_YES_NO, _tmp9_);
-+		_tmp10_ = (GtkMessageDialog*) gtk_message_dialog_new ((GtkWindow*) self, GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_QUESTION, GTK_BUTTONS_YES_NO, "%s", _tmp9_);
- 		g_object_ref_sink (_tmp10_);
- 		dialog = _tmp10_;
- 		_tmp11_ = dialog;
diff --git a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb
deleted file mode 100644
index fcf98c181..000000000
--- a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Notes plugin for the Xfce Panel"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-notes-plugin"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit xfce-panel-plugin
-
-DEPENDS += "gtk+ libxfce4ui xfce4-panel xfconf libunique"
-
-SRC_URI += " \
-    file://0001-main-status-icon.c-remove-deprecated-g_type_init.patch \
-    file://01_fix_format-string.patch \
-"
-SRC_URI[md5sum] = "31cb9520b01512a94344770b4befdb3b"
-SRC_URI[sha256sum] = "07a4c3e71431c24f97d2e270452dd0fa51ff0bdb6219a13a20d0bfa8d9de54b2"
-
-FILES_${PN} += "${libdir}/xfce4/panel-plugins/*.so.*"
-
-# *.so are required for plugin detection
-INSANE_SKIP_${PN} = "dev-so"
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 7f1c17261..cd3fa26aa 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -40,7 +40,6 @@ RRECOMMENDS_${PN} = " \
     xfce4-mount-plugin \
     xfce4-powermanager-plugin \
     xfce4-closebutton-plugin \
-    xfce4-notes-plugin \
     xfce4-whiskermenu-plugin \
     xfce4-mailwatch-plugin \
     xfce4-smartbookmark-plugin \
-- 
2.26.2

