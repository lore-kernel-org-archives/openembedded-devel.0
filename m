Return-Path: <brgl@bgdev.pl>
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail.openembedded.org (Postfix) with ESMTP id 838CA79AC1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 13:55:15 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id g32-v6so4986416edg.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 06:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gsstcBoABDWjY6B+l29mnGxCi2gFzLXEJIHThevNcOs=;
	b=ua4RrQ6REZqIATw6iBSjBoju5VkLcKD239CfJwEVgzrzKjEIWfWwIulRDKJNIPVNI2
	WkHM2DA0qlCxlYulsvtSBHrqGF6nLEzzQtKyo3fedKN4gv4NIfWenYQaqX27wVXeSohe
	jsqk0HEVqNCi1rzHTUMxPzrw51ZNObstzD2VE+FzZT4eizw1dKArPAj+3Rq0RlSH59o8
	bQinceI34NnlSPz5PHn2UGNreHLgdJFuxpZ7eAOaf9xksf5UiBBvqqiOtNz+2xymtwOa
	HzHLWmGmCxyr53TzEKE+cAZVxfIoJHgqu7KpMCubWzWhQx+w0+XYtd3ZBqKoHFVY5dj9
	dUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gsstcBoABDWjY6B+l29mnGxCi2gFzLXEJIHThevNcOs=;
	b=Ai060TxzrbK+i1nZJWdf1AVpCX5tleSpxAykSv1jxCR/CAenda0U17z7tXIZueGO7H
	a45rx7qBJi8cK0IK+WqVyG3w6l+bgFnx5yOIRqg59p++pRFU+Q3tn7USeA5ZVgzU3ee0
	KQvU3RAmeXxCGPUiUSbnWVkuyTn52ETCuAt2MWx9ccuE3Rpr3fpHWh5ei2r/LpBigJaw
	Ks+4b7h85cCLKo6bZ4489pPsVSduPQwA2yaGlV35dNYRvh6joAhgvAmuC3RN5EnRNlP/
	IeolQ/lSJ68sDCOZvTv+TW1LOFjo5xxCaMT3NlN/DEyQWoaLCmFWFT/wp2Cu+oc3HLPM
	IAqw==
X-Gm-Message-State: ABuFfohAZl+J8M79EYgQG89S7MDtruPu8VeW99Arm8gLOs8KMjGG0G+C
	0WAgMc9lKhMJYRwGiEDayw5lrLrxnKlFCg==
X-Google-Smtp-Source: ACcGV61WhhL62OkmeLNWuyTYiTwQml9b652Q0hozSGDpC+ThhUii+VbRUOhqosIRU7PW76XcgvDLIA==
X-Received: by 2002:a50:a3fd:: with SMTP id
	t58-v6mr42627544edb.238.1539179715894; 
	Wed, 10 Oct 2018 06:55:15 -0700 (PDT)
Received: from debian-brgl.guest.int.avast.com ([91.213.143.211])
	by smtp.gmail.com with ESMTPSA id
	l34-v6sm7650277eda.54.2018.10.10.06.55.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 06:55:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>, Hiram Lew <lew@avast.com>,
	Jan Kaisrlik <jan.kaisrlik@avast.com>, Lukas Karas <karas@avast.com>
Date: Wed, 10 Oct 2018 15:54:57 +0200
Message-Id: <20181010135457.22007-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010135457.22007-1-brgl@bgdev.pl>
References: <20181010135457.22007-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-networking][PATCH 3/3] grpc: fix grpc_cpp_plugin interpfor nativesdk
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2018 13:55:15 -0000
Content-Transfer-Encoding: 8bit

From: Jan Kaisrlik <jan.kaisrlik@avast.com>

When building grpc for nativesdk the project tries to execute the
nativesdk grpc_cpp_plugin instead of the host one. Apply the patch
fixing the cross-compilation for nativesdk build and modify its
contents to reflect its new purpose.

Also: add grpc-native to dependencies.

Signed-off-by: Hiram Lew <lew@avast.com>
Signed-off-by: Jan Kaisrlik <jan.kaisrlik@avast.com>
Signed-off-by: Lukas Karas <karas@avast.com>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 ...txt-Fix-grpc_cpp_plugin-path-during-cross.patch | 27 ++++++++++++----------
 .../recipes-devtools/grpc/grpc_1.14.1.bb           |  2 ++
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
index a83d854..54e0b99 100644
--- a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
+++ b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
@@ -1,24 +1,26 @@
-From cc6dbabea0e452ebc93682df860a79ed9a45722e Mon Sep 17 00:00:00 2001
+From 6d606f1101c1a172fb6d738d6f1865aa61849e68 Mon Sep 17 00:00:00 2001
 From: Alexey Firago <alexey_firago@mentor.com>
 Date: Fri, 20 Oct 2017 00:04:19 +0300
 Subject: [PATCH] CMakeLists.txt: Fix grpc_cpp_plugin path during
