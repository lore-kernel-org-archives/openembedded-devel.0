Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id BAC45754C4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 12:06:12 +0000 (UTC)
Received: from mnhu.deif.com (unknown [87.54.42.112])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 45BB41C0960;
	Thu, 12 Jul 2018 14:06:13 +0200 (CEST)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jul 2018 14:05:50 +0200
Message-Id: <471e7a0975e7869080f37ffc4cbc51de58fb74fa.1531397025.git-series.martin@geanix.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] ell: update to 0.6
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
X-List-Received-Date: Thu, 12 Jul 2018 12:06:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove upstreamed patch to fix musl build, and replace with another
(submitted) patch to fix a new musl issue.

Signed-off-by: Martin Hundebøll <martin@geanix.com>

---

Changes in v2:
- Added patch to fix musl build
---
 meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch | 39 +++++++++++++++++++++++++++++++++++++++
 meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patch                         | 39 ---------------------------------------
 meta-oe/recipes-core/ell/ell_0.4.bb                                                          | 19 -------------------
 meta-oe/recipes-core/ell/ell_0.6.bb                                                          | 20 ++++++++++++++++++++
 4 files changed, 59 insertions(+), 58 deletions(-)
 create mode 100644 meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch
 delete mode 100644 meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patch
 delete mode 100644 meta-oe/recipes-core/ell/ell_0.4.bb
 create mode 100644 meta-oe/recipes-core/ell/ell_0.6.bb

diff --git a/meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch b/meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch
new file mode 100644
index 0000000..df3c055
--- /dev/null
+++ b/meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch
@@ -0,0 +1,39 @@
+From d8236d1d789f496a193dae5d2a15d706b81f6482 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
+Date: Thu, 12 Jul 2018 10:19:50 +0200
+Subject: [PATCH] dhcp: include if_arp.h from libc instead of linux headers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+To: ell@lists.01.org
+
+Compilation with musl libc fails due to redefinition of 'struct
+arp{req,req_old,hdr}' in linux/if_arp.h, since it is already defined and
+included in net/if_arp.h (through net/ethernet.h -> net/if_ether.h).
+
+The only symbols used from if_arp.h is ARPHRD_ETHER, so it should be
+safe to avoid the compile error by including the if_arp.h header from
+the c-library instead.
+
+Upstream-Status: Submitted [https://lists.01.org/pipermail/ell/2018-July/001242.html]
+Signed-off-by: Martin Hundebøll <martin@geanix.com>
+---
+ ell/dhcp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ell/dhcp.c b/ell/dhcp.c
+index 6c90370..0d99f74 100644
+--- a/ell/dhcp.c
++++ b/ell/dhcp.c
+@@ -27,7 +27,7 @@
+ #include <netinet/ip.h>
+ #include <net/ethernet.h>
+ #include <linux/types.h>
+-#include <linux/if_arp.h>
++#include <net/if_arp.h>
+ #include <errno.h>
+ #include <time.h>
+ 
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patch b/meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patch
deleted file mode 100644
index a172a93..0000000
--- a/meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 4f8c68757b05d12392cd1a8aed174cb8e56f80e3 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Thu, 5 Apr 2018 17:19:44 +0300
-Subject: [PATCH] ell: fix build with musl libc
-
-musl libc doesn't implement TEMP_FAILURE_RETRY. Use the
-TEMP_FAILURE_RETRY from glibc to fix build.
-
-Upstream-Status: Submitted [https://lists.01.org/pipermail/ell/2018-April/001209.html]
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- ell/dbus.h | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/ell/dbus.h b/ell/dbus.h
-index a7c08d2..3ff5e0f 100644
---- a/ell/dbus.h
-+++ b/ell/dbus.h
-@@ -28,6 +28,16 @@
- #include <stddef.h>
- #include <stdarg.h>
- 
-+/* taken from glibc unistd.h for musl support */
-+#ifndef TEMP_FAILURE_RETRY
-+#define TEMP_FAILURE_RETRY(expression)             \
-+  (__extension__                                   \
-+    ({ long int __result;                          \
-+       do __result = (long int) (expression);      \
-+       while (__result == -1L && errno == EINTR);  \
-+       __result; }))
-+#endif
-+
- #ifdef __cplusplus
- extern "C" {
- #endif
--- 
-2.4.0
-
diff --git a/meta-oe/recipes-core/ell/ell_0.4.bb b/meta-oe/recipes-core/ell/ell_0.4.bb
deleted file mode 100644
index 1524bd6..0000000
--- a/meta-oe/recipes-core/ell/ell_0.4.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY  = "Embedded Linux Library"
-DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
-LICENSE  = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
-SECTION = "libs"
-
-inherit autotools pkgconfig
-
-S = "${WORKDIR}/git"
-SRCREV = "b4aea06fabb2af1af01f861f8f394c75950b6d47"
-SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git \
-           file://0001-ell-fix-build-with-musl-libc.patch \
-          "
-
-do_configure_prepend () {
-    mkdir ${S}/build-aux
-}
-
-DEPENDS = "dbus"
diff --git a/meta-oe/recipes-core/ell/ell_0.6.bb b/meta-oe/recipes-core/ell/ell_0.6.bb
new file mode 100644
index 0000000..399eddb
--- /dev/null
+++ b/meta-oe/recipes-core/ell/ell_0.6.bb
@@ -0,0 +1,20 @@
+SUMMARY  = "Embedded Linux Library"
+DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
+LICENSE  = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
+SECTION = "libs"
+
+inherit autotools pkgconfig
+
+S = "${WORKDIR}/git"
+SRCREV = "59ff3160fe55a841e662f8776f0520f2038235f4"
+SRC_URI = " \
+    git://git.kernel.org/pub/scm/libs/ell/ell.git \
+    file://0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch \
+"
+
+do_configure_prepend () {
+    mkdir ${S}/build-aux
+}
+
+DEPENDS = "dbus"

base-commit: b56fc26fefff498b10236ea6486a5d5624f726cc
-- 
git-series 0.9.1

