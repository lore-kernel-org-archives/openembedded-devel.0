Return-Path: <stephan.vanveen.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB60E7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 10:29:52 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web10.12617.1734085786467434228
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Dec 2024 02:29:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=jGEpkw1Q;
 spf=pass (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: stephan.vanveen.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD6oWsT025822
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Dec 2024 10:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=cjxX3
	eFFZ8HBCaKr1i28BN5CGA3geF2BnxC7Ud0sQOA=; b=jGEpkw1QIqu3YoXZH2KEz
	VK6y13YYky4mpYPewK1R/Wh8NjVsQ/xavRPT/0kXNTzRXc9SKg0QSMBr+oBcDPAZ
	CDmq2Nk0cPjh7LmWzqvVlAap9Tam0SoCeoTtD1U5drtYJkN+fqp5sYXWHRvayfc6
	YQlSW/BhewUHTscZycfbD1XcbqB+BsppcMVCTyPYWxI3r2zshNgT0hx0qMBYtd6i
	OIISCRGleQcaYpdFe2enYM06UmfM86QPw3W9J07+PxgB3FsgEotTx1gt5nFiX0M1
	HJQO9WYL6TltPAA/fbzv4fFbWn/Y6XPgc2ehVqKvDQInzaVxnOjE3UZzAUz1Dv9G
	g==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 43fwtckcfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Dec 2024 10:29:43 +0000 (GMT)
Received: from TUT-EX21-PV.KSTG.corp (10.0.10.225) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 13 Dec
 2024 11:29:42 +0100
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX21-PV.KSTG.corp
 (10.0.10.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 13 Dec
 2024 11:29:42 +0100
Received: from tutn-91ql2f3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Fri, 13 Dec 2024 11:29:42 +0100
From: "van Veen, Stephan" <stephan.vanveen.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "van Veen, Stephan" <stephan.vanveen.ext@karlstorz.com>
Subject: [meta-oe][PATCH] tclap: use most recent version
Date: Fri, 13 Dec 2024 11:29:41 +0100
Message-ID: <20241213102941.198160-1-stephan.vanveen.ext@karlstorz.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OWVWhv1JjucJgh6l1UvktY2Pxt3JWbPm
X-Proofpoint-ORIG-GUID: OWVWhv1JjucJgh6l1UvktY2Pxt3JWbPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_16,2024-08-23_01,2024-05-17_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Dec 2024 10:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114311

Newer version of tclap integrates the changes from 0001-tclap-add-pkg-config-file.patch.

Signed-off-by: van Veen, Stephan <stephan.vanveen.ext@karlstorz.com>
---
 .../0001-tclap-add-pkg-config-file.patch      | 50 -------------------
 meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb |  6 +--
 2 files changed, 2 insertions(+), 54 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/tclap/files/0001-tclap-add-pkg-config-file.patch

diff --git a/meta-oe/recipes-devtools/tclap/files/0001-tclap-add-pkg-config-file.patch b/meta-oe/recipes-devtools/tclap/files/0001-tclap-add-pkg-config-file.patch
deleted file mode 100644
index 58c9aec088..0000000000
--- a/meta-oe/recipes-devtools/tclap/files/0001-tclap-add-pkg-config-file.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 9d47d2fd45c455339759dbfe9a0d6fd24b0a0fa1 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Wed, 24 Mar 2021 15:39:36 +0800
-Subject: [PATCH] tclap: add pkg-config file
-
-The tclap switched from autotools to CMake in 1.4.0 and drop the
-pkg-config file tclap.pc. Some projects (e.g. ima-inspect) still require
-it. So add it back.
-
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- CMakeLists.txt | 5 +++++
- tclap.pc.in    | 7 +++++++
- 2 files changed, 12 insertions(+)
- create mode 100644 tclap.pc.in
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c2c9a26..b56eac7 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -25,6 +25,11 @@ install(FILES "${PROJECT_BINARY_DIR}/tclap/TCLAPConfig.h"
-   DESTINATION include/tclap
-   )
- 
-+configure_file(${CMAKE_CURRENT_SOURCE_DIR}/tclap.pc.in
-+  ${CMAKE_CURRENT_BINARY_DIR}/tclap.pc @ONLY)
-+install(FILES ${CMAKE_CURRENT_BINARY_DIR}/tclap.pc
-+  DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
-+
- add_subdirectory(docs)
- add_subdirectory(examples)
- add_subdirectory(tests)
-diff --git a/tclap.pc.in b/tclap.pc.in
-new file mode 100644
-index 0000000..ef51c94
---- /dev/null
-+++ b/tclap.pc.in
-@@ -0,0 +1,7 @@
-+prefix=@CMAKE_INSTALL_PREFIX@
-+includedir=${prefix}/@CMAKE_INSTALL_INCLUDEDIR@
-+
-+Name: tclap
-+Description: Templatized C++ Command Line Parser
-+Version: @PROJECT_VERSION@
-+Cflags: -I${includedir}
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb b/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
index 6d55c58526..60dbc7b422 100644
--- a/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
@@ -10,10 +10,8 @@ compliant with the GNU or POSIX standards, it is close. \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5c64b2e8cc50917b2744a90950faa7cd"
 
-SRCREV = "799a8b1f99818e39fee19d0601030770af1221e1"
-SRC_URI = "git://git.code.sf.net/p/tclap/code;branch=1.4 \
-           file://0001-tclap-add-pkg-config-file.patch \
-"
+SRCREV = "81b3d2a0c47895c22e9bb8c577f5ab521f76e5d2"
+SRC_URI = "git://git.code.sf.net/p/tclap/code;branch=1.4"
 
 S = "${WORKDIR}/git"
 inherit cmake
-- 
2.47.1


