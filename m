Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E5DCD6E44
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:33 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16962.1779875366953803211
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y/zLzweg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875367; x=1811411367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HyZD7g8yl1K6mqkkihxG621tjmPcwn/Yj6am1Q3i10s=;
  b=Y/zLzweg7ysyjozc6LKaADaAMTZKNGyR0qIhpim2pFYuW55BPQxh0pMf
   0+Sd0QFm76DbPUvZ0r72vM3kgzQtGngigPY1E4YBD+vqHvK5cWcw6471l
   t8bm05jQopnpLlMgjB2LUh6qwRUwHp4QGg8cDSCuRR1ADzN0QRDLwXwoO
   2RD4gJiU06ko1R9KlcNsggP5zPzEnYHuP/Tl4hDOGd7DTiapG+HkbyOB3
   2MfAArLpxzXGuEdCgMv/rk76r1IFRN/MNb+NjWg8KFGhn8aQvB5LNvywe
   moj2Jz/AHYmgA6GzQRmtJFCB/Goite3qaeGa1EiWkBcsthSdai1Voh7Bo
   w==;
X-CSE-ConnectionGUID: qFApYL2YTW2cG4sjBpNgmA==
X-CSE-MsgGUID: DKpcVcD6QXuIumF0MOUotg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="240144244"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="240144244"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:25 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 89CC242A338
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:25 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3D03DC04279
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 5AB3A82A2CC;
	Wed, 27 May 2026 09:49:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/56] python3-socketio: upgrade 5.16.1 -> 5.16.2
Date: Wed, 27 May 2026 17:47:50 +0800
Message-ID: <20260527094805.2039-41-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127248

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Prevent unnecessary resource allocations
- Add zizmor to CI builds

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-socketio_5.16.1.bb => python3-socketio_5.16.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.16.1.bb => python3-socketio_5.16.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.16.1.bb b/meta-python/recipes-devtools/python/python3-socketio_5.16.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-socketio_5.16.1.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.16.2.bb
index 10372e83cc..97a378b879 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.16.2.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python_socketio"
 
-SRC_URI[sha256sum] = "f863f98eacce81ceea2e742f6388e10ca3cdd0764be21d30d5196470edf5ea89"
+SRC_URI[sha256sum] = "ad88c228d921646efa436c0a0df217e364ef30ec072df4041484e54d49c15989"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,python3-aiohttp python3-websockets"
-- 
2.43.0


