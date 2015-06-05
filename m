Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4B85975662
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jun 2015 08:49:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="96510244"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jun 2015 16:53:26 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t558lZ9r002450
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 5 Jun 2015 16:47:35 +0800
Received: from localhost.localdomain (10.167.226.47) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 5 Jun 2015 16:49:05 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Jun 2015 16:49:02 +0800
Message-ID: <1433494142-1958-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.47]
Subject: [meta-networking][PATCH] rp-pppoe: add systemd support and fix error in the step of do_configure.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jun 2015 08:49:07 -0000
Content-Type: text/plain

The error is as follows:
error: unrecognized command line option '-V'
conftest.c:9:28: fatal error: ac_nonexistent.h:
No such file or directory #include <ac_nonexistent.h>.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../rp-pppoe-3.8/configure.in-Error-fix.patch      | 57 ++++++++++++++++++++++
 .../rp-pppoe/rp-pppoe-3.8/pppoe-server.service     | 11 +++++
 .../recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb     | 16 +++++-
 3 files changed, 82 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.in-Error-fix.patch
 create mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.service

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.in-Error-fix.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.in-Error-fix.patch
new file mode 100644
index 0000000..1e815f3
--- /dev/null
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.in-Error-fix.patch
@@ -0,0 +1,57 @@
+From a546942a784a177080d9722dda873bfd7416ad41 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Fri, 10 Apr 2015 13:13:06 +0900
+Subject: [PATCH] configure.in: Error fix.
+
+the error is: conftest.c:9:28: fatal error: ac_nonexistent.h:
+No such file or directory #include <ac_nonexistent.h>
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ src/configure.in | 28 ----------------------------
+ 1 file changed, 28 deletions(-)
+
+diff --git a/src/configure.in b/src/configure.in
+index c4f1a8c..74956cc 100644
+--- a/src/configure.in
++++ b/src/configure.in
+@@ -183,34 +183,6 @@ if test "$GCC" = yes; then
+ 	CFLAGS="$CFLAGS -Wall -Wstrict-prototypes -ansi"
+ fi
+ 
+-dnl Figure out packing order of structures
+-AC_CACHE_CHECK([packing order of bit fields],rpppoe_cv_pack_bitfields,[
+-AC_TRY_RUN([
+-union foo {
+-    struct bar {
+-	unsigned int ver:4;
+-	unsigned int type:4;
+-    } bb;
+-    unsigned char baz;
+-};
+-
+-int
+-main(void)
+-{
+-    union foo x;
+-    x.bb.ver = 1;
+-    x.bb.type = 2;
+-    if (x.baz == 0x21) {
+-	return 1;
+-    } else if (x.baz == 0x12) {
+-	return 0;
+-    } else {
+-	return 2;
+-    }
+-}], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
+-$ECHO "no defaults for cross-compiling"; exit 1)
+-])
+-
+ if test "$rpppoe_cv_pack_bitfields" = "rev" ; then
+ 	AC_MSG_RESULT(reversed)
+ 	AC_DEFINE([PACK_BITFIELDS_REVERSED], [], [Reversed bitfields])
+-- 
+1.8.4.2
+
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.service b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.service
new file mode 100644
index 0000000..41e0b9e
--- /dev/null
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=PPPOE Service
+After=network.target
+
+[Service]
+Type=forking
+EnvironmentFile=-@SYSCONFDIR@/default/pppoe-server
+ExecStart=@SBINDIR@/pppoe-server
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
index d1b0481..f3bd994 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
@@ -16,12 +16,21 @@ SRC_URI = "http://www.roaringpenguin.com/files/download/${BP}.tar.gz \
            file://use-ldflags.patch \
            file://configure.patch \
            file://pppoe-server.default \
-           file://pppoe-server.init"
+           file://pppoe-server.init \
+           file://configure.in-Error-fix.patch \
+           file://pppoe-server.service"
 
 SRC_URI[md5sum] = "0e32760f498f9cde44081ee6aafc823b"
 SRC_URI[sha256sum] = "d916e9cfe1e62395f63a5361936fa855f6d0f0a37dc7227b394cdb725f553479"
 
-inherit autotools-brokensep update-rc.d
+inherit autotools-brokensep update-rc.d systemd
+
+do_install_append() {
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/pppoe-server.service ${D}${systemd_unitdir}/system
+    sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/pppoe-server.service
+    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/pppoe-server.service
+}
 
 do_install() {
     # Install init script and default settings
@@ -33,6 +42,9 @@ do_install() {
     chmod 4755 ${D}${sbindir}/pppoe
 }
 
+SYSTEMD_PACKAGES = "${PN}-server"
+SYSTEMD_SERVICE_${PN}-server = "pppoe-server.service"
+SYSTEMD_AUTO_ENABLE = "disable"
 # Insert server package before main package
 PACKAGES = "${PN}-dbg ${PN}-server ${PN}-relay ${PN}-sniff ${PN} ${PN}-doc"
 
-- 
1.8.4.2


