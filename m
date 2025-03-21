Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720EFC36005
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 03:39:17 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.13312.1742528353219904353
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 20:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i1U7fryg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742528354; x=1774064354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=oc8K45Jj/6VEsJJ72H4nZ3UQBkLA/JL71Ag7LB9H20g=;
  b=i1U7frygpuKYeGX134nekbP7IvC6FfOBZSc4KcTjL3jpEn9PEXieWEta
   wyUP4/5e90qrbI6onsRaI6gePIJyl6UL7Q3muUDqBk8n4G34Vct1iLRsH
   4lFbd2MfeTCxkf0c/Mx+ykfl8kk2BKSwceP1B+nlSTSgjuM8S50KEg8al
   btQrXG+yGXIjrgYD71+9aYKTtezjcMQCmexj+DFnSesOjciS91MvjlEsz
   G9avI0m6gX0VLY3GcDTAS4mJdRr7+XpslOPUcgy1SzVPbzFfevav33y7g
   lv6jpuNfKkmlpkNruA3si0k84e783KTWY6LXfdaaT/zRoZVrQkeheUpb1
   A==;
X-CSE-ConnectionGUID: wd4pybgVSfKLdz3c5kIbPg==
X-CSE-MsgGUID: o88EXEDoRqOiTK1ODqYrxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="181740338"
X-IronPort-AV: E=Sophos;i="6.14,263,1736780400"; 
   d="scan'208";a="181740338"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 12:39:13 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1896CB406E
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 12:39:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CE96A13F38
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 12:39:10 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5944B1A00AF;
	Fri, 21 Mar 2025 11:39:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 4/4] gnome-chess: upgrade 47.0 -> 48.0
Date: Fri, 21 Mar 2025 11:39:02 +0800
Message-Id: <1742528342-27448-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742528342-27448-1-git-send-email-wangmy@fujitsu.com>
References: <1742528342-27448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 03:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116158

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnome-chess/{gnome-chess_47.0.bb => gnome-chess_48.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_47.0.bb => gnome-chess_48.0.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_48.0.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb
rename to meta-gnome/recipes-gnome/gnome-chess/gnome-chess_48.0.bb
index 47c412d75e..0e41626e6d 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_48.0.bb
@@ -29,6 +29,6 @@ inherit meson pkgconfig gobject-introspection gtk-icon-cache vala features_check
 GIR_MESON_OPTION = ""
 
 S = "${WORKDIR}/git"
-SRCREV = "91476257c2404945bfa30238c38391343bf4737b"
+SRCREV = "b0bf5288438f74fcb455e1e49f855b4964a2c7cb"
 
 FILES:${PN} += "${datadir}"
-- 
2.43.0


