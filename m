Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CC5CDE007
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:18 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7016.1782378135848822688
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PeHOUatF;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378136; x=1813914136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/eO5hhn0BtvODe2bPR2BSv7z7X0s+SWjtcV6q11LrlI=;
  b=PeHOUatFVpyz6vvXmRB+haFwLMqTbeTi/AvIICxez/xyo/YE9nfOMgxa
   Zwb+dEvo7X68YCu6ELUQJ8YTS1BLtk9PyYGJ2tBefCtY+ktAfnbJ8YOgr
   OgYIom1RxaKDYAPWgT5zvCrZc+HmsEmvbENwfkHoqCJ1lASqw1RrRIT40
   3o66PHKpsub7liFipOj64exSf/S82b7aSfWekWmLXRoL50scqFgHmu/fI
   vwA/3MevBzZmAg8UWxNJd07eLoIIY/46Ir8gQtXyhdiYybEyrhtIUnF7h
   G/y1DLbjcF6ixYkPrTTvIix01Z6ZT7UhcLQCpWpZvY2ZMXnxOydXVsU8F
   w==;
X-CSE-ConnectionGUID: TwQPLz9LTKaCVViL8jSxqw==
X-CSE-MsgGUID: nzNfwM5nQ8aunEG54jp2xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="244743158"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="244743158"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:14 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 42B201C1C704
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:14 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id E3B6B14042DC
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E6E9C1017325;
	Thu, 25 Jun 2026 09:02:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/47] python3-msgpack: upgrade 1.2.0 -> 1.2.1
Date: Thu, 25 Jun 2026 17:01:07 +0800
Message-ID: <20260625090127.1563-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127759

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix a segfault when calling Unpacker.unpack() or Unpacker.skip() after an unpacking failure.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-msgpack_1.2.0.bb => python3-msgpack_1.2.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_1.2.0.bb => python3-msgpack_1.2.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.2.0.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.2.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-msgpack_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.2.1.bb
index 079730d18f..283068a71a 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.2.1.bb
@@ -6,7 +6,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PTEST_PYTEST_DIR = "test"
 
-SRC_URI[sha256sum] = "8e17af38197bf58e7e819041678f6178f4491493f5b8c8580414f40f7c2c3c41"
+SRC_URI[sha256sum] = "04c721c2c7448767e9e3f2520a475663d8ee0f09c31890f6d2bd70fd636a9647"
 
 RDEPENDS:${PN}:append:class-target = " \
     python3-io \
-- 
2.43.0


