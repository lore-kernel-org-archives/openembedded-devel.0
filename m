Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC79CD4F50
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 03:48:34 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.1562.1725508112966585751
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Sep 2024 20:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FesJJDHS;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71781f42f75so284152b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 20:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725508112; x=1726112912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bh/jhmvaz9Lb1vMTNSbS4Cv7dVdrtu8ox12rNZ/sEpo=;
        b=FesJJDHSM6ATyDxCNA7BKkcJ/KTlyMPz7TMl8mgcgLAO/OHLSvUccSCNzzmzGFm4I/
         7aRQqDnPHjftir14bznJUCMGtZaAopQgZZ1Kw3uUAL43NtIO2/HjgS+CS04uBQyeDtbg
         kGZngYF9HKNJsomgt/mFlI7UE7XKp6HKCbc+eYLlQzvVF4O0Ifkm0QLlmf0E060UVAG+
         rkBoxvwwLV5I7AFNaE8xs5v1GNEiwH5gSB9bUnhHK1xTQyqkigNvs6kcWtizG0I+vV4F
         DX2qLTq/OJ39y/4Y78UoukVjWnDVapUxp/2z4S+qOP55XVbFJBSdVRa8Ck/+4puiYEcF
         7MOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725508112; x=1726112912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bh/jhmvaz9Lb1vMTNSbS4Cv7dVdrtu8ox12rNZ/sEpo=;
        b=EfLMuR5/nrReJXhJBa1nDrTi94ToBMnjGKR9XcgxGF2gq6BFRpwOd95yo3UpOg80ji
         3ZBAcus/n53NRxpNZuiFbpmpYLy61qaZg/pEyXihvVWDls2foCdSy1AaO9WI8g52qdWq
         GPS/YBrVwCKsf2H/lK78wjWMfjQ4LGHhW4ufzfAVh2si5E/9t+LpDBII48iDIAlAMWZO
         gK8Ynlx8ylyooH2Lm2Cdhbrvia/Nzm2dvEFEH6OYpdR6GFiYdX+x7gy1ieTk3krd07t4
         XEKUoHYyh20X3I3XtwTi+1hTRi52H6t+/brlrdaE2n4SolbtmcfxO3e0T/bpS7T+GSBv
         Hhlw==
X-Gm-Message-State: AOJu0YwWp9h4iPeq+r1QPIL4REsbp0CzMdzQpUnAbdAJIWmF06ToMW5k
	UiU0DDUMYj4pKlkBKngrIv4mcTDn4DiiFdrc+1n1U38S5KAtUAbtAwxdKqA7
X-Google-Smtp-Source: AGHT+IHSyqAka9B4op1pdEKBsNKeBYZiTQvX9JhKb4Vxe5t8rwRWBy+35f/COH48qGDvpN8QZpY6Pw==
X-Received: by 2002:a05:6a21:7108:b0:1ce:f6dc:2bb7 with SMTP id adf61e73a8af0-1cef6dc2dd7mr12321403637.32.1725508111913;
        Wed, 04 Sep 2024 20:48:31 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea34f4esm20132425ad.133.2024.09.04.20.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 20:48:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] paho-mqtt-cpp: Upgrade to 1.4.1 release
Date: Wed,  4 Sep 2024 20:48:28 -0700
Message-ID: <20240905034828.3053691-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 03:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112096

