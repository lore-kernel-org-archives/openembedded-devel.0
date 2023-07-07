Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C48CC001DF
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:27 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.4903.1688699656714358142
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="123692687"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="123692687"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:14 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 948EADDC61
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:12 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id BD47BD55E6
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:11 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id EB711881D9;
	Fri,  7 Jul 2023 12:14:10 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.20.0 -> 2.21.0
Date: Fri,  7 Jul 2023 11:13:41 +0800
Message-Id: <1688699627-2519-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10-0.126400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxcvdqWtCoykscc
	xuO4cVKE4K9FmervsqX+kfjo+nx5BG0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO36CZ
	XLlV1mSVGHkld5ZUkK/cid5rCg5TVLFZTDXq2UknmTneKZC4QGBARJjhuCws6mwoxb9FM3gGRJJ
	sbMx2Z7KLj39UJPGKdWEI17A1Iui/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103702

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Features
---------
    Add framework for BYOID metrics headers (#1332) (1a8f50c)

Bug Fixes
----------
    Pypy unit test build (#1335) (33e4263)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.20.0.bb => python3-google-auth_2.21.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.20.0.bb => python3-google-auth_2.21.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.20.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.20.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb
index 2127e4356d..ab32ec4793 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.21.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "030af34138909ccde0fbce611afc178f1d65d32fbff281f25738b1fe1c6f3eaa"
+SRC_URI[sha256sum] = "b28e8048e57727e7cf0e5bd8e7276b212aef476654a09511354aa82753b45c66"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


