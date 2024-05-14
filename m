Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DA0C27C4F
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.10784.1715677829831592765
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Qx/YiZsd;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677833; x=1747213833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TcIOxxQ5J/sS1DaUurfZ/YG+76yJyFy0R7S3og9dxxU=;
  b=Qx/YiZsd/T/z8rEOkkcyXxXJCXjiBWh6MJXlJIcih2i4U6hB5gpQaEdL
   U+2907O30LRiYJIAclMaBAqBTBAcW86WgY0Jidt6j5N1Rqe1VtrmqFC9y
   aI9EtkOM5iEDC6HykspZgz0cg9OC66x3GudMo66XU21e0BOWhW+Xz4m1J
   GJK9nuNm9isAW9btbfNEI7EHKjSrbc1+nfNv7TDuGqh6h+VFuFRjpvzvj
   CCdWOaFZ2RJryeFBWw7kRGFTBqi096xXqs7yz0BZcT4TDEtjrMSRg7aI4
   ri7pJ9u0oLHoDlfyDih+qIoVdrSPhZCIeMDgiXSPrmZ8C3Hxsxgctl0g+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="145839674"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="145839674"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:32 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A0327DB616
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C2F4CBF4AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F11D70BFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0CD041A000C;
	Tue, 14 May 2024 17:10:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/44] python3-astroid: upgrade 3.1.0 -> 3.2.0
Date: Tue, 14 May 2024 17:09:48 +0800
Message-Id: <1715677817-2223-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-4.945500-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrCZa9cSpBObn+Aw16GgqpO5w6
	tnDgS/8F5HXxn8gnLD2xVvxChGf7E2mNwXtqR9K4PkILbTHNp5sbbhhV65kaY/XGsfmQor+uG2H
	FY70Qqr7gK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZSDFJDHNIsBsGp0
	VGMd0huLF9uGobEuT7gDLqnrRlXrYbaLjLw/bFed0H8LFZNFG7hqz53n/yPnoZx1mP/U1XcK6Tw
	0EcLB1gCOIZGXVErJSAQulO1ukdu+7x/AQyAREZ7r0wjiYoHSn4fPyBI4lfqb14yEYYkmyCgobZ
	65bma78=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110359

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- .pyi stub files are now preferred over .py files when resolving imports, (except for numpy).
- igetattr() returns the last same-named function in a class (instead of
  the first). This avoids false positives in pylint with @overload.
- Adds module_denylist to AstroidManager for modules to be skipped during AST
  generation. Modules in this list will cause an AstroidImportError to be raised
  when an AST for them is requested.
- Make astroid.interpreter._import.util.is_namespace only consider modules
  using a loader set to NamespaceLoader or None as namespaces.
  This fixes a problem that six.moves brain was not effective if six.moves
  was already imported.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_3.1.0.bb => python3-astroid_3.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.1.0.bb => python3-astroid_3.2.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.1.0.bb b/meta-python/recipes-devtools/python/python3-astroid_3.2.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.2.0.bb
index 3c68f1e58..e97494fd9 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.2.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "ac248253bfa4bd924a0de213707e7ebeeb3138abeb48d798784ead1e56d419d4"
+SRC_URI[sha256sum] = "f7f829f8506ade59f1b3c6c93d8fac5b1ebc721685fa9af23e9794daf1d450a3"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


