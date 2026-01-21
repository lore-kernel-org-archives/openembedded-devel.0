Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093C5C4450A
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:30:01 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9495.1768994995626483259
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:29:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AfGe2OhX;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768994995; x=1800530995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=arSQL6TQbegS7oF/txOoBtPm/p5ShWXabtxggCnGbNM=;
  b=AfGe2OhX1AJuG6qN7vsyNRCeKvYfwdc9i8MKRvMnXh6Kx96Aurb+Ujgo
   SYJ0iFs3XhWzXwsxP0p6P9n4GNVbaxzkfMK56Iszah9Y75wx9EXtXVyC2
   Ci2BFKv7CHja0rf/RvyU7JbSSL+DpruZhxjTaEMC0nkgYT2Mr6wBx2o9L
   ZjkvKMpAQQ3wN3c5j7t/UTfgnfq0RUFEWYDqbe6eytdWDShaE6aVmOQ1l
   mbG8IoOUQG7kbJu1vhyQPWEBNtL/Xu3cRHVJOJe3DyMV16ZqwVG5L0Xab
   5L04JmeRKNku/z5Xyp2YcxSSxvWGdjtQb2MCv9bfIn8aOebBPYWw6wxu3
   Q==;
X-CSE-ConnectionGUID: CUO8OiUfS8aJjbYG/pWpoA==
X-CSE-MsgGUID: badCojbeSom7ldCpVIo17A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="214509303"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="214509303"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:29:53 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id DB0F78204F7
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:53 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 976798D206A
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 21A111401D61;
	Wed, 21 Jan 2026 11:29:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/30] python3-moteus: upgrade 0.3.97 -> 0.3.98
Date: Wed, 21 Jan 2026 19:29:01 +0800
Message-ID: <20260121112921.857-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123701

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.97.bb => python3-moteus_0.3.98.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.97.bb => python3-moteus_0.3.98.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.97.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.98.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.97.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.98.bb
index 313619a5b2..412ee536f5 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.97.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.98.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "59f6f185390822c41f993c56027e4be338be87d40435acb0e10df1d68d662e69"
+SRC_URI[sha256sum] = "ef6c628bf64d56e30aac1f8e314f74b1bbd9875e5ec21ecd3c2ce9436f7e3644"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 
-- 
2.43.0


