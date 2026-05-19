Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57953CD5BA6
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:40:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19029.1779190790925853936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BiZP+4OY;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190800; x=1810726800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hCakuWMYWm7KJFUlnRLZ8pe4nLELDGlD0r6dCKB2Qlo=;
  b=BiZP+4OYsohmPp3jkIj/Irwz/ZCbZbn8L7oYDDrkeT3Q0VtJLbKizWf2
   BUEEzF4QPFqzSlO9qMSEI49EKkry3iJ/5lyOoYFaEE/J4Y5PR9q0772Ro
   /piAtIiVU4/nnhEzShVvN/ayhc/+dr5DlwLNKowWa4iwFTbyhUBIC64ug
   EQFLZGpV2xHKuB5ajKOLIajcgwZqHV+bxM/9w33YQNkY8oyCYRtDcYzV9
   KM0aPg6ubLgqMUcuMsfAMS9WWKWdIG9FRJU5HaXJ9Bd/d8bOM8++pHGd6
   3R5YQyi3ZT+hPBdkG5brIVVvD9Hy8jlDXwvv15gEpNl2nfQP2CbunbNE3
   Q==;
X-CSE-ConnectionGUID: 36JZ2w3hTvi8wqg0+fLKhQ==
X-CSE-MsgGUID: 0ituGVlbRp6UAfRa7B/cHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="219995182"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="219995182"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:39:59 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 683A61C000A5
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:59 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 171111C00118
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 983F3405E2D;
	Tue, 19 May 2026 11:39:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/38] python3-huey: upgrade 3.0.0 -> 3.0.1
Date: Tue, 19 May 2026 19:38:59 +0800
Message-ID: <20260519113921.655-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127078

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix bug in redis version parsing when using Elasticache or any other that
  sends major/minor. redis-py incorrectly parses these as floats because
  there's only a single decimal, so the version check was breaking.
- Rename max task option --max-tasks (previously was --max_tasks).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-huey_3.0.0.bb => python3-huey_3.0.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_3.0.0.bb => python3-huey_3.0.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_3.0.0.bb b/meta-python/recipes-devtools/python/python3-huey_3.0.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-huey_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-huey_3.0.1.bb
index f07383ed45..cbca3cef31 100644
--- a/meta-python/recipes-devtools/python/python3-huey_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_3.0.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "0cfc83617b90132b0d375a3a3726aa7263cd461e7ae12af79b3a94e2630afaf5"
+SRC_URI[sha256sum] = "83ca54fa77c4ee27349393212fc13088142244f491be903f620a9e46e8fca4ce"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.43.0


