Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E70DC18E72
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:16:21 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.14071.1713777370176135847
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SglMsK/s;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713777371; x=1745313371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TEr+KtfSqLeJQBGaDWw0qrLPKwHUx84zrhYQq/b9/Sw=;
  b=SglMsK/scwnJLdUBbx74Rxssaj7L6RAMl8hh8tevTYs99sDp0Cdt1OOB
   tqPFF0AzK0ne4xz2bkyB+p2DB1AbTjP4IamQH7pw1esT6PPdw5i9tIm8f
   LCSNNgeTpz0tjOkMrdxLQqr0rPyPnYIkTTakonX51Fgxf4TLZiKm3qsJ8
   2Hy56DQGdotBlUo6AczPhsGbKVc2rDhvA5okBwCGw/m23AJW81vUl7WpG
   B0++cTv1Ba3/bGadOrmBP371EOVRHB/Oe8bU4a5uOD/yutTsID9YmrO7t
   b5WpuZAzif7HQSD1AEyBvi0w7GNOsTd2DrVmFNrgVrXPF25xgj72sAXba
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="144774011"
X-IronPort-AV: E=Sophos;i="6.07,220,1708354800"; 
   d="scan'208";a="144774011"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 18:16:09 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 97792D500E
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CC40AD7B66
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FDEA6BC6F
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0A55B1A000B;
	Mon, 22 Apr 2024 17:16:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/15] python3-grpcio: upgrade 1.62.1 -> 1.62.2
Date: Mon, 22 Apr 2024 17:15:38 +0800
Message-Id: <1713777345-29264-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
References: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28336.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28336.006
X-TMASE-Result: 10-0.662500-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyseVAKp7ODjmWB9
	LYuXLqg2QtOthS+AmMDy9zcRSkKate1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQCmL
	ENVLWzfeUTVij24f8RdTDT167hvRYS62nMBX/dwPdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtoTkvT3rz/vrKDW3tKxSTtQYWow+h9LLHacCc8srnxHFrLT5BWQnd0lSHi
	HA+XCIpNo9+YCNkF03VGR1A7iRrrATWGMQaaCbMHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110090

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 [Fix Python Deadlock] Guard grpc_google_default_credentials_create with nogil

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-grpcio_1.62.1.bb => python3-grpcio_1.62.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.62.1.bb => python3-grpcio_1.62.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.62.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.62.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
index 8405ebed0..3148f6376 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.62.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
@@ -10,7 +10,7 @@ SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://abseil-ppc-fixes.patch \
            file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
            "
-SRC_URI[sha256sum] = "6c455e008fa86d9e9a9d85bb76da4277c0d7d9668a3bfa70dbe86e9f3c759947"
+SRC_URI[sha256sum] = "c77618071d96b7a8be2c10701a98537823b9c65ba256c0b9067e0594cdbd954d"
 
 RDEPENDS:${PN} = "python3-protobuf"
 
-- 
2.34.1


