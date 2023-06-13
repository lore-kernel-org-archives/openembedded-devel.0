Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D662C88CB7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:40:53 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.3823.1686620448468767684
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="108063125"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="108063125"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:45 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 20A50C53C0
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:44 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 53EC0D4BF9
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D6C8920074732;
	Tue, 13 Jun 2023 10:40:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] nautilus: upgrade 44.2 -> 44.2.1
Date: Tue, 13 Jun 2023 09:39:59 +0800
Message-Id: <1686620422-29962-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--7.250500-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrFJ7PgBJ+66l4YeSlHZYFopmj
	18Axvjh0eU8bQ5hloIxq6UsYayxAg+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQsqh
	SzMv5WabHBJlWHsfjZLlh5xXch+ETDrWW+YTCqzFZNYSHk3Zr0b5rvWZFjMgkD2veI3/hwm/X7Q
	qxdrFbPuLzNWBegCW24nmFeyfGnuMLbigRnpKlKSPzRlrdFGDw5312DRAOC2+Em0j6EPOOPvgFS
	zx+Zi5MAU/7xi09Kkw8Kns4WG+lQQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103228

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Hotfix for grid view bug introduced in 44.2, while gtk 4.10.4 is not released
* Fix crash when closing tabs right after clicking

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_44.2.bb => nautilus_44.2.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_44.2.bb => nautilus_44.2.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_44.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_44.2.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_44.2.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_44.2.1.bb
index 43fe7cc0e..362629fce 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_44.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_44.2.1.bb
@@ -27,7 +27,7 @@ def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
 SRC_URI += "file://0001-Replace-filename-with-basename.patch"
-SRC_URI[archive.sha256sum] = "274a065927596d8a8f09537adc91bae98297201dd47ec6ccd878111e0781d3e5"
+SRC_URI[archive.sha256sum] = "d9c62f024727f7a76fc6a5da788a2b0247df01a71c2a601143c62aac0ff41e4c"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 
-- 
2.34.1


