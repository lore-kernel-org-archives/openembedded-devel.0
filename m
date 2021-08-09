Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.20676.1628501525142623711
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Aug 2021 02:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: naveen.kumar.saini@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="300243555"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="300243555"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 02:32:04 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="670727154"
Received: from saininav-desk1.png.intel.com ([10.158.87.77])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 02:32:03 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-defusedxml: extend recipe to add native support
Date: Mon,  9 Aug 2021 17:45:48 +0800
Message-Id: <20210809094548.15104-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1

It may be useful for some use cases.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb b/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
index f48c429c4..e5790f478 100644
--- a/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
@@ -8,3 +8,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=056fea6a4b395a24d0d278bf5c80249e"
 SRC_URI[sha256sum] = "1bb3032db185915b62d7c6209c5a8792be6a32ab2fedacc84e01b52c51aa3e69"
 
 inherit pypi setuptools3
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

