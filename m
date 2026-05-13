Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1149DCD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:07:20 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77.1778645228742110377
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ChqaHK7F;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645228; x=1810181228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kawYIUDKaZI/9ABKMCLobuZvEFSqp8ZXxoHuWvgpnpk=;
  b=ChqaHK7FUz6HA5wNQzE6iZIzHOvKvLCbIn3MB93mRzmBLNH/7EBIxfCc
   z/Mf+xSGS5Ww0CjnesaeX4UFUx8dQqNPQokv8LhIwxPbm/U3Iilj8WY0D
   Xi3m7mFXeLdqjCUMhn1yvz9oeIgk7oGPo61CEKv6aU6WfT+dOekAQaV4L
   4c9h9l99yh7loFAt0yYHAV38te5NUggcrjUUH/UcktWxUyZGy0cubNbRz
   5ge2nu6JP9csUi6+XXi90hhGJTXN8q4GDVMs0N7wu6KexCfm9Hb0IAlJ6
   KdiT2T/WZFc0SUmPH91jsyxF7YKAI/NabzpRVUhpuy1DvF3FM/H/D8gYj
   A==;
X-CSE-ConnectionGUID: CnEyFp+bTjCU5O9ujEABTw==
X-CSE-MsgGUID: 8xNYyTNGQi2fXLkVwuxlaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240205798"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240205798"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:07:07 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 1FF2B82072C
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:06:07 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CA42118000DF
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:06:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 64061140008B;
	Wed, 13 May 2026 04:06:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/56] doxygen: upgrade 1.16.1 -> 1.17.0
Date: Wed, 13 May 2026 12:05:02 +0800
Message-ID: <20260513040555.377-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126889

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../doxygen/{doxygen_1.16.1.bb => doxygen_1.17.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.16.1.bb => doxygen_1.17.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.16.1.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.17.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.16.1.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.17.0.bb
index 3d0cfaed80..70537fab15 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.16.1.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.17.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
     git://github.com/doxygen/doxygen.git;branch=master;protocol=https \
 "
 
-SRCREV = "669aeeefca743c148e2d935b3d3c69535c7491e6"
+SRCREV = "65a43c0aba45cc23b3ca11b6b5334d4eea931726"
 
 
 UPSTREAM_CHECK_GITTAGREGEX = "Release_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


