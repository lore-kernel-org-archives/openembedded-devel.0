Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3287D10A3D6F
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:44 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45657.1774526263215662373
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SiZEa3iG;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526263; x=1806062263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7KB3AtZytasPl+3jk5ZPv3IvVtXJYfFKidSq7Hjp8Qw=;
  b=SiZEa3iGn4fFouTKdMhv2oUoTUI5EjMVnvMRM0vCkX7ko7/7Boony/xl
   ON5lwXkoRj57DA+sLrONwXbJMK6eAotHUQ+Ae+ncoPOT4mS90wftFaeKs
   WY9mAZy9uZFm6Ajyt4w3gYM7ITjS7zCIaBSJuSH8pLfLqzyHLq/iJGdQb
   PNmTbJ0Fa0dmIH6ppDqz9kuxhbuCTuNLiPlVOoOCUi86ACtn3DmvOlNUi
   Y92SwiL+1igxOB/qtZDkKRtoJBLkHm688nGCflyfGRHna1RaVJEpRgl1x
   JXduSF0R1wDYBCBjb8ODX/0r+7msSzVDZtsoOoXcjvaZw+HXrckx2HX9f
   A==;
X-CSE-ConnectionGUID: 4v1s59K1RvGDKiOnDbVG4A==
X-CSE-MsgGUID: zHy0a/zbT0+8poFa+mF25g==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="222647300"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="222647300"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:41 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A727A1002B82
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:41 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 632B88D29C6
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 104721807148;
	Thu, 26 Mar 2026 11:57:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/63] python3-importlib-metadata: upgrade 8.7.1 -> 9.0.0
Date: Thu, 26 Mar 2026 19:56:08 +0800
Message-ID: <20260326115634.1199-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125693

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-metadata_8.7.1.bb => python3-importlib-metadata_9.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_8.7.1.bb => python3-importlib-metadata_9.0.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.1.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.1.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.0.bb
index 4c00739aa3..61f531a9c1 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.0.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Read metadata from Python packages"
 HOMEPAGE = "https://pypi.org/project/importlib-metadata/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cf73015ea0156450506e8000d1f7fa37"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=affe5a7d8b988c3db245c01075b29e17"
 
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "49fef1ae6440c182052f407c8d34a68f72efc36db9ca90dc0113398f2fdde8bb"
+SRC_URI[sha256sum] = "a4f57ab599e6a2e3016d7595cfd72eb4661a5106e787a95bcc90c7105b831efc"
 
 S = "${UNPACKDIR}/importlib_metadata-${PV}"
 
-- 
2.43.0


