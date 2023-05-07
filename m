Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55616C7EE26
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:44:25 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.94804.1683499457328907988
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 15:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lekhCm5U;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9661047f8b8so299394366b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 15:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683499456; x=1686091456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aY2ue3Q+SafhqHeecxwT/ai89xf+1gKjb4ppWhy7flo=;
        b=lekhCm5UARDvNpP5g7+4ohJws8ByD/VkclZTK7Eb879+0HBWGrfvZoh3o2WhS8kqkM
         7nnpB76UpRHHiFv3tU1VaeU04N3w8ZOb0uREuWDrh8MZ6a2L9sS12Uk9BBDZGSSx/g9O
         vo6tz3nPVGnn9pNP5lj+CjqcxyKnMPnEGJCqDqzANuga2A8owrNCjtvyYWzUHczKay7h
         xiUJfw26HiZ+AOfnKixClEb4hAcGyZlc+MM27mZ5I7NuQeGWWsiUG0HvDh8ghnnFJEo4
         eUM+441cWtHRQPOFjdouZ1X22Yj69xGGP48oEOQUZJ7aCM8n/MuprasO9cWEzpsDmHby
         Pz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683499456; x=1686091456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aY2ue3Q+SafhqHeecxwT/ai89xf+1gKjb4ppWhy7flo=;
        b=FSMIYoTXwZSl69uqQirT2dkLDSQNWBoGD5x3HB/tlppz4OYCrOgnDFXWyQDItehhme
         1tgtS8d+0AhyLSJgLg5Kdistxg9CraBP+pLhOxKjivcf8l1LUTUJ59MYP5T0o5jQOheY
         GNfLQrSd44ftDa+lj3LxSAE3bgrqYO4+VDEraN9C2fFFQZzkUKdqzsvzhjxWD6x3bLXg
         l7q2+GIpNW2d5QHLMPk1ZUhkp/2+v4H95vxJmb/YDeYVRLTlYJR4IRGtJEOBqc1VqvpB
         8ju3M2SCw14u4bJzfvKfZ6W0qGpL73cJilCGGeRY6EjfSPmzpld2Z+1tD4cHLH0GLkTV
         iW/w==
X-Gm-Message-State: AC+VfDy0xeF/PNAl8OaXy4TkOrlYIXdAM3VJOiwB70FD6IWfxZLXjJ6y
	nLVcfMCRBeVFzl4OEhWmdem933r4b58=
X-Google-Smtp-Source: ACHHUZ5gheHrFp7sSmf3n/xO9k1yoCAA/onyl9cGv8dRh46y7y01GHHmmg8e678tkanYLti2SeCHVQ==
X-Received: by 2002:a17:907:da4:b0:966:4d99:b0aa with SMTP id go36-20020a1709070da400b009664d99b0aamr2298654ejc.59.1683499455701;
        Sun, 07 May 2023 15:44:15 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z6-20020a170906240600b0094f4d2d81d9sm4140134eja.94.2023.05.07.15.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 15:44:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 14/16] nanopb: fix installed-vs-shipped with multilib
Date: Mon,  8 May 2023 00:43:52 +0200
Message-Id: <20230507224354.1149327-14-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
References: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 22:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102376

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


