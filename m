Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72C5C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 01:19:27 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.10353.1707268761214581362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 17:19:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XhLOZRb6;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707268761; x=1738804761;
  h=from:to:cc:subject:date:message-id;
  bh=n5AZyO2nDHM06rLlT4NcZCFlq3BR/RsAqwLwo9YSXnA=;
  b=XhLOZRb6SFjP57dPUHffq/bOMum4nx9xKpaEwsB4ZlHqbFdMEYhceTJl
   xCsQ+0IN5dyjS+cDJrDYjUMFHOXMnVABgpFGkwWe4DMtlOGv9dQpWJqip
   S93a9EOEY8+c6H92H12fUbGF9bxoPGiak3eiQT42E2eZ9n9JTCk2r1/47
   fSCq1j0eHJRxFVXUb76mFIJKYr9apWEBgL3CJ9V8AOCSXu5SIUUkkoeox
   LYEBQEa+klDxS4/CgPTIUgVP3lbXKbju2ekmXRa7aX001iMHb8sDy5dgM
   sFej1HYE6BgI5b0jTZ6CdE6euqiDsdfFkzXJcl+qGhtm9+zdptTIMkrqf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="127923183"
X-IronPort-AV: E=Sophos;i="6.05,248,1701097200"; 
   d="scan'208";a="127923183"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 10:19:18 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FCB3D4804
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:19:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 94AEF17564E
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:19:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3341720093265
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:19:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DE51E1A006B;
	Wed,  7 Feb 2024 09:19:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ser2net: upgrade 4.6.0 -> 4.6.1
Date: Wed,  7 Feb 2024 09:17:22 +0800
Message-Id: <1707268642-11937-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28174.001
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28174.001
X-TMASE-Result: 10-7.416300-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJwk5p7o69tnZcLewwAa76fIbyXNwz2gvs1/AFBKYcY9IFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UsjvNV98mpPNEFQkzLSgzkHfoT+q8+y2LkXjGdxbYaoF1Y4
	VtQJVjTNDU+nL5R8RqIpX67aIKkdMt608HJ1ElKkNJHsgeOgyTIdfrJ12aY8E=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 01:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108643

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ser2net/{ser2net_4.6.0.bb => ser2net_4.6.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.0.bb => ser2net_4.6.1.bb} (83%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.0.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.1.bb
similarity index 83%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.6.0.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.6.1.bb
index 2156889eb..108647bdd 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.0.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "58a7ba97761f96b9228bccf6367c2715c0c0be1f99e0a114d429d8c1fcb9c8b2"
+SRC_URI[sha256sum] = "78ffee19d9b97e93ae65b5cec072da2b7b947fc484e9ccb3f535702f36f6ed19"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.34.1


