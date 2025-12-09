Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE44AD3B7FB
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:57:10 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4148.1765274225677558917
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XMuQkNWo;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274225; x=1796810225;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QfdvOUqUM0DNKDWmeX+W9s6gp6lfkfVpxLKbKDBxSww=;
  b=XMuQkNWodademoTUuRPoX0BeQL61nMHtCIl78YY3xSKoJTtxophmd4ul
   wlu9xccxauf8hV9pLuFSDzE5pl/M4jRbSjChD1uyIR8LdmguhIZWT3Ipl
   vkfFbIxNTebnx+uzWs6IHW6mN8RaE006zjGBnx41Hz5isFmSzxgbWB/20
   IOwL6UAyMwCUdTg1ljVcSk+CfViUNuoA/mbVf3y5UWJjevouCQNS5ZUjR
   LueoDZP58Uj3pbpjyt3KYCxBstjT4NCOsmU3BqrXraA69A/+er2f0ok8H
   VaE0b9FgHya8eYtgvTENTIZ+HE9b4Z0DtRIklFNlThW5I/wKyJ7BWVjYG
   A==;
X-CSE-ConnectionGUID: +uMeO/gURTCwXgKGUhSPmQ==
X-CSE-MsgGUID: SJT4ITc3QgaGLXxaHCR7KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="200841203"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="200841203"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:57:04 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 172C78204D0
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:04 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id C1FB2C0183A
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 4509920002BA;
	Tue,  9 Dec 2025 09:57:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 32/38] rtorrent: upgrade 0.16.2 -> 0.16.5
Date: Tue,  9 Dec 2025 17:55:46 +0800
Message-ID: <20251209095552.690-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122436

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rtorrent/{rtorrent_0.16.2.bb => rtorrent_0.16.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.16.2.bb => rtorrent_0.16.5.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.2.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.5.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.2.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.5.bb
index e077efa22a..a7606d384d 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.2.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.5.bb
@@ -7,7 +7,7 @@ DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurse
 
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "8550facf43fd1e36b416bcdb3b025e7e09578364"
+SRCREV = "60cfcd37c4fb4a4ec31837a8f2127b4330e01bce"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


