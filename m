Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D49D2D8E0
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:45:48 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6918.1769507140593774595
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:45:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n0wmkeMU;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507140; x=1801043140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IHzNn9+SR9MRdz3BU+Q0nO7qdBVAWfH2F4TcMaoOT6U=;
  b=n0wmkeMU11se0TBAQ76ocOR54IEdUAaJBytu5zCvN/7OOjiW9hch8A3o
   6WYijglOkZpQofdPsqVdvlojNlqhGy1cfcXGXytwcP8KEgMhk5LSv0/XL
   MIzlavo75KdOY2FBB2yL98KuqejaD9H+0r9Mr4MUuFv7vbKk5RJy3ZRNK
   mHl372HuAcQ/89kUYUG8Xm7I9R5DFWKmmgA/W0n8Pk7xgBFEhVcBuOHbe
   gQNjg5Ri6G7Ej/nI0oZI8eVTi9d1a4jw856Dl40ZTm7X8EopzS2PjrDe/
   wJ29qeJq/+Adb2sc/TriExc2jQGfIWm5Weej2V4Q4rQEb259pc4VmDOHs
   g==;
X-CSE-ConnectionGUID: Ts6LrhhTQz+cI8yQpIrogw==
X-CSE-MsgGUID: wFUFkl3+QqmzIwCIAvq0NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="206088371"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="206088371"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:18 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 2B63D676C
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:18 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id DDD8518026F1
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 58B6C20000E3;
	Tue, 27 Jan 2026 09:44:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/25] python3-dill: upgrade 0.4.0 -> 0.4.1
Date: Tue, 27 Jan 2026 17:43:28 +0800
Message-ID: <20260127094339.1081-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123933

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-dill_0.4.0.bb => python3-dill_0.4.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dill_0.4.0.bb => python3-dill_0.4.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-dill_0.4.0.bb b/meta-python/recipes-devtools/python/python3-dill_0.4.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-dill_0.4.0.bb
rename to meta-python/recipes-devtools/python/python3-dill_0.4.1.bb
index d421b1a887..e08e97113d 100644
--- a/meta-python/recipes-devtools/python/python3-dill_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dill_0.4.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Serialize all of python"
 HOMEPAGE = "https://pypi.org/project/dill/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ed5ea77287d7d542949d6dd0bc288ac0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7a60f86720d45856324c45945cfed6b3"
 
-SRC_URI[sha256sum] = "0633f1d2df477324f53a895b02c901fb961bdbf65a17122586ea7019292cbcf0"
+SRC_URI[sha256sum] = "423092df4182177d4d8ba8290c8a5b640c66ab35ec7da59ccfa00f6fa3eea5fa"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


