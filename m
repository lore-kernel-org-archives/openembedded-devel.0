Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D7DC04FE0
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:16 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.730.1689654366337396837
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124880111"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124880111"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:08 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A1B2C68E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:06 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BFC82D5E99
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:05 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 43B5B20077821;
	Tue, 18 Jul 2023 13:26:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] redis: upgrade 6.2.12 -> 6.2.13
Date: Tue, 18 Jul 2023 12:25:17 +0800
Message-Id: <1689654348-30702-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--3.114300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrhomn0bwgVmnfUZT83lbkEIIP
	FubbBVyA+7QcRaVoa8n/tdOuViNvuC/7QU2czuUN71Wx2uUbPLcc0o6rNiKBil42zm1Zi+MJEg8
	/ER9uFpC/bkLOtLfEowGN2ThlUwL/5UcZtwNsCroURSScn+QSXt8dWDYdvqmp9zw4lzv7RUmOhz
	Oa6g8Krfj4MdEC5iYTvEbgRcuNU6CeKV6hOayhaTwwEuyE7Zkr/1l3D08qgvkTysrDN2EdkseIj
	nZR5l9mLBHvay4sZ41jVpd2RabaLh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103905

From: Wang Mingyu <wangmy@fujitsu.com>

Changelogg:
==========
Re-enable downscale rehashing while there is a fork child

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/redis/{redis_6.2.12.bb => redis_6.2.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.12.bb => redis_6.2.13.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.12.bb b/meta-oe/recipes-extended/redis/redis_6.2.13.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.12.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.13.bb
index 3ed6867816..640831c525 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.13.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "75352eef41e97e84bfa94292cbac79e5add5345fc79787df5cbdff703353fb1b"
+SRC_URI[sha256sum] = "89ff27c80d420456a721ccfb3beb7cc628d883c53059803513749e13214a23d1"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.34.1


