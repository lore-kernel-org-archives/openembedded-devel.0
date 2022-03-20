Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FBDC433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:26 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.16039.1647763705249969955
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gPjiyfLc;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id c11so8200093pgu.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C5RO7htVLeHHLefV5lBPLeepM68LLCk3RyMKc3xruc4=;
        b=gPjiyfLcJnxXRLVdzYYvu+QHXIvxpD7R8g1BoNVDAKJUh3hQ3AtDv/H5vtZEZ6agIe
         O/7PtOQXutIVk9oGmMAmte3btf+xWd9/ep78WH+oI8hpVXeZOnorIJm/IFFBRRXt1EoV
         FloqgPLJIQ2mvtjldorYhNmWQ7ThZlQ14L6HKNKbw1lYi+YBkQeLIlYvbPOj9gDd7Mxb
         oQBP5NrbZy4NMEGSBYny432mvMSgs+43TmRqTXbYzQHcmXRw6kAuLkRPu99IY6ZMeezK
         /vxv2k9qdoXBIDr+6BjkWWxJW2/8GVZQ8I6QoG1ara5ZdP1RpDo6oRl7pe/va6siBgMj
         4ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C5RO7htVLeHHLefV5lBPLeepM68LLCk3RyMKc3xruc4=;
        b=MJ+ge4TOAaAB7CD/jcyBkj52KyhOY1S5hHO6E9DHbcLVz5/hW9XxV/dUZ1IGdmwZuS
         8i5Xz1yrEDNmjvidT6fZ1wpMNKwixxNpkvgoE3vZ4P6QvbPNr+7Le2xVRGUNt+HbtH+o
         SEnsPdZQng0InCC2C5lO8x/21VPZYUOcu0iHD05E1A5gRFuKaqp7JStvZqiSC7HaBtJm
         SCX3oFuLPUnpGDAuCSWiULZ7jUSemxi+nxUz1B/aKcE8v06+3hAqn1Zu1xVc6TbjiGep
         CJ4WEr8hQkepm2uKVGK5bZK2rwbrXBRoEw/AJHip6rUZ95v/6WlpwUFQ6opbz5RU2KMt
         l3PQ==
X-Gm-Message-State: AOAM531r2yYf7VGSKy9lmuqTo1drjhDw9qHu+m5xNlPPa5+dNisauvhl
	KQqhokg4SXJUYkxyStIrvT+HFvJbvaa6ng==
X-Google-Smtp-Source: 
 ABdhPJwZNWrvHTTDlzo0NCjmBstEpu3BVonBzl0rG1IRiLC/OZI19uwj7TOZFTYESoGEZEq4lwPqYA==
X-Received: by 2002:a63:1e4b:0:b0:381:c48:928b with SMTP id
 p11-20020a631e4b000000b003810c48928bmr13456401pgm.139.1647763704450;
        Sun, 20 Mar 2022 01:08:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/17] paho-mqtt-cpp: Use CMAKE_INSTALL_LIBDIR in
 cmake
Date: Sun, 20 Mar 2022 01:08:08 -0700
Message-Id: <20220320080815.825928-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320080815.825928-1-raj.khem@gmail.com>
References: <20220320080815.825928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96074

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch | 49 +++++++++++++++++++
 .../paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb      |  5 +-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch
new file mode 100644
index 0000000000..7cf9a8b121
--- /dev/null
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch
@@ -0,0 +1,49 @@
+From 2a0dd2b300242230faa92cf8e26ccd70231bc9ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 19 Mar 2022 23:37:58 -0700
+Subject: [PATCH] cmake: Use CMAKE_INSTALL_LIBDIR and CMAKE_INSTALL_BINDIR
+
+This ensures the install paths are not hardcoded.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cmake/CMakeLists.txt       | 4 ++--
+ src/samples/CMakeLists.txt | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/cmake/CMakeLists.txt b/cmake/CMakeLists.txt
+index a9f8908..7eadc60 100644
+--- a/cmake/CMakeLists.txt
++++ b/cmake/CMakeLists.txt
+@@ -11,7 +11,7 @@ export(EXPORT ${package_name}
+     FILE "${CMAKE_CURRENT_BINARY_DIR}/${package_name}Targets.cmake"
+     NAMESPACE ${package_name}::)
+ 
+-install(EXPORT ${package_name} DESTINATION lib/cmake/${package_name}
++install(EXPORT ${package_name} DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${package_name}
+     FILE ${package_name}Targets.cmake
+     NAMESPACE ${package_name}::)
+ 
+@@ -19,4 +19,4 @@ install(FILES
+     "${CMAKE_CURRENT_BINARY_DIR}/${package_name}Config.cmake"
+     FindPahoMqttC.cmake
+     "${CMAKE_CURRENT_BINARY_DIR}/${package_name}ConfigVersion.cmake"
+-    DESTINATION lib/cmake/${package_name})
++    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${package_name})
+diff --git a/src/samples/CMakeLists.txt b/src/samples/CMakeLists.txt
+index 953f5dc..d26729a 100644
+--- a/src/samples/CMakeLists.txt
++++ b/src/samples/CMakeLists.txt
+@@ -103,7 +103,7 @@ endif()
+ 
+ ## install binaries
+ install(TARGETS ${INSTALL_TARGETS} EXPORT PahoMqttCppSamples
+-	RUNTIME DESTINATION bin
+-	LIBRARY DESTINATION lib
++	RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
++	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+ )
+ 
+-- 
+2.35.1
+
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
index b5a6ac29c3..a9e16fa045 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
@@ -11,8 +11,9 @@ LIC_FILES_CHKSUM = " \
     file://about.html;md5=dcde438d73cf42393da9d40fabc0c9bc \
 "
 
-SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=http;branch=master;protocol=https"
-
+SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=http;branch=master;protocol=https \
+           file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch \
+"
 SRCREV = "33921c8b68b351828650c36816e7ecf936764379"
 
 DEPENDS = "openssl paho-mqtt-c"
-- 
2.35.1


