Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web08.12738.1612647845127330070
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 13:44:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=U6pbENFM;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.195, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f195.google.com with SMTP id t8so11875504ljk.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 13:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rAbELH5Wr3Bxj74f4RAzzqI8YYxrRVPR4Q/d47p5i7U=;
        b=U6pbENFMGxfcLX/3UEDikbnFjLTrZJr8vMElrlE3O/oRQkdXITAFLnX2zAytxWcCFc
         20CfMRl6MvPMHq6u3jSNDvt0FCtsK+iCSi32LbcHMYBrb1Jx/vQj3bTvLKigPUAkC2Vp
         DN/4MQz+8Wuh6jm6OTcpuqzYTsw9S2MQdRW5xXH6EoTz6NxX118inaMKAACOi1lI7xiC
         ckD5FhTd5IM9r0h1mYM/CHHxztIJEMGuwyMEO3cTlk0hLE/NIfTrXpO8D2unueu5zZBy
         MASnLIbLVmu19q7hsRMUa2MNXO9BGwuHfNyB/xkxoP5+GD7fHzdEA9paSpWQu1yu7o4z
         ljPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rAbELH5Wr3Bxj74f4RAzzqI8YYxrRVPR4Q/d47p5i7U=;
        b=Aa5l7C5UUo/TRh7hXYW7/k6pzaEyUI3qBhbbZ9xsA/yu2hlD+YDdOTV7ryeLFAqOmE
         krLN86cGo5xkAGNFRdNHMXQU3RxiYd4M097/jdN7y0Eq+vhYcFkJyYM2P+5F82uToKZR
         R19JSS17esBBAeWP+1Cc53yKEVxnM8Yn+g63VYjAbSjtuNnw3w5Mgv5C9fxzL1iT53fm
         QnMBOwrWt/3FWuqSujHQMgBpZwhyrNrfQKMsAtw8FYo1/dhr6TzL8gP2e5uOUa7NTQpc
         czvK4ijKdj3xdCrInG2ExQ7zk56EqLNkoQVq1xdcsiJG3PQ19cS8OWkeHKeOdwSF/Jzg
         yiLA==
X-Gm-Message-State: AOAM533OOsYiZB/gAtV41fqsLQFyXiayQM8gQU7WA8frDfV2EOIKQPDg
	8RjvrLjkTaNnx7E2fBn2k8OrRpWsqcN27oKp
X-Google-Smtp-Source: ABdhPJysakdqWKzm1TSHWNnANbHp01UwClQ9snMAbXzRTf+j0PXUm/1DZHYEGNgtdKsAVA+qnHFoNA==
X-Received: by 2002:a2e:914b:: with SMTP id q11mr6240830ljg.503.1612647842650;
        Sat, 06 Feb 2021 13:44:02 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id n4sm1393283ljg.101.2021.02.06.13.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 13:44:01 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] cannelloni: update to 1.0.0
Date: Sat,  6 Feb 2021 22:43:59 +0100
Message-Id: <20210206214359.3731674-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Removed upstreamed patches.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...allDirs-instead-of-hard-coding-paths.patch | 43 -------------------
 ...-missing-stdexcept-for-runtime_error.patch | 32 --------------
 ...{cannelloni_git.bb => cannelloni_1.0.0.bb} |  9 +---
 3 files changed, 2 insertions(+), 82 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-Use-GNUInstallDirs-instead-of-hard-coding-paths.patch
 delete mode 100644 meta-networking/recipes-connectivity/cannelloni/cannelloni/0002-include-missing-stdexcept-for-runtime_error.patch
 rename meta-networking/recipes-connectivity/cannelloni/{cannelloni_git.bb => cannelloni_1.0.0.bb} (62%)

diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-Use-GNUInstallDirs-instead-of-hard-coding-paths.patch b/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-Use-GNUInstallDirs-instead-of-hard-coding-paths.patch
deleted file mode 100644
index b78f0b329..000000000
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-Use-GNUInstallDirs-instead-of-hard-coding-paths.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From c74f04dbab4d586287347b1d5517f36e2f0c3d8e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 19 Dec 2019 15:52:34 -0800
-Subject: [PATCH] Use GNUInstallDirs instead of hard-coding paths
-
-Bump minimum cmake version to be >= 3.1
-
-Upstream-Status: Submitted [https://github.com/mguentner/cannelloni/pull/22]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 51b354f..958e0eb 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 2.6)
-+cmake_minimum_required(VERSION 3.1)
- project(cannelloni)
- 
- list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")
-@@ -60,6 +60,8 @@ set_target_properties ( cannelloni-common
-   SOVERSION 0
- )
- 
-+include(GNUInstallDirs)
-+
- if(SCTP_SUPPORT)
-     add_library(sctpthread STATIC sctpthread.cpp)
-     target_link_libraries(sctpthread addsources sctp)
-@@ -68,5 +70,5 @@ endif(SCTP_SUPPORT)
- set_target_properties(addsources PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
- target_link_libraries(cannelloni addsources cannelloni-common pthread)
- 
--install(TARGETS cannelloni DESTINATION bin)
--install(TARGETS cannelloni-common DESTINATION lib)
-+install(TARGETS cannelloni DESTINATION ${CMAKE_INSTALL_BINDIR})
-+install(TARGETS cannelloni-common DESTINATION ${CMAKE_INSTALL_LIBDIR})
--- 
-2.24.1
-
diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni/0002-include-missing-stdexcept-for-runtime_error.patch b/meta-networking/recipes-connectivity/cannelloni/cannelloni/0002-include-missing-stdexcept-for-runtime_error.patch
deleted file mode 100644
index 55f28dd67..000000000
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni/0002-include-missing-stdexcept-for-runtime_error.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1788762863cd1f657697575f6e73a22e661ccb43 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Dec 2019 10:32:54 -0800
-Subject: [PATCH 2/2] include missing <stdexcept> for runtime_error
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes
-error: ‘runtime_error’ is not a member of ‘std’
-
-Upstream-Status: Submitted [https://github.com/mguentner/cannelloni/pull/22]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- parser.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/parser.cpp b/parser.cpp
-index 4afb9e0..5bcdbde 100644
---- a/parser.cpp
-+++ b/parser.cpp
-@@ -2,6 +2,7 @@
- 
- #include <arpa/inet.h>
- #include <string.h>
-+#include <stdexcept>
- 
- void parseFrames(uint16_t len, const uint8_t* buffer, std::function<canfd_frame*()> frameAllocator,
-         std::function<void(canfd_frame*, bool)> frameReceiver)
--- 
-2.24.1
-
diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_git.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.0.0.bb
similarity index 62%
rename from meta-networking/recipes-connectivity/cannelloni/cannelloni_git.bb
rename to meta-networking/recipes-connectivity/cannelloni/cannelloni_1.0.0.bb
index d4a62bd92..0cf57ccdb 100644
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_git.bb
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.0.0.bb
@@ -2,13 +2,8 @@ SUMMARY = "a SocketCAN over Ethernet tunnel"
 HOMEPAGE = "https://github.com/mguentner/cannelloni"
 LICENSE = "GPLv2"
 
-SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https \
-           file://0001-Use-GNUInstallDirs-instead-of-hard-coding-paths.patch \
-           file://0002-include-missing-stdexcept-for-runtime_error.patch \
-          "
-SRCREV = "82aa49b417b96fe46bb3f017ae1bfea928f20f9a"
-
-PV = "20160414+${SRCPV}"
+SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https"
+SRCREV = "0bd7e27db35bdef361226882ae04205504f7b2f4"
 
 LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-- 
2.25.1

