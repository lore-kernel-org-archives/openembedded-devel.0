Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A90C5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:23 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3360.1787132241011139033
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iTsN31r0;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132245; x=1818668245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cf8pybGVZGS+jZJNQrwUFBYuYDCAcvdeudkL43nZVSo=;
  b=iTsN31r0yBxJgcRPFm4pVRVi8bnJLss6wt4phpp2e5LD7rVFx37P6KEB
   WhK5BtCDFGL5HdYmZ7qWCx9Ff/pHOJpnIjs9YS77JUaHsDJm3fUOquLVp
   X/S1BoKfnJzZ+e0BDPrnZ22qyE0VfeK1tSd2zjAIzcOr61vL0O1CEpMwn
   soQ3GVTqlmWUJBDMTac0JdKVrgMJxtdjWHLP2a7TFsjbHhqO0NaJGziTp
   Tc/L04tsjvNh4u58fgBRR4mbtDbzQ9YLiYXXsk/noAjWjkgXfVZ99Lza2
   tBMMmq9zhGaPUIXqQ2z16ceoE1we+yuGn+5i29dJMQ9+vya7xcgRVoKE+
   Q==;
X-CSE-ConnectionGUID: ABgte2vsRw6+t9RWmyhHww==
X-CSE-MsgGUID: KwVbaoAUQ/yWN8OjSUsYAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="255507992"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="255507992"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:37:23 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 77153406ECA
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:19 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 2ADC9101D6A2
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 2263C1801C0F;
	Wed, 19 Aug 2026 09:37:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 67/70] rtorrent: upgrade 0.16.19 -> 0.16.20
Date: Wed, 19 Aug 2026 17:35:11 +0800
Message-ID: <20260819093514.1101-67-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129337

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added WaitpidQueue to handle background process reaping
- Add system.sockets.min_generic, .reserved and .available commands
- Expose the socket allocation budget through SocketManager
- Cleaned up PeerConnection related code
- Bound size of HTTP tracker scrape responses
- Bound number of DHT packet processing
- Fix deprecated command redirects (rtorrent -D)
- system: keep the pipe fds SpawnProcess::execute() creates for capture by
- Fix github workflows

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rtorrent/{rtorrent_0.16.19.bb => rtorrent_0.16.20.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.16.19.bb => rtorrent_0.16.20.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.19.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.20.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.19.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.20.bb
index 29c5805916..29839afcd8 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.19.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.20.bb
@@ -7,7 +7,7 @@ DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurse
 
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "247ae7621a7d2596a7f3df69e417b0835b5409cb"
+SRCREV = "dd3ddf7c391ada92e4ba86fb6afd8a6cc01446b8"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


