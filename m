Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E55C83F07
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:27 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.56137.1751879237138472344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CoJcb596;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879236; x=1783415236;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qE1ESVs5BLW0dN8A5wHlCKG16FgpHaxy4nlV+dK1ys8=;
  b=CoJcb596K4bhPLRGfENRYRfNwNfGvwYumP9s8PYNtyoEOjBB5AwZtzKs
   Xoz0oY1wCKhYVI2gpoS5vY6ATGB/hwWa7jfPPTLYAQqxtRc0WuTR3AEWd
   Y/44ejMM+RHKfdeylLF4uu1h9J6TqvTC8FBj7LkroOIsXwoupm8pi9opi
   DzVXj3gDlRpbPdeAiq+fUV32jPhMRwfnhzKFmykreSn40l4l8vH95kn9c
   k3NU37rq9WAPkbF38pE8SC7TDaNfNV55M/GZf++8L/ekia48WCC3HUcmi
   np8kdTEj319Mx1jwB4poG5oWMXnrxDC1N89kZLqvXN5dvyQ6kLeN/S4jH
   A==;
X-CSE-ConnectionGUID: rNtsB3rqSoS7C19+etttYQ==
X-CSE-MsgGUID: mOisjsOTTySJneuJsXL41w==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="206006874"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="206006874"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:15 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id A9FB38203CE
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:15 +0000 (UTC)
Received: from yto-m2.gw.nic.fujitsu.com (yto-m2.gw.nic.fujitsu.com [10.128.47.163])
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 2B7C686083D
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:15 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B9D168A0B1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:13 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BDCD71A0078;
	Mon,  7 Jul 2025 17:07:12 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/35] python3-aiosignal: upgrade 1.3.2 -> 1.4.0
Date: Mon,  7 Jul 2025 17:06:37 +0800
Message-ID: <20250707090656.1216-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118262

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===============
- Added decorator functionality to Signal as a convenient way to add a callback
- Improved type safety by allowing callback parameters to be type checked
  (typing-extensions is now required for Python <3.13). Parameters for a Signal
  callback should now be defined like Signal[int, str]
- Removed the sphinxcontrib-asyncio documentation dependency.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiosignal_1.3.2.bb => python3-aiosignal_1.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiosignal_1.3.2.bb => python3-aiosignal_1.4.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-aiosignal_1.3.2.bb b/meta-python/recipes-devtools/python/python3-aiosignal_1.4.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-aiosignal_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-aiosignal_1.4.0.bb
index 33320770ab..ddbdcddc68 100644
--- a/meta-python/recipes-devtools/python/python3-aiosignal_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiosignal_1.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiosignal"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf056e8e7a0a5477451af18b7b5aa98c"
 
-SRC_URI[sha256sum] = "a8c255c66fafb1e499c9351d0bf32ff2d8a0321595ebac3b93713656d2436f54"
+SRC_URI[sha256sum] = "f47eecd9468083c2029cc99945502cb7708b082c232f9aca65da147157b251c7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


