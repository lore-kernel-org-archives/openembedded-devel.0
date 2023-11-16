Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B03C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:30:16 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2843.1700123406154158986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:30:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="119254317"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="119254317"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:30:03 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D475CE05A9
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:30:01 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1682514FA6
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:30:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id C81D988599;
	Thu, 16 Nov 2023 17:29:59 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 2.4.2 -> 2.5.0
Date: Thu, 16 Nov 2023 16:29:25 +0800
Message-Id: <1700123365-22385-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28000.003
X-TMASE-Result: 10-0.899700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSCOD/YpR7I+Ir6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3FCedixYXzOrmZ6
	gkALoFaixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzRIX37B7WP2+Qbp
	OP8gpCLiJf2ZxtLkvGlrnxOmLss0KxDvkTweBy1UUioDL8gkwjZncj0oTE7fJaw9pteEwnYtwTz
	VKZaH5DiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106796

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.pydantic.dev/latest/changelog/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydantic_2.4.2.bb => python3-pydantic_2.5.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.4.2.bb => python3-pydantic_2.5.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.4.2.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.5.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.4.2.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.5.0.bb
index a83789d97..21be58e08 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.5.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "94f336138093a5d7f426aac732dcfe7ab4eb4da243c88f891d65deb4a2556ee7"
+SRC_URI[sha256sum] = "69bd6fb62d2d04b7055f59a396993486a2ee586c43a0b89231ce0000de07627c"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.34.1


