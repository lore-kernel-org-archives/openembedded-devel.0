Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 125D5C3ABA5
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:16:04 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7604.1745900153912898058
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=p2LaWDBi;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900154; x=1777436154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9o/VrlvZlk9sFNipTxYzr9c5mPWkTyptrr9KrvpsHEM=;
  b=p2LaWDBiGZkUiOkr414RGGxjFiu0IyjZU5+SL8RC7IOteK41Wd9D30DH
   DZQEVVNqyTUSvGxQXxzVtU7Cz0uDKt16kYV9K9Btyd9C2RtDsSo25whrv
   /90kjvh+Gb8sJY5JXuGCrMgWtSWqsOx9KH+BZtycXH+tjYXS2s9AVrTDK
   YT10Mtx1VPBF6mBC8t4fZRIeI7wf8LqG79Nhr29Fd/znnBW3MWLagRZL6
   maGpYwccNHmxjLbDCTW4j0t22QRJ2rZJp3ohd6RHTcxrgnQwpuGoghkM/
   d82UTvsPexbTyP6Qs9n93cDWLdTi/pqkWkpZtZdNLmuVIclTCclRacFOz
   w==;
X-CSE-ConnectionGUID: JQBqs81pQPWM/yOy0vwOUg==
X-CSE-MsgGUID: o1DBul62SyO+6SIiXchBKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="185331866"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="185331866"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:51 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C8CFA80F4
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 01DEBD5080
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 862051A00A0;
	Tue, 29 Apr 2025 12:15:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/23] python3-greenlet: upgrade 3.2.0 -> 3.2.1
Date: Tue, 29 Apr 2025 12:15:27 +0800
Message-Id: <1745900138-26424-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117221

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_3.2.0.bb => python3-greenlet_3.2.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.2.0.bb => python3-greenlet_3.2.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.2.0.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.2.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.2.1.bb
index e0b8008d43..4f5f39e4fc 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.2.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "1d2d43bd711a43db8d9b9187500e6432ddb4fafe112d082ffabca8660a9e01a7"
+SRC_URI[sha256sum] = "9f4dd4b4946b14bb3bf038f81e1d2e535b7d94f1b2a59fdba1293cd9c1a0a4d7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


