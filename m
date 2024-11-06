Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88ECD29F8A
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:23 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.40028.1730874678229447641
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t+Ubac8Q;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874679; x=1762410679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/p9gNImS8c1vN4eX0B5PYv/NEUd3CN33Fa/Dppgp6i8=;
  b=t+Ubac8Q+MDnbMINqSzzW7JsufL7GuF8I7vNGYVmO6Gw7fkc65uWUEcd
   KMtjQ3lvcDyuukLkoocMWbVLvz+CslT7B3U2C2ETO7cqzwdoBrW2Wwuq2
   t80lZxouGtbC0LYir4WFNbPyAGA7NGOoeaFd00DtygClPvb6DkNtYOJcS
   nlMS3aG0tSnHix7My1AJPyy52VgL32ugbxdO9Bn8qXtOF0Lp62T3ayE91
   vyqmacHky1i2XBlikc0mTe+BZfNKE2ldGZwSuI7IiOb/uMdj9FwJ9MXF4
   do94JmbmZK3+OyKggzsshqFX9mb8wYC5boBhlIFNWXiJ1Lkjcx1To/+i0
   w==;
X-CSE-ConnectionGUID: Do2H2YGET0aM5RKdYUNjog==
X-CSE-MsgGUID: A/upbqt5QgqR5IuvZ8vWIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="158275412"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="158275412"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:17 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FA44DB3C9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 97C67CFA5D
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F09E20071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D2A381A000A;
	Wed,  6 Nov 2024 14:31:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/46] python3-anyio: upgrade 4.6.0 -> 4.6.2
Date: Wed,  6 Nov 2024 14:30:30 +0800
Message-Id: <1730874660-2364-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-2.031400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwg8a+/GjoiAqr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKSzzikUG20BinnoZbTNWGiU3txK9RcRv+7Fa
	REdnGYXClLdQFdLoYqBcfGW2axDpnaD8wIQqUja5TMfT3YI2OhmQKzUWQ8yhz+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113701

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed regression caused by (#807) that prevented the use of parametrized async fixtures
- Fixed TaskGroup and CancelScope producing cyclic references in tracebacks when raising exceptions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-anyio_4.6.0.bb => python3-anyio_4.6.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.6.0.bb => python3-anyio_4.6.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.6.0.bb b/meta-python/recipes-devtools/python/python3-anyio_4.6.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-anyio_4.6.0.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.6.2.bb
index 57f071251..231a7fb87 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.6.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "137b4559cbb034c477165047febb6ff83f390fc3b20bf181c1fc0a728cb8beeb"
+SRC_URI[sha256sum] = "f72a7bb3dd0752b3bd8b17a844a019d7fbf6ae218c588f4f9ba1b2f600b12347"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.34.1


