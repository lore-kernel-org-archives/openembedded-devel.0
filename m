Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64DFC0219E
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 08:32:14 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.10423.1739349128927742020
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Feb 2025 00:32:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CYRy2RGK;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739349129; x=1770885129;
  h=from:to:cc:subject:date:message-id;
  bh=q3QBwmnU7xbOiTfa75JVJk9QG5hre3Bmg0lFue45cBE=;
  b=CYRy2RGK6K/Xt3PUiwxNYWI1ubLzhQtKjQI+ETCHmt1b7U32vc+ohBKU
   cQUO9hTLBzemZDjaDLrvHkW88YWcMFHvPXVDCvl9ZcEGUcNXv9klsu1uR
   7prPDMtqqhW4MtWzFwNPrG0cD1sVC3h9b3gkjkShjFwXVvbe2RjLmuo15
   sfQZvjdi5dC1b6Zsc++5uKIZm4fgtGvBWrh52g5zf+1HIpAzuMFHUY12/
   7ZOmbiuJe6zca5sJRetM+a6HB8KdPxWuW/UmmN/3XlIHEU+u3pN1GZqM/
   JYx7VkSJxtGe8IGTiQuMcLus3MY5Cj2mRHQswh8FbcYJeku/cuUO+1gux
   g==;
X-CSE-ConnectionGUID: wYJ2bbf0SlKtqOgeGmKXrQ==
X-CSE-MsgGUID: VS3AgR6xQZ2/VaavYz9hSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="192241433"
X-IronPort-AV: E=Sophos;i="6.13,279,1732546800"; 
   d="scan'208";a="192241433"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 17:32:06 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E91B696751
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 17:32:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AA04415C06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 17:32:03 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2736D1A000B;
	Wed, 12 Feb 2025 16:32:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] wireshark: upgrade 4.2.9 -> 4.2.10
Date: Wed, 12 Feb 2025 16:32:00 +0800
Message-Id: <1739349120-3765-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 08:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115442

From: Wang Mingyu <wangmy@fujitsu.com>

releasenote:
https://www.wireshark.org/docs/relnotes/wireshark-4.2.10.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wireshark/{wireshark_4.2.9.bb => wireshark_4.2.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.9.bb => wireshark_4.2.10.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.9.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.10.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.9.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.10.bb
index 535dd21bf6..4739c3961c 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.9.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.10.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "62c2b6652d7f9a50668867bd57b21609c9a9b6950f26e7f30a24b2de0e72ded3"
+SRC_URI[sha256sum] = "3fc5f88ae420bc5856d056324efb023abc4654eed4742140b0d0d36cb032b894"
 
 PE = "1"
 
-- 
2.43.0


