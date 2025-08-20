Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE0ACA0EFF
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.15254.1755679203851170396
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SR78wrkZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679206; x=1787215206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1dYMDO0kycv/6XPOJEIN9CgrZXdu5q6dcFDlGLMn0hg=;
  b=SR78wrkZAt1H3vfXGayuVpm+0v/Gpp8XdVH5xeMRG+jhRY/ssSN+B59w
   xi0if895w/UvSh9YwkmJU3c7i9dQdvRDeX5pbFnem3jXsEratMifEKyQh
   AEYovCJi9W8LdBmvS8kGyo8TOG5fg+rsgtAt/jsBXJO6GQ54q8TFDCG2X
   2ZeWdpYevHkIEAS3z26yieVkabKK/yoa1KUcMnnNjTYtQr/gNPRdq/EsG
   XJTib6RIgdk4OOlF+8SkfGgudiAEPz87T7nfNH/NExOVuVjJsBEbBlMp/
   19mzyI3NHMUsGfyM44p4DIDC5+PQZL/UX3/ow5MrjgCW2xHPlPjVJoyO2
   A==;
X-CSE-ConnectionGUID: 7gGDxfDyQW2lfsekfJPHKA==
X-CSE-MsgGUID: 50Uy/P5URCyM0RJTi6kJ3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210032883"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="210032883"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:06 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 7BDC7C000BB
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:05 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 36C54C011BC
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:05 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 0812A1803FB6
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F38641A0078;
	Wed, 20 Aug 2025 16:39:59 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/26] python3-bleak: upgrade 1.0.1 -> 1.1.0
Date: Wed, 20 Aug 2025 16:39:37 +0800
Message-ID: <20250820083945.802-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119029

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Added support for Pythonista iOS app backend.
- Added BleakClient.name property for getting the peripheral's name.
- Fixed BleakClient.connect() on Android when service characteristics have descriptors.
- Fixed disconnect callback not called on Windows when Bleak initiates disconnection.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-bleak_1.0.1.bb => python3-bleak_1.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bleak_1.0.1.bb => python3-bleak_1.1.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-bleak_1.0.1.bb b/meta-python/recipes-devtools/python/python3-bleak_1.1.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-bleak_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-bleak_1.1.0.bb
index 7bc69bfeb9..3fc95ea631 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_1.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRCREV = "bf224c0230ed9096429a21d782b5b4d9d7ab7bd7"
+SRCREV = "edc9c5125614f816ac7e8edbf2b4338e3142fd3b"
 PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop;destsuffix=${S}"
 
 inherit pypi python_poetry_core ptest-python-pytest
-- 
2.43.0


