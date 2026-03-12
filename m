Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A3C105A576
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:59:58 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18630.1773313189353741441
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SZlqCZ80;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773313187; x=1804849187;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZxSXHMJmn6KFJqJpa2ZnqvUT/yguxJIRVy+cKZQ4fzo=;
  b=SZlqCZ808qFtmqGTrqXhlgUOKEn0Es4/zzfnjVp7tp8U9YtV9M64S+uK
   r6PZHxR12NyWXllnTGNThyfRiJzQhcUWcv08MjgTD4Jl1EwQHq0x6W0Ar
   8e8WN2B7DL64vwLBZtUQHILWfkBZtt3WGCtlliSOPnrgnqhVAbGStWnYP
   I/XkofUnbEpYMoKrDQ6PHd+pJeGOvdga8kWH7e2xm6xxrELoH5Y/DhNI8
   M7ZYnrQi19Uy2R9kmy300Qe4HQSZUjEyZTgP+/HVCPcCqJ3QrD/4JOKhQ
   LJStypOXdnH+eGVIYKTMAAkxnkU7NHIRJS/vUZA+k0GJ644GlnrX69CGL
   A==;
X-CSE-ConnectionGUID: jtaoEFsaQRSXHyoyHd+0aA==
X-CSE-MsgGUID: /jPg4E7LTtyid/wgXa75ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="220950870"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="220950870"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:59:46 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DA88D1000089
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:59:47 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 8D9241804165
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:59:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id AB8A38288E7;
	Thu, 12 Mar 2026 10:59:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 52/64] python3-scikit-build-core: upgrade 0.11.6 -> 0.12.2
Date: Thu, 12 Mar 2026 18:59:28 +0800
Message-ID: <20260312105940.1900-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125152

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...build-core_0.11.6.bb => python3-scikit-build-core_0.12.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-scikit-build-core_0.11.6.bb => python3-scikit-build-core_0.12.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.6.bb b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.12.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.6.bb
rename to meta-python/recipes-devtools/python/python3-scikit-build-core_0.12.2.bb
index 93a83ead65..d7f8aacd97 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.6.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.12.2.bb
@@ -13,6 +13,6 @@ SRC_URI += " \
 	file://0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch \
 	file://0001-Find-cmake-from-PATH-instead-of-CMAKE_BIN_DIR.patch \
 "
-SRC_URI[sha256sum] = "5982ccd839735be99cfd3b92a8847c6c196692f476c215da84b79d2ad12f9f1b"
+SRC_URI[sha256sum] = "562e0bbc9de1a354c87825ccf732080268d6582a0200f648e8c4a2dcb1e3736d"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


