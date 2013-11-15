Return-Path: <philip.balister@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9FAF96D582
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 00:14:18 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id s19so1699152qcw.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2013 16:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=3+p0mV0A8NcCMcLHAUqUhJhhjuxOxxQiU2i3KAAOSdk=;
	b=LRTxjQIHeB0BbiZZcH8gf4S1qq2TroAUPny2FFe8p48BjakcBgrzqVRx2g4RXyr1QY
	b2yhiODS1Twwvf2egXjiFfKR6B5zv76scoktUDgW4wbYamqgb1LMyQ1fw0JN+lQimKvu
	81CZJfWFIMPxasc8H+jqNckjRlVDxzFX33bBaRxz3byxe8Jd/Q2Uz+IujKPUyahBP16+
	ASlyxfamPD3hX3wx3KSBUZEZQbSOVJs36/F+IEwc2fn+a+KDjs4ir9zB5X90H9aHIyjc
	3v/urd3o/syx7SZDCvhG9pydq3dvWGJC4yQr8uU04OnT7N5tM3FAW8G/hdCw75v9yAvQ
	501A==
X-Received: by 10.224.131.133 with SMTP id x5mr6489465qas.70.1384474459812;
	Thu, 14 Nov 2013 16:14:19 -0800 (PST)
Received: from localhost.localdomain
	(pool-108-44-82-190.ronkva.east.verizon.net. [108.44.82.190])
	by mx.google.com with ESMTPSA id a9sm834102qed.6.2013.11.14.16.14.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Nov 2013 16:14:19 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2013 19:14:11 -0500
Message-Id: <1384474452-14955-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-oe][PATCH 1/2] uhd : Remove from meta-oe. Now lives in meta-sdr.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Nov 2013 00:14:19 -0000

https://github.com/balister/meta-sdr

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../uhd/uhd-firmware_003.005.003.bb                | 27 ---------------
 meta-oe/recipes-connectivity/uhd/uhd.inc           | 35 -------------------
 ...01-HACK-work-around-Wl-as-needed-problems.patch | 40 ----------------------
 .../0001-use-uint8_t-from-boost-namespace.patch    | 29 ----------------
 meta-oe/recipes-connectivity/uhd/uhd_git.bb        | 11 ------
 5 files changed, 142 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.003.bb
 delete mode 100644 meta-oe/recipes-connectivity/uhd/uhd.inc
 delete mode 100644 meta-oe/recipes-connectivity/uhd/uhd/0001-HACK-work-around-Wl-as-needed-problems.patch
 delete mode 100644 meta-oe/recipes-connectivity/uhd/uhd/0001-use-uint8_t-from-boost-namespace.patch
 delete mode 100644 meta-oe/recipes-connectivity/uhd/uhd_git.bb

