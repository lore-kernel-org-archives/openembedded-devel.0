Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F79C05023
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:38 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2755.1713318086965173611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dd4IgDLg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318089; x=1744854089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+owgf9nGuO+fZA0jT8wWs8ezh2TPvzK4Mc0OJFS8pyM=;
  b=dd4IgDLg3oVAogH49zFsh+dAJ0hLM+8uNFx77qFaZ/QslHL74xkSolna
   8VKQ+pqr/oy95gyu+eZSJoaZniXsQKlCgWANLy4k4u2t24SnxjoBhfKTO
   FRaC04wKW+vBt/5GHG5p8hdbLJRV+ESEbQu0Xwn1xe7XnhiKT7TfLlGO8
   7QvTWa3ZmKMB3resEXQ1j//qDmDHI0UVUr/6/7EPWoeU+zucTpRz30KDi
   BATpEpmr9E8BDhf+pjqHU1N7psihlspxhfm+3zV4WPgx3Zs7rg5k1E8BB
   Bqg3ngT9L+a9Fzushn6b5IwMVdDmo1UcuxdrPM0fxKf7h6nPZ3Bw97t6l
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="134609846"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="134609846"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:27 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F3B1AE9611
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 35A0FD419A
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A3974200932D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 510A71A0002;
	Wed, 17 Apr 2024 09:41:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/49] python3-aiohttp: upgrade 3.9.3 -> 3.9.4
Date: Wed, 17 Apr 2024 09:40:28 +0800
Message-Id: <1713318061-17128-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--3.526300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BuTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6ALq
	g5pLL+CRcpIy38QUPHV5EU9Ocurosn1zXAFh7Vmh3x5RqDOdPINIlb+6n9yhiWBS03rgIVTZfDC
	TDd9jaOEVHZ9FdVusuCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110002

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/aio-libs/aiohttp/releases/tag/v3.9.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiohttp_3.9.3.bb => python3-aiohttp_3.9.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.9.3.bb => python3-aiohttp_3.9.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.9.3.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.9.4.bb
index 10a3085ef..1cfed0d7a 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "90842933e5d1ff760fae6caca4b2b3edba53ba8f4b71e95dacf2818a2aca06f7"
+SRC_URI[sha256sum] = "6ff71ede6d9a5a58cfb7b6fffc83ab5d4a63138276c771ac91ceaaddf5459644"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.34.1


