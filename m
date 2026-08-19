Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87238C5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:35:50 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3281.1787132142647665514
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YFmrrbaS;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132142; x=1818668142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n8ukRxi9JcTTx2ewvonVIcGuyesNtCD8spNJQKV7P+k=;
  b=YFmrrbaSn8ZSpMYklXUX4RgVEODBuH/eduTlSlmgncsnP6PMxQvuuPOV
   4V2m5MFAWB+Ks7go7lBPlcmSVLBXZ1cz910gBEOgZt00kS9tvrVbhgffh
   SL0Dc8PPOdWFDC8w1qWM0HUfzKyBUjhCBUMnasKDKFMb1FzaZi7S8EFDZ
   u4SH2NtEHvRbTwWebWjFvXHAh5J/qFx+GXIe3XJRkniBtnzJlqxsCM79j
   yyERqJ4YK6oqRNskmDjnHzMdu3OLWd7r2/vJwpU6AilkwPGdRjnH4KLYf
   +83kTaZOCRhdQO4/OAM6xTTWlgmhE3B0BY8MuGq4qG2CRXe0Z+/lxUvt4
   A==;
X-CSE-ConnectionGUID: Bce5u/8BRRWhYJifcpi/Bg==
X-CSE-MsgGUID: cYDyD3fpSiakKcPoXBSMOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239835306"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239835306"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:40 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D02301002B81
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:40 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 8B9A0148CE43
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9324B1801C0A;
	Wed, 19 Aug 2026 09:35:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/70] libtorrent: upgrade 0.16.19 -> 0.16.20
Date: Wed, 19 Aug 2026 17:34:16 +0800
Message-ID: <20260819093514.1101-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129282

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtorrent/{libtorrent_0.16.19.bb => libtorrent_0.16.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.16.19.bb => libtorrent_0.16.20.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.19.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.20.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.19.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.20.bb
index 892adb902c..4a4d1cf919 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.19.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.20.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "74b88c154d634c4fc6ee32a6a9e49f1da75725f8"
+SRCREV = "ea68bf287e36a13fa0c13c965dee6c3d40e3d242"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


