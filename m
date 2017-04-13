Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 42F6577D5F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:44 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id c198so33255280pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FSZ829Kq55eO5gHVKU+WiehqqMaURr+btH/L2+5geoQ=;
	b=I8or9rIXmw24PlgRksvCJIZmIKP/Gon0+mHUU3233YY6Ofjxsfb1H9vERj5tbzgsLl
	qVkXziyP48YLpccWBLT4ZjbQ7UkYIfNfNP76Ys4TbtC/FCkv40osK0J3HsjQieFuvxiT
	m7LlcZ7VehE8mX2Z7PxcDtXMiewKrU0A3WfOzT6d5Cam4p8QNOEYTkGt+bd8mLLYFuKg
	IDFmmoBZTrUTKs54IARdz6nmAFPwj6PqKax5lC09+GoxyfzyG2rHgR4XVjeu7sn+pg3/
	BmoMsurJe165EQvVSb9WU5PBLyE141m6kKV1zG5gAnIXG37Ij/1dgBqlKipQqJIaUzdf
	5LOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FSZ829Kq55eO5gHVKU+WiehqqMaURr+btH/L2+5geoQ=;
	b=k5kj/+dSJbF3zYdz95BkPIRwytD1JfYmmhCpgQ0huEK47Y4mHPboEqwROEuCO4TFm7
	19ROozkPA6QZikCeSCFsl0do3d0zBY8oeP2NUpwSROdNVrk1bX4ZQiCd7fLRl/jgwOAJ
	f/t5EQbLUYXzvDU/C9dj9Fq3hrjnAZLnOl8k98xM4T/Hm99yUpmwfgf2DQHJcDE+kkY8
	DqMtY9feqON/Ql4pJw5eMf9gCndI0hj/v/ujZLemk7N5rliYHbIwOX76DjZfxGIp3onr
	58Cd83q/H1L0EV5lAom2b8BwHOHPO42YbbIW5AOMjsrjkE8V8GpaMoQBGS9JRSpndbe2
	d6oA==
X-Gm-Message-State: AN3rC/5ZkIfkl0QEbxMoh4mBDEPu9xC5Mrbbb/0mCyuko0T0n/UP9Cwz
	TDhggqdUNGhqjg==
X-Received: by 10.84.216.91 with SMTP id f27mr5318234plj.130.1492116106529;
	Thu, 13 Apr 2017 13:41:46 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:40:56 -0700
Message-Id: <20170413204106.30679-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-xfce][ 19/29] xfce4-notes-plugin: Fix format string errors
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../notes/files/01_fix_format-string.patch         | 53 ++++++++++++++++++++++
 .../notes/xfce4-notes-plugin_1.8.1.bb              |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/notes/files/01_fix_format-string.patch

