Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD4FC05051
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:16 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.682.1689654363908940538
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="112602069"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="112602069"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:06 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BC5EFCD7E5
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E93D9BF496
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:03 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A36520077821;
	Tue, 18 Jul 2023 13:26:03 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] bats: upgrade 1.9.0 -> 1.10.0
Date: Tue, 18 Jul 2023 12:25:14 +0800
Message-Id: <1689654348-30702-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--7.123200-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxM+b8yxBqvA36y
	x7OFE28Q1jypNY0wtaavpQIAMDw+amj+Msn9Q6Vo7mKHF4YtTaYyEsj9PwyDJf7qnoNCn/h4OcY
	/jkDGKiJiEemAhFOO66DOp3LAnVbn/ayzaxBypN5ntEdzQBf3IbJyu9jGj0qnXU4B+rpt6K7p7g
	A7OZdlFYMJ44zfEcf7xiiH+oQX+1UBOHW58ozCWk7nLUqYrlslFIuBIWrdOeOU8ftiyKjZrSGOn
	vl4tWofF9I3HgybRyEyh2C7EeKtCx8TzIzimOwPC24oEZ6SpSkj80Za3RRg8IHCu0vI+sDHPCuS
	pelANat/DbzwMDuFTF3CDjisIM5qwACmbLFOQ7c=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103903

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Added:
-----------
 add ${BATS_TEST_TAGS[@]} for querying the tags during a test (#705)
 print tags on failing tests (#705)
 test for negative arguments to --jobs (#693)
 add tests for --formatter cat (#710)
 test coverage in CI (#718)
 Support for rush as alternative to GNU parallel (#729)
 add bats_pipe helper function for run that executes \| as pipes (#663)
 publish docker images to ghcr.io (additionally to Dockerhub) (#740)

Fixed:
---------
 fix run with options overwriting the value of i (#726, #727)
 fix ${BATS_TEST_NAMES[@]} containing only --tags instead of test name since Bats v1.8.0 (#705)
 fix run --keep-empty-lines counting trailing \n as (empty) new line (#711)
 fix short flag unpacker creating bogus command lines with valued flags (#732)
 fix formatter becoming confused with retries (#734)
 fix --gather-test-outputs-in fails on tests with / (#735)
 fix overriding date breaks --timing (#736)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-test/bats/{bats_1.9.0.bb => bats_1.10.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-test/bats/{bats_1.9.0.bb => bats_1.10.0.bb} (93%)

diff --git a/meta-oe/recipes-test/bats/bats_1.9.0.bb b/meta-oe/recipes-test/bats/bats_1.10.0.bb
similarity index 93%
rename from meta-oe/recipes-test/bats/bats_1.9.0.bb
rename to meta-oe/recipes-test/bats/bats_1.10.0.bb
index 015bc42f82..0fb624e0da 100644
--- a/meta-oe/recipes-test/bats/bats_1.9.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.10.0.bb
@@ -10,8 +10,8 @@ SRC_URI = "\
   git://github.com/bats-core/bats-core.git;branch=master;protocol=https \
   "
 
-# v1.9.0
-SRCREV = "6636e2c2ef5ffe361535cb45fc61682c5ef46b71"
+# v1.10.0
+SRCREV = "f7defb94362f2053a3e73d13086a167448ea9133"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


