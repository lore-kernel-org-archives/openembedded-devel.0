Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95CFC07E8F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:49 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2761.1713318108632759786
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cUSzEasO;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318108; x=1744854108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gG+syB1Uw7dgW2romRFHwb9l+DtzBoGAGpHhMa0gQ1Q=;
  b=cUSzEasO4Z/m4hi4/a9N/n8/zRiNqJD/Ni5fclT7LaiJil2E5E/UEvLJ
   mWFmbf4YJvdwYSACvxXJLFjGvjHfEkladgdDBKZF4Ou25oN+eIoTIOV34
   N3eej97gXD12amUqKGNJn4Oid6V9ur4WT9FVMaFdWwhNSqzwMZ7VXjpDq
   K3gAXj8Hc143HgYC84B67mIpHJgzQb+e8aQXt2OlesIHFUVOXXPMQQh/R
   KNv/uMQBFwwkfe+hv0oQ5hYUK7/aUI91S8LsC5ohmHmxvfspy8oBdFuVt
   uTCBGCJ0Ik8KbLR1v9CyKuztgG+Qkf++7Z4aK00vKv6/BFiBMhUCg38xX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="143393424"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="143393424"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:46 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4848CD3EC0
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:44 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8513443FE5
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B9CF22D91A
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AC3541A0002;
	Wed, 17 Apr 2024 09:41:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 43/49] sngrep: upgrade 1.8.0 -> 1.8.1
Date: Wed, 17 Apr 2024 09:40:55 +0800
Message-Id: <1713318061-17128-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--0.448600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyumQTCqZT6QS42N
	vbXikTrMjf84k1uW53jqXvXKPBg5Bm0Xr+fj3ww/TuctSpiuWyUUi4Ehat0546B5jk2TXXjFnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFErLcsF//caev76ppl7T5QIeXi
	tL/e4BsZ6f3si+LuhB43AnUyNbw/u1mgisrnWNVUA+q4anMc0Brq01FPgfyPwkA6Gwur2upOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110029

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 capture: fix possible buffer overflow while processing headers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/sngrep/{sngrep_1.8.0.bb => sngrep_1.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/sngrep/{sngrep_1.8.0.bb => sngrep_1.8.1.bb} (95%)

diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.8.0.bb b/meta-networking/recipes-support/sngrep/sngrep_1.8.1.bb
similarity index 95%
rename from meta-networking/recipes-support/sngrep/sngrep_1.8.0.bb
rename to meta-networking/recipes-support/sngrep/sngrep_1.8.1.bb
index 2824dde88..50248078a 100644
--- a/meta-networking/recipes-support/sngrep/sngrep_1.8.0.bb
+++ b/meta-networking/recipes-support/sngrep/sngrep_1.8.1.bb
@@ -16,7 +16,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "git://github.com/irontec/sngrep.git;protocol=https;branch=master"
-SRCREV = "f7b36df3b79617892958b67cb4ad9313c6ce72d2"
+SRCREV = "373abb90804ba71f980c7120e62f90d3a5c81213"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


