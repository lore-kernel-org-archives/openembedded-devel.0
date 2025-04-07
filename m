Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1A0C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:28 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.42478.1744017446860559298
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Dfst3DfT;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017447; x=1775553447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6EL5SD/k8rxF/nb/yc5m4UcyObwXl+8imF0sEaJXyoI=;
  b=Dfst3DfTCpGXLZb3OLEqfHYVQZbPL3HqzzpowICntw1Aj6NcJdRPdEm8
   xwja2xs8UQv3ZeBRm01P+JuTHbjNadATw0CXlR6hQILm+hpu7jyNBnLm+
   K5n7PCZJgMlXPhRhyUnJGk4savGzGmYsPuhN6EUtzmlX2glJbNhwBZqHo
   yjBkAvVn4v6Vuf2V5CMdNriCf7FcmSd0pp+JTEOZ6YkBla4cyvQzNKjK9
   44Lav5jYugnIBCXE2xAN5HGo6eD/oxQTdMks8y/YAF7hHcpeIKXUvjqGv
   5JubiKaXmiGdYHE+HfDGpWbaEBei4zKewY+cuwGZTFn/SFoMq37a971TY
   g==;
X-CSE-ConnectionGUID: mLAL5CXhT7uHEVJMizH+Kg==
X-CSE-MsgGUID: QGkYLpEuQ7iIsaSCPjiSmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="184053178"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="184053178"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:24 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 63BCE96742
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BCF4D507E
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:22 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9ACDD1A0071;
	Mon,  7 Apr 2025 17:17:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/30] libspdm: upgrade 3.6.0 -> 3.7.0
Date: Mon,  7 Apr 2025 17:16:47 +0800
Message-Id: <1744017431-22217-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116631

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libspdm/{libspdm_3.6.0.bb => libspdm_3.7.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libspdm/{libspdm_3.6.0.bb => libspdm_3.7.0.bb} (97%)

diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb b/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
similarity index 97%
rename from meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
rename to meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
index 4c0483ebac..5096eb3874 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=8f9b59a81a88da8e812af43728b72dd7"
 DEPENDS = "openssl"
 
 SRC_URI = "git://github.com/DMTF/libspdm.git;branch=main;protocol=https"
-SRCREV = "5ebe5e3946b9439928fa3a7548268c29cccc1b16"
+SRCREV = "1be116c7b7713fa9003e1bd53b53a34758549eb9"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


