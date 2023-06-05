Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B16C7EE3A
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:31 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.2147.1685951605774656817
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="107515896"
X-IronPort-AV: E=Sophos;i="6.00,217,1681138800"; 
   d="scan'208";a="107515896"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:53:23 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E559DDC60
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:21 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 65464BF3C8
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:20 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FB9F2FC7F28;
	Mon,  5 Jun 2023 16:53:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] samba: upgrade 4.18.2 -> 4.18.3
Date: Mon,  5 Jun 2023 15:52:54 +0800
Message-Id: <1685951589-29920-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
References: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27672.004
X-TMASE-Result: 10-0.990500-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmKN5v0jh1hv28hjol69azi+dXu122+iJtpV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SFx9D/x5AeZd+NUYtTqu0YlBgHgZCitqFifMxDx8+rHhBS1
	zFbazWPZ1wOWhz1b6wy1hIWVOquoO3PIhW0EZXXkpLfe+RqqE8S7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103110

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../samba/{samba_4.18.2.bb => samba_4.18.3.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.18.2.bb => samba_4.18.3.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.18.2.bb b/meta-networking/recipes-connectivity/samba/samba_4.18.3.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.18.2.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.18.3.bb
index 51b0ca751f..ee3665ca15 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.18.2.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.18.3.bb
@@ -32,7 +32,7 @@ SRC_URI:append:libc-musl = " \
            file://cmocka-uintptr_t.patch \
            "
 
-SRC_URI[sha256sum] = "5bf87e179616cd12a52d85fb8b26eec709f13709a2b67fe42b1fb0213f7e8106"
+SRC_URI[sha256sum] = "c67e1453165a3918ffffad600236ca3966b47bde4798e89ae600ae3903ccc32c"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.18(\.\d+)+).tar.gz"
 
-- 
2.34.1


