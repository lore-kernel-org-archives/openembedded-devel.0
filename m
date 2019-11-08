Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id D4C897FC6E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 09:14:48 +0000 (UTC)
Received: from paloverde.toradex.int (unknown [31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 963A05C086F;
	Fri,  8 Nov 2019 10:14:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1573204489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=d4sxuJtmBf4CcuO9OOBN/UDcCjrpUy+ddffrg0kZwFs=;
	b=VRWYIFRCPjbCg3qmWXFvHchDA2G1nyhmT4zwBvZ2Ea9p827U8Xz686NGkUjw+WP4z/5WYN
	eLJ5cncoLnSv5pK4EDqoKcKrYv27fLUvfh4s2yi7iKJvGRtCcXCOa4BRbFUkudtQvN1UZ1
	o66eDwoV+VIsFLe/jXngTHoM+YaRSlU=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Nov 2019 09:14:41 +0000
Message-Id: <20191108091441.25374-1-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-oe][PATCH] zstd: move recipe to oe-core
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
X-List-Received-Date: Fri, 08 Nov 2019 09:14:49 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Move the zstd recipe to openembedded-core and hence remove it in
meta-oe.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta-oe/recipes-extended/zstd/zstd_1.4.4.bb | 35 ---------------------
 1 file changed, 35 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/zstd/zstd_1.4.4.bb

diff --git a/meta-oe/recipes-extended/zstd/zstd_1.4.4.bb b/meta-oe/recipes-extended/zstd/zstd_1.4.4.bb
deleted file mode 100644
index eb201f413..000000000
--- a/meta-oe/recipes-extended/zstd/zstd_1.4.4.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "Zstandard - Fast real-time compression algorithm"
-DESCRIPTION = "Zstandard is a fast lossless compression algorithm, targeting \
-real-time compression scenarios at zlib-level and better compression ratios. \
-It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
-HOMEPAGE = "http://www.zstd.net/"
-SECTION = "console/utils"
-
-LICENSE = "BSD-3-Clause & GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
-                    file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
-
-SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1"
-
-SRCREV = "10f0e6993f9d2f682da6d04aa2385b7d53cbb4ee"
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-
-S = "${WORKDIR}/git"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[lz4] = "HAVE_LZ4=1,HAVE_LZ4=0,lz4"
-PACKAGECONFIG[lzma] = "HAVE_LZMA=1,HAVE_LZMA=0,xz"
-PACKAGECONFIG[zlib] = "HAVE_ZLIB=1,HAVE_ZLIB=0,zlib"
-
-# See programs/README.md for how to use this
-ZSTD_LEGACY_SUPPORT ??= "4"
-
-do_compile () {
-    oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT}
-}
-
-do_install () {
-    oe_runmake install 'DESTDIR=${D}'
-}
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


