Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943E0CD549F
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:56:19 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2710.1695110177066843429
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132747047"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132747047"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:56:14 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BD6FBDE6AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:56:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 00D67D9481
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:56:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 786C32007911B;
	Tue, 19 Sep 2023 16:56:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-typeguard: upgrade 4.1.3 -> 4.1.5
Date: Tue, 19 Sep 2023 15:55:40 +0800
Message-Id: <1695110140-8206-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.005
X-TMASE-Result: 10-3.509900-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwiQYkZDE2p7wJ7V
	Ny7+UW/96Ztbads/P3GBkEdjut+Lfq/a/Ug5qXLHCtzGvPCy/m5UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw7TfU1/F+PbMxCE2NlBjIjcKXqmmYTGpxiUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrYyF7rbsD7xod0H8LFZNFG76sBnwpOylLP5Kz1w/anMPq0uz
	MZaU+kNPvB2+kzXGu4knFAaSw0QhU3bfSpawL60DmOMGDNLxPFUu7ApVxzSG11hwXiwxana6mYR
	bTJER5SIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104994

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-Fixed Callable erroneously rejecting a callable that has the requested amount
 of positional arguments but they have defaults
-Fixed a regression introduced in v4.1.4 where the elements of Literal got
 quotes removed from them by the AST transformer
-Fixed AttributeError where the transformer removed elements from a PEP 604 union
-Fixed AttributeError: 'Subscript' object has no attribute 'slice' when
 encountering an annotation with a subscript containing an ignored type
 (imported within an if TYPE_CHECKING: block)
-Fixed type checking not being skipped when the target is a union (PEP 604 or
 typing.Union) where one of the elements is an ignored type (shadowed by an
 argument, variable assignment or an if TYPE_CHECKING import) (#394, #395)
-Fixed type checking of class instances created in __new__() in cases such as
 enums where this method is already invoked before the class has finished initializing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-typeguard_4.1.3.bb => python3-typeguard_4.1.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.1.3.bb => python3-typeguard_4.1.5.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.1.3.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.1.5.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-typeguard_4.1.3.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.1.5.bb
index 73935d090c..53a02dc4bc 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.1.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "7d4264cd631ac1157c5bb5ec992281b4f1e2ba7a35db91bc15f442235e244803"
+SRC_URI[sha256sum] = "ea0a113bbc111bcffc90789ebb215625c963411f7096a7e9062d4e4630c155fd"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


