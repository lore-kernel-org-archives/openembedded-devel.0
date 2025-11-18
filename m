Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1417CED247
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:28 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8408.1763456960899528077
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nsfE2Drt;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456960; x=1794992960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vzLgZYCuFF4EgXsMeXTxnOHVn0sXQufLPyoBNh2tC70=;
  b=nsfE2DrtXLovd+uD8bMmaTI+OMdfOloht0Fl7AYkjrpMo6YajM/xzZTp
   PPvAAhrfwTcUavM4HlOIoXNRpADz5Hrauy9Yp8OXiqJL6TakPEsFAUwWq
   bWqal3Q+B2tX7WovUiB1o6PBCsmP3qofF0gJsct7NjsedS1UNcnJ/5J0S
   8ViDETA/tIm5/2FWZN8Lpezm0o4IVUKev1Upr+ItFBsgqX1hH5f9YqKQx
   KLkImb/OAtYn6n6I9LBg5tARAcde9M5uEIXzbW1HcCzNCfgbrKPPgmt3t
   95U5EOPIclzCfyu5yMDyPGIS0ZlVhLLZy8TzUEk3zRBxt8pN1oPoWJr76
   Q==;
X-CSE-ConnectionGUID: D5jq1+EBR5i20r2kfjb0Zg==
X-CSE-MsgGUID: l74vKbUMTauPGdxAgkuQwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="223411674"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="223411674"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:19 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 74DDE1000348
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:19 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1D06C1C00161
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9CB6F14001F2;
	Tue, 18 Nov 2025 09:09:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/29] python3-black: upgrade 25.9.0 -> 25.11.0
Date: Tue, 18 Nov 2025 17:08:33 +0800
Message-ID: <20251118090846.1484-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121827

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-black_25.9.0.bb => python3-black_25.11.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-black_25.9.0.bb => python3-black_25.11.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-black_25.9.0.bb b/meta-python/recipes-devtools/python/python3-black_25.11.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-black_25.9.0.bb
rename to meta-python/recipes-devtools/python/python3-black_25.11.0.bb
index 3925a9ff0b..ce8130d54a 100644
--- a/meta-python/recipes-devtools/python/python3-black_25.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-black_25.11.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d3465a2a183908c9cb95bf490bd1e7ab \
                     file://src/blib2to3/LICENSE;md5=bbbad7490e921f9a73c0e891305cb4b3"
 
 DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
-SRC_URI[sha256sum] = "0474bca9a0dd1b51791fcc507a4e02078a1c63f6d4e4ae5544b9848c7adfb619"
+SRC_URI[sha256sum] = "9a323ac32f5dc75ce7470501b887250be5005a01602e931a15e45593f70f6e08"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


