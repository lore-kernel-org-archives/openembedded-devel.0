Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17011C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:59:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.11889.1700624066579353772
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 19:34:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Z/a79wnG;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: wen.yan.tan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700624066; x=1732160066;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ThmkaVhYC6AHLAp0LM8CYmgVGUmqpG7j/mriJkVckwI=;
  b=Z/a79wnGa8kypA5fTWHpS0ea0uxcojV2jO6GNYJPTpen5ZCUplRgXeBb
   4UklsGyy5P97fVwChyEi0CLFqoWn273Mb37WXFD0AsudKXjnwyVd6lhqd
   T7+eJMpPkhG7Vfk9mdbdjt1Oop1onSpk4T7BPZk1xxnddByh4o6q5onFZ
   qQMnqUoGlmX6gteuKNCcI+x9U29OoxkZn8kOBZvyhwFC9LOq2Uy3aNX2f
   ZjqyhVIoUSdLrIx0RuBDHln/vc9j0WXB1RcMmgtNwUPJww8e8KH37WbOt
   cVFDY840e2XdkF6KiuDaXpVJLYW1o3XpTe2SexNkjMNU26RAl8wgFdHZu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="456304224"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="456304224"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 19:34:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="743246784"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="743246784"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 19:34:25 -0800
From: "Tan Wen Yan" <wen.yan.tan@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [mickledore][meta-oe][PATCH] libvpx: upgrade 1.13.0 -> 1.13.1
Date: Wed, 22 Nov 2023 11:14:24 +0800
Message-Id: <20231122031424.2640910-1-wen.yan.tan@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 12:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107009

From: Benjamin Bara <benjamin.bara@skidata.com>

Changelog:
=========
This release contains two security related fixes. One each for VP8 and
VP9.

- Upgrading:
  This release is ABI compatible with the previous release.

- Bug fixes:
  https://crbug.com/1486441 (CVE-2023-5217)
  Fix to a crash related to VP9 encoding (#1642)

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tan Wen Yan <wen.yan.tan@intel.com>
---
 .../webm/{libvpx_1.13.0.bb => libvpx_1.13.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.13.0.bb => libvpx_1.13.1.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.13.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.13.1.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.13.0.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.13.1.bb
index 79b330c31..ffcc8f1c9 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.13.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.13.1.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-SRCREV = "d6eb9696aa72473c1a11d34d928d35a3acc0c9a9"
+SRCREV = "10b9492dcf05b652e2e4b370e205bd605d421972"
 SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=main \
            file://libvpx-configure-support-blank-prefix.patch \
            "
-- 
2.37.3


