Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F66DCD5822
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:14 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3057.1767781750884519406
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jIM7TNpl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781752; x=1799317752;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gZyziRYOyIw+weCAsfM48PKIfY1dH6Gm819ni6467ns=;
  b=jIM7TNpldq7BZPrXxvA1tqw9OMQBPDy7Gb32+Uj9AxKaiFHpHNiYZBWc
   AvK2QyGXUF21Jd/Lz8aml8kV99R1wHyTVFG1FpDB9Y1M4Xqh8px1CjBpL
   mCNoujjmwU6GBIXklz8WdV+mC6WDHbZmS5GH1YFtv878rw7woV9n54AbQ
   gtVc2XzJGBBvpzSpMzPGkdvpnQUB7SlHH1OP1ZQaK8zUsrLyMe90Ohb5k
   uo392mQnzS3Pno9EXrmpFeZApcwFGXcc6F2dHW3Yr6ZpuaBPtxD50vrH8
   823d4SpsTwpF3XjahmiBgt0vwLq5+CXxIqove8m5ZXetdX9OLX2woGiZz
   A==;
X-CSE-ConnectionGUID: EYBw2x2CTVeb+dP1u6VGxQ==
X-CSE-MsgGUID: 5LnKpnwYSQGWFMbaUx+Izw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="225054561"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="225054561"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:10 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 26D2E1C1C709
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:09 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id CE3FF896E27
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id F3C4C82173E;
	Wed,  7 Jan 2026 10:29:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/24] gpsd: upgrade 3.27.2 -> 3.27.3
Date: Wed,  7 Jan 2026 18:28:35 +0800
Message-ID: <20260107102855.228-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123202

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix API major value.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-navigation/gpsd/{gpsd_3.27.2.bb => gpsd_3.27.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.27.2.bb => gpsd_3.27.3.bb} (98%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.2.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.3.bb
similarity index 98%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.27.2.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.27.3.bb
index f8fa47ad54..5b2d6d97d2 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.2.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.3.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://gpsd.io/"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
            "
-SRC_URI[sha256sum] = "ebb66ed92018b79cec88efb60e35a596925eef46502cf03d6ff0aea636ee7461"
+SRC_URI[sha256sum] = "a4d85b67797522ae8611958b5fda0bb67e4921afe26bd53e1d2ff0a4158daccb"
 
 inherit scons update-rc.d python3-dir python3native systemd update-alternatives pkgconfig
 
-- 
2.43.0


