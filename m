Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A39CFC523
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.50345.1728896174806757882
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k+tct6tj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896178; x=1760432178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7Z3YT+KqevTLiR2ti7Dx3IjTIgDBl3zHBF0MlStJIKk=;
  b=k+tct6tjiL5vRdqrZvkgrdKrlLEZG33f5uWdQ16hP6QySLQMe+aIfrLZ
   6DXqErtjuRO3v0x+V9bdQ1KkjC56QgHua+I4s7s+f+nQ7St5enhSFwPfy
   rJo4nEzXDV9kTWo3c1URbOwePdXZw4s79x9WJiez+EP26qlw0PjD4eAGC
   pPGz5YUHYMy955SnURzg+VQAdmcWnqTm2We4M0RAtz16QpW26Yovi8+pL
   7KPnTooZ0I1EmPi1a/HIN+MA6DQmERljpahgW76ncdfnQ5JRyT+zwgmLc
   z11A+z0Q4O2qRTCppOsQkR8IXHnnWTcBFU8YrfR234VRW9FMQbbh52u5r
   A==;
X-CSE-ConnectionGUID: Afmt7WPWSpmmKJaR1i/0zQ==
X-CSE-MsgGUID: 9vipDrXpR1i1H64GWhUUCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="178861020"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="178861020"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:16 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 23DF1D4334
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 688FBD7500
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E57D820071A00
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 927551A000A;
	Mon, 14 Oct 2024 16:56:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 51/54] xf86-video-mga: upgrade 2.0.1 -> 2.1.0
Date: Mon, 14 Oct 2024 16:55:12 +0800
Message-Id: <1728896115-2944-51-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-2.560600-10.000000
X-TMASE-MatchedRID: 4ywY52Jn4MDg5EqnY2EgGn1zro62qhdCVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoms6kbSn6Dl+ngIgpj8eDcBpkajQR5gb3gkThzta6HOM287
	tw47cuYMnRE+fI6etkufKjJKrY6iy+7CFmUONuR9tF12yEZNHOuoJrFWfBUn9D5We+GZQk+082W
	2xAkaDUA/asRf9os9mIIzEA0hD/lF/kUVs2Iz6gUu/kTKv9giuqwOHO1Fdn0Kb4tj0DvxRUIs9r
	o6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112897

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xf86-video-mga_2.0.1.bb => xf86-video-mga_2.1.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-mga_2.0.1.bb => xf86-video-mga_2.1.0.bb} (87%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.1.0.bb
similarity index 87%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.1.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.1.0.bb
index 34b3e4cde..5ad64eede 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.1.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "virtual/libx11 libpciaccess"
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
 
 XORG_DRIVER_COMPRESSOR = ".tar.xz"
-SRC_URI[sha256sum] = "27a33b70837965bb4a5f27fd260be085ca5bba837a4e62907f093c2f205603ab"
+SRC_URI[sha256sum] = "7bf85dbf4efa17b7cdd483be8f61cf11fd73d0310514b6ae10d89358de63ab73"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri', '', d)}"
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,drm xorgproto,xserver-xorg-extension-dri"
-- 
2.34.1


