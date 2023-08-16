Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA6EC001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:39:25 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.151966.1692149958658257929
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="116321385"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="116321385"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:39:16 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 34A36D29E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:39:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 735F9D9484
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:39:13 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E78FB20050193;
	Wed, 16 Aug 2023 10:39:12 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tqdm: upgrade 4.65.0 -> 4.66.1
Date: Wed, 16 Aug 2023 09:38:38 +0800
Message-Id: <1692149918-5143-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10-0.183900-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yRIRh9wkXSlFuH2UDMXidcv9wRnyxuPjhHw6
	H06bMgiviRxOSRn4ABOGJnok3YPpIIOg10tACOcw/PESQuKkPqD4qCLIu0mtIN8pqleQItEF4xF
	+uIHdBWapSKvNQ9NlT4G8mDacYwBocT8D22/cVEYD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiAH/xyJs7whgVLX6oLGmWi9yBRU/cKn69AUDqlLFoMeYCGfvnVpx+256ba
	/D5x6cp4vM1YF6AJbY1+l7XRPciwxZ4ylU2GwzAxEHRux+uk8hxKpvEGAbTDk0eSvEMK8HkKesb
	VtxkAyPoT2cbitmh5zOY4d0nI1U/VRwQZVnCPmBlLH+J6FglrMAHCJDucHg8XL0DOjjpVG8OHEA
	xyyM0uoK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104379

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 MPLv2.0 changed to MPL-2.0
 setup.py and MANIFEST.in removed from files

Changelog:
===========
-  fix utils.envwrap types (#1493 <- #1491, #1320 <- #966, #1319)
-  drop mentions of unsupported Python versions
-  environment variables to override defaults (TQDM_*) (#1491 <- #1061, #950 <- #614, #1318, #619, #612, #370)
-  fix & update CLI completion
-  fix & update API docs
-  minor code tidy: replace os.path => pathlib.Path
-  fix docs image hosting
-  release with CI bot account again (https://github.com/cli/cli/issues/6680)
-  exclude examples from distributed wheel (#1492)
-  migrate setup.{cfg,py} => pyproject.toml (#1490)
    fix asv benchmarks
    update docs
-  fix snap build (#1490)
-  fix & update tests (#1490)
    fix flaky notebook tests
    bump pre-commit
    bump workflow actions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tqdm_4.65.0.bb => python3-tqdm_4.66.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.65.0.bb => python3-tqdm_4.66.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.65.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.66.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.65.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.66.1.bb
index f54b5c41e2..2a92e61893 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.65.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.66.1.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://tqdm.github.io/"
 SECTION = "devel/python"
 
 LICENSE = "MIT & MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=cfdbc9dcca7dc9fb600347958b7d5c4f"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=bb3c087935ebba37cad180364cb0850c"
 
-SRC_URI[sha256sum] = "1871fb68a86b8fb3b59ca4cdd3dcccbc7e6d613eeed31f4c332531977b89beb5"
+SRC_URI[sha256sum] = "d88e651f9db8d8551a62556d3cff9e3034274ca5d66e93197cf2490e2dcb69c7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


