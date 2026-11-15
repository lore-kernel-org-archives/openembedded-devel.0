Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3904.1794729105973163986
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=slJIdEpA;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3704d30b84fso2949444eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729105; x=1795333905; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pRZn7A9EYNGLcGu6VPy98IGrS4qvKx7H2XsfbNcP41s=;
        b=slJIdEpAy5GLqgOs/jYO2WkgtOTVnCfOvZn/D2fnkIxVBjywC3MmXj0vgnxMwdlb9v
         mtFbkQWQIEiIvZVeaXBb2IdG3UYo/qOumNl6SHsbga6h+y63fIClKnXUzOkg1KSAQ7Ri
         PCDMUremrLNzO25tT5QdcrhCwdP1nbjz2KFbBLFb4Evlexjpj4ct9U4GwQOYpqjiNVhI
         GU//l+8Fii1NXYhpBrUuhI8GyWJ4j+ApnJmj2B+uLLqZZ1gF+2fub1pGEHHUffV2GG2i
         yJ4coCg4b2GyhdO40zRL7tZ++Cw6LYzavuZHHNX6upUXxNYsr6weJuJzD9h/s5po7Da6
         Bx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729105; x=1795333905;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pRZn7A9EYNGLcGu6VPy98IGrS4qvKx7H2XsfbNcP41s=;
        b=NKcZdq29LvrD8W8DsUVcV1FPtCkEsvvdzSOpbbf2tIXAx1bo4G2NHuJNP5hc6pyK/L
         VYVErK4KYrmaHWA8CPpRZs6t3rgoFormPAvQGCqlv6sbXo7Wcqmw1yvglqrxMLEhxz4N
         KXRDdufiKGKfvGUbToOdZ0/Q1vfA3MWqC5GbU1SVNoKymWAQg1SjPahMqeoDUtF/CtRX
         pXkG/lUVW5Wp+/gMC7bwoazMKyQSvZumM1kZzNnFR6NlCqCPHdu/4ZpTX12MSGFr4YWh
         KwF8+uSyjNAqevZVD+JfVlKw/lYHsTv7YMnmoTLR5+0nwmETK2ol9cPLXq6Jrqnu0b75
         93dQ==
X-Gm-Message-State: APuU4Z+SfYnxwBASVHEcbAMXpkJsZCaItsEpZ9gvUD1poRwmxUhky/6b
	RbSGh0I3ISjo8xei965JLIz/7lHdMQyX1GXQQRy9k0g7rqYrA6M8YZaHhB22/opj
X-Gm-Gg: AYBFou2j1ahNOK2MBuD48Oxm8WLt2Rsk6BMPEednxLSAP30r/AylFwR8IvoZNStkSRi
	O9Kd8rbq5TJMtNlrpCUMAFIwc+SXGrXqGjZHyqiTf/HY2Wh7GQnzddvmEp3HfqeJJ2E2ZBA9MeU
	2ma3B0eyWLOBJUfCq5nAaWnDBH5awxIHK5yffkmXx/cKNXrmbRBqQ7D43j0oe6b098eLa9VvxWu
	YOb9ParJ5qfZVbWHNWRarkpWcI/ATepnEZn/4I0qq+nkJd27XpTqhRsamnMIR/OO1KmOByPCR9i
	y5cOjfWm6n+J8hmtzkGR7cIR5ZKMMrOl65XjocDfjkP7VfG3ueiWXLJOZopQsM19z2ptDmlqmdm
	2m3sQiKWIvOaQLEzl/WeRHQBAGiR6/rmwldWdiHGGJmoQdU/E6YW1sfHaf5hOUqiuWGffR6mSq8
	ZB9Sx69XkJi/s1XVtXqXw6OYw1ZKOjxae+1zrbL35B9UdZKwKYDnLfegPc4yL5gCFLEcwCq1+Cy
	MMN9Itc21h/YDwPNVP6W5hbGyD3K1oU12um/pOfa4+W+8cKOUDvUqvOFx6auGrLWEhXwKZm2Evt
	K3fQWntZnoQs2Xp9X0H/yc8thrLl9iME6Npdde7UxJrusOBlkcHTLuz1nYQOoRMtqk4qY5tU+kp
	2ealT9fd6MPNUU4yXQzRUYLgcLlGu76miyoJ94bLAHRUy3FalXT1OtbiN4XK13jXwTmFnfxdrEm
	ugcLQ416KaSp1797VhAk1NL1pjyF+Dy9mP1wJA2qelxHyzZKxTSQ9Ii6m+s7tHdEX9qeClA491F
	jdFfufVzRyuw5QO4QNkfS53SXEV32CIJvyO087xrfLGqvp29S8vcy/ANDwbTDHqjFQ9kRmplBDx
	EZJZ
