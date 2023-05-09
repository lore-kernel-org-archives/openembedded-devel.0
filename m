Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9FFC7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:07:20 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.25908.1683616030669945288
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=D4v/GpqS;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f315712406so195305635e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683616029; x=1686208029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aY2ue3Q+SafhqHeecxwT/ai89xf+1gKjb4ppWhy7flo=;
        b=D4v/GpqS9nc5s316Zsl3cSSL5+4TrHypZhu6TqhfQGvvnBizIwUo2QKIt5dnafKeJY
         DIy1gLSyxjV0NvajPra3tPq02/8puzZ2kNQvMwGx3Dv5z7QqWd8D2psShX3/t/MMB0uw
         6xxZBI7IXrOrKWwqE7cns1SGuFZ//1u5wU7suUkrjtU3KAeX8cqiTYlhB8nzZIbjdZ/5
         IP/gCb0zOYp4Pk4Vxj1YkRmPksQ/tro19kaiU804gQ/CRxOdZ01p1zwRYTTHMUonTiM2
         rda9jfCA9zqXWkJICYFVjnitOoMmzgJv1VROdapZ3gQ3FGswnkzPo0AhQYIBrUqowbDA
         SDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616029; x=1686208029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aY2ue3Q+SafhqHeecxwT/ai89xf+1gKjb4ppWhy7flo=;
        b=kizb38grACDnmg/nCc9B/YnHzWS7/CQqZrkDk/67yg5k1Hs6GZsk5a7wGHrGkQG2iV
         XdAeu+/Yllz/m2XzG9ddRtWMp0/TU7qQzeAq/kyyh+UDXwaHtdydHiI7pxaQhEleaEu8
         GMKngUNiJVwB+Qr07V0A3w/X1yx1fO4Ko07MQDeLyuvLKdROs+oBX8LNItrG4CTGX9CE
         Js4//xhFCdUu06XGUwv8LG8LCBUWogDT3sHv8rVrX6T13wSizyO2H3X27dSchJDZQBCW
         IOI6OwTGo2VWFxD3ZBqgx2OiWHnFrE3vyzTxCNoquoaiYzS1l3ovGT/OVr6YtVUFbuoY
         phCA==
X-Gm-Message-State: AC+VfDwotgdWhkXNuOxoOlXEd7hkPmNeH67MIJq/z3rJYS1PgwKl933v
	qULsZyq6iSG8DV0rfDRp6MscjtYQj78=
X-Google-Smtp-Source: ACHHUZ45F/BALhL/C/78CWhPEJSvuY/NkjHmc+mUCny4UwCXbWe/XapErLdbzOScWTmpy9k3QzweHQ==
X-Received: by 2002:a05:6000:124b:b0:2fb:539c:5e89 with SMTP id j11-20020a056000124b00b002fb539c5e89mr8624911wrx.4.1683616029249;
        Tue, 09 May 2023 00:07:09 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id o1-20020a5d6701000000b003063a1cdaf2sm13395722wru.48.2023.05.09.00.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:07:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 14/16] nanopb: fix installed-vs-shipped with multilib
Date: Tue,  9 May 2023 09:06:53 +0200
Message-Id: <20230509070655.70784-14-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509070655.70784-1-Martin.Jansa@gmail.com>
References: <20230509070655.70784-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102482

* fixes:
  ERROR: QA Issue: nanopb: Files/directories were installed but not shipped in any package:
    /usr/lib
    /usr/lib/python3.11
    /usr/lib/python3.11/site-packages
    /usr/lib/python3.11/site-packages/proto
    /usr/lib/python3.11/site-packages/proto/nanopb_pb2.py
    /usr/lib/python3.11/site-packages/proto/nanopb.proto
    /usr/lib/python3.11/site-packages/proto/_utils.py
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  nanopb: 7 installed and not shipped files. [installed-vs-shipped]

when libdir is /usr/lib64 with multilib.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...llow-to-set-PYTHON_INSTDIR-from-outs.patch | 67 +++++++++++++++++++
 .../recipes-devtools/nanopb/nanopb_0.4.7.bb   |  6 +-
 2 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb/0001-CMakeLists.txt-allow-to-set-PYTHON_INSTDIR-from-outs.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb/0001-CMakeLists.txt-allow-to-set-PYTHON_INSTDIR-from-outs.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb/0001-CMakeLists.txt-allow-to-set-PYTHON_INSTDIR-from-outs.patch
