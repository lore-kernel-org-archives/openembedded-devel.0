Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9131C47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:20:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.2736.1700122802512680154
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:20:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="128213126"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="128213126"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:19:59 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8DDC5D9DAD
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:19:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D42BBDA22B
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:19:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B46E70B02;
	Thu, 16 Nov 2023 17:19:55 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-mypy: upgrade 1.6.1 -> 1.7.0
Date: Thu, 16 Nov 2023 16:18:34 +0800
Message-Id: <1700122714-22172-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrBgA+oehWZhGU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa0BQOqUsWgx5oFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJvM5xCaUKyucfZZBcVi9/vC3K3OYFgojnfLW
	ZjS7J3knTlypCuRoo4sHxGhokJD4hR84hKK/LOaTDLFA7hLXQTkOiqi0PYVub+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106792

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/python/mypy/blob/master/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mypy_1.6.1.bb => python3-mypy_1.7.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_1.6.1.bb => python3-mypy_1.7.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.6.1.bb b/meta-python/recipes-devtools/python/python3-mypy_1.7.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-mypy_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-mypy_1.7.0.bb
index fe9e3e386..432cefcbf 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_1.7.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8d62fd8f8648cb018e52857347e340b9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4d01c00d09a0be62a4ca3f933e315455bde83f37f892ba4b08ce92f3cf44bcc1"
+SRC_URI[sha256sum] = "1e280b5697202efa698372d2f39e9a6713a0395a756b1c6bd48995f8d72690dc"
 
 BBCLASSEXTEND = "native"
 
-- 
2.34.1


