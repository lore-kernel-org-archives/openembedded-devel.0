Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38953CCD186
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:39 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.11273.1726716752775097297
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KVfJMfjh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716753; x=1758252753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jOGYvXn7wJLulx/Ev4pPQ3TrZr+Pi8/gHrukdx3728o=;
  b=KVfJMfjhk1iTKx+XAm6G+j6bL1zDDuUUduJWqgf+82tZI3+vjuWVr+O3
   gzUxtI4xWb8hT2pnXmvLNEh70RURwpp7+zM4ElByPkl0jltPq71+pamo8
   RI7o5DcG+PxMGouqfVLQp1+zMM0Sbxh04yLzl0soUUKK0znW12or6HQpu
   hhr9DOi9FzKe09CykX39z15LMVJQKx2pgDP9edk/gJLsd9w6e+TIJ0WBY
   q4WSdJbAPprbHmYebjD/tJY9upy9flSvLrga4/XrEkr8uWkACcI+wyApD
   RZzFqLmgAMAJMSuQOwTbcQDQOwjTfOW3Mil51eLv9JZJlKs+A4Q6fTKSD
   Q==;
X-CSE-ConnectionGUID: s6+LQf1rRWGeIKRazWZjFQ==
X-CSE-MsgGUID: fe1/ALapTlGlyxKw7nco3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="153578161"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="153578161"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:30 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4205BC3F94
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 731FAD5101
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AD76A21FC6A
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 549C91A000A;
	Thu, 19 Sep 2024 11:32:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 04/28] gnome-chess: upgrade 46.0 -> 47.0
Date: Thu, 19 Sep 2024 11:31:49 +0800
Message-Id: <1726716733-14548-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-6.866800-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNROKZLuSzNY+5+P
	zso+yUXY82jJesNrruFAfBvgYUYxapWy30f5VTURSCtgxgcsrMqDlzqjqTcX3pTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q1oMLOoNHsM9vWr7HvOSElaDx4wSHMr22riX9
	nrUjM1ufGDBiEemao1BnXnPNo172BneCYBwlNklrnHu4BcYSmtfS0Ip2eEHnwj/1Rbkzl1E2nuo
	SGaY+DLjoczmuoPCq1GNLJ2uwjQ3SONCZHEYVEkXg5r2O8GEkJCZGAl7eHSbfspmOcE2uXnXGdm
	wZ/YzobpzTFzjpuHhA6JXIN8RBk2C2xuPqOT6El+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112365

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix appdata screenshot URL
- Updated translations
- Use modern libadwaita widgetry
- Fix incorrect shortcuts on shortcuts help dialog
- Change First/Last history shortcuts to Up/Down key
- Miscellaneous code modernization and improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnome-chess/{gnome-chess_46.0.bb => gnome-chess_47.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_46.0.bb => gnome-chess_47.0.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb
index bb53b58df..e3365f618 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb
@@ -22,13 +22,13 @@ DEPENDS = " \
 
 RRECOMMENDS:${PN}  = "gnuchess"
 
-SRC_URI = "git://github.com/GNOME/gnome-chess.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/GNOME/gnome-chess.git;protocol=https;branch=main"
 
 inherit meson pkgconfig gobject-introspection gtk-icon-cache vala features_check mime-xdg gsettings
 
 GIR_MESON_OPTION = ""
 
 S = "${WORKDIR}/git"
-SRCREV = "c3625ee59ab3acfd7566ef04300b15ddbadaaac3"
+SRCREV = "91476257c2404945bfa30238c38391343bf4737b"
 
 FILES:${PN} += "${datadir}"
-- 
2.34.1


