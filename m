Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FB5C87FD2
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:10 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.4282.1753153984138436528
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hn6Jjqrm;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153984; x=1784689984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eOpjOOOm6FeteG66U+msPdQqhMiV6b3PuXZOMfXrnm4=;
  b=hn6Jjqrms+gQruhvMhOWF4kQF3+sirNZzHZku+GZDlycAqp4ZK63JtF0
   MXugg3ZYRh674J9fw5IQZsWnpR48ZZLGzz0Ow5zXNwBCtBTIJLwn8cbaB
   6kIHHjoANR7UZil6AfYgoBIaVeAmGlviHNEm7a2Pqwv95wvWZ6X6CZOu+
   Dj/TJnmmWN1fYCWvhnUrd3u1JanopyVM13Ootv4WrjWFMB+IFwx+YbnWD
   reF8IBBnWto4mHfPUy2dKYpvoCWd3nnps1ze+/rlRRblz2n2QiMrFzgvX
   P7+tFjfI/vO7aOGr/9jXHD5wL4XlV+pEmuk+10F0NPy89KjD3lSmvIogI
   g==;
X-CSE-ConnectionGUID: 7W7hwddXS0CfgDTbgf0QXw==
X-CSE-MsgGUID: FowrKSgmTseo8ll8z8QH8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="185871544"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="185871544"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:02 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 629C61002B82
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:02 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id CB0C58D65D6
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:01 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E6B351A0074;
	Tue, 22 Jul 2025 11:12:58 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-gnome] [PATCH 03/21] mutter: upgrade 48.0 -> 48.4
Date: Tue, 22 Jul 2025 11:12:11 +0800
Message-ID: <20250722031245.884-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118666

Changelog:
===========
48.4
====
* Unlink outputs from unused connectors in update_outputs [Michel; !4474]
* Add speed limit to Visual alerts [Sergio; !4487]
* Fix behavior of windows that get activated before mapped [Alessandro; !4462]
* Fix incorrect cursor over Xwayland clients [Carlos; !4433]
* Fix hi-res scroll events getting converted to flip-flopping discrete events
  [Peter; !4459]
* Fixed crash [Daniel; !4303]
* Misc. bug fixes and cleanups [Alessandro, Jonas, Jordan, Alessandro, Corentin,
  Daniel, Lukáš, Rémi, Michel; !4481, !4482, !4485, !4492, !4496, !4495, !4444,
  !4447, !4442, !4452]

48.3.1
======
* Fix Xwayland windows becoming unresponsive to events [Jonas; !4475]
* Fix drag and drop of tabs into tiled/maximized state [Carlos; !4468]

48.3
====
* Use opaque dma-buf formats substitutes for scanout [Robert; !4320]
* Restore tiled/maximized windows to the correct monitor [Nick; !4411]
* Do not leak session manager file to launched processes [Sebastian K.; !4405]
* Use frame-sync candidate that likely matches scanout candidate [Robert; !4412]
* Propagate all touchpad gesture events to apps [Carlos; !4417]
* Update window decorations on override-redirect attribute [Rémi; !4287]
* Load initial _NET_WM_FULLSCREEN_MONITORS value [Zhiyi; !4389]
* Fix race when registering implicit grab [Alessandro; !4399]
* Skip multiple refresh intervals if necessary [Michel; !4406]
* box-layout: Update actor-request-mode on orientation changes [Jonas D.; !4339]
* Do not take control of logind session on Xorg [Madhu; !4391]
* Fixed crashes [Sebastian W., Jonas Å.; !4423, !4431]
* Plugged leaks [Michel; !4432]
* Misc. bug fixes and cleanups [Chris, Maxim, Michel, Carlos, Florian, Rémi;

48.2
====
* Fix animated cursors [Michel; !4382]
* Announce workspace changes to screen reader [Florian; !4385]
* Fix popups showing in some situations [Carlos; !4354]
* Fix wrong cursor after window animations [Carlos; !4392]
* Fixed crashes [Michel; !4362]
* Misc. bug fixes and cleanups [Florian, Robert, Sebastian, Jonas; !4349,
  !4383, !4393, !4386, !4269]

48.1
====
* Fixed occasional screen freezes [Michel, Jonas; !4338, !4334, !4375]
* Fix tablet tool cursor sizes when set via the cursor shape protocol
  [Jan; !4345]
* Fix hiding the cursor when using the cursor shape protocl [Sebastian; !4358]
* Fall back to the default color mode when a HDR monitor looses HDR capabilities
  [Sebastian, Jonas; !4357, !4364]
* Disable HDR support with non-atomic (legacy) KMS drivers [Sebastian; !4357]
* Fix the cursor shape protocol when being used with tablets [Carlos; !4367]
* Immediately update cursors on theme and size changes [Sebastian; !4359]
* Avoid cursor stuttering when cursor set via the cursor shape protocol
  [Michel; !4371]
* Handle DnD cursor feedback in compositor [Carlos; !4368]
* Fixed crashes [Orko, Michel, Jonas, Daniel; !4351, !4372, !4374, !4370, !4378]
* Misc. bug fixes and cleanups [Daniel, Florian, Carlos, Michel; !4340, !4343,
  !4352, !4353, !4361, !4369, !4377]

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../files/0001-Dont-use-system-sysprof-dbus-folder.patch  | 8 ++++----
 .../mutter/{mutter_48.0.bb => mutter_48.4.bb}             | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_48.0.bb => mutter_48.4.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch b/meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch
index 2f09c32997..8e4048bac6 100644
--- a/meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch
+++ b/meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch
@@ -1,4 +1,4 @@
-From 790177e2a89aa0710b570d595223bdb511241c56 Mon Sep 17 00:00:00 2001
+From 342358225ad886726d68239be8e9eb5e78eacb64 Mon Sep 17 00:00:00 2001
 From: Gyorgy Sarvari <skandigraun@gmail.com>
 Date: Tue, 11 Feb 2025 13:39:54 +0100
 Subject: [PATCH] Don't use system sysprof dbus folder
@@ -10,7 +10,7 @@ system ($datadir/dbus-1/interfaces) instead of searching for it
 in the $RECIPE_SYSROOT.
 
 To ensure that it looks for this file in the correct folder, prefix
-the search path with the value of the sys_root property, which is set 
+the search path with the value of the sys_root property, which is set
 in the meson.cross file (by meson.bbclass).
 
 Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
@@ -21,10 +21,10 @@ Upstream-Status: Inappropriate [oe-specific: only related to cross-compiling]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 551cb23..5199be6 100644
+index 8513f14..0f87e4a 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -446,7 +446,7 @@ if have_profiler
+@@ -469,7 +469,7 @@ if have_profiler
  
    if libsysprof_capture_dep.type_name() == 'pkgconfig'
      sysprof_dep = dependency('sysprof-6', 'sysprof-4')
diff --git a/meta-gnome/recipes-gnome/mutter/mutter_48.0.bb b/meta-gnome/recipes-gnome/mutter/mutter_48.4.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/mutter/mutter_48.0.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_48.4.bb
index 6f799ad57a..d563e8a912 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_48.0.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_48.4.bb
@@ -27,7 +27,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gettext features_check
 
-SRC_URI[archive.sha256sum] = "9ca177fd5851a4077f17f6a888c45447b7d1163c9879580597a1fd837f47e57d"
+SRC_URI[archive.sha256sum] = "1189cf7e63cc87cfdd1f3a86e8f14d97c33d6a9da254f23e81655549b6c50d93"
 
 SRC_URI += "file://0001-Dont-use-system-sysprof-dbus-folder.patch"
 
-- 
2.43.0


