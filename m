Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF36BCA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 11:01:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by mx.groups.io with SMTP id smtpd.web11.9013.1755255694303317778
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 04:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=PwWrdUgy;
 spf=pass (domain: intel.com, ip: 192.198.163.19, mailfrom: karn.jye.lau@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755255694; x=1786791694;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/NHc0cq0h7aqdEurmVUS41sMYi+YzxL25jDLy+ELWUs=;
  b=PwWrdUgylCIqhQ+bvfTCvVe+uf1yRT7dIHPUjmfGfQNuDMy0HvN1oVbA
   Co6CJpZwto/zA7xQriGYJSJXqFQuuDYIhS5Pes42grGObJVrnaL88Srz5
   zzXi1zh94l2p+U+j2ZDSOn2xzaVJtHkrVnj5pmkh/4AKLbfVUTCad/VQQ
   GGQFakjwDQbEKtrBaLIcMUU+/5IIR6MB9jyHrhSniX5kLLDrBvAaICJfB
   DmrnJ8rYTpSDeRtwfOnlVamksVW/fz+TzIa1eFDSomWiUCxXZ9aosQ6Ny
   PBPjDRjQ8aC02R0mjdvTy5G/6Egft1uR8dp6Wl5BYPN4gEX8BJsB6ziq3
   g==;
X-CSE-ConnectionGUID: p/qZ+nycR/6bdiIYgkLrfQ==
X-CSE-MsgGUID: 7foWFC4wSRukRu9+KTJD2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="56600579"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="56600579"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 04:01:32 -0700
X-CSE-ConnectionGUID: s8MlSiaWRmSU7bjDXEcP2Q==
X-CSE-MsgGUID: BkCldK0SQueMb118maKFJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166627310"
Received: from ubuntu-8087.iind.intel.com ([10.49.0.122])
  by orviesa009.jf.intel.com with ESMTP; 15 Aug 2025 04:01:32 -0700
From: karn.jye.lau@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH] mbedtls: drop tag parameter from SRC_URI.
Date: Fri, 15 Aug 2025 16:28:44 +0530
Message-Id: <20250815105844.584334-1-karn.jye.lau@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 11:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118974

From: kjlau0112 <karn.jye.lau@intel.com>

Keep SRCREV and remove tag paramater to avoid
Fix Fetcher failure: Conflicting revisions error

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


