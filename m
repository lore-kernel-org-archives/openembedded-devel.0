Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74C2C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 00:52:44 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.277.1705971158855023231
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 16:52:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146922006"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146922006"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 09:52:36 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CA794DF0E9
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:52:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0EAB6D88BB
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:52:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 91D1E20079DF4
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:52:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1DCDA1A006A;
	Tue, 23 Jan 2024 08:52:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ccid: upgrade 1.5.4 -> 1.5.5
Date: Tue, 23 Jan 2024 08:48:28 +0800
Message-Id: <1705970908-24302-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10-2.443200-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yaoXHZz/dXlxe7Z0UyQO5TMyKRnX9xPs4KTz
	q4wH3yI2aV5RRANvkG4jwTnkarfxrj13WcdbGR6Quce7gFxhKa3Vy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYrVnVnu9zwYNK6km+od/UDxZNYSHk3Zr0ZbRfsVvs4VIMoh6scCF9jG0Y6
	nVCni+GFjkSH9LOiJWob1DKCF544GtYv/FAmebjp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMOqL1M5REwlDvSB/suAH9aWMbV5YC2a+nn8iji7waaMTZ56H3Yn4+n5h/3oabP+yXoMuww
	ghe6WfUOeiroO38AefxKJtl//LlBgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 00:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108379

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Add-build-rule-for-README.patch
refreshed for 1.5.5

Changelog:
============
- Add support of
  - Alpha-Project ANGARA Token
  - Broadcom Corp 58200 (idProduct: 0x5864)
  - Broadcom Corp 58200 (idProduct: 0x5865)
  - Imprivata USB CCID
  - KAPELSE eS-KAP-Ad
  - Kapelse inSide
  - KAPELSE KAP-Care
  - KAPELSE KAP-eCV
  - KAPELSE KAP-GO
  - KAPELSE KAP-LINK2
  - Kapelse KAP-Move
  - Kapelse Ti-Kap
  - rf IDEAS USB CCID
  - SIMHUB pcsc reader
- support Kapelse readers on macOS (composite as multislot)
- Some other minor improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ccid/ccid/0001-Add-build-rule-for-README.patch  | 13 ++++++-------
 .../ccid/{ccid_1.5.4.bb => ccid_1.5.5.bb}           |  2 +-
 2 files changed, 7 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/ccid/{ccid_1.5.4.bb => ccid_1.5.5.bb} (85%)

diff --git a/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch b/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch
index 46d30e8c1..0904207bb 100644
--- a/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch
+++ b/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch
@@ -1,24 +1,23 @@
+From c82680a21c7411ba63e5815786eeb471720faa29 Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+Date: Wed, 6 Nov 2019 20:10:09 +0800
 Subject: [PATCH] Add build rule for README.
 
 fix do_configure error:
 Makefile.am: required file `./README' not found
 
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
----
-Upstream-Status: Pending
 
+---
  Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 49574a3..a5a7c2a 100644
+index e77c4c4..fd77ecd 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -26,3 +26,4 @@ libtool: $(LIBTOOL_DEPS)
+@@ -27,3 +27,4 @@ libtool: $(LIBTOOL_DEPS)
  ChangeLog:
  	git log --stat --decorate=short > $@
  
 +README: README.md
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/ccid/ccid_1.5.4.bb b/meta-oe/recipes-support/ccid/ccid_1.5.5.bb
similarity index 85%
rename from meta-oe/recipes-support/ccid/ccid_1.5.4.bb
rename to meta-oe/recipes-support/ccid/ccid_1.5.5.bb
index e53ffa40b..e76881916 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.5.4.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.5.5.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://ccid.apdu.fr/files/ccid-${PV}.tar.bz2 \
     file://0001-Add-build-rule-for-README.patch \
 "
 
-SRC_URI[sha256sum] = "6e832adc172ecdcfdee2b56f33144684882cbe972daff1938e7a9c73a64f88bf"
+SRC_URI[sha256sum] = "194708f75fe369d45dd7c15e8b3e8a7db8b49cfc5557574ca2a2e76ef12ca0ca"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


