Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7017CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:47:09 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.116467.1698050826098401080
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="125519527"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="125519527"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:47:03 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BD763D424E
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:47:01 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E5BEEBF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:47:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D386E36A8;
	Mon, 23 Oct 2023 17:47:00 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-h5py: upgrade 3.9.0 -> 3.10.0
Date: Mon, 23 Oct 2023 16:46:47 +0800
Message-Id: <1698050807-25744-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-5.266800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xJBHfH0Hk/jxL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Cu2GmdldmiUGAN6i+va16ubsT
	aWd4cSvSD/SpuYoqPDS5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0o13
	+LnQSKDEJWo8AIyuJJM10LCA8xWFn3eyRFodgVzXl2CzzQa3BidrTONrXnZVBDtqPl/Nd+ufKgc
	QWB4QoNybK1baswKGPXzXSqOEKfpw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105669

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://docs.h5py.org/en/stable/whatsnew/3.10.html#bug-fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-h5py_3.9.0.bb => python3-h5py_3.10.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_3.9.0.bb => python3-h5py_3.10.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.9.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-h5py_3.9.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
index 834bb031ca..400233e64a 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI[sha256sum] = "e604db6521c1e367c6bd7fad239c847f53cc46646f2d2651372d05ae5e95f817"
+SRC_URI[sha256sum] = "d93adc48ceeb33347eb24a634fb787efc7ae4644e6ea4ba733d099605045c049"
 
 SRC_URI += "file://0001-setup_build.py-avoid-absolute-path.patch"
 
-- 
2.34.1


