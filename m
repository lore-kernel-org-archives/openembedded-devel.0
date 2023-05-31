Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AB9C7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:40:40 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8602.1685518839469083738
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="118923559"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="118923559"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:37 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 07165D29E1
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A007D95F2
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:34 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5C60768957;
	Wed, 31 May 2023 16:40:33 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] nautilus: upgrade 44.1 -> 44.2
Date: Wed, 31 May 2023 15:40:01 +0800
Message-Id: <1685518820-20028-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10--5.530000-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTfK5j0EZbytVW5LVJV/sozZr
	09iwbwmQHOeGuGN7sHsyNJAGB7SC9ADNPxu11HXjP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5fZPFUbFYJwZIGgs09JO1+Dytg73Zv02axlpnlQFCyh90pE2POjYg4G1Mjd1Cixqeem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKSPzRlrdFGDwRBxLseji2ehZLocLQErLZXgBe
	rmNyyJxx/6KuwH2Jv7dwZlJRaS16A==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102907

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix crashes with expandable folders and on Other Locations
* Avoid inconsistent search states
* Prevent lingering tracker cursors
* Fix rubberband range behavior on list view
* Translation updates 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_44.1.bb => nautilus_44.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_44.1.bb => nautilus_44.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_44.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_44.2.bb
index 65bef45da..43fe7cc0e 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_44.2.bb
@@ -27,7 +27,7 @@ def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
 SRC_URI += "file://0001-Replace-filename-with-basename.patch"
-SRC_URI[archive.sha256sum] = "360802a595e3edbad962c8cea353b62baa8be407513b5162c89c933ca5387aa9"
+SRC_URI[archive.sha256sum] = "274a065927596d8a8f09537adc91bae98297201dd47ec6ccd878111e0781d3e5"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 
-- 
2.34.1


