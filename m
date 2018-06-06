Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 1279 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Jun 2018 09:41:11 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id B84987479D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 09:41:11 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w569Jpvm015703
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 6 Jun 2018 11:19:52 +0200
Received: from dev.vm6.ccp.siemens.com ([139.22.39.14])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w569Jpck004556;
	Wed, 6 Jun 2018 11:19:51 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 6278E10F2E48;
	Wed,  6 Jun 2018 11:19:51 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Jun 2018 11:19:45 +0200
Message-Id: <20180606091945.24333-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-oe][PATCH] nodejs: 8.9.4 -> 8.11.2
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
X-List-Received-Date: Wed, 06 Jun 2018 09:41:12 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

Node.js > 8.10 also compile with OpenSSL 1.1

License check sum changes because typo fix in LICENSE file.
No license change.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../recipes-devtools/nodejs/{nodejs_8.9.4.bb => nodejs_8.11.2.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_8.9.4.bb => nodejs_8.11.2.bb} (93%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.11.2.bb
similarity index 93%
rename from meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_8.11.2.bb
index 8930cd902..4e81b0392 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.11.2.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=270f7477a1705f7cd3e29d3d4512915d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fde91d5c5bbd1e0389623e1ac018d9e8"
 
-DEPENDS = "openssl10 zlib"
+DEPENDS = "openssl zlib"
 
 COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
 "
-SRC_URI[md5sum] = "631ed102fe58c13cf63bc92a68cf4759"
-SRC_URI[sha256sum] = "6cdcde9c9c1ca9f450a0b24eafa229ca759e576daa0fae892ce74d541ecdc86f"
+SRC_URI[md5sum] = "56be405b63b8c6c8ecd98c002fb15e4a"
+SRC_URI[sha256sum] = "539946c0381809576bed07424a35fc1740d52f4bd56305d6278d9e76c88f4979"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.11.0


