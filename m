Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF23CC02194
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.30359.1735032440774627257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Sp4HBh6k;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032441; x=1766568441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YAKzwvO19MWj7MXL2GPDP8lIjHkyVkaaxfgNixqIDmw=;
  b=Sp4HBh6kARH13hnjCu6q+gBe7pQqsWHBpX7jhDrqB1VLHK0D3/JRZmVq
   32u5zR1plOTpcnhp2j0vFW/Q4piNeXvVvQljhv+jvRAxSsvrYkEJkCFZT
   Xo84ToHQ3f5LiqDlO8fRiFCitpu0zhCXQWz2QGbb5xGFOcqzR8MR+i+Dn
   if3NLH8Wuxl6akjWY6XFgSAIMOMgswgHGYTmz8C3Zxcl9xcOZ3S5cQXTS
   VAGnhWuOuQFAKqqZh1sCh4FLKSoz8AD5ASuYbjS5tG5INMcyDIbanL6tW
   qpeR8B7Pacwq6OnBj6T7UCzBMqTtHrsRqGKAa2TEEhERegKQgtCRgI62g
   g==;
X-CSE-ConnectionGUID: AwQl7IjoQeuR/AeH+VecIA==
X-CSE-MsgGUID: a69xSpQsRcasfqjG3Vrv1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="183972679"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="183972679"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:19 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AC983C2264
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 81DC0D5B42
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DE8A6BB6B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BB5381A006C;
	Tue, 24 Dec 2024 17:27:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/67] python3-astroid: upgrade 3.3.5 -> 3.3.7
Date: Tue, 24 Dec 2024 17:26:05 +0800
Message-Id: <1735032421-13513-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-0.239400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbytOed0Eey3YOXJ9
	Mbn64cXRX64KjR1hKzoNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2h+t
	oLLKXwRGBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w50zm
	F0k359E1U9A2P4GKGmmZicRe+QtviOIHxcCol1xHhBBJD7OcS7SAPnGWBArCoChMZ+8y5Lw9s46
	Ip5f1MiyQ1b3pcLPomCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114486

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix inability to import collections.abc in python 3.13.1.
- Fix crash when typing._alias() call is missing arguments.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_3.3.5.bb => python3-astroid_3.3.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.3.5.bb => python3-astroid_3.3.7.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.3.5.bb b/meta-python/recipes-devtools/python/python3-astroid_3.3.7.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_3.3.5.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.3.7.bb
index cfa58e7ee5..783bf1d7f5 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.3.7.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "5cfc40ae9f68311075d27ef68a4841bdc5cc7f6cf86671b49f00607d30188e2d"
+SRC_URI[sha256sum] = "29fe1df7ef64dc17a54dbfad67b40b445340fcdba7c4012e7ecc9270c9b2f5b6"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


