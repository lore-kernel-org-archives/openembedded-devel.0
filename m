Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id E76CC6011F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Jul 2017 16:29:59 +0000 (UTC)
Received: from localhost.localdomain (pub082136089155.dh-hfc.datazug.ch
	[82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DB23422BE3;
	Sun,  9 Jul 2017 16:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB23422BE3
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Jul 2017 18:29:34 +0200
Message-Id: <20170709162934.21355-1-krzk@kernel.org>
X-Mailer: git-send-email 2.11.0
Subject: [meta-filesystems][PATCH] recipes-utils: Add recipe for udevil
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
X-List-Received-Date: Sun, 09 Jul 2017 16:30:02 -0000

udevil is a command line Linux program which mounts and unmounts
removable devices without a password.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../0001-udevil-0.4.3-fix-compile-with-gcc6.patch  | 12 ++++++++++
 .../recipes-utils/udevil/udevil_0.4.4.bb           | 28 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
 create mode 100644 meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb

diff --git a/meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch b/meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
new file mode 100644
index 000000000000..355e93a37b3b
--- /dev/null
+++ b/meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
@@ -0,0 +1,12 @@
+Fix compilation with GCC6
+
+--- a/src/device-info.c	2013-12-09 14:59:27.000000000 +0100
++++ b/src/device-info.c	2017-03-13 07:06:25.506666680 +0100
+@@ -3,6 +3,7 @@
+  * contains code excerpts from udisks v1.0.4
+ ************************************************************************** */
+ 
++#include <sys/stat.h>
+ #include "device-info.h"
+ 
+ static char *
diff --git a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
new file mode 100644
index 000000000000..4ad4a09ed717
--- /dev/null
+++ b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
@@ -0,0 +1,28 @@
+SUMMARY = "A command line Linux program which mounts and unmounts removable devices"
+HOMEPAGE = "http://ignorantguru.github.io/udevil/"
+
+DEPENDS = "glib-2.0 \
+           glib-2.0-native \
+           intltool-native \
+           udev \
+"
+RDEPENDS_${PN} = "glib-2.0 \
+                  udev \
+"
+
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+inherit autotools pkgconfig systemd
+
+SRC_URI = "https://github.com/IgnorantGuru/udevil/raw/pkg/${PV}/udevil-${PV}.tar.xz \
+           file://0001-udevil-0.4.3-fix-compile-with-gcc6.patch \
+"
+
+SRC_URI[md5sum] = "dc1c489b603a0500a04dc7e1805ac1d9"
+SRC_URI[sha256sum] = "ce8c51fd4d589cda7be56e75b42188deeb258c66fc911a9b3a70a3945c157739"
+
+SYSTEMD_SERVICE_${PN} = "devmon@.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+FILES_${PN} += " ${libdir}/systemd/system/devmon@.service"
-- 
2.11.0


