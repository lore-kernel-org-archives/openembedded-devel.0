Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50711C54E73
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:16 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.8146.1710827170200132909
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ofMhR5GE;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827170; x=1742363170;
  h=from:to:cc:subject:date:message-id;
  bh=HEgxgSO2FDIQN+S7EHAS1Gvr/r2eiwyIi+kam4YJ8U0=;
  b=ofMhR5GECL0Z+UPLYtxqKlA0tXnKaqPYTp3bHCbVijMPaXG89F+BkLBs
   Pkt/Cl5sYOBU3oRP4qKU1tjmBdQ/uPNuLnTIO/JWNX3LCciqnxyWoVmT8
   nQi4Oy/W5tImX2MEhl8voui41ZYSiMn/Nbz4PZs9UjuwXvhpdcJc0KnwQ
   9ksN5nHxuOFd/p4EGv++jRBS3eh7JI/ZV0jefSzMGovxW9G91kai1eq/H
   xzp07TqXW04g0WDRqIL+ZL8OJTiY6Bn/2Ud/ZR8QRrZ49jlSaOIoWU3fe
   XOYBrinR8Ce/J610ANrWSAQJxzOcp/suPKK5KZ5fQPBp0e9BOCTjr13+a
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="140303077"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="140303077"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:45:57 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id ADC4EFBD8D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:45:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E10B6D5A02
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:45:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 713F8227A98
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:45:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1A4961A006B;
	Tue, 19 Mar 2024 13:45:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/50] boost-sml: upgrade 1.1.9 -> 1.1.11
Date: Tue, 19 Mar 2024 13:44:50 +0800
Message-Id: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-3.379000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrWq/snXbxpCCU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KV6B5jk2TXXjFIy/
	Fg1mRnqLtAdDE/EtBJIAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzDPW2EdOdbpsoJg
	YppdKJ+J7CwNcTYp+MrdzpjZdddmKlrZHje8wWM59Bxi6T2HU07VGgrUpVTiXWYQfMU1cngSWpB
	flgzCariB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109421

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Bug Fixes
---------
MSVC typename

Additions
--------
[performance] switch as defult dispatch_policy

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../boost-sml/{boost-sml_git.bb => boost-sml_1.1.11.bb}       | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-support/boost-sml/{boost-sml_git.bb => boost-sml_1.1.11.bb} (92%)

diff --git a/meta-oe/recipes-support/boost-sml/boost-sml_git.bb b/meta-oe/recipes-support/boost-sml/boost-sml_1.1.11.bb
similarity index 92%
rename from meta-oe/recipes-support/boost-sml/boost-sml_git.bb
rename to meta-oe/recipes-support/boost-sml/boost-sml_1.1.11.bb
index 378be1a8e..a48195a15 100644
--- a/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
+++ b/meta-oe/recipes-support/boost-sml/boost-sml_1.1.11.bb
@@ -8,10 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 DEPENDS += "boost qemu-native"
 
-PV = "1.1.9"
-
 SRC_URI = "git://github.com/boost-ext/sml.git;protocol=https;branch=master"
-SRCREV = "751b6f10b73c086e0e8850a7ef5b5aea2136831b"
+SRCREV = "b7df6180d20422b2724d26007aebb24066f2a6a9"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


