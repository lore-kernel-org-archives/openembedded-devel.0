Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87092C04FE2
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:28 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.7638.1690875742179097684
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="114337621"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="114337621"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:19 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 06544CD7E0
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A7B927FF4
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:17 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BFD9A10232;
	Tue,  1 Aug 2023 16:42:16 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cytoolz: upgrade 0.12.1 -> 0.12.2
Date: Tue,  1 Aug 2023 15:41:40 +0800
Message-Id: <1690875717-21608-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-3.975000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrkos2tunL8DRvKpAGRBjcb76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Cu2GmdldmiUGAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz2leV1Apxa5tDgp
	Xjj0kt/ZXEs4+NVkbM8sEKyI6jaWBFUPRSirAjPiTDJ1EHTV4tXwiwyigPLrh1y6I9LoPfiUS1g
	bGF/ATJiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104182

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Support Cython 3.0
 Stop building wheels for PyPy 3.9 and PyPy 3.10, which stopped working for some reason

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cytoolz_0.12.1.bb => python3-cytoolz_0.12.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cytoolz_0.12.1.bb => python3-cytoolz_0.12.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cytoolz_0.12.1.bb b/meta-python/recipes-devtools/python/python3-cytoolz_0.12.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cytoolz_0.12.1.bb
rename to meta-python/recipes-devtools/python/python3-cytoolz_0.12.2.bb
index b63e71eb16..fa8549c541 100644
--- a/meta-python/recipes-devtools/python/python3-cytoolz_0.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cytoolz_0.12.2.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d422ebce3e9c6447563bd410e9b22f2e"
 
-SRC_URI[sha256sum] = "fc33909397481c90de3cec831bfb88d97e220dc91939d996920202f184b4648e"
+SRC_URI[sha256sum] = "31d4b0455d72d914645f803d917daf4f314d115c70de0578d3820deb8b101f66"
 
 inherit pypi setuptools3
 
-- 
2.34.1


