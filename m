Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 00894780BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 10:24:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jan 2018 02:24:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,421,1511856000"; d="scan'208";a="13389003"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by fmsmga007.fm.intel.com with ESMTP; 27 Jan 2018 02:24:34 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Jan 2018 02:24:28 -0800
Message-Id: <20180127102428.16599-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [meta-oe][PATCH] mraa: fix build for musl
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
X-List-Received-Date: Sat, 27 Jan 2018 10:24:34 -0000

* be16toh and le16toh are defined in endian.h

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...o_driver.c-include-endian.h-to-fix-musl-b.patch | 29 ++++++++++++++++++++++
 meta-oe/recipes-extended/mraa/mraa_git.bb          |  2 ++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mraa/mraa/0001-examples-iio_driver.c-include-endian.h-to-fix-musl-b.patch

diff --git a/meta-oe/recipes-extended/mraa/mraa/0001-examples-iio_driver.c-include-endian.h-to-fix-musl-b.patch b/meta-oe/recipes-extended/mraa/mraa/0001-examples-iio_driver.c-include-endian.h-to-fix-musl-b.patch
new file mode 100644
index 000000000..401949e2e
--- /dev/null
+++ b/meta-oe/recipes-extended/mraa/mraa/0001-examples-iio_driver.c-include-endian.h-to-fix-musl-b.patch
@@ -0,0 +1,29 @@
+From 6c2649718fc9818da0d602a0b4767ea21a367e9e Mon Sep 17 00:00:00 2001
+From: Tim Orling <timothy.t.orling@linux.intel.com>
+Date: Sat, 27 Jan 2018 02:06:36 -0800
+Subject: [PATCH] examples/iio_driver.c: include endian.h to fix musl build
+
+* be16toh and le16toh are defined in endian.h
+
+Upstream-Status: Pending
+
+Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+---
+ examples/iio_driver.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/examples/iio_driver.c b/examples/iio_driver.c
+index c5a0181..e3dc438 100644
+--- a/examples/iio_driver.c
++++ b/examples/iio_driver.c
+@@ -23,6 +23,7 @@
+  */
+ 
+ #include <unistd.h>
++#include <endian.h>
+ #include "mraa/iio.h"
+ 
+ static void
+-- 
+2.13.6
+
diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index c4b9c6f90..e1d593cbe 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -10,6 +10,8 @@ PV = "1.7.0-git${SRCPV}"
 
 SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http"
 
+SRC_URI_append_libc-musl = " file://0001-examples-iio_driver.c-include-endian.h-to-fix-musl-b.patch"
+
 S = "${WORKDIR}/git"
 
 # CMakeLists.txt checks the architecture, only x86 and ARM supported for now
-- 
2.13.6


