Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDB9C00528
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 08:48:57 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.9667.1691052531696160233
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Aug 2023 01:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BF4yLTlj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13A6E1BF207;
	Thu,  3 Aug 2023 08:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691052529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+oJCn7Z58UaCElKAKgcC8KLrYz8gel6pj1Bkf55ycd8=;
	b=BF4yLTljy/owwRaJ8fBDfsOjlu5xutRB3RhMFAEOufLPYWfJCrqaHFnkpCpGanbDAgCNr2
	wUmBP25P1LE8+ZvO/XQ3A5MKQGBD7AHueR3VgULEcAHHQTOjNjcomRyO++J6Jbc40Yl4Ik
	Z0CKV0yHDzCGrdwDtUf0tlhHoPPnWbbUc0jGLTD+EnwvFj/FIv/6x2HBBfYKSFIwwHn67E
	d1hos0kAO6eLL+ai5JhM6jUgxRDFTISzXWskBpjC0qq/0l/AadN0Lw7SVkhy6Wl6tX7oeb
	uHnsOwJ9WxYa+IV0s8KCm17x2DFGVncaYm71Py4CwmC/ni9kV/50mrT+P3djBg==
From: michael.opdenacker@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/7] [meta-oe] remove unused AUTHOR variable
Date: Thu,  3 Aug 2023 10:48:34 +0200
Message-Id: <20230803084839.3012610-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803084839.3012610-1-michael.opdenacker@bootlin.com>
References: <20230803084839.3012610-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 08:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104212

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

No longer used in generating packages
Also creates a possible confusion with the recipe maintainer
name.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb  | 1 -
 meta-oe/recipes-benchmark/iozone3/iozone3_506.bb                 | 1 -
 meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb                  | 1 -
 meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb                  | 1 -
 meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.5.bb                     | 1 -
 meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb                   | 1 -
 meta-oe/recipes-devtools/cloc/cloc_1.94.bb                       | 1 -
 meta-oe/recipes-devtools/guider/guider_3.9.8.bb                  | 1 -
 meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb                  | 1 -
 meta-oe/recipes-extended/haveged/haveged_1.9.18.bb               | 1 -
 meta-oe/recipes-extended/md5deep/md5deep_git.bb                  | 1 -
 meta-oe/recipes-extended/tmate/tmate_2.4.0.bb                    | 1 -
 meta-oe/recipes-graphics/fbida/fbida_git.bb                      | 1 -
 meta-oe/recipes-graphics/feh/feh_3.10.bb                         | 1 -
 meta-oe/recipes-graphics/lvgl/dialog-lvgl_git.bb                 | 1 -
 meta-oe/recipes-graphics/openbox/obconf_git.bb                   | 1 -
 meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb              | 1 -
 meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb   | 1 -
 meta-oe/recipes-graphics/tslib/tslib_1.22.bb                     | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb      | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb             | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb      | 1 -
 meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb      | 1 -
 .../recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb    | 1 -
 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb                 | 1 -
 meta-oe/recipes-graphics/yad/yad_6.0.bb                          | 1 -
 meta-oe/recipes-support/anthy/anthy_9100h.bb                     | 1 -
 meta-oe/recipes-support/asio/asio_1.28.0.bb                      | 1 -
 meta-oe/recipes-support/boost-sml/boost-sml_git.bb               | 1 -
 meta-oe/recipes-support/ceres-solver/ceres-solver_2.1.0.bb       | 1 -
 meta-oe/recipes-support/dfu-util/dfu-util_0.11.bb                | 1 -
 meta-oe/recipes-support/edid-decode/edid-decode_git.bb           | 1 -
 meta-oe/recipes-support/hidapi/hidapi_0.14.0.bb                  | 1 -
 meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb  | 1 -
 meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb               | 1 -
 meta-oe/recipes-support/libgpiod/libgpiod.inc                    | 1 -
 meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb           | 1 -
 meta-oe/recipes-support/librsync/librsync_2.3.4.bb               | 1 -
 meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb                  | 1 -
 meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb             | 1 -
 meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb           | 1 -
 meta-oe/recipes-support/serial-utils/pty-forward-native.bb       | 1 -
 meta-oe/recipes-support/serial-utils/serial-forward_git.bb       | 1 -
 meta-oe/recipes-support/spitools/spitools_git.bb                 | 1 -
 meta-oe/recipes-support/zchunk/zchunk_1.3.1.bb                   | 1 -
 meta-oe/recipes-test/bats/bats_1.10.0.bb                         | 1 -
 meta-oe/recipes-test/catch2/catch2_2.13.7.bb                     | 1 -
 meta-oe/recipes-test/evtest/evtest_1.35.bb                       | 1 -
 48 files changed, 48 deletions(-)

