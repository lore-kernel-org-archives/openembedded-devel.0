Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id A0D6F77D2A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 21:00:33 +0000 (UTC)
Received: from localhost.localdomain (pub082136089155.dh-hfc.datazug.ch
	[82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A4A3122CA0;
	Thu, 13 Jul 2017 21:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4A3122CA0
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Martin Jansa <martin.jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 13 Jul 2017 22:59:55 +0200
Message-Id: <20170713205955.27296-1-krzk@kernel.org>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] recipes-utils: Add recipe for udevil
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
X-List-Received-Date: Thu, 13 Jul 2017 21:00:33 -0000

udevil is a command line Linux program which mounts and unmounts
removable devices without a password.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Fix indentation and build error (new patch added for Makefile).
2. Properly handle systemd dependency.
3. Remove glib-2.0 from rdepends.
---
 .../0001-udevil-0.4.3-fix-compile-with-gcc6.patch  | 12 ++++++++
 ...e.am-Use-systemd_unitdir-instead-of-libdi.patch | 32 ++++++++++++++++++++++
 .../recipes-utils/udevil/udevil_0.4.4.bb           | 28 +++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
 create mode 100644 meta-filesystems/recipes-utils/udevil/files/0002-etc-Makefile.am-Use-systemd_unitdir-instead-of-libdi.patch
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
diff --git a/meta-filesystems/recipes-utils/udevil/files/0002-etc-Makefile.am-Use-systemd_unitdir-instead-of-libdi.patch b/meta-filesystems/recipes-utils/udevil/files/0002-etc-Makefile.am-Use-systemd_unitdir-instead-of-libdi.patch
new file mode 100644
index 000000000000..f014a0f53786
--- /dev/null
+++ b/meta-filesystems/recipes-utils/udevil/files/0002-etc-Makefile.am-Use-systemd_unitdir-instead-of-libdi.patch
@@ -0,0 +1,32 @@
+From 80b087193698632e525b90d45b4a49e61e343e1c Mon Sep 17 00:00:00 2001
+From: Krzysztof Kozlowski <krzk@kernel.org>
+Date: Thu, 13 Jul 2017 21:30:35 +0200
+Subject: [PATCH] etc: Makefile.am: Use systemd_unitdir instead of libdir
+
+Proper directory for installing systemd services is systemd_unitdir, not
+libdir.
+
+Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
+---
+ etc/Makefile.am | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/etc/Makefile.am b/etc/Makefile.am
+index 9b6e7522c20f..6d663241a72f 100644
+--- a/etc/Makefile.am
++++ b/etc/Makefile.am
+@@ -16,8 +16,8 @@ if ADD_SYSTEMD
+ 	test -f $(DESTDIR)/$(sysconfdir)/conf.d/devmon || $(INSTALL_DATA) \
+ 				$(srcdir)/systemd/devmon \
+ 				$(DESTDIR)/$(sysconfdir)/conf.d/devmon
+-	test -d $(DESTDIR)/$(libdir)/systemd/system || \
+-				mkdir -p -- $(DESTDIR)/$(libdir)/systemd/system
++	test -d $(DESTDIR)/$(systemd_unitdir)/system || \
++				mkdir -p -- $(DESTDIR)/$(systemd_unitdir)/system
+ 	$(INSTALL_DATA) $(srcdir)/systemd/devmon@.service \
+-				$(DESTDIR)/$(libdir)/systemd/system/devmon@.service
++				$(DESTDIR)/$(systemd_unitdir)/system/devmon@.service
+ endif
+-- 
+2.11.0
+
diff --git a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
new file mode 100644
index 000000000000..c432e8546805
--- /dev/null
+++ b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
@@ -0,0 +1,28 @@
+SUMMARY = "A command line Linux program which mounts and unmounts removable devices"
+HOMEPAGE = "http://ignorantguru.github.io/udevil/"
+
+DEPENDS = "glib-2.0 \
+    glib-2.0-native \
+    intltool-native \
+    udev \
+"
+RDEPENDS_${PN} = "udev"
+
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+inherit autotools systemd
+
+SRC_URI = "https://github.com/IgnorantGuru/udevil/raw/pkg/${PV}/udevil-${PV}.tar.xz \
+    file://0001-udevil-0.4.3-fix-compile-with-gcc6.patch \
+    file://0002-etc-Makefile.am-Use-systemd_unitdir-instead-of-libdi.patch \
+"
+
+SRC_URI[md5sum] = "dc1c489b603a0500a04dc7e1805ac1d9"
+SRC_URI[sha256sum] = "ce8c51fd4d589cda7be56e75b42188deeb258c66fc911a9b3a70a3945c157739"
+
+PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+
+SYSTEMD_SERVICE_${PN} = "devmon@.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.11.0


