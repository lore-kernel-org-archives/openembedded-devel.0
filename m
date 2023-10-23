Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE738CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:27:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.115877.1698049622864014003
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="137213997"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="137213997"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:27:02 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B9873CD7E0
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:26:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EEBACD5D55
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:26:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B01E6BA7B;
	Mon, 23 Oct 2023 17:26:57 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aiodns: upgrade 3.0.0 -> 3.1.1
Date: Mon, 23 Oct 2023 16:26:46 +0800
Message-Id: <1698049606-24870-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-0.674700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqx4YeSlHZYFohUK
	FVP5dMig4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0HTT
	+SR4FPAESvOyH0vY0BVYdgRiWenxd2VkqmPAGKNuFrIdmZSV+GGh62r+lnhqKo3L58OeKZt9fgL
	rA4n/ps3m09+35o8pvQmicPx9g3GvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105648

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Add PEP-561 with py.typed
Fix timeout

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiodns_3.0.0.bb => python3-aiodns_3.1.1.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiodns_3.0.0.bb => python3-aiodns_3.1.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-aiodns_3.0.0.bb b/meta-python/recipes-devtools/python/python3-aiodns_3.1.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-aiodns_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-aiodns_3.1.1.bb
index 64599d43c3..5c685d7e40 100644
--- a/meta-python/recipes-devtools/python/python3-aiodns_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiodns_3.1.1.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "https://github.com/saghul/aiodns"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a565d8b5d06b9620968a135a2657b093"
 
-SRC_URI[md5sum] = "181e11935c78965de2b2b7b0e5efba8d"
-SRC_URI[sha256sum] = "946bdfabe743fceeeb093c8a010f5d1645f708a241be849e17edfb0e49e08cd6"
+SRC_URI[sha256sum] = "1073eac48185f7a4150cad7f96a5192d6911f12b4fb894de80a088508c9b3a99"
 
 PYPI_PACKAGE = "aiodns"
 
-- 
2.34.1


