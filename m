Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39379CFD379
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:13:28 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13212.1764062002750227317
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KZs2hmk6;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764062002; x=1795598002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tnFp8GfEs1p2qyV1RqT1JZNmIQwZ8R796u8IBGtmeJg=;
  b=KZs2hmk6bTh0spa2nuaVhdM8USCsYklC6hYz8TGdraTpAuCW0VpR0Md+
   O4gYeZ0nJp8LqjLF94mxL7jJzMc1TpULIfOB4UPcIUhA+HjzYLYcEAHui
   qwR0TJFdckvnolE/MA2WfHxz29YcnQI6Y3cyQWXHUrVlbih0Eaq8VcaUU
   eBdhWX64GX1z0msM6ECoyaR9X0QC6auNZ1rZdMrGkj4gkKpP/j4rfAZb7
   C6k3PnGZ9BR5NJDKGRJ5q+xWmYJErk21s6booPEBoIAH8tJI/FIwFICck
   8KTgOVzaXMqQBB9m+/xAOsKH1OdNG4Dk2KoJOG6sJWvtyd2JVgkI/4/if
   A==;
X-CSE-ConnectionGUID: qXJDWINTRgSOfQFrIJ2aQA==
X-CSE-MsgGUID: qA/sTSFyQ1i9+b78ftA2wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="199164477"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="199164477"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:13:21 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 4355338F
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:21 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id F07C81800EB6
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 29B4814001D4;
	Tue, 25 Nov 2025 09:13:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 16/26] python3-coverage: upgrade 7.11.3 -> 7.12.0
Date: Tue, 25 Nov 2025 17:11:46 +0800
Message-ID: <20251125091156.1376-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091156.1376-1-wangmy@fujitsu.com>
References: <20251125091156.1376-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122041

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- The HTML report now shows separate coverage totals for statements and
  branches, as well as the usual combined coverage percentage.
- The JSON report now includes separate coverage totals for statements and
  branches
- Fix: except* clauses were not handled properly under the "sysmon" measurement
  core, causing KeyError exceptions
- Fix: we now defend against aggressive mocking of open() that could cause
  errors inside coverage.py.
- Fix: in unusual cases where a test suite intentionally exhausts the system's
  file descriptors to test handling errors in open(), coverage.py would fail
  when trying to open source files
- A small tweak to the HTML report: file paths now use thin spaces around
  slashes to make them easier to read.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.11.3.bb => python3-coverage_7.12.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.11.3.bb => python3-coverage_7.12.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.11.3.bb b/meta-python/recipes-devtools/python/python3-coverage_7.12.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.11.3.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.12.0.bb
index 25f606c8f7..b3a3a4e7ef 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.12.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "0f59387f5e6edbbffec2281affb71cdc85e0776c1745150a3ab9b6c1d016106b"
+SRC_URI[sha256sum] = "fc11e0a4e372cb5f282f16ef90d4a585034050ccda536451901abfb19a57f40c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