X-Received: by 2002:a05:7300:fd12:b0:369:a162:af96 with SMTP id 5a478bee46e88-379673164cbmr11093848eec.17.1794729105284;
        Sat, 14 Nov 2026 23:51:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 88/96] bcu: upgrade 1.1.128 -> 1.2.1
Date: Sat, 14 Nov 2026 23:49:06 -0800
Message-ID: <20261115074918.2932593-88-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132358
Content-Type: text/plain; charset="utf-8"

Rework 0001-CMakeLists-do-not-use-vendored-libcurl.patch: 1.2.1
builds a static libcurl from the bundled sources via build_libs.sh at
configure time; link the system libcurl through pkg-config instead.

CMakeLists.txt declares cmake_minimum_required(VERSION 3.4), which
CMake 4 rejects, so set CMAKE_POLICY_VERSION_MINIMUM.

The bcu_1.2.1 tag points to a commit that is not on master or any other
branch, so fetch it by tag alone.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...akeLists-do-not-use-vendored-libcurl.patch | 29 ++++++++++---------
 .../bcu/{bcu_1.1.128.bb => bcu_1.2.1.bb}      |  7 +++--
 2 files changed, 21 insertions(+), 15 deletions(-)
 rename meta-oe/recipes-support/bcu/{bcu_1.1.128.bb => bcu_1.2.1.bb} (73%)

diff --git a/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch b/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch
index ac72be44dc..806b81188e 100644
--- a/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch
+++ b/meta-oe/recipes-support/bcu/bcu/0001-CMakeLists-do-not-use-vendored-libcurl.patch
@@ -6,32 +6,35 @@ Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
 
 Update for 1.1.128
 Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+
 ---
- CMakeLists.txt | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
+ CMakeLists.txt | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0d6b915..f8c76ca 100644
+index 3475179..945c373 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -16,14 +16,15 @@ find_package(PkgConfig REQUIRED)
- pkg_check_modules(LIBFTDI REQUIRED libftdi1)
+@@ -17,17 +17,17 @@ pkg_check_modules(LIBFTDI REQUIRED libftdi1)
  pkg_check_modules(LIBYAML REQUIRED yaml-0.1)
+ pkg_check_modules(LIBOPENSSL REQUIRED openssl)
  pkg_check_modules(LIBUSB REQUIRED libusb-1.0)
 +pkg_check_modules(LIBCURL REQUIRED libcurl)
  project(bcu)
--include_directories(${LIBUSB_INCLUDE_DIRS} ${LIBFTDI_INCLUDE_DIRS}include ${PROJECT_SOURCE_DIR}/libftdi/src ${LIBYAML_INCLUDEDIR})
-+include_directories(${LIBUSB_INCLUDE_DIRS} ${LIBFTDI_INCLUDE_DIRS}include ${LIBYAML_INCLUDEDIR})
+-include_directories(${LIBUSB_INCLUDE_DIRS} ${LIBFTDI_INCLUDE_DIRS}include ${PROJECT_SOURCE_DIR}/libftdi/src ${LIBYAML_INCLUDEDIR} ${PROJECT_SOURCE_DIR}/libcurl/include)
++include_directories(${LIBUSB_INCLUDE_DIRS} ${LIBFTDI_INCLUDE_DIRS}include ${LIBYAML_INCLUDEDIR} ${LIBCURL_INCLUDE_DIRS})
  include_directories(${PROJECT_SOURCE_DIR})
  
  message("operation system is ${CMAKE_SYSTEM}")
  if (LINUX)
