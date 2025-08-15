Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E477CCA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 10:52:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by mx.groups.io with SMTP id smtpd.web10.9037.1755255139943903184
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 03:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=FpLVkS3Q;
 spf=pass (domain: intel.com, ip: 198.175.65.16, mailfrom: karn.jye.lau@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755255140; x=1786791140;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vMCOYa52RrGTY8gEqju173+2nlYjATXcyRHwz0qseIY=;
  b=FpLVkS3Qkrzz+nHwShonwTcT0Y9quFgoGOSZgAlqGYSdpXaVA8cGlLn1
   m/KQDyp5he+CCceXTfJR98zbeZUO+uYlNRJRTBQRKB5y8h1mygJO6srSj
   sP6Q6K9N2O6ZYQVmOoxKTLF0x7e8om9clAO9lOfI2Tq0u5KF1NSlJiGFG
   SD8nD2AxRZKnujURSnMuBO4eAQRgj216XP6rFtQkRl1VbidAWxxPG2Vsn
   6M1tz/KeoL9+4epO/RcNoKkS//ki/B2Lthnv0lu5uYKQU8/O9accb/2Z6
   bTuWOFRMoSJa/qusnYL3g2mB0bAMwWY5TvyyIBy9uDky9+ZXu3qZhNHNZ
   g==;
X-CSE-ConnectionGUID: LfSs/Oc6TQavm0vHTZVs6Q==
X-CSE-MsgGUID: 1bZhjWmJQAqhqVWp5L2fnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57726488"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57726488"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 03:52:19 -0700
X-CSE-ConnectionGUID: avBlaFjmT5ujcU5VfPCeyw==
X-CSE-MsgGUID: e1IvFu7+TPKKUAI68XeLPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171120103"
Received: from ubuntu-8087.iind.intel.com ([10.49.0.122])
  by fmviesa003.fm.intel.com with ESMTP; 15 Aug 2025 03:52:18 -0700
From: karn.jye.lau@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH v2]  mbedtls: drop tag parameter from SRC_URI.
Date: Fri, 15 Aug 2025 16:19:32 +0530
Message-Id: <20250815104932.580839-1-karn.jye.lau@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815041114.481650-1-karn.jye.lau@intel.com>
References: <20250815041114.481650-1-karn.jye.lau@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 10:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118973

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


