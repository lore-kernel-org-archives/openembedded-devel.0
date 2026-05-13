Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1BCCD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:20:38 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.253.1778646033021592999
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XNAhuY5L;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778646033; x=1810182033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cvfb2SeuazaYXtej1p26Ky2mJsr1f6pL00WoSClqRLM=;
  b=XNAhuY5LaifLLJI6GT7/FuhDNRtdA50c6AFT3fM69rYcxlhJGxSVH21m
   f9qadctzSwgH73hcBlDPH3WWdhECVxDThkE75cmlpfXqMX6Nid6jKjiPu
   xzyKzPF26mj9Q5LuBxM5xwTLFNPpj64O7E4xDuiegvo7DLDSRBfOf/jh4
   xcx/ASos4FEtePeZb4VPD1/YjmkG3IMqcAm4z19a6KV0FyInljS6nvGdF
   8yC+Bs5nb6XK5gABsCc7SzA05mFGTbn7v8YVIf8b5OvYku+rfHe80ILDg
   rn+YSUa4NopYqySXZJmyQEUQn0FG2HrMO/gzZ8iany5JMVf5ASwBUH0u6
   A==;
X-CSE-ConnectionGUID: WEfgKySXTiOTLqI+ymANUA==
X-CSE-MsgGUID: GUy00Lq8T+mm3xfq4dTkNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="228216451"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="228216451"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:20:31 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7BC818200A3
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:31 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 2F647C041EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id CDD511400251;
	Wed, 13 May 2026 04:20:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 50/56] rtorrent: upgrade 0.16.10 -> 0.16.11
Date: Wed, 13 May 2026 12:19:46 +0800
Message-ID: <20260513041952.450-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041952.450-1-wangmy@fujitsu.com>
References: <20260513041952.450-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126933

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix off-by-one bug in SCgiTask::event_read
- Don't use std::scoped_lock in CurlStack as it doesn't support unlocking just one mutex
- Don't throw when DhtSearch is not found in DhtServer

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rtorrent/{rtorrent_0.16.10.bb => rtorrent_0.16.11.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.16.10.bb => rtorrent_0.16.11.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.10.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.11.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.10.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.11.bb
index 36ef5a623e..559c29036c 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.10.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.11.bb
@@ -7,7 +7,7 @@ DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurse
 
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "b5a606649a4800deb44c31d3ad74d01b4c5ca37a"
+SRCREV = "2700b3141f966d8533a6153491e1c76b3cf5c2b9"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


