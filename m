Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051D5C4450C
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:11 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3444.1784112005889221873
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VZVmyIr0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112009; x=1815648009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zOf2DN9PGLm1cWsGg1fd9TWEgIoULytKRPpTkVFNjBs=;
  b=VZVmyIr0XDeN8AETk9EvqVRDpzj/iUltg6aRtTgbaPRCXv7GlSnoQ/Wg
   FbwWlPfeppEncvJIYt93mjSlsd2P90gNpzIrfQG5GqMSyKRdtEd0vE70C
   yX6jZsSzSBDWOtE+dm2NUSudr+sNP6MI0nu423wfpxwmQQ4VaNw8klMHt
   G7Svm4yvIVVK3p7R1jdArUoE4T6aUWCQQC5nFbP8jXL2k9kz7M4F4pF5g
   uUJKW1kk4fHy8+8K4vu7Jk1fII045LV1k4T5A0VwQMJHApibSfHeygRFi
   YOaTxEEAFrca/tLhY09fyS2PXPC4ernfHbdQsoAi4TeFdVUwB1xomePzB
   A==;
X-CSE-ConnectionGUID: ydulERH5SUW7jtDSqHGWgQ==
X-CSE-MsgGUID: 5QnduOEXS6q0S1iXyBJWMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247440393"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247440393"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:07 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 462811C00094
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:04 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E41971C00167
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id EFA6D1801122;
	Wed, 15 Jul 2026 10:40:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/44] python3-croniter: upgrade 6.2.3 -> 6.2.4
Date: Wed, 15 Jul 2026 18:38:48 +0800
Message-ID: <20260715103914.2120-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128191

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix expand_from_start_time day-of-week low bound so Sunday wraps correctly
  for stepped day-of-week ranges (isoweekday() % 7 instead of weekday() + 1).
- Bump pinned GitHub Actions via dependabot.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-croniter_6.2.3.bb => python3-croniter_6.2.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_6.2.3.bb => python3-croniter_6.2.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_6.2.3.bb b/meta-python/recipes-devtools/python/python3-croniter_6.2.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-croniter_6.2.3.bb
rename to meta-python/recipes-devtools/python/python3-croniter_6.2.4.bb
index 7da022f58f..2058ec39b2 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_6.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_6.2.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 SRC_URI += "file://0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch"
-SRC_URI[sha256sum] = "fb129986ef7e2c44e3f4c9f503da83ad914d2afa48f40a43ee3dca4b5c41d476"
+SRC_URI[sha256sum] = "fc124f751b1b04805c2a04b061898b436b45ab2320b045e1e052ea895de65189"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