diff --git a/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb b/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb
index 90d688090..ac197a631 100644
--- a/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb
+++ b/meta-oe/dynamic-layers/gnome-layer/recipes-graphics/openbox/openbox-xdgmenu_0.3.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Openbox configuration tool"
-AUTHOR = "Siegfried Gevatter"
 HOMEPAGE = "https://launchpad.net/openbox-xdgmenu/"
 SECTION = "x11/wm"
 LICENSE = "GPL-3.0-or-later"
diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_506.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_506.bb
index 3b6df0b30..5a1306b6f 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_506.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_506.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Filesystem and Disk Benchmarking Tool"
 HOMEPAGE = "http://www.iozone.org/"
-AUTHOR = "Don Capps <don.capps2@verizon.net>, William D. Norcott <wnorcott@us.oracle.com>"
 SECTION = "console/tests"
 LICENSE = "iozone3"
 LIC_FILES_CHKSUM = "file://iozone.c;beginline=37;endline=48;md5=7331260091868dcad0f9edea735b5f4b \
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
index d181eb3b0..705e54f7c 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
@@ -8,7 +8,6 @@ other parameters."
 HOMEPAGE = "http://software.es.net/iperf/"
 SECTION = "console/network"
 BUGTRACKER = "https://github.com/esnet/iperf/issues"
-AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport@lbl.gov>"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dc6301c8256ceb8f71c9e3c2ae9096b9"
diff --git a/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb b/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb
index 972232347..b32f37153 100644
--- a/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb
+++ b/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb
@@ -1,7 +1,6 @@
 SUMMARY = "Measure socket and RDMA performance"
 DESCRIPTION = "qperf measures bandwidth and latency between two nodes."
 HOMEPAGE = "https://github.com/linux-rdma/qperf"
-AUTHOR = "Johann George"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.5.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.5.bb
index dd273e24d..492de65a8 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.5.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.5.bb
@@ -1,5 +1,4 @@
 SUMMARY = "NVMe management command line interface"
-AUTHOR = "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
 HOMEPAGE = "https://github.com/linux-nvme/nvme-cli"
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-only & CC0-1.0 & MIT"
diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
index 200f75166..8bf7981ab 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Ultralightweight JSON parser in ANSI C"
-AUTHOR = "Dave Gamble"
 HOMEPAGE = "https://github.com/DaveGamble/cJSON"
 SECTION = "libs"
 LICENSE = "MIT"
diff --git a/meta-oe/recipes-devtools/cloc/cloc_1.94.bb b/meta-oe/recipes-devtools/cloc/cloc_1.94.bb
index 2f92d8100..37a21cc3a 100644
--- a/meta-oe/recipes-devtools/cloc/cloc_1.94.bb
+++ b/meta-oe/recipes-devtools/cloc/cloc_1.94.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Count blank lines, comment lines, and physical lines of source code \
 in many programming languages."
-AUTHOR = "Al Danial"
 
 LICENSE="GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
index 30d17c84b..15d43e979 100644
--- a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
@@ -1,7 +1,6 @@
 SUMMARY = "performance analyzer"
 HOMEPAGE = "https://github.com/iipeace/guider"
 BUGTRACKER = "https://github.com/iipeace/guider/issues"
