Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.8878.1596498367404854547
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 16:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 134.134.136.65, mailfrom: james.feist@linux.intel.com)
IronPort-SDR: Fafq/3MbyApGCE+fbMxpEQzQtXjkrHdD5JW2JKDIOiFhCJiiIYZGSm+vMqp83mWah7q3dZGcEO
 Xm0QPuwMDExA==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="152188527"
X-IronPort-AV: E=Sophos;i="5.75,431,1589266800"; 
   d="scan'208";a="152188527"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2020 16:46:05 -0700
IronPort-SDR: nEHDVsIxGoYOJLwA6ZfELBw/peWOzAC7GcRXHXx5Erzqznviz4+iqopttO0QbOFUMTEQLVWN5T
 iMGQelhLN0ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,431,1589266800"; 
   d="scan'208";a="322520530"
Received: from skyhawk.jf.intel.com ([10.54.51.81])
  by orsmga008.jf.intel.com with ESMTP; 03 Aug 2020 16:46:05 -0700
From: "James Feist" <james.feist@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: James Feist <james.feist@linux.intel.com>
Subject: [meta-oe][PATCH] boost-url: Add recipe
Date: Mon,  3 Aug 2020 16:46:04 -0700
Message-Id: <20200803234604.13632-1-james.feist@linux.intel.com>
X-Mailer: git-send-email 2.17.1

boost-url is a library for manipulating URI and URL.

Signed-off-by: James Feist <james.feist@linux.intel.com>
---
 .../recipes-devtools/boost-url/boost-url_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/boost-url/boost-url_git.bb

diff --git a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb b/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
new file mode 100644
index 000000000..6d4635b66
--- /dev/null
+++ b/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Boost.URL is a library for manipulating Uniform Resource Identifiers (URI) and Locators (URL)"
+HOMEPAGE = "https://github.com/CPPAlliance/url"
+SECTION = "libs"
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+
+SRC_URI = "git://github.com/CPPAlliance/url.git"
+
+SRCREV = "a56ae0df6d3078319755fbaa67822b4fa7fd352b"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+DEPENDS = "boost"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