- cross-compilation
+ cross-compiling or native build
 
 Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
+Signed-off-by: Hiram Lew <lew@avast.com>
+Signed-off-by: Jan Kaisrlik <jan.kaisrlik@avast.com>
 ---
  CMakeLists.txt                    | 9 ++++++++-
  templates/CMakeLists.txt.template | 9 ++++++++-
  2 files changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f9cd630..9663934 100644
+index a59fd81..cd90424 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -170,6 +170,13 @@ function(protobuf_generate_grpc_cpp)
+@@ -160,6 +160,13 @@ function(protobuf_generate_grpc_cpp)
      return()
    endif()
-
-+  #if cross-compiling, find host plugin
+ 
++  #if cross-compiling or nativesdk, find host plugin
 +  if(CMAKE_CROSSCOMPILING)
 +      find_program(gRPC_CPP_PLUGIN grpc_cpp_plugin)
 +  else()
@@ -28,7 +30,7 @@ index f9cd630..9663934 100644
    set(_protobuf_include_path -I . -I ${_gRPC_PROTOBUF_WELLKNOWN_INCLUDE_DIR})
    foreach(FIL ${ARGN})
      get_filename_component(ABS_FIL ${FIL} ABSOLUTE)
-@@ -345,7 +352,7 @@ function(protobuf_generate_grpc_cpp)
+@@ -177,7 +184,7 @@ function(protobuf_generate_grpc_cpp)
        COMMAND ${_gRPC_PROTOBUF_PROTOC_EXECUTABLE}
        ARGS --grpc_out=generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}
             --cpp_out=${_gRPC_PROTO_GENS_DIR}
@@ -38,14 +40,14 @@ index f9cd630..9663934 100644
             ${REL_FIL}
        DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} grpc_cpp_plugin
 diff --git a/templates/CMakeLists.txt.template b/templates/CMakeLists.txt.template
-index 64daf04..a7e8629 100644
+index de13d02..b22bd5c 100644
 --- a/templates/CMakeLists.txt.template
 +++ b/templates/CMakeLists.txt.template
 @@ -209,6 +209,13 @@
        return()
      endif()
-
-+    #if cross-compiling, find host plugin
+ 
++    #if cross-compiling or nativesdk, find host plugin
 +    if(CMAKE_CROSSCOMPILING)
 +        find_program(gRPC_CPP_PLUGIN grpc_cpp_plugin)
 +    else()
@@ -55,7 +57,7 @@ index 64daf04..a7e8629 100644
      set(_protobuf_include_path -I . -I <%text>${_gRPC_PROTOBUF_WELLKNOWN_INCLUDE_DIR}</%text>)
      foreach(FIL <%text>${ARGN}</%text>)
        get_filename_component(ABS_FIL <%text>${FIL}</%text> ABSOLUTE)
-@@ -390,7 +397,7 @@
+@@ -226,7 +233,7 @@
          COMMAND <%text>${_gRPC_PROTOBUF_PROTOC_EXECUTABLE}</%text>
          ARGS --grpc_out=<%text>generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}</%text>
               --cpp_out=<%text>${_gRPC_PROTO_GENS_DIR}</%text>
@@ -64,5 +66,6 @@ index 64daf04..a7e8629 100644
               <%text>${_protobuf_include_path}</%text>
               <%text>${REL_FIL}</%text>
          DEPENDS <%text>${ABS_FIL}</%text> <%text>${_gRPC_PROTOBUF_PROTOC}</%text> grpc_cpp_plugin
---
+-- 
 2.7.4
+
diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb b/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
index 7b3f736..d236714 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "gflags c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl"
 DEPENDS_append_class-target = " gtest grpc-native "
+DEPENDS_append_class-nativesdk = " grpc-native "
 
 S = "${WORKDIR}/git"
 SRCREV = "d8020cb6daa87f1a3bb3b0c299bc081c4a3de1e8"
@@ -16,6 +17,7 @@ SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH} \
            file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
            "
 SRC_URI_append_class-target = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
+SRC_URI_append_class-nativesdk = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
 
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
 CXXFLAGS_append_class-native = " -Wl,--no-as-needed"
-- 
2.7.4


