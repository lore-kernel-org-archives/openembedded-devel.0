Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADF8C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:40 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44794.1784715876381789483
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gc8cL4UZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715876; x=1816251876;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y1GeEyJVnv0kYTrcZNOZGJji0m21Lo94YnjrlfkfTl8=;
  b=gc8cL4UZB6hQBOBVbbe9KDiqTDAikYeRdHnqNt5VdytBGrdGFaTgmk2k
   N7b/WB8j2x9jnF8kwDobM7f/r6wdC5Lm5VFgfTFihYmPDmhVa93KLDmn6
   0gVs8NiKWlakalnHgQ9Si+75w+o2uuAE1kF8jN/vnUSDPx2918oXDywOT
   MDeMYOP8j+cXRZnvW7akvgvJ/z+tT+EvjOJE1Qm8HjNZAx8itpPYOwEo1
   HycdX3Np0uI7Ts/oT3qcbMp7twKCBHw4GMQwUVEeofXpqTYdcyaqrwn0+
   jPwDC6Xa644ASBnf9NmQ5JHZPwd0C417khQLhYwWUD9P2GFQuhokgtAH4
   A==;
X-CSE-ConnectionGUID: 0mk//M/VREaWXfYiKvBmuw==
X-CSE-MsgGUID: c1qEinLPQcGdLtEaL1X4gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="247687300"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="247687300"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:34 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C836DC00350
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:34 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7EEB8181AE9E
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 976404064B2;
	Wed, 22 Jul 2026 10:24:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/37] python3-pybcj: upgrade 1.0.7 -> 1.0.8
Date: Wed, 22 Jul 2026 18:23:08 +0800
Message-ID: <20260722102320.1019-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128395

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- BCJ decoder supports larger size (>2GB) (#26)
- Update license specification (#25)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pybcj_1.0.7.bb => python3-pybcj_1.0.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pybcj_1.0.7.bb => python3-pybcj_1.0.8.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pybcj_1.0.7.bb b/meta-python/recipes-devtools/python/python3-pybcj_1.0.8.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pybcj_1.0.7.bb
rename to meta-python/recipes-devtools/python/python3-pybcj_1.0.8.bb
index e291375456..3d7fcda73a 100644
--- a/meta-python/recipes-devtools/python/python3-pybcj_1.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pybcj_1.0.8.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
 # The PyPI package omits files for testing
 # so use the GitHub source instead.
-SRCREV = "0735ad15fa001748dc3a13f36be2fe7a4971cf79"
+SRCREV = "33f1194ac7950ed7002b7361df8b03dc16bc1168"
 SRC_URI = " \
-    git://github.com/miurahr/pybcj;branch=main;protocol=https \
+    git://github.com/miurahr/pybcj;branch=main;protocol=https;tag=v${PV} \
     file://run-ptest \
 "
 
-- 
2.43.0


