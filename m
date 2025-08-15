Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D600ACA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 10:41:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by mx.groups.io with SMTP id smtpd.web10.8858.1755254485947754074
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 03:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=oB5pbHJT;
 spf=pass (domain: intel.com, ip: 198.175.65.17, mailfrom: karn.jye.lau@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755254487; x=1786790487;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vMCOYa52RrGTY8gEqju173+2nlYjATXcyRHwz0qseIY=;
  b=oB5pbHJT1NeQw3KxYBt+G4taXJfJDeB8ZWNtWGQxP6wFAKBDYNPMY8zh
   SP1nOps2k+ZwU+bNhjPZxARiIHkvElXoPK2RiSvkaIUh7aXRnpMVbjPqz
   XlnEa3hyQQjetxCohGWoZFLfl86XAKstnw7J5mFvf2EgmEuTNlpFi6/3z
   29gvB4y7hB1O8yquU+sqVX3PQfO8nM8Au5dJF1c5fSd5tLpqCakD1e2TF
   1vsF1SLg4GZXBuUCwakn3MxtNGOH2XznQFPPiC3r8Kfd8Ab302C4iEyvL
   d6tGwQ6ek9I80enuPoWujml98FxGPuyeF2K/HUXL7pKUMmkhkiMMXfTIk
   w==;
X-CSE-ConnectionGUID: 7hq7ZnWuSHaiV3UCDwFl9Q==
X-CSE-MsgGUID: yqzqZSBkRm+zlPsQbS7VVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57532282"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57532282"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 03:41:26 -0700
X-CSE-ConnectionGUID: Ld6N8QCWQoqZ5tu3RXZbqg==
X-CSE-MsgGUID: csLajkzITOSuChZyOjyHdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="172327144"
Received: from ubuntu-8087.iind.intel.com ([10.49.0.122])
  by orviesa005.jf.intel.com with ESMTP; 15 Aug 2025 03:41:25 -0700
From: karn.jye.lau@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH v2]  [meta-networking][scarthgap][PATCH v2] mbedtls: drop tag parameter from SRC_URI.
Date: Fri, 15 Aug 2025 16:08:38 +0530
Message-Id: <20250815103838.576738-1-karn.jye.lau@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815041114.481650-1-karn.jye.lau@intel.com>
References: <20250815041114.481650-1-karn.jye.lau@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 10:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118972

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


