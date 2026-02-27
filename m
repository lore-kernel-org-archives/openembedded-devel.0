Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23565FC593A
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:00 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92728.1772187237793369370
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CXYnoQrG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187236; x=1803723236;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CLYRHFifqixMYGkLTXaTu6JUeWxtpAEoVh63TIs+rn0=;
  b=CXYnoQrGXEdtghOMEdslDgG8DeWOReMWbx6+FI1XBiw52Ux6U9166LfL
   k2wNIw3pBUQLcK/ruj0VtZ4Vqrq4D+g70JirFUm1xz2uCZW2GBY1gYFD7
   RuQ8+osKQPCA1Lm/2RmTVyUpZY8BfBjtyNvLowMAgyYuPPFHdAok9VUHJ
   Spt/kvUFXLJC5EvHO/S3BXqB1+PDoPp8MNGc3Vn7J5UYRoyMiCiJqSwTM
   8Jq+IuKEcNkmh200q7JbzwHlklbCkawruwJPmcP2diRSXE0AFDLuvPim8
   8dfxlFUfqRMtrEQR6lSOd2mWzwKkcoM4FGR5bNTszLFIgIAdOX5UcaQY9
   g==;
X-CSE-ConnectionGUID: 0vTWTAqkQWum8BYcSbkM6A==
X-CSE-MsgGUID: 3upy9GzoQ+Cjjz2+CwHqsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231299915"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231299915"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 436971C0009A
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:56 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id EF5D91005940
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1358218005D0;
	Fri, 27 Feb 2026 10:13:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/52] python3-flask-marshmallow: upgrade 1.3.0 -> 1.4.0
Date: Fri, 27 Feb 2026 18:12:44 +0800
Message-ID: <20260227101327.1432-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124709

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add missing commas in error message for validate.FileType
- Support Python 3.10-3.14

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-marshmallow_1.3.0.bb => python3-flask-marshmallow_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-marshmallow_1.3.0.bb => python3-flask-marshmallow_1.4.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.3.0.bb b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.4.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-marshmallow_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-marshmallow_1.4.0.bb
index f0cc8ef64f..189ed5335b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.4.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_flit_core
 PYPI_PACKAGE = "flask_marshmallow"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "27a35d0ce5dcba161cc5f2f4764afbc2536c93fa439a793250b827835e3f3be6"
+SRC_URI[sha256sum] = "98c90a253052c72d2ddddc925539ac33bbd780c6fba86478ffe18e3b89d8b471"
 
 RDEPENDS:${PN} += "\
     python3-flask \
-- 
2.43.0


