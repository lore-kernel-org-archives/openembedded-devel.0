Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACA8C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:28:19 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.115887.1698049690949966186
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="125517668"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="125517668"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:28:08 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0AC3DCD7E5
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:28:06 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 45C37BF3DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:28:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 872762005019C;
	Mon, 23 Oct 2023 17:28:04 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aiohttp: upgrade 3.8.5 -> 3.8.6
Date: Mon, 23 Oct 2023 16:27:20 +0800
Message-Id: <1698049640-24925-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-0.728100-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrZG3SCLP7QtKU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v9uTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6ALq
	g5pLL+CRcpIy38QUPHV5EU9Ocurosn1zXAFh7VmipvnnZVWVrzJDXfcCulSJpNRFqbSYaGTejIx
	jaXvjFP581iKhCPiPKCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105649

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/aio-libs/aiohttp/blob/master/CHANGES.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiohttp_3.8.5.bb => python3-aiohttp_3.8.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.8.5.bb => python3-aiohttp_3.8.6.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.8.5.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
index d04279ed97..f8ca9a4739 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "b9552ec52cc147dbf1944ac7ac98af7602e51ea2dcd076ed194ca3c0d1c7d0bc"
+SRC_URI[sha256sum] = "b0cf2a4501bff9330a8a5248b4ce951851e415bdcce9dc158e76cfd55e15085c"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.34.1


