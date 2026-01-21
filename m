Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A190C44510
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:30:41 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9502.1768995028395506797
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K2YHmRjY;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995028; x=1800531028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j5/5wijn/cPd9hXdN+vP+iBouogjCCVEUctZt0Yh7SY=;
  b=K2YHmRjYsjGFzK3wBoOR4CwM51QTnwm2e4cJZm6hiYTZz1wRdl12AqXY
   8JLSiWqQPMOEanGb0ctBMAo3U1PTNB2IX9XKT8NUjtTkwgauEFfD4ssSW
   awjcrhDQagaku3h0WpRQJq5tKJIegUSomLh4EqX5Ptx25xy6NdzM/kfUz
   erKv+vNBauzhn0nrvFmrdq6r2jgC8qM9ExIfc7eX7p3CmhYSTzxJZl16b
   0oLDWQVeOfiEceO3UwuvZjrzZmfwl2FnRoDckVndrmqjLHAJHezeHXXNi
   d+rdiK5D+13EKzuiliBGU1FRmUJb8OZxHoSu9U8sViVpg51kh2O87YU2p
   g==;
X-CSE-ConnectionGUID: gMs/BY6RQbaMthIjgXVzKA==
X-CSE-MsgGUID: 3vtgxbIKQt+hl8RKdTmLUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="215159276"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="215159276"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:30:27 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id E82EDC01B16
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:26 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9FAFE8D2079
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 23D2F1401D61;
	Wed, 21 Jan 2026 11:30:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/30] python3-starlette: upgrade 0.51.0 -> 0.52.1
Date: Wed, 21 Jan 2026 19:29:07 +0800
Message-ID: <20260121112921.857-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123707

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-starlette_0.51.0.bb => python3-starlette_0.52.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.51.0.bb => python3-starlette_0.52.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.51.0.bb b/meta-python/recipes-devtools/python/python3-starlette_0.52.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-starlette_0.51.0.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.52.1.bb
index f6380bdfad..a06feb1b73 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.51.0.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.52.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "4c4fda9b1bc67f84037d3d14a5112e523509c369d9d47b111b2f984b0cc5ba6c"
+SRC_URI[sha256sum] = "834edd1b0a23167694292e94f597773bc3f89f362be6effee198165a35d62933"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


