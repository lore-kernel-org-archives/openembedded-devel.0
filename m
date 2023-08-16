Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9627C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:42:15 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.151788.1692150133945070927
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="128228857"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="128228857"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:42:12 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EBDE6C68E1
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:42:09 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F7E7D5EA0
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:42:09 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 527BB86E22;
	Wed, 16 Aug 2023 10:42:08 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-coverage: upgrade 7.2.7 -> 7.3.0
Date: Wed, 16 Aug 2023 09:41:47 +0800
Message-Id: <1692150107-5398-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10--8.156800-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrkos2tunL8DR4YeSlHZYFoiO3
	J80qWMSD3r5he0YHlVga5XBBN5aBAdz4cH5hW96YG+R0IVMC10nUoMiU4Mi75W7B7UNCfebUcZ8
	FOemiq2/gK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJRSLgSFq3TnjEd+K6O5Nt52aSH
	WZfVWTJ3p5QGOMb8EgLmth8cTQ473lRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7i3Y+
	NgDncZVtId83G5ClZEacbTEVhKl+kBJbeeVOk1cxYVzI3UCCaY=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104386

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added a .Coverage.collect context manager to start and stop coverage data collection.
- Dropped support for Python 3.7.
- Fix: in unusual circumstances, SQLite cannot be set to asynchronous mode.
  Coverage.py would fail with the error Safety level may not be changed inside
  a transaction. This is now avoided, closing issue 1646.
- Docs: examples of configuration files now include separate examples for the
  different syntaxes: .coveragerc, pyproject.toml, setup.cfg, and tox.ini.
- Fix: added nosemgrep comments to our JavaScript code so that semgrep-based
  SAST security checks won't raise false alarms about security problems that
  aren't problems.
- Added a CITATION.cff file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.2.7.bb => python3-coverage_7.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.2.7.bb => python3-coverage_7.3.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.2.7.bb b/meta-python/recipes-devtools/python/python3-coverage_7.3.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-coverage_7.2.7.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.3.0.bb
index a69c05d25b..0a32a6a38e 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "924d94291ca674905fe9481f12294eb11f2d3d3fd1adb20314ba89e94f44ed59"
+SRC_URI[sha256sum] = "49dbb19cdcafc130f597d9e04a29d0a032ceedf729e41b181f51cd170e6ee865"
 
 inherit pypi setuptools3
 
-- 
2.34.1


