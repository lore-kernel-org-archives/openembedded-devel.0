Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582A7CAC5B3
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 03:59:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by mx.groups.io with SMTP id smtpd.web10.4828.1758686369007389432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 20:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ZM9zK8TI;
 spf=pass (domain: intel.com, ip: 192.198.163.13, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758686370; x=1790222370;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fFZRODLkWHCIAZiuDbkyPuIec+5BvkJUyTsDky0rJJM=;
  b=ZM9zK8TIkVSwS6vi7wXROnnTl5Vc0PCfWKOJixAXqBkXJenxu7/WAf1D
   u2ioyB3CAal7xU/6TFZXjXtv7QazHt28j5cUyXxYGmoJDT48fHFfdEOyq
   np1N4jhZ6fjLlXlMAcj1/r9pbWRmLI6iUj8sXzx/0KeRr/cw5/8iRxXk+
   2RcZlaXsRyFNtaHkSEzFvjiOOxWGKf0O4NbFqQpJK4ZZ8CmrrKhmy/8+E
   mG73SXdvprovbj9tRaKbJuIPzteqHQ2dagNtM2XUO6V6gdCO6wtqpyqCs
   UoR7i26Mp9Y5OOy3RnIG6sWO5ooYrl5RlTyHJy+7kyqVDdgBrQLl9AIRy
   Q==;
X-CSE-ConnectionGUID: Z/xynesbSdiOujS/MAZweg==
X-CSE-MsgGUID: duZefU36TlWGsnQChh0lzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63602891"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="63602891"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:59:30 -0700
X-CSE-ConnectionGUID: wVSF4vt8SSSzZan8HsEBtw==
X-CSE-MsgGUID: U2ozUXBlQzejWAGefDFS9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="176873674"
Received: from unknown (HELO anmitta2-mobl4.png.intel.com) ([10.107.11.67])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:59:30 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 3/8] ckermit: Fix build with GCC-15
Date: Wed, 24 Sep 2025 11:59:18 +0800
Message-ID: <20250924035923.35477-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924035923.35477-1-anuj.mittal@intel.com>
References: <20250924035923.35477-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 03:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119743

From: Khem Raj <raj.khem@gmail.com>

Also fix native pieces to build with gcc-14 while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f8ece969ea279f37938a54e6d8c01e9937753f03)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-support/ckermit/ckermit_302.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/ckermit/ckermit_302.bb b/meta-oe/recipes-support/ckermit/ckermit_302.bb
index 1ee776cefe..e9c3a53e38 100644
--- a/meta-oe/recipes-support/ckermit/ckermit_302.bb
+++ b/meta-oe/recipes-support/ckermit/ckermit_302.bb
@@ -28,7 +28,7 @@ do_compile () {
     # The original makefile doesn't differentiate between CC and CC_FOR_BUILD,
     # so we build wart manually. Note that you need a ckwart.o with the proper
     # timestamp to make this hack work:
-    ${BUILD_CC} -c ckwart.c
+    ${BUILD_CC} -DMAINTYPE=int -c -o ckwart.o ckwart.c
     ${BUILD_CC} -o wart ckwart.o
     ./wart ckcpro.w ckcpro.c
 
@@ -45,7 +45,8 @@ do_compile () {
         -DNORESEND -DNOAUTODL -DNOSTREAMING -DNOHINTS -DNOCKXYZ -DNOLEARN \
         -DNOMKDIR -DNOPERMS -DNOCKTIMERS -DNOCKREGEX -DNOREALPATH \
         -DCK_SMALL -DNOLOGDIAL -DNORENAME -DNOWHATAMI \
-        -DNOARROWKEYS -DMAINTYPE=int"
+        -DNOARROWKEYS -DMAINTYPE=int \
+        -D_DEFAULT_SOURCE -ansi"
 }
 
 do_install () {

