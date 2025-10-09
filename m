Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F66CCD187
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:54 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.5578.1759990128398327345
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AsOOKUqz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990129; x=1791526129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BuWxNTo9r8iEg9BK4hDaXE/0U6XlHIVy6umP6S7T0ek=;
  b=AsOOKUqz/kzTvUR7kPLwBWIR+4VNGCUo0xMJTPGbNi3dyK1hFEyXJHUZ
   zKCeHZX4QKZkO4e0v+B+3uJ9dztcUkjrcFynZ7dowp8M2e44YGsam6PER
   AfPvslxM9Sq60oDjhLG/OlSkbPwkouLKXNpzP0o8gDSXdDgeiBdQKLHR3
   vsAlwH2SkxYA0dcqyp2YzZ5o5k88AuHMFdpwQpfpLTGUSPDcUKhXUyH83
   Tvak9s4wmkCfhQZBr0tE1ddDpfhKyn8aMYfvn9dP8CdGS2foaFfM10Mnr
   KJ22dj+Q3rF6UYcDk5pZadxcPUUY9dZPNOETAAxj8YGR/RQQhC0OJ6JEk
   w==;
X-CSE-ConnectionGUID: TVoBRRceQx+Xm9jXeMIpQg==
X-CSE-MsgGUID: wqIgfz3GT2WC78Dl+AxJYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="219034501"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="219034501"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:47 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id F197D42A321
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:46 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id ADC7A1000451
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 4819A1001CFB;
	Thu,  9 Oct 2025 06:08:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/22] python3-pycurl: upgrade 7.45.6 -> 7.45.7
Date: Thu,  9 Oct 2025 14:08:04 +0800
Message-ID: <20251009060809.445-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120414

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycurl_7.45.6.bb => python3-pycurl_7.45.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycurl_7.45.6.bb => python3-pycurl_7.45.7.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.45.6.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.45.7.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pycurl_7.45.6.bb
rename to meta-python/recipes-devtools/python/python3-pycurl_7.45.7.bb
index 0bba73a660..72338bb0e1 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.45.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.45.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING-MIT;md5=be42e1b1e58c8d59c2901fd747bfc55d \
                     "
 
-SRC_URI[sha256sum] = "2b73e66b22719ea48ac08a93fc88e57ef36d46d03cb09d972063c9aa86bb74e6"
+SRC_URI[sha256sum] = "9d43013002eab2fd6d0dcc671cd1e9149e2fc1c56d5e796fad94d076d6cb69ef"
 
 DEPENDS = "curl"
 
-- 
2.43.0


