Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21054CA0FE0
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.4682.1755766817231402530
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XCL41cWM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766818; x=1787302818;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kTWHjB8OUKCUBpYAHPDsijNkZKkx4nH2vyLYxvcjoRc=;
  b=XCL41cWMSotX4cZ4ZmuOiwGoBL/tftu/jIRuXAamee6hObf3PUETvDx+
   g3+fqU5eG48zEdHT6LhGw+nMgeCCdCYPT685nBkGzOc++8wsJcgfrqWYF
   Ugb6V5WC6fHuxlZiIXiZ8UZC48yg6rj6f29ca5vGxVuf9AjlV2mOD9AlB
   0aFJSDKns7Tzq9rqO04odDNgy3NTwL5d7woGX7h8RN6F0nm0nvfC5RhQY
   sMZbHkOrKpOduIUQ3mRoJINlt56czlr0563M2bhwFdq/E+ej2B3gVkaw2
   azi2qqhfPY0m/adCaCnV1MBxmYm7JNc2kOEOKQqb/rA+7yJix6v14MAGb
   w==;
X-CSE-ConnectionGUID: 3u0W7VjITrax0MZuTZ5w8A==
X-CSE-MsgGUID: V6Ca2ynmTa69SLbIvou+IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="198116079"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="198116079"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:17 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 04B901002B96
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:18 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id A8EB1C0736F
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:17 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id 58B0C10001B1
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 651411A0090;
	Thu, 21 Aug 2025 17:00:10 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/21] python3-tornado: upgrade 6.5.1 -> 6.5.2
Date: Thu, 21 Aug 2025 16:59:51 +0800
Message-ID: <20250821085954.2056-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119068

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fixed a bug that resulted in WebSocket pings not being sent at the configured interval.
- Improved logging for invalid Host headers. This was previously logged as an
  uncaught exception with a stack trace, now it is simply a 400 response
  (logged as a warning in the access log).
- Restored the host argument to HTTPServerRequest. This argument is deprecated
  and will be removed in the future, but its removal with no warning in 6.5.0 was a mistake.
- Removed a debugging print statement that was left in the code.
- Improved type hints for gen.multi.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tornado_6.5.1.bb => python3-tornado_6.5.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.1.bb => python3-tornado_6.5.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.1.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.5.1.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.5.2.bb
index c10589b2b9..f915dd5658 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "84ceece391e8eb9b2b95578db65e920d2a61070260594819589609ba9bc6308c"
+SRC_URI[sha256sum] = "ab53c8f9a0fa351e2c0741284e06c7a45da86afb544133201c5cc8578eb076a0"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


