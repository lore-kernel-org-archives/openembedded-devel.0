Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990A3EEB584
	for <webhook@archiver.kernel.org>; Sat,  9 Sep 2023 09:35:26 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.13862.1694252124918056918
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Sep 2023 02:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rEmsLyuu;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-401187f8071so18013415e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 02:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694252122; x=1694856922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3IRUxAP6TZRsMoByLp791YA7R9j0Atv2jRoActYUnY=;
        b=rEmsLyuu6GQlrDq9rux9HZEl054LjtbZY7D77qtsMuU0vexoGt/tBBwX7rB3qF4jf3
         69o82iaxvMjo82U4EPFPBL6hoDdDPDhv6xjk+cuhq3+m4XbJdwgpT5wRLo9+Z9yf2Mjm
         uPoMgnBe6MRtKR9hPcITw+rgiJ4PROVF+F4BA1EnOtc7QUHqoxkj7QSkSemU89cDn1sn
         Vd19ovEN8HT7FZ/ST3IeRTaEP62Xz5ycaoFbMjMroEdKIsT5PZ/oP3YR5gFTRuzhd0Sq
         Nwi0i+qvmqazFGB1VMRFDbBxXnTqp07nFw10l24TEDdYtzGybKjBmHwX+gx0BhKdnShZ
         xing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694252122; x=1694856922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3IRUxAP6TZRsMoByLp791YA7R9j0Atv2jRoActYUnY=;
        b=AYTkObQkxAYcpihov3S8z5WAlwMxjph6GPqgBqaFUsWBDTCLRQb8Y8S3jmanFDhvF+
         +vFGJu1Bn6DAXLqH5oTd+Kp5dWVrb07xvAqu8M2HklIiMivek3aJUEOJT+y8SfkyCXTC
         pIK9AKDOmwB+P9G/vbwPB9Es0S382WSPNhg+yzgDsVzv6VqC2oXiO5WZEX7A6kWqqUwd
         AK0o8JJsqypa+PsPj1G0vAXFBjTaUsiG2TAOwj46jwh3p83vJ/eGpPCdBxEnUfyrKs+N
         eZZ5f5wuhcTovZQt+ZtaqOxepPROz2OCsOnVNCdNyheqjZhruCF3qvBLBvkyy3pQlCUI
         vs7A==
X-Gm-Message-State: AOJu0YyBaV6uXWV008GzhbJ81/f0f6db0VoXrXAWGQ7qHWkXb1PJLVfl
	v5ePoMcL131envhviHJIDg2PERa+zvk=
X-Google-Smtp-Source: AGHT+IENhYI5lowCe8ESQD5+fN2UaN72mMSFKzOFvNrkxlmt3imc6J7OPwX6mqf+RTYUs6YdWV++6Q==
X-Received: by 2002:a05:600c:2241:b0:3fe:1b5e:82 with SMTP id a1-20020a05600c224100b003fe1b5e0082mr2701950wmm.20.1694252122040;
        Sat, 09 Sep 2023 02:35:22 -0700 (PDT)
Received: from firmware-builder.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600c014300b003fefe70ec9csm7302565wmm.10.2023.09.09.02.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 02:35:21 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Xiangyu Chen <xiangyu.chen@windriver.com>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 1/4] protobuf: upgrade 3.21.12 -> 4.22.2
Date: Sat,  9 Sep 2023 11:35:14 +0200
Message-Id: <20230909093517.444924-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230909093517.444924-1-peron.clem@gmail.com>
References: <20230909093517.444924-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 09:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104810

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 ...efile-respect-CXX-LDFLAGS-variables-fix-.patch | 15 +++++++++------
 .../{protobuf_3.21.12.bb => protobuf_4.22.2.bb}   | 11 ++++++++---
 2 files changed, 17 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb => protobuf_4.22.2.bb} (86%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
index 36c3c597a..7c4bf260e 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
@@ -30,7 +30,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/examples/Makefile b/examples/Makefile
-index 1c7ec8d63..85f591231 100644
+index ef7a4ef58..7206e14e1 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
 @@ -2,6 +2,8 @@
@@ -42,17 +42,20 @@ index 1c7ec8d63..85f591231 100644
  all: cpp java python
  
  cpp:    add_person_cpp    list_people_cpp
-@@ -40,11 +42,11 @@ protoc_middleman_dart: addressbook.proto
+@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
  
  add_person_cpp: add_person.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=c++11 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
-+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
+-	c++ -std=c++14 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp #$(CXX) -std=c++17 $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
  
  list_people_cpp: list_people.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=c++11 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
-+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
+-	c++ -std=c++14 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp #$(CXX) -std=c++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
  
  add_person_dart: add_person.dart protoc_middleman_dart
  
+--
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
similarity index 86%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
index d95e1c20f..b97da6ea6 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
@@ -7,12 +7,12 @@ SECTION = "console/tools"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 
-DEPENDS = "zlib"
+DEPENDS = "zlib abseil-cpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "f0dc78d7e6e331b8c6bb2d5283e06aa26883ca7c"
+SRCREV = "81f89d509d6771dcccb619cbe26ac86cec472582"
 
-SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=21.x;protocol=https \
+SRC_URI = "gitsm://github.com/protocolbuffers/protobuf.git;branch=22.x;protocol=https \
            file://run-ptest \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
            file://0001-Fix-linking-error-with-ld-gold.patch \
@@ -35,6 +35,7 @@ EXTRA_OECMAKE += "\
     -Dprotobuf_BUILD_LIBPROTOC=ON \
     -Dprotobuf_BUILD_TESTS=OFF \
     -Dprotobuf_BUILD_EXAMPLES=OFF \
+    -Dprotobuf_ABSL_PROVIDER="package" \
 "
 
 TEST_SRC_DIR = "examples"
@@ -52,7 +53,11 @@ do_compile_ptest() {
 	cp ${S}/${TEST_SRC_DIR}/Makefile "${B}/${TEST_SRC_DIR}/"
 	sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
 	sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Cflags:|Cflags: -I${WORKDIR}/recipe-sysroot{includedir} |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
 	sed -e 's|Libs:|Libs: -L${B}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Libs:|Libs: -L${WORKDIR}/recipe-sysroot/usr/lib|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Libs:|Libs: -labsl_log_internal_check_op |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Libs:|Libs: -labsl_log_internal_message |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
 	# Until out-of-tree build of examples is supported, we have to use this approach
 	sed -e 's|../src/google/protobuf/.libs/timestamp.pb.o|${B}/CMakeFiles/libprotobuf.dir/src/google/protobuf/timestamp.pb.cc.o|' -i "${B}/${TEST_SRC_DIR}/Makefile"
 	export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
-- 
2.34.1


