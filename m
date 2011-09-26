Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R8E4c-00014S-BO
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Sep 2011 18:30:30 +0200
Received: by gyg8 with SMTP id 8so5421936gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2011 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=69Fnt2iK2k51bMSQ0CJ1i2j7HAAGGcX3XyNT7Ge9uQs=;
	b=Dn4R1QplvKds0YFpvMmzl4NTN+Tv9+o6Svr0Iv/hSjoDp2nNDD7A2uyltQrSP4b/kK
	fvu9dlEuAwyrFZXGoqJgS+tEeQqtC57tDrfYQ+BDH/JBYjD/VDOXdwhI/zRpTCY4C2+S
	EscSDmPF0WRkw8zBUUcijMyOCsYX4WfqqA5g4=
Received: by 10.236.200.137 with SMTP id z9mr40930909yhn.27.1317054301372;
	Mon, 26 Sep 2011 09:25:01 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id s42sm29716124yhs.0.2011.09.26.09.24.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Sep 2011 09:24:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Sep 2011 09:24:41 -0700
Message-Id: <1317054285-19029-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 1/5] fuse: Upgrade recipe to version 2.8.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Sep 2011 16:30:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../fuse/fuse-2.8.6/define_GNU_SOURCE.patch        |   12 +++++++
 meta-oe/recipes-support/fuse/fuse_2.8.6.bb         |   34 ++++++++++++++++++++
 2 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/fuse/fuse-2.8.6/define_GNU_SOURCE.patch
 create mode 100644 meta-oe/recipes-support/fuse/fuse_2.8.6.bb

diff --git a/meta-oe/recipes-support/fuse/fuse-2.8.6/define_GNU_SOURCE.patch b/meta-oe/recipes-support/fuse/fuse-2.8.6/define_GNU_SOURCE.patch
new file mode 100644
index 0000000..c673a4c
--- /dev/null
+++ b/meta-oe/recipes-support/fuse/fuse-2.8.6/define_GNU_SOURCE.patch
@@ -0,0 +1,12 @@
+Index: fuse-2.8.6/util/fusermount.c
+===================================================================
+--- fuse-2.8.6.orig/util/fusermount.c	2011-09-13 00:23:14.000000000 -0700
++++ fuse-2.8.6/util/fusermount.c	2011-09-25 00:23:53.051019038 -0700
+@@ -7,6 +7,7 @@
+ */
+ /* This program does the mounting and unmounting of FUSE filesystems */
+ 
++#define _GNU_SOURCE
+ #include <config.h>
+ 
+ #include "mount_util.h"
diff --git a/meta-oe/recipes-support/fuse/fuse_2.8.6.bb b/meta-oe/recipes-support/fuse/fuse_2.8.6.bb
new file mode 100644
index 0000000..06eead1
--- /dev/null
+++ b/meta-oe/recipes-support/fuse/fuse_2.8.6.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "With FUSE it is possible to implement a fully functional filesystem in a userspace program"
+HOMEPAGE = "http://fuse.sf.net"
+SECTION = "libs"
+LICENSE = "GPLv2&LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
+
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "eaa32c8cef56a981656a786f258a002a"
+SRC_URI[sha256sum] = "1ec1913e38f09b2a9ec1579e1800805b5e2c747d1dce515e316dbb665ca139d6"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-kernel-module"
+
+PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
+
+RRECOMMENDS_${PN} = "kernel-module-fuse""
+
+FILES_${PN} += "${libdir}/libfuse.so.*"
+FILES_${PN}-dev += "${libdir}/libfuse*.la"
+
+FILES_libulockmgr = "${libdir}/libulockmgr.so.*"
+FILES_libulockmgr-dev += "${libdir}/libulock*.la"
+FILES_libulockmgr-dbg += "${libdir}/.debug/libulock*"
+
+# Forbid auto-renaming to libfuse-utils
+FILES_fuse-utils = "${bindir} ${base_sbindir}"
+FILES_fuse-utils-dbg = "${bindir}/.debug ${base_sbindir}/.debug"
+DEBIAN_NOAUTONAME_fuse-utils = "1"
+DEBIAN_NOAUTONAME_fuse-utils-dbg = "1"
-- 
1.7.5.4



