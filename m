Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 3A96E7EB0E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 13:31:57 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x62DVwJl003056
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Jul 2019 15:31:58 +0200
Received: from dev.vm6.ccp.siemens.com (md1wg6qc.ad001.siemens.net
	[163.242.44.88])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id x62DVwMK013857;
	Tue, 2 Jul 2019 15:31:58 +0200
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id A02D574B930;
	Tue,  2 Jul 2019 15:31:57 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jul 2019 15:31:47 +0200
Message-Id: <20190702133147.30986-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] nodejs: 10.15.3 -> 10.16.0
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
X-List-Received-Date: Tue, 02 Jul 2019 13:31:58 -0000

Update nodejs to active 10.x LTS release 10.16.0.
- make dependencies configurable
License checksum changed due to added bundled dependencies to:
- siphash
- large_pages
- brotli

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../nodejs/{nodejs_10.15.3.bb => nodejs_10.16.0.bb}     | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_10.15.3.bb => nodejs_10.16.0.bb} (89%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.15.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
similarity index 89%
rename from meta-oe/recipes-devtools/nodejs/nodejs_10.15.3.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
index d2e77ea0d..aaa1da0aa 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.15.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9ceeba79eb2ea1067b7b3ed16fff8bab"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=be980eb7ccafe287cb438076a65e888c"
 
-DEPENDS = "openssl zlib icu"
+DEPENDS = "openssl"
 DEPENDS_append_class-target = " nodejs-native"
 
 inherit pkgconfig
@@ -23,8 +23,8 @@ SRC_URI_append_class-target = " \
            file://0002-Using-native-torque.patch \
            "
 
-SRC_URI[md5sum] = "d76210a6ae1ea73d10254947684836fb"
-SRC_URI[sha256sum] = "4e22d926f054150002055474e452ed6cbb85860aa7dc5422213a2002ed9791d5"
+SRC_URI[md5sum] = "c9a7ab43f8b50c8a4d5545de307b7540"
+SRC_URI[sha256sum] = "18e37f891d10ea7fbc8f6410c444c2b1d9cc3cbbb1d35aa9c41f761816956608"
 
 S = "${WORKDIR}/node-v${PV}"
 
@@ -49,16 +49,21 @@ ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '-
 GYP_DEFINES_append_mipsel = " mips_arch_variant='r1' "
 ARCHFLAGS ?= ""
 
+PACKAGECONFIG ??= "zlib icu"
+PACKAGECONFIG[zlib] = "--shared-zlib,,zlib"
+PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu"
+
 # Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
 do_configure () {
     rm -rf ${S}/deps/openssl
     export LD="${CXX}"
     GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
-   ./configure --prefix=${prefix} --with-intl=system-icu --without-snapshot --shared-openssl --shared-zlib \
+   ./configure --prefix=${prefix} --without-snapshot --shared-openssl \
                --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
                --dest-os=linux \
-               ${ARCHFLAGS}
+               ${ARCHFLAGS} \
+               ${PACKAGECONFIG_CONFARGS}
 }
 
 do_compile () {
-- 
2.11.0


