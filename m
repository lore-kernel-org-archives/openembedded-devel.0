Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61300C001E0
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:28 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.7633.1690875734649116257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="105920443"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="105920443"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:18 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 42D9CCD7E0
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B837D8B7E
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:14 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C8BC10211;
	Tue,  1 Aug 2023 16:42:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.7.6 -> 2.8.0
Date: Tue,  1 Aug 2023 15:41:36 +0800
Message-Id: <1690875717-21608-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-2.000400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfMm0pxU5NadBCnn
	zKX95BagpPkgFEQ0YZkNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSz/0XMJYfpi/YX7AlQI2uSF8plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNSpu2xcKS5SIzsROGm75AB57muJPMzaY5h1Gj0a0QZYkxzUZIV5MPOjE9jhd2HdsSlJdv
	rCkgq+PjQvD72TNiukV1o4BAdHXD1LvHqPi046FU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104176

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* allow [integer sequence indexing](indexing.rst) by list of indices,
* add [masked indexing](indexing.rst) by bitarray masks,
* improve `.bytereverse()` docstring

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_2.7.6.bb => python3-bitarray_2.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.7.6.bb => python3-bitarray_2.8.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.7.6.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.8.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.7.6.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.8.0.bb
index b27480057a..19d9f9ef9b 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.7.6.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "3807f9323c308bc3f9b58cbe5d04dc28f34ac32d852999334da96b42f64b5356"
+SRC_URI[sha256sum] = "cd69a926a3363e25e94a64408303283c59085be96d71524bdbe6bfc8da2e34e0"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


