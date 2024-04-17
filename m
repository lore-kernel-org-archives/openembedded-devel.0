Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59257C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.2722.1713318097681945973
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DBsc8JOX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318098; x=1744854098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/JUXpX5r5tMcDouwrHLBZtUoaPZ5gzn1plyXGdl9NBI=;
  b=DBsc8JOXI3llPBOqNw8ELARd+3ymuYONv6X4SK0mLQ7VBv1klhLuF3s+
   FCqE5kj3t69GI0XKvWnBwPYYpM1f9T2A53XfLPeMsmXQrMw2S2NeP7pYv
   TsofJB6OHarIuPcg82IEUkzhFCIZjQe6Xa1s5N6w7VJgKdyEqZjRVfQMW
   0TXZLTZi2fDadSbDvqiC2Jsp0dHuvB7TNi1thDrur+Ki4HkcbEQOcRJBz
   KBQLcMxZYw5YuZ01R4UALbc11rWWnRc8UDYA89aGBTBgoWqxqUubPEtHe
   rj/stkw3k59Zp9aiyCUT4qmPZ4VpwculHw5d1EY+aClGCju8rB7oUZuO7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="155671431"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="155671431"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:36 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 82E5895DCC
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B01B84D286
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 337AC6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D44211A0002;
	Wed, 17 Apr 2024 09:41:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/49] python3-joblib: upgrade 1.3.2 -> 1.4.0
Date: Wed, 17 Apr 2024 09:40:39 +0800
Message-Id: <1713318061-17128-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--1.026300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz2TGbn8piuR+zOc
	/x+uTORRVa/f5wGYgmMbG/D4n/ZKiqT0moCbwIfm/FWPZfhEKhaAehnMPny2yLHhMmAQGLCGVO6
	/og4Gm/iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110013

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/joblib/joblib/releases/tag/1.4.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-joblib_1.3.2.bb => python3-joblib_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-joblib_1.3.2.bb => python3-joblib_1.4.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.3.2.bb b/meta-python/recipes-devtools/python/python3-joblib_1.4.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-joblib_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-joblib_1.4.0.bb
index d68b40e38..868e3f211 100644
--- a/meta-python/recipes-devtools/python/python3-joblib_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-joblib_1.4.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2e481820abf0a70a18011a30153df066"
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "92f865e621e17784e7955080b6d042489e3b8e294949cc44c6eac304f59772b1"
+SRC_URI[sha256sum] = "1eb0dc091919cd384490de890cb5dfd538410a6d4b3b54eef09fb8c50b409b1c"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.34.1


