Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93384C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:10:04 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7660.1787731802142705774
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t9BdAdb1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731802; x=1819267802;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WppraH3IP5W5h0ntSfeCb8pk4HXoBMJrLku5tPcx0do=;
  b=t9BdAdb1FtsjTnc9tW9RNN2RvGN8kz0crGWMg8PIM3iWaG9rCO0ojzy1
   uywmo8AMXgIc4LxuBBiaEo/iaFWWggfjLlMd1LWGsBnV9K6MZyU58JM/b
   7lqWXR+zbwGX/ObvNpsBkPPSuZbEiYZ/QkcDMnFCh3gRu23cQPu6VyQI8
   dwrWdATf95Cj8UVK4ogZ8d8mHoaa2UKg/OPi76TtnaFUsSRLfENMHr4UF
   L+x1qGlF6wN8V2noaFLqjN0YgQjYWPR4evM65lDPG1fsYa1p4aexP+Dyf
   87WQ9GzLLWfty0vS/2yGbhRwjnd0edouAf6duhfCDE15++dJn8+Azn/tq
   g==;
X-CSE-ConnectionGUID: xW1zFfgLQHS1NBhudK4BcA==
X-CSE-MsgGUID: us0YOhCjQvGgZlDu4kky1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252688717"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252688717"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:10:00 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6B7D51C1C71C
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:00 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1D26C8D29D8
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4668514001C3;
	Wed, 26 Aug 2026 08:09:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/23] python3-reportlab: upgrade 5.0.0 -> 5.0.1
Date: Wed, 26 Aug 2026 16:09:21 +0800
Message-ID: <20260826080926.989-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129510

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-reportlab_5.0.0.bb => python3-reportlab_5.0.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-reportlab_5.0.0.bb => python3-reportlab_5.0.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-reportlab_5.0.0.bb b/meta-python/recipes-devtools/python/python3-reportlab_5.0.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-reportlab_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-reportlab_5.0.1.bb
index f77a533c31..07d0467696 100644
--- a/meta-python/recipes-devtools/python/python3-reportlab_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-reportlab_5.0.1.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "An Open Source Python library for generating PDFs and graphics."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf24392f451ff6710fca1e96cefa0424"
 
-SRC_URI[sha256sum] = "e4494a0c6623ae213bb856fba523171b2b54a7bf629fda02d5e525a7b899a784"
+SRC_URI[sha256sum] = "ebd13154be1c8515e665de70bd2d303ae9ddc3ef47e44afd5116441ca0283a26"
 
 CVE_PRODUCT = "reportlab"
 CVE_STATUS[CVE-2020-28463] = "fixed-version: has been fixed since 3.5.55"
-- 
2.43.0


