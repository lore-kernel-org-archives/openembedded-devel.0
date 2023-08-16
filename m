Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40F6C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:37:35 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.151938.1692149852287855237
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="128228380"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="128228380"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:37:30 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 07EEBDDC61
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:37:28 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B076D6161
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:37:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F2902FC7919;
	Wed, 16 Aug 2023 10:37:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libtest-harness-perl: upgrade 3.44 -> 3.47
Date: Wed, 16 Aug 2023 09:37:12 +0800
Message-Id: <1692149832-4905-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10--2.484100-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mregIHHX2L4Yzfc2Xd6VJ+ylYM
	JR3dIrh28TU7nJ5DYw57yVwFrd+rZaPBrriYr6d5l2fRVpVyo6SSiza26cvwNG5qTF4tX5r1vqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgPNYQxCOihTNOhR0VsdhRrCkTR
	R+0+D9U5rshU0ckp3uxqf4biFOlkwbcm3b1gDB8N0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtRcDSKgj6IG1kmBIlL8R0LohTdyOXXenCkPJuu2wKblnr+16TnvF5oBVvHgM/gFbsSUDR
	34cnLHLYjd19iQlF3Hmg3M1uJFmBfB4rrR3sJELyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104373

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add missing negation in EINTR check
- Fix HARNESS_PERL_SWITCHES=-I handling in TAP::Harness::Env
- Color the "ok"s as well.
- Skip symlink tests on msys2
- Use use absolute path for executable tests
- Space-quote executable if has spaces
- Avoid using Errno::EINTR directly for platforms without it
- stop calling import on App::Prove plugins
- Avoid using Errno::EINTR directly for platforms without it
- Color the "ok"s as well.
- Skip symlink tests on msys2
- Use use absolute path for executable tests
- Space-quote executable if has spaces

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ibtest-harness-perl_3.44.bb => libtest-harness-perl_3.47.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libtest/{libtest-harness-perl_3.44.bb => libtest-harness-perl_3.47.bb} (98%)

diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.44.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.47.bb
similarity index 98%
rename from meta-perl/recipes-perl/libtest/libtest-harness-perl_3.44.bb
rename to meta-perl/recipes-perl/libtest/libtest-harness-perl_3.47.bb
index 58ca70b9e1..836c9662b9 100644
--- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.44.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.47.bb
@@ -26,7 +26,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=29;endline=30;md5=d41d8cd98f00b204e9800998ecf8427e"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Test-Harness-${PV}.tar.gz"
-SRC_URI[sha256sum] = "7eb591ea6b499ece6745ff3e80e60cee669f0037f9ccbc4e4511425f593e5297"
+SRC_URI[sha256sum] = "bb31cd4aa90ad4e15f32b08476fb5123b4f19ed0cd28a3291242e8858bf986b5"
 
 UPSTREAM_CHECK_REGEX = "Test\-Harness\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.34.1


