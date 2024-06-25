Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381E9C3065B
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:47 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.167250.1719305861734759354
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OAT1lo+w;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305862; x=1750841862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RHL7H7BSMDJOEvcO5UdHtrfYCHMubOJDZjQc8AdiRu4=;
  b=OAT1lo+wYLj+QSVctHVPjNcik0RYnvqGNm03XCkqPeroRBWNXZDFCizc
   lMTVErIF61oZCHAMLgzYv8L9XGvLKV/eeHsR1/jRj+WYyaTDFLxqA0KJc
   tEuW5aPFwa9l2wrnxsHzxgjYWniRyZKHg6IfMmhC84WA19KJfLAJF7qYv
   oi4YE3GtSAU7NT+C7KmoX+1WYek5wFOsJgA104aa/B/Pet8NskRi6xatw
   69KO5k1n3Yty3LJw2Je5yQrSKqyVT3QbK/h2/C7mGfWwyMCnxJQI6zN17
   Q+yiuDv6UufOh9Eeq4dW8MrEER6fVWgjVKNUbv2firU4aiugFALbkSL/y
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164831364"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164831364"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:40 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DEC4FCC152
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3732ED73B6
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C23E82007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6FB2A1A0002;
	Tue, 25 Jun 2024 16:57:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 53/57] python3-types-psutil: upgrade 5.9.5.20240516 -> 6.0.0.20240621
Date: Tue, 25 Jun 2024 16:56:26 +0800
Message-Id: <1719305790-11484-53-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--0.406600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrKQbNb8IwIv3SCgqR50UUhb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AJlr1xKkE5uYMNZlevXKUzaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFEe2r7MqG7HPOg7PE/oT30S/7l
	+4+DMbAaPm6AHCDvORdqZEQ86EK+EJVtwckptyhmgL90Cr9TIn0ZyGi4IQ52CUYqXLYTop0Ox9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111070

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- psutil: deprecate Process.connections
- Bump psutil to 6.0.*

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...5.9.5.20240516.bb => python3-types-psutil_6.0.0.20240621.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_5.9.5.20240516.bb => python3-types-psutil_6.0.0.20240621.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240516.bb b/meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20240621.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240516.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20240621.bb
index d0684ba93..92acdc4fd 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240516.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20240621.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "bb296f59fc56458891d0feb1994717e548a1bcf89936a2877df8792b822b4696"
+SRC_URI[sha256sum] = "1be027326c42ff51ebd65255a5146f9dc57e5cf8c4f9519a88b3f3f6a7fcd00e"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


