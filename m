Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7DAE92725
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 09:30:01 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40574.1767000590282734388
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 01:29:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GSzmMrno;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767000593; x=1798536593;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DZe3suEg+Ibf6RK25CQu8kvRbTHAOja0QtxiPRsKHAs=;
  b=GSzmMrnob/+WPCPExDXsJvgN/hgFwChX7UtUPHKWxcmBsADAptxb/n+H
   jlNwauBTd7hxTJI9eH8gArg2JwYTwW4WQbaSuZch8gfGT4pUmkNT390Er
   8zNigbnQU+5Jdt21S2ZaWeb5HIrWMw6NC7JVHHSYqaVxe4v69iRnDedZP
   iTDmWOacOlx+GFEb6TyXPeBiglvJ9zSNmQ8XlJVputsq4ay61LtFWa7Kc
   wLGlVPmYXH5ZhR+tZQ1oPqjQG72UMZP7CXI6h+YQnxuF7eJJRZSjZ3YsH
   Ze9PPjAT0SyFw1EAXzlVyLK4F4UVHiIfkuoxRXehI/FC/iYc7sukk9B0Z
   A==;
X-CSE-ConnectionGUID: 4B3XH3x6SmiLsquq5EntzQ==
X-CSE-MsgGUID: 8QeAdV/TSRGjzx5gdOJ5EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="203210079"
X-IronPort-AV: E=Sophos;i="6.21,185,1763391600"; 
   d="scan'208";a="203210079"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 18:29:52 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 96AB21851
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:52 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 4654510000FA
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id B8EDB100035A;
	Mon, 29 Dec 2025 09:29:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 05/10] python3-coverage: upgrade 7.13.0 -> 7.13.1
Date: Mon, 29 Dec 2025 17:29:31 +0800
Message-ID: <20251229092936.1483-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251229092936.1483-1-wangmy@fujitsu.com>
References: <20251229092936.1483-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122969

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Added: the JSON report now includes a "start_line" key for function and class
  regions, indicating the first line of the region in the source.
- Added: The debug data command now takes file names as arguments on the
  command line, so you can inspect specific data files without needing to set
  the COVERAGE_FILE environment variable.
- Fix: the JSON report used to report module docstrings as executed lines,
  which no other report did, as described in issue 2105.
- Fix: coverage.py uses a more disciplined approach to detecting where
  third-party code is installed, and avoids measuring it.
- Performance: data files that will be combined now record their hash as part
  of the file name. This lets us skip duplicate data more quickly, speeding the
  combining step.
- Docs: added a section explaining more about what is considered a missing
  branch and how it is reported: Examples of missing branches, as requested in
  issue 1597.
- Tests: the test suite misunderstood what core was being tested if
  COVERAGE_CORE wasn't set on 3.14+.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.13.0.bb => python3-coverage_7.13.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.13.0.bb => python3-coverage_7.13.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.13.0.bb b/meta-python/recipes-devtools/python/python3-coverage_7.13.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.13.0.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.13.1.bb
index 1af218a9e0..d3e98c6987 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.13.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "a394aa27f2d7ff9bc04cf703817773a59ad6dfbd577032e690f961d2460ee936"
+SRC_URI[sha256sum] = "b7593fe7eb5feaa3fbb461ac79aac9f9fc0387a5ca8080b0c6fe2ca27b091afd"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


