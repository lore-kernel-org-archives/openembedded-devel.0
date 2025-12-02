Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0947D116FE
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:09 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4291.1764669119913949666
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iSzBfdnB;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669120; x=1796205120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ueEduaTuglEm+Ke++jSHQrwT3ObYd2uyYlFyfZ2wRvo=;
  b=iSzBfdnBNpGb7CxTAQtGqKpHiBYgdog0p9eGNlH0Va2bW313WZcFd4NX
   eZgRwxltgXFEIqNmcGlFkE+0sxJzB7Uuk7pvMx85Ztb6cJyHyQApbop4J
   bhozZ8adHT1kgGFnJuWZYilkrSPYfRMu4q4SiQaW9cDRfR5H+R0F/1VWD
   ZNzwQPi44XR/WM9/ikRtxqFRTtwbhpkge2w2ckDviMmUvPIKAINJAtsxV
   e5CEiHkLwY0BB4cdH+gJafZT2gEeIwf5wFVQ1DAtAlzQ3zRx5J6X5DtR7
   xe2t6cjXV7shEdPA778jWBRliT8qVxg0zrx+r29xLS1REG5q2ieXlrVHb
   w==;
X-CSE-ConnectionGUID: JuGOiMaoQiKmVg5zcMJ5Dw==
X-CSE-MsgGUID: ESDtLgDoTKCwyCLhsjBgLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="209140923"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="209140923"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:51:58 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 1D154C0037E
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:58 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id C6395C0183C
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 4CB1B101A432;
	Tue,  2 Dec 2025 09:51:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/25] python3-anyio: upgrade 4.11.0 -> 4.12.0
Date: Tue,  2 Dec 2025 17:51:16 +0800
Message-ID: <20251202095132.652-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122242

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===============
- Added support for asyncio's task call graphs on Python 3.14 and later when
  using AnyIO's task groups
- Added an asynchronous implementation of the functools module
- Added support for uvloop=True on Windows via the winloop implementation
- Added support for use as a context manager to anyio.lowlevel.RunVar
- Added __all__ declarations to public submodules (anyio.lowlevel etc.)
- Added the ability to set the token count of a CapacityLimiter to zero
- Added parameters case_sensitive and recurse_symlinks along with support for
  path-like objects to anyio.Path.glob() and anyio.Path.rglob()
- Dropped sniffio as a direct dependency and added the get_available_backends()
  function
- Fixed Process.stdin.send() not raising ClosedResourceError and
  BrokenResourceError on asyncio. Previously, a non-AnyIO exception was raised
  in such cases
- Fixed Process.stdin.send() not checkpointing before writing data on asyncio
- Fixed a race condition where cancelling a Future from
  BlockingPortal.start_task_soon() would sometimes not cancel the async function
- Fixed the presence of the pytest plugin causing breakage with older versions
  of pytest (<= 6.1.2)
- Fixed a rarely occurring RuntimeError: Set changed size during iteration while
  shutting down the process pool when using the asyncio backend

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-anyio_4.11.0.bb => python3-anyio_4.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.11.0.bb => python3-anyio_4.12.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.11.0.bb b/meta-python/recipes-devtools/python/python3-anyio_4.12.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-anyio_4.11.0.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.12.0.bb
index a24674c5fb..500c1bd3dc 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.12.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "82a8d0b81e318cc5ce71a5f1f8b5c4e63619620b63141ef8c995fa0db95a57c4"
+SRC_URI[sha256sum] = "73c693b567b0c55130c104d0b43a9baf3aa6a31fc6110116509f27bf75e21ec0"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.43.0


