Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1U0SsC-0006nt-Pk
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 09:18:24 +0100
Received: by mail-ee0-f45.google.com with SMTP id b57so661188eek.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2013 00:02:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=vwX8BWaJK5Fatu7qEGI+6Un2UiFyAjT+e7ZNcNFTfdg=;
	b=pqjbxqwjpUG0/hqkBszTLdlkPs4NLXPQyr9vcSRb+pZwfZTxulao1HxBapKL/S2Q9j
	yy4TeIc/mWwZbmU1CTgs6ALz7uovPlYRSqPTIUsPOmznY8td5yHrDP0oZNfSLj0OgpSM
	TBR6xmCS/WkWSPttMKzln4ChUskiN3W4DY8pApGFUrb9X/R8NMlUEZ7h6BibYnxw+1tR
	W5MyNL860qvEbt9waeljv90TO43tkNB8hoSQ2ZS+dsPWtLuKnZJvUCcJ7r3oWbIkNshW
	uT49N82p2rNqp1ZQPWrQN18gIIDkajDg4QKOdN6HFS3IrsFpawU+ot/SBDRSpbLUy0X7
	Xl9Q==
X-Received: by 10.14.203.2 with SMTP id e2mr12535301eeo.20.1359532963993;
	Wed, 30 Jan 2013 00:02:43 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id f6sm732789eeo.7.2013.01.30.00.02.42
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 00:02:43 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jan 2013 09:02:35 +0100
Message-Id: <1359532955-16954-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
X-Gm-Message-State: ALoCoQnxpIv91XQHVEMJZKzWG1M7ZUxST61Py+bMRo5OiP1+I3RE10GeFgvCfruazqUTbAigj+ZD
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][[RFC][PATCH] nodejs: add 0.8.18
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
X-List-Received-Date: Wed, 30 Jan 2013 08:18:24 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../nodejs/nodejs/0002-Enable-NEON.patch           | 27 ++++++++++
 ...0003-Resolve-bad-rpath-issue-when-linking.patch | 29 ++++++++++
 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb   | 61 ++++++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve-bad-rpath-issue-when-linking.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patch
new file mode 100644
index 0000000..2b83ff8
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patch
@@ -0,0 +1,27 @@
+From 8891cb4cae57a6b7db54edb33a43743c4b09c53a Mon Sep 17 00:00:00 2001
+From: Jason Kridner <jdk@ti.com>
+Date: Wed, 7 Nov 2012 14:43:55 -0500
+Subject: [PATCH] Enable NEON
+
+Read this was necessary on a blog.
+
+http://www.code-with-passion.com/2012/11/07/cross-compiling-nodejs-and-node-modules-for-armbeaglebone/
+---
+ deps/v8/build/common.gypi |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/deps/v8/build/common.gypi b/deps/v8/build/common.gypi
+index 7a780cc..237f53f 100644
+--- a/deps/v8/build/common.gypi
++++ b/deps/v8/build/common.gypi
+@@ -29,6 +29,7 @@
+ 
+ {
+   'variables': {
++    'arm_neon%': 1,
+     'use_system_v8%': 0,
+     'msvs_use_common_release': 0,
+     'gcc_version%': 'unknown',
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve-bad-rpath-issue-when-linking.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve-bad-rpath-issue-when-linking.patch
new file mode 100644
index 0000000..b7e8b6c
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve-bad-rpath-issue-when-linking.patch
@@ -0,0 +1,29 @@
+From aaf38f17911941d979074e4d5f8475f4ad5595a8 Mon Sep 17 00:00:00 2001
+From: Nathan Rajlich <nathan@tootallnate.net>
+Date: Tue, 9 Oct 2012 09:49:00 -0700
+Subject: [PATCH] Resolve bad rpath issue when linking
+
+See http://piscisaureus.no.de/libuv/2012-10-09#16:42:44.577 to
+understand the issue.
+
+Added to OE by Jason Kridner <jdk@ti.com>
+---
+ common.gypi |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/common.gypi b/common.gypi
+index b26d2f3..8ae671b 100644
+--- a/common.gypi
++++ b/common.gypi
+@@ -163,7 +163,7 @@
+       [ 'OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris"', {
+         'cflags': [ '-Wall', '-pthread', ],
+         'cflags_cc': [ '-fno-rtti', '-fno-exceptions' ],
+-        'ldflags': [ '-pthread', '-rdynamic' ],
++        'ldflags': [ '-pthread' ],
+         'conditions': [
+           [ 'target_arch=="ia32"', {
+             'cflags': [ '-m32' ],
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
new file mode 100644
index 0000000..4670ae9
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
@@ -0,0 +1,61 @@
+DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+HOMEPAGE = "http://nodejs.org"
+LICENSE = "MIT & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=95a589a3257ab7dfe37d8a8379e3c72d"
+
+DEPENDS = "openssl"
+
+SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
+           file://0002-Enable-NEON.patch \
+           file://0003-Resolve-bad-rpath-issue-when-linking.patch \
+"
+SRC_URI[md5sum] = "25ed6aa5710ac46b867ff3f17a4da1d6"
+SRC_URI[sha256sum] = "1d63dd42f9bd22f087585ddf80a881c6acbe1664891b1dda3b71306fe9ae00f9"
+
+S = "${WORKDIR}/node-v${PV}"
+
+# v8 errors out if you have set CCACHE
+CCACHE = ""
+
+# Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
+do_configure () {
+  echo '#!/bin/sh' > ${WORKDIR}/gcc
+  echo '${CC} $@' >> ${WORKDIR}/gcc
+
+  echo '#!/bin/sh' > ${WORKDIR}/g++
+  echo '${CXX} $@'>> ${WORKDIR}/g++
+
+  echo '#!/bin/sh' > ${WORKDIR}/ld
+  echo '${CXX} $@'>> ${WORKDIR}/ld
+
+  chmod +x ${WORKDIR}/gcc ${WORKDIR}/g++ ${WORKDIR}/ld
+
+  export PATH=${WORKDIR}:${PATH}
+  export CC=gcc
+  export CXX=g++
+  export LD=ld
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
+  export LD=ld
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
+FILES_${PN} += "${libdir}/node/wafadmin ${libdir}/node_modules ${libdir}/dtrace"
+BBCLASSEXTEND = "native"
-- 
1.8.1



