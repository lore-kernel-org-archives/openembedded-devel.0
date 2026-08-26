Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5A3C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:09:43 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7651.1787731781243571150
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JH9f1FUP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731785; x=1819267785;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XWuywv565R78h5Dldp2P2/DWjmJC1CFRdpEYJh2d0KU=;
  b=JH9f1FUPyy8aDWDfJsJooFmxjEx1y2ALfzBqKhhp4C4Stb9hLOclLuyU
   XCztq5i46xg6CFWcukASuhaZqWY13Mf9S/n+4a00ZS/6WdgYBfltFsTI4
   Hy3xmDES+Mvzgu7hX+1AFxRe1Rps1SjqzKJzqZ4Akp60gfIiwvAiPxDdM
   hzB7T411t3V7knnQ3UylcFa4M6FyT+1oWzj7mbRVQ7KMe07hMUmHQGMsj
   biiA7ynvGKPnzgwhEUydups3H6U+uVEjgvEbIpOgWTqcouNLG6Bh9oLkO
   mrrQs9Q/JQasKQjGXvckcUslAQ1N317tTCRZMIKPfvoYY6IimWtjehBG7
   g==;
X-CSE-ConnectionGUID: +zz6x3BUSma4sLrwM4F6bQ==
X-CSE-MsgGUID: d470XmVISS2ND3xqGr7YWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252713202"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252713202"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:43 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5F61F1C000E6
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:39 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 0ED531004174
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1CE1F14000B3;
	Wed, 26 Aug 2026 08:09:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/23] libdeflate: upgrade 1.25 -> 1.26
Date: Wed, 26 Aug 2026 16:09:08 +0800
Message-ID: <20260826080926.989-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129497

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdeflate/{libdeflate_1.25.bb => libdeflate_1.26.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libdeflate/{libdeflate_1.25.bb => libdeflate_1.26.bb} (81%)

diff --git a/meta-oe/recipes-extended/libdeflate/libdeflate_1.25.bb b/meta-oe/recipes-extended/libdeflate/libdeflate_1.26.bb
similarity index 81%
rename from meta-oe/recipes-extended/libdeflate/libdeflate_1.25.bb
rename to meta-oe/recipes-extended/libdeflate/libdeflate_1.26.bb
index f4b1eff83f..bbf8eeca73 100644
--- a/meta-oe/recipes-extended/libdeflate/libdeflate_1.25.bb
+++ b/meta-oe/recipes-extended/libdeflate/libdeflate_1.26.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=89f8c510215440fe2f208fba4afe07e0"
 
 DEPENDS += "gzip zlib"
 
-SRC_URI = "git://github.com/ebiggers/libdeflate.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/ebiggers/libdeflate.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "c8c56a20f8f621e6a966b716b31f1dedab6a41e3"
+SRCREV = "92e6a0db9fa848d742f9eb286c92afc60f2c3dda"
 
 inherit cmake pkgconfig
-- 
2.43.0


