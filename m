Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 6558A785A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 07:21:48 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v8D7LnE2017318
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 09:21:49 +0200
Received: from dev.sbt.siemens.com ([139.16.24.231])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v8D7Lkgh023838;
	Wed, 13 Sep 2017 09:21:49 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Sep 2017 09:21:41 +0200
Message-Id: <1505287301-25379-2-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1505287301-25379-1-git-send-email-pascal.bach@siemens.com>
References: <1505287301-25379-1-git-send-email-pascal.bach@siemens.com>
Subject: [meta-oe][PATCHv2 2/2] protobuf-c: update to 1.3.0
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
X-List-Received-Date: Wed, 13 Sep 2017 07:21:49 -0000

Required to build with protobuf 3.4.0

The license checksum changed because they renamed the compiler which is mentioned
in the LICENSE file.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../protobuf/{protobuf-c_1.2.1.bb => protobuf-c_1.3.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf-c_1.2.1.bb => protobuf-c_1.3.0.bb} (88%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
similarity index 88%
rename from meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
index 36de060..fe1e6e5 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
@@ -15,10 +15,10 @@ PACKAGE_BEFORE_PN = "${PN}-compiler"
 RDEPENDS_${PN}-compiler = "protobuf-compiler"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=235c3195a3968524dc1524b4ebea0c0e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cb901168715f4782a2b06c3ddaefa558"
 
 PV .= "+git${SRCPV}"
-SRCREV = "006d69bd8481738323c58af5cd4c8477d09eb9f5"
+SRCREV = "dac1a65feac4ad72f612aab99f487056fbcf5c1a"
 
 SRC_URI = "git://github.com/protobuf-c/protobuf-c.git"
 
-- 
2.1.4


