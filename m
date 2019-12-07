Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id D429E7CBE4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2019 16:16:45 +0000 (UTC)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch
	[31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 0DC325C2A56;
	Sat,  7 Dec 2019 17:16:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1575735406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=tR86tZlJIPfGNoutlYcCbKfc67T9E9DF8YfHfY6muPU=;
	b=oTbdipgjVJY1jBAXz4hj5ETKUggmjUzHi4lQZ1Io3iOcU/6DCFAlnSKnG1YcLwsXDj4RCf
	n6MBGPO5IoR+Sy0MpDgtQBO71f/Ra2PRjbkF2ffkc9otUrAqD/bkofJ02HEZMpMRZZ/W2A
	nKSFVb799ApB93Ct1DXul90o1UfEg5c=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Sat,  7 Dec 2019 16:16:35 +0000
Message-Id: <20191207161635.21691-1-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-oe][PATCH] Revert "zstd: move recipe to oe-core"
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
X-List-Received-Date: Sat, 07 Dec 2019 16:16:47 -0000

From: Stefan Agner <stefan.agner@toradex.com>

The recipe has not been accepted in oe-core. So readd the recipe to
meta-openembedded.

This reverts commit b0b9cebc72a7f6e4451b64e54701709cee30fded.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta-oe/recipes-extended/zstd/zstd_1.4.4.bb | 35 +++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-extended/zstd/zstd_1.4.4.bb

diff --git a/meta-oe/recipes-extended/zstd/zstd_1.4.4.bb b/meta-oe/recipes-extended/zstd/zstd_1.4.4.bb
new file mode 100644
index 000000000..eb201f413
--- /dev/null
+++ b/meta-oe/recipes-extended/zstd/zstd_1.4.4.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Zstandard - Fast real-time compression algorithm"
+DESCRIPTION = "Zstandard is a fast lossless compression algorithm, targeting \
+real-time compression scenarios at zlib-level and better compression ratios. \
+It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
+HOMEPAGE = "http://www.zstd.net/"
+SECTION = "console/utils"
+
+LICENSE = "BSD-3-Clause & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
+                    file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
+
+SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1"
+
+SRCREV = "10f0e6993f9d2f682da6d04aa2385b7d53cbb4ee"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[lz4] = "HAVE_LZ4=1,HAVE_LZ4=0,lz4"
+PACKAGECONFIG[lzma] = "HAVE_LZMA=1,HAVE_LZMA=0,xz"
+PACKAGECONFIG[zlib] = "HAVE_ZLIB=1,HAVE_ZLIB=0,zlib"
+
+# See programs/README.md for how to use this
+ZSTD_LEGACY_SUPPORT ??= "4"
+
+do_compile () {
+    oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT}
+}
+
+do_install () {
+    oe_runmake install 'DESTDIR=${D}'
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


