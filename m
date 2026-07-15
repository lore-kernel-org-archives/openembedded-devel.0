Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BACC4450F
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:00 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3441.1784111998001588350
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Wt4qyS/A;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784111998; x=1815647998;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sZiUWVapRarddu/dxB1Cex4Geaom2+iZcOYjI3z0Vo0=;
  b=Wt4qyS/Av6vrSZTykBjp4tlSffWYrKwl+PhcKb1G+T+dtXPb7tbvKHob
   F298fF0ctCpzjO5E4/J5K5f6cXi9DZ4r8aiwSw48KL2AtUAlA9QJcSLuj
   c33NM6hJLqrJnFvyoyfNqVgUz+vKw03iGvmCut4+9nuM5K8du51ChAWSS
   oXVqNLy0gVxiyVhkSxtAnui31M1HwLddS0B0xxs37DV+gnn69ymo1BfSx
   Ul/YTNRjvGpiJScw3k/zrdXVLPUXbywAhS+Jy7VqjytCqcxGXq2O6GAix
   4WoWaNvYep6zaaJsxLPl5Sk4iYbjCnpa0fdsmn6PJ5WsXp5NqM4I0j9pf
   A==;
X-CSE-ConnectionGUID: ayJpO0oJTnqcx4GqVd2UBw==
X-CSE-MsgGUID: UWQVC+5OTfe28z6/L1RliQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="233681192"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="233681192"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:39:56 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5733C1C000F6
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:56 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 084BD18915CD
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 15FD61802731;
	Wed, 15 Jul 2026 10:39:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/44] python3-bumble: upgrade 0.0.231 -> 0.0.232
Date: Wed, 15 Jul 2026 18:38:43 +0800
Message-ID: <20260715103914.2120-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128186

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- CIG: Fix CIG parameters for unidirectional CIS
- Refine dependencies
- Fix race condition in PeriodicAdvertisingSync state transition
- transport/usb: Handle missing interruptEventHandler gracefully
- fix: exclude channel 76 from default CS channel_map (Core Spec 6.0 compliance)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bumble_0.0.231.bb => python3-bumble_0.0.232.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bumble_0.0.231.bb => python3-bumble_0.0.232.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-bumble_0.0.231.bb b/meta-python/recipes-devtools/python/python3-bumble_0.0.232.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-bumble_0.0.231.bb
rename to meta-python/recipes-devtools/python/python3-bumble_0.0.232.bb
index 768b204de9..dd2c1516f2 100644
--- a/meta-python/recipes-devtools/python/python3-bumble_0.0.231.bb
+++ b/meta-python/recipes-devtools/python/python3-bumble_0.0.232.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/google/bumble"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a775f1b11285b6abedd76748d176125"
 
-SRC_URI[sha256sum] = "43bd0ba5830d74ded82a369b535d2d98a8b2a41945540b1fe874bb14259dc5a2"
+SRC_URI[sha256sum] = "78dc4dde9e270367605c697fa40c2e429513ee086b800789c97443a6ac7b2b79"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


