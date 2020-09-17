Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web12.7787.1600313865253338376
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 20:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: S8nc4GvFCdk1mRp81SYAx7R7zfNnlvj0Bp2Z5DVD6gCLau8MP95MSsUPWsZqyaPQWPrfnoGDEU
 ITZvxR8XAFGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="139623858"
X-IronPort-AV: E=Sophos;i="5.76,434,1592895600"; 
   d="scan'208";a="139623858"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 20:37:44 -0700
IronPort-SDR: PXNWB3YKY0/zwMIKZu9L2+VO4mdrBxE/B3IAziIqkj2olFn3YS10Uh6az9f2Mo7Lq7uwVhOfGO
 NE5Jf2pnTQNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,434,1592895600"; 
   d="scan'208";a="307297771"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga006.jf.intel.com with ESMTP; 16 Sep 2020 20:37:43 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] tbb: upgrade 2020.2 -> 2020.3
Date: Thu, 17 Sep 2020 11:37:40 +0800
Message-Id: <1600313860-14122-1-git-send-email-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.7.4

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta-oe/recipes-support/tbb/{tbb_2020.2.bb => tbb_2020.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tbb/{tbb_2020.2.bb => tbb_2020.3.bb} (97%)

diff --git a/meta-oe/recipes-support/tbb/tbb_2020.2.bb b/meta-oe/recipes-support/tbb/tbb_2020.3.bb
similarity index 97%
rename from meta-oe/recipes-support/tbb/tbb_2020.2.bb
rename to meta-oe/recipes-support/tbb/tbb_2020.3.bb
index 2f9fd7f58..e66d23f0b 100644
--- a/meta-oe/recipes-support/tbb/tbb_2020.2.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2020.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://software.intel.com/en-us/tbb"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 BRANCH = "tbb_2020"
-SRCREV = "60b7d0a78f8910976678ba63a19fdaee22c0ef65"
+SRCREV = "eca91f16d7490a8abfdee652dadf457ec820cc37"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
            file://cross-compile.patch \
            file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
-- 
2.17.1

