Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECE3CD1288
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:33 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.39354.1711983090747217291
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=abBFyOxZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983090; x=1743519090;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dZlZfp+vN/GVThm53pCTz2GLdlqF7J6QuF21Xbs9g/Q=;
  b=abBFyOxZp5oKV+Repf92d5y3BSrX8T8JJWqKHLKdxhR1UR5NKH/Tv6ad
   wKKRiy1J9QKuy4LuVrfFAnEoXAC41PBMEn+0QaQStUtMpOh6XbudSTqqK
   34f+KJygj34tOe70QjjBLaoQJGCbcfdFVJxKremszj6uM3KA+mrEprtZZ
   Z/N98mPxfn0CKdNRNx0CQwMGUQY2KlsaTK78XRa41WyWqpq+K4h1q4xPW
   dEXdVwbJ12Uo8Gl3vE2tafffXaFUohmrXEs9C/a4PEVSHa+GF4kNrjX4q
   bcmAlSoavLfvvs6tGpk70iAmYHV2MfstmIpUr5nfFzOQHj5xCGpW6uoS7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133563975"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133563975"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:28 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 947F7DCB6A
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9AD22D620F
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E2E220093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E8C511A000A;
	Mon,  1 Apr 2024 22:51:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 03/47 v2] gnome-font-viewer: upgrade 45.0 -> 46.0
Date: Mon,  1 Apr 2024 22:50:35 +0800
Message-Id: <1711983079-16849-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-1.633100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytuakxeLV+a9b6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BYMfawjLz6P1GJGXffuLdv79l
	rTAAf+0utyIGyqiA2A4hMTcdVKb+FqOJ+h+s5fKaeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNW0ov7cm1VZe0CWPIdrIm0alZ0xGW6q+L8/w4oO+vKpuIi9TF8RpGQRUs5JvA0o1VXKrN
	NWwIxUVneBu+K3ke630XQUCShBarwQ5WMx/hWiMU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109720

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Fix incorrect/missing URLs
* Improve app metainfo

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-font-viewer_45.0.bb => gnome-font-viewer_46.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-font-viewer/{gnome-font-viewer_45.0.bb => gnome-font-viewer_46.0.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_46.0.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb
rename to meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_46.0.bb
index 629bc7186..dbce71d12 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_46.0.bb
@@ -15,7 +15,7 @@ inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "97cb6b68dda60de0ab3038383586f1e4bc1da5a48f44025bd6bbe74ea05c2b08"
+SRC_URI[archive.sha256sum] = "592f401e485d02cc044d487bb5c8e04c961da6856216768a59f1ff98bd2d537c"
 
 FILES:${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.34.1


