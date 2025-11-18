Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEE7CED249
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:39 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8435.1763456972671246225
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JEGLxnCd;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456973; x=1794992973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kvNfRCJla5GGriKgCTcEtv4DZsSuGqawbkHCrlVypNE=;
  b=JEGLxnCdlt8Go3sdZk98MgT2RKrMQfb+iz4TK2wE4n2TSmhoIugGoIyh
   9jn+sN/ffTUEQn4VGw2VbWXsozlltSRPHkJLSvCikJ+IKaQwM3a0dP79q
   L89C+lyW/wwGQ4f9xob7lmbk0s5l6zFfncA3Yi0WBv5oZkKDuM1q3jlta
   YXaUnLHKmGW9TqJZHKSpyB09JrZ9qxWxZ4Y6a0KmE51E5vVCw0PWpqGSF
   YzJNz+Qv6IgGcdebedXDrr5GfJ0wli6mucSR+yqSeskROareNs/m1B+Qo
   8+2YeAeBMSP9ooTw8q4AC65KO1aQqMhESct0jzdXcsruySTjbjPxlViL2
   g==;
X-CSE-ConnectionGUID: iDz6HwpAT5GjRYyAvEGaVw==
X-CSE-MsgGUID: xLFApBUjSgWtyY3qaE8mhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="223411699"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="223411699"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:32 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 12CA71C0008F
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:33 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id B775E180050A
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2B32B14002EB;
	Tue, 18 Nov 2025 09:09:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/29] python3-pymongo: upgrade 4.15.3 -> 4.15.4
Date: Tue, 18 Nov 2025 17:08:41 +0800
Message-ID: <20251118090846.1484-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121835

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.15.3.bb => python3-pymongo_4.15.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.15.3.bb => python3-pymongo_4.15.4.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.15.3.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.15.4.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.15.3.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.15.4.bb
index 70cf9c21fd..b066d730f7 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.15.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.15.4.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "7a981271347623b5319932796690c2d301668ac3a1965974ac9f5c3b8a22cea5"
+SRC_URI[sha256sum] = "6ba7cdf46f03f406f77969a8081cfb659af16c0eee26b79a0a14e25f6c00827b"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


