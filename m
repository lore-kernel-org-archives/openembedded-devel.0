Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C079BC28B2E
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2198.1740525895087964817
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BYB87YRB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525907; x=1772061907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gQDbXSDL7iQWw9sW04EV1/frfYvYC0WrbgmQ9GK3C0g=;
  b=BYB87YRBJ2shd8051WYIfCNMRnz8IudIKD9UL/aAP35DCm6XaG/EdzMH
   O3xCX3lEkWO8wv44n19CMyENA0OmBT7vnXbnaZIQh0ggS1dZj4LbuhFbD
   IUAPDhptVTNLzBjtTmLGjjJMBvwmBdRrm4TmpozNPpyxiyqNml4J9u7e6
   hS88+uEmSP8L2m5tfnKQxRPvpRuqvQZ8jSooYGQb7b03hTb4BEqBp1Ef6
   I5pmdCNjcl2cBOLXYLOn5z+mo7BP4juXH4JNh2/xPR6ysKJrxY/5azTnm
   s3yVOW1cFZuC+pWEBbvuM3owB531C1M3xZx1dyZPwr+bb0lAczrGBed0h
   w==;
X-CSE-ConnectionGUID: Bg+lDMp/SZ63cUmj2ilWew==
X-CSE-MsgGUID: HsSCh87qQ2e7P3eCAoJBEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="170624542"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="170624542"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:05 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E80C9D6EAF
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AD935C8BF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:02 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 726C81A006C;
	Wed, 26 Feb 2025 07:25:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 50/51] valijson: upgrade 1.0.3 -> 1.0.4
Date: Wed, 26 Feb 2025 07:24:40 +0800
Message-Id: <1740525881-21103-50-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115647

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Prevent potential division by zero
- Fix stack overflow for unresolved references
- Fix buffer overflow in u8_strlen
- Fuzzing improvements
- Spelling corrections
- Detect circular references when parsing schemas
- Use statically allocated regexes for date/time pattern matching
- Allow permissive validation of date/time formats

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../valijson/{valijson_1.0.3.bb => valijson_1.0.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/valijson/{valijson_1.0.3.bb => valijson_1.0.4.bb} (93%)

diff --git a/meta-oe/recipes-devtools/valijson/valijson_1.0.3.bb b/meta-oe/recipes-devtools/valijson/valijson_1.0.4.bb
similarity index 93%
rename from meta-oe/recipes-devtools/valijson/valijson_1.0.3.bb
rename to meta-oe/recipes-devtools/valijson/valijson_1.0.4.bb
index 82201211b9..f061c391b8 100644
--- a/meta-oe/recipes-devtools/valijson/valijson_1.0.3.bb
+++ b/meta-oe/recipes-devtools/valijson/valijson_1.0.4.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5c4583a434195e4f3b418e17c8ca2daf"
 
 SRC_URI = "git://github.com/tristanpenman/valijson.git;branch=master;protocol=https"
-SRCREV = "fc9ddf14db683c9443c48ae3a6bf83e0ce3ad37c"
+SRCREV = "7d59abf50cff4ee53e6584e6d6aa201a19fb5b51"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


