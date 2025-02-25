Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D55C282C8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2198.1740525895087964817
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HYUn86yA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525903; x=1772061903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=L3UpzwYnkdlbIqDtbVsRTsUznAakbfokiRrJFJil5/E=;
  b=HYUn86yASDqexfAjhmFc3ZdpWupvIHqAvLJrOonJSmnLGR1glipL+xyv
   o0SP5pDuPtpRxuaviGmoI+TBo3wipJyr1yPwi1JZw/dqPcCOYCJ8p9fTn
   K++fgkWFhiENWfZPusxCi2DMdePzhd4EKH/F8SrJD2JyAJVLqUA+KlPPG
   IM7FmDuHyjoHvGPjxtPjrohJ6+qIYykoCG87G25UPkWO+NoX/MM7kAEaF
   JFIxDaHm9OKcVlcYh2vwpZ84B2WEc4tbtIsP/XHQpYcnhtM+Ku3iVIn0y
   a4gOCWc2zEus4v6lpozJJGiW2TO0QvXvexBmeGUOQFs2V8vG6ZkfeKUqm
   A==;
X-CSE-ConnectionGUID: jCTgexVITy2QdaNOceCBbQ==
X-CSE-MsgGUID: 957WAKE0QxeAfn+acXECrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="170624540"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="170624540"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:02 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0720BE8523
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id BFDE9C8BF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 61ED81A000B;
	Wed, 26 Feb 2025 07:24:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/51] python3-inline-snapshot: upgrade 0.20.1 -> 0.20.2
Date: Wed, 26 Feb 2025 07:24:22 +0800
Message-Id: <1740525881-21103-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115629

From: Wang Mingyu <wangmy@fujitsu.com>

Fix:
- snapshots inside tests which are marked as xfail are now ignored
- Fixed a crash caused by the following code:
  snapshot(tuple())
  # or
  snapshot(dict())

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.20.1.bb => python3-inline-snapshot_0.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.20.1.bb => python3-inline-snapshot_0.20.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.1.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.1.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.2.bb
index 5219675e04..246f67b0d7 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "c56c871e59973500eca00610022eac19e79cd2c1b0b2d7a18abe14dde11a1431"
+SRC_URI[sha256sum] = "c276a2e018575d50e720e9b79b70f7030d292120f96e6be2e138a87a5a6d096b"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


