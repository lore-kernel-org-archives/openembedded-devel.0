Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A483C02193
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:21 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.32636.1737360855980767102
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tcqkOTHS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360857; x=1768896857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MwXMy36btDEEva0VZ70UDuU6twCMQVJHumjEm6WmmNY=;
  b=tcqkOTHSz7DaEbHYoH7pIuWUgbE4rNG/jYysxMNuUFRlZVxKgSadMh7U
   C1N4QTwEcL7TGjSpVMwnZTJN09UPKsJ/DckIjdkk4xxKgb4E2wfxFwDS/
   tZjPT89tVD4eNORFegqoZ0H+tAisUii+xWp/DPYg4CxM2C73sX9/QPrLk
   87P4Z+MP5klkd9cWDYa3Fq7lBuR6L+UvPuD83paBkKvTrxFl36eHh/35s
   U3NFjaWKFRTY4eIc4vlPmF1DGS1RsYC0ZcNv7H1eJelipu74FUsiFBSa9
   OmH6RkgBoQ6IauzCwvYCNtvRHVenW8S90LrUGABohDY8tOcol0CTM1Cx2
   A==;
X-CSE-ConnectionGUID: 5Dp8EBePS3KSbOp26gEEHg==
X-CSE-MsgGUID: tAJLc6VKSnemV5wyaLZFsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="187149519"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="187149519"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:14 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 47508A80E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C4C7CFBB0
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A22266BAD4
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:11 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 511081A0071;
	Mon, 20 Jan 2025 16:14:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/32] cxxopts: upgrade 3.2.0 -> 3.2.1
Date: Mon, 20 Jan 2025 16:13:37 +0800
Message-Id: <1737360846-4824-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-0.879000-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNRPnGDTa4GHDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUrBh
	yv2DtHP/i8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFHQlLlf5tIxsAY3iFkP60Q464r
	0e64UfgfElJq3Pryi5U6uUzmJMY3l79CWELe8GSiSFxChAQqdmT870TA8Cfla4CAPIRM1ZzOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114965

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 * Fix compilation with optional on C++20.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cxxopts/{cxxopts_3.2.0.bb => cxxopts_3.2.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/cxxopts/{cxxopts_3.2.0.bb => cxxopts_3.2.1.bb} (90%)

diff --git a/meta-oe/recipes-support/cxxopts/cxxopts_3.2.0.bb b/meta-oe/recipes-support/cxxopts/cxxopts_3.2.1.bb
similarity index 90%
rename from meta-oe/recipes-support/cxxopts/cxxopts_3.2.0.bb
rename to meta-oe/recipes-support/cxxopts/cxxopts_3.2.1.bb
index a2493c6bbe..6077220151 100644
--- a/meta-oe/recipes-support/cxxopts/cxxopts_3.2.0.bb
+++ b/meta-oe/recipes-support/cxxopts/cxxopts_3.2.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8de00431559a76a1b43f6fd44f8f6689"
 
 SRC_URI = "git://github.com/jarro2783/cxxopts.git;protocol=https;branch=master"
-SRCREV = "3bf268481da8208d171d8908e6491459de3651d7"
+SRCREV = "4bf61f08697b110d9e3991864650a405b3dd515d"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


