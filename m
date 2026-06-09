Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84694CD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:29:41 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76502.1781000975363631865
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y4phvoEd;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781000975; x=1812536975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iMjcEYHL6NYkaow77uO7HpfEHRu6syqeSwTjqO+8EVI=;
  b=Y4phvoEdv3Ip3iXr7jaIH1MTOWT1JLjArKddRMVa0TaDdYFvSocMWrUO
   pIcCuVCz/fq3xf/m6Gq+Ft9BJIoWFAmxgkbFGSLjn2sUZlJnCHeleJm35
   0p8Qk3xUIFT6qF6FfM84cdry7pWZ8x8bGyrecSs4VviYMcEnkE5HLpJ04
   8iAvEwjAa6BzrtNN4I0HoEnDQc0EuZ6iKnZ7ah0z7GpGrgHifah4z5JVg
   f2J7V8j98Iskp4eaD/evEyyQTJCHSPwbkZLbikJeBcXJvcKsYby9/HMj4
   S0ZuZdZOOW/f7YnJ27v6F9UUUrKQ7bUtE8dIoEM5d6Ks/10xEE7zCctTi
   Q==;
X-CSE-ConnectionGUID: ZHZK8sDuRseKfVT9ydkN0A==
X-CSE-MsgGUID: KJ8Go9vwReG17IleL2MxSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="241652280"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="241652280"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:29:33 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id AEA30820711
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:33 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6828918002C7
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 9182A10003C5;
	Tue,  9 Jun 2026 10:29:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/30] hiredis: upgrade 1.3.0 -> 1.4.0
Date: Tue,  9 Jun 2026 18:28:50 +0800
Message-ID: <20260609102913.2204-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127461

From: Wang Mingyu <wangmy@fujitsu.com>

Improvements
================
- Increase required cmake version to 3.15
- Use ffc (pure-C99) as the RESP3 double parser instead of strtod
- FetchContent should not include cpack
- Add C++ compatibility to sds.h
- Apply FD_CLOEXEC on sockets

Bug Fixes
=============
- fix: add NULL check for c->funcs in redisReconnect
- Fix buffer overflow in tests.

Maintenance
===============
- Fix CI for macOS and docker based runs.
- Fix CI on MacOS runners.
- Define ssize_t as intptr_t in Windows

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../hiredis/{hiredis_1.3.0.bb => hiredis_1.4.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/hiredis/{hiredis_1.3.0.bb => hiredis_1.4.0.bb} (91%)

diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.3.0.bb b/meta-oe/recipes-extended/hiredis/hiredis_1.4.0.bb
similarity index 91%
rename from meta-oe/recipes-extended/hiredis/hiredis_1.3.0.bb
rename to meta-oe/recipes-extended/hiredis/hiredis_1.4.0.bb
index 0cf03bfcda..62e5a36318 100644
--- a/meta-oe/recipes-extended/hiredis/hiredis_1.3.0.bb
+++ b/meta-oe/recipes-extended/hiredis/hiredis_1.4.0.bb
@@ -5,10 +5,10 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d84d659a35c666d23233e54503aaea51"
 
 SRC_URI = " \
-    git://github.com/redis/hiredis;protocol=https;branch=master \
+    git://github.com/redis/hiredis;protocol=https;branch=master;tag=v${PV} \
     file://run-ptest \
     "
-SRCREV = "ccad7ebaf99310957004661d1c5f82d2a33ebd10"
+SRCREV = "67c88a05bb97c40d5c29d0680e51828627e4f362"
 
 inherit cmake ptest
 
-- 
2.43.0


