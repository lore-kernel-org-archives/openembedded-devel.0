Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BDFD2D8D2
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:38 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6890.1769507075925523953
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:44:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EJS9TCqs;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507074; x=1801043074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jzplppk7ZP/P9A8JQJNiHdZ/chRs+xYN+hd/uI9BZ90=;
  b=EJS9TCqswvLMW1IElQFZKaqOSszXSVTtW4pef7e5djISZzqTPBWL9g9g
   3Xw7eJzbLB09CpThXLliI25Ig0K4vAxEmap3bqOE6Du/nsvo2BJswz+dQ
   OEcbn0DLA2mivUauDBI7r0TGDO715bMyWmBGDmghBlOIh7J/h7bgEBMZu
   69qmgGo7SSxOsdXT18pkTSRFThd5290QqDgRq5aGS6tFbE2lhle74kTKi
   cDxPnXT0+8990dg/eM0cYkeZG/Tp1AdaEF3TejPSJPLbhyBfh8KEz+Jr5
   NX2NA0Q2W0oWl+21As8fWEHd7G5CpJaauQYH8wEoJk6b6bEMMkjmN4dt9
   A==;
X-CSE-ConnectionGUID: V8Ym1nJxS/6MviFk/C8s0w==
X-CSE-MsgGUID: tIhm5MwDQB2g1yxwq9zSXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="226667868"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="226667868"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:32 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 6F62EC00376
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:34 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 268558D2068
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 88A20200021F;
	Tue, 27 Jan 2026 09:44:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/25] python3-python-multipart: upgrade 0.0.21 -> 0.0.22
Date: Tue, 27 Jan 2026 17:43:37 +0800
Message-ID: <20260127094339.1081-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123926

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n-multipart_0.0.21.bb => python3-python-multipart_0.0.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-multipart_0.0.21.bb => python3-python-multipart_0.0.22.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.21.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.22.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-python-multipart_0.0.21.bb
rename to meta-python/recipes-devtools/python/python3-python-multipart_0.0.22.bb
index 6fc2b69f7e..b54fe5d309 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.21.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.22.bb
@@ -2,7 +2,7 @@ SUMMARY = "A streaming multipart parser for Python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3d98f0d58b28321924a89ab60c82410e"
 
-SRC_URI[sha256sum] = "7137ebd4d3bbf70ea1622998f902b97a29434a9e8dc40eb203bbcf7c2a2cba92"
+SRC_URI[sha256sum] = "7340bef99a7e0032613f56dc36027b959fd3b30a787ed62d310e951f7c3a3a58"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


