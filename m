Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4396C44524
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 07:36:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18496.1784792199506269838
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 00:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=efITDSSK;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784792200; x=1816328200;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aqdaNjYpUKy2TBugiqjmus8q1JSAZ5H5qYy9yQJpKVQ=;
  b=efITDSSK0u6ZN2H5nz1Ug61kg5i1wLk3+HBYBWc/2Vm1NCgaNemWgNVH
   4zWDeXuvmGr3CgzlROed445TL/a1ZndNd9ycTKsrJoJF82mqGGCqoq0nV
   SgNlW6CischqF5MAiIimmb/SB+ARatS8W3rxlXD/d3kG7ObB8eeW+gvFD
   SnZeI61VgAPgi/t0ztYgV84+diku1478xZ3f0tnwf4vea1RhSKP+tZLKy
   lxOEkt4lJdjKjl4dzZmWWMN8qWf/Bny13HJXnLElDWO8FtN0BXUp3GoIH
   vteSEdSXQRstIcSuE2zi3YIxwgy1DO6BodOsBKYFKU+UPJNphM2N+PPj7
   w==;
X-CSE-ConnectionGUID: xD5u9LTZRe6KXYs05nxfsw==
X-CSE-MsgGUID: KLgjtd48T4aZE9b1dH1G6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85293631"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="85293631"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:36:39 -0700
X-CSE-ConnectionGUID: gDzX+NNnQQ6C5Us38L300A==
X-CSE-MsgGUID: GDDCVB88SDanCCc0DjpDhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="257085744"
Received: from andromeda02.png.intel.com ([10.107.232.49])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:36:38 -0700
From: yogesh.tyagi@intel.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-oe][PATCH] xdotool: fix do_install failure due to missing pc.sh
Date: Thu, 23 Jul 2026 15:36:22 +0800
Message-ID: <20260723073622.1859407-1-yogesh.tyagi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 07:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128414

From: Yogesh Tyagi <yogesh.tyagi@intel.com>

The 4.20251130.1 upgrade switched SRC_URI from a git snapshot to the
GitHub release tarball. That tarball ships a prebuilt libxdo.pc but does
not include pc.sh, even though the Makefile still carries the rule:

    libxdo.pc: VERSION
    	sh pc.sh $(VERSION) $(INSTALLLIB) $(INSTALLINCLUDE) > libxdo.pc

do_install runs "make install", which pulls in the installpc target.
Because libxdo.pc depends on VERSION, whenever a fresh unpack leaves
VERSION with an mtime newer than or equal to libxdo.pc, make considers
the shipped libxdo.pc stale and re-runs pc.sh, failing with:

    sh: 0: cannot open pc.sh: No such file
    make: *** [Makefile:153: libxdo.pc] Error 2

The mtime ordering after unpack is not deterministic, so the failure is
intermittent and typically shows up after a re-fetch. On top of that,
the prebuilt libxdo.pc in the tarball hard-codes /usr/local paths, so
even when the race does not trigger, an incorrect .pc gets installed.

Ship the upstream pc.sh alongside the recipe and place it in ${S} so the
installpc rule regenerates libxdo.pc with the correct libdir/includedir
from EXTRA_OEMAKE. This fixes both the build failure and the wrong paths.

Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
---
 meta-oe/recipes-graphics/xdotool/xdotool/pc.sh  | 17 +++++++++++++++++
 .../xdotool/xdotool_4.20251130.1.bb             | 12 +++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/xdotool/xdotool/pc.sh

diff --git a/meta-oe/recipes-graphics/xdotool/xdotool/pc.sh b/meta-oe/recipes-graphics/xdotool/xdotool/pc.sh
new file mode 100644
index 0000000000..da7c81d75d
--- /dev/null
+++ b/meta-oe/recipes-graphics/xdotool/xdotool/pc.sh
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+VERSION=$1
+LIBDIR=$2
+INCLUDEDIR=$3
+
+cat <<ENDPC
+libdir=${LIBDIR}
+includedir=${INCLUDEDIR}
+
+Name: libxdo
+Description: fake keyboard/mouse input, window management, and more
+Version: ${VERSION}
+Requires: x11
+Libs: -L\${libdir} -lxdo
+Cflags: -I\${includedir}
+ENDPC
diff --git a/meta-oe/recipes-graphics/xdotool/xdotool_4.20251130.1.bb b/meta-oe/recipes-graphics/xdotool/xdotool_4.20251130.1.bb
index e2792ed0b0..a1a792f45d 100644
--- a/meta-oe/recipes-graphics/xdotool/xdotool_4.20251130.1.bb
+++ b/meta-oe/recipes-graphics/xdotool/xdotool_4.20251130.1.bb
@@ -9,7 +9,13 @@ inherit features_check pkgconfig perlnative
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "https://github.com/jordansissel/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
+# The release tarball ships a prebuilt (and wrongly pathed) libxdo.pc but omits
+# pc.sh, which the Makefile's installpc rule needs to (re)generate libxdo.pc.
+# Depending on the unpack mtime ordering of VERSION vs libxdo.pc, make tries to
+# rebuild libxdo.pc and fails with "sh: 0: cannot open pc.sh". Supply the
+# upstream pc.sh so regeneration works with the correct libdir/includedir.
+SRC_URI = "https://github.com/jordansissel/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
+           file://pc.sh"
 SRC_URI[sha256sum] = "eee789b00d6a13d47b31bbc139727e6408c21b5f6ba5e804fdf6ecfb8c781356"
 
 EXTRA_OEMAKE = "PREFIX=${prefix} INSTALLLIB=${libdir} INSTALLMAN=${mandir} WITHOUT_RPATH_FIX=1"
@@ -17,6 +23,10 @@ EXTRA_OEMAKE = "PREFIX=${prefix} INSTALLLIB=${libdir} INSTALLMAN=${mandir} WITHO
 UPSTREAM_CHECK_URI = "https://github.com/jordansissel/xdotool/tags"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+\.\d{8}\.\d+)"
 
+do_configure:append() {
+    install -m 0755 ${UNPACKDIR}/pc.sh ${S}/pc.sh
+}
+
 do_install() {
     oe_runmake install DESTDIR=${D} PREFIX=${prefix} LDCONFIG=true
 }
-- 
2.43.0