diff --git a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.003.bb b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.003.bb
deleted file mode 100644
index 4369907..0000000
--- a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.003.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Universal Hardware Driver Firmware"
-HOMEPAGE = "http://www.ettus.com"
-
-PE = "1"
-
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://share/uhd/images/usrp_e100_fpga_v2.bin;md5=e86f2186823b264efc627aafc0ad60a2"
-
-inherit allarch
-
-SRC_URI = "http://files.ettus.com/binaries/uhd_stable/releases/uhd_${PV}-release/uhd-images_${PV}-release.tar.gz"
-SRC_URI[md5sum] = "65cf76fd363d576ceff9c1527ade297b"
-SRC_URI[sha256sum] = "9079586def30b6805053092673d942c0051f1f99eebc676b871f070c04b66e35"
-
-S = "${WORKDIR}/uhd-images_${PV}-release"
-
-do_install() {
-    install -d ${D}${datadir}/uhd/images
-    install -d ${D}${datadir}/uhd/images/bit
-    install -m 0644 ${S}/share/uhd/images/bit/* ${D}${datadir}/uhd/images/bit
-    rm -rf ${S}/share/uhd/images/bit
-    install -m 0644 ${S}/share/uhd/images/* ${D}${datadir}/uhd/images
-}
-
-PACKAGES = "${PN}"
-FILES_${PN} = "${datadir}/uhd/images"
-
diff --git a/meta-oe/recipes-connectivity/uhd/uhd.inc b/meta-oe/recipes-connectivity/uhd/uhd.inc
deleted file mode 100644
index da1fbd8..0000000
--- a/meta-oe/recipes-connectivity/uhd/uhd.inc
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Universal Hardware Driver for Ettus Research products."
-HOMEPAGE = "http://www.ettus.com"
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=51b35d652c070d136bf20244494be2d3"
-
-DEPENDS = "git-native python-cheetah-native boost libusb1 uhd-firmware orc-native ncurses"
-RDEPENDS_${PN} += "uhd-firmware"
-
-PE = "1"
-INC_PR = "r3"
-
-inherit cmake pythonnative
-
-PACKAGES =+ "${PN}-tests ${PN}-examples ${PN}-e1xx"
-
-INSANE_SKIP_${PN} = "dev-so"
-
-FILES_${PN} += "${libdir}/libuhd.so \
-                ${datadir}/uhd/utils/*"
-FILES_${PN}-tests += "${datadir}/uhd/tests/*"
-FILES_${PN}-dbg += "${datadir}/uhd/examples/.debug/* \
-                    ${datadir}/uhd/utils/.debug/* \
-                    ${datadir}/uhd/tests/.debug/* \
-                    ${datadir}/uhd/usrp_e_utils/.debug/*"
-FILES_${PN}-examples = "${datadir}/uhd/examples/*"
-
-OECMAKE_BUILDPATH = "${S}/build"
-OECMAKE_SOURCEPATH = "${S}"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[orc] = "-DENABLE_ORC=ON,-DENABLE_ORC=OFF,orc"
-
-EXTRA_OECMAKE = "-DENABLE_E100=TRUE"
-
-EXTRA_OEMAKE = "-C ${OECMAKE_BUILDPATH}"
diff --git a/meta-oe/recipes-connectivity/uhd/uhd/0001-HACK-work-around-Wl-as-needed-problems.patch b/meta-oe/recipes-connectivity/uhd/uhd/0001-HACK-work-around-Wl-as-needed-problems.patch
deleted file mode 100644
index eb05cc0..0000000
--- a/meta-oe/recipes-connectivity/uhd/uhd/0001-HACK-work-around-Wl-as-needed-problems.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 77be3026cbfe77b3ee1aaa549a27f5ad50320f9d Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Fri, 17 Jun 2011 19:44:04 +0200
-Subject: [PATCH] HACK: work around -Wl,as-needed problems
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- host/lib/types/CMakeLists.txt    |    2 +-
- host/usrp_e_utils/CMakeLists.txt |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/host/lib/types/CMakeLists.txt b/host/lib/types/CMakeLists.txt
-index 957dfd3..3147747 100644
---- a/host/lib/types/CMakeLists.txt
-+++ b/host/lib/types/CMakeLists.txt
-@@ -59,7 +59,7 @@ CHECK_CXX_SOURCE_COMPILES("
- IF(HAVE_CLOCK_GETTIME)
-     MESSAGE(STATUS "  High resolution timing supported through clock_gettime.")
-     SET(TIME_SPEC_DEFS HAVE_CLOCK_GETTIME)
--    LIBUHD_APPEND_LIBS("-lrt")
-+    LIBUHD_APPEND_LIBS("-lrt -lpthread -lncurses")
- ELSEIF(HAVE_MACH_ABSOLUTE_TIME)
-     MESSAGE(STATUS "  High resolution timing supported through mach_absolute_time.")
-     SET(TIME_SPEC_DEFS HAVE_MACH_ABSOLUTE_TIME)
-diff --git a/host/usrp_e_utils/CMakeLists.txt b/host/usrp_e_utils/CMakeLists.txt
-index 9162a20..18414ad 100644
---- a/host/usrp_e_utils/CMakeLists.txt
-+++ b/host/usrp_e_utils/CMakeLists.txt
-@@ -38,7 +38,7 @@ IF(ENABLE_USRP_E_UTILS)
-     FOREACH(util_source ${usrp_e_utils_sources})
-         GET_FILENAME_COMPONENT(util_name ${util_source} NAME_WE)
-         ADD_EXECUTABLE(${util_name} ${util_source})
--        TARGET_LINK_LIBRARIES(${util_name} ${Boost_LIBRARIES})
-+        TARGET_LINK_LIBRARIES(${util_name} ${Boost_LIBRARIES} -lpthread -lncurses)
-         INSTALL(TARGETS ${util_name} RUNTIME DESTINATION ${PKG_DATA_DIR}/usrp_e_utils)
-     ENDFOREACH(util_source)
- 
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-connectivity/uhd/uhd/0001-use-uint8_t-from-boost-namespace.patch b/meta-oe/recipes-connectivity/uhd/uhd/0001-use-uint8_t-from-boost-namespace.patch
deleted file mode 100644
index 8978ddc..0000000
--- a/meta-oe/recipes-connectivity/uhd/uhd/0001-use-uint8_t-from-boost-namespace.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 317f6f08cedf005ce1f2d6f0d04cfb2659863423 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 30 Jun 2013 22:10:50 -0700
-Subject: [PATCH] use uint8_t from boost namespace
-
-Fixes errors like
-codec_ctrl.cpp:113:10: error: 'uint8_t' was not declared in this scope
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- host/lib/usrp/e100/codec_ctrl.cpp |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/host/lib/usrp/e100/codec_ctrl.cpp b/host/lib/usrp/e100/codec_ctrl.cpp
-index 13b3bc9..2c13176 100644
---- a/host/lib/usrp/e100/codec_ctrl.cpp
-+++ b/host/lib/usrp/e100/codec_ctrl.cpp
-@@ -110,7 +110,7 @@ e100_codec_ctrl_impl::e100_codec_ctrl_impl(spi_iface::sptr iface){
-     //_ad9862_regs.dis2 = ad9862_regs_t::DIS2_DIS; needed for transmit
- 
-     //write the register settings to the codec
--    for (uint8_t addr = 0; addr <= 25; addr++){
-+    for (boost::uint8_t addr = 0; addr <= 25; addr++){
-         this->send_reg(addr);
-     }
- 
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-connectivity/uhd/uhd_git.bb b/meta-oe/recipes-connectivity/uhd/uhd_git.bb
deleted file mode 100644
index ee02cc7..0000000
--- a/meta-oe/recipes-connectivity/uhd/uhd_git.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require uhd.inc
-
-PV = "3.5.3"
-PR = "${INC_PR}.0"
-
-SRC_URI = "git://ettus.sourcerepo.com/ettus/uhd.git;branch=maint \
-           file://0001-use-uint8_t-from-boost-namespace.patch;striplevel=2 \
-          "
-S = "${WORKDIR}/git/host"
-
-SRCREV = "f4c58120dc1e3674ee0228213f0f0011a0f80dcf"
-- 
1.8.3.1


