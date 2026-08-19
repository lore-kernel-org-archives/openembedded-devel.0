Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F08FC5DF8A
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3348.1787132217428468842
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MrTJtg1K;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132222; x=1818668222;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Owyuu31VjqnM2yFf1OUrKq1s767nTLKDyaPp/eMgdLM=;
  b=MrTJtg1KH6Gq5v4Aa84aA3zrBLmrARNNx1oF38vBakisHBHYLliQK5B0
   O6EECEsVjJBsfRyF3iBl/D8rMoVh+ugjy1Ukft4xG4P8FVbaofXzv/8sY
   iW0O/qiBUjaGKrN9J67Y1rsdE3nI4vtP2vuYkQraCSuUoZqvbL32Ao7f/
   gtp/nmfbsa1Qzl1/iR7VBkZjjePODxeD/z2nTiSxm+axMZ1KtoTQATuPr
   iIZMgy3QPXWTKZCDYec0aEeeOetMnNwwhrw0LAFxeZp3TTIPn+yW9UAdk
   qNqpjiv85uZxrC4+HkCrFo7TaEE8IJXSp8/ter6GZ/DTKbhTktLTLAHjc
   Q==;
X-CSE-ConnectionGUID: iKg9e+d3Rvy9c9cwUfuySQ==
X-CSE-MsgGUID: zFpR9UpqSWGtHYOjei1Vjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="255507934"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="255507934"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:37:01 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id AF2C8100037B
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:57 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5FF40C020BA
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 550FF1801C0A;
	Wed, 19 Aug 2026 09:36:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 55/70] python3-soupsieve: upgrade 2.9.1 -> 2.9.2
Date: Wed, 19 Aug 2026 17:34:59 +0800
Message-ID: <20260819093514.1101-55-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129325

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- FIX: Fix issue where :is() and :where() were not accounting for empty selectors in the max selector count as they should
- FIX: Fix issue where :has() was allowing empty selectors in some circumstances even though it is not forgiving.
- FIX: Reduce selector object size when :is() and :where() contain empty selectors.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-soupsieve_2.9.1.bb => python3-soupsieve_2.9.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.9.1.bb => python3-soupsieve_2.9.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.9.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.9.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.9.1.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.9.2.bb
index bbe421b496..e1c329d867 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.9.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=74851a2f1e5c07496dcb452af6a6bf54"
 
-SRC_URI[sha256sum] = "c33e6605bbc71dd628b00c632d58ae607c22bade247e52553928f83bbb75b4ba"
+SRC_URI[sha256sum] = "4a55d8cf158a9c2e587fa4922f1bbb91d68ac829e2d6f25403a85747c71daf74"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