-AUTHOR = "Peace Lee <ipeace5@gmail.com>"
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
index a743e7252..6b6acf1be 100644
--- a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
+++ b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Terminal based 'The Matrix' screen implementation"
-AUTHOR = "Abishek V Ashok"
 
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.18.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.18.bb
index 069fdf7bc..97c354aba 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.18.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.18.bb
@@ -1,7 +1,6 @@
 SUMMARY = "haveged - A simple entropy daemon"
 DESCRIPTION = "The haveged project is an attempt to provide an easy-to-use, unpredictable random number generator based upon an adaptation of the HAVEGE algorithm. Haveged was created to remedy low-entropy conditions in the Linux random device that can occur under some workloads, especially on headless servers."
 
-AUTHOR = "Gary Wuertz"
 HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 
 LICENSE = "GPL-3.0-only"
diff --git a/meta-oe/recipes-extended/md5deep/md5deep_git.bb b/meta-oe/recipes-extended/md5deep/md5deep_git.bb
index 3cbe785a5..b1a38cf6f 100644
--- a/meta-oe/recipes-extended/md5deep/md5deep_git.bb
+++ b/meta-oe/recipes-extended/md5deep/md5deep_git.bb
@@ -1,6 +1,5 @@
 SUMMARY = "md5deep and hashdeep to compute and audit hashsets of amounts of files."
 DESCRIPTION = "md5deep is a set of programs to compute MD5, SHA-1, SHA-256, Tiger, or Whirlpool message digests on an arbitrary number of files. This package also includes hashdeep which is also able to audit hashsets."
-AUTHOR = "Jesse Kornblum, Simson L. Garfinkel"
 HOMEPAGE = "http://md5deep.sourceforge.net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9190f660105b9a56cdb272309bfd5491"
diff --git a/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb b/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
index 6dc5c0c7e..53030f277 100644
--- a/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
+++ b/meta-oe/recipes-extended/tmate/tmate_2.4.0.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Instant terminal sharing"
 DESCRIPTION = "Tmate is a fork of tmux. It provides an instant pairing solution."
-AUTHOR = "Marius Kriegerowski <marius.kriegerowski@gmail.com>"
 HOMEPAGE = "https://tmate.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f7d9aab84ec6567139a4755c48d147fb"
diff --git a/meta-oe/recipes-graphics/fbida/fbida_git.bb b/meta-oe/recipes-graphics/fbida/fbida_git.bb
index ebf88cd0e..65c9041a3 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_git.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
@@ -2,7 +2,6 @@ SUMMARY = "Framebuffer image and doc viewer tools"
 DESCRIPTION = "The fbida project contains a few applications for viewing and editing images, \
                with the main focus being photos."
 HOMEPAGE = "https://www.kraxel.org/blog/linux/fbida/"
-AUTHOR = "Gerd Hoffmann"
 SECTION = "utils"
 
 LICENSE = "GPL-2.0-only"
diff --git a/meta-oe/recipes-graphics/feh/feh_3.10.bb b/meta-oe/recipes-graphics/feh/feh_3.10.bb
index 0f0e61893..ec18f11aa 100644
--- a/meta-oe/recipes-graphics/feh/feh_3.10.bb
+++ b/meta-oe/recipes-graphics/feh/feh_3.10.bb
@@ -1,5 +1,4 @@
 SUMMARY = "X11 image viewer aimed mostly at console users"
-AUTHOR = "Tom Gilbert & Daniel Friesel"
 HOMEPAGE = "https://feh.finalrewind.org/"
 SECTION = "x11/utils"
 LICENSE = "MIT"
diff --git a/meta-oe/recipes-graphics/lvgl/dialog-lvgl_git.bb b/meta-oe/recipes-graphics/lvgl/dialog-lvgl_git.bb
index 9e820d0db..139aa479b 100644
--- a/meta-oe/recipes-graphics/lvgl/dialog-lvgl_git.bb
+++ b/meta-oe/recipes-graphics/lvgl/dialog-lvgl_git.bb
@@ -9,7 +9,6 @@ SRCREV = "cdf8d38acca87e871c3a488fd07f1e4779590f8e"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ce0a84e5276f01364119c873b712c4f"
-AUTHOR = "Philippe Coval <philippe.coval.ext@huawei.com>"
 
 DEPENDS += "lvgl"
 DEPENDS += "lv-drivers"
