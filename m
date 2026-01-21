Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE73FC44503
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:29:30 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9433.1768994970034280115
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:29:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oPDHlg3I;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768994971; x=1800530971;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XGalaApzRPasIwEhjwt3khevo7SRc/0dt5vL+m6+JWk=;
  b=oPDHlg3IlxqxuGoO8S6ITwWDSdW6ZC7e7htntBrMQ9CDX+O7nyXyEYvX
   lc7BRntqPROu2lkSgl4j4+N7VCJzeaWfMkJOph8MXeFNi1NAQHsYr+1W1
   krF+cxuYaju1DXBb95Ic+gwaVeBSpKFhQb8t6R0Qd8b3ecH9Gp/EDQfad
   Rmj1WLvTT1T75sIZWEjtTY3TbENTZbe0vlKWOWC6mdePDbJl1K6XVw3V9
   1Q1Uq6U+QD8gV9VNDGZuLhdX08OiZoydbBXcq4QKipPtZ0i3x6++cWVa9
   Uih3gaHEy2Uy79baoeQ9fbU4Otz3gnmvTzh+Rrn/wma8MqJy7jKcitKN4
   A==;
X-CSE-ConnectionGUID: BlvmISQoQIe+xwKrxVuaBQ==
X-CSE-MsgGUID: xSUCzNX9TqOiAbmxvLtIvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="226551685"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="226551685"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:29:29 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 02E12100034E
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:28 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id AD5501803218
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1BCEB1404866;
	Wed, 21 Jan 2026 11:29:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 01/30] babl: upgrade 0.1.118 -> 0.1.120
Date: Wed, 21 Jan 2026 19:28:52 +0800
Message-ID: <20260121112921.857-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123692

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gimp/babl/{babl_0.1.118.bb => babl_0.1.120.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.118.bb => babl_0.1.120.bb} (84%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.118.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.120.bb
similarity index 84%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.118.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.120.bb
index b120208fad..0c3b54cfd4 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.118.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.120.bb
@@ -10,7 +10,7 @@ inherit setuptools3 gnomebase gobject-introspection vala
 DEPENDS += "lcms"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "c3febe923e225c2a58f952689a89bb1db956788bfecb18a7eff6fc94da9e2469"
+SRC_URI[sha256sum] = "f476ad15201fb4ed0c90c174c524b1e4271ccd69a377242d6a69fcdf87ceacc2"
 
 FILES:${PN} += "${libdir}/${BPN}-${@gnome_verdir("${PV}")}"
 
-- 
2.43.0


