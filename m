Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id C0A8C77E55
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:48 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 81so18583890pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ULsBflLudffA1tLA/iwob6NxauD83Cauw7KEXBJdCMo=;
	b=JF78OmKIXHac2ad1f0yU6ammpjJU5yOB74mW6vV6JXDGEFrvXmjAlEz/Q2nbJEHD2f
	gDozp5GoUi2hDFshN/9YR33jPpMbjw+S/itHSZXkqPqZqosG4Z6no2N5a3GW72VIqf4W
	Sk6snzhi9NBvV5dNkfqIT/wkvWIFG3FEjwQyu9MGGJRdyDuNzeGQwOkUbT3gOppT9BL5
	gkSGmboHa5tCZ0HpyL4S0PADXuDWfe09X1W5ZI5kPoVM7mKGwJWUWeFQ4DbyKJUKhArd
	wq77ODDEz2HUjXU6dxR8roIWx/doM3gfd7235RJJskScqX+SshUb0NmF9GrzEGZiN/Ka
	/Eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ULsBflLudffA1tLA/iwob6NxauD83Cauw7KEXBJdCMo=;
	b=EDiWJEKfCnoH+LX43vHxXLTiTxDQNZUmSkxXfHAp2mFsM04iFNRbA1bl8WzCShJ29C
	L4DKtXlMSw0WnyzZEhOcDzRnAl8vk8s0Jip0yFKp+A08facXHPikp3pwdHVPcY8co+6v
	UafBMlV6udfifk/piBNHjgwBU1r7XogYW2Y0s7yjcQs91PvFbxsImp13tNNfxdjAGhdq
	h5M9iK0or2OykB/wnC+Y7raP4pacXaXdz9aiWJ7vQWtkB246rcPW4sGcs+xtFKaSYXli
	zA07An4fHUWoORGFVr3jJ04oNgl5f7pjO2LTdKqNL1y2qpMpdDZKkPj0FtyboYWIzDwJ
	GNnQ==
X-Gm-Message-State: AFeK/H0GApXtN5t0OiJsYbHQDP47dZT++uVHB1WLLoCjBUkNA3crgiqND8SOTHa7bVGxkQ==
X-Received: by 10.98.87.216 with SMTP id i85mr3813248pfj.151.1490978629881;
	Fri, 31 Mar 2017 09:43:49 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:41 -0700
Message-Id: <20170331164247.5052-37-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 37/43] xarchiver: Fix build with security flags turned on
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:49 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...formatting-string-to-printf-like-function.patch | 43 ++++++++++++++++++++++
 meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb  |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-proper-formatting-string-to-printf-like-function.patch

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-proper-formatting-string-to-printf-like-function.patch b/meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-proper-formatting-string-to-printf-like-function.patch
new file mode 100644
index 000000000..2d7eb9a5d
--- /dev/null
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-proper-formatting-string-to-printf-like-function.patch
@@ -0,0 +1,43 @@
+From baf93ea9acf845c5455d577ac19a6f680dac3d2d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 30 Mar 2017 11:22:42 -0700
+Subject: [PATCH] Add proper formatting string to printf-like functions
+
+Avoids potential security holes and makes compiler happy
+
+| ../../../../../../../workspace/sources/xarchiver/src/window.c:236:72: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
+|         gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG (dialog),message2);
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/window.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/window.c b/src/window.c
+index ca2f69f..3b10e2c 100644
+--- a/src/window.c
++++ b/src/window.c
+@@ -231,9 +231,9 @@ int xa_show_message_dialog (GtkWindow *window,int mode,int type,int button,const
+ {
+ 	int response;
+ 
+-	dialog = gtk_message_dialog_new (window,mode,type,button,message1);
++	dialog = gtk_message_dialog_new (window,mode,type,"%s",button,message1);
+ 	gtk_dialog_set_default_response (GTK_DIALOG (dialog),GTK_RESPONSE_NO);
+-	gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG (dialog),message2);
++	gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG (dialog),"%s",message2);
+ 	response = gtk_dialog_run (GTK_DIALOG (dialog));
+ 	gtk_widget_destroy (GTK_WIDGET (dialog));
+ 	return response;
+@@ -511,7 +511,7 @@ void xa_list_archive (GtkMenuItem *menuitem,gpointer data)
+ 			g_fprintf (stream,_("Comment:\n"));
+ 			if (bp)
+ 				g_fprintf(stream,"</b><pre>");
+-			g_fprintf (stream,archive[idx]->comment->str);
++			g_fprintf (stream,"%s",archive[idx]->comment->str);
+ 			if (bp)
+ 				g_fprintf(stream,"</pre>");
+ 			g_fprintf (stream,"\n");
+-- 
+2.12.1
+
diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
index ca299223d..ea34a52c1 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+ glib-2.0 xfce4-dev-tools-native intltool-native"
 
-SRC_URI = "git://github.com/schnitzeltony/xarchiver.git;branch=master"
+SRC_URI = "git://github.com/schnitzeltony/xarchiver.git;branch=master \
+           file://0001-Add-proper-formatting-string-to-printf-like-function.patch \
+           "
 SRCREV = "e80e90528c9aab2fe36d9078b945b44c05cc20d3"
 PV = "0.5.3"
 S = "${WORKDIR}/git"
-- 
2.12.1


