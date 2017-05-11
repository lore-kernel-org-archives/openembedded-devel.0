Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD3860017
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 08:30:35 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v4B8Uao5028061
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 10:30:36 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.79.78])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v4B8UaTZ027752;
	Thu, 11 May 2017 10:30:36 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 May 2017 10:30:30 +0200
Message-Id: <1494491430-22799-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] protobuf: update to 3.3.0
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
X-List-Received-Date: Thu, 11 May 2017 08:30:41 -0000

With the latest version out of tree builds are broken.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../protobuf/{protobuf_3.1.0.bb => protobuf_3.3.0.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.1.0.bb => protobuf_3.3.0.bb} (88%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.1.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.3.0.bb
similarity index 88%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.1.0.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.3.0.bb
index 18210b1..ce64a88 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.1.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.3.0.bb
@@ -14,15 +14,15 @@ RDEPENDS_${PN}-dev += "${PN}-compiler"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
 
-SRCREV = "a428e42072765993ff674fda72863c9f1aa2d268"
+SRCREV = "a6189acd18b00611c1dc7042299ad75486f08a1a"
 
-PV = "3.1.0+git${SRCPV}"
+PV = "3.3.0+git${SRCPV}"
 
 SRC_URI = "git://github.com/google/protobuf.git"
 
 EXTRA_OECONF += " --with-protoc=echo"
 
-inherit autotools
+inherit autotools-brokensep
 
 S = "${WORKDIR}/git"
 
-- 
2.1.4


