Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SyehO-00080w-29
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 09:59:30 +0200
Received: by eaad12 with SMTP id d12so1115227eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 00:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=QXPjq38NizwZphkRd5DM4kNzzXXc/u2gR+0ER3bC3Tg=;
	b=Sl68vSlC94uBOSwkHCjq3+gPYmcnsdcGVRE9PeRLRZ9Nzx8s3Dgr0/QwYhGojULNgm
	M7mEexj+Hwv1FmTr7ldhOPc/BlvROk9brdWAOpMqFWb+GNkvxTxOoGzI0IU+PHFY4AE7
	eeMv6v3/LJ9ETwZbW5cLJD6MgbqbhU3Csvk3gvAl/3eKQjlAYKtG3x4/bCi+Fnmpqg+c
	W8wUMnwBEDQnruDPdCUXH2hUHU1VIyN2T1b5vrocIOM1o1fAyMq+kvPl83Xcw9CB0605
	FmDaWb5oI2UksXx020Zs6bAQK7HOZi3jIMKCz/N0LuFrLqddx83nn6HjSeWXP2AyC2yp
	89tw==
Received: by 10.14.213.137 with SMTP id a9mr16465795eep.38.1344325664658;
	Tue, 07 Aug 2012 00:47:44 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id 8sm53677191eeg.16.2012.08.07.00.47.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 00:47:42 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Aug 2012 09:47:30 +0200
Message-Id: <1344325650-21076-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1344325650-21076-1-git-send-email-koen@dominion.thruhere.net>
References: <1344325650-21076-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkUgEQ4HZvY9fgFiFEt74l2w3MdDeWc46BqLrYtbWvmVcGl0tMEh7xw9qtLjI7Jf7BXIRnj
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 2/2] nodejs: update to 0.6.20
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
X-List-Received-Date: Tue, 07 Aug 2012 07:59:30 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb |   65 ----------------------
 meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb |   64 +++++++++++++++++++++
 2 files changed, 64 insertions(+), 65 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
deleted file mode 100644
index 7136ffc..0000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
+++ /dev/null
@@ -1,65 +0,0 @@
-DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
-HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=914812f2875eef849b5c509cc25dcb4f"
-
-DEPENDS = "openssl"
-
-SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
-           file://fix-hardfloat-detection.patch"
-
-SRC_URI[md5sum] = "4a3d3123ccc7b9b21c1990fe074e3d14"
-SRC_URI[sha256sum] = "6cf4311ecbc1700e88f4382a31b3a7017c1572cd641fd06e653fc1692c2cffff"
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
-  make BUILDTYPE=Release
-}
-
-do_compile () {
-  export PATH=${WORKDIR}:${PATH}
-  export CC=gcc
-  export CXX=g++
-  make BUILDTYPE=Release
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
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb
new file mode 100644
index 0000000..77ed388
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb
@@ -0,0 +1,64 @@
+DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+HOMEPAGE = "http://nodejs.org"
+LICENSE = "MIT & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=914812f2875eef849b5c509cc25dcb4f"
+
+DEPENDS = "openssl"
+
+SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
+           file://fix-hardfloat-detection.patch"
+SRC_URI[md5sum] = "fcf8e0f2981f9dd66606a2162a2df55d"
+SRC_URI[sha256sum] = "b7bf4cf143ddf46ba5e975761b98a38dd3d72b176fd5d4bb2f9c9e7bbe6c4b15"
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



