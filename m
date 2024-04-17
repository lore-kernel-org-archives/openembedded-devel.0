Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E3DC04FF8
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.2752.1713318084653750276
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R9iTsO1y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318096; x=1744854096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=961/K8qSyMkm0rkIw4ORVLKVGRgHz59X8f0Yb9zlRLE=;
  b=R9iTsO1yQYnIQWG3/Cd8+tYB3F5aNy0Jq/cbeRwGUghM/R9xHzN9KC8Z
   SWK+9tWEDRck3jv7emWB7Sipsxs9+GHYUlJCmVWoVqHzb6YCHA23UlYtX
   I6pDRLW0+F18Jr5BCJcL3vAKHqA/GlkLwFPWZzH1ui+IRj3XMgRsfoHJu
   kDUPI952C+BYRgaNuCWr+Bmt1TJyjHLe2P+MGRLUSIuQ7ybFhMGrHYwRq
   1rTtkQLtCwT2nPHEhCdX1kSnW2WX0mVbobSwKxGy7zpIEIlWxAqErjdOZ
   rGZVIwuNLfS7FygiGowJmlw1OpTRJ17GP2seJcSlSmgv0yu9TdRcuqWMQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="155837368"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="155837368"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:35 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A219C107D2C
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D30E5FD90A
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 66B74200932D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 135541A0002;
	Wed, 17 Apr 2024 09:41:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/49] python3-javaobj-py3: upgrade 0.4.3 -> 0.4.4
Date: Wed, 17 Apr 2024 09:40:38 +0800
Message-Id: <1713318061-17128-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--4.651300-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrJScvOTX4jHPcflby/TtXpDnG
	P45Axioi5/gG8CUYdisNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl5GUF3NhJu3iqbs
	+nJ/tFJFyh61BFhJvUsV7aFLwD4J7WJLwyeGJcWnDaEYvM/SzDvioIsi7Sa0g6Yep/pka8JHW9n
	uzdghUMnp5QGOMb8EgLmth8cTQ473lRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs+xJg
	KdAQEb/fLu2TAY1iN8g5PhAbBtvXRHGcBDc6DfCbrrEMg7o1fIS1TLZufSBCQwwAl31qO9YZaER
	2rxsFY1F2iqnC+F7UIgeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110010

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Added support for java.lang.Class arrays
-Fixed marshalling of JavaByteArrays
-Tests ran with pytest manually on Python 2.7, 3.6-3.12

License-Update:
 type of LICENSE changed to "ASCII text, with CRLF line terminators"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-javaobj-py3_0.4.3.bb => python3-javaobj-py3_0.4.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-javaobj-py3_0.4.3.bb => python3-javaobj-py3_0.4.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.3.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.3.bb
rename to meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.4.bb
index 5555a1256..d71101ee2 100644
--- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.4.bb
@@ -5,9 +5,9 @@ DESCRIPTION = "python-javaobj is a python library that provides functions\
  representation is a standard data interchange format in Java world."
 HOMEPAGE = "https://github.com/tcalmant/python-javaobj"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
 
-SRC_URI[sha256sum] = "38f74db3a57e9998a9774e3614afb95cb396f139f29b3fdb130c5af554435259"
+SRC_URI[sha256sum] = "e4e3257ef2cf81a3339787a4d5cf924e54c91f095a723f6d2584dae61d4396ed"
 
 inherit pypi setuptools3
 
-- 
2.34.1


