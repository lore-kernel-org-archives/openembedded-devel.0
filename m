Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6E8C7EE2F
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:40:53 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.3847.1686620442071140221
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="121527736"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="121527736"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:47 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C0776C53CA
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:44 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id F40A3D4BF1
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4CA5120074724;
	Tue, 13 Jun 2023 10:40:38 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libadwaita: upgrade 1.3.2 -> 1.3.3
Date: Tue, 13 Jun 2023 09:39:53 +0800
Message-Id: <1686620422-29962-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--1.040900-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytcYPm8eVUBlXJ9
	Mbn64cXRunnE+ckBUeAyNJAGB7SC9ADNPxu11HXjP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6o1nTPm+8HXYI+xZY+0lxraS0aeo3QWkFZNYSHk3Zr0VXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZK0Axf4UcKM+fnQEFFTFcs3mCUS860EWy6FSE1sBlwgh1kZA
	68jIt2/+XrJJm7UUqRirddsCxahT+JnvYOqIHODHo5Gr8qftaVLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103225

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Fix doc include path
- AdwCarousel
  - Fix scrolling to a recently inserted item
- AdwEntryRow
  - Fix accessibility
- AdwPreferencesWindow
  - Fix markup handling when searching
- AdwStyleManager
  - Fix get_for_display() annotation
- AdwTabBar/AdwTabOverview
  - Fix dropping data onto tabs/thumbnails
- Translation updates
  - Brazilian Portuguese
  - Slovak

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libadwaita/{libadwaita_1.3.2.bb => libadwaita_1.3.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libadwaita/{libadwaita_1.3.2.bb => libadwaita_1.3.3.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.2.bb b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.3.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.2.bb
rename to meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.3.bb
index b661734aa..c0eff35e4 100644
--- a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.2.bb
+++ b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.3.3.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc vala features_check
 
-SRC_URI[archive.sha256sum] = "b38c91658b2d1fcb7eedf687858b0a54de39af6357661912b54271884c8e195e"
+SRC_URI[archive.sha256sum] = "3fb9f6f8f570e543ab2dafb8b4b94d8b376c59ad565efadfede44557e3f3a9e1"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.34.1


