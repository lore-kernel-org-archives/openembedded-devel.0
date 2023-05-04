Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A28CC77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 07:33:25 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.44023.1683185596248873471
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 May 2023 00:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ovAwfId8;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-50bc070c557so192171a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 00:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683185595; x=1685777595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aY2ue3Q+SafhqHeecxwT/ai89xf+1gKjb4ppWhy7flo=;
        b=ovAwfId8nmCv0GXf0FZr2C2/O0gP0aBUlvWDcvvGL6plUC+Oz+YIc8eMEWO2avqxmI
         Ti7cJsvIV9tCxjIyD2VHvKTUkFJwFBx16MPEr/WZ+SHzCunxRiTfxi5b6YMqEQqMmvsC
         rGRKqA4rHGr34aAhGBbM/4Ay+M8HzHAfBIpUMBMB6oGtI9Pp8uMECvrEQVG1PiJBZ9tR
         vrYv+2RjGUaTSvOycjxM2YCeQypRNpFreOHKIrBply+blXkwrVAGg2NONyMtXe1TvSTs
         AqPiizwVFXpkgHKkNX4AbpuA03EBFU8NtdGwbNLTfcERSJKrH1SFyhO1iZt42aaoz2qU
         3stA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683185595; x=1685777595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aY2ue3Q+SafhqHeecxwT/ai89xf+1gKjb4ppWhy7flo=;
        b=lEt8uIcX9agZFGKHBPEivi2ffdG6Cwy+tNrIIaqk9VOI/nSxkHWM8EXiBhSbhJnPv3
         aTYFCFZjVdc4RVOOrpWFmv3ddsYkxKcVbN1oJ3nUrazBYMAjtJ07xPD4s+c8Pk4ySu2V
         Yg6QDNfA+Z8rDOa0NIa7dWljNLN9/e3RL3vsUutSkLjG5+0IJAOf63f3jAonmMwReLkL
         nFwpzDX2FNo2nMgLM0zcvfEIMLlVnbpbHzWm22RyP30AGNy5lXHg1n/JUio4DOj9W4SC
         xdIKpf/FzgEalEmUvwjqY6ro2kwbOlaPM4PlF1g4l8btWq+ik7eDoIayH7X6PdgFsmk7
         SOOQ==
X-Gm-Message-State: AC+VfDzgj3dyHc5/OsfBYefqRqSCanIxmjbYPepOTuqakjZ7kamwHiD4
	Ab7M2X3Cmdl8LnawNLlY0gJQfsCOOnE=
X-Google-Smtp-Source: ACHHUZ6B0i+IrxBQabWYs+e1cJ8+o4BfgrMJl8UVzwvbKWbzoEBBs7uy8xBENd/Ws15keZZcyvPGag==
X-Received: by 2002:a05:6402:5145:b0:50b:d1b6:c372 with SMTP id n5-20020a056402514500b0050bd1b6c372mr698697edd.26.1683185594605;
        Thu, 04 May 2023 00:33:14 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w17-20020aa7dcd1000000b004ad601533a3sm1562751edu.55.2023.05.04.00.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 00:33:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] nanopb: fix installed-vs-shipped with multilib
Date: Thu,  4 May 2023 09:33:07 +0200
Message-Id: <20230504073308.1251185-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504073308.1251185-1-Martin.Jansa@gmail.com>
References: <20230504073308.1251185-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 07:33:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102304

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