diff --git a/meta-oe/recipes-graphics/openbox/obconf_git.bb b/meta-oe/recipes-graphics/openbox/obconf_git.bb
index 053af5a77..efffd962d 100644
--- a/meta-oe/recipes-graphics/openbox/obconf_git.bb
+++ b/meta-oe/recipes-graphics/openbox/obconf_git.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Openbox configuration tool"
-AUTHOR = "Dana Jansens & Tim Riley & Javeed Shaikh"
 HOMEPAGE = "http://openbox.org/wiki/ObConf:About"
 SECTION = "x11/wm"
 LICENSE = "GPL-2.0-or-later"
diff --git a/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb b/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
index 225619ed6..039816e4a 100644
--- a/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
+++ b/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
@@ -1,5 +1,4 @@
 SUMMARY = "C library for encoding data in a QR Code symbol"
-AUTHOR = "Kentaro Fukuchi"
 HOMEPAGE = "http://fukuchi.org/works/qrencode/"
 SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
index 7eddf1da4..65cafab9e 100644
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
@@ -2,7 +2,6 @@ SUMMARY = "Terminus fonts packages (console and X11)"
 DESCRIPTION = "Terminus Font is a clean, fixed width bitmap font, designed for \
                long (8 and more hours per day) work with computers."
 HOMEPAGE = "http://terminus-font.sourceforge.net/"
-AUTHOR = "Dimitar Zhekov"
 SECTION = "fonts"
 
 LICENSE = "OFL-1.1"
diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.22.bb b/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
index cb2563225..01da03a47 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
@@ -5,7 +5,6 @@ Tslib is generally used on embedded devices to provide a common user \
 space interface to touchscreen functionality."
 HOMEPAGE = "http://tslib.org/"
 
-AUTHOR = "Martin Kepplinger <martink@posteo.de>"
 SECTION = "base"
 LICENSE = "LGPL-2.0-or-later & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "\
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index 945a5f3a8..5a403f077 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -3,7 +3,6 @@ require ttf.inc
 SUMMARY = "Sazanami Gothic/Mincho Japanese TrueType fonts"
 SUMMARY:ttf-sazanami-gothic = "Sazanami Gothic Japanese TrueType font"
 SUMMARY:ttf-sazanami-mincho = "Sazanami Mincho Japanese TrueType font"
-AUTHOR = "Electronic Font Open Laboratory (/efont/)"
 HOMEPAGE = "http://sourceforge.jp/projects/efont/"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://README;md5=97d739900be6e852830f55aa3c07d4a0"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb
index 3dad36840..461e3def7 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb
@@ -1,7 +1,6 @@
 require ttf.inc
 
 SUMMARY = "Thai Linux Working Group Fonts"
-AUTHOR = "Thai Linux Working Group"
 HOMEPAGE = "http://linux.thai.net/projects/fonts-tlwg"
 LICENSE = "GPL-2.0-only & TLWG"
 LIC_FILES_CHKSUM = "file://../fonts-tlwg-${PV}/COPYING;md5=3d20cd7eadf4afd5460c0adb32e387fd"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
index 6b79eb919..4cc5afd4a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
@@ -1,7 +1,6 @@
 require ttf.inc
 
 SUMMARY = "Japanese TrueType fonts from Vine Linux"
-AUTHOR = "Contributor: noonov <noonov@gmail.com>"
 HOMEPAGE = "http://vlgothic.dicey.org/"
 
 LICENSE = "ttf-mplus & BSD-3-Clause"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
index bc14febad..21897a758 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
@@ -1,7 +1,6 @@
 require ttf.inc
 
 SUMMARY = "WenQuanYi Zen Hei - A Hei-Ti Style Chinese font"
-AUTHOR = "Qianqian Fang and The WenQuanYi Project Contributors"
 HOMEPAGE = "http://wenq.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf540fc7d35b5777e36051280b3a911c"
