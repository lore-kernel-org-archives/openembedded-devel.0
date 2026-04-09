Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2F7EA3C48
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:41 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128847.1775730871027615941
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k3kvBXsp;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730872; x=1807266872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hNGDH8n/SntjSn3MZsFBN2Kv3V3GbWQlDuOBghS1//k=;
  b=k3kvBXsp905wIeODjGxPpB7PuYmvfhYyHW9rH3789tQz5s/2qhlViFPJ
   MbMlRs5gmkyCcJzQXGYzx4r6Lgle9It1UdjkrxhKt7rmHGcbPwybZ6yHK
   4BpxLpJTk8VKdKW2cpkr6qBcXzRYl6kAxt1gplU3LFocobaCI/iCUxr3w
   Gy0zEP8/3F4QgsXw3D+glAbT7Ha2E48f7TNGqNp87uaoqrpVO2YtEVdf+
   ZgtS573rz0e2Tmowyj56el9Kxm3kmdGgVvtl+NQU6yiiVzxOLi+1s6hDg
   cYdJTSTGumxkaUEFzPFbJyyJ/FMVuEBT5kftQIhWtYrBikyWtAS3euLQ8
   A==;
X-CSE-ConnectionGUID: MaNkuopgSRyMTXGOM7g5EA==
X-CSE-MsgGUID: 5Jlb4efHRYySvTq/ZROgtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="215190678"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="215190678"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:32 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0BBC23E5
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:32 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A95551C002CE
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 0D345405EC0;
	Thu,  9 Apr 2026 10:34:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 34/37] rtorrent: upgrade 0.16.8 -> 0.16.9
Date: Thu,  9 Apr 2026 18:32:20 +0800
Message-ID: <20260409103223.1574-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126183

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rtorrent/{rtorrent_0.16.8.bb => rtorrent_0.16.9.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.16.8.bb => rtorrent_0.16.9.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.8.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.9.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.8.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.9.bb
index 9fc6f1e5e9..7ce38e9597 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.8.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.9.bb
@@ -7,7 +7,7 @@ DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurse
 
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "39f186e523f6ea2e72a3715a72d6e9ae4081ed84"
+SRCREV = "b78fd9aef5d0060fe7bd8447cace38606e03f41c"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


