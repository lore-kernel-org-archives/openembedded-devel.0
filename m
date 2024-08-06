Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA443C5321E
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2885.1722934019647386510
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GPB1PL79;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934019; x=1754470019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=X0+DiqEdo28c40H95UXbVOIHS52SBs6M5eIjewJIAgY=;
  b=GPB1PL79sq8J2tDXtZbS//6Ld/8Wtq2kyaQavQ4/qW7SG87TJWwc9/aN
   QaTIApGOzrcAhFZGFkuXVcVKxhQ6L4xo40Sk82l28+LlQKnvnV+m8BWU+
   RjdL7VB+xorUQiNev1EtxTD8l+bPPixqM+MH1bC5zgemVX9DVsNZ063AV
   KyqIaEYpo4xxxPD7Rs1r7glu0ibeu6xENO9R5nhy0b6vPE4FcWGW0BR4d
   CpcaWTxHr0Zeld+HNMK9d55e4NVSfdMXUB5zbqBr2odPT69q7TCAlXGhr
   McAKfWu3ou0BIhxyNj0DWPZXFxTZlNb+dgqwoFGZ7WN15Cu7JpbFH0fDt
   A==;
X-CSE-ConnectionGUID: cdk/y0RZRkWxUwt9Z4gMfw==
X-CSE-MsgGUID: b/S8KIGLS8aV320kmkL8Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="158213943"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="158213943"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:57 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E0D1BDB3C1
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 30A19D50E0
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B8F0220076D14
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 842FC1A000D;
	Tue,  6 Aug 2024 16:46:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 19/60] libsdl-gfx: upgrade 2.0.25 -> 2.0.27
Date: Tue,  6 Aug 2024 16:45:53 +0800
Message-Id: <1722933994-32549-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-2.643900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z71Wx2uUbPLfExmr5hqNL1rTxVectWz+oEbx
	xHhRXg6LSrIpwqACpfqJHfOmLQPQzHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDXT04
	6NObyhX4BKqilfU32ly5Mda396VtFrYgxk4jWxXB+YXADWomihxYXu0B2u2RQOvVL7XbOwox85T
	cVhq6PzrZJBHViZrsAN3Nev8Voz8VPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111541

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl/{libsdl-gfx_2.0.25.bb => libsdl-gfx_2.0.27.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/libsdl/{libsdl-gfx_2.0.25.bb => libsdl-gfx_2.0.27.bb} (76%)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb b/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.27.bb
similarity index 76%
rename from meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.27.bb
index ae64db82c..4f702029d 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.27.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d1de21f0b70830e299905eac3419084"
 DEPENDS = "libsdl"
 
 SRC_URI = "http://www.ferzkopp.net/Software/SDL_gfx-2.0/SDL_gfx-${PV}.tar.gz"
-SRC_URI[md5sum] = "ea24ed4b82ff1304809c363494fa8e16"
-SRC_URI[sha256sum] = "556eedc06b6cf29eb495b6d27f2dcc51bf909ad82389ba2fa7bdc4dec89059c0"
+SRC_URI[sha256sum] = "dfb15ac5f8ce7a4952dc12d2aed9747518c5e6b335c0e31636d23f93c630f419"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/sdlgfx/files/"
 
-- 
2.34.1


