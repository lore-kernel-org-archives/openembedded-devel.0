Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2C5605BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2019 06:53:18 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x566rJfY027812
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 Jun 2019 08:53:19 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.125.99])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x566rJNp013364;
	Thu, 6 Jun 2019 08:53:19 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id CBCEA10D1262;
	Thu,  6 Jun 2019 08:53:18 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Jun 2019 08:53:08 +0200
Message-Id: <20190606065308.23766-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCHv2] protobuf: 3.6.1 -> 3.8.0
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
X-List-Received-Date: Thu, 06 Jun 2019 06:53:19 -0000

Simple update to latest release

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../protobuf/{protobuf_3.6.1.bb => protobuf_3.8.0.bb}               | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.6.1.bb => protobuf_3.8.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
index cf72d9ca7..0892178c0 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
@@ -10,11 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS_append_class-target = " protobuf-native"
 
-PV .= "+git${SRCPV}"
+SRCREV = "09745575a923640154bcf307fba8aedff47f240a"
 
-SRCREV = "48cb18e5c419ddd23d9badcfe4e9df7bde1979b2"
-
-SRC_URI = "git://github.com/google/protobuf.git;branch=3.6.x \
+SRC_URI = "git://github.com/google/protobuf.git;branch=3.8.x \
            file://run-ptest \
            file://0001-protobuf-fix-configure-error.patch \
 "
-- 
2.11.0


