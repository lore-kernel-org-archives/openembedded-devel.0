Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CE4CAC5BF
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:39 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.11275.1726716754528433199
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tZqKj65V;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716755; x=1758252755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TyCh35T9X+Gg9+myzqGGSLaHzA1bhm6OjAdXavhcJ2M=;
  b=tZqKj65VttKQHNsv85167EiE2L194dlarPSjDv0Eay5gEjtJdrOWjkYn
   euuTWyjf6bdBhWlnJQUqyiiw4LrGucko1GrpYNe6ZTM/qQnJW1AXfEj+L
   4DSDXUCYoZDfKbTmZld9cbNt9MDOoDTZEf/owo0awE7Ax/tHDWDiqy84L
   3Raiu40KevBF8ERlQFB+unxpb7lA+3ImMAbk6BsQBNAWLIZXY6BZg4huQ
   pkKWXbbuRhDFXP0hN6EofKCs75ElnmT7p7ahwlVj3bLVsJgIzhkRvhEDk
   KCIthRgWai+v9LlK/H4+vo481NxJdV8J3LrLjcMR6rmIOa7MluUxQ0TJF
   g==;
X-CSE-ConnectionGUID: MS0M88V0Q8ySNFVZNI1T5A==
X-CSE-MsgGUID: rqUycdcISd29cXi0OPBgSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="174141220"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="174141220"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BAF43D424E
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 04D6CBF3D8
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AAEF20086EB0
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1847B1A000A;
	Thu, 19 Sep 2024 11:32:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 05/28] gnome-font-viewer: upgrade 46.0 -> 47.0
Date: Thu, 19 Sep 2024 11:31:50 +0800
Message-Id: <1726716733-14548-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10--0.986300-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yWrRghnYv51qTfK5j0EZbyvT+1Zj+w66+n5G
	W6yaM2iCRexsVN65tZAeHoET/miP6hlpzI21k6vRqhcdnP91eXEnhzAhgvoq599RlPzeVuQQli+
	BaqMwTNo1gIHPPGxSe9nl43V4kx2lWkIi5GvRHEo/QdUh6LEl0ME5XPQnBzGXR/IzlV+CMbbT0P
	pHDbMis8r7TjBuVpgIRvkf/vNMm0EzqT0XojQkwDOgNHhlU7YMJScvOTX4jHPyqwa29Qy9Fd2gi
	q5xRdMLMOWMz759+cnxi/Rhn66OwrUd2R7XKvn3tAlV2L6pgFHdKRNjzo2IOEBl2WTrgZIjo8WM
	kQWv6iXBcIE78YqRWo6HM5rqDwqthHiZQsItqYznFyztWa75TDOgDHcA4ek8dGQrALeRekldrBa
	TW615lPLJNsmRFd6DaqzRWl77/rAEDH7/aB47jStrRyetH3nrHSbhGbmGylXFJK7yLnZRGZdO3Q
	67ImL8gi4RUz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112371

From: Wang Mingyu <wangmy@fujitsu.com>

0001-window-Fix-function-callback-definition.patch
removed since it's included in 47.0

Changelog:
=========
* Set application name and icon
* Remove unused dependency on gnome-desktop
* Add slant preview
* Fix install button mnemonic
* Fix the "Install" button stuck in "Installing" when font install is successful
* Use adaptive dialogs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...dow-Fix-function-callback-definition.patch | 43 -------------------
 ...ewer_46.0.bb => gnome-font-viewer_47.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-window-Fix-function-callback-definition.patch
 rename meta-gnome/recipes-gnome/gnome-font-viewer/{gnome-font-viewer_46.0.bb => gnome-font-viewer_47.0.bb} (71%)

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-window-Fix-function-callback-definition.patch b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-window-Fix-function-callback-definition.patch
deleted file mode 100644
index be4c002fc..000000000
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-window-Fix-function-callback-definition.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ac4a07e7ef3d9d046a4ca2a803c5b649b6f7ddf4 Mon Sep 17 00:00:00 2001
-From: Matt Turner <mattst88@gmail.com>
-Date: Sat, 8 Jul 2023 00:01:07 -0400
-Subject: [PATCH] window: Fix function callback definition
-
-Without this, the build fails with clang with
-CFLAGS=-Werror=incompatible-function-pointer-types
-
-```
-../src/font-view-window.c:864:77: error: incompatible function pointer types passing 'void (FontViewWindow *)' (aka 'void (struct _FontViewWindow *)') to parameter of type 'GtkWidgetActionActivateFunc' (aka 'void (*)(struct _GtkWidget *, const char *, struct _GVariant *)') [-Wincompatible-function-pointer-types]
-  gtk_widget_class_install_action (widget_class, "win.toggle-search", NULL, action_toggle_search_cb);
-                                                                            ^~~~~~~~~~~~~~~~~~~~~~~
-/usr/include/gtk-4.0/gtk/gtkwidget.h:956:87: note: passing argument to parameter 'activate' here
-                                                         GtkWidgetActionActivateFunc  activate);
-                                                                                      ^
-```
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-font-viewer/-/merge_requests/54]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/font-view-window.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/font-view-window.c b/src/font-view-window.c
-index 639ac33..24461f7 100644
---- a/src/font-view-window.c
-+++ b/src/font-view-window.c
-@@ -758,8 +758,11 @@ font_view_window_show_overview (FontViewWindow *self)
- }
- 
- static void
--action_toggle_search_cb (FontViewWindow *self)
-+action_toggle_search_cb (GtkWidget  *widget,
-+                         const char *action_name,
-+                         GVariant   *parameter)
- {
-+  FontViewWindow *self = FONT_VIEW_WINDOW (widget);
- 
-  gtk_toggle_button_set_active (self->search_button,
-                                !gtk_toggle_button_get_active (self->search_button));
--- 
-2.45.1
-
diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_46.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_47.0.bb
similarity index 71%
rename from meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_47.0.bb
index ccf8262dc..4763d1717 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_47.0.bb
@@ -15,8 +15,7 @@ inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI += "file://0001-window-Fix-function-callback-definition.patch"
-SRC_URI[archive.sha256sum] = "592f401e485d02cc044d487bb5c8e04c961da6856216768a59f1ff98bd2d537c"
+SRC_URI[archive.sha256sum] = "b8e5a042e0b241b0c7cae43f74da0d5f88e6423017a91feb86e7617edb4080ed"
 
 FILES:${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.34.1


