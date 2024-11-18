Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7651D44014
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.36712.1731922207947770117
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RP777j+H;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922208; x=1763458208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IZgXKuJzypWfMVzwXEGgxJxS5cDuvTSlFJw0uqmymr4=;
  b=RP777j+HVA/aYaNH+n2hMva/J1rpcuYV2XdhphRqNK9w3O4+p2wfIsEF
   6MTxmwKmQZ9n5HEeT5OHZse+UWft9L2q/LBaDQq1qhsnOYRLeaEVrXE01
   F3c2moaZOVtaJUBe4CTPC5gPkLTA0kG4Y05cTVzFvmzFCNYOYE/KBI0GP
   +et2XF/5El9y2CDbaroB1igWgAfT2KegOTCKztJw5ai/JaDwjnk9tmFKl
   /jsTfJxv22T/YzvuvXCL53euHsWS0mVVBLCiU3CeqSW0USztHqWqslQzn
   jcnqdZRSX1HeItc5mJTtpEjJHvNxvev4nV4GsQuJkQ/odHiOfYuYUQF03
   w==;
X-CSE-ConnectionGUID: XsdkGUyBRZ6w/msifXv4qw==
X-CSE-MsgGUID: CPuypRWlTfaePVOb7Fgx1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="169137086"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="169137086"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:05 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 757D0D6EA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:03 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0862928362
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E8FF21FD4B
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:02 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3F0A51A000B;
	Mon, 18 Nov 2024 17:30:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 02/32] ghex: upgrade 46.0 -> 46.1
Date: Mon, 18 Nov 2024 17:29:25 +0800
Message-Id: <1731922195-5266-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10-1.547000-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvn3ZLCt3rRSe79
	DJRUi35poiRiRqJbjhYBXdtZPWfJ2i/7QU2czuUNA9lly13c/gHp5F0BEaAln0jINjnv2/BM5vP
	7Dd5b9sCVnooZ0ZEF8KVYSr+Uzj9pDrWW+YTCqzFZNYSHk3Zr0X0tCKdnhB58I/9UW5M5dRM+8F
	JNGdxYq46HM5rqDwqtxEXbzjjoFbrMVzIvkT73bcattbWNofyVZJG1nhRaVjGfTrw99JYu/LD+j
	fLBgoXvJWGM9tEPgKSFKocc4vbwZl0NK66uT9OmHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113868

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  fix GdkDisplay access before init

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/ghex/{ghex_46.0.bb => ghex_46.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/ghex/{ghex_46.0.bb => ghex_46.1.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/ghex/ghex_46.0.bb b/meta-gnome/recipes-gnome/ghex/ghex_46.1.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/ghex/ghex_46.0.bb
rename to meta-gnome/recipes-gnome/ghex/ghex_46.1.bb
index 41d839163..1a8c49efb 100644
--- a/meta-gnome/recipes-gnome/ghex/ghex_46.0.bb
+++ b/meta-gnome/recipes-gnome/ghex/ghex_46.1.bb
@@ -15,7 +15,7 @@ GIR_MESON_DISABLE_FLAG = 'disabled'
 
 inherit gnomebase gsettings gtk-icon-cache gnome-help gettext gobject-introspection vala gi-docgen
 
-SRC_URI[archive.sha256sum] = "a1c46f3020cb358b8323025db3a539c97d994a4c46f701f48edc6357f7fbcbd1"
+SRC_URI[archive.sha256sum] = "8a13975474eee27719b29ad763f1b24760a1aede6d7da4b623703070bc26e9fd"
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-- 
2.34.1