new file mode 100644
index 0000000000..474f0f1584
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb/0001-CMakeLists.txt-allow-to-set-PYTHON_INSTDIR-from-outs.patch
@@ -0,0 +1,67 @@
+From 30c79d1b49839a15c05a0d0ca7e54787cd7988c6 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 4 May 2023 07:17:57 +0000
+Subject: [PATCH] CMakeLists.txt: allow to set PYTHON_INSTDIR from outside
+
+CMakeLists.txt used:
+
+find_package(Python REQUIRED COMPONENTS Interpreter)
+execute_process(
+    COMMAND ${Python_EXECUTABLE} -c
+        "import os.path, sys, sysconfig; print(os.path.relpath(sysconfig.get_path('purelib'), start=sys.prefix))"
+    OUTPUT_VARIABLE PYTHON_INSTDIR
+    OUTPUT_STRIP_TRAILING_WHITESPACE
+)
+
+but with python3native this returns:
+
+nanopb/0.4.7-r0/git $ ../recipe-sysroot-native/usr/bin/python3-native/python3 -c "import os.path, sys, sysconfig; print(os.path.relpath(sysconfig.get_path('purelib'), start=sys.prefix))"
+lib/python3.11/site-packages
+
+which doesn't respect target libdir which might be lib64 with multilib and with python3targetconfig
+it also doesn't work right because of the long relative path:
+
+nanopb/0.4.7-r0/build $ ../recipe-sysroot-native/usr/bin/python3-native/python3 -c "import os.path, sys, sysconfig; print(os.path.relpath(sysconfig.get_path('purelib'), start=sys.prefix))"
+../../../../../../../../../../../../usr/lib64/python3.11/site-packages
+
+CMake Error at cmake_install.cmake:46 (file):
+  file cannot create directory:
+  /OE/lge/build/starfish/nanbield/BUILD/work/o22-starfish-linux/nanopb/0.4.7-r0/image/usr/../../../../../../../../../../../../usr/lib64/python3.11/site-packages/proto.
+  Maybe need administrative privileges.
+
+Let CMake variable to be passed from the recipe to avoid this as we're already using
+${D}${PYTHON_SITEPACKAGES_DIR} in do_install:append anyway.
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Pending
+---
+ CMakeLists.txt | 16 +++++++++-------
+ 1 file changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8d241c5..7d3f993 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -39,13 +39,15 @@ if(NOT DEFINED CMAKE_INSTALL_CMAKEDIR)
+     set(CMAKE_INSTALL_CMAKEDIR "${CMAKE_INSTALL_LIBDIR}/cmake/nanopb")
+ endif()
+ 
+-find_package(Python REQUIRED COMPONENTS Interpreter)
+-execute_process(
+-    COMMAND ${Python_EXECUTABLE} -c
+-        "import os.path, sys, sysconfig; print(os.path.relpath(sysconfig.get_path('purelib'), start=sys.prefix))"
+-    OUTPUT_VARIABLE PYTHON_INSTDIR
+-    OUTPUT_STRIP_TRAILING_WHITESPACE
+-)
++if(NOT DEFINED PYTHON_INSTDIR)
++    find_package(Python REQUIRED COMPONENTS Interpreter)
++    execute_process(
++        COMMAND ${Python_EXECUTABLE} -c
++            "import os.path, sys, sysconfig; print(os.path.relpath(sysconfig.get_path('purelib'), start=sys.prefix))"
++        OUTPUT_VARIABLE PYTHON_INSTDIR
++        OUTPUT_STRIP_TRAILING_WHITESPACE
++    )
++endif()
+ 
+ if(nanopb_BUILD_GENERATOR)
+     set(generator_protos nanopb)
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.7.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.7.bb
index 897caea2a7..9ad558146c 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.7.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.7.bb
@@ -4,13 +4,17 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
 
 DEPENDS = "protobuf-native"
 
-SRC_URI = "git://github.com/nanopb/nanopb.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/nanopb/nanopb.git;branch=master;protocol=https \
+    file://0001-CMakeLists.txt-allow-to-set-PYTHON_INSTDIR-from-outs.patch \
+"
 SRCREV = "b97aa657a706d3ba4a9a6ccca7043c9d6fe41cba"
 
 S = "${WORKDIR}/git"
 
 inherit cmake python3native
 
+EXTRA_OECMAKE += "-DPYTHON_INSTDIR=${PYTHON_SITEPACKAGES_DIR}"
+
 do_install:append() {
     install -Dm 0755 ${S}/generator/nanopb_generator.py ${D}${bindir}/nanopb_generator.py
     install -Dm 0755 ${S}/generator/protoc-gen-nanopb ${D}${bindir}/protoc-gen-nanopb
-- 
2.40.1


