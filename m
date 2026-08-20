Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3A5C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 13:04:12 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6654.1787231046797490275
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 06:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ljFrdTi/;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4969; q=dns/txt;
  s=iport01; t=1787231046; x=1788440646;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K1YpOKu6N5JmdyJmhBn7MmAbPJxNBNzhcjLt6ySWNKM=;
  b=ljFrdTi/RjuQYyjEj/rSO9YMIqa/v4I+DKmMsqdatIDXveII4Q8JAqZC
   yDlzBLNDBXaIW5Vh0KoxD+NjEW+lSYg/8agDLF6y334ee9wtD0HU59BSx
   R/967zZQW5VSFxbix5PeWec5MpS2DzJ+MABWNQrdRatBOg/oVxQsiuMRy
   8cuPZZE6CX2O7Uxvgc0MFNMquVC5jN7EWtQ9V093uRP/4jGDvxh1FmBBD
   7AY6qxhdD4o+BUtx74Cf3hV9p+pAFQDp210ZhUSKmWEthJ5/sRRUv0nRd
   xkDR2N1Nz808oAonSrLp9JvTwrTmJInQhFoyg9qyEuctCng/zctXCN+aJ
   Q==;
X-CSE-ConnectionGUID: 9W+4xE7ZSRO1xzkciEZcWQ==
X-CSE-MsgGUID: mJVwKUMFR3CXwkxsabLSBQ==
X-IPAS-Result: =?us-ascii?q?A0BFAgCk+oZq/5AQJK1aHgEBCxIMggULgld0XkNJlCmCI?=
 =?us-ascii?q?YtnkjeBfg8BAQEPRA0EAQGEP0YCjWsCJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgE4ARgBGz4DAQJPCyMhgwIBgjoDNwMRwjGCL?=
 =?us-ascii?q?IEBgygBgVTYSw2CWAELFAGBOIU/gn+FI10ZhHwnGxuBcoR+HoIBQgKIJQSCD?=
 =?us-ascii?q?RV6EoFaHoJjg0iLJ0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsGB?=
 =?us-ascii?q?YEdgSiENyMZNnyBCV6BKypiEheBCYIKAoJwggYCAUlFDgkXCxgNSBEsNxQZB?=
 =?us-ascii?q?D5uB45RIIJKAYEECgErggM4kzCSN6AecQoog3aMIY8+hXwaM4QEgVelEZkIg?=
 =?us-ascii?q?lmIXoJThAmRd1CEaYFoPIFZcBWDIglKGQ+SI8w5JzICCTICBwIHDgMLk2YBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:P2+7Xq/SdQveDj+99DlXDrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zdNWmuEOveKZWX2eo90a4nk/U5SsJeEy9diSQNprX9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjhMs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lnAs5E6ssoM1p00
 qUIOjMGbz2xjN2PlefTpulE3qzPLeHiOIcZ/3UlxjbDALN+HtbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cP3WjOX9PYH46tOeqj3X4dRVTqUmeouw85G27IAlZgOGwaYeLI4LWLSlTtkO6m
 H3lwkHXOEoxBMOc2SGM+FaXrNaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:z0O3Xapj3MHikoTiE1k21tgaV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90de7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: 9a23:fFSHU2P9qaBbBu5DCRYkqF45RfIeSFqE3GXTKE6VO21WcejA
X-Talos-MUID: 9a23:ziQSgwtPdIvJW1bvcs2ngRNcK+RVxoqUU2s9jpYWoMCOERdaAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,233,1779148800"; 
   d="scan'208";a="815156164"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 13:04:06 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id D6492180001C3
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 13:04:05 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 74B0DCC1611; Thu, 20 Aug 2026 06:04:05 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][master][PATCH 1/2] suitesparse: fix CMake 4 configure failure
Date: Thu, 20 Aug 2026 06:03:57 -0700
Message-Id: <20260820130358.2402128-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 13:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129392

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
index 377801579e..f655ac17fd 100644
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
2.35.6


