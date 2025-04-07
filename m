Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1EAC3601A
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:28 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.43037.1744017442460995275
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oIjcGsi2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017443; x=1775553443;
  h=from:to:cc:subject:date:message-id;
  bh=GyVOSa5JuV1hugHU6ahCgXT2O5troQtOBlzxKZGhTPo=;
  b=oIjcGsi2M6L1cGv/Mdix6aE5tUUVwqQsxSkeqNqi7J6w1SeSAqpM2gVZ
   wWdWKvvyaRYYo9ngYP9iiLlkFSTbvJqE7kXHgKkzvMKebmmNOw5X/E7D/
   pIcqa8VfT9FpSfey4R4AoOeoZ6Hdf34Pwoq8zNW3pWLcN6J31/k9My9yI
   EJBwErg/oPiUigvGBjgNg6R5MUtX/iv1g34T4y7Zdpflft49Rjaoy1BFb
   DAzK+BQoq+Bgq2rV+Yv1Xu1e9Kd2tef+QSyZNP+HeckVN3b6GSYv0zGB3
   xVNhNuiWyFJxEWzc0DMWbBfVf42r3oz0D3nUsDSjYK+Ei1aEfcTcNkHRn
   w==;
X-CSE-ConnectionGUID: 5Hjyw4nhTz6AcpO5FoKJQg==
X-CSE-MsgGUID: fUxbhOT0QNC3kZQFGt9h6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195668923"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="195668923"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:21 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 45436C2260
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 08A7DD88B2
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:18 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4EA341A0071;
	Mon,  7 Apr 2025 17:17:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/30] boost-sml: upgrade 1.1.11 -> 1.1.12
Date: Mon,  7 Apr 2025 17:16:42 +0800
Message-Id: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116626

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../boost-sml/{boost-sml_1.1.11.bb => boost-sml_1.1.12.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/boost-sml/{boost-sml_1.1.11.bb => boost-sml_1.1.12.bb} (94%)

diff --git a/meta-oe/recipes-support/boost-sml/boost-sml_1.1.11.bb b/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
similarity index 94%
rename from meta-oe/recipes-support/boost-sml/boost-sml_1.1.11.bb
rename to meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
index a48195a15d..a4b5650c90 100644
--- a/meta-oe/recipes-support/boost-sml/boost-sml_1.1.11.bb
+++ b/meta-oe/recipes-support/boost-sml/boost-sml_1.1.12.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=e4224ccaecb14d942c71d31bef20d78c"
 DEPENDS += "boost qemu-native"
 
 SRC_URI = "git://github.com/boost-ext/sml.git;protocol=https;branch=master"
-SRCREV = "b7df6180d20422b2724d26007aebb24066f2a6a9"
+SRCREV = "cd3ef80206b71463de96d6b682cfdc99703ec147"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


