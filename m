Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id A18BB60111
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 21:49:41 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 0D1EE5C0B0A;
	Tue, 10 Sep 2019 23:49:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1568152182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:in-reply-to:
	references; bh=rneNDlTfSdq1uz7FM1CsJvbY58AfDxdDhOtcPb1eMp8=;
	b=N1tVo1i+78i5B6++7ZZGu3hkzv6qxVOrGIxPKfSFJeSXlAdl46ouLPe3Mcm/XGFRS3jPmJ
	u2YN9wiJELh3cW89WvDAUVqox6o2r0GNhxJH/p90jszqEDORksQGLS3pU8JfGVEkHhS1zW
	Ct9QKbOQoWEjIp1O2x+0A2A+KA8SG7U=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Sep 2019 23:49:19 +0200
Message-Id: <20190910214919.9171-1-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-filesystems][PATCH] fuse3: add libfuse3 recipe
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
X-List-Received-Date: Tue, 10 Sep 2019 21:49:42 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

Add recipe for libfuse version 3 series. Follow the scheme other
distributions use and create a new recipe with 3 in its name.
To avoid conflict with the fuse (2) recipe this recipe does not
provide init scripts/configuration files which automatically load
the fuse kernel driver.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../recipes-support/fuse/fuse3_3.6.2.bb       | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta-filesystems/recipes-support/fuse/fuse3_3.6.2.bb

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.6.2.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.6.2.bb
new file mode 100644
index 000000000..e65eb08e2
--- /dev/null
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.6.2.bb
@@ -0,0 +1,48 @@
+SUMMARY = "Implementation of a fully functional filesystem in a userspace program"
+DESCRIPTION = "FUSE (Filesystem in Userspace) is a simple interface for userspace \
+               programs to export a virtual filesystem to the Linux kernel. FUSE \
+               also aims to provide a secure method for non privileged users to \
+               create and mount their own filesystem implementations. \
+              "
+HOMEPAGE = "https://github.com/libfuse/libfuse"
+SECTION = "libs"
+LICENSE = "GPLv2 & LGPLv2"
+LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://LGPL2.txt;md5=4fbd65380cdd255951079008b364516c \
+                    file://LICENSE;md5=a55c12a2d7d742ecb41ca9ae0a6ddc66"
+
+SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
+"
+SRC_URI[md5sum] = "1798945aa69434286723b9999a141c7a"
+SRC_URI[sha256sum] = "f45869427575e1e59ab743a67deb57addbf2cb8f9ce431199dbd40ddab71f281"
+
+S = "${WORKDIR}/fuse-${PV}"
+
+UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
+UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>3(\.\d+)+).tar.xz"
+
+inherit meson pkgconfig
+
+DEPENDS = "udev"
+
+PACKAGES =+ "fuse3-utils"
+
+RPROVIDES_${PN}-dbg += "fuse3-utils-dbg"
+
+RRECOMMENDS_${PN}_class-target = "kernel-module-fuse fuse3-utils"
+
+FILES_${PN} += "${libdir}/libfuse3.so.*"
+FILES_${PN}-dev += "${libdir}/libfuse3*.la"
+
+EXTRA_OEMESON += " \
+     -Dexamples=false \
+"
+
+# Forbid auto-renaming to libfuse3-utils
+FILES_fuse3-utils = "${bindir} ${base_sbindir}"
+DEBIAN_NOAUTONAME_fuse3-utils = "1"
+DEBIAN_NOAUTONAME_${PN}-dbg = "1"
+
+do_install_append() {
+    rm -rf ${D}${base_prefix}/dev
+}
-- 
2.20.1


