Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.14185.1591940602049791376
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 22:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: sf11bHCkIgW8NTH/bBsDmaXaUepmd0W4RFsPu7qNVFNUjGkLOg7qy60wwEXdE1Wv/TXNcuCado
 AMsdc4aP9QjA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 22:43:22 -0700
IronPort-SDR: w8MpH9cNqzK/WMwDEA7Qyg0eI9RSjX8Ol28v7WraQdELTIZ9ZBpCcMDU2kWW361bdLYHnDcoo9
 Z6g+TKkGMc4Q==
X-IronPort-AV: E=Sophos;i="5.73,502,1583222400"; 
   d="scan'208";a="259802373"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.145.38])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 22:43:21 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] opencl-clhpp: add recipe
Date: Fri, 12 Jun 2020 13:43:13 +0800
Message-Id: <20200612054313.4166368-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200612054313.4166368-1-anuj.mittal@intel.com>
References: <20200612054313.4166368-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recipe to provide OpenCL API C++ bindings.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-core/opencl/opencl-clhpp_git.bb   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-core/opencl/opencl-clhpp_git.bb

diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
new file mode 100644
index 000000000..540c5d346
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
@@ -0,0 +1,22 @@
+SUMMARY  = "OpenCL API C++ bindings"
+DESCRIPTION = "OpenCL API C++ bindings from Khronos"
+
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https"
+
+LICENSE  = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+PV = "2.0.11+git${SRCPV}"
+SRCREV = "432b551429b362a877ed9b647b7114022b332be0"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = " \
+                  -DBUILD_DOCS=OFF \
+                  -DBUILD_EXAMPLES=OFF \
+                  -DBUILD_TESTS=OFF \
+                  "
+
+ALLOW_EMPTY_${PN} = "1"
-- 
2.25.4

