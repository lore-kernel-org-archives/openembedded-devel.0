Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8233C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:50:06 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.17741.1702543799802800933
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="144919895"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="144919895"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:49:58 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FBFBE8D34
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:49:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 581E8D501B
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:49:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8852C353854;
	Thu, 14 Dec 2023 17:49:53 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-colorlog: upgrade 6.7.0 -> 6.8.0
Date: Thu, 14 Dec 2023 16:49:46 +0800
Message-Id: <1702543786-27640-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28056.006
X-TMASE-Result: 10--1.940100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrMVx/3ZYby794YeSlHZYFoqB8
	tGwEqygaY1mVlKjrUUwNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG23q9
	shu4W81CxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzil8sL6xaAEjROv
	LycPAlnf5+XFJruVJ0nmp/PMxDXkNSwTJRDThHvPzaBVJb1OnHcXFWH6g/g4RIxJCutiDQPH9Fg
	O5XvaV5iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107428

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Remove universal wheel, python 2 is unsupported
-Fix running tests in environment with NO_COLOR=1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-colorlog_6.7.0.bb => python3-colorlog_6.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_6.7.0.bb => python3-colorlog_6.8.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_6.8.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_6.8.0.bb
index 69f4be17c..6aefef6d1 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_6.8.0.bb
@@ -7,6 +7,6 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[sha256sum] = "bd94bd21c1e13fac7bd3153f4bc3a7dc0eb0974b8bc2fdf1a989e474f6e582e5"
+SRC_URI[sha256sum] = "fbb6fdf9d5685f2517f388fb29bb27d54e8654dd31f58bc2a3b217e967a95ca6"
 
 RDEPENDS:${PN} += "python3-logging"
-- 
2.34.1


