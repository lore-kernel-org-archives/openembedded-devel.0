Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178ADC7EE2A
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 23:56:55 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.30524.1750895805635023232
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jun 2025 16:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fbrbMjvR;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PNuiK02301901
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 18:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750895804;
	bh=bXnibPUDGqz/NyHf4GfA0r/HekyygaqFoenbsphqSMM=;
	h=From:To:Subject:Date;
	b=fbrbMjvRdMZoQ8xSEbCRt7v5b6B7zDJX+6wYOTI7zv69ol/q7jckyLQf12Bd5EJMS
	 7Z0G7Fd11TnoWrB93aWO7YiIXsKcYnN8qDHbW3+p5l9dS9lX11z2w2SV4jMthEpdXU
	 3gaK7xcsFlwfsGG8/9vW9DG7D3mB4AZ+gXS8/PQ0=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PNuinc1711892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 18:56:44 -0500
Received: from lewvowa02.ent.ti.com (10.180.75.80) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 18:56:44 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by lewvowa02.ent.ti.com
 (10.180.75.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.55; Wed, 25 Jun
 2025 18:56:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 18:56:44 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PNuisL286445
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 18:56:44 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uUZyu-00024w-6j
	for openembedded-devel@lists.openembedded.org; Wed, 25 Jun 2025 18:56:44 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] protobuf: 5.29.5 -> 6.31.1
Date: Wed, 25 Jun 2025 18:56:44 -0500
Message-ID: <20250625235644.7950-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 23:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118113

Refresh local patches:
- 0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch

Fix protobuf build error due to recent abseil-cpp update:
https://git.openembedded.org/meta-openembedded/commit/?h=master&id=e8c0e64e89b565a55d4c4fefe30a90a25fbe5831

Changelog:
https://github.com/protocolbuffers/protobuf/releases/tag/v31.1

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...amples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch | 4 ++--
 .../protobuf/{protobuf_5.29.5.bb => protobuf_6.31.1.bb}     | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_5.29.5.bb => protobuf_6.31.1.bb} (95%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
index 7a8906a9a4..53fdf7dece 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
@@ -47,12 +47,12 @@ index f7ee9b116..8cd1359e2 100644
  
  add_person_cpp: add_person.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=c++14 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
+-	c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
 +	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
  
  list_people_cpp: list_people.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=c++14 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
+-	c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
 +	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
  
  add_person_dart: add_person.dart protoc_middleman_dart
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
similarity index 95%
rename from meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
index 61aff1da28..90be1179aa 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
@@ -7,20 +7,18 @@ SECTION = "console/tools"
 LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b \
-    file://third_party/lunit/LICENSE;md5=99f08e72434dfa34fe0581d3dfb2d7f4 \
     file://third_party/utf8_range/LICENSE;md5=d4974d297231477b2ff507c35d61c13c \
 "
 
 DEPENDS = "zlib abseil-cpp jsoncpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "f5de0a0495faa63b4186fc767324f8b9a7bf4fc4"
+SRCREV = "74211c0dfc2777318ab53c2cd2c317a2ef9012de"
 
-SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=29.x;protocol=https \
+SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=31.x;protocol=https \
            file://run-ptest \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
            file://0001-fix-protobuf-native-build-failure-with-gcc-10.patch \
-           file://0001-utf8_range-add-version-marker-to-library-19009.patch \
            "
 SRC_URI:append:mipsarcho32:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
 
-- 
2.17.1


