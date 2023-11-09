Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854ADC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 04:12:52 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.114695.1699503168545703356
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 20:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="127382667"
X-IronPort-AV: E=Sophos;i="6.03,288,1694703600"; 
   d="scan'208";a="127382667"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 13:12:45 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 237D2D4F5A
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 13:12:43 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 66699F928
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 13:12:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FAF086C36;
	Thu,  9 Nov 2023 13:12:41 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] makedumpfile: upgrade 1.7.3 -> 1.7.4
Date: Thu,  9 Nov 2023 12:11:17 +0800
Message-Id: <1699503077-16167-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27986.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27986.002
X-TMASE-Result: 10--1.646800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pm9L28Suig/ixUiJMMML0+y/7QU2czuUNuce7gFxhKa2YkAyCbA7KV2hi9g+8B5G1lIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz3ZOAAnSANyzrbs
	mRaKfI6NF6WvuRFFQeQmY1NEmimS1mBCZTaIWPIxuPefSB0GscftK92VW+EPQznZBUspSWgKuXK
	bABP5wHiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 04:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106495

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Support for kernels up to v6.6
- Support for riscv64 architecture

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{makedumpfile_1.7.3.bb => makedumpfile_1.7.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.7.3.bb => makedumpfile_1.7.4.bb} (96%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.3.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.4.bb
similarity index 96%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.3.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.4.bb
index 0ae691b39..e46dca53a 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.3.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPL-2.0-only"
 
 SRCBRANCH ?= "master"
-SRCREV = "ecc9355e1344d3de94870e855e380ee84224e552"
+SRCREV = "3bc3b3e3be33a9aa040e654f055912063e576c1b"
 
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools = "perl ${PN}"
-- 
2.34.1


