Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCABC36004
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.4164.1741683327713565964
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KIMWUogQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683329; x=1773219329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pYyaMwKR5T3jLAB9j0iljVtIhHnfIP2wj79Vck/D1zo=;
  b=KIMWUogQebxvH90M7uli1ifwsXwQIplA3W74O0qRUQNTfFrWkoCCu0wk
   zI8C+KrvclX3im79xllBvIxCTlGmOfcCoeL6mab/BGwdaukyBVeWJow83
   xxw48E26wYwTojKhQ3l47ES6PxpMbOZtZO/adEBgcaV3GsY6B23Am34O2
   3UlKfBybJAiU8riew0QgjSszlxiKSgzL76a4jcUUkbHOkBzCBoCnm445z
   uJbZt/Dt6uhr3FJKWgVJlfazRQSOmN7TaEPgjts+r96aDTWtyWXRVXHhb
   mBQoV4MLT/lo6q1eKdOUTW+lgQjwd1rLlkvs7wYUaX4S/XRb1MqhZQzLg
   g==;
X-CSE-ConnectionGUID: ZTVkZGVqS8+1CEYBRO5wIQ==
X-CSE-MsgGUID: wb5iPM+aT0G90otPAWkaCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="180034242"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="180034242"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:28 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9653EDC71D
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B62CD8B31
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AF5F21A0071;
	Tue, 11 Mar 2025 16:55:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/36] pocketpy: upgrade 2.0.5 -> 2.0.6
Date: Tue, 11 Mar 2025 16:54:46 +0800
Message-Id: <1741683310-8681-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115863

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- add pybind11 implementation for module reload
- Improve memory managements (mem-v2)
- implement array2d.chunked_array2d[T, TContext]
- Add test cases for array2d.chunked_array2d
- Refactor Frame struct
- [lz4] Make lz4 a submodule.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pocketpy/{pocketpy_2.0.5.bb => pocketpy_2.0.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/pocketpy/{pocketpy_2.0.5.bb => pocketpy_2.0.6.bb} (95%)

diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.5.bb b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
similarity index 95%
rename from meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.5.bb
rename to meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
index 5193b0d176..7b06d10526 100644
--- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.5.bb
+++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
@@ -14,7 +14,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8cdfa87bc5e09bc07f8cf64135026d91"
 
 SRC_URI = "git://github.com/pocketpy/pocketpy.git;protocol=https;branch=main"
-SRCREV = "8024f46b544698ef51d1ca0bb50a29cf0d411a29"
+SRCREV = "8a3bdd7e0a43b44e3b32548543128d95e68a3802"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


