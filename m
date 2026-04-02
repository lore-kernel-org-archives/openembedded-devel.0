Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E731112263
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:52 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7105.1775096142995234313
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SzRzqtIQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096141; x=1806632141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iD3isUqJGTVAKGvtKUpdb4o7SA1ymiNaBJl6o/BivQI=;
  b=SzRzqtIQPgtZLrVuzIp6/VN0ultDcxRE0YXUE9txYiXvqnAmuZgwmYcu
   SLeg36OA4aBisSGx/fMIv/i7xYjLXmLwRoSnLpQo55VCDnW8r/uxq0lJ5
   HxG2KVy/ZvbMOKphP3JEls2wVgwLJo3SPTcL7wqtGhf1zWIsnW8dpvkzt
   n1iOOZxP+cZRyZK4U5OX00GvDfGfXhbjcwAjmQvt3SrG9cKjC8TK7cUYv
   5e3w7SHh5pjeKt7GgB/A01gcun/VY1JCEMIj1wftkzEjWt5aT6xLpQYpt
   nUaCgO/ZKJnMaMYIV2CTLrZwjpjn9nnvm2M1PILCqY1TJSjrqCVpHo385
   Q==;
X-CSE-ConnectionGUID: CYFmrOc7SNSJtMh8NC2gMA==
X-CSE-MsgGUID: omw+WOclTMKoTQriSWsgoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="224161021"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="224161021"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:40 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 84530820C0A
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:41 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 3E7FD1410CB9
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 6869910001CA;
	Thu,  2 Apr 2026 02:15:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/39] python3-eth-typing: upgrade 5.2.1 -> 6.0.0
Date: Thu,  2 Apr 2026 10:13:37 +0800
Message-ID: <20260402021355.1324-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125937

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-eth-typing_5.2.1.bb => python3-eth-typing_6.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-typing_5.2.1.bb => python3-eth-typing_6.0.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-typing_5.2.1.bb b/meta-python/recipes-devtools/python/python3-eth-typing_6.0.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-eth-typing_5.2.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-typing_6.0.0.bb
index 727a19aab6..51d1abec7b 100644
--- a/meta-python/recipes-devtools/python/python3-eth-typing_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-typing_6.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3ef06eb4d4373222e59a338e2eb9a795"
 
-SRC_URI[sha256sum] = "7557300dbf02a93c70fa44af352b5c4a58f94e997a0fd6797fb7d1c29d9538ee"
+SRC_URI[sha256sum] = "315dd460dc0b71c15a6cd51e3c0b70d237eec8771beb844144f3a1fb4adb2392"
 
 PYPI_PACKAGE = "eth_typing"
 
-- 
2.43.0


