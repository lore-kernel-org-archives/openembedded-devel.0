Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB08C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:22:55 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.6405.1704720174435038630
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="144934682"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="144934682"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:22:51 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E8EBD3EB2
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:22:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 74D9372882
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:22:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D8258202D32AA
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:22:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 94AE11A0072;
	Mon,  8 Jan 2024 21:22:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libgedit-gtksourceview: upgrade 299.0.4 -> 299.0.5
Date: Mon,  8 Jan 2024 21:22:28 +0800
Message-Id: <1704720148-29991-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-2.044100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLoj21zNtGCrjrIIDpXIcjHSHCU59h5KrGC7C2rJeUToeh+xVJZnrh8lIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzvxXw+dIPGGAjtR
	E7QWQ0R1ATBhJLP0KMvIo88VGfPntV0nKqETCwZ/8rE5R1oFBNnGFe6CMKAjywGidwrJOpcBBaw
	kDUcptbiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108136

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ourceview_299.0.4.bb => libgedit-gtksourceview_299.0.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gedit/{libgedit-gtksourceview_299.0.4.bb => libgedit-gtksourceview_299.0.5.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.5.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb
rename to meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.5.bb
index 3a655f650..00e5bec32 100644
--- a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.5.bb
@@ -7,9 +7,9 @@ DEPENDS = "glib-2.0 gtk+3 libxml2"
 
 inherit meson pkgconfig gobject-introspection features_check gtk-doc
 
-SRC_URI = "git://github.com/gedit-technology/libgedit-gtksourceview.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/gedit-technology/libgedit-gtksourceview.git;protocol=https;branch=libgedit-gtksourceview-299-0"
 S = "${WORKDIR}/git"
-SRCREV = "7062264d635f6efe04d88217a893a97ff385b873"
+SRCREV = "7e2179a8ff3022edad27e2d57744876d125cb040"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.34.1


