Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.10023.1618323947689472882
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Apr 2021 07:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: JJrGc0KPqdU4lhbyvnPYTzcHFoFn+uwDYRhU4293dQW6OrTrvLHSO7xra46b1V1awDqvPoIuE9
 fTnozVuZs41g==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="214903750"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="214903750"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 07:25:46 -0700
IronPort-SDR: siKqFWly2fF4KO+NvHfCUfw9i776iQfr7rAHXwbVGjttmtcxIX4mQFsUMqIHX+jNJqjwWdA8KM
 bgCir2+6e1lQ==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="424275192"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 07:25:44 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] ocl-icd: upgrade 2.2.14 -> 2.3.0
Date: Tue, 13 Apr 2021 22:37:44 +0800
Message-Id: <20210413143744.11165-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1

Release tag:
https://github.com/OCL-dev/ocl-icd/releases/tag/v2.3.0

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../recipes-core/opencl/{ocl-icd_git.bb => ocl-icd_2.3.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-core/opencl/{ocl-icd_git.bb => ocl-icd_2.3.0.bb} (84%)

diff --git a/meta-oe/recipes-core/opencl/ocl-icd_git.bb b/meta-oe/recipes-core/opencl/ocl-icd_2.3.0.bb
similarity index 84%
rename from meta-oe/recipes-core/opencl/ocl-icd_git.bb
rename to meta-oe/recipes-core/opencl/ocl-icd_2.3.0.bb
index 2e43939b9..d94e4c2f0 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_git.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.0.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1238d5bccbb6bda30654e48dcc0a554b"
 
 SRC_URI = "git://github.com/OCL-dev/ocl-icd.git;protocol=https"
 
-PV = "2.2.14+git${SRCPV}"
-SRCREV = "109694ef2686fe25538c05f3c856912f8ef571a9"
+SRCREV = "59c098b6b1f97a339e3e5308499aee6538ecea40"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

