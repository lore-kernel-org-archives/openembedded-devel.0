Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D2AC7EE2E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:58:17 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.6216.1684997896268261365
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="117964477"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="117964477"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:58:15 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E0368D772B
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FE52D3F35
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:11 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 980182007CA8E;
	Thu, 25 May 2023 15:58:10 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websocket-client: upgrade 1.5.1 -> 1.5.2
Date: Thu, 25 May 2023 14:58:00 +0800
Message-Id: <1684997886-2137-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
References: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10--1.945300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqx4YeSlHZYFosLc
	MUuTFJzBxKW+WHy87Ic486vsentZ7+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKLOrf5TzZFi8Zg+xMERr0NZeBzEkCCpnRndCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqt86bXUa8N6Qyh+TEP0w7ob1rCtVOWMxMvjrR16v3ZdF448dPYjLsTxXlLi
	Ox5QojOdkx7po8vs1gL8ZyBpF7ZdcX/LZduUzYMHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102834

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
  - Add typehints (#908)
  - Fix pytype errors (#906)
  - Fix args passed to logging function (#898)
  - Standardize PEP 3101 formatting (c6a445f)
  - Add more verbose exception for unsuccessful handshake for #900

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...socket-client_1.5.1.bb => python3-websocket-client_1.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.5.1.bb => python3-websocket-client_1.5.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.5.1.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.5.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.5.2.bb
index 41d469cf1..742a9389b 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.5.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b969e9612325987c823fc0737063ebc8"
 
-SRC_URI[sha256sum] = "3f09e6d8230892547132177f575a4e3e73cfdf06526e20cc02aa1c3b47184d40"
+SRC_URI[sha256sum] = "c7d67c13b928645f259d9b847ab5b57fd2d127213ca41ebd880de1f553b7c23b"
 
 inherit pypi setuptools3
 
-- 
2.34.1


