Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5848CD1299
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:54 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.39361.1711983107514078672
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KkpC4FOt;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983109; x=1743519109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+KeOC/bCxwmilNggjNBk5XicdW5VOi8PQawYrmBVWEk=;
  b=KkpC4FOtoPvyZ4iJ23lXBh9SWyXL5eFAF1kK/sBAKijDceZZyl9cguTF
   0AmdoHvyXEXMEeAWGhXe6BwqlojYtVVhpWSW0k4o/sHBm9g1wL+0dKrne
   kVp+vhjAijKa/j1A7RFf3vXQgTetQ9iE2iQU9KfyYK8polal0JNxiS0WO
   QEABi6Z4oaTpEFF7cKG+Kjoy2Msj43D0fpBW7+c0O3lQ3v0eeLhQ82cau
   VHMiNvR++b2dBdTLYPP7qFdouoWlR12iT0gkLHSr2oaaxaClz+xoYR38O
   +icodqHQXeCzxpOarEYgtdF/oPEVnfNxUxLK0yWbLMxkTwzHg8H+5mMFu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="156148785"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="156148785"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:47 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4ACF1C6817
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 99284D9681
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 26FFB2289C4
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D209A1A000B;
	Mon,  1 Apr 2024 22:51:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 42/47] thingsboard-gateway: upgrade 3.4.5 -> 3.4.6
Date: Mon,  1 Apr 2024 22:51:14 +0800
Message-Id: <1711983079-16849-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--3.378900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4Bgl+ryMS6Q9gH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOMKPrF7dK57NuTKBinxl/umAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzAETZ6ic2+dF62I
	c9FsL7D+uCdOfgpnFRsbm90m0C9MUVAu6lf3M3E8ZLx3HgBvrpv6XLNoSsvV1rrQ37FLwVA1lVy
	r1Tm9LliB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109758

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hingsboard-gateway_3.4.5.bb => thingsboard-gateway_3.4.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.4.5.bb => thingsboard-gateway_3.4.6.bb} (95%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.5.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.6.bb
similarity index 95%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.5.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.6.bb
index c3eccb7f5..0d0f6fea4 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.5.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.6.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "673596b4f358cf7cca77bc5743bc1e50a2958dca5ccd815c0979d46fd43c9200"
+SRC_URI[sha256sum] = "fc24bb674308f05d963a1dbed8d0b38ead77424ad7cf032a2652732af48f1336"
 
 inherit pypi setuptools3
 
-- 
2.34.1


