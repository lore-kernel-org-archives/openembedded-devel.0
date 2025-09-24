Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 485FACAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 03:59:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by mx.groups.io with SMTP id smtpd.web10.4828.1758686369007389432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 20:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=VuxUI3aU;
 spf=pass (domain: intel.com, ip: 192.198.163.13, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758686369; x=1790222369;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=YrbEetweU3jA8yYBY/jW9D6i5kXoqwMsoCBHDCevBck=;
  b=VuxUI3aUeS1X9SQY9VDry3RvKmmNfAbC1yLpQ8UNOdwDX/BA2EoEmQvO
   NEcE116wDbmBef4Od9t6l64QCy/GYjxDw4Cr47DI1h5q4X0TaUBfj5y2r
   k6Evd4HnBp318DZWcK+pHycai3LDv68JZXq0pQVODBR4dNKxx/DJ6M31S
   ZlXFJTBcgCwKEbFmOZ7ZwMbAtOXuOFfx/ZEvJvylhkzTtc9yb5r1fNivR
   iuTr6bk12HwoBCJI6myXtjXodD+13awOl4RlM47g72QMCMCZiieoeNbGA
   TcXIRPMosILPWq0SxWwRIbVS5d/m9ZLO83TdSWgVPFUunWm83guM6cl6t
   g==;
X-CSE-ConnectionGUID: thBXQUSET4OoYPClA1Dhlw==
X-CSE-MsgGUID: lhLVdkxXRqGLw+PY/AxVpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63602890"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="63602890"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:59:29 -0700
X-CSE-ConnectionGUID: As9Je19hQdmrkG2jKuoO9w==
X-CSE-MsgGUID: B1QYp0+hTJenRE07o5CzTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="176873668"
Received: from unknown (HELO anmitta2-mobl4.png.intel.com) ([10.107.11.67])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:59:29 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/8] ckermit: Define return type for main
Date: Wed, 24 Sep 2025 11:59:17 +0800
Message-ID: <20250924035923.35477-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924035923.35477-1-anuj.mittal@intel.com>
References: <20250924035923.35477-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 03:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119742

From: Khem Raj <raj.khem@gmail.com>

Newer compilers e.g. clang19+ will treat implicit function prototypes
as errors, therefore define main() with a valid return type

Fixes
ckwart.c:531:1: error: return type defaults to ‘int’ [-Wimplicit-int]
  531 | main(argc,argv) int argc; char **argv; {
      | ^~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9813fb56d22acad36d70158335b8ee9f4a05ad89)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-support/ckermit/ckermit_302.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/ckermit/ckermit_302.bb b/meta-oe/recipes-support/ckermit/ckermit_302.bb
index 53f2b9d2c5..1ee776cefe 100644
--- a/meta-oe/recipes-support/ckermit/ckermit_302.bb
+++ b/meta-oe/recipes-support/ckermit/ckermit_302.bb
@@ -45,7 +45,7 @@ do_compile () {
         -DNORESEND -DNOAUTODL -DNOSTREAMING -DNOHINTS -DNOCKXYZ -DNOLEARN \
         -DNOMKDIR -DNOPERMS -DNOCKTIMERS -DNOCKREGEX -DNOREALPATH \
         -DCK_SMALL -DNOLOGDIAL -DNORENAME -DNOWHATAMI \
-        -DNOARROWKEYS"
+        -DNOARROWKEYS -DMAINTYPE=int"
 }
 
 do_install () {