diff --git a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
index f3602f194..e80aebc89 100644
--- a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
+++ b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.6.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Remove idle cursor image from screen."
 DESCRIPTION = "This is a rewrite of the popular tool unclutter, but using the x11-xfixes extension."
-AUTHOR = "Ingo Bürk"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b25d2c4cca175f44120d1b8e67cb358d"
diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
index 5f7c0beb6..92b3ac5f6 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
@@ -2,7 +2,6 @@ SUMMARY = "Exports your X session or FrameBuffer(fbdev) on-the-fly via VNC"
 HOMEPAGE = "http://www.karlrunge.com/x11vnc/"
 
 SECTION = "x11/utils"
-AUTHOR = "Karl Runge"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/x11vnc.h;endline=31;md5=e871a2ad004776794b616822dcab6314"
diff --git a/meta-oe/recipes-graphics/yad/yad_6.0.bb b/meta-oe/recipes-graphics/yad/yad_6.0.bb
index 40fccbdc1..9e46215fd 100644
--- a/meta-oe/recipes-graphics/yad/yad_6.0.bb
+++ b/meta-oe/recipes-graphics/yad/yad_6.0.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Yet Another Dialog"
 DESCRIPTION = "Program allowing you to display GTK+ dialog boxes from command line or shell scripts."
-AUTHOR = "Victor Ananjevsky"
 
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta-oe/recipes-support/anthy/anthy_9100h.bb b/meta-oe/recipes-support/anthy/anthy_9100h.bb
index 2a6cfb571..f2bf52cdb 100644
--- a/meta-oe/recipes-support/anthy/anthy_9100h.bb
+++ b/meta-oe/recipes-support/anthy/anthy_9100h.bb
@@ -1,5 +1,4 @@
 DESCRIPTION="Anthy is a system for Japanese input method. It converts Hiragana text to Kana Kanji mixed text."
-AUTHOR = "Anthy Developers <anthy-dev@lists.sourceforge.jp>"
 HOMEPAGE = "http://anthy.sourceforge.jp"
 
 LICENSE = "LGPL-2.1-only & GPL-2.0-only"
diff --git a/meta-oe/recipes-support/asio/asio_1.28.0.bb b/meta-oe/recipes-support/asio/asio_1.28.0.bb
index ae721263d..84074400a 100644
--- a/meta-oe/recipes-support/asio/asio_1.28.0.bb
+++ b/meta-oe/recipes-support/asio/asio_1.28.0.bb
@@ -2,7 +2,6 @@ SUMMARY = "Asio is C++ library for network and low-level I/O programming"
 DESCRIPTION = "Asio is a cross-platform C++ library for network and low-level \
         I/O programming that provides developers with a consistent asynchronous \
         model using a modern C++ approach."
-AUTHOR = "Christopher M. Kohlhoff (chris at kohlhoff dot com)"
 HOMEPAGE = "http://think-async.com/Asio"
 SECTION = "libs"
 LICENSE = "BSL-1.0"
diff --git a/meta-oe/recipes-support/boost-sml/boost-sml_git.bb b/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
index a06122a64..18dc8851a 100644
--- a/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
+++ b/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
@@ -1,6 +1,5 @@
 SUMMARY = "[Boost::ext].SML (State Machine Language)"
 DESCRIPTION = "Your scalable C++14 one header only State Machine Library with no dependencies"
-AUTHOR = "Krzysztof Jusiak"
 HOMEPAGE = "https://github.com/boost-ext/sml"
 BUGTRACKER = "https://github.com/boost-ext/sml/issues"
 SECTION = "libs"
diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.1.0.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.1.0.bb
index 2b74ad845..d3c6b421e 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.1.0.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.1.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Ceres Solver is an open source C++ library for modeling and solving large, complicated optimization problems."
-AUTHOR = "Sameer Agarwal and Keir Mierle and Others"
 HOMEPAGE = "http://ceres-solver.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb761279816b72be19d7ce646e4e2a14"
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.11.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.11.bb
index 7f80a3053..17547ca83 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.11.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.11.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "USB Device Firmware Upgrade utility"
-AUTHOR = "Harald Welte <laforge@openmoko.org>"
 HOMEPAGE = "http://dfu-util.sourceforge.net"
 SECTION = "devel"
 LICENSE = "GPL-2.0-only"
