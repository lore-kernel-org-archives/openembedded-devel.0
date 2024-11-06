Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922EFD29F9F
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:33:24 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.40046.1730874794232628274
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qhgM4TV5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874795; x=1762410795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=as52VADlOBiXfahRUdny452abGwvjOOMr/7ERiMWYuY=;
  b=qhgM4TV5zwAcNG3Y6eUbHycFmIUJZX0O7haOFUpeXm+Q9+yHWfkAsBUp
   w1+Wh+w5wv1uW5FqRlZEXXeH1oMO+YVp/9yWHZnjp6baSOastX6T9/1tq
   BNwARcDdSHXdx/Hjb1BFCWmyJPMQGBiFX58sWBTuK2y47gy8+3SUWiZVm
   mVG7mAk33vnRmIJVvljzKpsKtEiGYYpwpKYWXusfn22HFP5ux1Q+ut+Lq
   pN6fnNVICitIYXiPxIpyLEqIOrJDp2EAP7dGKyEIqc/AzXHBXzQsVzvLH
   Tju8cFvhg84XKM52rqwi2K2Kui628DNHwI5Bu6ciOMfXYJ8nExFta6vk7
   w==;
X-CSE-ConnectionGUID: U/wDQ3yqRLSSAw2rWzBRNg==
X-CSE-MsgGUID: 3TrrmdaCRqKf0SiZBmTTYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="179274700"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="179274700"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:33:13 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F0352F625
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:33:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 65ABACFA5D
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:33:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C8A45200649EA
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:33:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 672E21A000A;
	Wed,  6 Nov 2024 14:33:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 46/46] zenity: upgrade 4.0.2 -> 4.0.3
Date: Wed,  6 Nov 2024 14:31:00 +0800
Message-Id: <1730874660-2364-46-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--7.759300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrZ3KXhrKnN9uWyPi+tKraPEWY
	FvwCgnnKpPkgFEQ0YZmysMXN8ch2JgE4dbnyjMJa/HTKStsDGMLBOVz0Jwcxl5GUF3NhJu3iOrT
	V1pt7yWIC/QWqMBQFQ52oLZ8u2T3EHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIfiAqrjYtFiQaLX
	kh//Q31gfv5a4jSreUesQwh0y2SkTvqm6j9tezMH7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113731

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- progress: support markup on label update STDIN
- progress: Properly setup custom ok/cancel labels
- color: Properly support custom ok/cancel labels
- test: Add test for custom ok/cancel buttons

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/zenity/{zenity_4.0.2.bb => zenity_4.0.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/zenity/{zenity_4.0.2.bb => zenity_4.0.3.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/zenity/zenity_4.0.2.bb b/meta-gnome/recipes-gnome/zenity/zenity_4.0.3.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/zenity/zenity_4.0.2.bb
rename to meta-gnome/recipes-gnome/zenity/zenity_4.0.3.bb
index 801eaae8e..058ae7bb6 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_4.0.2.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_4.0.3.bb
@@ -18,7 +18,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
 GTKIC_VERSION = "4"
 
-SRC_URI[archive.sha256sum] = "c16dcae46e29e22c2fa0b95e80e06c96b2aec93840161369c95c85ed9f093153"
+SRC_URI[archive.sha256sum] = "b429d97b87bd9ce7fb72ac0b78df534725d8ad39817ddca6a4ca2ee5381b08de"
 
 PACKAGECONFIG ?= "webkitgtk"
 PACKAGECONFIG[webkitgtk] = "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk"
-- 
2.34.1


