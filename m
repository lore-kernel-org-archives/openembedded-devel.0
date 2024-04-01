Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 124EFCD1294
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:33 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.39466.1711983090418845753
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JZffrP42;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983090; x=1743519090;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hATGU916xOHOaAP2QtPq+KGrjRWlBMnUShvriFrgaww=;
  b=JZffrP42299l5FaCldvQJ3CA72Y1PxD8RotRBMpU5LJEmVVX1pV5T3pY
   jJJEh321QNNN7yzmRxZdmf+5wxqw82Hv52uGMnH5U6iAZ+F1P9R1tGpdN
   3WVuRdvsq9lfiOPqQv3HhJQQnLEMj/zxRL3A4n/94cba4lSAZhVvYoPiT
   GVPFMIgLi0Nbkjr9d+ZgzVxzv8jXlu1D8l4poMMloK/oFlUSKS44sMkrb
   1fUYQ+FpdEoD/5oBaSkmSxSaYMXOXdqk+aGJGOJBei0ahvT64pdPfLcWz
   qDhBhXAJ11RQQxhQci9EAJwGucWPlfTHQNrNaRbh5iClbrpkLdJsQDLuF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="154291734"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="154291734"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:28 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C9B02E8CC0
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1195FD5602
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 98A1420093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 454F11A000B;
	Mon,  1 Apr 2024 22:51:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 02/47 v2] gnome-backgrounds: upgrade 45.0 -> 46.0
Date: Mon,  1 Apr 2024 22:50:34 +0800
Message-Id: <1711983079-16849-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--3.909700-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrmZiw53dqSN9uS8Amg5D32YMs
	9Lfjm5sbjO6ZHXjUwWf7TVaLsInK92lIIURgzYWVxvp0tuDMx3lUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmifnzmcpBzOruxlpnlQFCyhzX8AUEphxj0gW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq0jrWZhRCFL73FnPJIjcNWF2s+8qUWUbYBK86UTCB/erGqi/
	SHoytheRTmdu5VkB1z8lgz2Z2Zi9/kDVtekws0PZ3/efZ5tveodJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109718

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- default: less lens distortion
- symbolics: updated icons & tweaks to the layout
- glass chip: improved compression
- New default. Embrace the rounded triangle!
- Updated Amber, Pills
- New additions -- Gometrics, Glass chip, Neogeo, Ring and Tarka
- Departures -- Keys, Truchet, Rounded Rectangles
- JPEG XL favored as a format, with banding-bustin' client side grain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-backgrounds_45.0.bb => gnome-backgrounds_46.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_45.0.bb => gnome-backgrounds_46.0.bb} (74%)

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_46.0.bb
similarity index 74%
rename from meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb
rename to meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_46.0.bb
index 704a0b645..5d6c5d31e 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_46.0.bb
@@ -7,7 +7,7 @@ SECTION = "x11/gnome"
 
 inherit gnomebase gettext allarch
 
-SRC_URI[archive.sha256sum] = "cee0e688fbae5ef7a75f335ada2d10779e08ebca9445f1586de32c5a9b6dee2d"
+SRC_URI[archive.sha256sum] = "4ddd3ac439a4a067876805921bb75f4d3c8b85a218d47c276dddde8928443c2e"
 
 FILES:${PN} += " \
     ${datadir}/backgrounds \
-- 
2.34.1


