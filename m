Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE2ECA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 10:31:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by mx.groups.io with SMTP id smtpd.web11.8630.1755253882438295287
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 03:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=PVRs0Wve;
 spf=pass (domain: intel.com, ip: 198.175.65.20, mailfrom: karn.jye.lau@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755253883; x=1786789883;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vMCOYa52RrGTY8gEqju173+2nlYjATXcyRHwz0qseIY=;
  b=PVRs0Wvenq2wJyF6TU2b69Vf6cwYMZIagiShevvTHOBYvJ5vW/7U+Myc
   hCSDCc8tjEyN00BJzkf4K8dw9vLhWJZi4DkSArQuMJ3CFeTeZDFOhsbF7
   X6hTskJ5SLzlJyUfvg1/OpftxoDk9gV6ldSVobIZA4U33ke//d3YC3e+I
   Af/CQ4IQVn+rGHsxdyLOO7CpArb3O7h8A7UyFSEpMOHh1m0Yc2AuaJWZp
   DPRCQTEjWCioyQ1PxyYi/hbJ0xvWJ4/kamMYPy8HRuWGuTY4P5RXydPU7
   Xt5g5KqqmtNs3kdsxNXbC29ei8QRLGTGFFkaDj2zUwkH8pVj1MgJxCvxd
   A==;
X-CSE-ConnectionGUID: XaP53GZ7QnKj/6mCYHpRsQ==
X-CSE-MsgGUID: MgdntoyeQE6Ouluo3XFBgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57290003"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57290003"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 03:31:22 -0700
X-CSE-ConnectionGUID: xpUmAHBiQ1SCTs85hGgAXQ==
X-CSE-MsgGUID: lzB/EaP4T9KYR8iN8t/Hvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="204167570"
Received: from ubuntu-8087.iind.intel.com ([10.49.0.122])
  by orviesa001.jf.intel.com with ESMTP; 15 Aug 2025 03:31:22 -0700
From: karn.jye.lau@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH v2]  [meta-networking][scarthgap][PATCH v2] mbedtls: drop tag parameter from SRC_URI.
Date: Fri, 15 Aug 2025 15:58:34 +0530
Message-Id: <20250815102834.572976-1-karn.jye.lau@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <AS1PR10MB5697DACCAF2B06BE08BF72ACFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <AS1PR10MB5697DACCAF2B06BE08BF72ACFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 10:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118971

From: kjlau0112 <karn.jye.lau@intel.com>

[v2] Keep SRCREV and remove tag parameter from SRC_URI as per review
feedback.

Signed-off-by: kjlau0112 <karn.jye.lau@intel.com>
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
index 88b50a406..91adf6f5a 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6;tag=v${PV} \
+SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6;\
            file://run-ptest \
            "
 
-- 
2.34.1


