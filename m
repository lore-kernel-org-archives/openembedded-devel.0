Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE929C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:39 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9732.1788344976384287221
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L6fjTGvP;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344976; x=1819880976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t7j+JPm95wHujFFlo3fiRQMRh73C3Zw4L0TTQJPwNSI=;
  b=L6fjTGvPKJP3r7ttKU3BXcexT/ceX0lJmBcybNxZIwH2iDAEOamWZ+Hx
   2iEJ4khiLU0hnQnUkfYi7HOan1YlTralNjFWxM1L+fYEQiFDfywY9Xuyv
   lqv2Bw7EzPXcmQjFNz+4xod1ORdBRNXZcjdRKL8hXwshB1wvfHFq/96r4
   KYqkUXpe4d+rJh2nywMeZeLGglQ/TVwq66PAoHNOH9dAA7ovFdLg+loh7
   eZICld4XHP5xQcxuLAsDfToCsMwFXaMf64ixcqwduVHLX1uA/eZSAuj+m
   ORsd3UhTWBbvgdpQGRWraojO6L1iBvp20keTH9P4ys69gmc+TwcLeTU+3
   g==;
X-CSE-ConnectionGUID: jqC7WYQ6QQa5XzTFFjbktA==
X-CSE-MsgGUID: QMtBWuBPQgGeL05Mdj0O/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="241545552"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="241545552"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:34 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id AB5641002B8B
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:34 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 627C78D65C6
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 63859200076B;
	Wed,  2 Sep 2026 10:29:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/34] python3-google-auth: upgrade 2.56.3 -> 2.57.0
Date: Wed,  2 Sep 2026 18:28:41 +0800
Message-ID: <20260902102900.1296-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129674

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.56.3.bb => python3-google-auth_2.57.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.56.3.bb => python3-google-auth_2.57.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.56.3.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.57.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.56.3.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.57.0.bb
index c096c6ab36..1227566c07 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.56.3.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.57.0.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
         file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
-SRC_URI[sha256sum] = "40e229fc901f0a305b553050e5fce562d509bee0435be053abfa91582b51b90c"
+SRC_URI[sha256sum] = "9b4f96d6a1feb5f7201231f47cfb3de08d8f176f8a61f9e461555116e95a8789"
 
 PYPI_PACKAGE = "google_auth"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


