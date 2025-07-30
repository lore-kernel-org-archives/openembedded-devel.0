Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C726AC87FD3
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:19 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.31371.1753869307251550651
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=a4vVBGBO;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869311; x=1785405311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/bJbJkOaEonIJLgtINW1eHV+BTjnTjQmR2Ko4TxIUb8=;
  b=a4vVBGBOZM4jdwGCeL7UKALmrTsZXhjQuQWu9kzJLl3e0Smf++EVTXfn
   BD32xUeXsZwg1wZbR0fece8wa7r9KhIkQeuqkeBuuxrXJ1RRsN3+XKVMm
   +th1es7v1VNenhctqnU+wnQLQxyoMvzpuQLHjZ+3lxRubnH79i++UjX7K
   o4/fKXjMrE/kF3nGIpTlPXtLdCnwAFLvd4CYC4HVw42WU5g6WGYtrK7aJ
   z8vX8I5gppJ9Bt8oXI+oYNtRa1IwcZ/7IA2ftZqC5aZHLsogqCbva4b5L
   oA3+R2SgifdKaKSosKygLs9y6yZ/ygre7SoHAAQTX881hFj1jNwxO63Z6
   w==;
X-CSE-ConnectionGUID: uksbsXquRFy8OUYe1jwjKA==
X-CSE-MsgGUID: O+8HWgcxTr2tQFUjlIX5Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="186784570"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="186784570"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:10 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 46BFE42A30E
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:10 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id AB01DC03416
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9E0221A009A;
	Wed, 30 Jul 2025 17:55:06 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/40] python3-coverage: upgrade 7.9.2 -> 7.10.1
Date: Wed, 30 Jul 2025 17:54:39 +0800
Message-ID: <20250730095456.695-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118788

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- A new configuration option: "[run] patch" specifies named patches
  to work around some limitations in coverage measurement.
- The HTML report now dimly colors subsequent lines in multi-line statements.
  They used to have no color. This gives a better indication of the amount
  of code missing in the report.
- Two new exclusion patterns are part of the defaults:... is automatically
  excluded as a line and if TYPE_CHECKING: is excluded as a branch.
- A new command-line option: --save-signal=USR1 specifies a signal that
  coverage.py will listen for. When the signal is sent, the coverage data
  will be saved. This makes it possible to save data from within long-running processes.
- A new configuration option: "[report] partial_also" is a list of regexes
  to add as pragmas for partial branches. This parallels the "[report] exclude_also"
  setting for adding line exclusion patterns.
- A few file path configuration settings didn't allow for tilde expansion: [json] output,
  [lcov] output and [run] debug_file. This is now fixed.
- Wheels are included for 3.14 now that 3.14 rc1 is available.
- We no longer ship a PyPy-specific wheel. PyPy will install the pure-Python wheel.
- In the very unusual situation of not having a current frame, coverage no longer
  crashes when using the sysmon core.
- Fix: the exclusion for if TYPE_CHECKING: was wrong: it marked the branch as partial,
  but it should have been a line exclusion so the entire clause would be excluded.
- Fix: changed where .pth files are written for patch = subprocess

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.9.2.bb => python3-coverage_7.10.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.9.2.bb => python3-coverage_7.10.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.9.2.bb b/meta-python/recipes-devtools/python/python3-coverage_7.10.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.9.2.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.10.1.bb
index 16f7127129..1a97db31ae 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.10.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "997024fa51e3290264ffd7492ec97d0690293ccd2b45a6cd7d82d945a4a80c8b"
+SRC_URI[sha256sum] = "ae2b4856f29ddfe827106794f3589949a57da6f0d38ab01e24ec35107979ba57"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


