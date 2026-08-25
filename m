Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901C5C5DF94
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 08:37:48 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17089.1787647067877960444
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2026 01:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=giVoRwXQ;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5144; q=dns/txt;
  s=iport01; t=1787647067; x=1788856667;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xN9K97+Mnr2JZcPb93+XTsYJu0vaSQkpTO19Z+i7VnM=;
  b=giVoRwXQjk8FfqTitPEvbYP1S+g8MNajyXiLiUnRkCx8A3MG0KAZt0RT
   dsqGtjDA9AxT2jVNL9aUpPmuTLLctuqLe2Ds8QIkztlvaj06mGA1cKFhI
   sAv7sKUNSQIl2V3vJAka0km1KHhOpMUJpYLVoE8CMTJ+8QylHNmGldpFM
   M4wOAm2UKGHQCmfgu75wXHYrJ3tchOPqgMrP3lB4tmLLQw9L+JreegIPN
   05M0ao6ELFFRpMNL8VlSY7tMtGLlYRBkVSVFn6mmM0v5Ku4CHploSUTGC
   Il1d1c7/3Su7GYGoW/prRXARx/jC6gxaDvh/1AIOuD2MqS2h1cUPXZNqy
   A==;
X-CSE-ConnectionGUID: 4hugvvKnTPqSS6g3tyXZ0w==
X-CSE-MsgGUID: 0RkSBTF6TzuOXjv4btneWg==
X-IPAS-Result: =?us-ascii?q?A0AaAAAmU41q/5H/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0X0JJjHKHN4IhA4tkkjeBfg8BAQEPRA0EAQGEP0YCjWwCJjQJD?=
 =?us-ascii?q?gECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMyARgBG?=
 =?us-ascii?q?yIcAwECLyALIwgRCIMCAYI6AzcDEb5wgiyBAYMoAYFU2EsNglgBCxQBgTgBh?=
 =?us-ascii?q?T6Cf4UjXRmEfCcbG4FyhH4eggFCAoglBIINFXoSgVoegkyDQ4tOSIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQQIxk2fIEJXoErKWESF?=
 =?us-ascii?q?4EJggcCglqCBQIBSUMOB0ciCxgNSBEsNxQZBD5uB45dH4JLAYEECgErggM4k?=
 =?us-ascii?q?zCSNKAhcQoog3aMIo8+hXwaM4QEgVelEZkIglmIXoJThAmRd1CEaYFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ+SI8whPDUCCTICBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:f7Gg8a3g8j+StQJ/aPbD5YNwkn2cJEfYwER7XKvMYLTBsI5bpzMDm
 jQdWG/UO/fcYmPyKNB3Po7l8xxXu57VmIBmQVds3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24ubzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGUEErMpMG2eBLOXh1z
 qIXcywcXiLbmLfjqF67YrEEasULNsLnOsYb/3pn1zycVaZgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUidC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+OW3aYGEJYDSGq25mG7An
 GH91VjXXC0IKfuvyyTZ+G6qi9DAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:HJdzt6xPSD+oYihnlg0mKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3AQ+Ybp2in8TR5w01DRBtbkZYbYzJuLn3Aw2nOAEm?=
 =?us-ascii?q?EMX9Sc+OaEkOByJE8jJ87?=
X-Talos-MUID: 9a23:ZceesQTIZgqFqThXRXS0vjJZHvtGvZi8FWc9k4tasdWCOBN/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,242,1779148800"; 
   d="scan'208";a="521397407"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Aug 2026 08:37:46 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 99D4818000441
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 08:37:46 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id B5BE0CC037D; Tue, 25 Aug 2026 14:07:44 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][wrynose][PATCH 1/2] suitesparse: fix CMake 4 configure failure
Date: Tue, 25 Aug 2026 14:07:20 +0530
Message-Id: <20260825083721.3369187-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260825083721.3369187-1-deeratho@cisco.com>
References: <20260825083721.3369187-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 08:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129469

From: Himanshu Jadon <hjadon@cisco.com>

SuiteSparse 5.10.1 still carries bundled CMake entry points with
2.x minimum versions. CMake 4 rejects projects which request
compatibility with versions older than 3.5, so configure fails before
SuiteSparse can build.

Backport the upstream SuiteSparse change which raises the bundled
Mongoose, METIS and GKlib minimum version to 3.13. This version also
reaches two bundled GraphBLAS CMake entry points with the same old
minimum, so update those in the backport as well.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit de2fc817a4d4002c2c6304dcde5837fb30ae15ca)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../0004-Allow-build-with-CMake-4.patch       | 86 +++++++++++++++++++
 .../suitesparse/suitesparse_5.10.1.bb         |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0004-Allow-build-with-CMake-4.patch

diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/0004-Allow-build-with-CMake-4.patch b/meta-oe/recipes-devtools/suitesparse/suitesparse/0004-Allow-build-with-CMake-4.patch
new file mode 100644
index 0000000000..5fc3f666c3
--- /dev/null
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse/0004-Allow-build-with-CMake-4.patch
@@ -0,0 +1,86 @@
+From 57e1fd1a4bf7878136a9f5070dadb310f233f489 Mon Sep 17 00:00:00 2001
+From: Tim Davis <DrTimothyAldenDavis@gmail.com>
+Date: Wed, 9 Mar 2022 10:33:33 -0600
+Subject: [PATCH] require cmake 3.13
+
+Upstream-Status: Backport [https://github.com/DrTimothyAldenDavis/SuiteSparse/commit/ae0be0028e68d429feb565f093aec875235447cc]
+Backport-Changes:
+ * Also update the two bundled GraphBLAS CMake entry points reached by
+   the SuiteSparse 5.10.1 build.
+ * Preserve the METIS_VERSION value supplied by the existing OE patch
+   after CMake policy CMP0048 becomes NEW.
+
+(cherry picked from commit ae0be0028e68d429feb565f093aec875235447cc)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ GraphBLAS/CMakeLists.txt           | 2 +-
+ GraphBLAS/GraphBLAS/CMakeLists.txt | 2 +-
+ Mongoose/CMakeLists.txt            | 2 +-
+ metis-5.1.0/CMakeLists.txt         | 2 +-
+ metis-5.1.0/GKlib/CMakeLists.txt   | 2 +-
+ 5 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/GraphBLAS/CMakeLists.txt b/GraphBLAS/CMakeLists.txt
+index 7eb999189..eecfa0ac5 100644
+--- a/GraphBLAS/CMakeLists.txt
++++ b/GraphBLAS/CMakeLists.txt
+@@ -12,7 +12,7 @@
+ #-------------------------------------------------------------------------------
+ 
+ # cmake 3.13 is preferred.
+-cmake_minimum_required ( VERSION 2.8.12 )
++cmake_minimum_required ( VERSION 3.13 )
+ 
+ message ( STATUS "CMake version: " ${CMAKE_VERSION} )
+ 
+diff --git a/GraphBLAS/GraphBLAS/CMakeLists.txt b/GraphBLAS/GraphBLAS/CMakeLists.txt
+index f365251db..26928dc0a 100644
+--- a/GraphBLAS/GraphBLAS/CMakeLists.txt
++++ b/GraphBLAS/GraphBLAS/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ #-------------------------------------------------------------------------------
+ 
+ # cmake 3.13 is preferred.
+-cmake_minimum_required ( VERSION 2.8.12 )
++cmake_minimum_required ( VERSION 3.13 )
+ 
+ message ( STATUS "CMake version: " ${CMAKE_VERSION} )
+ 
+diff --git a/Mongoose/CMakeLists.txt b/Mongoose/CMakeLists.txt
+index 91a7f70ef..361fa1239 100644
+--- a/Mongoose/CMakeLists.txt
++++ b/Mongoose/CMakeLists.txt
+@@ -20,7 +20,7 @@
+ #
+ #   make distclean
+ 
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.13)
+ include(CMake/cmake_colors.cmake)
+ 
+ if (POLICY CMP0048)
+diff --git a/metis-5.1.0/CMakeLists.txt b/metis-5.1.0/CMakeLists.txt
+index 318019bfc..1a72ed0d0 100644
+--- a/metis-5.1.0/CMakeLists.txt
++++ b/metis-5.1.0/CMakeLists.txt
+@@ -1,5 +1,5 @@
+-cmake_minimum_required(VERSION 2.8)
+-project(METIS)
++cmake_minimum_required(VERSION 3.13)
++project(METIS VERSION ${METIS_VERSION})
+ 
+ set(GKLIB_PATH "GKlib" CACHE PATH "path to GKlib")
+ set(SHARED FALSE CACHE BOOL "build a shared library")
+diff --git a/metis-5.1.0/GKlib/CMakeLists.txt b/metis-5.1.0/GKlib/CMakeLists.txt
+index 67b600aa6..2f4ae75d7 100644
+--- a/metis-5.1.0/GKlib/CMakeLists.txt
++++ b/metis-5.1.0/GKlib/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.13)
+ project(GKlib)
+ 
+ get_filename_component(abs "." ABSOLUTE)
+-- 
+2.35.6
+
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
index 8effd042fb..d6b45f007e 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
@@ -5,6 +5,7 @@ SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https;branc
            file://0002-Preserve-links-when-installing-libmetis.patch \
            file://0003-Add-version-information-to-libmetis.patch \
            file://makefile-quoting.patch \
+           file://0004-Allow-build-with-CMake-4.patch \
            "
 SRCREV = "538273cfd53720a10e34a3d80d3779b607e1ac26"
 
-- 
2.43.7


