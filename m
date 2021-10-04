Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255B2C433FE
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 20:21:44 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web12.15688.1633378902537230319
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Oct 2021 13:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g7cniXoy;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id u18so76863679lfd.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Oct 2021 13:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SuxkLLz+4qYnBb3ZnbLVOFNBFZo2gWdPpU9qmG0CKR8=;
        b=g7cniXoynA+fBU14A01PiGUV8sJbtx3NfYanJIw7p2orkb5Pf3ahsv6USKCbfPwFnW
         Un//kYs/uxhQekJln/wPALTz2E6oQlXzrCGjYZ02M2aylPjQTT5TrQanSPOhL/HTRkEO
         XjYPJkdLMssDQomVoakzp7jVW5KZBw2AiyeSykaDmsX0sFWA9gsImHtSXT9/1GZVIzrA
         r1fbWKqXXJrXow22cpOKLGKaQB0J+1gj0xfJ55HJdHK2chveH1QH5YsqWG4RnK96lYHU
         r4pMS/JXzxXfUH9pkQtrvMerHK6nRTzgzbF0Nx/7kHv4gs7oAq4tS0Q/M27qWnf6GwME
         BS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SuxkLLz+4qYnBb3ZnbLVOFNBFZo2gWdPpU9qmG0CKR8=;
        b=ZY7VHkUeK8HV64dfrO/HqkzkfPtO382t4mw0R4uxIecrYMRCVefYsQmaKI2NHT8qT+
         2M7LNDMR/OhEcoUYoWI9RNAFzNVfg0IGsPAgG+5qCsWGGcsDvTbDwsbbEfcevauGSjCN
         kLvfGFtcrlq3ZX9QhN+i6bfXmlEpT2t0V6mmyg2ONt57yGY/khGeRiFjVxV1kq++FUuN
         3HpYRdDnsK1H0qtSHv4x1ESg7MarTfQNfB4VLGPiPXD/gLJJG8Sdjpyj5s7XWHUXWlX/
         U+WAAGyr+DsBM42Z1AY0zoIxw119U7cUDvzwE6Jcgk9j+qGa1RnkUPznquZypJ4+AR+d
         uPGA==
X-Gm-Message-State: AOAM5315wxy8iuuhjZ1wK1swmx0JFPOxiwPa/w/k3aglZV51VKunHRAx
	RUuUNq8Ty2J1rQXrXGR+HNBzf3AyTmqu5g==
X-Google-Smtp-Source: 
 ABdhPJzVmwnlcfYhj+NSaFeVhCZR7IUqZS/BPQKH6VRNZvzAUuV5ULsQB19qGgeMWESLbzpZcyZvSg==
X-Received: by 2002:a2e:5705:: with SMTP id l5mr18903044ljb.456.1633378900627;
        Mon, 04 Oct 2021 13:21:40 -0700 (PDT)
Received: from slackware.local ([185.253.97.13])
        by smtp.gmail.com with ESMTPSA id
 l6sm1689988lfe.218.2021.10.04.13.21.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 13:21:40 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] grpc: fix cross-compilation of grpc applications
Date: Mon,  4 Oct 2021 22:21:31 +0200
Message-Id: 
 <03757aa00098229ff80af93f7bdc8ff3cb9f9bfa.1633378334.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1633378334.git.uvv.mail@gmail.com>
References: <cover.1633378334.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Oct 2021 20:21:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93199

Backport a patch from grpc/master to be able to build c++ applications
when gRPC_BUILD_GRPC_CPP_PLUGIN=OFF. The patch should be dropped on the
recipe upgrade

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 ...compilation-with-gRPC_BUILD_GRPC_CPP.patch | 55 +++++++++++++++++++
 meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb  |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch b/meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch
new file mode 100644
index 000000000..ce660f5cc
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch
@@ -0,0 +1,55 @@
+From 83a66aa45d63d79cbccc47a65998723a7d2d7637 Mon Sep 17 00:00:00 2001
+From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
+Date: Wed, 23 Jun 2021 14:22:59 +0200
+Subject: [PATCH] cmake: fix cross-compilation with
+ gRPC_BUILD_GRPC_CPP_PLUGIN=OFF (#26292)
+
+* cmake: fix cross-compilation with gRPC_BUILD_GRPC_CPP_PLUGIN=OFF
+
+When cross-compiling gRPC, a _native_ version of 'grpc_cpp_plugin' is
+searched in the environment. For most use cases, a _cross_ version of this
+file is not needed and gRPC_BUILD_GRPC_CPP_PLUGIN can be set to OFF.
+
+However, when cross-building with -DgRPC_BUILD_GRPC_CPP_PLUGIN=OFF, there
+are some build errors, for example:
+
+make[3]: *** No rule to make target 'grpc_cpp_plugin', needed by 'gens/src/proto/grpc/reflection/v1alpha/reflection.grpc.pb.cc'.  Stop.
+
+This is because there is still a hard dependency on 'grpc_cpp_plugin' for
+these targets, not taking into account the cross-compilation case.
+
+Fix by depending on the variable gRPC_CPP_PLUGIN, which is set correctly for
+either cross or native case.
+
+* regenerate projects
+---
+ CMakeLists.txt                    | 2 +-
+ templates/CMakeLists.txt.template | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index eeaf0b43c7..c60a64917a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -319,7 +319,7 @@ function(protobuf_generate_grpc_cpp)
+            --plugin=protoc-gen-grpc=${_gRPC_CPP_PLUGIN}
+            ${_protobuf_include_path}
+            ${REL_FIL}
+-      DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} grpc_cpp_plugin
++      DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} ${_gRPC_CPP_PLUGIN}
+       WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
+       COMMENT "Running gRPC C++ protocol buffer compiler on ${FIL}"
+       VERBATIM)
+diff --git a/templates/CMakeLists.txt.template b/templates/CMakeLists.txt.template
+index cef2534cbd..f0afe5108e 100644
+--- a/templates/CMakeLists.txt.template
++++ b/templates/CMakeLists.txt.template
+@@ -389,7 +389,7 @@
+              --plugin=protoc-gen-grpc=<%text>${_gRPC_CPP_PLUGIN}</%text>
+              <%text>${_protobuf_include_path}</%text>
+              <%text>${REL_FIL}</%text>
+-        DEPENDS <%text>${ABS_FIL}</%text> <%text>${_gRPC_PROTOBUF_PROTOC}</%text> grpc_cpp_plugin
++        DEPENDS <%text>${ABS_FIL}</%text> <%text>${_gRPC_PROTOBUF_PROTOC}</%text> <%text>${_gRPC_CPP_PLUGIN}</%text>
+         WORKING_DIRECTORY <%text>${CMAKE_CURRENT_SOURCE_DIR}</%text>
+         COMMENT "Running gRPC C++ protocol buffer compiler on <%text>${FIL}</%text>"
+         VERBATIM)
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
index e2b86dad1..dfb44b819 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
@@ -23,6 +23,7 @@ S = "${WORKDIR}/git"
 SRCREV_grpc = "96b73272eadc01afb5fb45b92b408c47e4387274"
 BRANCH = "v1.38.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
+           file://0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch \
            "
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
 CXXFLAGS:append:class-native = " -Wl,--no-as-needed"
-- 
2.28.0


