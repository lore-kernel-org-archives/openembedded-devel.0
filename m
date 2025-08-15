Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E814ECA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 04:14:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by mx.groups.io with SMTP id smtpd.web11.4681.1755231243216564137
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 21:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=gLcjKXku;
 spf=pass (domain: intel.com, ip: 192.198.163.9, mailfrom: karn.jye.lau@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755231243; x=1786767243;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sdrFYgzo1DbMXNEhnqTcc/JmcCNin2tGZcUS7Y6as3Y=;
  b=gLcjKXkuMVXJfo2sFS3s1Zd+/Oqh2FQOT7nFDaEDtiD6AhPLEiygxIdb
   XFSQypGuvIarQ1LCkqDMr340LjEoIfx+WWuNCTFcJC1P5exolFT2dZIGV
   mtxrHz7pfKA5keL0xi/H9uuyHNE4un/2GhPXNUbFouczcCecFChZvD0Pi
   IaQ13vQgiWGrjEKVD3O5AnN1g/S8AGpCBvQxh24uBmlscMX/fPDAO7xTe
   dq6rIBxQgFDHCbpQ/5eCE8BUQACsCVZVaGemjeBkOElXrZg/JLbow8tK1
   iqVujfER106iiePGmeUBEOxTDKpo61optcRcVV+TUUctRCCSg79s7IIZ+
   g==;
X-CSE-ConnectionGUID: HGQDiTD1S6i97CyuyePOqw==
X-CSE-MsgGUID: zoSycpA+SpGKwSCZV/ioPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68259868"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68259868"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 21:14:02 -0700
X-CSE-ConnectionGUID: 3lubKhnyS6KlZzge/JpQtA==
X-CSE-MsgGUID: SIC64clWQ9anQuwrx89Bsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166416305"
Received: from ubuntu-8087.iind.intel.com ([10.49.0.122])
  by fmviesa007.fm.intel.com with ESMTP; 14 Aug 2025 21:14:02 -0700
From: karn.jye.lau@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH] mbedtls: fix git fetcher conflict by using SRC_URI.
Date: Fri, 15 Aug 2025 09:41:14 +0530
Message-Id: <20250815041114.481650-1-karn.jye.lau@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 04:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118954

From: kjlau0112 <karn.jye.lau@intel.com>

if both SRC_URI & SRCREV specify particular source revision
will lead to "Fix Fetcher failure: Conflicting revisions error"

Fix by removing SRCREV and specify expected source revision in SRC_URI
by adding revision parmater.

Signed-off-by: kjlau0112 <karn.jye.lau@intel.com>
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
index 88b50a406..2591e2cde 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
@@ -23,12 +23,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6;tag=v${PV} \
+SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6;rev=c765c831e5c2a0971410692f92f7a81d6ec65ec2\
            file://run-ptest \
            "
 
-SRCREV = "c765c831e5c2a0971410692f92f7a81d6ec65ec2"
-
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake update-alternatives ptest
-- 
2.34.1


