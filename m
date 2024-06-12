Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EECC41513
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.2482.1718161116950932583
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OfY8wGMw;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161117; x=1749697117;
  h=from:to:cc:subject:date:message-id;
  bh=Nt6IG2yNOsNxrM2XAuiuo/ewp/o9KPc4miQIsHbAXcc=;
  b=OfY8wGMwzk/k74dizyhObhKi/x95fzP4C0D/HRxVVtH9KEzVUdzM22fX
   3VnHn6HmrgzXaUH/keOGP7UfynJr656jiGkCdwmNFkxKdsYSUI93PE226
   zgwoJl5CmHvQZY6JkYwOFRPEGWeSB06eoHQ0bMw4K6Xe6TJLlN2c9SX0K
   OQN3NO+hGt/zZCEfTC0XIIK6s2AbI1bSqhHPkUIk+o4L7S72yJ+Pq6QjN
   CoWgCuJepTjRXTnWoy1lfChtt1oSwa46z3000CECxifMTboW3d1GGhu2D
   +o1RhlQvxGU3u8ZUqNGJriL7uVY5Q75AZVzn3M/2uYwpYGSMxK1PtzC3i
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="141806704"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="141806704"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:35 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 24790C68E5
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 65BF4D50E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D3CADE290B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7AB131A0002;
	Wed, 12 Jun 2024 10:58:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 01/43] python3-anyio: upgrade 4.3.0 -> 4.4.0
Date: Wed, 12 Jun 2024 10:57:34 +0800
Message-Id: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrBgA+oehWZhE+++3dUGxY376p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXIgjynFhEG7V5POPcaZvIYAIgg3Ix4cx7Rwev
	cwqFJcrCdxFqFK+BMm7WnWmEvZj3LzxFEs5IA/fn7oj8O7AHcmCzFDa3JtynH+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110838

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://anyio.readthedocs.io/en/stable/versionhistory.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-anyio_4.3.0.bb => python3-anyio_4.4.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.3.0.bb => python3-anyio_4.4.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.3.0.bb b/meta-python/recipes-devtools/python/python3-anyio_4.4.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-anyio_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.4.0.bb
index 2c7a9f8ca..28c76cbf5 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f75253795a87df48568485fd18cdd2a3fa5c4f7c5be8e5e36637733fce06fed6"
+SRC_URI[sha256sum] = "5aadc6a1bbb7cdb0bede386cac5e2940f5e2ff3aa20277e991cf028e0585ce94"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.34.1