diff --git a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
index 91570b6f3..c1f512160 100644
--- a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
+++ b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Decode EDID data in human-readable format"
 DESCRIPTION = "edid-decode decodes EDID monitor description data in human-readable format."
-AUTHOR = "Hans Verkuil <hverkuil-cisco@xs4all.nl>"
 HOMEPAGE = "https://hverkuil.home.xs4all.nl/edid-decode/edid-decode.html"
 
 SECTION = "console/utils"
diff --git a/meta-oe/recipes-support/hidapi/hidapi_0.14.0.bb b/meta-oe/recipes-support/hidapi/hidapi_0.14.0.bb
index 91e5b55be..c7a487ba5 100644
--- a/meta-oe/recipes-support/hidapi/hidapi_0.14.0.bb
+++ b/meta-oe/recipes-support/hidapi/hidapi_0.14.0.bb
@@ -1,5 +1,4 @@
 SUMMARY = "A Simple library for communicating with USB and Bluetooth HID devices"
-AUTHOR = "Alan Ott"
 HOMEPAGE = "http://www.signal11.us/oss/hidapi/"
 SECTION = "libs"
 
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
index 281de522b..8a0ae17ad 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Command line tools and C library providing a simple interface to inotify"
-AUTHOR = "Rohan McGovern <rohan@mcgovern.id.au>"
 HOMEPAGE = "http://wiki.github.com/rvoicilas/inotify-tools"
 SECTION = "console/devel"
 LICENSE = "GPL-2.0-only"
diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
index 1cae76b42..28305c985 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms."
-AUTHOR = "Benoît Jacob and Gaël Guennebaud and others"
 HOMEPAGE = "http://eigen.tuxfamily.org/"
 LICENSE = "MPL-2.0 & Apache-2.0 & BSD-3-Clause & GPL-3.0-only & LGPL-2.1-only & MINPACK"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad \
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
index cb19bc5fb..0eda47bba 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -1,5 +1,4 @@
 SUMMARY = "C library and tools for interacting with the linux GPIO character device"
-AUTHOR = "Bartosz Golaszewski <brgl@bgdev.pl>"
 RECIPE_MAINTAINER = "Bartosz Golaszewski <brgl@bgdev.pl>"
 
 inherit autotools pkgconfig ptest
diff --git a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
index 06536ca70..4d4a5ff10 100644
--- a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
+++ b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
@@ -2,7 +2,6 @@
 
 SUMMARY = "Mimetic Library for multi-part parsing"
 DESCRIPTION = "Email library (MIME) written in C++ designed to be easy to use and integrate but yet fast and efficient."
-AUTHOR = "Stefano Barbato <stefano@codesink.org>"
 HOMEPAGE = "http://www.codesink.org/mimetic_mime_library.html"
 BUGTRACKER = "https://github.com/LadislavSopko/mimetic/issues"
 
diff --git a/meta-oe/recipes-support/librsync/librsync_2.3.4.bb b/meta-oe/recipes-support/librsync/librsync_2.3.4.bb
index cb30f4c31..3cad66538 100644
--- a/meta-oe/recipes-support/librsync/librsync_2.3.4.bb
+++ b/meta-oe/recipes-support/librsync/librsync_2.3.4.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Remote delta-compression library."
-AUTHOR = "Martin Pool, Andrew Tridgell, Donovan Baarda, Adam Schubert"
 
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
diff --git a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
index 240583911..b61fb026c 100644
--- a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
+++ b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
@@ -1,7 +1,6 @@
 SUMMARY = "Tool to display and modify PXA registers at runtime"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://pxaregs.c;endline=12;md5=668d061b7637acc68cb8071c9be372e6"
