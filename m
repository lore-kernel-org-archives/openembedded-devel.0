Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3061112264
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:42 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7221.1775096136442485621
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Psdq6Mc8;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096137; x=1806632137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5K9mKIta7a2wAqWP3xwVrf5elNSSxuFjq0dkZoNb/8w=;
  b=Psdq6Mc8mDoAGFo083XFExESqL4dKJkxYFHCr0yuP3IA3IGyoiTJu3z5
   ADlRcoRNeunLjNMaMHOS25IqhYClhBdBRrd1Wc4bacL3w48OoZ+p1g9ac
   TWaQfsLdmCariNmvD5PpTkGoro7z3tSBgxjVaqBPRUDBAJ7Lh7CQFRM6C
   cisYXA2E1rqrHkVxZDbGn2egp2UhZAAUmj2T6V8mW+ILNwh6J+oKNZrQh
   t7/luR3bCwOpNZpd+oarFqy9u508FKEzwrVBTjzAcBr0W+dezJyb7zJ7m
   XtwiNyklfF7pOh46sOBy2j2+7CWjdj6rEfnvOA4tIpAviM6+ywmXWwb7a
   w==;
X-CSE-ConnectionGUID: geg71VQSRRWdzbZvL4HI/A==
X-CSE-MsgGUID: B3skrHYAQX6k0iMgB33pmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="222970434"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="222970434"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:36 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8A73B1000145
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:36 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 368BB18915DB
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id ACAC5100008A;
	Thu,  2 Apr 2026 02:15:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/39] python3-cmake: upgrade 4.2.3 -> 4.3.0
Date: Thu,  2 Apr 2026 10:13:34 +0800
Message-ID: <20260402021355.1324-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125934

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  docs: mention Windows ARM in README

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_4.2.3.bb => python3-cmake_4.3.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_4.2.3.bb => python3-cmake_4.3.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.2.3.bb b/meta-python/recipes-devtools/python/python3-cmake_4.3.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_4.2.3.bb
rename to meta-python/recipes-devtools/python/python3-cmake_4.3.0.bb
index 613652b578..b9eb56891d 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.3.0.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "7a6bc333453c9f7614c7a6e664950d309a5e1f89fa98512d537d4fde27eb8fae"
+SRC_URI[sha256sum] = "b25ef14e4ebc16219eeb199da2199fc526c011f9973e02e7c21c69bfd46ed752"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0


