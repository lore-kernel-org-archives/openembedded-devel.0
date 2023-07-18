Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD29CC04FE2
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:16 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.732.1689654367382477511
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124701690"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124701690"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:05 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E76ABDDC62
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2595CBF4A9
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:02 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AF16020077821;
	Tue, 18 Jul 2023 13:26:01 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libinih: upgrade 56 -> 57
Date: Tue, 18 Jul 2023 12:25:11 +0800
Message-Id: <1689654348-30702-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10-1.167000-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrBPY4SegK3jx4YeSlHZYFohIP
	baRMZ6zxIgWiNOpLpMfGKIf6hBf7VQE4dbnyjMJaTuctSpiuWyUUi4Ehat05499RlPzeVuQQ1vZ
	7s3YIVDI3lq3YEgY6JmFp9qfciji9TvHzGcGqiIKeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNUCb06LTIZZdToCcaFywoKeJKS7taF7oYRVx1v8hrrbrVx8hGIm83g256NFKDERvahi7Z
	Em+lvzcMDFzQkPG6mqZlJ72eRJ7G4JXtKB2OUbbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103902

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
MSVC throws C4244
Added a GetUnsigned function for getting unsigned values.
meson.build: fix start-of-line_comment_prefix variable name
Added GetInteger64 and GetUnsigned64 to read 64-bit integers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/inih/{libinih_56.bb => libinih_57.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/inih/{libinih_56.bb => libinih_57.bb} (88%)

diff --git a/meta-oe/recipes-support/inih/libinih_56.bb b/meta-oe/recipes-support/inih/libinih_57.bb
similarity index 88%
rename from meta-oe/recipes-support/inih/libinih_56.bb
rename to meta-oe/recipes-support/inih/libinih_57.bb
index 89d68c6e16..08957e18fb 100644
--- a/meta-oe/recipes-support/inih/libinih_56.bb
+++ b/meta-oe/recipes-support/inih/libinih_57.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a7a95d2af90376e85a05318794e6f202"
 SRC_URI = "git://github.com/benhoyt/inih.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-SRCREV = "5e1d9e2625842dddb3f9c086a50f22e4f45dfc2b"
+SRCREV = "9cecf0643da0846e77f64d10a126d9f48b9e05e8"
 
 inherit meson pkgconfig
-- 
2.34.1


