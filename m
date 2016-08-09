Return-Path: <sven.ebenfeld@vaillant-group.com>
Received: from mailgw01.hp-net.de (mailgw01.hp-net.de [213.15.0.25])
	by mail.openembedded.org (Postfix) with ESMTP id AD2D6771FB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 12:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailgw01.hp-net.de (Postfix) with ESMTP id 4787B229142
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 14:44:31 +0200 (CEST)
X-Virus-Scanned: Virusscanner at mailgw01
Received: from mailgw01.hp-net.de ([127.0.0.1])
	by localhost (mailgw01.hp-net.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X-50ftnsbQ69
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 14:44:31 +0200 (CEST)
Received: from jv-de-dc-fideas01.vaillant.vhgroup.lan
	(jv-de-dc-fideas01.vaillant.vhgroup.lan [10.107.7.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mailgw01.hp-net.de (Postfix) with ESMTPS id 341C722905F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 14:44:31 +0200 (CEST)
Received: from vadeff07.vaillant.vhgroup.lan (unknown [10.107.77.149])
	by jv-de-dc-fideas01.vaillant.vhgroup.lan (Postfix) with ESMTPS
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 14:44:30 +0200 (CEST)
Received: from ubuntu.vaillant.vhgroup.lan (10.107.185.224) by
	vadeff07.vaillant.vhgroup.lan (10.107.77.149) with Microsoft SMTP
	Server id 14.3.301.0; Tue, 9 Aug 2016 14:44:30 +0200
From: Sven Ebenfeld <sven.ebenfeld@vaillant-group.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Aug 2016 14:44:09 +0200
Message-ID: <1470746650-60267-1-git-send-email-sven.ebenfeld@vaillant-group.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-OLX-Disclaimer: Done
Cc: Sven Ebenfeld <sven.ebenfeld@vaillant-group.com>
Subject: [PATCH] libmicrohttpd: update 0.9.49 -> 0.9.50
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
X-List-Received-Date: Tue, 09 Aug 2016 12:44:34 -0000
Content-Type: text/plain

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@vaillant-group.com>
---
 .../libmicrohttpd/libmicrohttpd_0.9.49.bb          | 25 ----------------------
 .../libmicrohttpd/libmicrohttpd_0.9.50.bb          | 25 ++++++++++++++++++++++
 2 files changed, 25 insertions(+), 25 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
 create mode 100644 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.50.bb

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
deleted file mode 100644
index 9abb200..0000000
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
-HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
-LICENSE = "LGPL-2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
-SECTION = "net"
-DEPENDS = "libgcrypt gnutls file"
-
-SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "3209aa2ac6199b874a6325342b86edbc"
-SRC_URI[sha256sum] = "9407d8252548ab97ace3276e0032f073820073c0599d43baff832902a8dab11c"
-
-inherit autotools lib_package pkgconfig
-
-EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../"
-
-PACKAGECONFIG ?= "curl"
-PACKAGECONFIG_append_class-target = "\
-        ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)} \
-"
-PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
-PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
-
-do_compile_append() {
-    sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
-}
diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.50.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.50.bb
new file mode 100644
index 0000000..421b78e
--- /dev/null
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.50.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
+HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
+LICENSE = "LGPL-2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
+SECTION = "net"
+DEPENDS = "libgcrypt gnutls file"
+
+SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "4a3f793d59f663a2b0fc62d44668fb66"
+SRC_URI[sha256sum] = "d1b6385068abded29b6470e383287aa7705de05ae3c08ad0bf5747ac4dc6ebd7"
+
+inherit autotools lib_package pkgconfig
+
+EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../"
+
+PACKAGECONFIG ?= "curl"
+PACKAGECONFIG_append_class-target = "\
+        ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)} \
+"
+PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
+PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
+
+do_compile_append() {
+    sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
+}
-- 
1.9.1


