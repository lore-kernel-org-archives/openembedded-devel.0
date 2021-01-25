Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.33049.1611558061972748702
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jan 2021 23:01:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: junjie.mao@intel.com)
IronPort-SDR: NAgh2XVB2YSyBUIvz5ICg2wH+E5/siO4843SQp5JdXYpWthMnLcTStSmZKh5iYG1YoMu69p31S
 5bf7cj66GCIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="243750846"
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; 
   d="scan'208";a="243750846"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2021 23:00:59 -0800
IronPort-SDR: PMPk1WEIraUlQsXpQdFSUAPA4Ps+NKXWOHuNavV/Z+NJkVRsFLbResjMyDjeO5eFi9bQd2Oa/d
 UoYDuirnsU4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; 
   d="scan'208";a="471906249"
Received: from junjie-optiplex-7050.sh.intel.com ([10.239.153.129])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2021 23:00:58 -0800
From: "Junjie Mao" <junjie.mao@intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Junjie Mao <junjie.mao@intel.com>
Subject: [meta-python][PATCH] python3-xmlschema: Yocto recipes for validating against XSD 1.1
Date: Mon, 25 Jan 2021 15:00:46 +0800
Message-Id: <1611558046-30976-1-git-send-email-junjie.mao@intel.com>
X-Mailer: git-send-email 2.7.4

This patch adds recipes for xmlschema and its dependency in order to enable
XML validation against XSD 1.1 in Python.

Signed-off-by: Junjie Mao <junjie.mao@intel.com>
---
 .../python/python3-elementpath_2.1.2.bb              | 12 ++++++++++++
 .../python/python3-xmlschema_1.4.1.bb                | 20 ++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
new file mode 100644
index 0000000..f47f152
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Provide XPath 1.0 and 2.0 selectors for Python's ElementTree XML data structures, both for the standard ElementTree library and for the lxml.etree library."
+HOMEPAGE = "https://github.com/sissaschool/elementpath"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
+
+SRC_URI[md5sum] = "887f60e9c4fb9b0804a38372b2798101"
+SRC_URI[sha256sum] = "23e1fed8d196d9a6cc4d220ef11fbe7eb8cff3a27848621c447e9d96134b2085"
+
+PYPI_PACKAGE = "elementpath"
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
new file mode 100644
index 0000000..c609931
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "The xmlschema library is an implementation of XML Schema for Python (supports Python 3.6+)."
+HOMEPAGE = "https://github.com/sissaschool/xmlschema"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
+
+SRC_URI[md5sum] = "f4c46f8c4415a0ca31dc2f623b668664"
+SRC_URI[sha256sum] = "ade693114ff2e4a9ed5a2371ce29ae888f689bc58e326e5796f8a7dc8954dd4a"
+
+PYPI_PACKAGE = "xmlschema"
+inherit pypi setuptools3
+
+DEPENDS += "\
+    ${PYTHON_PN}-elementpath \
+"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-elementpath \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

