Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B64FC7EE37
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:57:47 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.6078.1684997864245712497
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="117900016"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="117900016"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:57:42 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 32218DAE0B
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:40 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D883D67B0
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:39 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CF302FC91FB;
	Thu, 25 May 2023 15:57:38 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-coverage: upgrade 7.2.5 -> 7.2.6
Date: Thu, 25 May 2023 14:57:24 +0800
Message-Id: <1684997851-2098-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
References: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27648.005
X-TMASE-Result: 10--3.111100-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvG5dXdQTj2OD/2
	1AwfBazEyBgPwqdPunaHIX2JO/wOMnzLTypR/JvIYCs5AYZvXC/AmOfzKotTopyka59saICoZs1
	hYwzdNrXWOIwXTRQ3JQ3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXBX18z5X2O3tT1r
	rN8sUDVuyz2v/93Du3BhQWw3lZ+IU7BOj1lchJLN0KiTeJteVBfS0Ip2eEHnwj/1Rbkzl1EwuTL
	po5HEc1joczmuoPCq2bwxltKG7ptFIYKB/vBucXm6sS/Uy8zEgQ9xzF2Ip45B9JULBCaGptb4nI
	1iezYce9ZTlz/h1Mf9aQ9oZPJmxccSYZyuNYTNEdJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhF
	TP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102822

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix: the lcov command could raise an IndexError exception if a file is
  translated to Python but then executed under its own name. Jinja2 does this
  when rendering templates. Fixes issue 1553.
- Python 3.12 beta 1 now inlines comprehensions. Previously they were compiled
  as invisible functions and coverage.py would warn you if they weren't
  completely executed. This no longer happens under Python 3.12.
- Fix: the coverage debug sys command includes some environment variables in its
  output. This could have included sensitive data. Those values are now hidden
  with asterisks, closing issue 1628.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.2.5.bb => python3-coverage_7.2.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.2.5.bb => python3-coverage_7.2.6.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.2.5.bb b/meta-python/recipes-devtools/python/python3-coverage_7.2.6.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.2.5.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.2.6.bb
index fa6c5203e..b13384cd2 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.2.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "f99ef080288f09ffc687423b8d60978cf3a465d3f404a18d1a05474bd8575a47"
+SRC_URI[sha256sum] = "2025f913f2edb0272ef15d00b1f335ff8908c921c8eb2013536fcaf61f5a683d"
 
 inherit pypi setuptools3
 
-- 
2.34.1


