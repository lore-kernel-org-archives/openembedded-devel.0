Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHGTF-0001ds-Jm
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 17:25:33 +0200
Received: by wibhj13 with SMTP id hj13so2131488wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 08:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=on/4ffQlH7U4VbJkod6cYJVVKperynTmdF2UgTXe8aM=;
	b=c7shpnAzN6O3OtxXxrIzUXg9rnG1zUfT/ULhuUJsHlnfEH2AgGxpaFo3BX3e5l2uPr
	k0KB6yQLoHVDucfLI4nWK4zvUxf1yQJh+WaDOwaWD66vclJ/qGaL6fWHjQO2VqjWmq9L
	WDZ/CHj0U1/kS0RMOPCQjMx0G5i5QcB1YqSvDT/83Gns2AmOLUANQe88b62GHT96qtG9
	MVKAqeqHWioGc36zz+4k53l3Jn8iWqXTX1uwcFM0ulQgOcT7PYHDowBqhAXejrmQ2eml
	qCFgf5upK/IKjUX0NE84VjZaaLOzW8POiwDkGUOJ3tvJYRHJVplAs1IVQFEADIwdLqxH
	hXbw==
Received: by 10.180.73.143 with SMTP id l15mr16533388wiv.11.1333984577057;
	Mon, 09 Apr 2012 08:16:17 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id 6sm30975243wiz.1.2012.04.09.08.16.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 08:16:16 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Apr 2012 17:16:04 +0200
Message-Id: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQnGYSV5rHkT0eqVoAL0j/Iolns9Yv30QsKqj9ScSHCtb0z1pJkyAeqMXrZBwHC2bZHohQ9D
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 01/10] nodejs 0.6.x: update to 0.6.14
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Apr 2012 15:25:33 -0000

The LICENSE checksum changed due to date changes and clarification on licenses of included "libraries" like the markdown parser

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../nodejs/{nodejs_0.6.8.bb => nodejs_0.6.14.bb}   |   22 ++++++++++++++-----
 1 files changed, 16 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.6.8.bb => nodejs_0.6.14.bb} (66%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.8.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.14.bb
similarity index 66%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.6.8.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.6.14.bb
index bd404ae..4f85bf3 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.8.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.14.bb
@@ -1,21 +1,26 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=672cc6c8dbb3e918277a61ea98f088f6"
-
-DEFAULT_PREFERENCE = "-1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d66c1f33ba9b89616e45f588e7606ee6"
 
 DEPENDS = "openssl"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
-SRC_URI[md5sum] = "9fd7baa2d27b848c3134e6ae35bb87b2"
-SRC_URI[sha256sum] = "e6cbfc5ccdbe10128dbbd4dc7a88c154d80f8a39c3a8477092cf7d25eef78c9c"
+SRC_URI[md5sum] = "3033a866e230cca64e212ee8f2af27dd"
+SRC_URI[sha256sum] = "e41922308155c5197c2d048948ca9cd76ea5f9a51f977e1591bd93fe17d4cf1f"
 
 S = "${WORKDIR}/node-v${PV}"
 
 # v8 errors out if you have set CCACHE
 CCACHE = ""
 
+do_configure_virtclass-native () {
+  sed -i -e s:\'/usr/lib:\'${STAGING_LIBDIR}:g wscript
+  sed -i -e s:\'/usr/local/lib:\'${STAGING_LIBDIR}:g wscript
+
+  ./configure --prefix=${prefix} --without-snapshot
+}
+
 # Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround waf+scons
 do_configure () {
   echo '#!/bin/sh' > ${WORKDIR}/gcc
@@ -36,6 +41,10 @@ do_configure () {
   ./configure --prefix=${prefix} --without-snapshot
 }
 
+do_compile_virtclass-native () {
+  make
+}
+
 do_compile () {
   export PATH=${WORKDIR}:${PATH}
   export CC=gcc
@@ -48,6 +57,7 @@ do_install () {
 }
 
 RDEPENDS_${PN} = "curl python-shell python-datetime python-subprocess python-crypt python-textutils python-netclient "
+RDEPENDS_${PN}_virtclass-native = "curl-native python-native"
 
-FILES_${PN} += "${libdir}/node/wafadmin"
+FILES_${PN} += "${libdir}/node/wafadmin ${libdir}/node_modules"
 BBCLASSEXTEND = "native"
-- 
1.7.2.5



