Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D3FC3ABB2
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:15:53 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.7618.1745900153105853057
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WnJNCF0U;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900153; x=1777436153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=r0W93PcjeLEqrEug2T6uUxgBUWVCVsaSempDNFnVUYg=;
  b=WnJNCF0UA+uxuF4ZldV4VbEnXMkCHJV85BqqG+YnbThkQ7VWRmxY6Pcr
   PvBMdUCXogf/F9RTtjvL/tULCCAJcJI/JbHg9JfyZNwICWbBiajbvxPlZ
   sGC1DiSad9jfSerSwhKllenoGKhQ8/EhuBwY6qkEPbgkbka4Rov6T6Eq7
   ZC5JIg9962qmdWBqgIuPmJjHl6nJ2p3PvYiQetnwLfxEYTAPZCsrkk3oo
   rV1VtX2EXpx2YAv3MMpQtjwR+IdzM0OcWaG0Lca3f97dMV3aPsbEvn9uX
   TrmUDDvB9CxpS36qUZHHrPnXpoOB79fEjRp2gvtTC7TcsehbflBZLYN6y
   w==;
X-CSE-ConnectionGUID: QbhGpd+/RV2442It+EaV6w==
X-CSE-MsgGUID: aC3YJHk+SqCh6wJy6F5Gaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="176882987"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="176882987"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:50 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 08E81D4C4A
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id BB5A7D4BCC
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:48 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4EA461A009A;
	Tue, 29 Apr 2025 12:15:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/23] python3-gevent: upgrade 24.11.1 -> 25.4.2
Date: Tue, 29 Apr 2025 12:15:26 +0800
Message-Id: <1745900138-26424-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117216

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gevent_24.11.1.bb => python3-gevent_25.4.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_24.11.1.bb => python3-gevent_25.4.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_24.11.1.bb b/meta-python/recipes-devtools/python/python3-gevent_25.4.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-gevent_24.11.1.bb
rename to meta-python/recipes-devtools/python/python3-gevent_25.4.2.bb
index 1b88ba6fe8..b66fd5c8cf 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_24.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_25.4.2.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} = "python3-greenlet \
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "8bd1419114e9e4a3ed33a5bad766afff9a3cf765cb440a582a1b3a9bc80c1aca"
+SRC_URI[sha256sum] = "7ffba461458ed28a85a01285ea0e0dc14f883204d17ce5ed82fa839a9d620028"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