-AUTHOR = "Holger Schurig <hs4233@mail.mn-solutions.de>"
 HOMEPAGE = "http://www.mn-logistik.de/unsupported/pxa250/"
 
 SRC_URI = "file://pxaregs.c \
diff --git a/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb b/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
index 1aa492c31..28da51a21 100644
--- a/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
+++ b/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
@@ -3,7 +3,6 @@ DESCRIPTION = "read-edid is a set of two tools - get-edid, which gets the raw \
                EDID information from the monitor, and parse-edid, which turns \
 	       the raw binary information into a xorg.conf-compatible monitor \
 	       section."
-AUTHOR = "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
 HOMEPAGE = "http://www.polypux.org/projects/read-edid/"
 SECTION = "console/utils"
 LICENSE = "read-edid"
diff --git a/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb b/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
index 4c3436823..c038966ba 100644
--- a/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
+++ b/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Reboot the device to a specific mode."
-AUTHOR = "Daniele Debernardi <drebrez@gmail.com>"
 
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
diff --git a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
index 71588abd3..2fe61e6f5 100644
--- a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
+++ b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Receive a forwarded serial from serial-forward and provide a PTY"
-AUTHOR = "Holger 'Zecke' Freyther"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07"
 SECTION = "console/network"
diff --git a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
index fe5cfc0f4..84bb25e4c 100644
--- a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
+++ b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Forward a serial using TCP/IP"
-AUTHOR = "Holger 'Zecke' Freyther'"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07"
 SECTION = "console/devel"
diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index c190d7edf..1e3d6beaf 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "This package contains some simple command line tools to help using Linux spidev devices"
 HOMEPAGE = "https://github.com/cpb-/spi-tools"
-AUTHOR = "Christophe BLAESS"
 LICENSE="GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.3.1.bb b/meta-oe/recipes-support/zchunk/zchunk_1.3.1.bb
index 9bf380924..2961e449f 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.3.1.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.3.1.bb
@@ -1,5 +1,4 @@
 DESCRIPTION = "A file format designed for highly efficient deltas while maintaining good compression"
-AUTHOR = "Jonathan Dieter"
 
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
diff --git a/meta-oe/recipes-test/bats/bats_1.10.0.bb b/meta-oe/recipes-test/bats/bats_1.10.0.bb
index 0fb624e0d..d2a93e190 100644
--- a/meta-oe/recipes-test/bats/bats_1.10.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.10.0.bb
@@ -1,7 +1,6 @@
 SUMMARY = "Bash Automated Testing System"
 DESCRIPTION = "Bats is a TAP-compliant testing framework for Bash. It \
 provides a simple way to verify that the UNIX programs you write behave as expected."
-AUTHOR = "Sam Stephenson & bats-core organization"
 HOMEPAGE = "https://github.com/bats-core/bats-core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2970203aedf9e829edb96a137a4fe81b"
diff --git a/meta-oe/recipes-test/catch2/catch2_2.13.7.bb b/meta-oe/recipes-test/catch2/catch2_2.13.7.bb
index ed50f659d..1dd082fa8 100644
--- a/meta-oe/recipes-test/catch2/catch2_2.13.7.bb
+++ b/meta-oe/recipes-test/catch2/catch2_2.13.7.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "A modern, C++-native, header-only, test framework for unit-tests, \
 TDD and BDD - using C++11, C++14, C++17 and later."
-AUTHOR = "Phil Nash, Martin Horenovsky and others"
 HOMEPAGE = "https://github.com/catchorg/Catch2"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
diff --git a/meta-oe/recipes-test/evtest/evtest_1.35.bb b/meta-oe/recipes-test/evtest/evtest_1.35.bb
index 51af9997f..52f684ce5 100644
--- a/meta-oe/recipes-test/evtest/evtest_1.35.bb
+++ b/meta-oe/recipes-test/evtest/evtest_1.35.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Simple tool for input event debugging"
 HOMEPAGE = "http://people.freedesktop.org/~whot/evtest/"
-AUTHOR = "Vojtech Pavlik <vojtech@suse.cz>"
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-- 
2.34.1


