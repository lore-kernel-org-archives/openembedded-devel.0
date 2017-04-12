Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 807D577E02
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:16 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u18so5831132wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PyQVTSyqcZwz39M5B28F7YC9+XRkYvVHBY6cKsEBnGg=;
	b=ES2qW6tJx97y8ZhomjXvlX8B/NTAyDElgNbsSXriLPG1rEAvOguYX43chW2mcId/8q
	wH6HbjAzezxAlHsTPuhEyo85mW9MKaY9rE0sY9m58eOMH6WHnJ+syJfWidNn6dxCOSwb
	gL0SMYNJpif0PAQAfAOuy1dAG1DjtFV2hmdV2paYj7vmS3SgeDlCYn50+j2PyA0Rqh48
	mUa/sKiFMNDk4OQykDDJCpZePUQJe7LIfBmJND6JiII3saDMKuyA7nbqsITLuzOOVqs+
	H2hiE1JKKJzY82AfS1yWHIjTJCridk7aFo6p6H2qVdssIVlKRbCXbT4Nk1CkpfCPDsQH
	4d7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PyQVTSyqcZwz39M5B28F7YC9+XRkYvVHBY6cKsEBnGg=;
	b=RJLTS+mCUGXHjqfpiq0rxnP7uynA19bzKFWwecrtekMGrX7l61bcCocVLs91V7grAp
	MotEEdiGRFyq4jimJto0MqRtx5iLSX+HhcArOJ+4euTU9c3+quMA2KzFQI4ULk2YDgrx
	O9PAiM4bu9R87cXBH3iEpiLdTU1h180G3P98kaJG8/hFZUI+C2u6ixhL7yxPKZ95Fwhc
	ia+gsaLn55lK+O7NLZcL4pZc+Tt/quBa4PjeYfJ9DPqgOfsfbOfu4+CdjntAv1BLO7K+
	CyByXmi/o3EU4SLG2bECfzwivn0Dn8nsnx0xkmCUqfgwNf1fLB2E4rEl5LrCbNUFYWeZ
	eK2g==
X-Gm-Message-State: AN3rC/51RYE60hhtrfKP4aPtbh4tzVajQevEA9NhjVKIFrZfI5agQcZFJ2FUN/FWb33Viw==
X-Received: by 10.223.150.120 with SMTP id c53mr4580386wra.85.1492027037138;
	Wed, 12 Apr 2017 12:57:17 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:37 +0200
Message-Id: <20170412195638.3243-29-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 28/29] xarchiver: Upstream printf-fix-patch
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...formatting-string-to-printf-like-function.patch | 40 ----------------------
 meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb  |  6 ++--
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-proper-formatting-string-to-printf-like-function.patch

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-proper-formatting-string-to-printf-like-function.patch b/meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-proper-formatting-string-to-printf-like-function.patch
deleted file mode 100644
index a115883..0000000
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-proper-formatting-string-to-printf-like-function.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From baf93ea9acf845c5455d577ac19a6f680dac3d2d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 30 Mar 2017 11:22:42 -0700
-Subject: [PATCH] Add proper formatting string to printf-like functions
-
-Avoids potential security holes and makes compiler happy
-
-| ../../../../../../../workspace/sources/xarchiver/src/window.c:236:72: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
-|         gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG (dialog),message2);
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/window.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-Index: git/src/window.c
-===================================================================
---- git.orig/src/window.c
-+++ git/src/window.c
-@@ -231,9 +231,9 @@ int xa_show_message_dialog (GtkWindow *w
- {
- 	int response;
- 
--	dialog = gtk_message_dialog_new (window,mode,type,button,message1);
-+	dialog = gtk_message_dialog_new (window,mode,type,button,"%s",message1);
- 	gtk_dialog_set_default_response (GTK_DIALOG (dialog),GTK_RESPONSE_NO);
--	gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG (dialog),message2);
-+	gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG (dialog),"%s",message2);
- 	response = gtk_dialog_run (GTK_DIALOG (dialog));
- 	gtk_widget_destroy (GTK_WIDGET (dialog));
- 	return response;
-@@ -511,7 +511,7 @@ void xa_list_archive (GtkMenuItem *menui
- 			g_fprintf (stream,_("Comment:\n"));
- 			if (bp)
- 				g_fprintf(stream,"</b><pre>");
--			g_fprintf (stream,archive[idx]->comment->str);
-+			g_fprintf (stream,"%s",archive[idx]->comment->str);
- 			if (bp)
- 				g_fprintf(stream,"</pre>");
- 			g_fprintf (stream,"\n");
diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
index ea34a52..e275af0 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
@@ -7,10 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+ glib-2.0 xfce4-dev-tools-native intltool-native"
 
-SRC_URI = "git://github.com/schnitzeltony/xarchiver.git;branch=master \
-           file://0001-Add-proper-formatting-string-to-printf-like-function.patch \
-           "
-SRCREV = "e80e90528c9aab2fe36d9078b945b44c05cc20d3"
+SRC_URI = "git://github.com/schnitzeltony/xarchiver.git;branch=master"
+SRCREV = "5a26dd8ceab0af71b30c83286d7c7398a858c814"
 PV = "0.5.3"
 S = "${WORKDIR}/git"
 
-- 
2.9.3


