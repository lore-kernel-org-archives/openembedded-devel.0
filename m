Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.10504.1592193843860539678
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jun 2020 21:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: RNXQU5xTYbpy44WMV5oMsyiJEc9e0atrwOx/EGjF6xB3yDOQEz7L9is/REJxIr0JVRPLi6Mrpg
 lqzH6YHpe9LQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2020 21:04:02 -0700
IronPort-SDR: XqH2dL5jhPw0cKG+dRZGHLvlzLqI02hEmpMImsxbhwQYkVnKptj8AOjoXg9r6m2CLgvsWThptf
 imwha7H3Qzjg==
X-IronPort-AV: E=Sophos;i="5.73,513,1583222400"; 
   d="scan'208";a="276425380"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.77.167])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2020 21:04:01 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2] opencl-clhpp: add recipe
Date: Mon, 15 Jun 2020 12:03:57 +0800
Message-Id: <20200615040357.220684-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recipe to provide OpenCL API C++ bindings.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
v2: Remove ALLOW_EMPTY and change it to RDEPENDS_$PN-dev = ""

 .../recipes-core/opencl/opencl-clhpp_git.bb   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-core/opencl/opencl-clhpp_git.bb

diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
new file mode 100644
index 000000000..a4f292475
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
@@ -0,0 +1,23 @@
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
+# Headers only so PN is empty
+RDEPENDS_${PN}-dev = ""
-- 
2.25.4

