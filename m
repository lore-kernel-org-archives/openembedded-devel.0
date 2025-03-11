Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BB0C36002
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.4169.1741683334782495662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pm6DFL77;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683335; x=1773219335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=t2NxrkV4F6N5tlH/yH85VNTgLAqUcLovx65zeqUV3mY=;
  b=pm6DFL77Ltp0d9Ig/OljUFdXE62Y4+y0pUr7Bb/mw/bgsuhc7T0wCo8J
   cqH3wL1tU+pLUQHApH9Va67FljvzeYtDDplRDsBCuyKqf95In9kz0Bn/0
   uQU7RZdVHxTx/y/Na3APtn1GtclSdRPRwtOpXDRyWpIDhxgdxeGAEvEnq
   9qqaHCuvc4XcKEYoXX1NBZHXfqDhFjxo88eExKrGVQlITv4fdv2im9UJE
   +c6O4C3q9fPqWPSuD+RA07Hf17RIq1j4CzX/TzZiRBqD7HK/BexOxl54Y
   /I9sUXPpZMNH4QlTEzSnAqkZpoihwiHzZHlYhvW67uA04LXFS5sEi9UjB
   w==;
X-CSE-ConnectionGUID: gWYTSHoOSLeTRLPGOOLYvg==
X-CSE-MsgGUID: XUBWmLrWSTic94R7KLoCzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="195361225"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="195361225"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:32 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 99978D4807
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5CE12BDC93
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 222921A009B;
	Tue, 11 Mar 2025 16:55:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/36] python3-isort: upgrade 6.0.0 -> 6.0.1
Date: Tue, 11 Mar 2025 16:54:57 +0800
Message-Id: <1741683310-8681-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115876

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix multi_line_output_modes docs
- Ruff rules PT for pytest
- Ruff rules B017, B028, and E203
- Lint Python code with ruff
- Fix test_find_imports_in_file_error failing on Windows
- Move flake8 settings into pyproject.toml
- Upgrade to uv>=0.6.0 and enable-cache
- Apply some ruff rules
- Add OSError handling in find_imports_in_file
- Link GH as changelog

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-isort_6.0.0.bb => python3-isort_6.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_6.0.0.bb => python3-isort_6.0.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_6.0.0.bb b/meta-python/recipes-devtools/python/python3-isort_6.0.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-isort_6.0.0.bb
rename to meta-python/recipes-devtools/python/python3-isort_6.0.1.bb
index 436a7bade8..cf04452102 100644
--- a/meta-python/recipes-devtools/python/python3-isort_6.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_6.0.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=197c46995787b46a2dbf0d519c1754cf"
 
-SRC_URI[sha256sum] = "75d9d8a1438a9432a7d7b54f2d3b45cad9a4a0fdba43617d9873379704a8bdf1"
+SRC_URI[sha256sum] = "1cb5df28dfbc742e490c5e41bad6da41b805b0a8be7bc93cd0fb2a8a890ac450"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


