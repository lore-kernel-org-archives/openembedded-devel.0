Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2191C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 03:46:14 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.52749.1702611967102597194
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 19:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="131486805"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="131486805"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 12:46:04 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C35FECA242
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 12:46:02 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DB5EDD645A
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 12:46:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 881262FC6EFB;
	Fri, 15 Dec 2023 12:46:00 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20231126.0 -> 6.0.20231210.0
Date: Fri, 15 Dec 2023 11:45:53 +0800
Message-Id: <1702611953-3164-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28058.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28058.004
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZOdKnCeVjjIZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SM5M9p/WczmQKZubEJ8506BKbrUMjpT4q3oU6opcVx3wAcA
	rbixkK9X2dJ+R4O4Oo8gmYYfQy2EPR1ym2cPSTBRH5O/8/ZKcjS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 03:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107480

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20231126.0.bb => ctags_6.0.20231210.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20231126.0.bb => ctags_6.0.20231210.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20231126.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20231210.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20231126.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20231210.0.bb
index 44a7f6855..308be374d 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20231126.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20231210.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "c480d71e19ad842a1217e9e84e6e4afca124b95e"
+SRCREV = "e9afc805622ef89efa6df9b3ae8fd2871536fd1c"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


