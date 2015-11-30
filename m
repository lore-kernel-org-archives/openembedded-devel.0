Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D138760722
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2015 10:10:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAUAABiU027023
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2015 02:10:12 -0800
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 30 Nov 2015 02:10:11 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Nov 2015 18:10:13 +0800
Message-ID: <1448878213-1000-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ncftp: fix build failures with ccdv
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
X-List-Received-Date: Mon, 30 Nov 2015 10:10:13 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

ccdv is an internal tool to reduce the deluge Make output
to make finding actual problems easier and it is intended
to be invoked from Makefiles only, it doesn't work for the
cross compiling, so compile it with $BUILD_CC and
corresponding CFLAGS.

And I think we don't need to enable it by default to
reduce our Make output, so add a PACKAGECONFIG for it
but disable it by default.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../ncftp-configure-use-BUILD_CC-for-ccdv.patch    | 32 ++++++++++++++++++++++
 .../recipes-daemons/ncftp/ncftp_3.2.5.bb           |  7 ++++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/ncftp-configure-use-BUILD_CC-for-ccdv.patch

diff --git a/meta-networking/recipes-daemons/ncftp/ncftp/ncftp-configure-use-BUILD_CC-for-ccdv.patch b/meta-networking/recipes-daemons/ncftp/ncftp/ncftp-configure-use-BUILD_CC-for-ccdv.patch
new file mode 100644
index 0000000..aa59017
--- /dev/null
+++ b/meta-networking/recipes-daemons/ncftp/ncftp/ncftp-configure-use-BUILD_CC-for-ccdv.patch
@@ -0,0 +1,32 @@
+From 043e1a9ec83a59671ef8c4cad679dbf781e5ef98 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Sun, 29 Nov 2015 23:37:06 -0800
+Subject: [PATCH] configure: use BUILD_CC for ccdv
+
+ccdv is intended to be invoked from Makefiles only,
+it doesn't work for the cross compiling, so compile
+it with $BUILD_CC and corresponding CFLAGS.
+
+Upstream-Status: Inappropriate [cross compile specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 2f0fae0..a7e9112 100755
+--- a/configure
++++ b/configure
+@@ -11286,7 +11286,7 @@ panic:
+ }	/* main */
+ /* eof ccdv.c */
+ EOF
+-		${CC-cc} $DEFS $CPPFLAGS $CFLAGS "ccdv.c" -o "ccdv" >/dev/null 2>&1
++		${BUILD_CC} $DEFS ${BUILD_CPPFLAGS} ${BUILD_CFLAGS} "ccdv.c" -o "ccdv" >/dev/null 2>&1
+ 	rm -f ccdv.c ccdv.o ccdv.c.gz.uu ccdv.c.gz
+ 	strip ./ccdv >/dev/null 2>&1
+ 	./ccdv >/dev/null 2>&1
+-- 
+2.3.5
+
diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
index 40b59a4..893eacb 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
+++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
@@ -5,12 +5,17 @@ LICENSE = "ClArtistic"
 LIC_FILES_CHKSUM = "file://ncftp/cmds.c;beginline=3;endline=4;md5=9de76faeaedc4f908082e3f8142715f4"
 DEPENDS = "ncurses"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz \
+           file://ncftp-configure-use-BUILD_CC-for-ccdv.patch \
+"
 SRC_URI[md5sum] = "685e45f60ac11c89442c572c28af4228"
 SRC_URI[sha256sum] = "ac111b71112382853b2835c42ebe7bd59acb7f85dd00d44b2c19fbd074a436c4"
 
 inherit autotools-brokensep pkgconfig
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[ccdv] = "--enable-ccdv,--disable-ccdv,,"
+
 do_configure() {
     oe_runconf
 }
-- 
2.3.5


