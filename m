Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A44EC5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:21 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3311.1787132177979739747
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BbNNWFsQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132180; x=1818668180;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9imvn4K/9s4C1qVRAoqiCVGs37EBT4BeK2AizidSRPE=;
  b=BbNNWFsQiW6WUIk67HmE8Ss//kz3FNG5/tECwDS3RPmnUm9xFVhAHMzh
   0wsovKpnHwHiDRSVOgzdNQAmKiBKJPM4V60klmDizqwIbs+yt16WrfNHA
   JJ4jMPj7vumyU8r0K29edJvcKXDqU9Q36h7swckoKkMbZ4h03OL+/MBNs
   mEksQhszURFUpKbxSjJQ0xyMMIRPNPl4GI0Prcu1E6EJxGJhlvSk+Yjif
   RQI6N/Bwayj2leVyIen0lQZLCjGrshZKkqn7LrqhAG+XUY44SSPkr8NC+
   YYP0n/tstVNJ8Omt0m+gBSbp5AA5hZErtX4JgYqsXK+9waEZ2YGdVR5z7
   g==;
X-CSE-ConnectionGUID: LZ7Zv93dSPCyMc6QEUUQnw==
X-CSE-MsgGUID: GtJPmjGVT4ajES5wRaUJsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239330857"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239330857"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:20 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E1D79100037B
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:19 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 945CB1000104
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9092A1801C0F;
	Wed, 19 Aug 2026 09:36:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/70] python3-greenlet: upgrade 3.5.4 -> 3.5.5
Date: Wed, 19 Aug 2026 17:34:38 +0800
Message-ID: <20260819093514.1101-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129304

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Link the C++ runtime statically into the Windows wheels again, as the
  Appveyor builds did through 3.3.0. Since 3.3.1 _greenlet.pyd imported
  MSVCP140.dll, which no Windows CPython distribution ships, so importing
  greenlet failed on machines without the Visual C++ redistributable.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_3.5.4.bb => python3-greenlet_3.5.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.5.4.bb => python3-greenlet_3.5.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.5.4.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.5.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.5.4.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.5.5.bb
index 3fc80fc0fd..e246b7f253 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.5.5.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT AND PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "0232ae1de90a8e07867bb127d7a6ba2301e859145489f25cda8a6096dabe1d20"
+SRC_URI[sha256sum] = "adb4bae02e91a8e863e48b177e4014bdcac8a6b5e047ea1df687a61534b85e6c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


