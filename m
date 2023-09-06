Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8207FCCFA00
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:50:15 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.2262.1693965011735177560
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="118678134"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="118678134"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:50:08 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 05D36DDC62
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:50:07 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 33B066A3CAA
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:50:06 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 48817881CE;
	Wed,  6 Sep 2023 10:50:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20230820.0 -> 6.0.20230827.0
Date: Wed,  6 Sep 2023 09:49:56 +0800
Message-Id: <1693964996-13700-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.004
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPauLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXK0h8fNYOXc2AQ00R2Uw/H9yB3+oGCZBc8PKk
	UP9Id9gyZQyoB2lLneO02xtAAxGcPrSujozBt76LL7ufmqPZmL/ozKTaQuSYX+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104730

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20230820.0.bb => ctags_6.0.20230827.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20230820.0.bb => ctags_6.0.20230827.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230820.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230827.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20230820.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20230827.0.bb
index 8e476f5ff6..7d25e2e870 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230820.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230827.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "2f261918d9e56a5d7b484f541e3cba35c9885d73"
+SRCREV = "713c557bd30e729be54af12edafd90dc041ce534"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


