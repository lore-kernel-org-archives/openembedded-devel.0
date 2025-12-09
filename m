Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9633D3B7F4
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:57:00 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4206.1765274212461102818
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZvVvnBFg;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274211; x=1796810211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o3bIGmMK6eDzEZddK/+K4LyYMN0scJX5QkXsWtoXIoE=;
  b=ZvVvnBFgMryZhEH+bbjYWli+owkn+trlt7Nr4kG/1jCLeIkhBlEEdaLV
   aOsvWRFDbohLgrxbCDXunQ5nNUvoagNaP0iNPUGYC6YToxh1srqBdwRbq
   OMO163DXjJP1Mwz7+3i4XCYl582Yspi8UftqamW/Qw1kqq4xHBKobsVPo
   liizZFzzHtNPVqnpVIXnf68x2ky9VMSNZkDIUIFoytH1RPD+28MaWF36p
   GVoyw7w49R9Iz0c9X+NL2nODsqu89uj4R8tJx+JnqLRznDgo9Ozi9+k19
   Qvw2vQFBFL0CH04eHIBoYcrqE63BZbDnrvSwxBtxVVNy7thDLre3OqLgE
   w==;
X-CSE-ConnectionGUID: eL3Z3LpHR8W0NYWndaxpxw==
X-CSE-MsgGUID: BqsvKll9QfGNpGWd4bVZJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="210560071"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="210560071"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:50 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 0CB0F1000363
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:51 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B8DE8C00D72
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 5769720002B7;
	Tue,  9 Dec 2025 09:56:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/38] python3-platformdirs: upgrade 4.5.0 -> 4.5.1
Date: Tue,  9 Dec 2025 17:55:38 +0800
Message-ID: <20251209095552.690-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122428

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix no-ctypes fallback on windows

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-platformdirs_4.5.0.bb => python3-platformdirs_4.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.5.0.bb => python3-platformdirs_4.5.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.5.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.5.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.5.0.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.5.1.bb
index 7c1996fbae..666ba6805e 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/platformdirs/platformdirs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a"
 
-SRC_URI[sha256sum] = "70ddccdd7c99fc5942e9fc25636a8b34d04c24b335100223152c2803e4063312"
+SRC_URI[sha256sum] = "61d5cdcc6065745cdd94f0f878977f8de9437be93de97c1c12f853c9c0cdcbda"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


