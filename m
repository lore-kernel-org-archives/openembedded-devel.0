Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64558C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:23:04 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.17257.1707207774861707378
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DQaFOX3Y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707207775; x=1738743775;
  h=from:to:cc:subject:date:message-id;
  bh=ZL5kYdRhlreTrBFeHwVlb51/JAIGfask0rIIYzXgC2A=;
  b=DQaFOX3YtKCwwZk5HJ2j4Mie02/ftgzbMFiibCy6clNy+fM44Dy+XVeu
   lpthji0SlVrqBKNF4bhL20u1+TWsrA9Z7PhS3So6ZGoPG/Dyzy/B/93t1
   Jpy7Hl2BnSSUgK+djtzS+iIo2fuqtzoChYC0lzCaznT2WNzSAVz9FqyI9
   inQp6bRRPX+vzwiy+YPvRovX1dtOzOlqY7+BTE6LxIKfKZ1196IhtkEwj
   iKTw9NYYYyHMz62HQYGLAiK1o1i1FyS5fXgYw+yI3kxE8rx83DBa4DrUD
   ioN1Z/jbAEJIvW/bBYnB/jTyYthsnqM6vYF/UkdcIpQWqyx8ToH1AiezF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148556823"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148556823"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:22:53 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C82601F71E1
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:22:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 04CAA2169ED
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:22:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 83DDEE2500
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:22:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2582F1A006A;
	Tue,  6 Feb 2024 16:22:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pkcs11-provider: upgrade 0.2 -> 0.3
Date: Tue,  6 Feb 2024 16:16:19 +0800
Message-Id: <1707207379-5447-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--0.725900-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74CCjFOVaqYalaB5jk2TXXjF1+0
	KsXaxWz7i8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFCmxyddCQmeqlXDok9ZKJijsS8
	ppfHL/7BD3vyqB8+g2tOTKT7KDjuSLPEezi7Lq1jHEo8KTZ7Bxpc/gtmJgsAIuGY9oOk8TNex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:23:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108606

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/latchset/pkcs11-provider/releases/tag/v0.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{pkcs11-provider_git.bb => pkcs11-provider_0.3.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/pkcs11-provider/{pkcs11-provider_git.bb => pkcs11-provider_0.3.bb} (91%)

diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.bb b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.3.bb
similarity index 91%
rename from meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.bb
rename to meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.3.bb
index 19412a517..816ee967c 100644
--- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.bb
+++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.3.bb
@@ -16,8 +16,7 @@ DEPENDS = "\
     p11-kit \
 "
 
-SRCREV = "e2abc4a7ae33159f2fb21b9d87a05ea9e79ef584"
-PV = "0.2+git"
+SRCREV = "58040b4e32975cc1d7f39e424ee7b0097cd11311"
 
 SRC_URI = "git://github.com/latchset/${BPN}.git;branch=main;protocol=https"
 
-- 
2.34.1


