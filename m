Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA024C71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 10:42:46 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.4848.1750416164419691984
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 03:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Rhlb7Xc2;
 spf=pass (domain: konsulko.com, ip: 209.85.218.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad89ee255easo331171666b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 03:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750416162; x=1751020962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJSzhdOl045eZeAeJ7FALS1Cdc/rqWYjKHqTjtvLXo0=;
        b=Rhlb7Xc2Us/9m0E8XTkrNt+kbEKRbLO2k4TgVB4rXwVtEksMewBnaLabDUTodK1vyQ
         sydFHp9FPak3l9EpziDpnc+vWzC9UthnvcyJbYuXXlvKV7AhxnLBI8Vkr8GjoNQGLS9v
         WaCiv4u0XTF2cfxA8mVeICxI3Hw0fzshakaz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750416162; x=1751020962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJSzhdOl045eZeAeJ7FALS1Cdc/rqWYjKHqTjtvLXo0=;
        b=hmxSwWAAG3pAVc9ngnTRxOMGKqVYMiU2mnWikJaNFmYQL1vtRha2ge+4DJ9UUveESp
         kobpX7AjL7Ccb7k9/Kn5uDwYCvJn3rJdXhdEtksgxd+kCx7xPdjK7MHyngIZwVqiwIfr
         JN67bpWXCVLodiV663npoHZ17UUf1ib8gt/66kr6A7VZ15087CCh+kkLDOqj6EpJpMY7
         p4TliDvIjRzOJabAVQoCmAXB+YGHrIaeRB/5p6iZg3kV6RhF+Dv8VzWQirfzcp3ZX6HL
         HRrtwJrQv9e03OiJaJYR5fJ6rNjrcAkdm5q1HzP2F2nMqsHSDkyIAT6FiO/Or52hf76+
         5wfQ==
X-Gm-Message-State: AOJu0YwAmewziYVv+oe3Lm3XXaDBJRE40f9dsv7+Q2DoGsOuIRzy2e6a
	JZ0z48VaNNjJocTvpPu1v8ygpWFb4TnJDPjfSPpxo7Q4rOk2QCxp9THN2eOQ5PfTAigONT3nXXr
	4CjGR
X-Gm-Gg: ASbGncsmsC4vOGAwTqT+MAZbqcHOO4xQsgOms5M1P+7srCSeKyGt9Fr4meYTcLcuIon
	Qrr1B6pVCNkl9eWHUs8uk59v3HAoAqqcugoj1ue+xSKaHa3osj/dDt39IF1mCcbCY27MYJsaJX0
	rUFRp4yDvftW+VKcOkjO6IRM6Ljal5KoYQFTu8GGBG+VYrKidJolLA/7WWSovuWUoLn02zP2H5c
	1sY0BQ4aUfw1AaA7c1t+1MCcT+4Q/G0KHF7KFZ3KFd1OpfKleUH2GWC9SwKb8tOn5lacBk3jobd
	fftbYXhsr+G0zX2c4/3mVq05oSgqCR6XsNiaZ1cIn5m080zw3vxtDAobime7on9rCaQD5KmDNWt
	T
X-Google-Smtp-Source: AGHT+IGp3GB/ajNXsambCPWEyjmwg1YIUafwxHtLrux2pN9XBaQMKd0E+W0r7zvcffbBp9xxET7sIw==
X-Received: by 2002:a17:907:724c:b0:adb:2577:c0c5 with SMTP id a640c23a62f3a-ae057f32323mr228543466b.38.1750416162217;
        Fri, 20 Jun 2025 03:42:42 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080e8esm140084966b.82.2025.06.20.03.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:42:41 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] paho-mqtt-cpp: Upgrade 1.4.1 -> 1.5.3
Date: Fri, 20 Jun 2025 13:42:39 +0300
Message-Id: <20250620104239.1709240-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 10:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117968

Upgrade to release 1.5.3:

- Fix the bundled Paho C build foc C23 compilers by forcing C99
  compliance in CMake build
- Code base updated to to C++17
- Now a C++17 compiler is required to compile the library
- CMake minimum required version raised to v3.13
- Need a fairly recent CMake for C++17 support (>= v3.12)
- CMake v3.13 allows INSTALL(TARGETS) to work outside the current
  directory.
- Clients always created for v5 persistence format, making it
  universal for any connection.
- If the application specifies a version it is kept as a hint for
  default connections.
- The version for the connection should be specified in the connect
  options.
- The create_options now have all the parameters to create a client.
- Can specify Server URL, Client ID, and persistence in the create
  options.
