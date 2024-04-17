Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53832C41513
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:49 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.2728.1713318107261032609
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XRGR9aaD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318107; x=1744854107;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vHflB1NOw1djlS4+ya06wA/aJFXIK/KGNHLKfoYfL7Y=;
  b=XRGR9aaDtjpzvG2cewG464kWQu804z6BWnQc5ASxz/Kh5Dv7HeZtWKwr
   jL9PKRW8wiEtyqulRG74XVF752XlLo3io5gk+Te+eM7UTheUIFbTpBUhJ
   FrTejfR84g8N9c2Hy8elI+rO1rAyx2vGYjTDESAcigAbJk4HyZtICVifB
   GkuvfYfwlbDfYvvxdeIM0uxXd4e5oDMP1yKfZF7zOMBhf2Rp9UgWeRlsm
   Rq8RoYFwUhfyDf8WEI9MQZ/jHR0yYLEoj2xsUi7GfMqM1BozUECzfoM8g
   BS6k3VZYF5xWdmTEHeWFWzAUtcORdJrUWLfRlyV7QbbfsJdSTchsNtIqp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="157724960"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="157724960"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:45 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E9AC5E4EB6
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:42 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 25C321660B
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A454F6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 504F51A0002;
	Wed, 17 Apr 2024 09:41:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/49] python3-zopeinterface: upgrade 6.2 -> 6.3
Date: Wed, 17 Apr 2024 09:40:53 +0800
Message-Id: <1713318061-17128-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--1.037000-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mregIHHX2L4Yy9hvLlTMPCgL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AJlr1xKkE5uYMNZlevXKUzYJA
	+HBwSFidhDxwwEbCvLXk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6wu3
	urc5XNbcPmISRrRf6sC7KlacDFFXEZ+Sk9Duxb8nh+9GC31ymYZPuxClI3Pn73ZxC03aRlvk6g0
	rQsn9ZxuiqE7td0Q+aCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110027

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add preliminary support for Python 3.13 as of 3.13a6.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-zopeinterface_6.2.bb => python3-zopeinterface_6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_6.2.bb => python3-zopeinterface_6.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_6.2.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_6.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_6.2.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_6.3.bb
index 70a634a49..21d03f2e7 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_6.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423
 PYPI_PACKAGE = "zope.interface"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "3b6c62813c63c543a06394a636978b22dffa8c5410affc9331ce6cdb5bfa8565"
+SRC_URI[sha256sum] = "f83d6b4b22262d9a826c3bd4b2fbfafe1d0000f085ef8e44cd1328eea274ae6a"
 
 PACKAGES =. "${PN}-test "
 
-- 
2.34.1


