Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C620CC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:58:46 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.17840.1702544320945559549
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="122093646"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="122093646"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:58:38 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 89D8FD9DA5
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:58:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C1877DA225
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:58:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DBD99202EA677;
	Thu, 14 Dec 2023 17:58:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-isort: upgrade 5.12.0 -> 5.13.1
Date: Thu, 14 Dec 2023 16:58:21 +0800
Message-Id: <1702544301-28120-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28056.006
X-TMASE-Result: 10--13.456800-10.000000
X-TMASE-MatchedRID: bwTBD8UNLVWjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwiMJxigKCCiSz/b
	l4B9hyYeXr7NXg/pSgT2Jzq6yZuBqZYtMo+kPVtVHWRJEfGP5nk/xRB6OGnb2uTpBuL72LoPg7c
	fJQw9FscI6e35rPWOxYf4l8ZK0TNJpljg/F9ExYQEd3Ut3nPMMKmvtGxmfrOZoxm+eAmfOKn7Td
	r4xDxETVx8Meb5y4g93EHo/O6zh1lAAah3BJUM7Dz6L+U/pejx69nEpnSdAsbWNBiF+9zYcrp/5
	1drlpzt11ArFTCgOGQhO2H4OAiMfOTny3AIFet6eDbLSPm9dkZUENBIMyKD0QfxTM57BPHD7v0M
	lFSLfmlNDQmQ8bbzv+affHI8kAmi560qIURE7L07Cl8sx4HBG64sbbURvhPzgW6bY8SOq3WjxYy
	RBa/qJcFwgTvxipFajoczmuoPCq2/s9lJj3JYkS+6R+So4RSUEW0fkvHJ71C4foL+ekS+xHwsR3
	clLfrl
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107440

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fixed integration tests
-Fixed normalizing imports from more than one level of parent modules
-Remove optional dependencies without extras
-Cleanup deprecated extras
-Fixed #1989: settings lookup when working in stream based mode
-Fixed 80 line length for wemake linter
-Add support for Python 3.12 75
-Fixed: add newest version to pre-commit docs
-Fixed assertions in test_git_hook
-Removed check for include_trailing_comma for the Hanging Indent wrap mode
-Use the standard library tomllib on sufficiently new python
-Update pre-commit.md version number
-doc: Update black_compatibility.md
-Fixed safety sept 2023
-docs: fix black profile documentation
-Fixed typo: indended -> indented
-Docs(configuration/options.md): fix missing trailing spaces for hard linebreak
-Update pre-commit.md
-chore: move configurations to pyproject.toml
-Fixed typo in README
-Update version in pre-commit setup to avoid installation issue with poetry
-Skip .pytype directory by default.
-Fixed a tip block styling in the Config Files section
-Do not cache configuration files
-Derive settings_path from --filename
-Fixed year of version 5.12.0 in CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-isort_5.12.0.bb => python3-isort_5.13.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.12.0.bb => python3-isort_5.13.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb b/meta-python/recipes-devtools/python/python3-isort_5.13.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.13.1.bb
index d111393ea..f8deaae08 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.13.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "8bef7dde241278824a6d83f44a544709b065191b95b6e50894bdc722fcba0504"
+SRC_URI[sha256sum] = "aaed790b463e8703fb1eddb831dfa8e8616bacde2c083bd557ef73c8189b7263"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


