Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2834.1793902538906208656
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 10:15:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NB7kBQfW;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild13.wrs.com, ip: 205.220.178.238, mailfrom: prvs=57692a77b4=kpaturi@oak-lpgbuild13.wrs.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Hgkt82001942
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Nov 2026 18:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=dcC/fLSL0
	Bx2+cvh+jvgI8oV4dFT8LvQ5FxZD3kwT/o=; b=NB7kBQfWCfleO1a5RHr3zg7/s
	o34u0eWdB83IKpVv+jHXuef+eIDkXl7qDNIsQ6S4CdC6f7iwRSv3lHji7aEnNAyc
	iX8f/Vvm22xkx7V1Rop3v+o2utHPPeM2LFAo/GfkQv2+Roi7wHFpc/Gk+St9r5tT
	IWWvpqRwWQdX7gjvG4O2w/2vdn+v0RYQbCTTogkcw0pj0D4eBOXOsBEFrRfboIkj
	z3/eoiAQRVXG46xOaV9XTnd8iPP/Qb3ab0Cc3nepOUXdiSaaAM1UzcINgh6cqzfQ
	boShQZBJFC4g8rOUofIo0nlzEdaLFZZ6ivIDyEOWoLcjISqG7PRX1DKIxhRFw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hram4jcp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 18:15:37 +0000 (GMT)
