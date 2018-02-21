Return-Path: <brendan.le.foll@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 5579D787F1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 14:00:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2018 05:50:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,543,1511856000"; d="scan'208";a="19361450"
Received: from schultz.iul.intel.com ([172.28.50.124])
	by fmsmga008.fm.intel.com with ESMTP; 21 Feb 2018 05:50:44 -0800
From: Brendan Le Foll <brendan.le.foll@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Feb 2018 14:50:41 +0100
Message-Id: <20180221135042.24289-1-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.16.2
Cc: Brendan Le Foll <brendan.le.foll@intel.com>
Subject: [meta-oe][PATCH 1/2] mraa: Update recipe to use v1.9.0
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
X-List-Received-Date: Wed, 21 Feb 2018 14:00:21 -0000

The musl endian patch has been merged upstream so is no longer needed

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 ...o_driver.c-include-endian.h-to-fix-musl-b.patch | 29 ----------------------
 meta-oe/recipes-extended/mraa/mraa_git.bb          |  8 +++---
 2 files changed, 3 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mraa/mraa/0001-examples-iio_driver.c-include-endian.h-to-fix-musl-b.patch

diff --git a/meta-oe/recipes-extended/mraa/mraa/0001-examples-iio_driver.c-include-endian.h-to-fix-musl-b.patch b/meta-oe/recipes-extended/mraa/mraa/0001-examples-iio_driver.c-include-endian.h-to-fix-musl-b.patch
deleted file mode 100644
index 401949e2e..000000000
--- a/meta-oe/recipes-extended/mraa/mraa/0001-examples-iio_driver.c-include-endian.h-to-fix-musl-b.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 6c2649718fc9818da0d602a0b4767ea21a367e9e Mon Sep 17 00:00:00 2001
-From: Tim Orling <timothy.t.orling@linux.intel.com>
-Date: Sat, 27 Jan 2018 02:06:36 -0800
-Subject: [PATCH] examples/iio_driver.c: include endian.h to fix musl build
-
-* be16toh and le16toh are defined in endian.h
-
-Upstream-Status: Pending
-
-Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
----
- examples/iio_driver.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/examples/iio_driver.c b/examples/iio_driver.c
-index c5a0181..e3dc438 100644
---- a/examples/iio_driver.c
-+++ b/examples/iio_driver.c
-@@ -23,6 +23,7 @@
-  */
- 
- #include <unistd.h>
-+#include <endian.h>
- #include "mraa/iio.h"
- 
- static void
--- 
-2.13.6
-
diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index e1d593cbe..16883be3a 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -3,15 +3,13 @@ HOMEPAGE = "https://github.com/intel-iot-devkit/mraa"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=66493d54e65bfc12c7983ff2e884f37f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4b92a3b497d7943042a6db40c088c3f2"
 
-SRCREV = "8ddbcde84e2d146bc0f9e38504d6c89c14291480"
-PV = "1.7.0-git${SRCPV}"
+SRCREV = "fbb7d9232067eac3f4508a37a8f7ea0c4fcebacb"
+PV = "1.9.0-git${SRCPV}"
 
 SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http"
 
-SRC_URI_append_libc-musl = " file://0001-examples-iio_driver.c-include-endian.h-to-fix-musl-b.patch"
-
 S = "${WORKDIR}/git"
 
 # CMakeLists.txt checks the architecture, only x86 and ARM supported for now
-- 
2.16.2


