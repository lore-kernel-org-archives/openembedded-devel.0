Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8E8C88CBA
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.3828.1686620455361391674
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="121527755"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="121527755"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:54 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EB461C3F90
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 33838D3F1E
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A68AC20074724;
	Tue, 13 Jun 2023 10:40:49 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-autobahn: upgrade 23.1.2 -> 23.6.1
Date: Tue, 13 Jun 2023 09:40:09 +0800
Message-Id: <1686620422-29962-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10-2.115300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGBUtfqgsaZaLuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMO0vV5rIX38lIQ1l
	ciJ+nz56nV9h/mZQbH+jUZOMsCdXsKifiXbsUQ8xyNjpNmwbfUjwZ0JBgZIrfbjiHekXsj1sENe
	Vu006CKgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103238

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-autobahn_23.1.2.bb => python3-autobahn_23.6.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_23.1.2.bb => python3-autobahn_23.6.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_23.1.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_23.6.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_23.1.2.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_23.6.1.bb
index 26f85e2a4..dc11b85da 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_23.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_23.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3e2c2c2cc2915edc5321b0e6b1d3f5f8"
 
-SRC_URI[sha256sum] = "c5ef8ca7422015a1af774a883b8aef73d4954c9fcd182c9b5244e08e973f7c3a"
+SRC_URI[sha256sum] = "ce6e540402e3524ca46c55a1bc46255225969b5837ca792ea5415d21ac571034"
 
 inherit pypi setuptools3
 
-- 
2.34.1


