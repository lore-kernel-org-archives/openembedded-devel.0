Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C63CD4F57
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 10:32:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.18715.1695378725216412263
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 03:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=HA3wcExw;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695378725; x=1726914725;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zDyzLe7Cgq9grAVf7fBLB7qb5JofMtwX/UMeGmJdxVI=;
  b=HA3wcExw0wKueGHuBSriQ3MpXmdjgufNPJ5nMFpquOixhGwWllGTiRB3
   YLAk3iade7h1cLNw2vlu9WZMa/tXTZW3ZLv9UUzulh3ZZDzMbm0gzl8EQ
   c13zgmgnzVttY09LDRwbY0Ctm6jihXCjoTDaiPXze1RB2XI3OBr9ZR4R7
   +QGOZvsmrw7wfKe05cH8DPTAQMVWFXWnWJr4tibLCf3MtwXwlv7DThavw
   faxdF3QBLu+dxhP8HzCruYtud4m7unTK19cvc8Jbf44vl1L7q/TuVqETX
   f7wrKMRKq708AvFe0pIUjSboHLPTvX9RvBIXXjuoGkoApu5ZsEXVxgyuu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="371118368"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="371118368"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 03:32:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="747479616"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="747479616"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga002.jf.intel.com with ESMTP; 22 Sep 2023 03:32:03 -0700
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] ntpsec: 1.2.2 -> 1.2.2a
Date: Fri, 22 Sep 2023 18:12:26 +0800
Message-Id: <20230922101226.3967519-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 10:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105055

From: Lee Chee Yang <chee.yang.lee@intel.com>

Fix a crash in ntpd if NTS is disabled and an NTS-enabled client request
(mode 3) is received. (CVE-2023-4012) #794

https://gitlab.com/NTPsec/ntpsec/-/releases/NTPsec_1_2_2a

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../ntpsec/{ntpsec_1.2.2.bb => ntpsec_1.2.2a.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.2.bb => ntpsec_1.2.2a.bb} (98%)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
similarity index 98%
rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.2.bb
rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
index d11ada67ee..af41d4989d 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
            file://0001-wscript-Add-BISONFLAGS-support.patch \
            "
 
-SRC_URI[sha256sum] = "2f2848760b915dfe185b9217f777738b36ceeb78a7fc208b7e74e039dec22df5"
+SRC_URI[sha256sum] = "e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2aea118a62f0a3226950e"
 
 UPSTREAM_CHECK_URI = "ftp://ftp.ntpsec.org/pub/releases/"
 
-- 
2.37.3


