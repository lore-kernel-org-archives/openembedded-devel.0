Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DE8EDE989
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:28:59 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.2165.1695108533231040598
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="134031306"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="134031306"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:28:51 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C7045CA1EB
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:28:48 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C098BF48B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:28:48 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3178786F10;
	Tue, 19 Sep 2023 16:28:47 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20230827.0 -> 6.0.20230917.0
Date: Tue, 19 Sep 2023 15:28:29 +0800
Message-Id: <1695108509-6792-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.006
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPauLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJWOogt0+nYO7JWBdXMlOZXADOmdHY4dlfe33
	i/UVTLd6FafxWZDtqep6chVqb3Jx5pJiMBBsNg95QyINfKqS8vKG7a83WuR0/+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:28:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104959

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20230827.0.bb => ctags_6.0.20230917.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20230827.0.bb => ctags_6.0.20230917.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230827.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230917.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20230827.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20230917.0.bb
index 7d25e2e870..02afbfbbba 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230827.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230917.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "713c557bd30e729be54af12edafd90dc041ce534"
+SRCREV = "481ad1b36daca1d40060dd32b0d825cddc97e9cb"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


