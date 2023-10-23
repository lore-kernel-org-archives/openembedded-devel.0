Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23598C25B67
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:31:45 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.6484.1698103902980786886
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="137243722"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="137243722"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:31:40 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 68210D9DA8
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:31:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C260DAE86
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:31:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CA11D70BE1;
	Tue, 24 Oct 2023 08:31:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-schedule: upgrade 1.2.0 -> 1.2.1
Date: Tue, 24 Oct 2023 07:31:23 +0800
Message-Id: <1698103883-31532-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10-1.601700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbys8a+/GjoiAqr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4HAs
	ELo42EQ0MAW4jFzDBZDnyHtLx3CjLnQ0aJOksfoyX7afF38eIvTLJnStqC04z6+ajgELPmHeWDB
	W2h15lDorxWjoeD/JyCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105691

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix bug where schedule was off when using .at with timezone

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-schedule_1.2.0.bb => python3-schedule_1.2.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-schedule_1.2.0.bb => python3-schedule_1.2.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-schedule_1.2.0.bb b/meta-python/recipes-devtools/python/python3-schedule_1.2.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-schedule_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-schedule_1.2.1.bb
index 98b7690e1b..de326815ac 100644
--- a/meta-python/recipes-devtools/python/python3-schedule_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-schedule_1.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/dbader/schedule"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6400f153491d45ea3459761627ca24b2"
 
-SRC_URI[sha256sum] = "b4ad697aafba7184c9eb6a1e2ebc41f781547242acde8ceae9a0a25b04c0922d"
+SRC_URI[sha256sum] = "843bc0538b99c93f02b8b50e3e39886c06f2d003b24f48e1aa4cadfa3f341279"
 
 inherit pypi setuptools3
 
-- 
2.34.1


