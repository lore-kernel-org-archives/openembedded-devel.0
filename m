Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76417C27C53
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.10785.1715677830995301832
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CVpCMtN/;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677833; x=1747213833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=20JWmbPi4k5B/ie7px5BqLB9rVqMasLVk6rN937LVVA=;
  b=CVpCMtN/5DMLQfFfnptBa1ViI7jWO4j7bTE2rCxpeJKf6XhcteeFgcBf
   QOZlMvUFfBpm8FnKj/yMcH+gYgKd+1dxLAgGutL9DxX4dmxGUjbnpCFwh
   tUQ0g5cxZF+/lU5Cpw/Lusuo2KNLK/B8vOdWyF2Fw2h858fgsaA42Fhnx
   m2z2TbmT5SHqm1b6KB7efbRyek7D5qsHYkPz1rC77eP601VmcNMVmfEOr
   IcwsCdA3ECHF5kreymqeAo1TdVA9thX0GW+d2IHvtRjCCMbE6H/tlwdcX
   PpluKoXVl5/TlmVDJOjI67+oVpmFmfLiPcuZauklezSi7FUBmX0d+JMyP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="160257818"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="160257818"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:29 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CE83DB624
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 51267BF4AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CB08C70BFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7855B1A000C;
	Tue, 14 May 2024 17:10:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/44] liburing: upgrade 2.5 -> 2.6
Date: Tue, 14 May 2024 17:09:40 +0800
Message-Id: <1715677817-2223-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--0.121000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxM+b8yxBqvA6sU
	VUL5/1Ge+E8K0p0cJ3gxONWxQSnHS7f5rm9ocYyjA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDL5a121o7fBQQ7Cl8sx4HBGw1Uei1O+6/rwSC6qIZ5nkmjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq2ZVuwZ8JJvFyNblbvVa9V3PWhU2+Rf2SJTp1qYT3yVUOdu8
	Y9NXRXmI+DZCYWdST+5i5dfcZIftZDect+hYYjE0zdpKU7TUicdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110355

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add getsockopt and setsockopt socket commands
- Add test cases to test/hardlink
- Man page fixes
- Add futex support, and test cases
- Add waitid support, and test cases
- Add read multishot, and test cases
- Add support for IORING_SETUP_NO_SQARRAY
- Use IORING_SETUP_NO_SQARRAY as the default
- Add support for IORING_OP_FIXED_FD_INSTALL
- Add io_uring_prep_fixed_fd_install() helper
- Support for napi busy polling
- Improve/add test cases
- Man page fixes
- Add sample 'proxy' example

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../liburing/{liburing_2.5.bb => liburing_2.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/liburing/{liburing_2.5.bb => liburing_2.6.bb} (95%)

diff --git a/meta-oe/recipes-support/liburing/liburing_2.5.bb b/meta-oe/recipes-support/liburing/liburing_2.6.bb
similarity index 95%
rename from meta-oe/recipes-support/liburing/liburing_2.5.bb
rename to meta-oe/recipes-support/liburing/liburing_2.6.bb
index 440259ffb..b892ce4ac 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.5.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.6.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only | MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=2b0e9926530c269f5ae95560370195af"
 
 SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https"
-SRCREV = "f4e42a515cd78c8c9cac2be14222834be5f8df2b"
+SRCREV = "f7dcc1ea60819475dffd3a45059e16f04381bee7"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


