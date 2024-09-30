Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D7FCF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:38 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.49295.1727682213124440029
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T+YP/acF;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682213; x=1759218213;
  h=from:to:cc:subject:date:message-id;
  bh=Cg+WOq44eY0jp0Tu9ELIU/CHyLZBDS69oE28vTdGXac=;
  b=T+YP/acFjQKPCg716RD0ZbDLjxaopZL9heh6D/ZhrgZ92zzJRhdJJUNc
   KjflW+AFaZ1rPsQSonL5g8O7++vO/pSZKpNTvPKL47r05FTl751FMWm6Z
   0akg5mshiZ+pXt0DqYQWdgu7lvRl9Nj2DkjruIk8xIA4/16vUFKQrsSKS
   HUlKMQyDA1HvuLfWHxDO87nyfr5ln/hf9G9xW77a5eGCJh7ezq7YzJeT+
   u4aZoGa9zfkxVKBrM2PyXnb7Ncj0uhU+w9OpiGFvmarxb04UFRKyHKkMx
   sBZhgEcAAhnoAlsyc7aOzW+/5f2FpN3MWwPAXDHYI23028wp+b12O9Gpy
   Q==;
X-CSE-ConnectionGUID: 4lN2YmhRTCyAaQ0t+tIGQg==
X-CSE-MsgGUID: tQXgLCOoQZe1OEGpOhNrNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="163217029"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="163217029"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:31 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D2FF9C68E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B559D5042
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FB816B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1ADFA1A000A;
	Mon, 30 Sep 2024 15:43:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/40] adw-gtk3: upgrade 5.3 -> 5.4
Date: Mon, 30 Sep 2024 15:42:26 +0800
Message-Id: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-2.025800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoghqh+u1IaR7lXePXNM4FjMQhNjZQYyI3Jsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62S7RsN3uOuYB6GzBQl3eL0n3KBg4lOxbRsKtKmW/Tk3lMmzs
	v68sOxxZZiJdh3tLudQxkGPzmXMwqELcyrq25sPCPhKPpzwW5dS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112561

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Update for GNOME 47 and GTK 4.16.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnome-themes/{adw-gtk3_5.3.bb => adw-gtk3_5.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gnome-themes/{adw-gtk3_5.3.bb => adw-gtk3_5.4.bb} (88%)

diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.3.bb b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.4.bb
similarity index 88%
rename from meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.3.bb
rename to meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.4.bb
index 1ddc27765..3a0ca620b 100644
--- a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.3.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.4.bb
@@ -11,6 +11,6 @@ inherit meson
 SRC_URI = "git://github.com/lassekongo83/adw-gtk3.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "22a3b9374369640993e4a7ab84f8acc72318e501"
+SRCREV = "91aac01e4f4bfbbe233cf7f4bb7a8e4cff73bc5f"
 
 FILES:${PN} = "${datadir}/themes"
-- 
2.34.1


