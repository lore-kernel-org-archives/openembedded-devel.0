Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1FD45786FA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Nov 2017 16:30:08 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2017 08:30:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,436,1505804400"; d="scan'208";a="152168329"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 22 Nov 2017 08:30:08 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Nov 2017 18:30:30 +0200
Message-Id: <20171122163030.10224-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH] neon: add the recipe from oe-core
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
X-List-Received-Date: Wed, 22 Nov 2017 16:30:09 -0000

It is still required by libmusicbrainz, but is no longer needed
by oe-core. Switch the upstream to debian as webdav.org is down.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-oe/recipes-support/neon/neon/pkgconfig.patch | 15 +++++++++
 meta-oe/recipes-support/neon/neon_0.30.2.bb       | 38 +++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-support/neon/neon/pkgconfig.patch
 create mode 100644 meta-oe/recipes-support/neon/neon_0.30.2.bb

diff --git a/meta-oe/recipes-support/neon/neon/pkgconfig.patch b/meta-oe/recipes-support/neon/neon/pkgconfig.patch
new file mode 100644
index 000000000..239dba8e2
--- /dev/null
+++ b/meta-oe/recipes-support/neon/neon/pkgconfig.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate [configuration]
+
+---
+ neon.pc.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- neon-0.30.1.orig/neon.pc.in
++++ neon-0.30.1/neon.pc.in
+@@ -7,5 +7,5 @@ Name: neon
+ Description: HTTP/WebDAV client library
+ Version: @NEON_VERSION@
+ Libs: -L${libdir} -lneon @NEON_PC_LIBS@
+-Libs.private: @NEON_LIBS@
++Libs.private: -L${libdir} -lz -lgcrypt -lgpg-error -lexpat -lgnutls
+ Cflags: -I${includedir}/neon @NEON_CFLAGS@
diff --git a/meta-oe/recipes-support/neon/neon_0.30.2.bb b/meta-oe/recipes-support/neon/neon_0.30.2.bb
new file mode 100644
index 000000000..12a2e0b37
--- /dev/null
+++ b/meta-oe/recipes-support/neon/neon_0.30.2.bb
@@ -0,0 +1,38 @@
+SUMMARY = "An HTTP and WebDAV client library with a C interface"
+HOMEPAGE = "http://www.webdav.org/neon/"
+SECTION = "libs"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a \
+                    file://src/ne_utils.h;beginline=1;endline=20;md5=2caca609538eddaa6f6adf120a218037"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/n/neon27/neon27_${PV}.orig.tar.gz \
+           file://pkgconfig.patch \
+          "
+
+SRC_URI[md5sum] = "e28d77bf14032d7f5046b3930704ef41"
+SRC_URI[sha256sum] = "db0bd8cdec329b48f53a6f00199c92d5ba40b0f015b153718d1b15d3d967fbca"
+
+inherit autotools binconfig-disabled lib_package pkgconfig
+
+# Enable gnutls or openssl, not both
+PACKAGECONFIG ?= "expat gnutls libproxy webdav zlib"
+PACKAGECONFIG_class-native = "expat gnutls webdav zlib"
+
+PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat"
+PACKAGECONFIG[gnutls] = "--with-ssl=gnutls,,gnutls"
+PACKAGECONFIG[gssapi] = "--with-gssapi,--without-gssapi,krb5"
+PACKAGECONFIG[libproxy] = "--with-libproxy,--without-libproxy,libproxy"
+PACKAGECONFIG[libxml2] = "--with-libxml2,--without-libxml2,libxml2"
+PACKAGECONFIG[openssl] = "--with-ssl=openssl,,openssl"
+PACKAGECONFIG[webdav] = "--enable-webdav,--disable-webdav,"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
+
+EXTRA_OECONF += "--enable-shared"
+
+do_compile_append() {
+	oe_runmake -C test
+}
+
+BINCONFIG = "${bindir}/neon-config"
+
+BBCLASSEXTEND = "native"
-- 
2.15.0