Received: from ala-p2exch02.corp.ad.wrs.com (10.11.226.102) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61; Thu, 5 Nov 2026 10:15:36 -0800
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-p2exch02.corp.ad.wrs.com (10.11.226.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 5 Nov 2026 10:15:36 -0800
Received: from oak-lpgbuild13.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 5 Nov 2026 10:15:36 -0800
Received: by oak-lpgbuild13.wrs.com (Postfix, from userid 1762445479)
	id 39D864BC030F; Thu,  5 Nov 2026 18:15:36 +0000 (UTC)
From: Kanksha Paturi <Kanksha.Paturi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <sumanth.gavini@windriver.com>, <Randy.MacLeod@windriver.com>,
        "Kanksha
 Paturi" <Kanksha.Paturi@windriver.com>
Subject: [meta-oe][PATCH 1/1] libyuv: use GNUInstallDirs for install destinations
Date: Thu, 5 Nov 2026 18:15:33 +0000
Message-ID: <20261105181533.2975485-1-Kanksha.Paturi@windriver.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cpMOAF4i c=1 sm=1 tr=0 ts=6aecc7c9 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8 a=Oh2cFVv5AAAA:8
 a=irsReC_ThBDFFPZ4eYkA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-GUID: u_XRAhbG0vSVSsS4omTryKCj-P0R-O9p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MiBTYWx0ZWRfX1sSQIrXLTC/X
 NN3n27TSH8fWlMm9XkuG9yAy2ncLioJcO0xqdkuvmji/jBDZOsQ9rU37c7wicXyIrbYFCUyrHLf
 c7ufpUU6LbK2UxVSVYjp2EuEGfdPRsHSuzDXqli22+ZIuFks6LDj
X-Proofpoint-ORIG-GUID: u_XRAhbG0vSVSsS4omTryKCj-P0R-O9p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MiBTYWx0ZWRfX5P2hO43OgVP8
 s2uAjWoyJbFY3jTwSwx9sVIGrmeQO6JkgUeI+BfKCMjFjEtHn9L0/J5BLEuvGEyySRNwmRoQ/wo
 JpcV5O/1JLpD0O4UX+0T4Q3ZOcRnKiGpPj6jjmxlmI/YYgj2CyTiiKHeXvx5fJW5QShxIer6sWs
 A8CgFdHQTfyEzf6RBoF/7nkbP3i/7wApprKW/v/cnwua5I0SJhRd9W+uBMqe/P4asQNmghFcg3E
 5lF8LUGg8XW9f/YRxhwc1pGkkCkk2Ky/G3bw5Fd+o3ZtBk8VOwE33sTLpeTeR9MrmyW28N7xiPD
 I2NgPJ5xMYiFzwJyYVDY2UquVgurhgKYWmvUZ2N8UyChTMbxQBuQVkMYVxKX8OMBSE8Gl/lwhQt
 g/q67IYIi9EMBvwmfvcpuVD1j3cwOSE4BfCUAoxLeDBbCfUr8aq1IUqkACU3yf/3cNAVUKSXSXm
 1mOfwqv3hkyQPY8HhNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 18:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131928
Content-Type: text/plain; charset="utf-8"

libyuv's CMakeLists.txt hardcodes the install destinations to bin, lib
and include, so on multilib (lib64) targets the libraries are installed
to the wrong location and are not packaged.

Add a patch to use GNUInstallDirs (CMAKE_INSTALL_BINDIR,
CMAKE_INSTALL_LIBDIR, CMAKE_INSTALL_INCLUDEDIR) so files are installed
to the correct, platform-appropriate directories.

Signed-off-by: Kanksha Paturi <Kanksha.Paturi@windriver.com>
---
 .../recipes-multimedia/libyuv/libyuv.bb       |  4 +-
 ...se-GNUInstallDirs-for-install-destin.patch | 46 +++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libyuv/libyuv/0001-CMakeLists.txt-use-GNUInstallDirs-for-install-destin.patch

diff --git a/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb b/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb
index bc897830a7..f255626310 100644
--- a/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb
+++ b/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb
@@ -4,7 +4,9 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=464282cfb405b005b9637f11103a7325"
 
-SRC_URI = "git://chromium.googlesource.com/libyuv/libyuv;protocol=https;branch=main"
+SRC_URI = "git://chromium.googlesource.com/libyuv/libyuv;protocol=https;branch=main \
+           file://0001-CMakeLists.txt-use-GNUInstallDirs-for-install-destin.patch \
+           "
 SRCREV = "5a17753597d77dee881d9d93097ca2c2079e9409"
 PV = "0.1+git"
 
diff --git a/meta-multimedia/recipes-multimedia/libyuv/libyuv/0001-CMakeLists.txt-use-GNUInstallDirs-for-install-destin.patch b/meta-multimedia/recipes-multimedia/libyuv/libyuv/0001-CMakeLists.txt-use-GNUInstallDirs-for-install-destin.patch
new file mode 100644
index 0000000000..6f8cfb4cd3
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libyuv/libyuv/0001-CMakeLists.txt-use-GNUInstallDirs-for-install-destin.patch
@@ -0,0 +1,46 @@
+From 9eba4aec2de63b6e2e82826f0a2ebd12f1c28e5c Mon Sep 17 00:00:00 2001
+From: Kanksha Paturi <Kanksha.Paturi@windriver.com>
+Date: Tue, 27 Oct 2026 15:15:39 +0000
+Subject: [PATCH] CMakeLists.txt: use GNUInstallDirs for install destinations
+
+The install destinations were hardcoded to lib, bin and include. On
+multilib systems the library directory can be lib64 (or similar), so
+installing to a hardcoded lib puts the libraries in the wrong place.
+
+Use the GNUInstallDirs variables (CMAKE_INSTALL_BINDIR,
+CMAKE_INSTALL_LIBDIR, CMAKE_INSTALL_INCLUDEDIR) so the files are
+installed to the correct, platform-appropriate directories.
+
+Upstream-Status: Pending
+Signed-off-by: Kanksha Paturi <Kanksha.Paturi@windriver.com>
+---
+ CMakeLists.txt | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 77e0527f..9bec3ced 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -4,6 +4,7 @@
+ 
+ cmake_minimum_required( VERSION 3.16 )
+ project ( YUV C CXX )	# "C" is required even for C++ projects
++include ( GNUInstallDirs )
+ option( UNIT_TEST "Built unit tests" OFF )
+ 
+ include(CheckCSourceCompiles)
+@@ -242,10 +243,10 @@ endif()
+ 
+ 
+ # install the conversion tool, .so, .a, and all the header files
+-install ( TARGETS yuvconvert DESTINATION bin )
+-install ( TARGETS ${ly_lib_static}						DESTINATION lib )
+-install ( TARGETS ${ly_lib_shared} LIBRARY DESTINATION lib RUNTIME DESTINATION bin ARCHIVE DESTINATION lib )
+-install ( DIRECTORY ${PROJECT_SOURCE_DIR}/include/		DESTINATION include )
++install ( TARGETS yuvconvert DESTINATION ${CMAKE_INSTALL_BINDIR} )
++install ( TARGETS ${ly_lib_static} DESTINATION ${CMAKE_INSTALL_LIBDIR} )
++install ( TARGETS ${ly_lib_shared} LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} )
++install ( DIRECTORY ${PROJECT_SOURCE_DIR}/include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR} )
+ 
+ # create the .deb and .rpm packages using cpack
+ include ( CM_linux_packages.cmake )
