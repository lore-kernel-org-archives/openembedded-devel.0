Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3936105A578
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:59:58 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18630.1773313189353741441
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OgHrIRah;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773313190; x=1804849190;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7ljqT1KMDfoF5cp1VxxIaGV+nEYHu/9+kiT1PdnG5nM=;
  b=OgHrIRahnyhCh95ixSc2fV/JFOCbrrx/jweEFQlfOtAuY7YSJ/a6v9hE
   Zhq4Ed2acr45VDsDew2KM/dauRjrauGEQxeDFJ00D1d+YNw7qp7r/7Z/X
   xw1zLF1oSL9UH9cyVvR1/SRPgHan0l4wCOTLqBOYDV1NnbA9vryOv3k2V
   V8EpECURTNvFlLSTFvujYROZMikHkMzm6ZOjueDE8PMl2wUbUyyBkYilV
   jG4cGdbAKVnxJ+jHVOFaan+ybihsXpBQp2WIrzUiYQYfgHLneDpGaZIMZ
   tJSaI4cq4O2XkEMW4mG51tCPHL8PXlA/AxnL2L9CLqV/Pjn9dGsyr6GTG
   Q==;
X-CSE-ConnectionGUID: 0tYUCc37SN63Pc0Um5qoUA==
X-CSE-MsgGUID: 83JO+iTcRWKKopDAFxz41A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="220950876"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="220950876"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:59:49 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 461C9C02F6B
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:59:51 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E879AC0081B
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:59:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 098398288D9;
	Thu, 12 Mar 2026 10:59:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 53/64] python3-snagboot: upgrade 2.5 -> 2.6
Date: Thu, 12 Mar 2026 18:59:29 +0800
Message-ID: <20260312105940.1900-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105940.1900-1-wangmy@fujitsu.com>
References: <20260312105940.1900-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125153

From: Wang Mingyu <wangmy@fujitsu.com>

treewide:
Migrate documentation to readthedocs
Emit more specific error messages for USB permission-based access issues
Add unit tests

snagflash:
Support compressed input files, e.g. *.wic.bz2
Refactor fastboot-uboot logic to factor out common code and improve logging
Automatically detect when oem_run isn't supported by U-Boot, and fallback to ucmd

snagrecover:
Support Renesas RZ/N1 platforms
Support SoC model aliases, and add i.MX8MP alias
Handle relative path prefixes with the -F syntax

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-snagboot_2.5.bb => python3-snagboot_2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-snagboot_2.5.bb => python3-snagboot_2.6.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-snagboot_2.5.bb b/meta-python/recipes-devtools/python/python3-snagboot_2.6.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-snagboot_2.5.bb
rename to meta-python/recipes-devtools/python/python3-snagboot_2.6.bb
index fe496ffc2f..b923015e44 100644
--- a/meta-python/recipes-devtools/python/python3-snagboot_2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-snagboot_2.6.bb
@@ -3,7 +3,7 @@ SUMMARY = "Snagboot intends to be an open-source replacement vendor-specific too
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI[sha256sum] = "64d114f743cf4d892a63bc35d6af45958e569030881154f9f2ffeac13cf9b664"
+SRC_URI[sha256sum] = "8451ff4cb96f8a4dc7aca06cee8a54db900e93b4e0e946205e0856b7a4cf4632"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


