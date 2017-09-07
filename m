Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 409 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Sep 2017 14:49:31 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 94C62780AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 14:49:31 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v87EghVi006523
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Sep 2017 16:42:43 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.76.177])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v87EggjE007934;
	Thu, 7 Sep 2017 16:42:42 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Sep 2017 16:42:36 +0200
Message-Id: <1504795356-19820-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] protobuf: update to 3.4.0
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
X-List-Received-Date: Thu, 07 Sep 2017 14:49:32 -0000

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


