Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C708C54756
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:20 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.16484.1747731312763330564
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LfcXbIWk;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731312; x=1779267312;
  h=from:to:cc:subject:date:message-id;
  bh=RLkdnzPYkHXJ4a1l4VZ2QpzDZNPh95/nu17gcjC4j0U=;
  b=LfcXbIWkJ5+uUaPp6kqskGlNVSVsU4mcP4iJpk7Pk55TjpvSt6r6wZsP
   bArd6ZqZrQA/AGpldWM/Ky54mGlwMJng/kTg8hNiWYr970OMfDNVNdXRd
   D2a/OalYnBjAcQIP9vkigRIE34OzhGjQbCCDCh2e6ibOWkYkWFIo0NrrA
   0gfsBcyBfcnPs1K7+CM217QPpohy4xxwWECZERcOnMXNnQTmAHrDn5iKR
   4fSbZ5Wj/Y0/j9ihseIzEKXG7t/yUAtCrhJckikSVHlmiSFutOWf3kGN2
   oEYBNwjdrlcNU3YrzH/glmMU6QZx9y5F7NGFX1sAvQLuNafzbhWOv65IQ
   g==;
X-CSE-ConnectionGUID: mrjSVniEShu6lPW/1vkfrA==
X-CSE-MsgGUID: xY6G2D0oRpSBT5YpctW43A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="188022159"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="188022159"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:10 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FE7DD500B
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 10CBFCFA33
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:08 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 68E1F1A0078;
	Tue, 20 May 2025 16:55:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/27] btop: upgrade 1.4.2 -> 1.4.3
Date: Tue, 20 May 2025 16:54:33 +0800
Message-Id: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117483

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Enable additional checks in libc++ with the new hardening mode
- Remove redundant optimization flag
- Ignore incomplete filter regex

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/btop/{btop_1.4.2.bb => btop_1.4.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/btop/{btop_1.4.2.bb => btop_1.4.3.bb} (90%)

diff --git a/meta-oe/recipes-support/btop/btop_1.4.2.bb b/meta-oe/recipes-support/btop/btop_1.4.3.bb
similarity index 90%
rename from meta-oe/recipes-support/btop/btop_1.4.2.bb
rename to meta-oe/recipes-support/btop/btop_1.4.3.bb
index 6fa76ac8ad..b0d74d49d7 100644
--- a/meta-oe/recipes-support/btop/btop_1.4.2.bb
+++ b/meta-oe/recipes-support/btop/btop_1.4.3.bb
@@ -4,9 +4,9 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "console/utils"
 
-SRC_URI = "git://github.com/aristocratos/btop.git;protocol=https;branch=main \
+SRC_URI = "git://github.com/aristocratos/btop.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "274d0c78e5f18514dfbea23cee9d1c5431eb75e0"
+SRCREV = "3f1ccd9f6c455fef6d4d8cfbc8ed71b86961323d"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


