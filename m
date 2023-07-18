Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E3EEB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:26 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.686.1689654373914029342
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="126111090"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="126111090"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:16 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D994D29E9
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 533CFBF4AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:13 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CF2B320077821;
	Tue, 18 Jul 2023 13:26:12 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-gevent: upgrade 22.10.2 -> 23.7.0
Date: Tue, 18 Jul 2023 12:25:31 +0800
Message-Id: <1689654348-30702-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--4.638200-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mregIHHX2L4Yw3KP3mZa+qgWMa
	pnFC68XmnK0E4bVZnFYgWr3O5UmTdw407JLUrwBy/sUSFaCjTLwnhzAhgvoq55Tx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q29HTxRE6QQB5Slv/9klkDigW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq2pxqTuj4RYdJyRUE67USXGa7aWCGoqAPHWVs98q1UczvCDi
	5h9A0ZLpTwcNNGK2PXq6ohD5jUM7bc6qpmYjIrfA5dO5Dh4SmgdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103919

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Features
----------
-Add preliminary support for Python 3.12, using greenlet 3.0a1.
-Update the bundled c-ares version to 1.19.1.

Bugfixes
------------
-Fix an edge case connecting a non-blocking SSLSocket that could result in an AttributeError.
-Make gevent's FileObjectThread (mostly used on Windows) implement readinto cooperatively.
-Work around an AttributeError during cyclic garbage collection when Python finalizers (__del__ and the like) attempt to use gevent APIs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gevent_22.10.2.bb => python3-gevent_23.7.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_22.10.2.bb => python3-gevent_23.7.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_22.10.2.bb b/meta-python/recipes-devtools/python/python3-gevent_23.7.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-gevent_22.10.2.bb
rename to meta-python/recipes-devtools/python/python3-gevent_23.7.0.bb
index b9bf9130db..a82abcc096 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_22.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_23.7.0.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "${PYTHON_PN}-greenlet \
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "1ca01da176ee37b3527a2702f7d40dbc9ffb8cfc7be5a03bfa4f9eec45e55c46"
+SRC_URI[sha256sum] = "d0d3630674c1b344b256a298ab1ff43220f840b12af768131b5d74e485924237"
 
 inherit pypi setuptools3
 
-- 
2.34.1


