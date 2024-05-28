Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB89C25B7C
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:50:59 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.12888.1716861055719144772
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cYa9vH3Z;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861055; x=1748397055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KFg6rn4dmv7sfazW7TMa3EKy8oqGqybjMPrRxUPjgys=;
  b=cYa9vH3Zms4QWSTKB//iclohPKbBS88emOnrnDSY4Irrvb8HJavs9FEi
   zAIm4mRrz+zy+UAmWkS9E2aPyW0WOyz4VzZnF1QiiKsKD3O5DUV6TRO/Y
   QNvQuXYzxUlu0s6+XYv1jVJGQ9I65XMq6XKS9QdeqiA5EcNqRBniOtyL8
   D4s575F7QX74iWpbmdfz17iQuSsh6NZGpBEWmGoyy4Mj3DQeNmuRiTYcR
   pp+ZQZf/+46itdslS58Ky8ZoBoDhdGiZkj++9xdo2dhQrfKauB0cx4RWv
   pL+QrYCJ5Z1QF1IMMv4MNlgrxH0hGW9jYh+SCqL4K+HJ61ZK9nBJDMAtC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="148784905"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="148784905"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:50:53 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D8F6CA1E5
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:51 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A6FCBD7886
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 33257411AA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D5D331A000A;
	Tue, 28 May 2024 09:50:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 36/40] redis: upgrade 7.2.4 -> 7.2.5
Date: Tue, 28 May 2024 09:48:17 +0800
Message-Id: <1716860901-863-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--3.249900-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmIAf/HImzvCGMwNeg64CU4uMKPrF7dK57MgX2Xt4pvYkcgVyTd/p+/IKsm
	10TThDCKxfbhqGxLk+4Ay6p60ZV62To3UJuRLIoQBpRCTkRk5SfoLR4+zsDTtDbLQl5n/OxyKQS
	k1kvgRe/YuANIaXKaaXBt6IJyk1gEvNohlalYJ/lEVYuPqymPKCCQMdULUIeMwKykzt/RRbbcds
	1f99GEnutOTg47Y5FfyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110571

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/redis/{redis_7.2.4.bb => redis_7.2.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.2.4.bb => redis_7.2.5.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.2.4.bb b/meta-oe/recipes-extended/redis/redis_7.2.5.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.2.4.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.5.bb
index f23eabe3b..bfb46240a 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.4.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.5.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "8d104c26a154b29fd67d6568b4f375212212ad41e0c2caa3d66480e78dbd3b59"
+SRC_URI[sha256sum] = "5981179706f8391f03be91d951acafaeda91af7fac56beffb2701963103e423d"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
 
-- 
2.34.1


