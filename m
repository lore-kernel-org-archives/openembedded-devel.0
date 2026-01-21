Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18287C4451E
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:33:31 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9496.1768995198442528768
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iPDEii2Z;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995197; x=1800531197;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5ALTmuzWmqeJ9EhPlAEiNm3HbRcQZSWzeHXevTUFj4I=;
  b=iPDEii2ZeV9SMOchhsgD/jSFXYU9MojEAkfCq2a8W5u9q3gKsmZ02VL/
   5JpRrlp2VFI2wziD09Dgz6bQYKwGMFoMi0/qYBSndvogyI55P4VI5zvy2
   KA5Gc62XLCfPKT+Z8voPaW3JWeJEZMpGvjux5vkZnLkn86y3gE1J3Dgly
   eM8tp8i26pRAPIjQXKgPFqloywAuSQwoJWPy/FOJeAojTdxwCx625Jq/f
   DespH2ZvNzdpvwFXmzG3IBiTfxDvlbIkHXaaVxZLf/IOeR2VMJ3af8y0x
   7IRGSvHqYWljrX2xO5OGmOvFhzfovWY+DR9N9rzjsVzA0yG80hOZ795+K
   A==;
X-CSE-ConnectionGUID: pW/PMpLNTaur4jICeJF9qQ==
X-CSE-MsgGUID: pnxk2wFkSrOwhppmSmoW5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="230602375"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="230602375"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:33:15 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 0C39142A317
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:33:17 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B0F83C021A9
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:33:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1CA961401D61;
	Wed, 21 Jan 2026 11:33:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 29/30] gpsd: upgrade 3.27.3 -> 3.27.5
Date: Wed, 21 Jan 2026 19:29:20 +0800
Message-ID: <20260121112921.857-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123720

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-navigation/gpsd/{gpsd_3.27.3.bb => gpsd_3.27.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.27.3.bb => gpsd_3.27.5.bb} (98%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.3.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
similarity index 98%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.27.3.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
index 5b2d6d97d2..f7ca367fa4 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.3.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://gpsd.io/"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
            "
-SRC_URI[sha256sum] = "a4d85b67797522ae8611958b5fda0bb67e4921afe26bd53e1d2ff0a4158daccb"
+SRC_URI[sha256sum] = "409873f5048462ef1ac413a51ab35caa8b50b31be62b3347bee1cc2994e7c649"
 
 inherit scons update-rc.d python3-dir python3native systemd update-alternatives pkgconfig
 
-- 
2.43.0


