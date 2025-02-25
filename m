Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41520C282D2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2297.1740525897445317206
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g2MKvJTo;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525897; x=1772061897;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ixEX1Eu/5utI+qkN1VvXqKtBwQzmEdtxtiVvau7KimE=;
  b=g2MKvJToK0OIPNutJ9BMwBFgOFbHlun3v4p9utFIpUeq7g9GPRtV22k8
   AkuyvBCwHQauahn4xuYn3VMKolKUbhZnEB4j0TSfi/OmwjIcOo0uTyA98
   +nFDLrY7Lm8EsVZ4/1RDoTB6MSgQOY+Sf9TWKvta3qESJHoIc7NEKxlrZ
   8b+N8NRuyDUEsilrapfQx2VgTWPR2Ln0Q1Dm6DKpbp1d2f00ae3/Pa2pC
   PIfj+VC2aMlNo7918RP0FrL4++rUd8nImzYkPqA21hzI9bx71BmrSg4mX
   2X4YM4Ty/DanTFEi4/xfkk9CVJkUJjAue4TAfiDqIxk411fYR1A7z0OmK
   A==;
X-CSE-ConnectionGUID: 07Wk5oXyTXuiPg7QlgRyPA==
X-CSE-MsgGUID: 0ldAIQkiQi2zWFOkgtpIUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="170073414"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="170073414"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:55 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E526096741
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AD482C8BF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:52 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4D3F01A0073;
	Wed, 26 Feb 2025 07:24:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/51] flatbuffers: upgrade 25.1.24 -> 25.2.10
Date: Wed, 26 Feb 2025 07:23:55 +0800
Message-Id: <1740525881-21103-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115602

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Rust reflection: simplify dependencies, fix Android build compatibility
- [Swift] Adds swift 6 to the build matrix & bumps swift to 5.9
- Upgrade dependencies

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
index e0b5a8c631..36b448a41c 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
@@ -1,3 +1,3 @@
-PV = "25.1.24"
-SRCREV = "0312061985dbaaf6b068006383946ac6095f5b63"
+PV = "25.2.10"
+SRCREV = "1c514626e83c20fffa8557e75641848e1e15cd5e"
 SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
-- 
2.43.0


