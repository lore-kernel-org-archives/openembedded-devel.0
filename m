Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2224FC0219C
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:32 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.30514.1735032450380387235
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ENJG99Vq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032451; x=1766568451;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=S5bLMcyqKg3X5PjnYfia8NlRHuBjKOUgo65NkhyR52w=;
  b=ENJG99VqSa1YF99bblCqBZJChsbfUqsVEAXixOzbJ1SUjiBW7OYpRrCJ
   YshvaQGGyDNXdbaYzMjImjUlrIKzF3uYQNI0BMS6s/jVRQuOqNuivZE8r
   7xegXl2rlAXmCBStqLq08hyaZiiRpDVbD5EZmYTXrWgffuQlOLtUPmvHM
   D99Q/POHLR0tWcH91NcffPr6Y4aoJO8E49meGbqKeAk/f8IAUA9CPpoRS
   QE6rdVQDl7r6qR4riLVqGqZ1NIw0jQMGjDo509Y5lGNsCbq3tKym7VujX
   2CU5jGboYZX8Px2xe+64N5x47gCxZyyTC9BXG9/fPqVULTVaTtRqLs/Ex
   w==;
X-CSE-ConnectionGUID: 7UKcuUR8R26UAodIR8ykHw==
X-CSE-MsgGUID: dh08gQ+tRLexyJhyac6CkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184746900"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184746900"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:28 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 029A1E8520
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C85BAD5096
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5C4906BB64
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:25 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 22FED1A006C;
	Tue, 24 Dec 2024 17:27:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 50/67] python3-pytest-benchmark: upgrade 4.0.0 -> 5.1.0
Date: Tue, 24 Dec 2024 17:26:44 +0800
Message-Id: <1735032421-13513-50-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--1.189700-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yXg2y0j5vXZGlEDhvi2wR84H4DTIEE89jMhm
	GVf5QASGK15178ontUsep5R/z/M+R027U1svd4xeKsurITpSv+M7IQMrI2fP7zABh2rVVNejf93
	0TWJ8hXsKoiVTDA+B7Ft/JElezpqfC2Anznh4fA42aDVyTGx/p9vae4ndRVeGhvMGIdZOnUvQGF
	lKOB0iJG95CsHizGivDcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZeRlBdzYSbt4hhF3
	VkquVInDVHHAE0cndQGFBbDeVn4hZcFdomgH0lnFEUknJ/kEl7dB/CxWTRRu+rAZ8KTspSzlG3+
	XIvw1PILIQO831gbK6F/30O+vqmpaFqQ6G7ceorgL9Y7Vd5AMV++wHZYtCGD/8nG2hjt0Q+iQVG
	GtoDbhQB7iSHp+SCiiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114525

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Changelog:
==========
- Fixed broken hooks handling on pytest 8.1 or later
- Fixed bad fixture check that broke down then nbmake was enabled.
- Dropped support for now EOL Python 3.8. Also moved tests suite to only test the latest pytest versions (8.3.x).
- Fix generate parametrize tests benchmark csv report errors
- Added the --benchmark-time-unit cli option for overriding the measurement unit used for display.
- Fixes spelling in some help texts.
- Added new cprofile options:
  --benchmark-cprofile-loops=LOOPS - previously profiling only ran the function once, this allow customization.
  --benchmark-cprofile-top=COUNT - allows showing more rows.
  --benchmark-cprofile-dump=[FILENAME-PREFIX] - allows saving to a file (that you can load in snakeviz, RunSnakeRun or other tools).
- Removed hidden dependency on py.path (replaced with pathlib).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t-benchmark_4.0.0.bb => python3-pytest-benchmark_5.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-benchmark_4.0.0.bb => python3-pytest-benchmark_5.1.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-benchmark_4.0.0.bb b/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-pytest-benchmark_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb
index 98ba6c3822..ae4b12c210 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-benchmark_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A ``pytest`` fixture for benchmarking code. It will group the tests into rounds that are calibrated to the chosen timer."
 HOMEPAGE = "https://github.com/ionelmc/pytest-benchmark"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c7d2e9d24c2b5bad57ca894da972e22e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d606e94f56c21c8e0cdde0b622dcdf57"
 
-SRC_URI[sha256sum] = "fb0785b83efe599a6a956361c0691ae1dbb5318018561af10f3e915caa0048d1"
+SRC_URI[sha256sum] = "9ea661cdc292e8231f7cd4c10b0319e56a2118e2c09d9f50e1b3d150d2aca105"
 
 inherit pypi setuptools3
 
-- 
2.43.0


