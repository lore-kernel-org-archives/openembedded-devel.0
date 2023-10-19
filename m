Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEB4CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 08:57:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.23312.1697705827088882877
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Oct 2023 01:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="136764985"
X-IronPort-AV: E=Sophos;i="6.03,236,1694703600"; 
   d="scan'208";a="136764985"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 17:57:05 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A5E75D424F
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 17:57:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D2615D88B7
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 17:57:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D53440FDF;
	Thu, 19 Oct 2023 17:57:00 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] c-ares: upgrade 1.19.1 -> 1.20.1
Date: Thu, 19 Oct 2023 16:56:50 +0800
Message-Id: <1697705810-23266-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27944.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27944.006
X-TMASE-Result: 10--5.508800-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mrVGf/uPixyaG6pZ/o2Hu2YZtX
	hf4dcLJZhJtbBPDn7Jvd+dXlft5oG2VVTHUJ3ZyMAD5jSg1rFtBHnUw0rKeHj0z5vzLEGq8DHho
	x3SVYzz6GctMEqTuN+vKiTskFPt0xAM0/G7XUdeM/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bpJeufcWcz8SnzJabDyshoJCufUhbe6DGbnHu4BcYSmt853YiZBxTIT5xsMd+nEhNReSV
	IvB9SN1hElS9On82DsT+rsRr9rwx07x8xnBqoiCngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIfiAq
	rjYtFiT5deeIpDyQBjM5Q74VwlxSEsNK6YheEfzHAVJjGNj7mX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 08:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105595

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:Update from 1989 MIT license text to modern MIT license text

Changelog:
===========
-Resolve use-after-free issue when TCP connection is terminated before a response is returned
-Reduce number of queries for a load test case to prevent overloading some build systems
-Fix fuzz test build target

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../c-ares/{c-ares_1.19.1.bb => c-ares_1.20.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.19.1.bb => c-ares_1.20.1.bb} (78%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.19.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.20.1.bb
similarity index 78%
rename from meta-oe/recipes-support/c-ares/c-ares_1.19.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.20.1.bb
index 1440d72711..85379dc40d 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.19.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.20.1.bb
@@ -3,10 +3,10 @@ SUMMARY = "c-ares is a C library that resolves names asynchronously."
 HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fdbc58a6da11a9f68aa73c453818decc"
 
 SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https"
-SRCREV = "6360e96b5cf8e5980c887ce58ef727e53d77243a"
+SRCREV = "e8fe27eaa841ed32a4f82bef7a72c4e04e7f86a7"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.34.1


