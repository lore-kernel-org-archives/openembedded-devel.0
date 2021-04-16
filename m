Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3288.1618535981326503651
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Apr 2021 18:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: iu0NOh0wP7k08iuczP1kDkJLABBHg13ptxL+nkK6FREtrCDJeD1i2ew9ZL7BrGsCPGtlDjIvFp
 /sZ54fvVQ7XA==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="258931576"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="258931576"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 18:19:42 -0700
IronPort-SDR: vtGiuyvUZHB1Gt7P3IqY26W7ttVmFHzQ6Uk7PDL8wuXPC4BDysPq2ZQpOqnqaq057b6wqxRCUE
 fdNUT9TNrmRg==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="421869451"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 18:19:41 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][hardknott][PATCH 3/3] ocl-icd: upgrade 2.2.14 -> 2.3.0
Date: Fri, 16 Apr 2021 09:31:37 +0800
Message-Id: <20210416013137.19613-3-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210416013137.19613-1-naveen.kumar.saini@intel.com>
References: <20210416013137.19613-1-naveen.kumar.saini@intel.com>

Release tag:
https://github.com/OCL-dev/ocl-icd/releases/tag/v2.3.0

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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

