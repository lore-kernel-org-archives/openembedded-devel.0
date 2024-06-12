Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51996C2BB85
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:57 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2491.1718161125267143248
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fiOXw3+T;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161132; x=1749697132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8wGz9W23FwP8qU7LE7wWHC4T2+1cIi1biqLfiwAOs+s=;
  b=fiOXw3+TgA7fTHM8SkyBOpk8LurCmRNPSWjJ1V+ln5wH81gvaUzeTFSh
   c325chOkArAAUQMk4Gtiqw0JXI73Y08m5LmoFZx6a593tWfCiLDUjuaIb
   FRRrSShWgalATPRwiJxVGyPxe/pVFl7HFrqefKsAmxuNp61DGQGBshmp8
   yyZetwr7Tet6QXcgmhgHInyBVHGNek8Ub4PzVWiPmZsgXi7xSsipxsBXm
   +h9BP4TmaY3PIZ8i1ElLtlTLz8lP+KauZZ3McR2kxC9kYjeiU+TDD04nZ
   NRz7SFlw8LjMLL115vwoUhtH8maEz08VGSbX1oz9A47jL5ncftOFWY2Sj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="162818327"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="162818327"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:50 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C6BACD9223
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:48 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 187A8D4C31
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FD74E2912
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1F9441A000D;
	Wed, 12 Jun 2024 10:58:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/43] python3-stevedore: upgrade 5.1.0 -> 5.2.0
Date: Wed, 12 Jun 2024 10:58:05 +0800
Message-Id: <1718161096-29710-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--4.598300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mryiKgKtIyB4pcliDYiEM+XRR5
	a+OvvOq9vQrOFwtemmFU4ZaPWnopPu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKLOrf5TzZFi8Zg+xMERr0NZeBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNUq2k3whZ8xxpOBUgz58j1ItV3QVDSjzRy57hKcxBJMeNCjAEkFzfjdKdYgsykG4/GObH
	REDw6XZAULb94+zIka/kFIRxk93SzIuZWQlOWCUU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110869

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- pre-commit: Integrate bandit
- pre-commit: Bump versions
- reno: Update master for unmaintained/yoga
- Bump hacking
- Update python classifier in setup.cfg
- Update master for stable/2023.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-stevedore_5.1.0.bb => python3-stevedore_5.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_5.1.0.bb => python3-stevedore_5.2.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_5.1.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_5.2.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-stevedore_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_5.2.0.bb
index ce7179633..7cc0a2e52 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_5.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "a54534acf9b89bc7ed264807013b505bf07f74dbe4bcfa37d32bd063870b087c"
+SRC_URI[sha256sum] = "46b93ca40e1114cea93d738a6c1e365396981bb6bb78c27045b7587c9473544d"
 
 DEPENDS += "python3-pbr-native"
 
-- 
2.34.1


