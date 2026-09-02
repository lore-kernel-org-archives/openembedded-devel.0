Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F95C624DB
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9734.1788344980399250123
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pdt23YSt;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344980; x=1819880980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y/NprhdfKUP0rhSL5gTw/tLC2eTjN7+Wp84qdYX0ZMc=;
  b=pdt23YStBiL7cR+5zTIuXThfN/YYe4OL1re+k6vXf5OseGTo5J+IknQ9
   tkiK+wX/5ItveQg9tMzV1FWkvq8PUTVueuKzqHv2nfiKTDFvNP4g6LkER
   BhU/M1QDI1PEALieYRR6Y9GMdKnLDRuVWFjWTYDc9fbC37uwfiSLYtmS4
   TbWVO4lYVxy8+yjLdiUNEzGkM2rL+ncpQ/EOzUNPr3WqknPTJ6dWmDFbl
   3PEU0TwdFTKwp5kpvAWLs+7Ia/Z1Hu/DMiwSyq8RgV8zw/RwoMwHAuvzZ
   Tus6JOcAiLKBhOvUBG2AKmDtNxyGgiaHGzXx7r9AgQUZzVnBes34Gmn4G
   g==;
X-CSE-ConnectionGUID: 7Aa7tgwYQrqxvTH5gftnhw==
X-CSE-MsgGUID: K6eBUHPdQGKRl29i3hXUNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="241060694"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="241060694"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:39 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D5D541C1C72D
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:38 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 8A0D71400382
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 8A6902000224;
	Wed,  2 Sep 2026 10:29:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/34] python3-ipython: upgrade 9.16.1 -> 9.17.0
Date: Wed,  2 Sep 2026 18:28:43 +0800
Message-ID: <20260902102900.1296-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129676

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.16.1.bb => python3-ipython_9.17.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.16.1.bb => python3-ipython_9.17.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.16.1.bb b/meta-python/recipes-devtools/python/python3-ipython_9.17.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.16.1.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.17.0.bb
index 79aa7c1114..8e4b26cf23 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.17.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=954609b5a3603364bc25989a92e38d67"
 
-SRC_URI[sha256sum] = "5a3d1f9a47ff216d6cf9cf863124f6a2c1a198d1354c546a4d24a370a283b64c"
+SRC_URI[sha256sum] = "1dc69e6966b270fb259f676c71a21450e63607729b14a672b942914a54e8b730"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


