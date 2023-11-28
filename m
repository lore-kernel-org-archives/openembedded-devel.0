Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F413CC07E98
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:52:04 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.28685.1701161520580528698
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:52:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="140704141"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="140704141"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:51:59 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 51F67D9D90
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:51:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CBEEBF49D
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:51:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AD9D62005019B;
	Tue, 28 Nov 2023 17:51:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ser2net: upgrade 4.5.1 -> 4.6.0
Date: Tue, 28 Nov 2023 16:50:04 +0800
Message-Id: <1701161404-28714-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28024.006
X-TMASE-Result: 10-5.730900-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrKQNhMboqZlowBkq9J2oG976p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BZD5CwN3C0B+IpRqgiF5rtYlQ
	sOZL1oLGu9xE0vJpX53k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIx1FPlNAAmcA5sz
	nej3lJz4CwdwbhObm2k9am8Nh4HEeHEmhSiBhWzj4xEK4mwrB2b6FlxRM6nRGxUNuZwuq+sFDWz
	LWwjfcIE0SgFwbKmVA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:52:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107093

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 New release and Windows installer. Requires the Gensio library to be installed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ser2net/{ser2net_4.5.1.bb => ser2net_4.6.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.5.1.bb => ser2net_4.6.0.bb} (83%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.5.1.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.0.bb
similarity index 83%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.5.1.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.6.0.bb
index 250793309..2156889eb 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.5.1.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "6d60c2eb9e15f6a23743ce7fc3687a8880042d7fca43572e73ca76ed003de258"
+SRC_URI[sha256sum] = "58a7ba97761f96b9228bccf6367c2715c0c0be1f99e0a114d429d8c1fcb9c8b2"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.34.1


