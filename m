Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A61CCA471
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:55 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.5580.1759990126706663063
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RefIEc1S;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990126; x=1791526126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mjncaVN70mNMGCB3o6ytjRPohNF4wDiYhyVMhNZHWd0=;
  b=RefIEc1SgIVBmoZZ1JEKEagI81TnZteuA/uX4ci4fb95PkI7G7Hrxe/O
   Ihp/SeyMM4FQbbdCTe748b1pvQkTDCKIY7le0LPQx0RZCLB2694RUk7R5
   usQQKi/5FjcL5fiY8xu+8USrW1J+heScCGB05bZ7tO83zbvSiMPItB4tp
   WQ3Fon8lHBfXjbWOMU3nOqJ0bVD2x0QnI38hzPUs+p9cXfkC/8WD0Qlo7
   ODudaHqoW3YrNM6gR6mCTu6KU4GfYbqcnim7zqV8mmjmxwQj2hqCx/piM
   A8uJMcI6hXbTKGfUG+ZWWfLDQei3bEp917hdTVXHl87T6kIeZLB5MwjjK
   Q==;
X-CSE-ConnectionGUID: XjhCDXAUR6aZk5WBAChTtQ==
X-CSE-MsgGUID: LaTsmw/bRGmIPZr7asnntg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="216020940"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="216020940"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:45 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 419F4C000B7
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:45 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 00B49896E02
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id A65BC1003109;
	Thu,  9 Oct 2025 06:08:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/22] python3-inline-snapshot: upgrade 0.29.0 -> 0.29.1
Date: Thu,  9 Oct 2025 14:08:03 +0800
Message-ID: <20251009060809.445-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120413

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.29.0.bb => python3-inline-snapshot_0.29.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.29.0.bb => python3-inline-snapshot_0.29.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.0.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.0.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.1.bb
index c26f55111f..d0d3049388 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "8bac016fc8ff4638a6cdebca96d7042fecde471f0574d360de11f552ba77d6b5"
+SRC_URI[sha256sum] = "17e73cb6864fa067aa94c2c1f290bbdeb25b2b807c4bdf53eee39a144f92a5a7"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


