Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C36C41513
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:48 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.3060.1716315046992228607
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LC3/5lyF;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1ee0132a6f3so3484685ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315046; x=1716919846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzqxsUmSppQIW0RouJbSl23ZaL24i4ZbiDCORqw3Hyw=;
        b=LC3/5lyF7eoHUewWoUeR1DGrqiuMP6yukcpn8UZZWwtMz8gLd6ecDp3TSES/hNUd1m
         4nic6eOe8ZiQp56csKvCy+E9y1fAlevKaJbJxI7rXBqp07Y+fNjJSNTGEIoZiOpZNMGC
         uRSZ3c0W+7o5qLjiPAMLefq2IngZKysI74s7+8m8vjF++osWY0zwU9IKvktfA7qLOgB2
         2P1W6NjLqxwRIQsOgJ0562Ef5iGxt/t731AeDYL+EOHnXcM5pUdI8Z+pbEJWCS66Y5Ku
         h7Qi27FWseeQqPdQ16EmX+X9RRzMIQ4NiEzSQmTjIJk3z30EVqxpl4qMFpUktl5IkXNp
         qCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315046; x=1716919846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzqxsUmSppQIW0RouJbSl23ZaL24i4ZbiDCORqw3Hyw=;
        b=UOOeFqukkOJpCtX5FpodzldLzeNFrhObssX364maPQIJeUJo8xi3TfM7oXCbtCKoW/
         ERIn8ipMkPHOQNZ5Mo9otXunKwhKlNonJHFyw56Dudiixd035tUoePGm1BQr8xSWx7+c
         oFp/93fcO8/lgwWzHMWnLxUUADVMOSr6Ecp5gXxCkG9LNlM8aypC5twlBPNQL0mL4ksj
         7BsYqACDzJDeRwKLVEtv2njQXogF2asl/pYuI1BawA4Ini1PesyseSjQ3x7lmsruKt/h
         oC3m+H/1gTzf3v7GOQVU9KO1dB4ebDfIeYjZJzwm9dQxwSXCKvP8fS0/YCLupiSqtalf
         3DvQ==
X-Gm-Message-State: AOJu0YwzMx8K2op+KHYYwBdDZHsA+fTJSt/JjPj0ZcQtAgKwEgWICm0W
	uAKVjGNAccjA7JzgNH+BuFhiJFTOPyKzB96Jdepu4R9OVqv1jDcfguyiHa8M/O0=
X-Google-Smtp-Source: AGHT+IEZvYLSRlOjrxFjE9CYD/gUe/WGmfbBFpQ5R9ppQJj9b78L2IQJBfLfDgRsclsS5/gHtS8Q4w==
X-Received: by 2002:a17:902:8f8b:b0:1e5:3684:6189 with SMTP id d9443c01a7336-1ef4404ccdemr291972435ad.63.1716315046218;
        Tue, 21 May 2024 11:10:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 20/22] etcd-cpp-apiv3: Upgrade to 0.15.4 release
Date: Tue, 21 May 2024 11:10:21 -0700
Message-ID: <20240521181024.426176-20-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110469

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-cmake-fix-when-cross-compiling.patch | 68 -------------------
 ...iv3_0.15.3.bb => etcd-cpp-apiv3_0.15.4.bb} |  3 +-
 2 files changed, 1 insertion(+), 70 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch
 rename meta-oe/recipes-extended/etcd/{etcd-cpp-apiv3_0.15.3.bb => etcd-cpp-apiv3_0.15.4.bb} (84%)

diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch
deleted file mode 100644
index ce12d4270a..0000000000
--- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From cb79329010d73e36ce64830914005f1c17f8f53c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
-Date: Sat, 23 Sep 2023 11:32:18 +0200
-Subject: [PATCH] cmake: fix when cross compiling
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-In order to generate protobuf files CMake need to use the protoc
-and grpc-cpp-plugin compiled for the host architecture.
-
-Unfortunately, the protoc and grpc-cpp-plugin in the gRPC CMake
-configuration file are the one for the target architecture.
-
-Fix this by properly finding the correct executable when
-CMake is cross compiling.
-
-Signed-off-by: Clément Péron <peron.clem@gmail.com>
----
-Upstream-Status: Pending
-
- CMakeLists.txt | 28 ++++++++++++++++++++++++++--
- 1 file changed, 26 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5aa1310..80ebad2 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -120,10 +120,34 @@ if(Protobuf_PROTOC_EXECUTABLE)
-     endif()
- endif()
- 
-+# When cross compiling we look for the native protoc compiler
-+# overwrite protobuf::protoc with the proper protoc
-+if(CMAKE_CROSSCOMPILING)
-+    find_program(Protobuf_PROTOC_EXECUTABLE REQUIRED NAMES protoc)
-+    if(NOT TARGET protobuf::protoc)
-+        add_executable(protobuf::protoc IMPORTED)
-+    endif()
-+    set_target_properties(protobuf::protoc PROPERTIES
-+        IMPORTED_LOCATION "${Protobuf_PROTOC_EXECUTABLE}")
-+endif()
-+
- find_package(gRPC QUIET)
--if(gRPC_FOUND AND TARGET gRPC::grpc AND TARGET gRPC::grpc_cpp_plugin)
-+if(gRPC_FOUND AND TARGET gRPC::grpc)
-+    # When cross compiling we look for the native grpc_cpp_plugin
-+    if(CMAKE_CROSSCOMPILING)
-+        find_program(GRPC_CPP_PLUGIN REQUIRED NAMES grpc_cpp_plugin)
-+        if(NOT TARGET gRPC::grpc_cpp_plugin)
-+            add_executable(gRPC::grpc_cpp_plugin IMPORTED)
-+        endif()
-+        set_target_properties(gRPC::grpc_cpp_plugin PROPERTIES
-+                IMPORTED_LOCATION "${GRPC_CPP_PLUGIN}")
-+    elseif(TARGET gRPC::grpc_cpp_plugin)
-+        get_target_property(GRPC_CPP_PLUGIN gRPC::grpc_cpp_plugin LOCATION)
-+    else()
-+        message(FATAL_ERROR "Found gRPC but no gRPC CPP plugin defined")
-+    endif()
-+
-     set(GRPC_LIBRARIES gRPC::gpr gRPC::grpc gRPC::grpc++)
--    get_target_property(GRPC_CPP_PLUGIN gRPC::grpc_cpp_plugin LOCATION)
-     get_target_property(GRPC_INCLUDE_DIR gRPC::grpc INTERFACE_INCLUDE_DIRECTORIES)
- else()
-     include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/FindGRPC.cmake)
--- 
-2.39.3 (Apple Git-145)
-
diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
similarity index 84%
rename from meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
rename to meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
index 2e149577dc..88a8ba3469 100644
--- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
+++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
@@ -6,11 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eae7da6a2cd1788a5cf8a9f838cf6450"
 
 SRC_URI = " \
     git://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3.git;branch=master;protocol=https \
-    file://0001-cmake-fix-when-cross-compiling.patch \
     file://0001-include-stdint.h-for-int64_t-types.patch \
 "
 
-SRCREV = "e31ac4d4caa55fa662e207150ba40f8151b7ad96"
+SRCREV = "ba6216385fc332b23d95683966824c2b86c2474e"
 
 inherit cmake
 
-- 
2.45.1


