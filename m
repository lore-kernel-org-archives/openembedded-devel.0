Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3022CAC582
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:39 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8052.1756890209000338735
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gAyt6X5G;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890211; x=1788426211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BWjsns8qpz1eWPzH1AoR96FM+ILEE16lleBolnaIePI=;
  b=gAyt6X5G09Y80iHT98BUUHDo94BEx42/lW5pC30nZ1lMTTu2w+K53wVZ
   Szhv3P3gdPuPYbnX+r4UTLvZe2lWzcus+Z5I7pDU7gotR39s5OXTIDVq4
   U9xaM2TTXcVyt1NglF1hG215oDZd+j7RtuFrB4vZVmeq3iqYj/Qay1Kyp
   LxCTV+7cR+Ft8Echdwcf/sd/DwKl2CivxVANguJEfIKQLXgC/Y5+qHBBS
   kch4Ia8bzulcI7nRJxK3G7jb/RkejVR8a0qvsa271SSv9TxEnyctLDbqK
   0GppMyxgul9HA0uWr58toyvV7Mg67+uZYnDIyl02lvoMc+PDap+DSPxia
   w==;
X-CSE-ConnectionGUID: gFu/JXYKRy6qv5DpWl63PQ==
X-CSE-MsgGUID: cERoD5j+RryvT+aVou+S8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211549630"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211549630"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:30 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 8F1481002BA1
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:29 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 43D3B8B67AC
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:29 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 1FE9F1800B17
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 108EB1A0086;
	Wed,  3 Sep 2025 17:03:23 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/56] feh: upgrade 3.10.3 -> 3.11.1
Date: Wed,  3 Sep 2025 17:02:28 +0800
Message-ID: <20250903090317.2002-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119202

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Changelog:
============
* Correctly center images in fullscreen mode. This fixes a regression
  introduced in v3.11.
* New option: --tap-zones enables support for simple prev/next tap zones
* Fix --scale-down not scaling down the first image in floating i3 windows
  and similar setups

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/feh/{feh_3.10.3.bb => feh_3.11.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/feh/{feh_3.10.3.bb => feh_3.11.1.bb} (78%)

diff --git a/meta-oe/recipes-graphics/feh/feh_3.10.3.bb b/meta-oe/recipes-graphics/feh/feh_3.11.1.bb
similarity index 78%
rename from meta-oe/recipes-graphics/feh/feh_3.10.3.bb
rename to meta-oe/recipes-graphics/feh/feh_3.11.1.bb
index 5ab333c60d..1a269624a7 100644
--- a/meta-oe/recipes-graphics/feh/feh_3.10.3.bb
+++ b/meta-oe/recipes-graphics/feh/feh_3.11.1.bb
@@ -2,14 +2,14 @@ SUMMARY = "X11 image viewer aimed mostly at console users"
 HOMEPAGE = "https://feh.finalrewind.org/"
 SECTION = "x11/utils"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=150e4c518ff8aaecfe35694e47661d9a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=275a549d1abc07e3bae1d7137f53f602"
 DEPENDS = "\
     imlib2 \
     virtual/libx11 libxt\
 "
 
 SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "5426e2799770217af1e01c2e8c182d9ca8687d84613321d8ab4a66fe4041e9c8"
+SRC_URI[sha256sum] = "43d8e6742ec273ef3084bde82c5ead5a074348d9bfce28f1b0f8504623ca9b74"
 
 inherit mime-xdg features_check
 # depends on virtual/libx11
-- 
2.43.0


