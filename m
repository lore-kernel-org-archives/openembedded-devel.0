Return-Path: <bruno.bottazzini@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6D336755F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 16:26:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 27 Apr 2016 09:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,542,1455004800"; d="scan'208";a="967745347"
Received: from bottazzini-thinkpad-t430.bz.intel.com ([10.218.98.161])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2016 09:26:57 -0700
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Apr 2016 13:26:48 -0300
Message-Id: <1461774408-29906-2-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1461774408-29906-1-git-send-email-bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
	<1461774408-29906-1-git-send-email-bruno.bottazzini@intel.com>
Subject: [meta-oe][PATCH] libmicrohttpd: update to 0.9.49
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
X-List-Received-Date: Wed, 27 Apr 2016 16:26:57 -0000

This patch removes the flag --disable-spdy since libmicrospdy was dropped from
libmicrohttpd as it is possible to see in the following commit.

Revision: 36708 ID:36708 140774ce-b5e7-0310-ab8b-a85725594a96
URL: https://gnunet.org/svn/libmicrohttpd

Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
---
 .../libmicrohttpd/libmicrohttpd_0.9.34.bb          | 27 ----------------------
 .../libmicrohttpd/libmicrohttpd_0.9.49.bb          | 26 +++++++++++++++++++++
 2 files changed, 26 insertions(+), 27 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
 create mode 100644 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb

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
diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
new file mode 100644
index 0000000..1b95068
--- /dev/null
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
+HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
+LICENSE = "LGPL-2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
+SECTION = "net"
+DEPENDS = "libgcrypt gnutls file"
+
+SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "3209aa2ac6199b874a6325342b86edbc"
+SRC_URI[sha256sum] = "9407d8252548ab97ace3276e0032f073820073c0599d43baff832902a8dab11c"
+
+inherit autotools lib_package pkgconfig
+
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
2.7.1


