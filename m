Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 45A75730FF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:53:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:53:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="1101041563"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 22 Feb 2017 06:53:36 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:52:44 +0200
Message-Id: <20170222145244.1367-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] lzip: remove recipe
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
X-List-Received-Date: Wed, 22 Feb 2017 14:53:36 -0000

It has been moved to oe-core

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-oe/recipes-support/lzip/lzip_1.16.bb | 41 -------------------------------
 1 file changed, 41 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lzip/lzip_1.16.bb

diff --git a/meta-oe/recipes-support/lzip/lzip_1.16.bb b/meta-oe/recipes-support/lzip/lzip_1.16.bb
deleted file mode 100644
index af0b6ae8e..000000000
--- a/meta-oe/recipes-support/lzip/lzip_1.16.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "Lossless data compressor based on the LZMA algorithm"
-HOMEPAGE = "http://lzip.nongnu.org/lzip.html"
-SECTION = "console/utils"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
-                    file://decoder.cc;endline=16;md5=0809128ac32163252846e09a70c8b80b"
-
-SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "716a9876dc595ec52d4f3bda81e42471"
-SRC_URI[sha256sum] = "128cc25baf92c8b69700831e6f984d954016318cc78edca87870d0c033112751"
-
-CONFIGUREOPTS = "\
-    '--srcdir=${S}' \
-    '--prefix=${prefix}' \
-    '--exec-prefix=${exec_prefix}' \
-    '--bindir=${bindir}' \
-    '--datadir=${datadir}' \
-    '--infodir=${infodir}' \
-    '--sysconfdir=${sysconfdir}' \
-    'CXX=${CXX}' \
-    'CPPFLAGS=${CPPFLAGS}' \
-    'CXXFLAGS=${CXXFLAGS}' \
-    'LDFLAGS=${LDFLAGS}' \
-"
-EXTRA_OEMAKE = ""
-
-B = "${S}/obj"
-do_configure () {
-    ${S}/configure ${CONFIGUREOPTS}
-}
-
-do_install () {
-    oe_runmake 'DESTDIR=${D}' install
-    # Info dir listing isn't interesting at this point so remove it if it exists.
-    if [ -e "${D}${infodir}/dir" ]; then
-        rm -f ${D}${infodir}/dir
-    fi
-}
-
-BBCLASSEXTEND += "native nativesdk"
-- 
2.11.0


