Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE40CCFA12
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:00:35 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.2460.1693965625094278330
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="118679704"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="118679704"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:00:22 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D8899E852A
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:00:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 25EF9CFB9D
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:00:20 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9AB761E954D;
	Wed,  6 Sep 2023 11:00:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.31.1 -> 2.31.3
Date: Wed,  6 Sep 2023 10:00:07 +0800
Message-Id: <1693965607-14523-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.004
X-TMASE-Result: 10--5.106400-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrZFW4zmF+QEJvJLFMcZQ57ynN
	YSmpHzdZtyAJujoZhY2ITE3HVSm/hUABqHcElQzsa87CDXaKRVLUoMiU4Mi75YHowpO8uJQPvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgK7YaZ2V2aJQYA3qL69rXq4Gp0
	VGMd0huFslxAfd+6tXeTjw/FyRX6QfE8yM4pjsD67rlQMPRoOCxEHRux+uk8h+ICquNi0WJDRa5
	cKh5SE3pZ/ukdnUbXoiQ2Hz/QA8wdlDp+T1B/vfftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104750

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Refactor resolution metadata reading for TIFF and avoid failing on missing data
Add bytes to ImageResource typehints
Update readthedocs.yaml
Deprecate Python 3.7 support
Add bytes to ImageResource typehints
Remove deprecations in CD
Fix typo in README.md
Fix several typos in the docs and source code comments
Add migration note for format kwarg

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.31.1.bb => python3-imageio_2.31.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.31.1.bb => python3-imageio_2.31.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.31.1.bb b/meta-python/recipes-devtools/python/python3-imageio_2.31.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.31.1.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.31.3.bb
index 904ddde70c..709822da70 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.31.1.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.31.3.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "f8436a02af02fd63f272dab50f7d623547a38f0e04a4a73e2b02ae1b8b180f27"
+SRC_URI[sha256sum] = "74c6a832d81b7ad5a8a80976dea58ee033d3e2b99a54990cbd789b4cb0b31461"
 
 inherit pypi setuptools3
 
-- 
2.34.1


