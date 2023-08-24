Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58ADDC7113B
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:11:04 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.6140.1692864656025515252
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="130598594"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="130598594"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:10:53 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C19D7CD7E2
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:10:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 081D2BCB60
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:10:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 746AD6BE7A;
	Thu, 24 Aug 2023 17:10:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-alembic: upgrade 1.11.2 -> 1.11.3
Date: Thu, 24 Aug 2023 16:10:29 +0800
Message-Id: <1692864629-2390-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27832.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27832.005
X-TMASE-Result: 10--1.150300-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrk45XNF39dU7SFEMpLkP/WTnG
	P45AxioiAwr1d1MD+nhv8xQohvIgZOPncnH7tKVO8Jb881FGn9liMNd0z/HZU/4DDXoaCqk7TBG
	8ZFuoEXLH4acMncvJXGFbmbva9L8ObTSwI/A2DvAD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBLz5IBH0jYYABhQWw3lZ+IU7BOj1lchJLN0KiTeJteVBfS0Ip2eEHnwj/1Rbkzl1E1KJa
	DC0P3OP5MIx11wv+CPGVuWouVipcg0mcUX1cUjtjUdeKu1Yw1vxLh0XsZY4DhM9IGXGHfX1I5um
	AeF4OTnvKeEeqxs4UzLLZJT5HESm9q5Bcqyw4nPzcDuRjcTFxf6/2/nZkihaOgB/fz3EXdcVKT0
	eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104566

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Improved autogenerate compare of expression based indexes on PostgreSQL
 to produce fewer wrong detections.
-Fixed issue with NULLS NOT DISTINCT detection in postgresql that
 would keep detecting changes in the index or unique constraint.
-Added encoding="locale" setting to the use of Python's
 ConfigParser.read(), so that a warning is not generated when using the
 recently added Python feature PYTHONWARNDEFAULTENCODING specified in
 PEP 597. The encoding is passed as the "locale" string under Python
 3.10 and greater, which indicates that the system-level locale should be
 used, as was the case already here.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.11.2.bb => python3-alembic_1.11.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.11.2.bb => python3-alembic_1.11.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.11.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.11.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.11.2.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.11.3.bb
index 6577e7f811..6d8a84edfe 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.11.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3023b042cb6002cb398344b51c67093"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "678f662130dc540dac12de0ea73de9f89caea9dbea138f60ef6263149bf84657"
+SRC_URI[sha256sum] = "3db4ce81a9072e1b5aa44c2d202add24553182672a12daf21608d6f62a8f9cf9"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.34.1


