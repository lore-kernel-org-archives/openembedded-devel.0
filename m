Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE2EC25B74
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:50:59 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.12719.1716861053517820238
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eOlZyO7E;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861056; x=1748397056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aMhgv1xWQG7zWg9fZpkP5P/Vtr5+Yik5qMu/sP54KEI=;
  b=eOlZyO7EDcicdpm8NkUqmmfmuaj4nhaml522+j7roG3KO9W38auCRnto
   36JHwWO4fw8FfJRZuHFAmNY3NsLznaYRKQl0tXm3e+OhBEi1dAJLKjqnI
   tt10euNZDyTk5Pju+KH56J73aK/he6UQ71slxIftdUVjIDIEXg7pu8MbV
   EnkY7bFcNMpiC2DBKksv22M7sr8jljYLZA+yNpbzHfsjbt4c9ORIUYVrt
   0hKjclHGCDaZhr20NGVHevuDoG15Xn/idBuXYWNDxh6Vh7aCCVmYZuHep
   2EtAFknTmvAqvse7RLRvLXLAC5ZF1rXTGlUrWGNukGHvsnfKjSV03sVLN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="139360311"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="139360311"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:50:55 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 445E49E6AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CEEBD20AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C5932007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AC3591A000A;
	Tue, 28 May 2024 09:50:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 37/40] thingsboard-gateway: upgrade 3.4.6 -> 3.5
Date: Tue, 28 May 2024 09:48:18 +0800
Message-Id: <1716860901-863-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--3.378900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4Bgl+ryMS6Q9gH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOMKPrF7dK57NuTKBinxl/umAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzuQG5qxOEY2OzzF
	4aXPwZlf1QKdiyYNMTgTqsppVhNK246V71ll/fMB0vMIfuGqlzk19WyLq+kMPRCxekJhNytX/Ye
	Uy02qjdiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110572

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{thingsboard-gateway_3.4.6.bb => thingsboard-gateway_3.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.4.6.bb => thingsboard-gateway_3.5.bb} (96%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.6.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.5.bb
similarity index 96%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.6.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.5.bb
index 246cdfe3f..2c749eeba 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.6.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "fc24bb674308f05d963a1dbed8d0b38ead77424ad7cf032a2652732af48f1336"
+SRC_URI[sha256sum] = "6505d94d3173e2469950b03d5b99dac4210af7b659a3a1a3b58da35b2a984da6"
 
 inherit pypi setuptools3
 
-- 
2.34.1


