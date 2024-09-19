Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF72CE8D55
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.11284.1726716762802514062
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Tt72v8V+;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716764; x=1758252764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=J9UspMbG70EolsGMhmPx4g+nsLmqoNrSo5Ib5aQcekg=;
  b=Tt72v8V+u4OYIeW5aimN+3pfHJdCllFQbccaT+juV0H/A1iQs47K7Dwk
   ahrLuaLMco28ccdyNcMeq+gTQ9Zz624sMKIRK0oPrAfl9rw0j1MdYhvth
   gChdG6lf3WQS5cq76NqM4qo85B+hIlyjj5F4lkdy2V37ZurZ4L7nE4bEC
   UeigWJD05LkK1it6Uja/1wC44Lj/2KmnSc+H8aG8GYL4RPUYUBW4adflE
   hqIGEdQylLONOTMsikBbE1XO5wXFwcOtrr7cAd+E9gvWvVChyjV/+6BZD
   fOt83nF6wyRjMaXwHtdup33FqM0sjPRGbOlaJIfLgSLmsSoqcPe2ddSXN
   Q==;
X-CSE-ConnectionGUID: +gUpSEZ+QK67EkLUcyfSLg==
X-CSE-MsgGUID: t/JubxRBRl6Qe1JBl7w9bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="153125215"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="153125215"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:37 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B1256C3F90
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0643D1035A
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8486C20086EB0
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 25D8E1A000A;
	Thu, 19 Sep 2024 11:32:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/28] python3-psycopg: upgrade 3.2.1 -> 3.2.2
Date: Thu, 19 Sep 2024 11:32:00 +0800
Message-Id: <1726716733-14548-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-3.303400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrAajW+EL+laM4uFD5L+lIbb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKARAhvw8vi5c07QQZa0TcPqCZa7Hlvrixzcg
	13S0qbvaGj97TOaAQoXQP39ooYP1/cjPh0t0a6LDT5lTWfjy3DImU8W0CUSG7+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112387

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Drop TypeDef specifications as string from public modules, as they cannot be
  composed by users as typing objects previously could
- Release Python 3.13 binary packages.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-psycopg_3.2.1.bb => python3-psycopg_3.2.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.1.bb => python3-psycopg_3.2.2.bb} (85%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.1.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.2.bb
similarity index 85%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.2.1.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.2.2.bb
index 09c49c665..f92c55600 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.1.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.2.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "dc8da6dc8729dacacda3cc2f17d2c9397a70a66cf0d2b69c91065d60d5f00cb7"
+SRC_URI[sha256sum] = "8bad2e497ce22d556dac1464738cb948f8d6bab450d965cf1d8a8effd52412e0"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