- New client constructor that takes just the options object
- The client caches a const create_options struct with all the
  creation parameters
- Client creation internally simplified without breaking the public
  API
- Expanded the message constmer to be a full client "event" consumer.
- The events are for connected, connection_lost, disconnected,
  message arrived, and application shutdown.
- The application can get client state change notifications without
  resorting to callbacks.
- There's a new persistence_type (std::variant) that can hold any
  of the persistence specifiers (none, file directory, or user
  interface).
- Most of the class static constants are now constexpr.
- Removed the fake ReasonCode::MQTTPP_V3_CODE. Now all reason codes
  in a v3 connection are SUCCESS.
- The mqtt::exception checks if the 'rc' return code actually
  contains a reason code error, amd if so, sets it as the reason
  code.
- property can now report the typeid of its contained value.
- The properties list implements a const iterator
- Added a to_string() and operator<<() for reason codes.
- thread_queue is now closable.
- Added documentation for UNIX domain sockets coming in with Paho
  C v1.3.14
- Removed the manual implementation of make_unique<>()
- Added create_options assignment operators.
- Fixed some corner cases for topic_filter::matches()
- Cleaned up and fixed a number of example apps.
- Most apps now except a server URI from the command line
- 'data_publish' example uses C++17 std::filesystem for creating
  a file-based encrypted persistence for messages.
- Updated local CI (buildtst.sh) for current compilers and unit tests.
- Reorganized the source repository
- Completely reformat the sources and added a .clang-format file (a
  project master and a slightly-different one for headers).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch | 53 -------------------
 ...tt-cpp_1.4.1.bb => paho-mqtt-cpp_1.5.3.bb} |  6 +--
 2 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch
 rename meta-oe/recipes-connectivity/paho-mqtt-cpp/{paho-mqtt-cpp_1.4.1.bb => paho-mqtt-cpp_1.5.3.bb} (81%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch
deleted file mode 100644
index a881c83495..0000000000
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 2a0dd2b300242230faa92cf8e26ccd70231bc9ef Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 19 Mar 2022 23:37:58 -0700
-Subject: [PATCH] cmake: Use CMAKE_INSTALL_LIBDIR and CMAKE_INSTALL_BINDIR
-
-This ensures the install paths are not hardcoded.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
----
- cmake/CMakeLists.txt       | 4 ++--
- src/samples/CMakeLists.txt | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
---- a/cmake/CMakeLists.txt
-+++ b/cmake/CMakeLists.txt
-@@ -34,7 +34,7 @@ export(EXPORT ${package_name}
- )
- 
- install(EXPORT ${package_name}
--  DESTINATION lib/cmake/${package_name}
-+  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${package_name}
-   FILE ${package_name}Targets.cmake
-   NAMESPACE ${package_name}::
- )
-@@ -42,5 +42,5 @@ install(EXPORT ${package_name}
- install(FILES
-   "${CMAKE_CURRENT_BINARY_DIR}/${package_name}Config.cmake"
-   "${CMAKE_CURRENT_BINARY_DIR}/${package_name}ConfigVersion.cmake"
--  DESTINATION lib/cmake/${package_name}
-+  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${package_name}
- )
---- a/examples/CMakeLists.txt
-+++ b/examples/CMakeLists.txt
-@@ -65,7 +65,7 @@ endforeach()
- 
- ## install binaries
- install(TARGETS ${EXECUTABLES} EXPORT PahoMqttCppSamples
--    RUNTIME DESTINATION bin
-+    RUNTIME DESTINATION {CMAKE_INSTALL_BINDIR}
- )
- 
- ## Build the SSL/TLS samples, if selected
-@@ -80,7 +80,7 @@ if(PAHO_WITH_SSL)
-     endforeach()
- 
-     install(TARGETS ${SSL_EXECUTABLES} EXPORT PahoMqttCppSamples
--        RUNTIME DESTINATION bin
-+        RUNTIME DESTINATION {CMAKE_INSTALL_BINDIR}
-     )
- endif()
- 
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
similarity index 81%
rename from meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
index 6f2efcda50..0093936786 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.4.1.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.5.3.bb
@@ -10,10 +10,8 @@ LIC_FILES_CHKSUM = " \
     file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
 "
 
-SRC_URI = "gitsm://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=v1.4.x \
-           file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch \
-           "
-SRCREV = "ac1b023eab789e829656144f12b248602c40e37b"
+SRC_URI = "gitsm://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=master"
+SRCREV = "17ff3dc0270738adc710667be44847eebc038ae0"
 PV .= "+git"
 
 DEPENDS = "openssl paho-mqtt-c"
-- 
2.39.5


