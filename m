Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03024D68BFF
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:23 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37576.1766048649108837317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i3aTK1u7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048652; x=1797584652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B+DwMLUpD9idiieliDphB8vE5WcKK6Yzlqng59MwxBk=;
  b=i3aTK1u7CrNwgPmIdglO6mZcmJU26GvOq2MCm19dIxr3hRqSUg8wegBU
   zKBsJ0oE/74pIwCM2teI6LLgEWRETwHVG7BXynMqfkYM2IHBkhtdiCgkw
   66bFqSdVWNOyLKt5IopseICE3tFcAwWH4ycTdeCKWVmfxWVQ5hePMVGri
   zav4jyVK6IxBJ8PN8NxsqFQjMGBPN5qpwKPb1iFfTlHwUQXUALA2h4bj1
   b0wt7GtWjelptzDXpcagcIplJU3UledP3+LrgdN1T3SBGLuIRgGZeCceG
   MMrs5oDwPSSvjGc0o5vbL6coclahY147kMFlytmEpU8NbYqcyp5eUUhYe
   g==;
X-CSE-ConnectionGUID: xNtCbSzuRIWuL8o+HtAw5g==
X-CSE-MsgGUID: W0XsEWdxS7CqCDrzHxY9jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="223059432"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="223059432"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:11 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 5B4A310029A2
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:12 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 0F1F5C06D5A
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 88E82101E516;
	Thu, 18 Dec 2025 09:04:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/20] python3-coverage: upgrade 7.12.0 -> 7.13.0
Date: Thu, 18 Dec 2025 17:03:37 +0800
Message-ID: <20251218090346.735-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122745

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Feature: coverage.py now supports .coveragerc.toml
- Fix: we now include a permanent .pth file which is installed with the code
- Deprecated: when coverage.py is installed, it creates three command entry
  points: coverage, coverage3, and coverage-3.10 (if installed for Python
  3.10). The second and third of these are not needed and will eventually be
  removed. They still work for now, but print a message about their deprecation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.12.0.bb => python3-coverage_7.13.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.12.0.bb => python3-coverage_7.13.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.12.0.bb b/meta-python/recipes-devtools/python/python3-coverage_7.13.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.12.0.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.13.0.bb
index b3a3a4e7ef..1af218a9e0 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.13.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "fc11e0a4e372cb5f282f16ef90d4a585034050ccda536451901abfb19a57f40c"
+SRC_URI[sha256sum] = "a394aa27f2d7ff9bc04cf703817773a59ad6dfbd577032e690f961d2460ee936"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


