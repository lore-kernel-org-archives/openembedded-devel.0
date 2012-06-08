Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ScvrE-0004Or-Vh
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 11:51:53 +0200
Received: by mail-ee0-f47.google.com with SMTP id d49so983829eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 02:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Y9WT5+ZvuCQIqfcpg/IhMR0qunSU1GsnZMZxpFU40mo=;
	b=BeZndvIU9NBtZneVImZ6yg04MODCS/NK/mUYQsacVhx33Cb6uQRX2AfcdpA4CEsJdJ
	T3VoT9DYcxMgEXTcu2oANUhRZfPAtQ5xQXGuCXJ5MY3nLG3AmbBzAV3Ozr+3NfRcJNPE
	4k7PjUwRcTf+nrHRxtLF5oqFYnaqLbIy+KHtdZXI/mrfi4nQS0wEDg+E1FQEpDoWtaFi
	KXcs9DgATG4xIdegeaA5UOrD6JKFvbizxI6OFjCN9TzX1+SdWjRjSho36Bp892jggkab
	chtJ4iiyHLzboQHNoin79ycSSrgi3pyH5z/enni+emz+/vu5wNrMIaeVFUqrBO8cgbKq
	ay5Q==
Received: by 10.14.189.10 with SMTP id b10mr3781811een.9.1339148485324;
	Fri, 08 Jun 2012 02:41:25 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id z5sm20260919eem.3.2012.06.08.02.41.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 02:41:24 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2012 11:40:34 +0200
Message-Id: <1339148443-9467-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
References: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkYa/7s0PbFEmN0DDbD7WNVDWweXg2JOSTd9kBzscAvLZMsDro79nbT8P6rNQAhYIQwXsrZ
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>, eric@eukrea.com
Subject: [for-denzil][meta-oe][PATCH 05/14] nodejs: update to 0.6.18 and fix hardfloat detection
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
X-List-Received-Date: Fri, 08 Jun 2012 09:51:53 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../nodejs/nodejs/fix-hardfloat-detection.patch    |   22 +++++++
 meta-oe/recipes-devtools/nodejs/nodejs_0.6.17.bb   |   63 -------------------
 meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb   |   65 ++++++++++++++++++++
 3 files changed, 87 insertions(+), 63 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/fix-hardfloat-detection.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.6.17.bb
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/fix-hardfloat-detection.patch b/meta-oe/recipes-devtools/nodejs/nodejs/fix-hardfloat-detection.patch
new file mode 100644
index 0000000..36e8bf1
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/fix-hardfloat-detection.patch
@@ -0,0 +1,22 @@
+Fix hardfloat detection
+
+gcc has a builtin define to denote hard abi when in use, e.g. when
+using -mfloat-abi=hard it will define __ARM_PCS_VFP to 1 and therefore
+we should check that to determine which calling convention is in use
+and not __VFP_FP__ which merely indicates presence of VFP unit
+
+The fix has been provided by Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Forwarded
+
+--- a/deps/v8/src/platform-linux.cc	2012-05-17 12:52:59.329519921 -0700
++++ b/deps/v8/src/platform-linux.cc	2012-05-17 12:54:02.037521511 -0700
+@@ -212,7 +212,7 @@
+ // calling this will return 1.0 and otherwise 0.0.
+ static void ArmUsingHardFloatHelper() {
+   asm("mov r0, #0");
+-#if defined(__VFP_FP__) && !defined(__SOFTFP__)
++#if defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
+   // Load 0x3ff00000 into r1 using instructions available in both ARM
+   // and Thumb mode.
+   asm("mov r1, #3");
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.17.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.17.bb
deleted file mode 100644
index 1be5ce1..0000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.17.bb
+++ /dev/null
@@ -1,63 +0,0 @@
-DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
-HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=914812f2875eef849b5c509cc25dcb4f"
-
-DEPENDS = "openssl"
-
-SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
-SRC_URI[md5sum] = "55641d5d280cdd4e0c030c203107599d"
-SRC_URI[sha256sum] = "8dfe5948de27e37a14af184f06e7bd89a23c3b248af44c8ef5cffcd0e4c65778"
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
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
new file mode 100644
index 0000000..d5785d2
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
@@ -0,0 +1,65 @@
+DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+HOMEPAGE = "http://nodejs.org"
+LICENSE = "MIT & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=914812f2875eef849b5c509cc25dcb4f"
+
+DEPENDS = "openssl"
+
+SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
+           file://gcc-4.7.patch"
+
+SRC_URI[md5sum] = "4a3d3123ccc7b9b21c1990fe074e3d14"
+SRC_URI[sha256sum] = "6cf4311ecbc1700e88f4382a31b3a7017c1572cd641fd06e653fc1692c2cffff"
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
+  make BUILDTYPE=Release
+}
+
+do_compile () {
+  export PATH=${WORKDIR}:${PATH}
+  export CC=gcc
+  export CXX=g++
+  make BUILDTYPE=Release
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



