Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F224E810B5
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 08:42:58 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.13273.1695804174127169351
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 01:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JotiD8Nm;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-405621baba7so76657315e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 01:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695804172; x=1696408972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eE+ZfA1l7C6pBaOBr0zdLh15uFi90zQLrHll5qxxuA=;
        b=JotiD8NmBK+G13O59cqfTlwGYbA2bPYz8b3vFlGlnNnzLPNhX59xXhat0n+/XryHUA
         XTk8NIOMDvUrTZFgQHbU1vNb4L/fF11oG3cA9jsFaZor3856j+XHB1CwOpzTqQeWphw4
         zhyO7Dmxy+LEMoRgmB2h2zOQevm71kk4UTCSQexTFq9h0y71MwAaz/v4Coc1TrdS6LGi
         pWFKJI2lD5XyFcJLxzaFixOXUIebs1ICe4A9zal/bNjUHUFUpChi8ZSSplfK0ZUZxMPM
         MSBFrgwnOL6YnaBeZWQYzR3xcMey7Lt3WRDpBiw0KGi9cabMNL53q+pThiR970lDXO5K
         QkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804172; x=1696408972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+eE+ZfA1l7C6pBaOBr0zdLh15uFi90zQLrHll5qxxuA=;
        b=IrDnD6oFddI/YnwvYbFJC3s2EfBw+0nnQ+twH6iKTI4wh4QynZh4UDWfKNdWVZmIUY
         lwIjhOO/5yyGYYdVyZ/bLaVqrWtRDGJAfvcwqTgMX/ftzrYGc3SIPYwmmquRIqi1lX7G
         bFiDQ04+pRt21zJ08P8by1+PYL7dgBjDV9IwhMAJeWwxKiwcbb35+5pS0kMfxIv0qLM/
         RxiHEWNimrkv1QhDVFuwtv1qgrrJYxleB6Ld+GbePyft6Hjiv7L8w43Cfa5SdEYrkuZN
         jvNcRdq1dDcvUJM/N6VK6u3hoEvfoIMWsov6xVQ/h167Amo1BiWXny/yXUxO0X0brR8w
         U3vg==
X-Gm-Message-State: AOJu0YyHQkJAsplBCZgo3OmeE/Denh6tY+dJoRsH9qjm0+HjLxT5lQ1r
	+1bWaVTePyaTqo+c+SA4tgbz+pOtCcI=
X-Google-Smtp-Source: AGHT+IFUG6sXjUSy5iiq0BJGbLDmwgmh54ZUOARNQvJXXwJL+eQqwEPRPGPFd8Zhpo/helM1LV6c4A==
X-Received: by 2002:a1c:7c17:0:b0:401:d947:c8a9 with SMTP id x23-20020a1c7c17000000b00401d947c8a9mr1654811wmc.19.1695804171782;
        Wed, 27 Sep 2023 01:42:51 -0700 (PDT)
Received: from firmware-builder.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc858000000b004030c778396sm20008616wml.4.2023.09.27.01.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:42:50 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 6/9] etcd-cpp-apiv3: fix build when gRPC is cross compiled
Date: Wed, 27 Sep 2023 10:42:39 +0200
Message-Id: <20230927084242.1195772-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927084242.1195772-1-peron.clem@gmail.com>
References: <20230927084242.1195772-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 08:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105181

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../0001-cmake-fix-when-cross-compiling.patch | 66 +++++++++++++++++++
 .../etcd/etcd-cpp-apiv3_0.15.3.bb             |  6 +-
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch

diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch
new file mode 100644
index 000000000..d1126aa05
--- /dev/null
+++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch
@@ -0,0 +1,66 @@
+From cb79329010d73e36ce64830914005f1c17f8f53c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
+Date: Sat, 23 Sep 2023 11:32:18 +0200
+Subject: [PATCH] cmake: fix when cross compiling
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In order to generate protobuf files CMake need to use the protoc
+and grpc-cpp-plugin compiled for the host architecture.
+
+Unfortunately, the protoc and grpc-cpp-plugin in the gRPC CMake
+configuration file are the one for the target architecture.
+
+Fix this by properly finding the correct executable when
+CMake is cross compiling.
+
+Signed-off-by: Clément Péron <peron.clem@gmail.com>
+---
+ CMakeLists.txt | 28 ++++++++++++++++++++++++++--
+ 1 file changed, 26 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5aa1310..80ebad2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -120,10 +120,34 @@ if(Protobuf_PROTOC_EXECUTABLE)
+     endif()
+ endif()
+ 
++# When cross compiling we look for the native protoc compiler
++# overwrite protobuf::protoc with the proper protoc
++if(CMAKE_CROSSCOMPILING)
++    find_program(Protobuf_PROTOC_EXECUTABLE REQUIRED NAMES protoc)
++    if(NOT TARGET protobuf::protoc)
++        add_executable(protobuf::protoc IMPORTED)
++    endif()
++    set_target_properties(protobuf::protoc PROPERTIES
++        IMPORTED_LOCATION "${Protobuf_PROTOC_EXECUTABLE}")
++endif()
++
+ find_package(gRPC QUIET)
+-if(gRPC_FOUND AND TARGET gRPC::grpc AND TARGET gRPC::grpc_cpp_plugin)
++if(gRPC_FOUND AND TARGET gRPC::grpc)
++    # When cross compiling we look for the native grpc_cpp_plugin
++    if(CMAKE_CROSSCOMPILING)
++        find_program(GRPC_CPP_PLUGIN REQUIRED NAMES grpc_cpp_plugin)
++        if(NOT TARGET gRPC::grpc_cpp_plugin)
++            add_executable(gRPC::grpc_cpp_plugin IMPORTED)
++        endif()
++        set_target_properties(gRPC::grpc_cpp_plugin PROPERTIES
++                IMPORTED_LOCATION "${GRPC_CPP_PLUGIN}")
++    elseif(TARGET gRPC::grpc_cpp_plugin)
++        get_target_property(GRPC_CPP_PLUGIN gRPC::grpc_cpp_plugin LOCATION)
++    else()
++        message(FATAL_ERROR "Found gRPC but no gRPC CPP plugin defined")
++    endif()
++
+     set(GRPC_LIBRARIES gRPC::gpr gRPC::grpc gRPC::grpc++)
+-    get_target_property(GRPC_CPP_PLUGIN gRPC::grpc_cpp_plugin LOCATION)
+     get_target_property(GRPC_INCLUDE_DIR gRPC::grpc INTERFACE_INCLUDE_DIRECTORIES)
+ else()
+     include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/FindGRPC.cmake)
+-- 
+2.39.3 (Apple Git-145)
+
diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
index d724abc3c..e8299bab5 100644
--- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
+++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
@@ -4,7 +4,11 @@ HOMEPAGE = "https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eae7da6a2cd1788a5cf8a9f838cf6450"
 
-SRC_URI += "git://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3.git;branch=master;protocol=https"
+SRC_URI = " \
+    git://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3.git;branch=master;protocol=https \
+    file://0001-cmake-fix-when-cross-compiling.patch \
+"
+
 SRCREV = "e31ac4d4caa55fa662e207150ba40f8151b7ad96"
 
 inherit cmake
-- 
2.34.1


