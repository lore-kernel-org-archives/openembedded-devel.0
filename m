Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFB1C369A3
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:28 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.43037.1744017442460995275
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=njObQ2Y9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017444; x=1775553444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fmiq3VDUV3vVWZEpNBBdgNve6bXFxo0FJ1OG9ult6cc=;
  b=njObQ2Y9ZEFcDMWJeuT08WJ+ryc1h68F8AdUubKXvPN4Lvj/VbN7f/6m
   icp/za5zwFYZsadiX+VVI5SlLxNC/iLuES3b/osjfenLmjWsA+KJzFEsY
   tpVlXX3yBvdQNRudk7qoer43VEOyf1Y6id6FN0TV71c6IAkJu1FTRc6OX
   hnTX8JzSWidyaCpK+/w8RqgSNByjFh4gUmsf5aD0WIdxjXQI61OqPFwfT
   Jy3EAHqc4001O0OIqstE/3dUjOMxCbU2O2ZGScrwhxDshT8iz9qEazBXm
   hqiz2I94B+Sk0nYmCbZQSjzUxM7Couc+s8nyAPzoNZS+oOcv5+GbIuPxv
   Q==;
X-CSE-ConnectionGUID: hBmK3APiQjiF3yCUsGcTig==
X-CSE-MsgGUID: 1KZO0nolQtOlYdIPbhmgow==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195668924"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="195668924"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:22 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 05A4DD4F43
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BC2FDD5086
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:18 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 462C91A0071;
	Mon,  7 Apr 2025 17:17:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/30] icewm: upgrade 3.7.2 -> 3.7.3
Date: Mon,  7 Apr 2025 17:16:43 +0800
Message-Id: <1744017431-22217-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116627

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/icewm/{icewm_3.7.2.bb => icewm_3.7.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_3.7.2.bb => icewm_3.7.3.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_3.7.2.bb b/meta-oe/recipes-extended/icewm/icewm_3.7.3.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_3.7.2.bb
rename to meta-oe/recipes-extended/icewm/icewm_3.7.3.bb
index 747a0c23ce..311abc3702 100644
--- a/meta-oe/recipes-extended/icewm/icewm_3.7.2.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_3.7.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "b4ed8a357352f761f0d2d547235e35e97051f7e5db55d32f689d2c5262f202d8"
+SRC_URI[sha256sum] = "4d845d8af6194fa25b36524467ae9fdcca2faed5c4046515e3bc633ff1479230"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


