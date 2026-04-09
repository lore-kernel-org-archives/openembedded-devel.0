Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CF7EA3C35
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:00 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128831.1775730832615685151
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J8b8ehbP;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730833; x=1807266833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/oojQCRJ96HemQ1JDlkRmKEm5+xP62lCZGp04sTMLYw=;
  b=J8b8ehbPox0ywjt7BGWULp0ALuuHFpwqoPgyn8g3Dd4ZgJsd0MbsDUEb
   z0e85Ceq+LxbMxXU63urEvIrstFHnK98Hp0XeldaJb71oPVeiDFRw9RPF
   /PVzLcKYWg4mTmNKOJGFN4QcovIFzFm5g7r4PqsbBD+XjKodyxwq1esao
   Y43lPUqR8RKcxP3fJUiKdOVA/VHx8Brrenxqt30/UmV0Qvu3DsdyFJnAR
   4l6JAYoKfsPUyZNcBrSURSYvu5IoKU3DRoQYrplaxJ0ZCzeYttI8Rasjm
   yeDkAhhgtE9VyoiwdyP39ijCJRpsxRLcSx+LRfHCeACe5uSgrfSKDxfdK
   g==;
X-CSE-ConnectionGUID: Er3nzYegRqWe3LcQr4StPQ==
X-CSE-MsgGUID: wUJMWhpmT+SpMs5qLOJvRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="240796136"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="240796136"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:33:51 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3E5FB1C0054F
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:51 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D9A43180414F
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 4F515404950;
	Thu,  9 Apr 2026 10:33:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/37] python3-bitarray: upgrade 3.8.0 -> 3.8.1
Date: Thu,  9 Apr 2026 18:32:02 +0800
Message-ID: <20260409103223.1574-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126165

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* fixed critial findings in C Extension Analysis Report
* add tests, in particular 'devel/test_capi.py'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.8.0.bb => python3-bitarray_3.8.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.8.0.bb => python3-bitarray_3.8.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.8.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.8.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.8.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.8.1.bb
index 4cacd79522..6ef0f4202a 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.8.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "3eae38daffd77c9621ae80c16932eea3fb3a4af141fb7cc724d4ad93eff9210d"
+SRC_URI[sha256sum] = "f90bb3c680804ec9630bcf8c0965e54b4de84d33b17d7da57c87c30f0c64c6f5"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


