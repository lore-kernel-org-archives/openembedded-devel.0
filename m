Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C135C282D6
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2200.1740525896906935447
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MQOJLJns;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525898; x=1772061898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ywTOrPvrq8tnm+ocQ5h76U+36omCB06STFoy+pN+eiI=;
  b=MQOJLJnsu+02ecDXpPPJ2ypqRnllXZGdoXD3xNOdPL/4MIthVahOuUX8
   8BAfZCzmhV0TJ5cByKGNgkWVR7+Ti8iz/anEX1faTgF8qhG62x1gFFaOj
   MR+wgifztVSerYPBW/AxthhsMvnRhmMM1E/40d6fZtchLLn3/gYALl3zr
   zQnIbnmW0gAzBQFBYnLEhnwDOPTtaX7gm+XAZ44HpNi/KdsGrBYXKFknY
   Bny6FaqY4dh6rRYGlGXsFWpXcxNbesxh3Vx4LRrmv+SFFS3b6a7qjClc8
   h7vFv4g0lc/Xv9JtMppF8LFteiIJZPdFmqrWUzU07KhCCkbKvSlJIZLPG
   A==;
X-CSE-ConnectionGUID: Tp7SmBCOSG6QoosyFkWxdQ==
X-CSE-MsgGUID: EzfENjzRQKSKO6y6OgkFrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191180222"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191180222"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:55 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C983D6EAD
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 04941C8BF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:53 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BBD721A006C;
	Wed, 26 Feb 2025 07:24:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 07/51] gthumb: upgrade 3.12.6 -> 3.12.7
Date: Wed, 26 Feb 2025 07:23:57 +0800
Message-Id: <1740525881-21103-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115603

From: Wang Mingyu <wangmy@fujitsu.com>

283c9483afd1215378c8b9871f51cd61770e53e7.patch
removed since it's included in 3.12.7

Changelog:
============
Features:
 * WebP: read the ICC profile if available
 * WebP: save the EXIF data
 * Video screenshot: use the configured jpeg extension for the file

Bugfixes:
 * Preferences dialog: same dialog shown endlessy
 * Bookmarks: fixed loading system bookmarks with the flatpak version
 * migrate-catalogs: properly use time_t for localtime
 * Removed references to wiki.gnome.org pages
 * Appdata: Fix developer id

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...9483afd1215378c8b9871f51cd61770e53e7.patch | 49 -------------------
 .../{gthumb_3.12.6.bb => gthumb_3.12.7.bb}    |  3 +-
 2 files changed, 1 insertion(+), 51 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb/283c9483afd1215378c8b9871f51cd61770e53e7.patch
 rename meta-gnome/recipes-gnome/gthumb/{gthumb_3.12.6.bb => gthumb_3.12.7.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb/283c9483afd1215378c8b9871f51cd61770e53e7.patch b/meta-gnome/recipes-gnome/gthumb/gthumb/283c9483afd1215378c8b9871f51cd61770e53e7.patch
deleted file mode 100644
index c2dbce0c14..0000000000
--- a/meta-gnome/recipes-gnome/gthumb/gthumb/283c9483afd1215378c8b9871f51cd61770e53e7.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From b48e34c436eb59877b0fe75ba3bf724c0de4dc36 Mon Sep 17 00:00:00 2001
-From: Pino Toscano <toscano.pino@tiscali.it>
-Date: Sat, 7 Sep 2024 09:40:49 +0200
-Subject: [PATCH] migrate-catalogs: properly use time_t for localtime()
-
-Commit ed219c771bc0c63e1a7847e44c81f43223454eac changed the type of the
-'date' variable from 'time_t' to 'long', to ensure the right type is
-handled by sscanf(). The problem is that, in case 'time_t' is not the
-same as 'long', the wrong pointer is passed to localtime(), and more
-strict build flags (such as the defaults of GCC 14) cause the build to
-fail on such setups.
-
-The ideal fix in this case would be to switch back the 'date' variable
-to 'time_t' and use the right format specifier for it in sscanf();
-however, since this is an helper to convert very old format, this
-additional code is not much worth it. Hence, use a simpler fix: in case
-a date timestamp was read from the file, set it to a new 'time_t'
-variable which is then used for localtime(). Since 'time_t' is big at
-least as much as 'long', there is no precision/value loss.
-
-There should be no behaviour change.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gthumb/-/commit/283c9483afd1215378c8b9871f51cd61770e53e7]
----
- gthumb/main-migrate-catalogs.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gthumb/main-migrate-catalogs.c b/gthumb/main-migrate-catalogs.c
-index 75f5cb11d..e194ed19f 100644
---- a/gthumb/main-migrate-catalogs.c
-+++ b/gthumb/main-migrate-catalogs.c
-@@ -308,12 +308,13 @@ migration_for_each_file (GFile     *file,
- 				sscanf (line, "%d", &date_scope);
- 
- 				if ((date > 0) && (date_scope >= 1) && (date_scope <= 3)) {
-+					time_t	     date_as_time = date;
- 					struct tm   *tm;
- 					GthDateTime *dt;
- 					char        *exif_date;
- 					char        *op;
- 
--					tm = localtime (&date);
-+					tm = localtime (&date_as_time);
- 					dt = gth_datetime_new ();
- 					gth_datetime_from_struct_tm (dt, tm);
- 					exif_date = gth_datetime_to_exif_date (dt);
--- 
-GitLab
-
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.7.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb
rename to meta-gnome/recipes-gnome/gthumb/gthumb_3.12.7.bb
index 8917178582..ed5382035f 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.7.bb
@@ -28,7 +28,6 @@ EXTRA_OEMESON += "-Dwebservices=false -Dlibsecret=false"
 
 inherit gnomebase gnome-help gsettings itstool mime-xdg
 
-SRC_URI += "file://283c9483afd1215378c8b9871f51cd61770e53e7.patch"
-SRC_URI[archive.sha256sum] = "608770c6c8e73073a1d404b65bd1b761e1ac5dc25e70130ff072488fa92f5c33"
+SRC_URI[archive.sha256sum] = "ee12d24cf231010241f758d6c95b9d53a7381278fa76b6a518b3d09b371efaec"
 
 FILES:${PN} += "${datadir}/metainfo"
-- 
2.43.0


