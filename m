Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3394D71CB8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:21 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id a188so486100pfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FSZ829Kq55eO5gHVKU+WiehqqMaURr+btH/L2+5geoQ=;
	b=kOXrn6RG4PxYr5FdNHXYOP0ghZwEkuXXs+nfu3RFmEr4N44iBWRuo3AAwTNgJgwVi5
	4BkRw167AamphKrvYGcDXlVL8HE270Mx7eJwMj3w/vpTJp8EmoDWRMeE68RzDoReSEDd
	xyyHg8tAkq//AoUQg066kHn93csc5MWdEKuAsIv52ssRIwRt1G4pMDA+MaDYyEg95PFf
	xMK4QSEnCXgqPnq/iyhYNzyjhDv+etcolbjv+dddr4MckX+Z3MGyQ7ZQb+jP/kWhMtNg
	ySZw/mqu/PofLs0kWUWPVNDBpUOAmAvAYaVZujItKRlc68lt2zfnM/00vmkWAkiytjZL
	pXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FSZ829Kq55eO5gHVKU+WiehqqMaURr+btH/L2+5geoQ=;
	b=dJ6D0YbVsg32IqdBVRpJwv0OQEsU/E+EJNE17+KhEtjN4Vh8tn97xm5a/i4IcduHKO
	7ibm/bB/yjEwY06/om9Z4Wu+CtOpZYyYMBj63/ch4lbxZYkp99bul1uV0EQgRKll13wL
	Vt8TUj8wDQlQvw7nvQEpPuz0obCmHw2BER66MMtgvx9EIIPbQrbfQS5rja3aK5twiDHx
	3PK1odphPEA82PQaiVMIawR3Oc+EW0kMkCQqT5ISnpfL1aFVzKO8LRi3hRMznvAWGmFq
	FMyxgsdQMnG69Focs+ic6fW1Uo58y/LBmYsxgQ3L1dTtiznCpeYAFaURWGSbtd3CEGK4
	Rs+g==
X-Gm-Message-State: AN3rC/4UrUrRQci9o4fkobkK176QvUFdxN4HVyugeUuw+cZOrYi8qi5T
	LwE01g4ABGZoEw==
X-Received: by 10.99.215.85 with SMTP id w21mr19167560pgi.217.1492539743202;
	Tue, 18 Apr 2017 11:22:23 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:30 -0700
Message-Id: <20170418182142.27253-20-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-xfce][ 20/32] xfce4-notes-plugin: Fix format string errors
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:22 -0000

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