-         add_executable(bcu bcu.c port.c chip.c board.c bcu_parser.c bcu_yaml.c bcu_ftdi_eeprom.c)
+         add_executable(bcu bcu.c port.c chip.c board.c bcu_parser.c bcu_yaml.c bcu_https.c bcu_ftdi_eeprom.c)
 -        link_directories(${LIBUSB_LIBRARY_DIRS} ${LIBFTDI_LIBRARY_DIRS} ${LIBYAML_LIBRARY_DIRS})
+-        target_link_libraries (bcu ${LIBUSB_LIBRARIES} ${LIBFTDI_LIBRARIES} ${LIBYAML_LIBRARIES} ${PROJECT_SOURCE_DIR}/libcurl/build.bcu/lib/libcurl.a -lpthread -lssl -lcrypto -lm)
+-        execute_process( COMMAND ${PROJECT_SOURCE_DIR}/create_version_h.sh ${PROJECT_SOURCE_DIR}
+-                         COMMAND ${PROJECT_SOURCE_DIR}/build_libs.sh ${PROJECT_SOURCE_DIR})
 +        link_directories(${LIBUSB_LIBRARY_DIRS} ${LIBFTDI_LIBRARY_DIRS} ${LIBYAML_LIBRARY_DIRS} ${LIBCURL_LIBRARY_DIRS})
-         target_link_libraries (bcu ${LIBUSB_LIBRARIES} ${LIBFTDI_LIBRARIES} ${LIBYAML_LIBRARIES} -lpthread -lm -ldl)
-         execute_process( COMMAND ${PROJECT_SOURCE_DIR}/create_version_h.sh ${PROJECT_SOURCE_DIR} )
++        target_link_libraries (bcu ${LIBUSB_LIBRARIES} ${LIBFTDI_LIBRARIES} ${LIBYAML_LIBRARIES} ${LIBCURL_LIBRARIES} -lpthread -lm)
++        execute_process( COMMAND ${PROJECT_SOURCE_DIR}/create_version_h.sh ${PROJECT_SOURCE_DIR})
          install(TARGETS bcu DESTINATION bin)
--- 
-2.43.0
-
+ elseif (MACOS)
+         add_executable(bcu_mac bcu.c port.c chip.c board.c bcu_parser.c bcu_yaml.c bcu_https.c bcu_ftdi_eeprom.c)
diff --git a/meta-oe/recipes-support/bcu/bcu_1.1.128.bb b/meta-oe/recipes-support/bcu/bcu_1.2.1.bb
similarity index 73%
rename from meta-oe/recipes-support/bcu/bcu_1.1.128.bb
rename to meta-oe/recipes-support/bcu/bcu_1.2.1.bb
index 2b2e5e7fa0..19ea077e90 100644
--- a/meta-oe/recipes-support/bcu/bcu_1.1.128.bb
+++ b/meta-oe/recipes-support/bcu/bcu_1.2.1.bb
@@ -9,14 +9,17 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=884d48c2aa7b82e1ad4a33909fab24b6"
 
-SRC_URI = "git://github.com/nxp-imx/bcu;protocol=https;branch=master;tag=${BPN}_${PV} \
+SRC_URI = "git://github.com/nxp-imx/bcu;protocol=https;nobranch=1;tag=${BPN}_${PV} \
            file://0001-CMakeLists-do-not-use-vendored-libcurl.patch \
            "
-SRCREV = "e7027dcb867dae7aebc8fd0a78ab13f05a4557f2"
+SRCREV = "1c79dcf115bcf2c8ad632dadbc749c5e25c52cb1"
 
 
 DEPENDS = "curl libyaml libusb1 openssl libftdi"
 
 inherit cmake pkgconfig
 
+# CMakeLists.txt still declares cmake_minimum_required(VERSION 3.4)
+EXTRA_OECMAKE += "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
+
 BBCLASSEXTEND = "native nativesdk"
