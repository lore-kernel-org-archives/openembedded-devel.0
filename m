Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5463C25B79
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:40 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.10754.1715677838294523173
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=re+01BNp;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677838; x=1747213838;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bmEhmdWWfE59mulysP6MqnffNyJkB50W6pZOYu6V4Wg=;
  b=re+01BNpQKh1FGTmkWPX1Gso679CSTW9gziIt5Z/cBmsNwB080meUj6k
   x+pQmDJNh4Nggipensn25TmDPllfaNz5CtCGkhL9RiWs+ZuVi9lk877Xm
   KzAcXqEq7k3RiLv71s6Uicubz6p5vdlYViIpQrbl3Gbwc5Gx64PEUsbOg
   yhHDQOoR9M1NLkwgUUgf8vGE/RAYow+/QU2BhHGVuBBKug0k7LgpXFGUQ
   eFerdwA3NdZnvquL1WaqZOnPNWGpxI6o8+7+B0nRcKG9xcc6edOHdY4ig
   vZTYLd5kP66Lp19njZG+9wDOs2LP/655+9Z0mdDIVABFed7fZEPl4lyHd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="137077622"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="137077622"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:35 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B0AFE428A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 73158D0D99
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B4F920076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ACDF31A000B;
	Tue, 14 May 2024 17:10:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/44] python3-google-api-python-client: upgrade 2.127.0 -> 2.129.0
Date: Tue, 14 May 2024 17:09:57 +0800
Message-Id: <1715677817-2223-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--1.378900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B+INzkPGTt0cH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOgyKXAUOPYkQQhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzJjnHWUNxIWJs7n
	N9B+/YhoJw5rtwF4jluzvd7vglymy43XKbN97K5YaphTvJ1O0cj8/rNSg7eWJdQGFIyIEw4kA/+
	tYMHJaviB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110371

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t_2.127.0.bb => python3-google-api-python-client_2.129.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.127.0.bb => python3-google-api-python-client_2.129.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.127.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.129.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.127.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.129.0.bb
index 4c9bbc6cf..2517cddd3 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.127.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.129.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "bbb51b0fbccdf40e536c26341e372d7800f09afebb53103bbcc94e08f14b523b"
+SRC_URI[sha256sum] = "984cc8cc8eb4923468b1926d2b8effc5b459a4dda3c845896eb87c153b28ef84"
 
 inherit pypi setuptools3
 
-- 
2.34.1


