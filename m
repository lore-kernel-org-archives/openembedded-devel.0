Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8735DC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.35430.1745311778692245298
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IC3Ceke7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311778; x=1776847778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aW30uCAqhlwWShqa1kwpsy15IXspoB410WcAUSToF3s=;
  b=IC3Ceke738aSVYUdd/eeigQ0cO2G+4BkQPR9hu2pHcmU+aXL6EAyMcdg
   Iz8EY3Tt6k3FfINNZ9X6ecLqMGLgk0kWhhaWD9KUKP3C5kZJzSmKwNccu
   W9d+T+LLvRcVc5JetoC4bfWnTKkMnXkX9yvriZuozdFSvVUqmPhmGbA+N
   /Tk+FuNUmvzRGVMIgX6vsTyYcsB9IKsS468wEFxg0c5iZp+uEuFA7CxiC
   lIjzKGCnx9/BVyDTkGZLhIDJYnDD8asgylXlvK07siIv4+2C4P9o+WbsF
   2pOemAT9NvwpTlS4TLFBhdIOwEZVw3Qxh0gB+7xtnXuWXMdyd51BdxB3E
   A==;
X-CSE-ConnectionGUID: DKOn31xbQlCR11dp6gGVYw==
X-CSE-MsgGUID: fzFUwJjVRzuXf42edXMNNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="176186093"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="176186093"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:36 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BAA4D6EA7
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 29BC6D50BA
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:34 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B57B21A009A;
	Tue, 22 Apr 2025 16:49:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/30] python3-pymodbus: upgrade 3.9.1 -> 3.9.2
Date: Tue, 22 Apr 2025 16:49:16 +0800
Message-Id: <1745311761-1912-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117040

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Reactivate simulator validate.
- Don't bool-test explicit datastores
- Test and hard delayed response test.
- Update simulator doc.
- SimData update
- Officially working towards 4.0.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.9.1.bb => python3-pymodbus_3.9.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.9.1.bb => python3-pymodbus_3.9.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.9.1.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.9.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.9.1.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.9.2.bb
index d969165a54..afede52161 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.9.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "ec6216f218dd7e370fa43692535ee5268adb6b1cf7037dda6c78ac92c9a43a84"
+SRC_URI[sha256sum] = "2d08ab7bf6d1abc55a87f4faa3a7b04f74d7310b8c9771c3d66ee5fccf2e25ac"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