License file LICENSE is added, therefore use that for checksums
license still remains same.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch | 58 +++++++++----------
 ...tt-cpp_1.3.2.bb => paho-mqtt-cpp_1.4.1.bb} |  6 +-
 2 files changed, 29 insertions(+), 35 deletions(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-cpp/{paho-mqtt-cpp_1.3.2.bb => paho-mqtt-cpp_1.4.1.bb} (81%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch
index fba9a8767f..a881c83495 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch
@@ -13,47 +13,41 @@ Upstream-Status: Pending
  src/samples/CMakeLists.txt | 4 ++--
  2 files changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/cmake/CMakeLists.txt b/cmake/CMakeLists.txt
-index a9f8908..7eadc60 100644
 --- a/cmake/CMakeLists.txt
 +++ b/cmake/CMakeLists.txt
-@@ -11,7 +11,7 @@ export(EXPORT ${package_name}
-     FILE "${CMAKE_CURRENT_BINARY_DIR}/${package_name}Targets.cmake"
-     NAMESPACE ${package_name}::)
- 
--install(EXPORT ${package_name} DESTINATION lib/cmake/${package_name}
-+install(EXPORT ${package_name} DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${package_name}
-     FILE ${package_name}Targets.cmake
-     NAMESPACE ${package_name}::)
+@@ -34,7 +34,7 @@ export(EXPORT ${package_name}
+ )
  
-@@ -19,4 +19,4 @@ install(FILES
-     "${CMAKE_CURRENT_BINARY_DIR}/${package_name}Config.cmake"
-     FindPahoMqttC.cmake
-     "${CMAKE_CURRENT_BINARY_DIR}/${package_name}ConfigVersion.cmake"
--    DESTINATION lib/cmake/${package_name})
-+    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${package_name})
-diff --git a/src/samples/CMakeLists.txt b/src/samples/CMakeLists.txt
-index 3ca0a75..c915cd5 100644
---- a/src/samples/CMakeLists.txt
-+++ b/src/samples/CMakeLists.txt
-@@ -71,7 +71,7 @@ endforeach()
+ install(EXPORT ${package_name}
+-  DESTINATION lib/cmake/${package_name}
++  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${package_name}
+   FILE ${package_name}Targets.cmake
+   NAMESPACE ${package_name}::
+ )
+@@ -42,5 +42,5 @@ install(EXPORT ${package_name}
+ install(FILES
+   "${CMAKE_CURRENT_BINARY_DIR}/${package_name}Config.cmake"
+   "${CMAKE_CURRENT_BINARY_DIR}/${package_name}ConfigVersion.cmake"
+-  DESTINATION lib/cmake/${package_name}
++  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${package_name}
+ )
+--- a/examples/CMakeLists.txt
++++ b/examples/CMakeLists.txt
+@@ -65,7 +65,7 @@ endforeach()
  
  ## install binaries
  install(TARGETS ${EXECUTABLES} EXPORT PahoMqttCppSamples
--  RUNTIME DESTINATION bin
-+  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+-    RUNTIME DESTINATION bin
++    RUNTIME DESTINATION {CMAKE_INSTALL_BINDIR}
  )
  
  ## Build the SSL/TLS samples, if selected
-@@ -89,7 +89,7 @@ if(PAHO_WITH_SSL)
-   endforeach()
+@@ -80,7 +80,7 @@ if(PAHO_WITH_SSL)
+     endforeach()
  
-   install(TARGETS ${SSL_EXECUTABLES} EXPORT PahoMqttCppSamples
--    RUNTIME DESTINATION bin
-+    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
-   )
+     install(TARGETS ${SSL_EXECUTABLES} EXPORT PahoMqttCppSamples
+-        RUNTIME DESTINATION bin
++        RUNTIME DESTINATION {CMAKE_INSTALL_BINDIR}
+     )
  endif()
  
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.2.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
similarity index 81%
rename from meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.2.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
index 1b2e51c3ac..f374837fc6 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.2.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
@@ -5,15 +5,15 @@ SECTION = "console/network"
 LICENSE = "EPL-2.0 | EDL-1.0"
 
 LIC_FILES_CHKSUM = " \
-    file://src/mqtt/message.h;beginline=9;endline=18;md5=c5ceecf5ab99d44dcfaaabdce289071b \
+    file://LICENSE;md5=c0fa3a632eea67f4079c54df781d1441 \
     file://edl-v10;md5=3adfcc70f5aeb7a44f3f9b495aa1fbf3 \
     file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
 "
 
-SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=v1.3.x \
+SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=v1.4.x \
            file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch \
            "
-SRCREV = "5e0d1bf37b4826d680ec066ec42afd133851a681"
+SRCREV = "c310578ee68d38cd53e79d7107fb41dc68dbafe0"
 
 DEPENDS = "openssl paho-mqtt-c"
 

