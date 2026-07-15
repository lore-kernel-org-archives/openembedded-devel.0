Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CDAC4450C
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:00 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3437.1784111993329986615
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X42t6f4L;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784111995; x=1815647995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jjBwua/ynPE4DMTiZfQNjLj9Qs35KkRf0R562gKUywA=;
  b=X42t6f4L986yw29U+7gHfBlU/hO0f+H1+WbR6HvOz8d8ngy3onK9m2Fl
   w1KMGn54cLWnlJjk8Dj43thnALqxO0eoiBitrASU5m0tNwogGlmEsJPXs
   6r9hnRtTK3J44XDjzqh3MOai6QTdfiVUj/jSkyRQcFBi1kFXhGC0jzPsK
   uExdRd/z56NmEkhAGTiJUYCh1F+X9cJIJV5KrBdnOsSmWZ7IJGXm/yh/z
   h2wdPAZPxu0RbSTX4Wn21BeVOG6BEIawIBxvS6JmNy1JcFK9/b3aZxPV0
   rZfatqBI2l1wgKg0DSDFWBA621r+XVUNCTQg7k8LwjoVqD/OlOqAEyAKY
   Q==;
X-CSE-ConnectionGUID: 0RaHqEHbRCSToEc/iuDadA==
X-CSE-MsgGUID: kgvqNXOZQGC/ZZJwU55Rrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="245662346"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="245662346"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:39:53 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 92E481C01699
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:51 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4A804181AE9C
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 680C51802731;
	Wed, 15 Jul 2026 10:39:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/44] python3-anyio: upgrade 4.14.1 -> 4.14.2
Date: Wed, 15 Jul 2026 18:38:40 +0800
Message-ID: <20260715103914.2120-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128183

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Changed ByteReceiveStream.receive() implementations to raise a ValueError
  when max_bytes is not a positive integer
- Fixed CapacityLimiter.total_tokens rejecting float("inf") when the limiter
  was instantiated outside of an event loop. The adapter setter checked for
  infinity by identity (value is math.inf), so only the exact math.inf singleton
  was accepted, while every backend setter (using math.isinf()) accepts any
  positive infinity
- Fixed to_process.run_sync() deadlocking when the worker function writes
  enough data to sys.stderr to fill the (undrained) pipe buffer. The worker
  process now redirects sys.stderr to os.devnull as well, matching the documented
  behavior
- Fixed TLSStream.wrap() matching an internationalized (unicode) host name
  against the peer certificate using IDNA 2003 (via the standard library)
  instead of IDNA 2008, which could cause the host name to be matched against the
  wrong certificate
- Fixed anyio.open_process() (and run_process()) ignoring the extra_groups
  argument, as it mistakenly passed the value of the group argument instead
- Fixed CapacityLimiter.acquire_nowait() and
  CapacityLimiter.acquire_nowait_on_behalf_of() raising trio.WouldBlock instead
  of anyio.WouldBlock on the trio backend when there are no tokens available
- Fixed CapacityLimiter on the asyncio backend over-granting tokens
  (borrowed_tokens exceeding total_tokens and available_tokens going negative)
  when a non-blocking acquire was made in the window between a token being
  released and the notified waiter resuming. The freed token is now reserved for
  the woken waiter right away, so the non-blocking acquire correctly raises
  WouldBlock
- Fixed unnecessary CPU spin when delivering cancellation from CancelScope on
  asyncio under certain conditions, including improper cancel scope nesting

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-anyio_4.14.1.bb => python3-anyio_4.14.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.14.1.bb => python3-anyio_4.14.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.14.1.bb b/meta-python/recipes-devtools/python/python3-anyio_4.14.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-anyio_4.14.1.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.14.2.bb
index b582b8eb0e..f817610a1c 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.14.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8d648a3544c1a700e3ff78615cd679e4c5c3f149904287e73687b2596963629e"
+SRC_URI[sha256sum] = "cfa139f3ed1a23ee8f88a145ddb5ac7605b8bbfd8592baacd7ce3d8bb4313c7f"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.43.0


