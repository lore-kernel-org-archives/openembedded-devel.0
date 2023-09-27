Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F38CE810AC
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 08:42:58 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.13266.1695804168090541637
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 01:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=idbRAoMw;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-405361bba99so102119715e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695804166; x=1696408966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3IRUxAP6TZRsMoByLp791YA7R9j0Atv2jRoActYUnY=;
        b=idbRAoMwqTzR2d8OdeWlbitPK2oblv/Bmvemtt9saowuasPE1oiXNMXfAImO9y/M2x
         WNDnIn1ogYixGPxJzBP31RdEElGV8VSOCSJueUKcMOBxWL7IUIdTlqXl6z8/yaLyEUk8
         F7rvg3FkmrXOUZU8kZmAPkCPUmaFVsZoz/LmnuKjC9+lTIHyAM0lDC+wY4AGXgew/xhJ
         MOocBjTsYI6RJO4ye08v5H+v0qn22Ibc/W8JNo+t7wKZ5mpVNDyCodQfPUQA49rXjFBe
         gB9IL0btr819Lu1xeye5vTsSwN/Nn3wQHsg6wQtufXsd0hdkElRN9nc9QChFPpqYo+f5
         MEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804166; x=1696408966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3IRUxAP6TZRsMoByLp791YA7R9j0Atv2jRoActYUnY=;
        b=B9l7kXxPG8DlMlewKFq9ujR4DdzG4n5wR1l1HHVrdLVDUshEGclBaEzhoD+czd3GFI
         GLBjt/bOZ2aMqflomEpR0pPfH6Ocyi5gHQhu2Ibx9vPWPRw3zjItfoDfHbbYql9jHWI7
         Vd7nSVAgXlDbjZ1Gz6PSp/Y7AZ5K8+GBOShd0mQ5tWAtdUNyd7oWIdUKJWOzbgRb5eLW
         e2vDyvdELTWSzQTfimDfnj46yxVmW+HUN62xz44v1HafU3nXowzD2/65bePktT5eCFbM
         ItjJj9UaEqObFNMIBlizYaCycvi97GRxMLH7Q5MtAGxlGa0A9ZdeYLGjRind+yEYSZHh
         hN1g==
X-Gm-Message-State: AOJu0Ywh+DUtCPqs2SO9H9U2ToMjObPpjBwBbLANDb8IVDLlUpyUBBPk
	sSMx7WzTW3xi9/e2pW25T6jr80MBLfo=
X-Google-Smtp-Source: AGHT+IHCfn6p+08ufyeErt7dF3J8NbuWH4om3hGeNEKzdnjVo9gfHEE/lTRvQ6Pi9653SfRlk9WCIQ==
X-Received: by 2002:a05:600c:218b:b0:3fe:5053:1a0b with SMTP id e11-20020a05600c218b00b003fe50531a0bmr1326068wme.11.1695804165357;
        Wed, 27 Sep 2023 01:42:45 -0700 (PDT)
Received: from firmware-builder.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc858000000b004030c778396sm20008616wml.4.2023.09.27.01.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:42:44 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Xiangyu Chen <xiangyu.chen@windriver.com>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 1/9] protobuf: upgrade 3.21.12 -> 4.22.2
Date: Wed, 27 Sep 2023 10:42:34 +0200
Message-Id: <20230927084242.1195772-2-peron.clem@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105176

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


