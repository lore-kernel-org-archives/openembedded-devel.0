Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 379 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Jun 2019 14:17:36 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 1BEFB606D0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2019 14:17:35 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x55EBIJ7019987
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Jun 2019 16:11:18 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.13.19])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id x55EBHtg002775;
	Wed, 5 Jun 2019 16:11:18 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 8A8CE10D1262;
	Wed,  5 Jun 2019 16:11:17 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Jun 2019 16:11:14 +0200
Message-Id: <20190605141114.5576-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] protobuf: 3.6.1 -> 3.8.0
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
X-List-Received-Date: Wed, 05 Jun 2019 14:17:36 -0000

Simple update to latest release

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../protobuf/{protobuf_3.6.1.bb => protobuf_3.8.0.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.6.1.bb => protobuf_3.8.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
index cf72d9ca7..7148954ce 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
@@ -12,9 +12,9 @@ DEPENDS_append_class-target = " protobuf-native"
 
 PV .= "+git${SRCPV}"
 
-SRCREV = "48cb18e5c419ddd23d9badcfe4e9df7bde1979b2"
+SRCREV = "09745575a923640154bcf307fba8aedff47f240a"
 
-SRC_URI = "git://github.com/google/protobuf.git;branch=3.6.x \
+SRC_URI = "git://github.com/google/protobuf.git;branch=master \
            file://run-ptest \
            file://0001-protobuf-fix-configure-error.patch \
 "
-- 
2.11.0


