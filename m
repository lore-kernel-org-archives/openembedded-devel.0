Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797CFC61DCD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:09:54 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7651.1787731781243571150
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oFszjgXc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731790; x=1819267790;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SW97DiS9hB6MBVk/Hz0b3k+qDmNApild4HgrNRVekcc=;
  b=oFszjgXchdBxwhN5nd3bbJ/3TD233NJ4LRpvAcIWO78v3cinLKRStm20
   3O00zywWwzYkWrYcnXcdlvOsdPjn8kH2n8mKBGAazV8QciHmcWYziV/Dm
   43/y3Yqac36ehbmt2DN/p5mlLgNkia/htNSijZBN9MtkFemgFUmgiIg/J
   nObQVQi9VB/d6ZkEmAqns2r8DR+bvAaVDyATpTGQADuqt/uzbA6G08PTw
   fDGD1Kvy3ZKUvAU8DUjzaU1JcgfPpk8/eC6bGrgCUOCdYX4EWm0oVgU6D
   dwyUmj5e3AZSxx2l9B63yok/Nj0Tq91c/jXXGrUEO9a7Hqs/INcEA0UDR
   A==;
X-CSE-ConnectionGUID: J2DPhq7xTu27KnL9JnEhkw==
X-CSE-MsgGUID: bIbeEPwaQsK62giTmRqTDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252713221"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252713221"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:49 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C0FE6820C13
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:45 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 7BC01C01824
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9984314063AB;
	Wed, 26 Aug 2026 08:09:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/23] python3-bitstruct: upgrade 8.22.2 -> 8.23.0
Date: Wed, 26 Aug 2026 16:09:12 +0800
Message-ID: <20260826080926.989-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129501

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-bitstruct_8.22.2.bb => python3-bitstruct_8.23.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstruct_8.22.2.bb => python3-bitstruct_8.23.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.22.2.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.23.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-bitstruct_8.22.2.bb
rename to meta-python/recipes-devtools/python/python3-bitstruct_8.23.0.bb
index 2225299329..72b1a672f9 100644
--- a/meta-python/recipes-devtools/python/python3-bitstruct_8.22.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.23.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/bitstruct"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "ad3884a559871aa931d216ff45000b7ae29a5991af4fce1b24c7580d2169979b"
+SRC_URI[sha256sum] = "3d20a8d748add9b1c68efc6c592a99b4b0937c9dcddd140fdae352bf2513aea5"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


