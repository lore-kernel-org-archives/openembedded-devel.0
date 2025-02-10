Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52ACC021AE
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:18 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.46626.1739178120512085675
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KWiTRF5l;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178131; x=1770714131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=F2fFoFEyCoQkPjkqceGMpW++CfEgvBMVL2ctebsi/3g=;
  b=KWiTRF5l2dmXN/1oNUgH6B6fU74wW9r6RLWaE7o543L2UBFuKnZwWWJr
   T7Pq/4gxFOMrtRErHaiHnYhNGYs+jaYzfpxi2NO7exnheJsxCr73bosXF
   R4p8tFOeR38/aRrJNwvWhD6D6lNwRZiYuJVsTW4VltB4kn1VSxiopWIwn
   ahis8cVelaL+cbOkg1nCWkLmFyuahzOprM578YuC4T2pa0vr2D3C/A9g8
   L9ScUxZ0TOxonV/nNPTOMx5AbtUz6S8JrqCHmnJskfEhV3VHJO/XmRR36
   IRSlydlvNw2TjJYSZIWIkXQIHRLXBZwNEYcX5sEZ7m29w9/9LKb1qxkZJ
   w==;
X-CSE-ConnectionGUID: /WZMTVMbQ4m2KGQVcZL7Kw==
X-CSE-MsgGUID: iPMT+FLCT5efe4ZY1X4mSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="177444544"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="177444544"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:10 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0060BD6EA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B38E8D50B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:07 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 576D41A000B;
	Mon, 10 Feb 2025 17:02:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 60/66] python3-starlette: upgrade 0.45.2 -> 0.45.3
Date: Mon, 10 Feb 2025 17:01:29 +0800
Message-Id: <1739178095-26432-60-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115387

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Turn directory into string on lookup_path on commonpath comparison

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-starlette_0.45.2.bb => python3-starlette_0.45.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.45.2.bb => python3-starlette_0.45.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.45.2.bb b/meta-python/recipes-devtools/python/python3-starlette_0.45.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-starlette_0.45.2.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.45.3.bb
index 5acbe2f76b..e4f36baf2a 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.45.2.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.45.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "bba1831d15ae5212b22feab2f218bab6ed3cd0fc2dc1d4442443bb1ee52260e0"
+SRC_URI[sha256sum] = "2cbcba2a75806f8a41c722141486f37c28e30a0921c5f6fe4346cb0dcee1302f"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


