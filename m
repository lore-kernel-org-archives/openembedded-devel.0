Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6548EEB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 08:32:41 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.2832.1689150757739592901
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 01:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=LLEYsKiN;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689150757; x=1720686757;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UfYXfGnc6XVvo1hjX3KJ2S9CZ0dyJ+qdU1nenZBjAj8=;
  b=LLEYsKiN1rBNHj6IquRavLOLiteNyXx7UNlmB6y6RDVPa50X8ll0rGqf
   U4D/T7WyBTXWoxAwGgJ+24swMYSLfXg3pdUPcqSlPLxNEAY0NhTLXaUdq
   KZV+OTes/reIThAKc/CFDUhcBpMkXWKiQHj40RUrq2To/cHUF8hJV7V+I
   xV0z040bwrAjOlb5APZx0WB+ttoXEu8N1Z5WUw2WLcDAQ8qw/TiwxoEUF
   nYSbfe28Dpzeci6bagl9adU2Rnc+sV+GH7ZkMUIQ/3dshaOITSixjunja
   junh4EqLBLvQjQ+m2gcee17g6nR0KB5lFWjHQobXv/5ercy7kJkLS91ea
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="367455067"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="367455067"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 01:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="811490591"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="811490591"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Jul 2023 01:32:36 -0700
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][mickledore][patch] tcpdump: upgrade 4.99.3 -> 4.99.4
Date: Wed, 12 Jul 2023 16:20:56 +0800
Message-Id: <20230712082056.2247827-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 08:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103837

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Source code:
----------------
  Fix spaces before tabs in indentation.
Updated printers:
-----------------
  LSP ping: Fix "Unused value" warnings from Coverity.
  CVE-2023-1801: Fix an out-of-bounds write in the SMB printer.
  DNS: sync resource types with IANA.
  ICMPv6: Update the output to show a RPL DAO field name.
  Geneve: Fix the Geneve UDP port test.
Building and testing:
----------------------
  Require at least autoconf 2.69.
  Don't check for strftime(), as it's in C90 and beyond.
  Update config.{guess,sub}, timestamps 2023-01-01,2023-01-21.
Documentation:
-------------
  man: Document TCP flag names better.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry-pick from 2e782260d0b6018614dbdea95899a4a0921915e0)
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../tcpdump/{tcpdump_4.99.3.bb => tcpdump_4.99.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.3.bb => tcpdump_4.99.4.bb} (93%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
similarity index 93%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
index 03f1b76f97..803a9bb5f5 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
@@ -26,7 +26,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528a169315e499c6861952e73b3"
+SRC_URI[sha256sum] = "0232231bb2f29d6bf2426e70a08a7e0c63a0d59a9b44863b7f5e2357a6e49fea"
 
 UPSTREAM_CHECK_REGEX = "tcpdump-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.37.3


