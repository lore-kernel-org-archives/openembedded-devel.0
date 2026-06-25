Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1157ACDE010
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:08 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7232.1782378122982371546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LQT9WoR6;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378123; x=1813914123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ys5c2Etz0EiSWuDghLjrOCWih+jpDSmoj8TMd8IwMQ4=;
  b=LQT9WoR6ieW5gUNB8MZaPMe6rUnhXJb75bBCroLBFNHzdAoLa48Yf671
   36+j/fa6R8Pg7+HQ7GH9uuVI7MSIDfFvjKeIOMbgOEx25knvzlxsj5bBL
   KNWMxQ7KSNzCEjYDn7uM2SfWI8MHfBtp9uEMj2uN29YyfRVnwm43AaPsR
   qXJppgZ15A/SbMkFr2wvyjazRYlIc5AswrvgWaTqfzfd+4hBkCfiZ6eOG
   4V6CCqFKfGY52KWvClI7NsnDXSs1W7pNdAVSYGkdAXfm1gVdZInAkKjEr
   5yZTzVGawnqSCwXIyc9JobbuefR+9tPXbu8sAgbxn4CmJN6D4az3lKU55
   g==;
X-CSE-ConnectionGUID: Xcq3IbfuS1WUxc8qVYl86A==
X-CSE-MsgGUID: D1HDdWz3T8eBsPgmm8QxdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="233265715"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="233265715"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:01 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 56C231C00183
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:01 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0BBF31C4F847
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2D2AF1017325;
	Thu, 25 Jun 2026 09:01:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/47] python3-cyclonedx-python-lib: upgrade 11.10.0 -> 11.11.0
Date: Thu, 25 Jun 2026 17:00:59 +0800
Message-ID: <20260625090127.1563-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127751

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- feat: CryptoPrimitive enum cases for CycloneDX 1.7
- feat: ProtocolPropertiesType enum cases for CycloneDX 1.7
- fix: ProtocolPropertiesType enum case 5g-aka for CycloneDX 1.7
- tests: check all enum completeness
- refactor: simplify contrib.bom.utils

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n-lib_11.10.0.bb => python3-cyclonedx-python-lib_11.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cyclonedx-python-lib_11.10.0.bb => python3-cyclonedx-python-lib_11.11.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.10.0.bb b/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.11.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.10.0.bb
rename to meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.11.0.bb
index 78922540e0..192fb14d7a 100644
--- a/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.11.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/CycloneDX/cyclonedx-python-lib/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "d03d6ea271e26feaf123b8b1b34468a305f33a338c5763f56e397a8408f9b290"
+SRC_URI[sha256sum] = "4b3194db72b613717f2912447e67ab618c75ff7dcac6c4af3c0e9e1ac617c102"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