diff --git a/meta-xfce/recipes-panel-plugins/notes/files/01_fix_format-string.patch b/meta-xfce/recipes-panel-plugins/notes/files/01_fix_format-string.patch
new file mode 100644
index 000000000..8066df004
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/notes/files/01_fix_format-string.patch
@@ -0,0 +1,53 @@
+Fix formatting strings when compiling with Wformat options
+
+Imported from debian
+
+--- a/lib/application.c
++++ b/lib/application.c
+@@ -352,7 +352,7 @@ static void xnp_application_update_notes
+ 			XfconfChannel* _tmp16_;
+ 			const gchar* _tmp17_;
+ 			_tmp9_ = _ ("Select notes path");
+-			_tmp10_ = (GtkMessageDialog*) gtk_message_dialog_new (NULL, 0, GTK_MESSAGE_ERROR, GTK_BUTTONS_CLOSE, _tmp9_);
++			_tmp10_ = (GtkMessageDialog*) gtk_message_dialog_new (NULL, 0, GTK_MESSAGE_ERROR, GTK_BUTTONS_CLOSE, "%s", _tmp9_);
+ 			g_object_ref_sink (_tmp10_);
+ 			error_dialog = _tmp10_;
+ 			_tmp11_ = error_dialog;
+@@ -419,7 +419,7 @@ static void xnp_application_update_notes
+ 		XfconfChannel* _tmp35_;
+ 		const gchar* _tmp36_;
+ 		_tmp27_ = _ ("Select notes path");
+-		_tmp28_ = (GtkMessageDialog*) gtk_message_dialog_new (NULL, 0, GTK_MESSAGE_ERROR, GTK_BUTTONS_CLOSE, _tmp27_);
++		_tmp28_ = (GtkMessageDialog*) gtk_message_dialog_new (NULL, 0, GTK_MESSAGE_ERROR, GTK_BUTTONS_CLOSE, "%s", _tmp27_);
+ 		g_object_ref_sink (_tmp28_);
+ 		error_dialog = _tmp28_;
+ 		_tmp29_ = error_dialog;
+@@ -2082,7 +2082,7 @@ static void xnp_application_delete_windo
+ 		gint _tmp9_;
+ 		_tmp3_ = window;
+ 		_tmp4_ = _ ("Are you sure you want to delete this group?");
+-		_tmp5_ = (GtkMessageDialog*) gtk_message_dialog_new ((GtkWindow*) _tmp3_, GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_QUESTION, GTK_BUTTONS_YES_NO, _tmp4_);
++		_tmp5_ = (GtkMessageDialog*) gtk_message_dialog_new ((GtkWindow*) _tmp3_, GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_QUESTION, GTK_BUTTONS_YES_NO, "%s", _tmp4_);
+ 		g_object_ref_sink (_tmp5_);
+ 		dialog = _tmp5_;
+ 		_tmp6_ = dialog;
+@@ -2721,7 +2721,7 @@ void xnp_application_open_settings_dialo
+ 		e = _inner_error_;
+ 		_inner_error_ = NULL;
+ 		_tmp0_ = _ ("Unable to open the settings dialog");
+-		_tmp1_ = (GtkMessageDialog*) gtk_message_dialog_new (NULL, GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_ERROR, GTK_BUTTONS_CLOSE, _tmp0_);
++		_tmp1_ = (GtkMessageDialog*) gtk_message_dialog_new (NULL, GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_ERROR, GTK_BUTTONS_CLOSE, "%s", _tmp0_);
+ 		g_object_ref_sink (_tmp1_);
+ 		error_dialog = _tmp1_;
+ 		_tmp2_ = error_dialog;
+--- a/lib/window.c
++++ b/lib/window.c
+@@ -3542,7 +3542,7 @@ void xnp_window_delete_note (XnpWindow*
+ 		GtkMessageDialog* _tmp13_;
+ 		gint _tmp14_;
+ 		_tmp9_ = _ ("Are you sure you want to delete this note?");
+-		_tmp10_ = (GtkMessageDialog*) gtk_message_dialog_new ((GtkWindow*) self, GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_QUESTION, GTK_BUTTONS_YES_NO, _tmp9_);
++		_tmp10_ = (GtkMessageDialog*) gtk_message_dialog_new ((GtkWindow*) self, GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_QUESTION, GTK_BUTTONS_YES_NO, "%s", _tmp9_);
+ 		g_object_ref_sink (_tmp10_);
+ 		dialog = _tmp10_;
+ 		_tmp11_ = dialog;
diff --git a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb
index 313534b21..fcf98c181 100644
--- a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb
+++ b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb
@@ -9,6 +9,7 @@ DEPENDS += "gtk+ libxfce4ui xfce4-panel xfconf libunique"
 
 SRC_URI += " \
     file://0001-main-status-icon.c-remove-deprecated-g_type_init.patch \
+    file://01_fix_format-string.patch \
 "
 SRC_URI[md5sum] = "31cb9520b01512a94344770b4befdb3b"
 SRC_URI[sha256sum] = "07a4c3e71431c24f97d2e270452dd0fa51ff0bdb6219a13a20d0bfa8d9de54b2"
-- 
2.12.2


