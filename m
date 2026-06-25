Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D94CDE002
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:39 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7241.1782378151703224696
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dQAX6p7A;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378151; x=1813914151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9vpovjv8YuxOz7Bkg60mOfrz7LhFbB3VUIXKQxnNtoU=;
  b=dQAX6p7AIkTHIKaXvgSc9rdc5WEE7E0zvIPHHAp3BcXccwxpz3u5yAVs
   9Eipu+bn2BqAZvr9xbQAqmzhNBZM3CEIo9T6lV1qbUQWvnpeB7bMqMjd4
   ZY+urxk53QHRFhvBQ2lcPKi+cVr+iK1BDwOMiXJAqAlpKWGWvrNaSQ2dp
   f619jdCaMdScJgULQk9Rel72GqSgIFy36t5ScBKQt9cKh7DY0G4/cPjDB
   uwvuCEI+t/9v15Pgl8lqKGkWt/pO7k9N4A6m2GrQlZk4ZRk01CTPcrcxl
   t0Ez4NYW+8fuJG1DbmicFznszjpMfJ4Bn0BlTeJm0vaUgQPKqU/XSnBdW
   Q==;
X-CSE-ConnectionGUID: wjsl4mJFSXe4Ox024POxEA==
X-CSE-MsgGUID: u00JAQGRT5SiUn7K7dAJJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="222999919"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="222999919"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:30 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 347EE1000169
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:30 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id DC71D1800BC3
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 018731017329;
	Thu, 25 Jun 2026 09:02:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/47] python3-socketio: upgrade 5.16.2 -> 5.16.3
Date: Thu, 25 Jun 2026 17:01:17 +0800
Message-ID: <20260625090127.1563-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127769

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Catch all exceptions in redis and rabbitmq client managers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-socketio_5.16.2.bb => python3-socketio_5.16.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.16.2.bb => python3-socketio_5.16.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.16.2.bb b/meta-python/recipes-devtools/python/python3-socketio_5.16.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-socketio_5.16.2.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.16.3.bb
index 97a378b879..be352876a8 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.16.3.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python_socketio"
 
-SRC_URI[sha256sum] = "ad88c228d921646efa436c0a0df217e364ef30ec072df4041484e54d49c15989"
+SRC_URI[sha256sum] = "89b136f677ae65607a84cecda9b4d6c5377b40a97582c504c25df89af16d520e"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,python3-aiohttp python3-websockets"
-- 
2.43.0


