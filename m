Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EF3D2D8D6
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:45:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6909.1769507110763614997
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KzGot3S8;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507110; x=1801043110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4uFFDbgYWhZMQkXjYPdS+30O38T07viCh8rrQSSkosA=;
  b=KzGot3S88YbuUbv19bZ/z1zJ2/6V8yAqRfCdIKthflwqISiUFTDt49bV
   zRKDc8tS9YwJ4aStj1B85Kuu2KGSerPARpWB85G0kXLc4KAGFpd5Dmi54
   Po0lETi8TZGO1+sluiLUDN4RIf+3QZDPUTTJbh9Ygyl+16kkKZdP+pzkq
   XtaN3xo0YCCRSu5mbbqLNyMup9kL3/j4SKgn8G6Q8nyOzySPQ2zFFPMco
   dMNyL13KWhQgvVADpj+ZeiOW4on+cYjIPoleXnHNLNanbRUc9d6QLQps4
   CIgakPdCjTbQuyg1es+o4/s0uaM3ujXLcvQcyTEw3v0PH+9UlW7GUc5xr
   g==;
X-CSE-ConnectionGUID: wvYhSCYmSIioR5aA6PHahA==
X-CSE-MsgGUID: YNmo4YXVSROOfUHH8W1mRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="206088362"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="206088362"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:14 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id DAB468204C7
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:14 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 8F9AE8D2065
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id DEF792000212;
	Tue, 27 Jan 2026 09:44:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/25] python3-coverage: upgrade 7.13.1 -> 7.13.2
Date: Tue, 27 Jan 2026 17:43:27 +0800
Message-ID: <20260127094339.1081-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123931

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.13.1.bb => python3-coverage_7.13.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.13.1.bb => python3-coverage_7.13.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.13.1.bb b/meta-python/recipes-devtools/python/python3-coverage_7.13.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.13.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.13.2.bb
index d3e98c6987..23d49524cc 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.13.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "b7593fe7eb5feaa3fbb461ac79aac9f9fc0387a5ca8080b0c6fe2ca27b091afd"
+SRC_URI[sha256sum] = "044c6951ec37146b72a50cc81ef02217d27d4c3640efd2640311393cbbf143d3"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


