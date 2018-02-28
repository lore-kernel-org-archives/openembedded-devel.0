Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9CAA6788B1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 15:26:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 07:26:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,406,1515484800"; d="scan'208";a="31324258"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 28 Feb 2018 07:26:41 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id AC4A0580412
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 07:26:40 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Feb 2018 17:29:31 +0200
Message-Id: <1519831772-41479-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519831772-41479-1-git-send-email-maxin.john@intel.com>
References: <1519831772-41479-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/5] libeigen: remove unused patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Feb 2018 15:26:39 -0000

Remove the following unused patch:
        0001-CMakeLists.txt-install-FindEigen3.cmake-script.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...Lists.txt-install-FindEigen3.cmake-script.patch | 28 ----------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libeigen/libeigen/0001-CMakeLists.txt-install-FindEigen3.cmake-script.patch

diff --git a/meta-oe/recipes-support/libeigen/libeigen/0001-CMakeLists.txt-install-FindEigen3.cmake-script.patch b/meta-oe/recipes-support/libeigen/libeigen/0001-CMakeLists.txt-install-FindEigen3.cmake-script.patch
deleted file mode 100644
index 761dadb..0000000
--- a/meta-oe/recipes-support/libeigen/libeigen/0001-CMakeLists.txt-install-FindEigen3.cmake-script.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From fd8bc66efac1059c1068f804746b01b90177c333 Mon Sep 17 00:00:00 2001
-From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
-Date: Sun, 18 Oct 2015 16:52:25 +0200
-Subject: [PATCH] CMakeLists.txt: install FindEigen3.cmake script
-
-Upstream-Status: Pending
-
-Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
----
- CMakeLists.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 76a11b9..ec6c6ea 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -342,6 +342,8 @@ if(EIGEN_BUILD_PKGCONFIG)
-         )
- endif(EIGEN_BUILD_PKGCONFIG)
- 
-+install(FILES "${PROJECT_SOURCE_DIR}/cmake/FindEigen3.cmake" DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cmake/Modules")
-+
- add_subdirectory(Eigen)
- 
- add_subdirectory(doc EXCLUDE_FROM_ALL)
--- 
-1.9.3
-
-- 
2.4.0


