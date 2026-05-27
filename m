Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9DECD6E47
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:23 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16954.1779875357575017003
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ont/WyN1;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875358; x=1811411358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lw8F6duygtjRFHB6YMRKzwzK3STFLrw8tnbFE2M1kjc=;
  b=ont/WyN1rdnh/hN9IZAaG3Yqrntr0etyb3mUBXpx44KHcV8KA8Y7Kyqr
   mtFSgoiS+jgnhFgvJKhT4Q7TdaHQmztOKCKTuWYzrZWjC4iClt63dIHtq
   iQpXmj6yOShmGND2LqHLkhlSW1758UHJqIuJse3sBnIXVa7+l3JuLUj97
   s0aPfClcgL6y6VCpZik7HHv9Y/ISV8oLKnZLwjPvX7WeO1LVeVnbpR5lq
   KF9Leb3PR+lfyVxRdeEKlYtLgqknGxm/pPUD/Js5HrOYrJX1E99jn6ZZV
   /RNyUVku5XtHHJ5KD0kgxT0RAMd56lRzGA8d3V7gH0Xo2OwD8ZOgRFy/u
   g==;
X-CSE-ConnectionGUID: a7dWPu+1TJqKXsEuyKrP3A==
X-CSE-MsgGUID: tSLvHzeqROyR8Co7wX4feQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="230008227"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="230008227"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:17 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 96A54C00541
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:17 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 5082CC2BA99
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 57C4C82A2CE;
	Wed, 27 May 2026 09:49:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/56] python3-pytest-codspeed: upgrade 5.0.2 -> 5.0.3
Date: Wed, 27 May 2026 17:47:45 +0800
Message-ID: <20260527094805.2039-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127243

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  chore: move callgrind skip obj API to instrument-hooks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ytest-codspeed_5.0.2.bb => python3-pytest-codspeed_5.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-codspeed_5.0.2.bb => python3-pytest-codspeed_5.0.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.2.bb b/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.3.bb
index 4397f0e851..c782414b03 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2856cbe664e8843cd4fd4c1d1d85c2c3"
 
 DEPENDS = "python3-cffi-native"
-SRC_URI[sha256sum] = "93fea30b2d7266343dd505a182bdf1eb47f96f5fa2929f1d9aff01d3b60e1589"
+SRC_URI[sha256sum] = "91afef90e6a96b013495e4702ef5d6358614a449e71008cdc194ef668778b92f"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


