Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B30C071FD
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.2752.1713318084653750276
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AxE/6WlG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318089; x=1744854089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MOvJbwvHtxyIv5DNzMbcVox4E4jX6tCPj6F9X07SYzI=;
  b=AxE/6WlGUAC1/xiESVMKoJOMLsN6u/cnrnVlMyjmhwP4S38s6T/mwrnD
   pc33Evm6dwUBZABnyA0Nz9rdx7e/4OKi/yJzr52BuL9FcPJj5Ztjv24Om
   XG2Wfkdjjywd3Qts8YNJcNCBVyJz2G2wFaHua/P3LG9zb9GVg1uUge3YZ
   pTAZOqogMF8dvX9Y46DKh3+EZHBzLonvP/AxK803Ru8KJgfd5+JBdyrbL
   dPgV4rvYmHX08BBq59jDefoJb/P3i4CNQefPb+Y0W6JFebEqJIkmcae4+
   I+19s3MIyu5VEw7Up0oosWZx9KsJObLnHqjXRtPNzBZPmtAaXZ84HnKsN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="155837354"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="155837354"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:28 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 642F1E4EB6
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9650EF656
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 10FB46B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B1AC11A0002;
	Wed, 17 Apr 2024 09:41:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/49] python3-aiodns: upgrade 3.1.1 -> 3.2.0
Date: Wed, 17 Apr 2024 09:40:27 +0800
Message-Id: <1713318061-17128-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--1.254300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mra9qiaDSLgo3uebKrFNJkRb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz6geNzQv+Q0pIxW
	K/Larb3Lmzmyc51tbN9FF/9yP9d3n8It2iXSJZBdMEeijfR6pB9UkGL/5pWIfCqzfGmVgGAyFrV
	XU9yzCjiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110000

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Update test_query_ptr test to use address with PTR record
-Added a missing py.typed file for wheel
-Add Winloop as a valid EventLoop
-Add support for getaddrinfo
-Add support for getnameinfo

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-aiodns_3.1.1.bb => python3-aiodns_3.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiodns_3.1.1.bb => python3-aiodns_3.2.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-aiodns_3.1.1.bb b/meta-python/recipes-devtools/python/python3-aiodns_3.2.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-aiodns_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-aiodns_3.2.0.bb
index ec7d62ee2..bf3f1312d 100644
--- a/meta-python/recipes-devtools/python/python3-aiodns_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiodns_3.2.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/saghul/aiodns"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a565d8b5d06b9620968a135a2657b093"
 
-SRC_URI[sha256sum] = "1073eac48185f7a4150cad7f96a5192d6911f12b4fb894de80a088508c9b3a99"
+SRC_URI[sha256sum] = "62869b23409349c21b072883ec8998316b234c9a9e36675756e8e317e8768f72"
 
 PYPI_PACKAGE = "aiodns"
 
-- 
2.34.1


