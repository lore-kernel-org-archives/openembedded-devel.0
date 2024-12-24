Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EA8C02188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.30362.1735032443247103847
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VGa3FY7l;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032444; x=1766568444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WpD+iIrTtxJ5F7u6IJjNxcoiesOpIG5lQUqVe6bw6k8=;
  b=VGa3FY7lJpeDY/9cva2D8zmgMXQSm3Q/g61f2QXFsMrKdrbahg6+rWb2
   An9z4LPpqOyZL0vfSOmNx61PJqHfrkA3b6LP23gSm3nRiD1lP3wx74WgF
   8XsE5nBihwca1cSxVKMMCw2LYMl9srVtXqZHVaOYZ+cZril0TxhfX2tBx
   hAYkMYSxcxvopDRF9Z+5+UTFTudexUPl8UiN9HhUOV9Dl4k48n7FMYdbI
   Xv+KxapA1cE1U2HwaiSnQtaXQjVpvEx3jD+2BZ4RaehEJ6fOkDrS4Bxvg
   DoFkGs/0t6S4hrzPowFbc42DU9kjL2WDJ2z+w6d5u7ZT8LT4nE9s+sr3F
   w==;
X-CSE-ConnectionGUID: 9XJEY6P3SNGT9osWlTbN+A==
X-CSE-MsgGUID: WiihK5FZSEC0XrJ2+4dbwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="187212818"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="187212818"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:22 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C5856D480A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CCECBDC92
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C07920071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D67ED1A0071;
	Tue, 24 Dec 2024 17:27:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/67] python3-fastnumbers: upgrade 5.1.0 -> 5.1.1
Date: Tue, 24 Dec 2024 17:26:18 +0800
Message-Id: <1735032421-13513-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-0.250400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SHFzlAwf0TCVm/7i250pUYLYPd9v8CWrCtRsovzgpTqCula
	5mIXg/mVLSckPIjXTnO3PFHnpGvg/nz1pViO1DuFtuV3qb83bAS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114498

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Add support for Python 3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-fastnumbers_5.1.0.bb => python3-fastnumbers_5.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastnumbers_5.1.0.bb => python3-fastnumbers_5.1.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.0.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-fastnumbers_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb
index 01aa8b3b44..28ef40fa05 100644
--- a/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d32431d1b650010945da4e078011c8fa"
 
 PYPI_PACKAGE = "fastnumbers"
 
-SRC_URI[sha256sum] = "e092d33f8b95c3171a2fb34e579efe0c54b0290dd7f96ffaa2762437601d90a7"
+SRC_URI[sha256sum] = "183fa021cdc052edaeede5c23e3086461deb7562b567614edf71b29515f5fa4b"
 
 inherit pypi setuptools3
-- 
2.43.0


