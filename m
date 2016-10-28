Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C73C571DC0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 21:00:01 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m83so8989891wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 14:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=jwkLyp+HuEIPCtlPa04pSA4nGIbm1nYH4g6+fFpopV8=;
	b=UH5Of+chZ97ugg47ZKmGgI2D7rdkzq8ohNotxjG/we74cfAuxjq2Xro8Pk13QWXBHT
	R6SLAKYc7w4ZZGks0X+c0n8UpUk1Rzl0+3vRDnEA2ei8PXXMpn6tHRqw7RCkkjN5v6wb
	fzulT6MfILE6rWh8KvcIL98UtEYrYSBkOTTi78LkhhO0YdaNQdl402H8kEi6+/YvXeXQ
	UnXJnZi1M1NIKcNq2NNt/E3vXFYPNjhsiCcdijI+/QzMISzgxCsjYTMimypu7pXUWWte
	+uvaAgKdeHfcMBADlGpIJ3CgkkyX45CapG9DtdjX/h6VjgLGon47iFX/Q3DZVNZAuGhp
	weiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jwkLyp+HuEIPCtlPa04pSA4nGIbm1nYH4g6+fFpopV8=;
	b=Gm/7LWrWYwBLDn6K7jEnMep84LzEOq24TZ7p7GzCuvE8OeFLbW8GvcTjrGrRfC127X
	iCNT15G10/JTA0608kwfND9aFbxjsHvtKx9tdLLPjBfLH0Fzy5vU7CMGOnGHDvjZos4Q
	ScdgrRfiB7jkn6OnfmEVnMnkMNMDU7NsK6D5J8yXWsJEhHF6K108WKhTojvzScRPYFQ4
	A5MN5R3T5v0+vxlzJP/qxSXfNcoMhIiAeuJsZnbV2Cel7qNFq8wbKv6qY9f5dbqyQ66l
	kxudfyi3Y1VnHR+W8n230wUjwVedxMen5cXkhFyrFjbiXxdEgsAs6/JFnGQ4Sb0UIT+Y
	Vf2w==
X-Gm-Message-State: ABUngvdus8IxmvamUC4CEl0rFg+bzCuM79lpxT0qtMebYHWzL2ViYHbKoAniA2YMWFKBMg==
X-Received: by 10.28.30.143 with SMTP id e137mr464877wme.96.1477688402774;
	Fri, 28 Oct 2016 14:00:02 -0700 (PDT)
Received: from localhost.localdomain (p4FDF08E7.dip0.t-ipconnect.de.
	[79.223.8.231]) by smtp.googlemail.com with ESMTPSA id
	ya1sm15955329wjb.23.2016.10.28.14.00.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Oct 2016 14:00:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Oct 2016 22:59:50 +0200
Message-Id: <1477688390-25172-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1477688390-25172-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477688390-25172-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH] exo: unbreak Thunar's detailed file view
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
X-List-Received-Date: Fri, 28 Oct 2016 21:00:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

see further details at [1]

[1] https://bugzilla.xfce.org/show_bug.cgi?id=12916

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...e-fix-for-Thunar-detailed-view-Xfce-12916.patch | 36 ++++++++++++++++++++++
 meta-xfce/recipes-xfce/exo/exo_0.11.1.bb           |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/exo/exo/0001-Probable-fix-for-Thunar-detailed-view-Xfce-12916.patch

diff --git a/meta-xfce/recipes-xfce/exo/exo/0001-Probable-fix-for-Thunar-detailed-view-Xfce-12916.patch b/meta-xfce/recipes-xfce/exo/exo/0001-Probable-fix-for-Thunar-detailed-view-Xfce-12916.patch
new file mode 100644
index 0000000..16f12fe
--- /dev/null
+++ b/meta-xfce/recipes-xfce/exo/exo/0001-Probable-fix-for-Thunar-detailed-view-Xfce-12916.patch
@@ -0,0 +1,36 @@
+From fea2619e6d07ac72b2eff6f408bb3daa2dbdf671 Mon Sep 17 00:00:00 2001
+From: Sean Davis <smd.seandavis@gmail.com>
+Date: Thu, 27 Oct 2016 20:31:36 -0400
+Subject: [PATCH] Probable fix for Thunar detailed view (Xfce #12916)
+
+Upstream-Status: Pending [1-2]
+
+[1] https://git.xfce.org/xfce/exo/commit/?id=fea2619e6d07ac72b2eff6f408bb3daa2dbdf671
+[2] https://bugzilla.xfce.org/show_bug.cgi?id=12916
+
+---
+ exo/exo-tree-view.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/exo/exo-tree-view.c b/exo/exo-tree-view.c
+index 8c8564f..2d0fc04 100644
+--- a/exo/exo-tree-view.c
++++ b/exo/exo-tree-view.c
+@@ -385,13 +385,9 @@ exo_tree_view_button_press_event (GtkWidget      *widget,
+         }
+     }
+ 
+-  /* see bug http://bugzilla.xfce.org/show_bug.cgi?id=6230 for more information */
+   if (G_LIKELY (gtk_tree_selection_get_select_function (selection) == (GtkTreeSelectionFunc) exo_noop_false))
+     {
+-      /* just reset the select function (previously set to exo_noop_false),
+-       * there's no clean way to do this, so what the heck.
+-       */
+-      gtk_tree_selection_set_select_function (selection, NULL, NULL, NULL);
++      gtk_tree_selection_set_select_function (selection, (GtkTreeSelectionFunc) exo_noop_true, NULL, NULL);
+     }
+ 
+   /* release the path (if any) */
+-- 
+2.5.5
+
diff --git a/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb b/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb
index 92155f2..0b0353b 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb
@@ -11,6 +11,7 @@ inherit xfce pythonnative perlnative gtk-doc
 SRC_URI += " \
     file://exo-no-tests-0.8.patch \
     file://configure.patch \
+    file://0001-Probable-fix-for-Thunar-detailed-view-Xfce-12916.patch \
 "
 
 SRC_URI_append_class-native = " \
-- 
2.5.5


