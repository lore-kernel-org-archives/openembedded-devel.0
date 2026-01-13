Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F34D0C828
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:51 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55841.1768299881382286434
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lQk4TwUC;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299881; x=1799835881;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L7ET+QlzfWy1OrPTgdmhQh4/ObGCFzIQ7nqcQ0SUd58=;
  b=lQk4TwUClfMvO+vlN+1VBs3t6pqpmkF+nG+847q/yQUWk1AXb7DJePzl
   RzMkU8NhGc74SY++MmgPWWKEjtyrSJU/WIpa+u/y1O1rO7rJ/s0WCZ0nm
   CgEMos9GWAdmzNlX2fyNyqiZWnSCl9/RuppM+CCabPXqAXiBCtoeerMwc
   6ROcwqQmV3rLjVU2NX18Sf6fRrvee3jklEvfev6nikZnmTyqxlXS2wFCj
   KG24LpweXb3jwcpotDnTTVt6Ger6ZAFd5PT3NVR9aH6eOGADALlavj7Bp
   MV7gXwgL9yBToe2+uc8IFJOOstEY4xc9XANk0AxztdUjhc0N+mc7lIUYk
   Q==;
X-CSE-ConnectionGUID: VI4gtNnwRiaX7stVaTlktQ==
X-CSE-MsgGUID: uMtSNc++SJeV0DfWNgb4tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="213060157"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="213060157"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:39 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id B301DC00356
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:39 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6A34B8D65C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 9C4021019046;
	Tue, 13 Jan 2026 10:24:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/22] python3-pyasyncore: upgrade 1.0.4 -> 1.0.5
Date: Tue, 13 Jan 2026 18:23:27 +0800
Message-ID: <20260113102334.605-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123421

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Make sure tests/__init__.py is included in sdist
- Fix compatibility with pytest
- Explicitly tag Python 3.14 compatibility

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pyasyncore_1.0.4.bb => python3-pyasyncore_1.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyasyncore_1.0.4.bb => python3-pyasyncore_1.0.5.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyasyncore_1.0.4.bb b/meta-python/recipes-devtools/python/python3-pyasyncore_1.0.5.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyasyncore_1.0.4.bb
rename to meta-python/recipes-devtools/python/python3-pyasyncore_1.0.5.bb
index ecd24c95cf..a1331e1e91 100644
--- a/meta-python/recipes-devtools/python/python3-pyasyncore_1.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasyncore_1.0.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d5605fc335ce1bab614032468d0a1e00"
 inherit pypi setuptools3 ptest
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "2c7a8b9b750ba6260f1e5a061456d61320a80579c6a43d42183417da89c7d5d6"
+SRC_URI[sha256sum] = "dd483d5103a6d59b66b86e0ca2334ad43dca732ff23a0ac5d63c88c52510542e"
 
 RDEPENDS:${PN} += "python3-core python3-io"
 RDEPENDS:${PN}-ptest += "python3-tests"
-- 
2.43.0


