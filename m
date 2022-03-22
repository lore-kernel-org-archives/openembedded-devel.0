Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29B2C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 00:09:39 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.3565.1647907778015520842
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 17:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ezs76ViP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647907776; i=@fujitsu.com;
	bh=cQMmfK/BctDUuremNAd9V1Y6RUXLe1laX4BtoRBr3aw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ezs76ViPhYWfo4jmm3OZQfUC3xiCN7vMDOC9MgELWq46+kHEUzMCIl2dy9f6q+Roz
	 94XAFr4iW6xaJs1UqQ4II9ONsIPcIhdMImwKCCkAD/Qh/xLJEbR0zRjlEqymEOFqIU
	 +eJF+ztMf0QKXwYkrGorzS20/GgaiJWWCm2RSs5h+ee9ItP+A+fdIj60b0rFTz7pUK
	 t6Z+BxBLKWe8/EcKwR3XGJvJZN+tTerWjp8oRXa17vEH9nYW8BwcgmtnT1AZXJ8fhI
	 Sf6O6Zg4kOAFqaBoHVY7c9RhzfQPC8y3pK/jXBN6DKTt9io56mKq1gG99uKUPUHpVP
	 ceN6RqJeDJfJw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MxRXe/sGW
  Swb8nchYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aqtZsYCzaJVFw/u4q5gXGtUBcjF4eQwEwm
  ia/ty1ggnD2MEtt/TQRyODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHHcQWFnCU+PHzD
  VgNi4CqxKo1T8FsXqD47e67YPUSAgoSUx6+B7M5BZwkri9oY+pi5ABa5igx430NRLmgxMmZT1
  ggxktIHHzxAqpVUWL25WYWCLtCYtasNqYJjPyzkLTMQtKygJFpFaNtUlFmekZJbmJmjq6hgYG
  uoaGprpmFrpGJXmKVbqJeaqlucmpeSVEiUFYvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwMFOKXSR2
  MN7s+6l3iFGSg0lJlPfFQ4skIb6k/JTKjMTijPii0pzU4kOMMhwcShK8ooKWSUKCRanpqRVpm
  TnAKIFJS3DwKInw8n8AauUtLkjMLc5Mh0idYtTl+HDoyl5mIZa8/LxUKXHev0JAMwRAijJK8+
  BGwCL2EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXgFg/AvxZOaVwG16BXQEE9AR+qxmIEe
  UJCKkpBqYvON5PCa/UpsezLE9Sjnjr9mUFe71/3+tDJ/vvXwf7ylGrfWfvh87scffP7F/dcnc
  udZ7s3hMGTl+Tp2kqZgWfDz6+/41x86xarjMLngrwe/3x+Xr9rqvr9hOPzU69z2j7RKLdNbmm
  Mc5P4ri/v3mVxY/IRJ2MLFCnovN+LvEcvmdIoZ3nc/Fvduov5gpJiihY26XxvqVltadXWIyij
  lv9po+f1E2922vieFat9k9qaJcUYf9Kq2Cpt2Yt4tbes8mkTmdcolP5TeFMb43umPJ+zCr0H7
  998kvH7pd7WLK4K7+5eiSkrM5cvuhLOdHYW3Lt9QdZ3P72vM27NY/E4nEL9dOPP8XeFPyd7Bp
  Y9paJZbijERDLeai4kQADll/0VMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-528.messagelabs.com!1647907775!90755!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15474 invoked from network); 22 Mar 2022 00:09:35 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-14.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 00:09:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22M09OE5005185
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 00:09:35 GMT
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 00:09:30 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] nautilus: upgrade 41.2 -> 42.0
Date: Tue, 22 Mar 2022 08:09:13 +0800
Message-ID: <1647907753-1930-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647907753-1930-1-git-send-email-wangmy@fujitsu.com>
References: <1647907753-1930-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 00:09:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96118

liportal-0.5-fix.patch
removed since it's included in 42.0

Changelog:
=========
* Fix HiDPI thumbnails in list view
* Properly dispose pathbar to avoid crashes
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/nautilus/liportal-0.5-fix.patch  | 28 -------------------
 .../{nautilus_41.2.bb => nautilus_42.0.bb}    |  3 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/liportal-0.5-fix.patch
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_41.2.bb => nautilus_42.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus/liportal-0.5-fix.patch b/meta-gnome/recipes-gnome/nautilus/nautilus/liportal-0.5-fix.patch
deleted file mode 100644
index 708595a7f1..0000000000
--- a/meta-gnome/recipes-gnome/nautilus/nautilus/liportal-0.5-fix.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fix an issue building Nautilus with libportal-0.5+
-where expected header is moved to different directory
-in staging sysroot
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/meson.build
-+++ b/meson.build
-@@ -123,7 +123,7 @@ gtk = dependency('gtk+-3.0', version: '>
- libhandy = dependency('libhandy-1', version: '>= 1.1.90')
- libportal = []
- if get_option('libportal')
--  libportal = dependency('libportal', version: '>= 0.3')
-+  libportal = dependency('libportal-gtk3', version: '>= 0.3')
- endif
- selinux = []
- if get_option('selinux')
---- a/src/nautilus-files-view.c
-+++ b/src/nautilus-files-view.c
-@@ -92,7 +92,7 @@
- 
- #ifdef HAVE_LIBPORTAL
- #include <libportal/portal.h>
--#include <libportal/portal-gtk3.h>
-+#include <libportal-gtk3/portal-gtk3.h>
- #endif
- 
- /* Minimum starting update inverval */
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_41.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_42.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_41.2.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_42.0.bb
index 66043fad34..2935cc2bfe 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_41.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_42.0.bb
@@ -22,8 +22,7 @@ inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI += "file://liportal-0.5-fix.patch"
-SRC_URI[archive.sha256sum] = "872285b1c40a6ee418ce295ed115f5427da70907d822d95bcf51675d5498822b"
+SRC_URI[archive.sha256sum] = "3c904f33ba2d2a078892bee2af71484cd608923cd78ec7e8a1517bc2155113d5"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.25.1


