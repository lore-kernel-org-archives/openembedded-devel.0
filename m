Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483A7C04FDF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:18 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.7628.1690875731007171006
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126412258"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126412258"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:13 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 846D0D29E1
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B1698D5D15
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:10 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 39BF310211;
	Tue,  1 Aug 2023 16:42:10 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] logcheck: upgrade 1.4.2 -> 1.4.3
Date: Tue,  1 Aug 2023 15:41:30 +0800
Message-Id: <1690875717-21608-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-2.218800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZlXePXNM4FjOuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXKYEp0RMUEqC4xmmIuu1wCWlis/3MO/3MzE53
	Y9azytGRVkV6rOIjoG8xPE03fBKfRK0oJNr41eY7aDQVLBUY6VOstJkWWW8LX+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104170

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../logcheck/{logcheck_1.4.2.bb => logcheck_1.4.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-extended/logcheck/{logcheck_1.4.2.bb => logcheck_1.4.3.bb} (96%)

diff --git a/meta-perl/recipes-extended/logcheck/logcheck_1.4.2.bb b/meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb
similarity index 96%
rename from meta-perl/recipes-extended/logcheck/logcheck_1.4.2.bb
rename to meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb
index 1ad32b2dbb..c13bd940ea 100644
--- a/meta-perl/recipes-extended/logcheck/logcheck_1.4.2.bb
+++ b/meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
 SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.xz \
            file://99_logcheck \
 "
-SRC_URI[sha256sum] = "0c651deb31dc201f1584ecea292b259932bae6e3e8cef846db3109e89a7f217e"
+SRC_URI[sha256sum] = "ad83ae80bd780bdae5eefd40ad59a3e97b85ad3a4962aa7c00d98ed3bdffcdd0"
 
 inherit useradd
 
-- 
2.34.1


