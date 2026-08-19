Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE9BC5DF89
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:32 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3312.1787132179675746840
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ii8krKRX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132186; x=1818668186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zo9c0NOo79oftFxwxfV0gEgtdL7vCdC3m4hOofasahw=;
  b=Ii8krKRXHiaYw6rO/bF/j3fRfsCUwI/aJAHPJGWh1OQm2KNOzZtgWc4K
   jvHxg59IydTLzTxWJL0JptWp97JM7Ms0QvGn4dshY65Q2ehb94fnZBvg0
   XRntZ5AyQn9vpM5Zz+mieAqrBnPoo9CxfRkIbe2y4JvFSNaKxh9D+KeSX
   9KutFJbL2Ul/1x0gZNEk8kFtHjSgk7EaxOBpcYgevt6Mq1gxRuo7ryysH
   ih/7CSq381O7qLJbTjEYGQ1eQ9KkZPqo9TLK+ww/Ogt/F9wrAHVcbSGcK
   c+gxzsQvHkzeUbxOpsEv3AFVecOSeAIvtxJtCwYXbiduJlc+fiwpGG+80
   Q==;
X-CSE-ConnectionGUID: /TL7Hx48T0uS6AsotlxkiA==
X-CSE-MsgGUID: 9qyUitehTnSqkpHOAPhlaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251357060"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251357060"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:25 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B19C3100037B
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:21 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 6255410003A0
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 536B71801C0A;
	Wed, 19 Aug 2026 09:36:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/70] python3-httpx2: upgrade 2.9.1 -> 2.10.0
Date: Wed, 19 Aug 2026 17:34:39 +0800
Message-ID: <20260819093514.1101-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129305

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Add support for running on WebAssembly / Emscripten via Pyodide, using a
  JavaScript fetch-based transport defined in httpx2-jsfetch.
- Add max_event_size to cap SSE event buffering.
- Add RFC 9110 status code constants.
- Add support for Python 3.15.
- Improve SSE chunk buffering performance.
- Skip cookie extraction for responses without Set-Cookie headers.
- Return str | None instead of Any from Headers.get.
- Enforce the WebSocket max message size across fragmented messages.
- Ignore unsolicited and duplicate WebSocket Pong frames.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-httpx2_2.9.1.bb => python3-httpx2_2.10.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpx2_2.9.1.bb => python3-httpx2_2.10.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-httpx2_2.9.1.bb b/meta-python/recipes-devtools/python/python3-httpx2_2.10.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-httpx2_2.9.1.bb
rename to meta-python/recipes-devtools/python/python3-httpx2_2.10.0.bb
index ed067f73db..1be888ed00 100644
--- a/meta-python/recipes-devtools/python/python3-httpx2_2.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-httpx2_2.10.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "The next generation HTTP client."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=166cfc32dc0986f87a7e950553b52e5e"
 
-SRC_URI[sha256sum] = "1932a768737e3666291582833da748cc4e563c337cf96706fccc04fa6e58764a"
+SRC_URI[sha256sum] = "8741d7329fe2c7885fc9ceb61c8217acfb87a85f75723714b89ebf7ad7196338"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


