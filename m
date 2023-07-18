Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DA6EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:06 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.728.1689654365248241595
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124851867"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124851867"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:02 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B964CA1EE
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B9F3FD5C25
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:25:59 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4835120077821;
	Tue, 18 Jul 2023 13:25:59 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hiredis: upgrade 1.1.0 -> 1.2.0
Date: Tue, 18 Jul 2023 12:25:07 +0800
Message-Id: <1689654348-30702-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--7.909000-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrKQNhMboqZlqfHrjLA9DhZorq
	nYTxkVFKnB+UaJ2C9Q7dMSs2eAqjrVR/KlnDpLSlKsurITpSv+Nr2qJoNIuCjbwHu+XsbkzRYxq
	mcULrxebV4q36S0NEz9351eV+3mgb1w4ROForRsYD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpixwb6oUXQPLL78JjBSyJrod0KiTeJteVBfS0Ip2eEHnwj/1Rbkzl1EwuTL
	po5HEc1joczmuoPCq1j+fRYqRUugR9q8TKE/0KIKD7JqLviZ5wwbf/0AuLZ62TeOWm6Fbz8
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103897

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
##New Features

- Add sdevent adapter
- Allow specifying the keepalive interval
- Add RedisModule adapter
- Helper for setting TCP_USER_TIMEOUT socket option

##Bug Fixes

- Fix a typo in b6a052f.
- Fix wincrypt symbols conflict
- Don't attempt to set a timeout if we are in an error state.
- Accept -nan per the RESP3 spec recommendation.
- Fix colliding option values
- Ensure functionality without '_MSC_VER' definition

##Maintenance

- Add a test for the TCP_USER_TIMEOUT option.
- Add -Werror as a default.
- CI: Update homebrew Redis version.
- Fix typo in makefile.
- Write a version file for the CMake package
- CMakeLists.txt: respect BUILD_SHARED_LIBS
- Cmake static or shared
- fix typo
- Add a test ensuring we don't clobber connection error.
- Search for openssl on macOS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../hiredis/{hiredis_1.1.0.bb => hiredis_1.2.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/hiredis/{hiredis_1.1.0.bb => hiredis_1.2.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.1.0.bb b/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/hiredis/hiredis_1.1.0.bb
rename to meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
index b3814afc71..d081242736 100644
--- a/meta-oe/recipes-extended/hiredis/hiredis_1.1.0.bb
+++ b/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     git://github.com/redis/hiredis;protocol=https;branch=master \
     file://run-ptest \
     "
-SRCREV = "c14775b4e48334e0262c9f168887578f4a368b5d"
+SRCREV = "60e5075d4ac77424809f855ba3e398df7aacefe8"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


