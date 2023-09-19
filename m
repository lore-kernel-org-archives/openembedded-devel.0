Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762C3CD548C
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:45:19 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2464.1695109513602904729
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="111997297"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="111997297"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:45:11 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 37189CA1F0
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:45:09 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6878AD5E33
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:45:08 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3875A2FC6B2A;
	Tue, 19 Sep 2023 16:45:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-engineio: upgrade 4.7.0 -> 4.7.1
Date: Tue, 19 Sep 2023 15:44:33 +0800
Message-Id: <1695109473-7684-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.005
X-TMASE-Result: 10--2.178800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9c8DTfVRLTQzAvz
	nYJVXoOYYNXW8DxKuFISqo3ZUfrHh+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQBOf
	aZOJHHOWxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzjYx/8elGtCXd+9
	GTDUYozrQchQbYJ/jO1GUkMdZy0UAZQlHjboFn2ia6UZOnMWhDlOjX+9XZvF9mSh7kr/02TT6cC
	7xJSr9XiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104981

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Replace gevent-websocket with simple-websocket when using gevent
-Catch and log all errors that occur in event handlers
-Use daemon threads for background tasks also in the threaded client
-Silence exception on websocket exit when using uWSGI #330

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-engineio_4.7.0.bb => python3-engineio_4.7.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.7.0.bb => python3-engineio_4.7.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.7.0.bb b/meta-python/recipes-devtools/python/python3-engineio_4.7.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.7.0.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.7.1.bb
index 85f537189e..0ef64268a7 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.7.1.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "8b4f30ba58a5bff001801127227f44a1da0c0a22045f798c1a13ebb0d618e2a3"
+SRC_URI[sha256sum] = "a8422e345cd9a21451303380b160742ff02197975b1c3a02cef115febe2b1b20"
-- 
2.34.1


