Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D867C46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 08:40:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.76936.1703580046588207153
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Dec 2023 00:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="144480803"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="144480803"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 17:40:44 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id ECE90D6188
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 17:40:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F7FDD5E8B
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 17:40:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BA34C21D6F2
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 17:40:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6F2791A0072;
	Tue, 26 Dec 2023 16:40:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-distro: upgrade 1.8.0 -> 1.9.0
Date: Tue, 26 Dec 2023 16:40:28 +0800
Message-Id: <1703580028-13912-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.006
X-TMASE-Result: 10--5.593800-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrZFW4zmF+QEKQc9WQFO7fU6G5
	FgvJzXbUWe3lYtwpBw/k1MRzFdUT3Oxqcgb67Cyaqoeab9Xgz89oQA0psEk3XejMOEZ5AL0S6KT
	BH9GU3xrgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZYA3qL69rXq4Gp0
	VGMd0huLF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG7bkV4e2xSge7Rcxa5n8a3nx8Pj
	Tj3NPzyYhL7adRFujb1x5t2MxREpByFdNnda6Rv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 08:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107807

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Refactor distro.info() method to return an InfoDict
-Ignore the file '/etc/board-release'
-Ignore the file '/etc/ec2_version'
-Run Python 3.6 on Ubuntu 20.04 for CI and bump isort
-Test on modern versions of CPython and PyPy and macOS
-Add support for ALT Linux Server 10.1 distribution
-Add Debian Testing to the tests
-Update archlinux resource for tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-distro_1.8.0.bb => python3-distro_1.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-distro_1.8.0.bb => python3-distro_1.9.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-distro_1.8.0.bb b/meta-python/recipes-devtools/python/python3-distro_1.9.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-distro_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-distro_1.9.0.bb
index f7616e473..a342432a6 100644
--- a/meta-python/recipes-devtools/python/python3-distro_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-distro_1.9.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
 PYPI_PACKAGE = "distro"
 
-SRC_URI[sha256sum] = "02e111d1dc6a50abb8eed6bf31c3e48ed8b0830d1ea2a1b78c61765c2513fdd8"
+SRC_URI[sha256sum] = "2fa77c6fd8940f116ee1d6b94a2f90b13b5ea8d019b98bc8bafdcabcdd9bdbed"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


