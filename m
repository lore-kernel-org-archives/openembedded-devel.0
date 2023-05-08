Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C341C77B73
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:10:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.103684.1683540613783318427
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KBzKTVPg;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540612; i=@fujitsu.com;
	bh=ktjBJl8WD3HkWQ/KbXiZJAYQbjfdP/M4aNvm996OFsU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=KBzKTVPgJNXhv4uL3rcIm/JWtTf8nIZM/PmDOtgsdvL3XyxRHZReZfvUnGUzx9OTf
	 XAdpeEqNnOCYrsUryHIJopv40bp2cT22ilXwxak6IDQ85VsBFardMJMpC8S9Mu1OGw
	 tcEuSRLkKa2KEDf8IAb9kdGYpEOw0d53jcnrGg6HCmjd7uYBau40OcHwKeC4wZc2km
	 hzY8fCTOmxqKxMc8OlOOCeTkaIK60RBXrZ3bARF0eXTUaMg+FuJiCDOuo1kCQ1SnSc
	 pU5PcE7BcIwl++BDNvooEhTHU3PsU5If/j+VlA0lNOgV02Q5t08Sik9SJuKpRYv4h2
	 nY70sYWgz8UpA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmkeJIrShJLcpLzFFi42Kxs+FI0m0+FZF
  i0LtDw+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzfi25yB7wTHFin+33rA2MC6U7WLk4hAS2Mgo
  MfHBR2YIZxqTRO/ry+xdjJwcbAISEtP3ngSzRQR0JT5+mMsIYjMLqEjMmHyECcQWFnCU2LcCp
  JmTg0VAVeJT42IWEJtXwEni8KlLYLaEgILElIfvwWo4BZwl7ty7C9YrBFTz5uN/NogaNYmr5z
  YxT2DkWcDIsIrRtDi1qCy1SNdYL6koMz2jJDcxM0cvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+
  4Mjc5J0UvL7VkEyMwJFKKleV2MJ7e+VfvEKMkB5OSKK/pwbAUIb6k/JTKjMTijPii0pzU4kOM
  MhwcShK8bdsiUoQEi1LTUyvSMnOA4QmTluDgURLhlT0ClOYtLkjMLc5Mh0idYjTm+HDoyl5mj
  k37ug4wC7Hk5eelSonzVp4EKhUAKc0ozYMbBIubS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJ
  WEeTefAJrCk5lXArfvFdApTECn+F8OBzmlJBEhJdXApKAWys7vsatiH7fytQv9u/dk/j6hrc9
  z99vHalkm1T/fWVbwuEWveVIlZiYaq/DZ54NmpPru5S8mP3y5zktwY23Xm6uX57zdwfTLb8WM
  XzqNIZ/fLv34sqxLxUlP+p2A/4ob3Jkav8O/LRDZcuzlh6W25X6Lf2hMPRk+d0fopOlLXdfyx
  95+6c8V7GR28s/jHck3eyesnqH41VnK1Ub8b7VPwf/Pn/6cVY/XUuvYzR28c7mg2F711tDvUx
  7+mcDjnvW/69hKXQMJzzqDyoS0zIrpr26b7F6r+Eb0V+kRqUahsDkKiobPqxVWhj/vnvz25MO
  uV+c2P9xUxfd8n+PL6vs1535aGT9j85w4ReG2VYoSS3FGoqEWc1FxIgBRGhgqFgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-548.messagelabs.com!1683540611!224623!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30575 invoked from network); 8 May 2023 10:10:11 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:10:11 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 644381D2;
	Mon,  8 May 2023 11:10:11 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 8AC791C2;
	Mon,  8 May 2023 11:10:10 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] nautilus: upgrade 44.0 -> 44.1
Date: Mon,  8 May 2023 18:09:57 +0800
Message-Id: <1683540600-25325-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683540600-25325-1-git-send-email-wangmy@fujitsu.com>
References: <1683540600-25325-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102402

From: Wang Mingyu <wangmy@fujitsu.com>

0001-initialize-GdkDragAction-action-to-0.patch
removed since it's included in 44.1

Changelog:
==========
* Resolve some crashes
* Visual bugfixes:
  - Tweak style colors in view items
  - Show custom emblems from extensions again
  - Relayout SELinux property row
  - Flip switches correctly
* Other bugfixes:
  - Disable some actions when not useful
  - Fix dead characters handling in batch rename dialog
  - Fix crashes when rapidly opening and closing windows
  - Prevent location change when autofs timeouts
  - Fix issues with translations in libadwaita widgets
  - Drop workarounds for fixed GTK bugs
  - Fix other issues
* Enhancements:
  - Dismiss toast on undo
  - Select right items after some operations
  - Paste into expanded folders
  - Allow extraction of .tar.zst and .zstd archives
  - Performance optimization
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...initialize-GdkDragAction-action-to-0.patch | 47 -------------------
 .../{nautilus_44.0.bb => nautilus_44.1.bb}    |  3 +-
 2 files changed, 1 insertion(+), 49 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/0001-initialize-GdkDragAction-action-to-0.patch
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_44.0.bb => nautilus_44.1.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-initialize-GdkDragAction-action-to-0.patch b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-initialize-GdkDragAction-action-to-0.patch
deleted file mode 100644
index abe584874c..0000000000
--- a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-initialize-GdkDragAction-action-to-0.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From d8f8859369b228d86aeeb043d732b9c60fdce289 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 24 Mar 2023 15:29:04 -0700
-Subject: [PATCH] initialize GdkDragAction action to 0
-
-This helps in silencing clang found warning
-
-autilus-pathbar.c:759:9: error: variable 'action' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
-    if (G_VALUE_HOLDS (value, GDK_TYPE_FILE_LIST))
-        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/1158]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/nautilus-pathbar.c | 2 +-
- src/nautilus-window.c  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/nautilus-pathbar.c b/src/nautilus-pathbar.c
-index 1b6ea6a..a5ab780 100644
---- a/src/nautilus-pathbar.c
-+++ b/src/nautilus-pathbar.c
-@@ -746,7 +746,7 @@ on_drag_motion (GtkDropTarget *target,
-                 gpointer       user_data)
- {
-     ButtonData *button_data = user_data;
--    GdkDragAction action;
-+    GdkDragAction action = 0;
-     const GValue *value;
-     graphene_point_t start;
- 
-diff --git a/src/nautilus-window.c b/src/nautilus-window.c
-index 30299b1..74c548f 100644
---- a/src/nautilus-window.c
-+++ b/src/nautilus-window.c
-@@ -1476,7 +1476,7 @@ extra_drag_value_cb (AdwTabBar    *self,
- {
-     NautilusWindowSlot *slot = NAUTILUS_WINDOW_SLOT (adw_tab_page_get_child (page));
-     g_autoptr (NautilusFile) file = nautilus_file_get (nautilus_window_slot_get_location (slot));
--    GdkDragAction action;
-+    GdkDragAction action = 0;
- 
-     if (value == NULL)
-     {
--- 
-2.40.0
-
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_44.0.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_44.0.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb
index e066556177..9c60d15d86 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_44.0.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb
@@ -26,8 +26,7 @@ inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI += "file://0001-initialize-GdkDragAction-action-to-0.patch"
-SRC_URI[archive.sha256sum] = "57b99ebb8e2b9c1512d381e53096188c087b33410d6c52d87a27bd60ee76ac7f"
+SRC_URI[archive.sha256sum] = "360802a595e3edbad962c8cea353b62baa8be407513b5162c89c933ca5387aa9"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-- 
2.34.1


