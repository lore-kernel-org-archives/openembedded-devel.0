Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.9792.1591260783897635526
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2020 01:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: CWN7nRIi2WlITQLypgE0MfrHE+7sIJkYbsOjOPnJ2quXDcZOfmq/dgFTz43HELdZqGso/GvR+8
 FnYkhlvO1rNg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 01:53:00 -0700
IronPort-SDR: waZiOQ5eorc3wVZwmQrRClGBp2qy+epKvHbGBXcjDF18fnWd/IAZxliEwniT7vvdXaXybwV70f
 C1IKOCcRfmZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,471,1583222400"; 
   d="scan'208";a="269350764"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by orsmga003.jf.intel.com with ESMTP; 04 Jun 2020 01:52:57 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] ocl-icd_git.bb: Add recipe for OpenCL ICD loaders
Date: Thu,  4 Jun 2020 16:59:45 +0800
Message-Id: <20200604085945.10990-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1

This recipe creates package which aims at creating an Open Source
alternative to vendor specific OpenCL ICD loaders.

Signed-off-by: Min Ma <min.ma@xilinx.com>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta-oe/recipes-core/ocl-icd/ocl-icd_git.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-core/ocl-icd/ocl-icd_git.bb

diff --git a/meta-oe/recipes-core/ocl-icd/ocl-icd_git.bb b/meta-oe/recipes-core/ocl-icd/ocl-icd_git.bb
new file mode 100644
index 000000000..d14ec53e3
--- /dev/null
+++ b/meta-oe/recipes-core/ocl-icd/ocl-icd_git.bb
@@ -0,0 +1,19 @@
+SUMMARY = "OpenCL ICD library"
+DESCRIPTION = "Open Source alternative to vendor specific OpenCL ICD loaders."
+
+# The LICENSE is BSD 2-Clause "Simplified" License
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=232257bbf7320320725ca9529d3782ab"
+
+SRC_URI = "git://github.com/OCL-dev/ocl-icd.git;protocol=https"
+
+PV = "2.2.12+git${SRCPV}"
+SRCREV = "af79aebe4649f30dbd711c1bf6fc661eac6e5f01"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+DEPENDS = "ruby-native"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

