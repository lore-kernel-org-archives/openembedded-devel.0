Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1RQd6r-0007KC-1k
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Nov 2011 11:52:53 +0100
Received: from p4fc76d4d.dip.t-dialin.net ([79.199.109.77]
	helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1RQcHi-00085f-Sd by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Wed, 16 Nov 2011 11:00:06 +0100
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.77)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1RQcI7-0000oq-7q; Wed, 16 Nov 2011 11:00:27 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Nov 2011 11:00:14 +0100
Message-Id: <1321437614-3117-1-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.7.7.2
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: [meta-oe] nodejs: Update to latest 0.4x series release 0.4.12
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
X-List-Received-Date: Wed, 16 Nov 2011 10:52:53 -0000

Rename patch and update checksums accordingly.

Signed-off-by: Stefan Schmidt <stefan@datenfreihafen.org>
---
 .../nodejs/nodejs/libev-cross-cc_0.4.12.patch      |   13 +++++++
 .../nodejs/nodejs/libev-cross-cc_0.4.9.patch       |   13 -------
 meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb   |   37 ++++++++++++++++++++
 meta-oe/recipes-devtools/nodejs/nodejs_0.4.9.bb    |   37 --------------------
 4 files changed, 50 insertions(+), 50 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/libev-cross-cc_0.4.12.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/libev-cross-cc_0.4.9.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.4.9.bb

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/libev-cross-cc_0.4.12.patch b/meta-oe/recipes-devtools/nodejs/nodejs/libev-cross-cc_0.4.12.patch
new file mode 100644
index 0000000..2b9838f
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/libev-cross-cc_0.4.12.patch
@@ -0,0 +1,13 @@
+diff --git a/deps/libev/wscript b/deps/libev/wscript
+index 4f6c9a8..1796749 100644
+--- a/deps/libev/wscript
++++ b/deps/libev/wscript
+@@ -58,7 +58,7 @@ def configure(conf):
+           return 0;
+       }
+   """
+-  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
++  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=False,
+                 msg="Checking for SYS_clock_gettime")
+ 
+   have_librt = conf.check(lib='rt', uselib_store='RT')
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/libev-cross-cc_0.4.9.patch b/meta-oe/recipes-devtools/nodejs/nodejs/libev-cross-cc_0.4.9.patch
deleted file mode 100644
index 2b9838f..0000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/libev-cross-cc_0.4.9.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git a/deps/libev/wscript b/deps/libev/wscript
-index 4f6c9a8..1796749 100644
---- a/deps/libev/wscript
-+++ b/deps/libev/wscript
-@@ -58,7 +58,7 @@ def configure(conf):
-           return 0;
-       }
-   """
--  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
-+  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=False,
-                 msg="Checking for SYS_clock_gettime")
- 
-   have_librt = conf.check(lib='rt', uselib_store='RT')
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb
new file mode 100644
index 0000000..22e1384
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+HOMEPAGE = "http://nodejs.org"
+LICENSE = "MIT && zlib"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d6237f3a840aef5b7880fb4e49eecfe5"
+
+DEPENDS = "openssl"
+
+SRC_URI = " \
+  http://nodejs.org/dist/node-v${PV}.tar.gz \
+  file://libev-cross-cc_${PV}.patch \
+"
+SRC_URI[md5sum] = "a6375eaa43db5356bf443e25b828ae16"
+SRC_URI[sha256sum] = "c01af05b933ad4d2ca39f63cac057f54f032a4d83cff8711e42650ccee24fce4"
+
+S = "${WORKDIR}/node-v${PV}"
+
+# v8 errors out if you have set CCACHE
+CCACHE = ""
+
+do_configure () {
+  sed -i -e 's:/usr/lib:${STAGING_LIBDIR}:g' wscript
+  sed -i -e 's:/usr/local/lib:${STAGING_LIBDIR}:g' wscript
+  ./configure --prefix=${prefix} --without-snapshot
+}
+
+do_compile () {
+  make
+}
+
+do_install () {
+  DESTDIR=${D} oe_runmake install
+}
+
+RDEPENDS_${PN} = "curl python-shell python-datetime python-subprocess python-crypt python-textutils python-netclient "
+
+FILES_${PN} += "${libdir}/node/wafadmin"
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.4.9.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.4.9.bb
deleted file mode 100644
index 70a526d..0000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.4.9.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
-HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT && zlib"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d6237f3a840aef5b7880fb4e49eecfe5"
-
-DEPENDS = "openssl"
-
-SRC_URI = " \
-  http://nodejs.org/dist/node-v${PV}.tar.gz \
-  file://libev-cross-cc_${PV}.patch \
-"
-SRC_URI[md5sum] = "e525b8b99d949bf2f031bc262c138e96"
-SRC_URI[sha256sum] = "f231ea6d19ea9ea4c7f8e7ff5061e7d301f1635bec7ed0ff1eef2512576ea442"
-
-S = "${WORKDIR}/node-v${PV}"
-
-# v8 errors out if you have set CCACHE
-CCACHE = ""
-
-do_configure () {
-  sed -i -e 's:/usr/lib:${STAGING_LIBDIR}:g' wscript
-  sed -i -e 's:/usr/local/lib:${STAGING_LIBDIR}:g' wscript
-  ./configure --prefix=${prefix} --without-snapshot
-}
-
-do_compile () {
-  make
-}
-
-do_install () {
-  DESTDIR=${D} oe_runmake install
-}
-
-RDEPENDS_${PN} = "curl python-shell python-datetime python-subprocess python-crypt python-textutils python-netclient "
-
-FILES_${PN} += "${libdir}/node/wafadmin"
-BBCLASSEXTEND = "native"
-- 
1.7.7.2



