Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97538C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:05:14 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.527.1705971906865738547
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146923799"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146923799"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:05:05 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AFDF7D6188
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:05:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EA6DDDA235
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:05:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8CD962007B700
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:05:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3E3951A006A;
	Tue, 23 Jan 2024 09:05:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gjs: upgrade 1.78.2 -> 1.78.3
Date: Tue, 23 Jan 2024 09:04:40 +0800
Message-Id: <1705971880-24736-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--7.377900-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrMCcAfUypiViysPB8dBBorYIP
	FubbBVyAoTssFGSH7W3mn3xyPJAJoh2P280ZiGmR0NA+DE6YXwQEa8g1x8eqF4Ajsy+r+wvndj6
	gVuuo78nV92bZ3XN9hmFaA05V+E9MPdBKwuQh6ls8o3fwIs8rQehbcYgsOcJGAhn751acftuem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKSPzRlrdFGDwA/MNNnfRbaho/3qy9Cwk7UP+G
	ttn00mrSvW+Ft0HFZCSKxc4RJ1hPw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108388

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* GJS 1.78.2 causes all Gnome extensions preference settings windows
  to disappears after 3-7 seconds

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.78.2.bb => gjs_1.78.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.78.2.bb => gjs_1.78.3.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.78.2.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.78.3.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.78.2.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.78.3.bb
index c8ffcdaab..59d0a7b87 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.78.2.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.78.3.bb
@@ -7,7 +7,7 @@ DEPENDS = "mozjs-115 cairo"
 
 inherit gnomebase gsettings gobject-introspection gettext features_check upstream-version-is-even pkgconfig
 
-SRC_URI[archive.sha256sum] = "6a2abeb6bb7b49dd20a2e86475a56c1d992ad271a0991e58b1431ad1d4997fd5"
+SRC_URI[archive.sha256sum] = "42d50364caa5d792c76734fe5bbcc4b9dbb48819da20a4060061e8b9526134a4"
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \
-- 
2.34.1


