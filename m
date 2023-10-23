Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063E2CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:48:20 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.116477.1698050896100065028
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="125519615"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="125519615"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:48:13 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id ABD30DDC77
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:48:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id ECB1ED5D0A
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:48:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 288B46C9F5;
	Mon, 23 Oct 2023 17:48:10 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-huey: upgrade 2.4.5 -> 2.5.0
Date: Mon, 23 Oct 2023 16:47:23 +0800
Message-Id: <1698050843-25780-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10--6.353700-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrBGvINcfHqhf+Aw16GgqpO4/M
	VY+TBf96WYgl39Q9haAsWi4sXciGhVnGEjlsas2ykkRQ7aojOUvKIqAq0jIHiq9jXNy2Un1MMuT
	wbaqEJZMyJ+sK5xb1guwGFvUzInG21/+VfQvFUwILwUwfdPoXvlF5adRR2Ej1HmcyZWkSxsW+qc
	W0zo2r8vu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+AEITY2UGMiNwpeqaZhManGJSDl
	QPoCUXSsX24ahsS5PuAMuqetGVetnyef22ep6XYOwBXM346/+yBhZ/uuhEmUgPMmpMnEVYKyNrn
	G4oNdgGnUHKQN6uH4ARNH7FO4Sro
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105670

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Check to ensure the gevent monkeypatch was applied when running the consumer
 with greenlet workers, log warning if it is not.
-Explicitly clear the revoked flag on task instances after execution (#713).
-Add support for delay=, eta= in Huey's .s() and .then()
-Add support for rescheduling callback pipelines when rescheduling a task.
-Add an on_commit_task() decorator for Django extension that will enqueue the
 task after any database changes have been committed.
-Allow overriding the delay and eta when raising a RetryTask exception.
-Add a very simple ResultGroup.as_completed() helper to provide a way to deal
 with multiple results as they become available.
-Add an asyncio helper for resolving task results asynchronously.
-Fix bug in SIGINT and SIGTERM behavior for gevent users.
-Include lock name when a task fails due to TaskLocked exception

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-huey_2.4.5.bb => python3-huey_2.5.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.4.5.bb => python3-huey_2.5.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.4.5.bb b/meta-python/recipes-devtools/python/python3-huey_2.5.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-huey_2.4.5.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.5.0.bb
index dbddd6cb80..c6e5606090 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.4.5.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.5.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "760cf150deff1fa34b852da37701a5a750d1148f03ea07aa2b3764dc6060b4c3"
+SRC_URI[sha256sum] = "2ffb52fb5c46a1b0d53c79d59df3622312b27e2ab68d81a580985a8ea4ca3480"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.34.1


