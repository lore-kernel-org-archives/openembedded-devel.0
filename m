Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc6A-0006Vo-9l
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:23:42 +0200
Received: by eeit10 with SMTP id t10so352488eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=XX24VYhI7bfk4uTzd/KEPgT0yRp7V6UtxBQAk3VSQHA=;
	b=EDaX2dY0VJurbP/Rw7F6drmPJ29QuuxEmeQVzEYDSPEhts1Y4hb5VDDrPNJrwnH/Lp
	afV+kqhx0P0fm0Ts6butaR1+Di3koWsNaOr3iPM4Avm/fBxRKfk9dEin0LrW+4gi50sU
	BXoLKii207q8lGrCquGBsOMj1edOzXbCfpsBEzTl8cgsYpyfzoxtcqm7/PCexy313m/x
	cB7EknC3YqsK18+GwxZXiGpcGC/jAqJMSpQU8JABH/I7xT93xG1zDiBC0zo6OBc4vizP
	eh8LXx+4YHx0yqPg4goYsK36cMmOJQMs3CpHE7EvLeBF0Ebbwlgk2bCcZbsDK1+jifj9
	Fh5Q==
Received: by 10.14.101.9 with SMTP id a9mr69796eeg.143.1342170747999;
	Fri, 13 Jul 2012 02:12:27 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id p41sm23230390eef.5.2012.07.13.02.12.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:12:26 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:11:48 +0200
Message-Id: <1342170730-14982-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQll7qfbTnvHb2U1/JbQfyKGBHXpS125u4G4xYVpxUHA/cSPJ/6miF0LshPr89oeBRhxJQmv
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe 02/24] nodejs: update to 0.6.17
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
X-List-Received-Date: Fri, 13 Jul 2012 09:23:42 -0000

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



