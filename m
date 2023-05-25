Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D983C77B7A
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:57:47 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.6200.1684997859969988447
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="105955006"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="105955006"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:57:37 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DF956D29E8
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:35 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 14A57E4AF8
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:35 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C6052FC8EBE;
	Thu, 25 May 2023 15:57:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-antlr4-runtime: upgrade 4.12.0 -> 4.13.0
Date: Thu, 25 May 2023 14:57:18 +0800
Message-Id: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27648.005
X-TMASE-Result: 10-3.117200-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mr70GLyvzOg0zDZ+9HI5nLbBGb
	vPrj6ZNXTvVMSfL26Em04MnVL1UksyIDWvu38Vy6DFuFUXAjxCEL//VMxXlyE9VtkV1dqmwp7Sc
	dpy2ZKwIfBgtPFsXREEQ4/8yS0JD2qcvngzkLMRA/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bm0xeKYZaxlkCxKH1q1GRzB/SIXlNk88729OepgphdNGVeAZ5VSHdZ2bKItl61J/yfJvo
	cwUrWp7dgkRR8OiM/8nRE+fI6etklJw7RF9oO5RJRRDvr6tfTgve3yLq+ACUukYibCZMJFzKGuk
	I5htQvpGhh5WV+WfoDwh3hRxlHz8fIiYvaWbpqz+wMoM3JETT0u/kTKv9giuqwOHO1Fdn0Kb4tj
	0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102818

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Issues fixed
------------
    antlr4 jar doubled in size in 4.9.3 (unicode, comp:performance)
    Go: exponentially bad/absymal performance as of ... (type:bug, target:go)
    Go runtime panic (type:bug, target:go)

Improvements, features
------------------------
    Update LexerATNSimulator.cs with virtual Consume (type:improvement, target:csharp)
    Feature/fixembedding (type:improvement, target:go, comp:performance)
    Provide Javascript port of TokenStreamRewriter (type:feature, target:javascript, target:typescript)


License-Update:
 Version updated to 4.13.0
 "Home-page" changed to "Project-URL: Homepage,"
 "Eric Vergnaud" removed from Author
 Author-email changed to "Eric Vergnaud <eric.vergnaud@wanadoo.fr>"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...lr4-runtime_4.12.0.bb => python3-antlr4-runtime_4.13.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-antlr4-runtime_4.12.0.bb => python3-antlr4-runtime_4.13.0.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.12.0.bb b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.0.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-antlr4-runtime_4.12.0.bb
rename to meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.0.bb
index 1c8c709773..870152c74f 100644
--- a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = "ANTLR runtime for Python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=ab3c64dc056e158882a9a6b35a2f4a6e"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b38bac4871765ce562806c44d2f18cf1"
 
-SRC_URI[sha256sum] = "0a8b82f55032734f43ed6b60b8a48c25754721a75cd714eb1fe9ce6ed418b361"
+SRC_URI[sha256sum] = "0d5454928ae40c8a6b653caa35046cd8492c8743b5fbc22ff4009099d074c7ae"
 
 PYPI_PACKAGE = "antlr4-python3-runtime"
 
-- 
2.34.1


