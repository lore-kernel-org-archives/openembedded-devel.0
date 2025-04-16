Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1281C369C7
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:42 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.14422.1744794150323600937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oEEF43K1;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794152; x=1776330152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=U0FGorX4K66NAQloFGRRByPsfHzt/gRbMbF3IVSZw50=;
  b=oEEF43K1aMpnWB7c/jessKm5JPdoQiDYfBGo8+OcP1OegQoarcJsQ3IR
   90WMvaTefU5bbhkVZkVwlwFwSEE7mJkCzlB5RaJ61bZbhJdNJxiziv7DN
   Y6fnLnMmhF9heW9SsRmCYnzqJ6YU2XfF8ZDWwzMSGLPvA5pqrEQ/zLsO1
   dlycG2EkDbalPXdmcL5Jh4cnBYbcdCr0loH7MooMuzfyp5kDTBzW9lBxg
   VfixovyWy/G8JX9daRkvJQ/BXaNjAaCgjOMg70DM22cAC1uUcNZhrVM4/
   I9btW0v13gm6kAm+unzudeqCzWnhKVKhvyIbHxPWdLqC33sam7UoDkXhm
   g==;
X-CSE-ConnectionGUID: ik7Y77dXSpi/iK5bgUEfIg==
X-CSE-MsgGUID: QE4q2KtCR7qBJFCoXplwBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="175509510"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="175509510"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:31 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C915AD6EB3
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 87AF3D50F4
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4446F1A009B;
	Wed, 16 Apr 2025 17:02:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/31] python3-inline-snapshot: upgrade 0.22.0 -> 0.22.1
Date: Wed, 16 Apr 2025 17:02:03 +0800
Message-Id: <1744794136-908-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116883

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.22.0.bb => python3-inline-snapshot_0.22.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.22.0.bb => python3-inline-snapshot_0.22.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.0.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.0.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.1.bb
index e6b297f81b..0d913729e4 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "8e7285cbc445ed91da6b27788a267648a84377737e6be8d84f704ea648fc0fdf"
+SRC_URI[sha256sum] = "5acbc23b9a179969b449063e2a2f3c86e2a5f6f480934e24e58d82c7cd55938c"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


