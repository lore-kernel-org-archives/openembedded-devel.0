Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Scvr9-0004Or-NO
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 11:51:47 +0200
Received: by eekd49 with SMTP id d49so983829eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 02:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=XX24VYhI7bfk4uTzd/KEPgT0yRp7V6UtxBQAk3VSQHA=;
	b=KkCLkDwvZ/1vME/pIoUIBn9fW+NuBSczlLLFQyCVTjOFrz9G5eyNuKBJgednqBfRy9
	Ab8EQFfQa74yZd7HmHIhPKHVJy8GDPLVWtaddw6K0l/u4Qb1/1Puvj1RWBlVWVpbpjcA
	0XkiYOP8oi1lmRaBLSbH6/vy6QyBUohFAi7zNWJ84V8jkdsxssxZaW5pez/OcjnFyRE4
	YQyxjaxws057AppbK3t8nCE+v0UN2wMPoDQoMZHLVLHcrfQoH9ooKR8edfyfGZggi+hX
	Q5dUcY6KGBN275I6y9Vm1UEAKMmYP35ERbW2tjQW5o8UCHRnnntqmq9336xZqtnawEx/
	HNRw==
Received: by 10.14.98.68 with SMTP id u44mr3395141eef.85.1339148478254;
	Fri, 08 Jun 2012 02:41:18 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id f16sm20263491eec.2.2012.06.08.02.41.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 02:41:17 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2012 11:40:31 +0200
Message-Id: <1339148443-9467-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
References: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm/EqpuSIHgWB0c3a4VY93N7fRZyx5AG2VBIualcPdkxVsvlZ+eiIvn+LEoiNS0LilPqYsZ
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe][PATCH 02/14] nodejs: update to 0.6.17
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
X-List-Received-Date: Fri, 08 Jun 2012 09:51:47 -0000

The license is unchanged, only some sections were clarified with different wording.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.6.14.bb |   63 ----------------------
 meta-oe/recipes-devtools/nodejs/nodejs_0.6.17.bb |   63 ++++++++++++++++++++++
 2 files changed, 63 insertions(+), 63 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.6.14.bb
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.6.17.bb

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.14.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.14.bb
deleted file mode 100644
index 4f85bf3..0000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.14.bb
+++ /dev/null
@@ -1,63 +0,0 @@
-DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
-HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d66c1f33ba9b89616e45f588e7606ee6"
-
-DEPENDS = "openssl"
-
-SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
-SRC_URI[md5sum] = "3033a866e230cca64e212ee8f2af27dd"
-SRC_URI[sha256sum] = "e41922308155c5197c2d048948ca9cd76ea5f9a51f977e1591bd93fe17d4cf1f"
-
-S = "${WORKDIR}/node-v${PV}"
-
-# v8 errors out if you have set CCACHE
-CCACHE = ""
-
-do_configure_virtclass-native () {
-  sed -i -e s:\'/usr/lib:\'${STAGING_LIBDIR}:g wscript
-  sed -i -e s:\'/usr/local/lib:\'${STAGING_LIBDIR}:g wscript
-
-  ./configure --prefix=${prefix} --without-snapshot
-}
-
-# Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround waf+scons
-do_configure () {
-  echo '#!/bin/sh' > ${WORKDIR}/gcc
-  echo '${CC} $@' >> ${WORKDIR}/gcc
-
-  echo '#!/bin/sh' > ${WORKDIR}/g++
-  echo '${CXX} $@'>> ${WORKDIR}/g++
-
-  chmod +x ${WORKDIR}/gcc ${WORKDIR}/g++
-
-  sed -i -e s:\'/usr/lib:\'${STAGING_LIBDIR}:g wscript
-  sed -i -e s:\'/usr/local/lib:\'${STAGING_LIBDIR}:g wscript
-
-  export PATH=${WORKDIR}:${PATH}
-  export CC=gcc
-  export CXX=g++
-
-  ./configure --prefix=${prefix} --without-snapshot
-}
-
-do_compile_virtclass-native () {
-  make
-}
-
-do_compile () {
-  export PATH=${WORKDIR}:${PATH}
-  export CC=gcc
-  export CXX=g++
-  make
-}
-
-do_install () {
-  DESTDIR=${D} oe_runmake install
-}
-
-RDEPENDS_${PN} = "curl python-shell python-datetime python-subprocess python-crypt python-textutils python-netclient "
-RDEPENDS_${PN}_virtclass-native = "curl-native python-native"
-
-FILES_${PN} += "${libdir}/node/wafadmin ${libdir}/node_modules"
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.17.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.17.bb
new file mode 100644
index 0000000..1be5ce1
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.17.bb
@@ -0,0 +1,63 @@
+DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+HOMEPAGE = "http://nodejs.org"
+LICENSE = "MIT & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=914812f2875eef849b5c509cc25dcb4f"
+
+DEPENDS = "openssl"
+
+SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
+SRC_URI[md5sum] = "55641d5d280cdd4e0c030c203107599d"
+SRC_URI[sha256sum] = "8dfe5948de27e37a14af184f06e7bd89a23c3b248af44c8ef5cffcd0e4c65778"
+
+S = "${WORKDIR}/node-v${PV}"
+
+# v8 errors out if you have set CCACHE
+CCACHE = ""
+
+do_configure_virtclass-native () {
+  sed -i -e s:\'/usr/lib:\'${STAGING_LIBDIR}:g wscript
+  sed -i -e s:\'/usr/local/lib:\'${STAGING_LIBDIR}:g wscript
+
+  ./configure --prefix=${prefix} --without-snapshot
+}
+
+# Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround waf+scons
+do_configure () {
+  echo '#!/bin/sh' > ${WORKDIR}/gcc
+  echo '${CC} $@' >> ${WORKDIR}/gcc
+
+  echo '#!/bin/sh' > ${WORKDIR}/g++
+  echo '${CXX} $@'>> ${WORKDIR}/g++
+
+  chmod +x ${WORKDIR}/gcc ${WORKDIR}/g++
+
+  sed -i -e s:\'/usr/lib:\'${STAGING_LIBDIR}:g wscript
+  sed -i -e s:\'/usr/local/lib:\'${STAGING_LIBDIR}:g wscript
+
+  export PATH=${WORKDIR}:${PATH}
+  export CC=gcc
+  export CXX=g++
+
+  ./configure --prefix=${prefix} --without-snapshot
+}
+
+do_compile_virtclass-native () {
+  make
+}
+
+do_compile () {
+  export PATH=${WORKDIR}:${PATH}
+  export CC=gcc
+  export CXX=g++
+  make
+}
+
+do_install () {
+  DESTDIR=${D} oe_runmake install
+}
+
+RDEPENDS_${PN} = "curl python-shell python-datetime python-subprocess python-crypt python-textutils python-netclient "
+RDEPENDS_${PN}_virtclass-native = "curl-native python-native"
+
+FILES_${PN} += "${libdir}/node/wafadmin ${libdir}/node_modules"
+BBCLASSEXTEND = "native"
-- 
1.7.10



