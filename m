Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AF2C021A2
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:18 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.46636.1739178134120824672
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W4oX7Hjh;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178134; x=1770714134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9kipE96J7lrKf4HcQnUr4qhmxFM9IpakqPMgyd71iHM=;
  b=W4oX7HjhHpmwSsseeiPsGAtXANVQx9vhGU7kUCe9VCqjjgTYUCOosik5
   mAEzX9v9awEAHr4QK0t0KucK/fOJtELPwpdUlUXLF5Rd97/0T4BQ65jBz
   LeR5S9X66mxRnIeikD3bwZXbkqITz1Wba3/keQAnRh48lJtRVGR24pfSb
   uKDe/fsTLBcw5+3ovgR9/I9VaJlr1exLw1KEXN/6NCoAj+AMi+nYHHaRv
   qRinrXYwHGss2hTY0aGYoTHEc1JGPpF+Gtkqq2w1xEAlQRtRf50NO2Hxi
   YwX18rWo2vH+IcqEfyz/PTpWSkWB4WPz0WEha86tYInlrLljiQ4Gzat5X
   g==;
X-CSE-ConnectionGUID: rlQ4aMAjTXC73S6EMDPk6A==
X-CSE-MsgGUID: t0PrHo3OSLa+66lXTqt4bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189712464"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189712464"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:12 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D4C73D4C6C
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A362D88B1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:09 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3E0451A006C;
	Mon, 10 Feb 2025 17:02:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 66/66] smarty: update 5.4.2 -> 5.4.3
Date: Mon, 10 Feb 2025 17:01:35 +0800
Message-Id: <1739178095-26432-66-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115392

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- replace/qualify call_user_func_array
- Restore special handling of isset and empty as it was in v4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/smarty/{smarty_5.4.2.bb => smarty_5.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_5.4.2.bb => smarty_5.4.3.bb} (95%)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.2.bb b/meta-oe/recipes-support/smarty/smarty_5.4.3.bb
similarity index 95%
rename from meta-oe/recipes-support/smarty/smarty_5.4.2.bb
rename to meta-oe/recipes-support/smarty/smarty_5.4.3.bb
index 95673e2bb9..30a274e6c8 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.4.2.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.4.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master"
 
-SRCREV = "642a97adcc2bf6c1b2458d6afeeb36ae001c1c2f"
+SRCREV = "c6bff5795081ca5e60aabda59fb87daa511acd1e"
 
 S = "${UNPACKDIR}/git"
 
-- 
2.43.0


