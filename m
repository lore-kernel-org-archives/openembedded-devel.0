Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB83C88CBD
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:40:53 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.3850.1686620445585807759
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="120353189"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="120353189"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:43 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C0F0DA68A
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A4BFED4BEA
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:40 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2097D20074732;
	Tue, 13 Jun 2023 10:40:40 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libqb: upgrade 2.0.6 -> 2.0.7
Date: Tue, 13 Jun 2023 09:39:55 +0800
Message-Id: <1686620422-29962-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--1.408700-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvIgofMgahPrRoO
	mEkHfdoeyZBYIAXGfgOmmCZmjD3OP/mEPaHBc5dLVV4ZZmbE3Yxn+nORkVeaVEz5vzLEGq8Dqpc
	0qSXG1reng9t5QPCRN8zVnE1oQDqo08q9KSsUtVd85pjA/x1xftDEMPvvoocv5Odr5qUTSwvE41
	Bh6hF6cTqJxBQRpm2JNn7OBNk0UqnzhOfJXqrCRO9kW9mxCQvtYU4M4UEhdYrfUZT83lbkEIIPF
	ubbBVyA+7QcRaVoa8n/tdOuViNvuC/7QU2czuUNuce7gFxhKa3zndiJkHFMhPnGwx36cSE1IY6e
	+Xi1ah/tAdDE/EtBJIAy6p60ZV62fJ5/bZ6npdjGVuWouVipcopCpL/PaaSUkWh9otS9vOie5AL
	euSwJDwczFrPVcKjwsSA9tF+6RWhEWzBBWk4KNTn4iKkjqoPqWpNDnpXsR47En714ldmbbv6/2/
	nZkihaOgB/fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103223

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
lib: Fix some small bugs spotted by newest covscan (#471)
ipc: Retry receiving credentials if the the message is short (#476)
timer: Move state check to before time check (#479)
tests: Close race condition in check_loop (#480)
blackbox: fix potential overlow/memory corruption (#486)
tests: Make ipc test more portable (#466)
tests: cleanup the last of the empty directories (#467)
doxygen2man: Fix function parameter alignment (#468)
tests: Fix tests on FreeBSD-devel (#469)
test: Remove gnu/lib-names.h from libstat_wrapper.c (#482)
tests: allow -j to work (#485)
Update -version info for 2.0.7
Add --disable-tests option (#475)
configure: Modernize configure.ac a bit (#470)
spec: Migrate to SPDX license (#487)
add simplified chinese readme (#474)
m4/ax_pthread.m4: update to latest upstream version (serial 31) (#472)
strlcpy: avoid compiler warning from strncpy (#473)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/libqb/{libqb_2.0.6.bb => libqb_2.0.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libqb/{libqb_2.0.6.bb => libqb_2.0.7.bb} (93%)

diff --git a/meta-oe/recipes-extended/libqb/libqb_2.0.6.bb b/meta-oe/recipes-extended/libqb/libqb_2.0.7.bb
similarity index 93%
rename from meta-oe/recipes-extended/libqb/libqb_2.0.6.bb
rename to meta-oe/recipes-extended/libqb/libqb_2.0.7.bb
index ce3606d77..9123e0a4c 100644
--- a/meta-oe/recipes-extended/libqb/libqb_2.0.6.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_2.0.7.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
 
 inherit autotools pkgconfig
 
-SRCREV = "758044bed5f615c90818aa5431d00303288888e5"
+SRCREV = "06c8641de2e1fef1fc6026709fb2109fbbb79d79"
 SRC_URI = "git://github.com/ClusterLabs/${BPN}.git;branch=main;protocol=https \
           "
 S = "${WORKDIR}/git"
-- 
2.34.1


