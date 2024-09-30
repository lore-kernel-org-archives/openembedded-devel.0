Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6C9CF6491
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:48 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.48954.1727682221179355815
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QE0slOis;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682221; x=1759218221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4/LO2YMBYf9L7VsXCufkX3IvpQWxHhADUBbHbEMDyHU=;
  b=QE0slOis0xPwBQ7W54lCW70fH9cm6Ev9loYlaejXT0u72ZfaqE3qdh3D
   M4XrnMFeTI5PcbmEMB9e+/AkjjsIBnPOBGtjTSMWCYGh7Ufxu3GPgtsRN
   muoIgVKX4hSEJvGw9g24f8PQIOzpQwenIGq4m89Re+e0YsAM4/DF1GbYt
   jilmuI8mF051rADE9GixGWDS8C9myCZR2VWBZIAkSWxMvGQiAwZ3FKGla
   cK8eGGNzJlRPreIcC5BfOZOW4c5b3gxAJIGGNRrhZmyEbOfqe96I3M6CT
   OcHfhWuT6UG60lCfQpJl6MXX+I3Y3po6YSXiWFC3uxE5AcdD8UtcpuY59
   A==;
X-CSE-ConnectionGUID: D1TBXsz6QZ+7WjbdHQ5h8A==
X-CSE-MsgGUID: 7j9yTwPzSsutVDk/DnbQhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="154116632"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="154116632"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:39 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 51646D800A
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8DCB0D73B3
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E3BC6B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D4F601A000A;
	Mon, 30 Sep 2024 15:43:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/40] python3-cantools: upgrade 39.4.5 -> 39.4.8
Date: Mon, 30 Sep 2024 15:42:42 +0800
Message-Id: <1727682185-12664-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-0.690700-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrdwX/SSKrKHjqWOQST6GEB3MW
	fmr8UEU8WmMnPB+kSbIF2sTxhdnLLmrs+r6+nS7OfOaYwP8dcX51TaBc8Zmm53tzXL7lPwD/FsL
	CADAFxVDPz9CYF+mMT3Uu7PS8tlw47VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5DubQ
	rtuRQMog1RxwBNHJ3UBhQWw3lZ+IWXBXaJoB9JZxRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs5on8
	stW6E7EAH1br+XmcfcPJkE5cezJiv1x46jwngUoBakCRUcb6oGsF4fAC3ujdQmEVpwrLFXAR/lT
	B+SSEEospUf31sv/WIgeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112573

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Enable cache via env variable and improve cache key
- Add test and type annotations for LongNamesConverter
- monitor: case insensitive filtering
- fix ruff linter errors
- Skip dumping KCD version if unset
- Update ruff config
- fix errors raised by recent versions of ruff
- Fix bug in DBC short names conversion
- monitor: fix crash while decoding message with bad length

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_39.4.5.bb => python3-cantools_39.4.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_39.4.5.bb => python3-cantools_39.4.8.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_39.4.5.bb b/meta-python/recipes-devtools/python/python3-cantools_39.4.8.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_39.4.5.bb
rename to meta-python/recipes-devtools/python/python3-cantools_39.4.8.bb
index f4f16c155..da4f3b493 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_39.4.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_39.4.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "594f2ae80deadb8c6b08e8e1322d42e258f40d42c80d6886d84e0143f90b5a23"
+SRC_URI[sha256sum] = "933803afe97de91d927053b027e2a165e4ce891abf8e42d6b409a7b7dfefa80d"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.34.1


