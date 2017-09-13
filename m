Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 7292A78055
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 07:21:45 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v8D7LkjT019198
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 09:21:46 +0200
Received: from dev.sbt.siemens.com ([139.16.24.231])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v8D7Lkgg023838;
	Wed, 13 Sep 2017 09:21:46 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Sep 2017 09:21:40 +0200
Message-Id: <1505287301-25379-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCHv2 1/2] protobuf: update to 3.4.0
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
X-List-Received-Date: Wed, 13 Sep 2017 07:21:46 -0000

Also put protbuf-lite into it's own package

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../protobuf/{protobuf_3.3.0.bb => protobuf_3.4.0.bb}            | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.3.0.bb => protobuf_3.4.0.bb} (75%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.3.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.0.bb
similarity index 75%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.3.0.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.4.0.bb
index ce64a88..39108dd 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.3.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/protobuf"
 SECTION = "console/tools"
 LICENSE = "BSD-3-Clause"
 
-PACKAGE_BEFORE_PN = "${PN}-compiler"
+PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
 
 DEPENDS = "zlib"
 RDEPENDS_${PN}-compiler = "${PN}"
@@ -14,11 +14,11 @@ RDEPENDS_${PN}-dev += "${PN}-compiler"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
 
-SRCREV = "a6189acd18b00611c1dc7042299ad75486f08a1a"
+SRCREV = "80a37e0782d2d702d52234b62dd4b9ec74fd2c95"
 
-PV = "3.3.0+git${SRCPV}"
+PV = "3.4.0+git${SRCPV}"
 
-SRC_URI = "git://github.com/google/protobuf.git"
+SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"
 
 EXTRA_OECONF += " --with-protoc=echo"
 
@@ -27,6 +27,7 @@ inherit autotools-brokensep
 S = "${WORKDIR}/git"
 
 FILES_${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
+FILES_${PN}-lite = "${bindir} ${libdir}/libprotobuf-lite${SOLIBS}"
 
 MIPS_INSTRUCTION_SET = "mips"
 
-- 
2.1.4


