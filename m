Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id EF3E971AC5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:38 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 3so673581pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XU1ucnuOsP7I+5BC9d2vrVir9iXt7Mcp+82FIDLKWqA=;
	b=INAeviQ8AzrkyjjtswcayW3gQT9ImH6oblkQ+m5/VFjwYLgLz+uve+51kD0Mmg1+Jx
	Cqe72rffTMAtZtgQXpd9td44uYBA9QMIFeDt5xsi+87kQqR7Vb617xibK8hpQByw4j2o
	l2EFIpMzVoVTwdKAkNPpJt1pJDhFsruTlroQ3piaepU7eGWGAMbvZFu4n/BqLQ48BcS6
	7+cnmWcmNnlaQvsMFs0noByH/V9IOgvvsxR6OIdqjxm3lP06N/0ydkV4Vu2SNvEcfIeE
	p1yzpb6LawvMwljDYTKQsXZuEy//S0sEwplQzTN8NYT8VzOJcP+TcRRiMIoltJLc99SD
	+6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XU1ucnuOsP7I+5BC9d2vrVir9iXt7Mcp+82FIDLKWqA=;
	b=Smg6C/mYL5125oLsPPOXvspLttASvkg4NOEMx+L2xUWLU3SzSwwb6OvwMHvVTpJU6f
	3snG10M1StkU9u5g272cJdRO2lkf2iZBM/goG63IqOjFlpHaov76jsHekB0YfLPo9ozz
	tcWFf+byL8Q1HHqNu7E2BMOU1WWD5Hzr2+SV1Sp3+G/V6fx4/ykP8VMoj5R6j4U7MCkd
	KKoNX+c5qbJhs5shg7fjwCOV8NZuft51lU/WdiHlqHc7Y/C2MsQh/AODRyP2UQtMDNhN
	8xDMCB2Xt3ABPWBLJFu+PhwgrnqK3qI844LZn21kPZL/aOMXFry+/XVd7ew2gaRJqvmn
	/qSQ==
X-Gm-Message-State: AKaTC00l0ml7c43tYU65ttwolLhhO4iOo/kmowV2wY+FK94ls5me3xoddlGt6JgRPBxM0Q==
X-Received: by 10.99.143.1 with SMTP id n1mr3033470pgd.88.1479892960434;
	Wed, 23 Nov 2016 01:22:40 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:51 -0800
Message-Id: <20161123092209.23699-31-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 31/49] openobex,obexftp: Update recipes
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:39 -0000

Update obexftp to 0.24.2 and openobex to 1.7.2
These packages moved to CMake infra for builds
therefore make adjustments to cross compile it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../disable-cable-test.patch                       |  0
 .../libusb_crosscompile_check.patch                |  0
 .../separate_builddir.patch                        |  0
 meta-oe/recipes-connectivity/obex/openobex_1.5.bb  | 35 ----------------
 .../recipes-connectivity/obex/openobex_1.7.2.bb    | 37 +++++++++++++++++
 ...ists.txt-Explicitly-link-libbfb-and-libmu.patch | 47 ++++++++++++++++++++++
 .../recipes-connectivity/obexftp/obexftp_0.23.bb   | 16 --------
 .../recipes-connectivity/obexftp/obexftp_0.24.2.bb | 33 +++++++++++++++
 8 files changed, 117 insertions(+), 51 deletions(-)
 rename meta-oe/recipes-connectivity/obex/{openobex-1.5 => openobex}/disable-cable-test.patch (100%)
 rename meta-oe/recipes-connectivity/obex/{openobex-1.5 => openobex}/libusb_crosscompile_check.patch (100%)
 rename meta-oe/recipes-connectivity/obex/{openobex-1.5 => openobex}/separate_builddir.patch (100%)
 delete mode 100644 meta-oe/recipes-connectivity/obex/openobex_1.5.bb
 create mode 100644 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
 create mode 100644 meta-oe/recipes-connectivity/obexftp/obexftp/0001-apps-CMakeLists.txt-Explicitly-link-libbfb-and-libmu.patch
 delete mode 100644 meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb
 create mode 100644 meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb

diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch b/meta-oe/recipes-connectivity/obex/openobex/disable-cable-test.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch
rename to meta-oe/recipes-connectivity/obex/openobex/disable-cable-test.patch
diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_check.patch b/meta-oe/recipes-connectivity/obex/openobex/libusb_crosscompile_check.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_check.patch
rename to meta-oe/recipes-connectivity/obex/openobex/libusb_crosscompile_check.patch
diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.patch b/meta-oe/recipes-connectivity/obex/openobex/separate_builddir.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.patch
rename to meta-oe/recipes-connectivity/obex/openobex/separate_builddir.patch
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
index 0000000..053c80a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "The Openobex project is an open source implementation of the \
+Object Exchange (OBEX) protocol."
+HOMEPAGE = "http://openobex.triq.net"
+SECTION = "libs"
+DEPENDS = "virtual/libusb0"
+DEPENDS_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
+
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
+                    file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}-Source.tar.gz \
+"
+
+SRC_URI[md5sum] = "f6e0b6cb7dcfd731460a7e9a91429a3a"
+SRC_URI[sha256sum] = "158860aaea52f0fce0c8e4b64550daaae06df2689e05834697b7e8c7d73dd4fc"
+
+inherit cmake pkgconfig
+
+S = "${WORKDIR}/${BP}-Source"
+
+EXTRA_OECONF = " -DCMAKE_SKIP_RPATH=ON "
+
+#--enable-apps --enable-syslog
+
+do_install_append () {
+    rmdir ${D}${bindir}
+}
+
+PACKAGES =+ "openobex-apps"
+FILES_${PN}-apps = "${bindir}/*"
+FILES_${PN} += "${libdir}/lib*.so.*"
+FILES_${PN}-dev += "${bindir}/openobex-config ${libdir}/cmake"
+DEBIAN_NOAUTONAME_${PN}-apps = "1"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp/0001-apps-CMakeLists.txt-Explicitly-link-libbfb-and-libmu.patch b/meta-oe/recipes-connectivity/obexftp/obexftp/0001-apps-CMakeLists.txt-Explicitly-link-libbfb-and-libmu.patch
new file mode 100644
index 0000000..55e5567
--- /dev/null
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp/0001-apps-CMakeLists.txt-Explicitly-link-libbfb-and-libmu.patch
@@ -0,0 +1,47 @@
+From b8dc608dad7d9fc3a4c16acd0327d97b81c23b95 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Nov 2016 01:32:31 +0000
+Subject: [PATCH] apps/CMakeLists.txt: Explicitly link libbfb and libmulticobex
+
+Transitive linking is disabled now for multicobex and
+obexftp, This ends up with linking errors for apps, therefore
+they are required to be added to link line explicitly.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ apps/CMakeLists.txt | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/apps/CMakeLists.txt b/apps/CMakeLists.txt
+index b5c84e4..63af134 100644
+--- a/apps/CMakeLists.txt
++++ b/apps/CMakeLists.txt
+@@ -5,14 +5,23 @@ add_definitions( -DVERSION="${obexftp_VERSION}" )
+ add_definitions ( -DHAVE_USB )
+ 
+ add_executable ( obexftp_app obexftp.c )
+-target_link_libraries ( obexftp_app obexftp )
++target_link_libraries ( obexftp_app
++  PRIVATE multicobex
++  PRIVATE bfb
++  obexftp
++)
+ set_target_properties ( obexftp_app PROPERTIES
+   OUTPUT_NAME obexftp
+ )
+ 
+ 
+ add_executable ( obexftpd_app obexftpd.c )
+-target_link_libraries ( obexftpd_app obexftp openobex )
++target_link_libraries ( obexftpd_app
++  PRIVATE multicobex
++  PRIVATE bfb
++  obexftp
++  openobex
++)
+ set_target_properties ( obexftpd_app PROPERTIES
+   OUTPUT_NAME obexftpd
+ )
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb b/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb
deleted file mode 100644
index b6bdfb7..0000000
--- a/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "A tool for transfer files to/from any OBEX enabled device"
-LICENSE = "GPLv2 & LGPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-DEPENDS += "openobex"
-
-SRC_URI = "http://sourceforge.net/projects/openobex/files/obexftp/${PV}/obexftp-${PV}.tar.bz2 \
-           file://Remove_some_printf_in_obexftpd.patch "
-
-SRC_URI[md5sum] = "f20762061b68bc921e80be4aebc349eb"
-SRC_URI[sha256sum] = "44a74ff288d38c0f75354d6bc2efe7d6dec10112eaff2e7b10e292b0d2105b36"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF += "--disable-tcl --disable-perl --disable-python --disable-ruby"
-
diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
new file mode 100644
index 0000000..991cd48
--- /dev/null
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "A tool for transfer files to/from any OBEX enabled device"
+LICENSE = "GPLv2 & PD & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LGPL-2.1.txt;md5=4fbd65380cdd255951079008b364516c \
+                    file://GPL-2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://License.txt;md5=fcbddc3c1debed80dd80da2d3e5f0dc1 \
+                   "
+
+DEPENDS += "openobex obexftp-native"
+SRC_URI = "http://downloads.sourceforge.net/openobex/${BP}-Source.tar.gz \
+           file://0001-apps-CMakeLists.txt-Explicitly-link-libbfb-and-libmu.patch \
+"
+SRC_URI[md5sum] = "157a9d1b2ed220203f7084db906de73c"
+SRC_URI[sha256sum] = "d40fb48e0a0eea997b3e582774b29f793919a625d54b87182e31a3f3d1c989a3"
+
+inherit cmake pkgconfig
+
+S = "${WORKDIR}/${BP}-Source"
+
+EXTRA_OECMAKE += "-DCMAKE_SKIP_RPATH=ON \
+                  -DENABLE_PERL=NO -DENABLE_PYTHON=NO \
+                  -DENABLE_RUBY=NO -DENABLE_TCL=NO \
+"
+
+do_compile_class-native () {
+    oe_runmake crctable
+}
+
+do_install_class-native () {
+    install -D -m 0755 ${B}/bfb/crctable ${D}${bindir}/crctable
+}
+
+
+BBCLASSEXTEND = "native"
-- 
2.10.2


