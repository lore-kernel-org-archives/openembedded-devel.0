Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5B4C36008
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:09 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.61104.1742893326798305056
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AWSbLog8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893327; x=1774429327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dnHwH4oV2fzID1qLXSv5XujpKLMH3YBfKav+JGQp1kQ=;
  b=AWSbLog8Th5/TgIu7xl8AvvkiciLWTNiJ56GkRTpNz2CwOumg3Bv+58F
   LcsOhqYFY32SoWmFX16/AY/nE62XXcUGbpA4tQZDF2I7IhaFBqF9Ig9fv
   /2G15jJKjg1kqFucgeSJSibbt97r7O0oH9BSxGT/cJRk5eRo/G4GDw+xO
   7s0mejI7NE9XvtbNk8l99JFr05wALSAEIO9RHzMPCn8EO1QImLUOSobHL
   CNYlNye98q8/MXm47LzpvhbifJOuh4BFfEY2+VIVA9XyQl6nZeDWiOm0r
   hZ7zzFtVvDUsFuqhHmIkiTr9HgQN3/07WsihfCrLmpu4PX/eYHXI+Rg4b
   g==;
X-CSE-ConnectionGUID: nONSO+cORxiFr9okSZCdHA==
X-CSE-MsgGUID: Lk6ddLoJQQyuYniVJ4Mb4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="194222967"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="194222967"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:05 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 52489D480A
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 18CDAD6FE1
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:02 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A81BC1A0078;
	Tue, 25 Mar 2025 17:02:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 05/45] gnome-font-viewer: upgrade 47.0 -> 48.0
Date: Tue, 25 Mar 2025 17:01:12 +0800
Message-Id: <1742893312-3809-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116229

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-font-viewer_47.0.bb => gnome-font-viewer_48.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-font-viewer/{gnome-font-viewer_47.0.bb => gnome-font-viewer_48.0.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_47.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_48.0.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_47.0.bb
rename to meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_48.0.bb
index 4763d1717d..e8d51a12df 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_48.0.bb
@@ -15,7 +15,7 @@ inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "b8e5a042e0b241b0c7cae43f74da0d5f88e6423017a91feb86e7617edb4080ed"
+SRC_URI[archive.sha256sum] = "732624231b624ff5c7ac03a8ce71be12393daa53551d11550b20d7b0a3a872a7"
 
 FILES:${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.43.0


