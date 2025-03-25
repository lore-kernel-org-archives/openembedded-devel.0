Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FFDC3600D
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:29 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.61118.1742893344858663265
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P+L7y9EF;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893345; x=1774429345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aNVbyVMOcQiQ5o7g2321/2eW015BTTf4z7c6JNQ9mWc=;
  b=P+L7y9EFTSgqWOzkaH1d6A4xSm6cAC5eNTO2m3OeRtnZ07XdDjHBLUPj
   IZsSAphapoeAm4CbDtb1YLtRZxOrf4V0VHIMlEdBLde8QTXbuvR18DEFi
   nxxxHSBKHQmXVbJLa8FwSQAzM3KI0nNRdK1wbW6vJet1g6ti6ileJDdY2
   SB+RCSi5kOWRjOep2tgIix4ElGCOHK1gcH1GiwjKUKxc0lZsFhPx/qh+k
   P6R9TIEFIj0qyPK4mYr4ha16Xk257Np8P3fRmNGzXUq76QnLhv5y48pW5
   rFk6I2Z2rRCOnep01aw6oVCuTL4qeUpBkr9+gfCgfeAaUwczSmYOC2V2A
   g==;
X-CSE-ConnectionGUID: r4qCkvT7RI+D4MoWwtCCtg==
X-CSE-MsgGUID: H7wSpLH3Qb+AhO5A9J6nbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="173100995"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="173100995"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:22 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C09DBE689B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 856FBD72B6
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 491841A0078;
	Tue, 25 Mar 2025 17:02:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 43/45] rasdaemon: upgrade 0.8.2 -> 0.8.3
Date: Tue, 25 Mar 2025 17:01:50 +0800
Message-Id: <1742893312-3809-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116268

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix checkpatch warnings
- Use the right dev_t decoding for diskerror handler
- Add new modules supported by HiSilicon common section
- Fix some static check warning
- Fix few compilation warnings in non standard hisilicon code
- Fix some compilation alarms in ras-record.h.
- ras-mc-ctl: Update logging of CXL memory module data to align with CXL spec rev 3.1
- ras-mc-ctl: Update logging of CXL DRAM event data to align with CXL spec rev 3.1
- ras-mc-ctl: Update logging of CXL general media event data to align with CXL spec rev 3.1
- ras-mc-ctl: Update logging of common event data to align with CXL spec rev 3.1
- ras-mc-ctl: Fix logging of memory event type in CXL DRAM error table
- cxl: Update memory module event to CXL spec rev 3.1
- cxl: Update CXL DRAM event to CXL spec rev 3.1
- cxl: Update CXL general media event to CXL spec rev 3.1
- cxl: Add Component Identifier formatting for CXL spec rev 3.1
- cxl: Update common event to CXL spec rev 3.1
- cxl: Add automatic indexing for storing CXL fields in SQLite database
- cxl: Fix mismatch in region field's name with kernel DRAM trace event
- cxl: Fix logging of memory event type of DRAM trace event
- Fix for parsing error when trace event's format file is larger than PAGE_SIZE
- Add page offline support for cxl memory
- for ASRock X370 Taichi
- for ASRock X570 Creator
- for ASRock X570S PG Riptide
- mce: decode io port for bus error
- arm: do not print error msg if field not found
- add DE error type for AMD
- Fix the display format of JaguarMicro vendor no standard errors

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rasdaemon/{rasdaemon_0.8.2.bb => rasdaemon_0.8.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/{rasdaemon_0.8.2.bb => rasdaemon_0.8.3.bb} (97%)

diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.2.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb
similarity index 97%
rename from meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.2.bb
rename to meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb
index 333d75a4f5..f21a3216af 100644
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.2.bb
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://github.com/mchehab/rasdaemon.git;branch=master;protocol=https \
            file://rasdaemon.service \
            file://init"
 
-SRCREV = "e6cc13e37a17843a2a82313928cd6deed9918649"
+SRCREV = "db0870edd2919f4f4d0101843136bcae92ab0743"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


