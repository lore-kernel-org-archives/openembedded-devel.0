Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CBBC433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:24 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.16150.1647763703528290481
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZgLTd154;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so11929797pjl.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2eljWw+TSpQcu+rqRX9z8OQ1QlZiCFy6ke5IpnVRAJo=;
        b=ZgLTd154P7kgcfQxIFd/eB3Z5GyIfH26AyqcEVfJS5GQ/UdfNQK7dhqBqiJyIIPlh9
         4yMPXkYXQ3CdLvIcLWKM7S4BRayJOk6EIKH1JuwV06uuarqHobvtVsXa6S66Zx2hWiOl
         2s8TapcvPNw4yDhf6ns3T8T3xhwKEvsbWouL1P6pA5/AmNZ75XhhGRaa0gUS7Ki540j3
         A6pW7qA7llxZ1znCRIu3FisUSjL7A4miltVuYFbTksCsq9b04e1Tu8ttPNYo8KcJuz85
         1Ou6Tl9KdW3ElOIXC/LeSprELNxp0sF8QIZxLNrP81xfajlB8MLeDUfGsDo2UdHhE9qs
         UCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2eljWw+TSpQcu+rqRX9z8OQ1QlZiCFy6ke5IpnVRAJo=;
        b=forcsQ2aSuWniQ65LCFtpT2yMzZ0Jtyws7rtE6GnMVkrnj5yFJ7r0u8oaDBonnTyw5
         yCa0Wn4+ZkQI5+McsCjTgStPJQs4x3PncQ/mFXWWwiTEwafe8D0hkeTdFsGCrT7xwg6B
         KCQFMEOxY4bbCRkJDwRkTTQMIANkyuqaY3Kt6tCZP3xOo+e3nvlbHA9vgMQDJGVmU3pd
         GbV5O9XWlMe+iYYj7aSSJXjdZorEkqzqX7OAwobbEQgXmwwsBPxZabPT+KYQf7uYfLEP
         noFeaf/piXNYFGY9GxZZ+QvgCGHMie9p2959ywS9vGcoFO8F3onn2v47GKuv8JFd6WS9
         R3mg==
X-Gm-Message-State: AOAM532MvUJFbctkzSq6CGrxV41HDTqqLkMy1ykN581MH8eQ8NeL0f4b
	1Rfwo39N37q7r01z3Iv2yutNYeODAPhrvQ==
X-Google-Smtp-Source: 
 ABdhPJyuEpKwcaDGjEkSAhJkRPGhNvSPJE0HTEUSGURYTiz8RU+qMk2Mm3cUPoszQHsLHYNRH6TR8w==
X-Received: by 2002:a17:902:f70a:b0:153:88c7:774 with SMTP id
 h10-20020a170902f70a00b0015388c70774mr7444862plo.166.1647763702756;
        Sun, 20 Mar 2022 01:08:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/17] redis-plus-plus: Use GNUInstallDirs in cmake
Date: Sun, 20 Mar 2022 01:08:06 -0700
Message-Id: <20220320080815.825928-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320080815.825928-1-raj.khem@gmail.com>
References: <20220320080815.825928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96072

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...E_INSTALL_LIBDIR-from-GNUInstallDirs.patch | 45 +++++++++++++++++++
 .../redis-plus-plus/redis-plus-plus_1.3.3.bb  |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallDirs.patch

diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallDirs.patch b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallDirs.patch
new file mode 100644
index 0000000000..9ce39f3f77
--- /dev/null
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallDirs.patch
@@ -0,0 +1,45 @@
+From fbb13cdb0b3591616c3f77b6bc76e75af8906cda Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 19 Mar 2022 22:59:58 -0700
+Subject: [PATCH] cmake: Use CMAKE_INSTALL_LIBDIR from GNUInstallDirs
+
+makes it portable across platforms e.g. ppc64/linux uses usr/lib64 for
+system libs
+
+Upstream-Status: Submitted [https://github.com/sewenew/redis-plus-plus/pull/344]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4f28ee4..8150f5c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -239,10 +239,12 @@ if(REDIS_PLUS_PLUS_BUILD_TEST)
+     add_subdirectory(test)
+ endif()
+ 
++include(GNUInstallDirs)
++
+ install(TARGETS ${REDIS_PLUS_PLUS_TARGETS}
+         EXPORT redis++-targets
+-        LIBRARY DESTINATION lib
+-        ARCHIVE DESTINATION lib
++        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+         RUNTIME DESTINATION bin
+         INCLUDES DESTINATION include)
+ 
+@@ -284,7 +286,7 @@ configure_file("${CMAKE_CURRENT_SOURCE_DIR}/cmake/redis++.pc.in"
+         "${CMAKE_CURRENT_BINARY_DIR}/cmake/redis++.pc" @ONLY)
+ 
+ install(FILES "${CMAKE_CURRENT_BINARY_DIR}/cmake/redis++.pc"
+-        DESTINATION "lib/pkgconfig")
++        DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
+ 
+ # All the Debian-specific cpack defines.
+ if(${CMAKE_VERSION} VERSION_GREATER 3.6)
+-- 
+2.35.1
+
diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.3.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.3.bb
index c135105f90..575443f0e5 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.3.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.3.bb
@@ -4,7 +4,9 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https"
+SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https \
+           file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallDirs.patch \
+          "
 SRCREV = "389ffdf9e72035ea2096b03cda7f4a6809ae6363"
 
 S = "${WORKDIR}/git"
-- 
2.35.1


