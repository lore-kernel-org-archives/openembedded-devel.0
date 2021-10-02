Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41BFC433F5
	for <webhook@archiver.kernel.org>; Sat,  2 Oct 2021 13:27:09 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.10612.1633181229206903637
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Oct 2021 06:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qnmhyWvI;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id t11so8104300plq.11
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Oct 2021 06:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xnNNsFnWXFISGy423Rls6HIJQmudCXsA4nOHMmzbJKA=;
        b=qnmhyWvIwySChp4qcD7JA+aDFla67fCd6LfzlowxWr6f7j1u5KGdr4GsJcfC/SK6V5
         UICoEiM9FbDEWC7K7t21zEu3jUTYRHCyKlj96EKDJVFn8wYBwJBNfWWdzaS6+uFH5rdq
         0YIHu331SWpHNB4WKlXq6INYAWb+Hblj6yV4p67F9WopmiZn/VcjGSbg7rEHidXOMFiw
         tJEI7ezKxF2OKDxhxy11xdqoIlLw+yt0T65NpH+yXVBfw00XIwzYfSadjdeOcVWkFBy8
         7KnGsAXLcm4vn3ehPeAg6mV4mcwakUoM9jLBq5gFDaLFd3LWXj5eoMT1Kmzt+zYmJAZ9
         it9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xnNNsFnWXFISGy423Rls6HIJQmudCXsA4nOHMmzbJKA=;
        b=D1ZA6AuMRaAehi3yca88jqQl8ed7Jl9C/2lbwWF6cgB1KkogL5OJ0nDMMCeoMQnS5P
         KyPLPesHFNm0rZkg0kJ9ehjufrhLl6bpm75puQFoTpT7ML0/+ik/XBBisarigQyUtXHU
         gz5vl/PgHu134h902JpvHwh9xED/G+gdzdewV61RwA1mFmoti4RocnIjOPh3VKKY6W6d
         CxQTO1Tjk1eDwCkxyVbamr+/HBNdBZRknr7Gfid7dwaaBU465RP2xNJVXkcU1zl6Pm3M
         HnFwPAUn73HyWMn57jcXnn0GcL7rCUw3lsTFYnRyYvmkcfGcugKxkcvTKWcARRIIi2ob
         nCAQ==
X-Gm-Message-State: AOAM53127wI+NgKTg8reiSEJZlcEd1uZtt9Up1H7ljico+fPBXoHdjJh
	nfSZClNAcHTgs8ECbxQQcGgUC60Ytu3Z5A==
X-Google-Smtp-Source: 
 ABdhPJw7MNc+hSBLAA/+BxhHMQy18P8bG+SQi075/xbraryYBBRu/2rDc+BoPtgWtEvkY8CCWnCj+Q==
X-Received: by 2002:a17:902:ea09:b0:13e:416f:549 with SMTP id
 s9-20020a170902ea0900b0013e416f0549mr14412582plg.43.1633181228410;
        Sat, 02 Oct 2021 06:27:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id
 g3sm8813953pgj.66.2021.10.02.06.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 06:27:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] gattlib: Upgrade to latest
Date: Sat,  2 Oct 2021 06:27:05 -0700
Message-Id: <20211002132705.4150997-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Oct 2021 13:27:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93192

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-cmake-Use-GNUInstallDirs.patch | 53 -------------------
 .../gattlib/gattlib_git.bb                    |  7 ++-
 2 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/gattlib/files/0001-cmake-Use-GNUInstallDirs.patch

diff --git a/meta-oe/recipes-connectivity/gattlib/files/0001-cmake-Use-GNUInstallDirs.patch b/meta-oe/recipes-connectivity/gattlib/files/0001-cmake-Use-GNUInstallDirs.patch
deleted file mode 100644
index ffe0a00673..0000000000
--- a/meta-oe/recipes-connectivity/gattlib/files/0001-cmake-Use-GNUInstallDirs.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 63dc2d0c9384d85482dc4cbb3c179b4b0bb18d4e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 19 Dec 2019 22:32:01 -0800
-Subject: [PATCH] cmake: Use GNUInstallDirs
-
-Helps install cmakefiles in right libdir
-
-Upstream-Status: Submitted [https://github.com/labapart/gattlib/pull/139]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt      |  5 +++--
- dbus/CMakeLists.txt | 18 ++++++++++--------
- 2 files changed, 13 insertions(+), 10 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 12d8d71..ded7239 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -152,7 +152,8 @@ endif()
- #
- # List of file to install
- #
--install(FILES include/gattlib.h DESTINATION include)
--install(FILES ${PROJECT_BINARY_DIR}/gattlib.pc DESTINATION lib/pkgconfig)
-+include(GNUInstallDirs)
-+install(FILES include/gattlib.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
-+install(FILES ${PROJECT_BINARY_DIR}/gattlib.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
- 
- include(CPack)
-diff --git a/dbus/CMakeLists.txt b/dbus/CMakeLists.txt
-index f5096ce..cef031f 100644
---- a/dbus/CMakeLists.txt
-+++ b/dbus/CMakeLists.txt
-@@ -19,7 +19,7 @@
- #  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- #
- 
--cmake_minimum_required(VERSION 2.6)
-+cmake_minimum_required(VERSION 3.0)
- 
- find_package(PkgConfig REQUIRED)
- 
-@@ -119,4 +119,6 @@ endif()
- add_library(gattlib SHARED ${gattlib_SRCS})
- target_link_libraries(gattlib ${gattlib_LIBS})
- 
--install(TARGETS gattlib LIBRARY DESTINATION lib)
-+include(GNUInstallDirs)
-+
-+install(TARGETS gattlib LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index 8485013ba6..ea4f4d5468 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "Bluetooth library with attribute support"
 SECTION = "libs/network"
 
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://CMakeLists.txt;beginline=1;endline=20;md5=8d5efeb9189b60866baff80ff791bf00"
+LICENSE = "GPL-2.0+ | BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://CMakeLists.txt;beginline=1;endline=6;md5=71fdd2be76b4e95fe28324a70d4981c5"
 
 DEPENDS = "bluez5 glib-2.0"
 DEPENDS += "glib-2.0-native"
@@ -11,11 +11,10 @@ PV = "0.2+git${SRCPV}"
 
 SRC_URI = "git://github.com/labapart/gattlib.git \
            file://dbus-avoid-strange-chars-from-the-build-dir.patch \
-           file://0001-cmake-Use-GNUInstallDirs.patch \
            "
 
 SRCBRANCH = "master"
-SRCREV = "5c7ee43bd70ee09a7170ddd55b9fdbdef69e9080"
+SRCREV = "fa54ae42ccb3d8f911e00b02ed1e581537e47f79"
 
 S = "${WORKDIR}/git"
 
-- 
2.33.0


