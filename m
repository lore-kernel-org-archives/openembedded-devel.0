Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.8523.1601544405891402066
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2020 02:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: nhPgQXwiCFdKEhv3e2QlDcQ+QEbc5PCOo49B9tWm6GyIIBX5sMCT7E1ftEQhFhkXZ6aVJ8ysNe
 MgksbLKRGj5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="150463093"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; 
   d="scan'208";a="150463093"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 02:26:45 -0700
IronPort-SDR: Dx6s4RNCkorte8Y68WTBpeZRAbUiPvALmlAr7ZGmEd1DNJOvaHiIeVGsImGlAShHCFNsdz0/kT
 gXMsfjBlypSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; 
   d="scan'208";a="339476106"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga004.fm.intel.com with ESMTP; 01 Oct 2020 02:26:44 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-oe] glog : improve reproducibility
Date: Thu,  1 Oct 2020 17:26:43 +0800
Message-Id: <20201001092643.10205-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

remove WORKDIR info from config file to improve reproducibility

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta-oe/recipes-support/glog/glog_0.3.5.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-support/glog/glog_0.3.5.bb b/meta-oe/recipes-support/glog/glog_0.3.5.bb
index 9a8332836b..56bf515544 100644
--- a/meta-oe/recipes-support/glog/glog_0.3.5.bb
+++ b/meta-oe/recipes-support/glog/glog_0.3.5.bb
@@ -25,3 +25,10 @@ PACKAGECONFIG_remove_riscv32 = "unwind"
 
 PACKAGECONFIG[unwind] = "-DWITH_UNWIND=ON,-DWITH_UNWIND=OFF,libunwind,libunwind"
 PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF,,"
+
+do_configure_append() {
+    # remove WORKDIR info to improve reproducibility
+    if [ -f  "${B}/config.h" ] ; then
+        sed -i 's/'$(echo ${WORKDIR} | sed 's_/_\\/_g')'/../g' ${B}/config.h
+    fi
+}
-- 
2.17.1

