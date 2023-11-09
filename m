Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63919C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 04:11:22 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.114672.1699503078915164361
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 20:11:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="118460377"
X-IronPort-AV: E=Sophos;i="6.03,288,1694703600"; 
   d="scan'208";a="118460377"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 13:11:16 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2EF20D4F5A
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 13:11:14 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A440C8BFE
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 13:11:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 545748647C;
	Thu,  9 Nov 2023 13:11:12 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libio-socket-ssl-perl: upgrade 2.083 -> 2.084
Date: Thu,  9 Nov 2023 12:10:16 +0800
Message-Id: <1699503016-16131-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27986.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27986.002
X-TMASE-Result: 10-0.126200-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrG24YVeuZGmNzLBnoG3Y5dzuR
	oA1LVbPUVLAa8KXwKt4Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl/qzSYnI5VS9lIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz2tQe9MpfrsnVwn
	XzL8iudmXfUlQAwVB01UjBsBgBGct+W8PeVAhLr52QjAqPUiHkv0lezU8wI806+aWNjkRR3Of6Q
	9lDO8twiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 04:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106494

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- various fixes for edge cases and build: #136, #141, #142, #143, #145
- update documentation to reflect default SSL_version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-socket-ssl-perl_2.083.bb => libio-socket-ssl-perl_2.084.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.083.bb => libio-socket-ssl-perl_2.084.bb} (94%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.084.bb
similarity index 94%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.084.bb
index 028d9e916..c4fcc5eb8 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.084.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} += "\
 "
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
-SRC_URI[sha256sum] = "904ef28765440a97d8a9a0df597f8c3d7f3cb0a053d1b082c10bed03bc802069"
+SRC_URI[sha256sum] = "a60d1e04e192363155329560498abd3412c3044295dae092d27fb6e445c71ce1"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.34.1


