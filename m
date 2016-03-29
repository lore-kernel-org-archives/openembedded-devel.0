Return-Path: <jose.bollo@iot.bzh>
Received: from mx1a.lautre.net (mx1a.lautre.net [80.67.160.71])
	by mail.openembedded.org (Postfix) with ESMTP id B1B6F6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 08:06:50 +0000 (UTC)
Received: from jobol.la-dameblanche.fr (por56-1-78-229-206-229.fbx.proxad.net
	[78.229.206.229]) (Authenticated sender: jobol@nonadev.net)
	by mx1a.lautre.net (Postfix) with ESMTPA id ADD2841343;
	Tue, 29 Mar 2016 10:06:49 +0200 (CEST)
From: jose.bollo@iot.bzh
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Mar 2016 10:06:35 +0200
Message-Id: <1459238795-12674-1-git-send-email-jose.bollo@iot.bzh>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] libmicrohttp: update to version 0.9.48
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
X-List-Received-Date: Tue, 29 Mar 2016 08:06:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: José Bollo <jose.bollo@iot.bzh>

Change-Id: I33a1acf8360d074a3310f9691ac939fe70a99f3e
Signed-off-by: José Bollo <jose.bollo@iot.bzh>
---
 .../libmicrohttpd/libmicrohttpd_0.9.34.bb          | 27 ----------------------
 .../libmicrohttpd/libmicrohttpd_0.9.48.bb          | 27 ++++++++++++++++++++++
 2 files changed, 27 insertions(+), 27 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
 create mode 100644 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
deleted file mode 100644
index e3c833b..0000000
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
-HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
-LICENSE = "LGPL-2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
-SECTION = "net"
-DEPENDS = "libgcrypt gnutls file"
-
-SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "2947eee13c2c8affb95023a0cb6fda0c"
-SRC_URI[sha256sum] = "29a2bfd4fd2ddf60c756b8c283291a134898e3cc143843be421a040be1b25a88"
-
-inherit autotools lib_package
-
-# disable spdy, because it depends on openssl
-EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../ --disable-spdy"
-
-PACKAGECONFIG ?= "curl"
-PACKAGECONFIG_append_class-target = "\
-        ${@base_contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)} \
-"
-PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
-PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
-
-do_compile_append() {
-	sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
-}
-
diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
new file mode 100644
index 0000000..892009e
--- /dev/null
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
+HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
+LICENSE = "LGPL-2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
+SECTION = "net"
+DEPENDS = "libgcrypt gnutls file"
+
+SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "9c298c890088a91fe0d7ac3fec9d0097"
+SRC_URI[sha256sum] = "87667e158f2bf8c691a002e256ffe30885d4121a9ee4143af0320c47cdf8a2a4"
+
+inherit autotools lib_package
+
+# disable spdy, because it depends on openssl
+EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../"
+
+PACKAGECONFIG ?= "curl"
+PACKAGECONFIG_append_class-target = "\
+        ${@base_contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)} \
+"
+PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
+PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
+
+do_compile_append() {
+	sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
+}
+
-- 
2.1.4


