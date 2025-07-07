Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4EDC83F0A
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:07 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.55563.1751879225136488349
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G6yhosVk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879225; x=1783415225;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pQAs4wUiJBnaDllTFdLKRRBynxXpwNcdn5Lf3gKMI5I=;
  b=G6yhosVkIMdm2C+mbIZ8OU96IgQaSaDWdFDsq7XhLpbZMeOIK9Bgx1gI
   2i/pleWEe6M7mgIeCx9bwPmOVTvTb1UO7OF4RLpvhjQoSN6dgHrKebw+p
   f5JqAUiynIiZQ1fkgbtlBKMz95QSjowwAPaAIC+d1WBlpRXysw0TroOdJ
   jr5fNx32C1mZYSbrR0R144Uhp+Fq+pAcn7kg9SwEQZgM76q5maP+hNKuh
   vO3RlEGEFQjvngBR9yJ0PiHNKaBot261yb30RRu78pbjH2qW4+q09r48v
   SrdRNl4P9ekBFrcRhZykhiKyT26t3sR1mA1lvWKafhrC6GKoefY7kkiej
   Q==;
X-CSE-ConnectionGUID: XtqnfMPXThm3qCR0yEjhdg==
X-CSE-MsgGUID: +d1E2mWaRJWeLDJxqTL5/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="205475710"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="205475710"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:03 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 3CB2242A301
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:03 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id B05F61800BD6
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:02 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DDBAD4F57
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:01 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4FA131A0071;
	Mon,  7 Jul 2025 17:07:00 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/35] btop: upgrade 1.4.3 -> 1.4.4
Date: Mon,  7 Jul 2025 17:06:22 +0800
Message-ID: <20250707090656.1216-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118247

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix auto-detection of CPU temp on Ampere boards
- Fixed floating_humanizer() to work correctly when numeric delimiter isn't a dot.
- Add command line option to set an inital filter
- Make 100ms the minimal refresh rate. Exit gracefully if integer conversion in CLI parser fails.
- Lock/unlock config to avoid infinite recursio
- Fix incorrect positioning and start symbol of second title
- Fix dangling reference warnings for GCC 13 and later

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/btop/{btop_1.4.3.bb => btop_1.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/btop/{btop_1.4.3.bb => btop_1.4.4.bb} (93%)

diff --git a/meta-oe/recipes-support/btop/btop_1.4.3.bb b/meta-oe/recipes-support/btop/btop_1.4.4.bb
similarity index 93%
rename from meta-oe/recipes-support/btop/btop_1.4.3.bb
rename to meta-oe/recipes-support/btop/btop_1.4.4.bb
index 9a5a21c56d..2d187c18a8 100644
--- a/meta-oe/recipes-support/btop/btop_1.4.3.bb
+++ b/meta-oe/recipes-support/btop/btop_1.4.4.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 
 SRC_URI = "git://github.com/aristocratos/btop.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "3f1ccd9f6c455fef6d4d8cfbc8ed71b86961323d"
+SRCREV = "0f398abd64febfbc5f2115be3156682f47308f48"
 
 
 inherit cmake
-- 
2.43.0


