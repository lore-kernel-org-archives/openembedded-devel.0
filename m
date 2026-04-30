Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F32CD13DF
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:30 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17230.1777546219556337043
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UNA6KdG9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546219; x=1809082219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g9H8KS5LNlIyPg+Dovj0P6x0ROLRiKlsB3R6VDEra7A=;
  b=UNA6KdG9yh4PT8ownHPkF5OBFIs0928geETUvPp4JY4HouDoaG/8OOor
   kauYLHsCpd/rU31xslR9ZOExTqNeoOb0xsnMRpKTnPrU9FS5RYYdRyoc4
   gFETuzThh3rTTT1ZfGZIUZitkmOdwHmLjnmN3JvwEFcWm8l7tv2BlQlXH
   5J1XT/sSv9o2fSoYKc5IyFDVURphc6ZpD2Ouok9kTPuRd6L+9/LUoI95q
   BsVSvGqT8AqbthqUK+KLxT/+1dHt723JqX/zu1CJa0XAOP0lIPP4zPER7
   oH7TSKv+9P6WNnGKy+XB8M5StkOOoAtCMLo1diGTrfHro7PSjl5lsSp7U
   A==;
X-CSE-ConnectionGUID: Fn6xBI1MR7ekXOvw47w7cg==
X-CSE-MsgGUID: 4MKjiwolRgiMG6h9tYHInA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="239353025"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="239353025"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:18 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 257F91C1C701
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:18 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id D05CA1400617
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 71B971801130;
	Thu, 30 Apr 2026 10:50:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/64] python3-cmd2: upgrade 3.4.0 -> 3.5.1
Date: Thu, 30 Apr 2026 18:48:50 +0800
Message-ID: <20260430104924.1106-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126701

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmd2_3.4.0.bb => python3-cmd2_3.5.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_3.4.0.bb => python3-cmd2_3.5.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_3.4.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_3.5.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cmd2_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_3.5.1.bb
index 2ed0bdc769..1d57d7a8b9 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_3.5.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "fd43ef7540609469f055858146f2c592ca4c58e3c336b5efbc5502459ab0bdb2"
+SRC_URI[sha256sum] = "1637f765e764b022dfa617f4711fb441599732082eb6310cf8739fbaec2335a0"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.43.0


