Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDF3CF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:44:09 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.49305.1727682239094774302
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=naXLoJqv;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682240; x=1759218240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vZv9AEhDmxA93OIX5t/CUJvEdd4JRVgN1sxWc9po55U=;
  b=naXLoJqvL+X0UTnkAjuLsFTmCMyEyur45ZrjbyjYVZqSIdjikQAo4lz7
   CSF6vVytruzluD3CvSa8mD3eicvpDwMYhME8wRLvagRCkfz4VTHx+8Bsi
   drCZiaso1T6YMwLdt3Y9+/DXwGmlI1RnkJnz4EWdviDMOKUb/yGwkRgUu
   soD6VMjnWTRDqTr+odjIA2pOcM0lg/1RMaQU8FCDaSiQlzcyGroszFsOm
   jnxA/dCiaDqeV7Kw1x8sXb7H3ikQJzng2lSusR8eTUoW+dXiCw15Kg052
   Dd122q7Rz6j1iB1Ty6S2lmJbCOdkuqXxxeIAwLTKIEJk7JkM1hSSnbiki
   g==;
X-CSE-ConnectionGUID: W0ZiEVqoRduh4t7BPxHnDA==
X-CSE-MsgGUID: cAxmZlZmSsOVLzblu1p3Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="174441264"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="174441264"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:57 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0420ACA1E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 41F93D7627
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CF89D2007B716
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8026C1A000A;
	Mon, 30 Sep 2024 15:43:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/40] python3-sympy: upgrade 1.13.2 -> 1.13.3
Date: Mon, 30 Sep 2024 15:42:56 +0800
Message-Id: <1727682185-12664-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-3.677700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMO031Nfxfj2zMQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJGi9C1Rl9ijlwR24PeLWX21qhF/SUfTrBUIi
	heQCSv0XpD5I4SVTW0lAl7BvhPeL9m865/H8ytf3ZY/jegTusHWB3Vqgnp80/+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112589

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Handle matrices of zero columns correctly in the Matrix constructor.
- NumPy numbers can be used with clebsch_gordan.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sympy_1.13.2.bb => python3-sympy_1.13.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.13.2.bb => python3-sympy_1.13.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.13.2.bb b/meta-python/recipes-devtools/python/python3-sympy_1.13.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sympy_1.13.2.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.13.3.bb
index 02577964c..a0f670072 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.13.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/sympy/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea48085d7dff75b49271b25447e8cdca"
 
-SRC_URI[sha256sum] = "401449d84d07be9d0c7a46a64bd54fe097667d5e7181bfe67ec777be9e01cb13"
+SRC_URI[sha256sum] = "b27fd2c6530e0ab39e275fc9b683895367e51d5da91baa8d3d64db2565fec4d9"
 
 inherit pypi setuptools3
 
-- 
2.34.1


