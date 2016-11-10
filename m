Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38AB360797
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2016 10:15:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAAAFrQ8020906
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2016 02:15:53 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 10 Nov 2016 02:15:52 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Nov 2016 18:14:56 +0800
Message-ID: <20161110101456.21092-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] openobex: upgrade to 1.7.2
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
X-List-Received-Date: Thu, 10 Nov 2016 10:15:53 -0000
Content-Type: text/plain

Add a patch to resolve segment fault in obex-check-device.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../obex/openobex-1.5/disable-cable-test.patch     | 16 ----------
 .../openobex-1.5/libusb_crosscompile_check.patch   | 11 -------
 .../obex/openobex-1.5/separate_builddir.patch      | 16 ----------
 ...001-obex-check-device-avoid-segment-fault.patch | 29 ++++++++++++++++++
 meta-oe/recipes-connectivity/obex/openobex_1.5.bb  | 35 ----------------------
 .../recipes-connectivity/obex/openobex_1.7.2.bb    | 33 ++++++++++++++++++++
 6 files changed, 62 insertions(+), 78 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch
 delete mode 100644 meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_check.patch
 delete mode 100644 meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.patch
 create mode 100644 meta-oe/recipes-connectivity/obex/openobex/0001-obex-check-device-avoid-segment-fault.patch
 delete mode 100644 meta-oe/recipes-connectivity/obex/openobex_1.5.bb
 create mode 100644 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb

diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch b/meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch
deleted file mode 100644
index 95b636d..0000000
--- a/meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- openobex-1.2/apps/Makefile.am~disable-cable-test
-+++ openobex-1.2/apps/Makefile.am
-@@ -6,7 +6,7 @@
- 	obex_io.c obex_io.h \
- 	obex_put_common.c obex_put_common.h
- 
--bin_PROGRAMS = irxfer obex_tcp irobex_palm3 obex_test
-+bin_PROGRAMS = irxfer obex_tcp irobex_palm3
- 
- obex_test_SOURCES = \
- 	obex_test.c obex_test.h \
diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_check.patch b/meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_check.patch
deleted file mode 100644
index 1177dfe..0000000
--- a/meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_check.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- /tmp/acinclude.m4	2009-04-12 10:32:15.000000000 +0200
-+++ openobex-1.5/acinclude.m4	2009-04-12 10:32:38.000000000 +0200
-@@ -158,7 +158,7 @@
- 		;;
- 	*)
- 		PKG_CHECK_MODULES(USB, libusb, usb_lib_found=yes, AC_MSG_RESULT(no))
--		AC_CHECK_FILE(${prefix}/lib/pkgconfig/libusb.pc, REQUIRES="libusb")
-+		REQUIRES="libusb"
- 		;;
- 	esac
- 	AC_SUBST(USB_CFLAGS)
diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.patch b/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.patch
deleted file mode 100644
index 8abf8ae..0000000
--- a/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Fix detection of IrDA failing with B!=S
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
---- a/acinclude.m4	2014-05-24 14:05:41.757796816 +0100
-+++ b/acinclude.m4	2014-05-24 14:03:06.556795536 +0100
-@@ -54,6 +54,7 @@
- ])
- 
- AC_DEFUN([AC_PATH_IRDA_LINUX], [
-+	CPPFLAGS="${CPPFLAGS} -I${srcdir}"
- 	AC_CACHE_CHECK([for IrDA support], irda_found, [
- 		AC_TRY_COMPILE([
- 				#include <sys/socket.h>
diff --git a/meta-oe/recipes-connectivity/obex/openobex/0001-obex-check-device-avoid-segment-fault.patch b/meta-oe/recipes-connectivity/obex/openobex/0001-obex-check-device-avoid-segment-fault.patch
new file mode 100644
index 0000000..d7c2681
--- /dev/null
+++ b/meta-oe/recipes-connectivity/obex/openobex/0001-obex-check-device-avoid-segment-fault.patch
@@ -0,0 +1,29 @@
+Subject: obex-check-device: avoid segment fault
+
+The argument number needs to be no less than 3 instead of 2. Otherwise,
+when we use `obex-check-device xxx' on target, there would be segment
+fault error.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ udev/obex-check-device.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/udev/obex-check-device.c b/udev/obex-check-device.c
+index 9eb4769..df9fc73 100644
+--- a/udev/obex-check-device.c
++++ b/udev/obex-check-device.c
+@@ -62,7 +62,7 @@ int main (int argc, char **argv)
+ 	unsigned long vendor;
+ 	unsigned long product;
+ 
+-	if (argc < 2)
++	if (argc < 3)
+ 		return 0;
+ 
+ 	vendor = strtoul(argv[1], NULL, 16);
+-- 
+2.8.3
+
diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
deleted file mode 100644
index 6ac7905..0000000
--- a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "The Openobex project is an open source implementation of the \
-Object Exchange (OBEX) protocol."
-HOMEPAGE = "http://openobex.triq.net"
-SECTION = "libs"
-DEPENDS = "virtual/libusb0"
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
-
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-"
-
-SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/openobex-${PV}.tar.gz \
-           file://disable-cable-test.patch \
-           file://libusb_crosscompile_check.patch \
-           file://separate_builddir.patch"
-
-SRC_URI[md5sum] = "0d83dc86445a46a1b9750107ba7ab65c"
-SRC_URI[sha256sum] = "e602047570799a47ecb028420bda8f2cef41310e5a99d084de10aa9422935e65"
-
-inherit autotools binconfig pkgconfig
-
-EXTRA_OECONF = "--enable-apps --enable-syslog"
-
-do_install_append() {
-    install -d ${D}${datadir}/aclocal
-    install -m 0644 ${S}/openobex.m4 ${D}${datadir}/aclocal
-}
-
-PACKAGES += "openobex-apps"
-FILES_${PN} = "${libdir}/lib*.so.*"
-FILES_${PN}-dev += "${bindir}/openobex-config"
-FILES_${PN}-apps = "${bindir}/*"
-DEBIAN_NOAUTONAME_${PN}-apps = "1"
-
diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
new file mode 100644
index 0000000..5828838
--- /dev/null
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "The Openobex project is an open source implementation of the \
+Object Exchange (OBEX) protocol."
+HOMEPAGE = "http://openobex.triq.net"
+SECTION = "libs"
+DEPENDS = "virtual/libusb0"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
+
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
+                    file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+"
+
+SRC_URI = "http://downloads.sourceforge.net/openobex/openobex-${PV}-Source.tar.gz \
+           file://0001-obex-check-device-avoid-segment-fault.patch"
+
+SRC_URI[md5sum] = "f6e0b6cb7dcfd731460a7e9a91429a3a"
+SRC_URI[sha256sum] = "158860aaea52f0fce0c8e4b64550daaae06df2689e05834697b7e8c7d73dd4fc"
+
+inherit cmake
+
+S = "${WORKDIR}/openobex-${PV}-Source"
+
+EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Release"
+
+do_install_append () {
+    if [ "`ls -A ${D}${bindir}`" = "" ]; then
+	rm -rf ${D}${bindir}
+    fi
+}
+
+FILES_${PN}-dev += "${libdir}/cmake"
+
+
-- 
2.8.3


