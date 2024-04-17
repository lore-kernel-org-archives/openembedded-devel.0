Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6147EC05024
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:49 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2760.1713318101038138639
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o5l1GSiN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318100; x=1744854100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Tm2OMXpNMEgM15NlkBMD5ZpBIung8xE9X9OhUoqXQ74=;
  b=o5l1GSiNZ19HrJgJVB5txEcSvPudTvKXjOxERhON9HbgEAhpHN4f4tr5
   Xa7PsShbbOl8X0R/NpenJNbFq48uXoZboWqxae1rKy3Qkwhwt+CuHqc01
   hWSfj/fZA2CibUtqtWtoWq4077DlIJuh9pxGzfAMWdIf65nryYwJlMUal
   VgSHrzhXG1TsT4kE2MPmIr4pVfkabDjEK0tCQnD2RCzZz7BaG9xVHWXks
   BusbJKUiMEcIKjZu89hKa3gO7RUwdUfgTYTqcom3Ucr1Ck3W6b8CSnWHX
   Kt1GVSIUkeYQFDdo2ajAJrNZuW93H3Zuclv/P9yucwJmMPgbevxiK1dh3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="155233214"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="155233214"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:38 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C0EADE9600
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 04425D4189
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 618EA2007473D
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0D2A61A0002;
	Wed, 17 Apr 2024 09:41:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/49] python3-pydantic: upgrade 2.6.4 -> 2.7.0
Date: Wed, 17 Apr 2024 09:40:44 +0800
Message-Id: <1713318061-17128-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-0.899700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSCOD/YpR7I+Ir6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3FCedixYXzOrmZ6
	gkALoFaixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzW9KUoFGNZq4em1
	Dt6GaguD84yFV4E330gtki32F0d23q2uzXVAyWEUUioDL8gkwjZncj0oTE7fJaw9pteEwnYtwTz
	VKZaH5DiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110019

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.pydantic.dev/latest/changelog/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydantic_2.6.4.bb => python3-pydantic_2.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.6.4.bb => python3-pydantic_2.7.0.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.6.4.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.7.0.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.6.4.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.7.0.bb
index 9c5256412..36ad83527 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.7.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "b1704e0847db01817624a6b86766967f552dd9dbf3afba4004409f908dcc84e6"
+SRC_URI[sha256sum] = "b5ecdd42262ca2462e2624793551e80911a1e989f462910bb81aef974b4bb383"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.34.1


