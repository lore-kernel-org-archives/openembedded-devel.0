Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.14185.1591940602049791376
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 22:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: FAGn29kSgJEIjzhm32oFApWf5RRZbhFWpnzhfN+IEB1uOP1KIk6HdYOwNaF8fuC7GJnu9oPWAQ
 ZGbkWHmtwCug==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 22:43:20 -0700
IronPort-SDR: KzxS3KxkhP+jLtytzY/urApVE10ABqKB4aHLgNpgJlJ2aUE9R9WTWYDcc+a1Yb3T40gRV1Lky0
 azuEdEMVp+ng==
X-IronPort-AV: E=Sophos;i="5.73,502,1583222400"; 
   d="scan'208";a="259802365"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.145.38])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 22:43:19 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] opencl: move headers and loader recipe to common directory
Date: Fri, 12 Jun 2020 13:43:12 +0800
Message-Id: <20200612054313.4166368-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-core/{ocl-icd => opencl}/ocl-icd_git.bb           | 0
 .../recipes-core/{opencl-headers => opencl}/opencl-headers_git.bb | 0
 .../{opencl-icd-loader => opencl}/opencl-icd-loader_git.bb        | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-core/{ocl-icd => opencl}/ocl-icd_git.bb (100%)
 rename meta-oe/recipes-core/{opencl-headers => opencl}/opencl-headers_git.bb (100%)
 rename meta-oe/recipes-core/{opencl-icd-loader => opencl}/opencl-icd-loader_git.bb (100%)

diff --git a/meta-oe/recipes-core/ocl-icd/ocl-icd_git.bb b/meta-oe/recipes-core/opencl/ocl-icd_git.bb
similarity index 100%
rename from meta-oe/recipes-core/ocl-icd/ocl-icd_git.bb
rename to meta-oe/recipes-core/opencl/ocl-icd_git.bb
diff --git a/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb b/meta-oe/recipes-core/opencl/opencl-headers_git.bb
similarity index 100%
rename from meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
rename to meta-oe/recipes-core/opencl/opencl-headers_git.bb
diff --git a/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
similarity index 100%
rename from meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
rename to meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
-- 
2.25.4

