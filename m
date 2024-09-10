Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6855DEDE9A7
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:32 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.18330.1725959003202735294
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QQoZQW5q;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959003; x=1757495003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IeZomU12+nKZvECZOVq+ZNg+jN8W8TYGqaHhgx+fd8o=;
  b=QQoZQW5qCYBNKLsi2IGat4nEBG7oQa0JdwoJ9rUUQ5qhlgNoun7xz5cU
   BLrtKg498LKZlJW6SZBWEC+MEHNYwrG0QZZrh83YdqHd1ccaviXtvapE+
   lm3BZl2gRi2KoScW6inxwjR/w7YKffYcSsjzG3LKLD/qdNpuBTkgCqXpx
   1ijlb6bNTM67g8oFhu+6Ul8iDwMHdiEtCjBvHgADwJM0FbDLnMWyGm8d5
   yX5A+FofOgBWCmylXiQ5sW/aOBDcDuEVYttVz2Xf99bchYt38SBqOsLwM
   qWrZGX8fOx5TsQq21gcO7T28MRPGjLv0JboWlVCe/WbXSS7/VjeYsnBtZ
   w==;
X-CSE-ConnectionGUID: At0dNzd3QyiTobuwXXuDfw==
X-CSE-MsgGUID: 07wE2F6xRPWUckDpg6LmOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="161244759"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="161244759"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:20 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B0D6FD4F55
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 04FDAD50EE
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 80BA4200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 33CED1A000B;
	Tue, 10 Sep 2024 17:03:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 02/42] eog: upgrade 45.4 -> 47.0
Date: Tue, 10 Sep 2024 17:02:30 +0800
Message-Id: <1725958990-5719-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--2.201300-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/ySrLqyE6Ur/jegIHHX2L4YzytUs6KLTYEI5X
	7R68Jt/gvqvtzy85XwfzSn+RSRAmrFpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl6vCrG0TnfVULPJ
	tWpbJjY2vNoc2prMd+vpCODyQPj1FP0RMDgPThrUdZEkR8Y/med0pE2POjYg4+7PAkASTOu6WCg
	Fyea2/EeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUooRrS55Vk5+xgtoKZMpkwXzWe
	1Rocpq3JMrahZhf3pNluON57sWNMqDsm116wxkTxdnPEifSLY/bOjMSXk3LsvhI8wHPYb4B7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112188

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfix:
========
- Fix icon name
- desktop: Add jpeg-xl to MimeType list
- EogWindow: Raise priority of image loading and transformation jobs
- EogMetadataDetails: Support copying metadata values to the clipboard

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/eog/{eog_45.4.bb => eog_47.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_45.4.bb => eog_47.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_45.4.bb b/meta-gnome/recipes-gnome/eog/eog_47.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/eog/eog_45.4.bb
rename to meta-gnome/recipes-gnome/eog/eog_47.0.bb
index af838e298..8e0583cf9 100644
--- a/meta-gnome/recipes-gnome/eog/eog_45.4.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_47.0.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime-xdg fea
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed when libpeas2 is used.
 REQUIRED_DISTRO_FEATURES = "opengl gobject-introspection-data"
 
-SRC_URI[archive.sha256sum] = "b50f321c70ac64af7bcaa5b4460dc675b3ca60fdad385616f3ac7b770e0666fe"
+SRC_URI[archive.sha256sum] = "db5edbf5224d75126a7b7d8ee4e9272a2f30a953331d5baf6d3f3c0ce0cbde66"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.34.1


