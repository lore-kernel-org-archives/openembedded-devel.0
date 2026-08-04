Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0060C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 01:13:21 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7580.1785805989928570607
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 18:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kzV+YmSV;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso2983656a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 18:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785805989; x=1786410789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jyMmyoCOVqA1nv9OOgDbm4OivXpWcDJZx5DjxJyTeq0=;
        b=kzV+YmSVteYmubUuPrzo5sH0/WR4TBAvCPNO2pxWZmN72L5eSbC5YgmG1iQEj5cZyX
         cWOORmoNHFaa6B4jGQNF0wLldFZA27znK4zEp1mS2xJ6+wSY2eCTsZ3y6Yi3dpYO/06V
         r9nb+H74mefi4wF4vIpzYixZ9+rtWvitBSJSAOCQ6PAF+fWgF8ZMfH2ncZNFrGZuUarE
         7Ng90YCEiFwzjuDHSOxbFarwkkyBGW5lYSCc68Z7xp6h6C823R+TbDoMNNPy8HK64DV6
         ZAo9OQNr5MX98Ir/3tWUHd61ih/OEHjU98qvQZDqY3lWZ3K0Vmtg9/PVpGZuP1ePnI2q
         oNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785805989; x=1786410789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jyMmyoCOVqA1nv9OOgDbm4OivXpWcDJZx5DjxJyTeq0=;
        b=DChqf2dhJyWruEuGppn5+xqcA1IY5/5uWgbBezNiWEHpNIBWvW3nsxacHs68gDdcBu
         mWFU8zkj7SO3Pn6KJ1nziraepDNCBd58dnMdVGdAGTJOUC695FXWpDfMVBTKUoPC7zYr
         qIAShHdesK2LUxyo+sh9w2yljUBXWCLSgMKIvC5gOwfyHfYlXB6rz8OPnZSYg9uDi5RT
         VDlHXNJr8VQrNlbrn2PFSDPRo2+cBmQedGi0rQ79/wTbqGk3h5uN4XA3Kjq/tjiUfuAg
         iZTXjDjyDdtxCOm5EO4V1mxJvUyMD0OmhneKi4xnknONaPVhuL2kgNFxDKAS4UbDZs1f
         +TPw==
X-Gm-Message-State: AOJu0Yy9vhvlRIY9tFikBIN0GpArJUefM8gHe0S2GCGW4QYzaJmlWTsh
	eInUwTiJ2YIMgosDil2CqEQ5W0FJH9BAiHi+oVvrz5mYtvJK0te4thd72EYS8g==
X-Gm-Gg: AR+sD13Td+ZdAGFXsrypyxTacMcwUCJSgetyAUs14Sb+IpWpkOMXtEP+rCUvZAdHzZU
	m58+n+BOrKwf0++R2zOgy6Jxxp0s+JNH/Ectbl6MZPXaNxgV2w8oN1eDub5oJRLwf/XgmqXpBqT
	ZPMV5EnGBKaELH7ZHmkn4IwJP09mI+0YGcL9f2Y2e6s5daDD5Q/LvvTmfnBo+wmF8vOA47/LdWT
	89zksBsDLy/GeAuYXLguX3A1PshM84nUMZZ3mZSdDD7284lOeSZP8PkTPi27Ju3ZLOW8O7DBzeK
	8mqoDkLQ5oZ588VqMts1+Lb34hmB64WG4sJwO+j0qYMEclXrwxsy5N2RInJKfgyxTH5axnoaeBi
	++af9c7rVB/NMCyCWdfP+38N7xVEJ1Ke6VAzdSwXyK6l7z5U0o1+9rLSzYT8uXmOciLXFOnwDyE
	zhuBQRhLWhgeXPEVjy2YqelwZozTuF83djSdD46AmaqqQeqMdnT1f08sB55Wo2aci7B8jKznFWa
	0sQLd9TiwsVxnR2enloNjt8aUraO08SoQ69yMZAS1SYeOUQKBgN4RvKhEh6zrocCazq78YHPEse
	zna05Hsb1E8RUV+obXViMeHOhU//EJF0sShWp3JiTmkumpm1XJy8y0KPguAsRbMJsBa9kXfPjmo
	0ImDRNfv5xTVT7A==
X-Received: by 2002:a05:6a21:910c:b0:3bf:5539:f93 with SMTP id adf61e73a8af0-3c92a89cbd0mr13556346637.38.1785805988031;
        Mon, 03 Aug 2026 18:13:08 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e666sm61041329eec.4.2026.08.03.18.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 18:13:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta][PATCH] meta-oe: repair broken recipe upstream version-checks
Date: Mon,  3 Aug 2026 18:13:04 -0700
Message-ID: <20260804011304.1674176-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 01:13:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128704

A full check-upgrade-status sweep of meta-oe found 121 recipes reporting
UNKNOWN_BROKEN: their upstream version check resolved no version. This
adds the correct check metadata to each so the version check works again.

Fixes, by mechanism:
 - wget/tarball recipes: add UPSTREAM_CHECK_URI + UPSTREAM_CHECK_REGEX
   pointing at the real release listing (SourceForge files pages, GitHub
   releases pages, GNU/ftp mirrors, distro pools).
 - git recipes with release tags in a non-default format: add
   UPSTREAM_CHECK_GITTAGREGEX matching the actual tag scheme.
 - git repos with no tags at all: UPSTREAM_CHECK_COMMITS = "1".
 - recipes whose upstream has no checkable release channel, or whose PV
   format cannot be compared against upstream tags (CPAN zero-padded
   versions, AUTOINC "git" PVs, dash-separated tags the checker cannot
   convert): UPSTREAM_VERSION_UNKNOWN = "1" with an explanatory comment.

Also override GITHUB_BASE_URI for libppd's sibling libcupsfilters where the
github-releases class default pointed at a non-existent org (404).

Only version-check metadata is touched; no SRC_URI, SRCREV, PV, or checksum
is changed, so nothing that gets built is affected. Each fix was verified
with devtool check-upgrade-status: 120 of 121 now resolve (MATCH, UPDATE,
COMMITS, or an honestly-declared UNKNOWN). The remaining recipe (libubox)
already has correct metadata and only fails locally because the git://
port to git.openwrt.org is firewalled on the build host.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb  | 2 ++
 .../meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb     | 4 ++++
 meta-oe/recipes-benchmark/coremark/coremark_git.bb        | 4 ++++
 meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb          | 4 ++++
 meta-oe/recipes-benchmark/osbench/osbench_git.bb          | 3 +++
 .../recipes-benchmark/tinymembench/tinymembench_git.bb    | 3 +++
 meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb                  | 2 ++
 meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb       | 4 ++++
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb         | 5 ++++-
 .../libimobiledevice/libtatsu_1.0.5.bb                    | 2 ++
 meta-oe/recipes-connectivity/loudmouth/loudmouth_1.5.4.bb | 2 ++
 meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb           | 4 ++++
 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb       | 4 ++++
 .../wifi-test-suite/wifi-test-suite_10.10.1.bb            | 4 ++++
 meta-oe/recipes-dbs/libdbi/libdbi.inc                     | 3 +++
 meta-oe/recipes-dbs/soci/soci_4.1.2.bb                    | 5 +++++
 meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb     | 3 +++
 meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb   | 4 ++++
 meta-oe/recipes-devtools/cscope/cscope_15.9.bb            | 4 ++++
 meta-oe/recipes-devtools/exprtk/exprtk_git.bb             | 4 ++++
 meta-oe/recipes-devtools/giflib/giflib_6.1.3.bb           | 3 +++
 meta-oe/recipes-devtools/gpp/gpp_2.28.bb                  | 3 +++
 meta-oe/recipes-devtools/luajit/luajit_git.bb             | 2 ++
 meta-oe/recipes-devtools/mercurial/mercurial_7.2.2.bb     | 4 ++++
 meta-oe/recipes-devtools/openocd/openocd_git.bb           | 4 ++++
 meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb     | 5 +++++
 meta-oe/recipes-devtools/poke/poke_4.3.bb                 | 2 ++
 meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb      | 7 ++++++-
 .../python/python3-distutils-extra_2.39.bb                | 5 +++++
 meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb | 2 ++
 meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb   | 4 ++++
 meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb           | 2 ++
 meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb             | 4 ++++
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb      | 4 ++++
 meta-oe/recipes-extended/cfengine/cfengine_3.27.1.bb      | 6 ++++++
 meta-oe/recipes-extended/collectd/collectd_5.12.0.bb      | 4 ++++
 meta-oe/recipes-extended/gnuplot/gnuplot_6.0.4.bb         | 4 ++++
 meta-oe/recipes-extended/libqb/libqb_2.0.10.bb            | 2 ++
 .../recipes-extended/linuxconsole/linuxconsole_1.7.1.bb   | 2 ++
 meta-oe/recipes-extended/logwatch/logwatch_7.14.bb        | 2 ++
 meta-oe/recipes-extended/nana/nana_git.bb                 | 4 ++++
 meta-oe/recipes-extended/nicstat/nicstat_1.95.bb          | 3 +++
 meta-oe/recipes-extended/qhull/qhull_2020.2.bb            | 3 +++
 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb          | 3 +++
 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb   | 3 +++
 .../recipes-extended/scsirastools/scsirastools_1.6.6.bb   | 4 ++++
 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb          | 5 +++++
 meta-oe/recipes-extended/socketcan/socketcand_git.bb      | 5 +++++
 .../framebuffer-vncserver/framebuffer-vncserver_git.bb    | 3 +++
 meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb        | 4 ++++
 .../recipes-graphics/ktx-software/ktx-software_5.0.0.bb   | 6 ++++++
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb       | 6 ++++++
 .../parallel-deqp-runner/parallel-deqp-runner_git.bb      | 5 +++++
 .../terminus-font/terminus-font_4.49.1.bb                 | 5 +++++
 .../recipes-graphics/ttf-fonts/source-han-sans-fonts.inc  | 2 ++
 .../ttf-fonts/ttf-arphic-uming_20080216.bb                | 5 +++++
 meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb     | 4 ++++
 .../recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb    | 5 +++++
 meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb   | 4 ++++
 meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_git.bb       | 3 +++
 meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb | 4 ++++
 .../ttf-fonts/ttf-ubuntu-font-family_0.83.bb              | 7 +++++--
 .../recipes-graphics/ttf-fonts/ttf-vlgothic_20220612.bb   | 5 +++++
 meta-oe/recipes-kernel/blktests/blktests.bb               | 5 +++++
 meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.2.bb         | 4 ++++
 meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.4.0.bb     | 5 +++++
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb       | 4 ++++
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb         | 3 +++
 .../recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb   | 2 ++
 meta-oe/recipes-multimedia/live555/live555_20260112.bb    | 3 +++
 meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb   | 2 ++
 meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb     | 5 +++++
 meta-oe/recipes-printing/cups/libppd_2.1.1.bb             | 2 ++
 meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb   | 3 +++
 meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb         | 5 +++++
 .../recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb   | 5 +++++
 meta-oe/recipes-shells/mksh/mksh_59c.bb                   | 3 +++
 meta-oe/recipes-shells/zsh/zsh_5.9.2.bb                   | 5 +++++
 .../ace-cloud-editor/ace-cloud-editor_git.bb              | 4 ++++
 .../anthy-unicode/anthy-unicode_1.0.0.20260213.bb         | 2 +-
 meta-oe/recipes-support/asio/asio_1.36.0.bb               | 5 +++++
 meta-oe/recipes-support/bvi/bvi_1.5.0.bb                  | 4 ++++
 meta-oe/recipes-support/edid-decode/edid-decode_git.bb    | 2 ++
 meta-oe/recipes-support/epeg/epeg_git.bb                  | 4 ++++
 meta-oe/recipes-support/espeak/espeak_1.48.04.bb          | 4 ++++
 meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb       | 6 ++++++
 meta-oe/recipes-support/gsl/gsl_2.8.bb                    | 5 +++++
 meta-oe/recipes-support/gsoap/gsoap_2.8.142.bb            | 3 +++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb                | 3 +++
 meta-oe/recipes-support/hstr/hstr_3.2.0.bb                | 8 ++++++--
 .../recipes-support/idevicerestore/idevicerestore_git.bb  | 4 ++++
 meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb          | 3 +++
 meta-oe/recipes-support/joe/joe_4.8.bb                    | 4 ++++
 meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb   | 5 +++++
 .../recipes-support/libcanberra/libcanberra_0.30-20.bb    | 4 ++++
 meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb      | 4 ++++
 meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb        | 2 ++
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb            | 3 +++
 meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb    | 2 ++
 meta-oe/recipes-support/log4c/log4c_1.2.4.bb              | 2 ++
 meta-oe/recipes-support/log4cpp/log4cpp_1.1.6.bb          | 2 ++
 meta-oe/recipes-support/mcelog/mce-test_git.bb            | 4 ++++
 meta-oe/recipes-support/minini/minini_1.2.b.bb            | 3 +++
 meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb      | 3 +++
 meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb          | 3 +++
 meta-oe/recipes-support/psutils/psutils_2.10.bb           | 3 +++
 meta-oe/recipes-support/re2/re2_2025.11.05.bb             | 7 +++++++
 meta-oe/recipes-support/srecord/srecord_1.65.0.bb         | 3 ++-
 meta-oe/recipes-support/stm32flash/stm32flash_0.7.bb      | 5 +++++
 meta-oe/recipes-support/testdisk/testdisk_7.2.bb          | 5 +++++
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 5 +++++
 meta-oe/recipes-support/usbids/usbids_2025.12.13.bb       | 4 ++++
 meta-oe/recipes-support/utouch/utouch-evemu_git.bb        | 6 ++++++
 meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb    | 5 +++++
 meta-oe/recipes-test/fwts/fwts_22.11.00.bb                | 5 +++++
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb                   | 4 ++++
 meta-oe/recipes-test/trompeloeil/trompeloeil_v49.bb       | 3 +++
 117 files changed, 440 insertions(+), 8 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
index 17a1d3c947..63c1bee4d0 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
@@ -24,6 +24,8 @@ SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2 \
            file://0001-Unbolt-ubuntu-hack.patch \
            "
 SRC_URI[sha256sum] = "3d44ec8274881cf262f160805641f0827ffcc20ade0d85e7e6f3b90e0d3d222a"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lirc/files/LIRC/"
+UPSTREAM_CHECK_REGEX = "/(?P<pver>\d+(\.\d+)+)/"

 SYSTEMD_PACKAGES = "lirc lirc-exec"
 SYSTEMD_SERVICE:${PN} = "lircd.service lircmd.service lircd-setup.service lircd-uinput.service"
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
index 583101f082..ec9391d50c 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
@@ -11,6 +11,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 BRANCH = "master"
 SRC_URI = "git://github.com/tomba/kmsxx.git;protocol=https;branch=${BRANCH}"
 SRCREV = "4a7836fe42a7bc0664d912246c5fbf17f240d152"
+
+# Upstream repo does not tag and publishes no releases
+UPSTREAM_CHECK_COMMITS = "1"
+
 PACKAGES =+ "${PN}-python"

 PACKAGECONFIG ?= "utils python "
diff --git a/meta-oe/recipes-benchmark/coremark/coremark_git.bb b/meta-oe/recipes-benchmark/coremark/coremark_git.bb
index b8b755ed56..ff16b0421f 100644
--- a/meta-oe/recipes-benchmark/coremark/coremark_git.bb
+++ b/meta-oe/recipes-benchmark/coremark/coremark_git.bb
@@ -7,6 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=0a18b17ae63deaa8a595035f668aebe1"
 SRC_URI = "git://github.com/eembc/coremark.git;branch=main;protocol=https"
 SRCREV = "1f483d5b8316753a742cbf5590caf5bd0a4e4777"

+# PV is just "git", so it can never be compared against the single upstream
+# release tag (v1.01). SRCREV is pinned to main HEAD, so track commits.
+UPSTREAM_CHECK_COMMITS = "1"
+
 inherit pkgconfig

 do_configure[noexec] = "1"
diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
index 840e79bd35..edf04a5d70 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
@@ -11,6 +11,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/iperf-${PV}.tar.gz \

 SRC_URI[sha256sum] = "754ab0a7e28033dbea81308ef424bc7df4d6e2fe31b60cc536b61b51fefbd8fb"

+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/${BPN}/files/"
+UPSTREAM_CHECK_REGEX = "iperf-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
+
 S = "${UNPACKDIR}/iperf-${PV}"

 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-benchmark/osbench/osbench_git.bb b/meta-oe/recipes-benchmark/osbench/osbench_git.bb
index 77ac870701..09ac33cece 100644
--- a/meta-oe/recipes-benchmark/osbench/osbench_git.bb
+++ b/meta-oe/recipes-benchmark/osbench/osbench_git.bb
@@ -8,6 +8,9 @@ LIC_FILES_CHKSUM = "file://UNLICENSE;md5=7246f848faa4e9c9fc0ea91122d6e680"
 SRC_URI = "git://gitlab.com/mbitsnbites/osbench.git;protocol=https;branch=master"
 SRCREV = "c59c7c58649162c33250a326ca8fa582b520a29e"

+# Upstream repo does not tag or publish releases
+UPSTREAM_CHECK_COMMITS = "1"
+
 inherit meson

 MESON_SOURCEPATH = "${S}/src"
diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
index 8f65a6135c..e80433d602 100644
--- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
@@ -9,6 +9,9 @@ LIC_FILES_CHKSUM = "file://main.c;endline=22;md5=879b9bbb60851454885b5fa47eb6b34
 PV = "0.4.9+git"

 SRCREV = "a2cf6d7e382e3aea1eb39173174d9fa28cad15f3"
+# Upstream tags are "vX.Y" (newest v0.4); PV 0.4.9+git is ahead of the last tag.
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_VERSION_UNKNOWN = "1"
 SRC_URI = "git://github.com/ssvb/tinymembench.git;branch=master;protocol=https \
            file://0001-asm-Delete-.func-.endfunc-directives.patch \
            "
diff --git a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
index 55959ae475..46baf50a35 100644
--- a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
+++ b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
@@ -21,5 +21,7 @@ SRC_URI = "\
 "
 SRCREV = "ed9ad777d842880e7ac6ca5e0de4bd2d3b4d02dc"

+# Upstream repo does not tag and publishes no releases
+UPSTREAM_CHECK_COMMITS = "1"

 inherit autotools
diff --git a/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb b/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb
index d4d76e0e59..93c1bb4a66 100644
--- a/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb
+++ b/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb
@@ -18,6 +18,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/irda/irda-utils-${PV}.tar.gz \

 SRC_URI[sha256sum] = "61980551e46b2eaa9e17ad31cbc1a638074611fc33bff34163d10c7a67a9fdc6"

+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/irda/files/irda-utils/"
+UPSTREAM_CHECK_REGEX = "irda-utils/(?P<pver>\d+(\.\d+)+)/"
+
+
 inherit update-rc.d

 RRECOMMENDS:${PN} = "\
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index dec4fd879d..149c68a455 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -17,8 +17,11 @@ SRC_URI = "git://github.com/lm-sensors/lm-sensors.git;protocol=https;branch=mast
            file://0001-Fix-building-with-GCC-14.patch \
 "
 SRCREV = "1667b850a1ce38151dae17156276f981be6fb557"
-
+# Upstream release tags look like "V3-6-2". The checker only converts "_" to
+# "." (not "-"), so the parsed version stays dash-separated and cannot be
+# compared against the dotted PV; marked unknown until that can resolve.
 UPSTREAM_CHECK_GITTAGREGEX = "V(?P<pver>\d+(-\d+)+)"
+UPSTREAM_VERSION_UNKNOWN = "1"

 inherit update-rc.d systemd

diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.0.5.bb b/meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.0.5.bb
index 4f6f0c97d3..a9423f0b2d 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.0.5.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.0.5.bb
@@ -3,6 +3,8 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7"

 SRC_URI = "https://github.com/libimobiledevice/libtatsu/releases/download/${PV}/libtatsu-${PV}.tar.bz2"
+UPSTREAM_CHECK_URI = "https://github.com/libimobiledevice/libtatsu/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
 SRC_URI[sha256sum] = "536fa228b14f156258e801a7f4d25a3a9dd91bb936bf6344e23171403c57e440"

 DEPENDS = "curl libplist"
diff --git a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.5.4.bb b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.5.4.bb
index f67c46b428..83a366a8df 100644
--- a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.5.4.bb
+++ b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.5.4.bb
@@ -11,6 +11,8 @@ GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gtk-doc

 SRC_URI = "https://github.com/mcabber/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
+UPSTREAM_CHECK_URI = "https://github.com/mcabber/loudmouth/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
 SRC_URI[sha256sum] = "31cbc91c1fddcc5346b3373b8fb45594e9ea9cc7fe36d0595e8912c47ad94d0d"

 EXTRA_OECONF = "--with-ssl=openssl --with-compile-warnings=no"
diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
index d0db02e08c..7028af29b0 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
@@ -24,6 +24,10 @@ SRC_URI[sha256sum] = "872e4b134e5df29c8933dff12350785054d2fd2839b5ae6b5587b14db1

 inherit autotools pkgconfig github-releases

+# mosh tags releases as "mosh-X.Y.Z", not the "vX.Y.Z" the github-releases class
+# default expects.
+UPSTREAM_CHECK_REGEX = "releases/tag/mosh-(?P<pver>\d+(\.\d+)+)"
+
 PACKAGE_BEFORE_PN += "${PN}-server"
 FILES:${PN}-server = "${bindir}/mosh-server"

diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
index f2aaa6b234..c5e0fbee1a 100644
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
@@ -14,6 +14,10 @@ PV = "1.1.2+git"
 SRCREV = "01c94c77f59404924f1c46d99c4e5e0c7817281b"
 SRC_URI = "git://github.com/libimobiledevice/usbmuxd;protocol=https;branch=master"

+# The recipe deliberately tracks master ahead of the last release (1.1.1), so
+# tag-based checks always report a regression; track new commits instead.
+UPSTREAM_CHECK_COMMITS = "1"
+

 EXTRA_OECONF += "--without-preflight"

diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
index 36a4df5e3e..85eb6ae5c8 100644
--- a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
@@ -7,6 +7,10 @@ LICENSE  = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0542427ed5c315ca34aa09ae7a85ed32"
 SECTION = "test"

+# The only git tag is v9.2.0, older than PV: the real version lives in
+# inc/wfa_ver.h (WFA_SYSTEM_VER) and is not published as a tag or release.
+UPSTREAM_VERSION_UNKNOWN = "1"
+
 SRCREV = "12e85fbeca8ca21a632d18e55089a8a7606d64aa"
 SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git;nobranch=1;protocol=https \
 	file://0001-Use-toolchain-from-environment-variables.patch \
diff --git a/meta-oe/recipes-dbs/libdbi/libdbi.inc b/meta-oe/recipes-dbs/libdbi/libdbi.inc
index a7e5e92bc7..4ffb2a46ae 100644
--- a/meta-oe/recipes-dbs/libdbi/libdbi.inc
+++ b/meta-oe/recipes-dbs/libdbi/libdbi.inc
@@ -9,6 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 SECTION = "libs"

 SRC_URI = "${SOURCEFORGE_MIRROR}/libdbi/libdbi-${PV}.tar.gz"
+# SourceForge download area tops out at libdbi-0.8.2; PV 0.9.0 exists only
+# outside the browsable files area, so no checkable listing maps to PV.
+UPSTREAM_VERSION_UNKNOWN = "1"

 inherit autotools

diff --git a/meta-oe/recipes-dbs/soci/soci_4.1.2.bb b/meta-oe/recipes-dbs/soci/soci_4.1.2.bb
index d199f5350c..2e72698391 100644
--- a/meta-oe/recipes-dbs/soci/soci_4.1.2.bb
+++ b/meta-oe/recipes-dbs/soci/soci_4.1.2.bb
@@ -8,6 +8,11 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BP}/${BP}.tar.gz \
            "
 SRC_URI[sha256sum] = "b79afe73db241f762ddb611fe11184cbf6da44ba99f90721515daa2f978ff38e"

+# Releases live in per-version subdirectories on SourceForge and the tarball
+# itself is not listed on any single browsable page, so match the directory names
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/soci/files/soci/"
+UPSTREAM_CHECK_REGEX = "soci-(?P<pver>\d+(\.\d+)+)/"
+
 TESTCONFIG = '-DSOCI_TEST_EMPTY_CONNSTR="dummy" -DSOCI_TEST_SQLITE3_CONNSTR="test.db" \
               -DSOCI_TEST_POSTGRESQL_CONNSTR:STRING="dbname=soci_test" \
               -DSOCI_TEST_MYSQL_CONNSTR:STRING="db=soci_test user=oe password=oe"'
diff --git a/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb b/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
index e027b8d4aa..6bc5c1d994 100644
--- a/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
+++ b/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
@@ -15,6 +15,9 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.gi
 "
 SRCREV = "9bd5e2c7886fca72f139cd8402488a2235957d41"

+# Upstream kernel.org repo carries no tags and publishes no release tarballs
+UPSTREAM_CHECK_COMMITS = "1"
+

 DEPENDS = "bison-native"

diff --git a/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb b/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
index edb5538425..777fb2f0db 100644
--- a/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
+++ b/meta-oe/recipes-devtools/cppgenerate/cppgenerate_0.3.bb
@@ -9,6 +9,10 @@ SRC_URI = "git://github.com/rm5248/libcppgenerate.git;branch=master;protocol=htt

 SRCREV = "930c5503f76c877b72b9ff8546353d6f422bd010"

+# Upstream stopped tagging after cppgenerate-0.2; PV 0.3 comes from the version
+# in master's CMakeLists.txt, so tags can only ever look like a downgrade.
+UPSTREAM_CHECK_COMMITS = "1"
+
 inherit cmake

 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/cscope/cscope_15.9.bb b/meta-oe/recipes-devtools/cscope/cscope_15.9.bb
index fad885dd43..7bcc5e65e4 100644
--- a/meta-oe/recipes-devtools/cscope/cscope_15.9.bb
+++ b/meta-oe/recipes-devtools/cscope/cscope_15.9.bb
@@ -21,3 +21,7 @@ DEPENDS += "ncurses"
 SRC_URI = "http://downloads.sourceforge.net/project/cscope/cscope/v${PV}/${BP}.tar.gz"

 SRC_URI[sha256sum] = "c5505ae075a871a9cd8d9801859b0ff1c09782075df281c72c23e72115d9f159"
+
+# Tarballs live in per-version subdirectories; newer ones are prefixed with "v"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/cscope/files/cscope/"
+UPSTREAM_CHECK_REGEX = "cscope/v?(?P<pver>\d+(\.\d+)+)/"
diff --git a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
index bdaa39b402..76a9221ece 100644
--- a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
+++ b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
@@ -7,6 +7,10 @@ SRCREV = "a4b17d543f072d2e3ba564e4bc5c3a0d2b05c338"

 SRC_URI = "git://github.com/ArashPartow/exprtk.git;branch=release;protocol=https"

+# PV is just "git", so it can never be compared against the upstream 0.0.x
+# tags. SRCREV is pinned to the release branch HEAD (== tag 0.0.3).
+UPSTREAM_CHECK_COMMITS = "1"
+

 # other packages commonly reference the file directly as "exprtk.hpp"
 # create symlink to allow this usage
diff --git a/meta-oe/recipes-devtools/giflib/giflib_6.1.3.bb b/meta-oe/recipes-devtools/giflib/giflib_6.1.3.bb
index 7940023b6d..6add9d01ad 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_6.1.3.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_6.1.3.bb
@@ -14,6 +14,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
 SRC_URI[logo.sha256sum] = "1a54383986adad1521d00e003b4c482c27e8bc60690be944a1f3319c75abc2c9"
 SRC_URI[sha256sum] = "b65b66b99f0424b93525f987386f22fc5efb9da2bfc92ad4a532249aaffbab0e"

+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/giflib/files/"
+UPSTREAM_CHECK_REGEX = "giflib-(?P<pver>\d+(\.\d+)+)\.tar"
+
 do_install() {
     # using autotools's default will end up in /usr/local
     oe_runmake DESTDIR=${D} PREFIX=${prefix} LIBDIR=${libdir} install
diff --git a/meta-oe/recipes-devtools/gpp/gpp_2.28.bb b/meta-oe/recipes-devtools/gpp/gpp_2.28.bb
index 7c6c386bc6..d0928bf730 100644
--- a/meta-oe/recipes-devtools/gpp/gpp_2.28.bb
+++ b/meta-oe/recipes-devtools/gpp/gpp_2.28.bb
@@ -8,6 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "https://github.com/logological/gpp/releases/download/${PV}/gpp-${PV}.tar.bz2"
 SRC_URI[sha256sum] = "343d33d562e2492ca9b51ff2cc4b06968a17a85fdc59d5d4e78eed3b1d854b70"

+UPSTREAM_CHECK_URI = "https://github.com/logological/gpp/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
+
 inherit autotools

 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index 9873ed6f05..a3b671ce7f 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -10,6 +10,8 @@ SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \

 PV = "2.1"
 SRCREV = "659a61693aa3b87661864ad0f12eee14c865cd7f"
+# The v2.1 branch is rolling with no tags; track commits.
+UPSTREAM_CHECK_COMMITS = "1"

 inherit pkgconfig binconfig siteinfo

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_7.2.2.bb b/meta-oe/recipes-devtools/mercurial/mercurial_7.2.2.bb
index 34a3eb9e51..99f54b7627 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_7.2.2.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_7.2.2.bb
@@ -12,6 +12,10 @@ inherit python3native python3targetconfig
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
 SRC_URI[sha256sum] = "f2ec8e7eeef0500591706d374555f0ceb118822068e75fa3b32be07dd2184f6c"

+# Constrain the version to digits-and-dots, otherwise the auto-derived regex
+# also matches the X.Yrc0 pre-releases in the same directory and picks those.
+UPSTREAM_CHECK_REGEX = "mercurial-(?P<pver>\d+(\.\d+)+)\.tar"
+
 S = "${UNPACKDIR}/mercurial-${PV}"

 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index fd95c9b84a..90b42cfac6 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -25,6 +25,10 @@ SRCREV_libjaylink = "0d23921a05d5d427332a142d154c213d0c306eb1"

 PV = "0.12+git"

+# Upstream tags releases as vX.Y.Z; PV only carries the two-component version,
+# so match just the X.Y part to compare against it.
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)\.\d+"
+
 inherit pkgconfig autotools-brokensep gettext

 BBCLASSEXTEND += "native nativesdk"
diff --git a/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb b/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
index e6609a77b0..56fa7f2c1e 100644
--- a/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
+++ b/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
@@ -12,6 +12,11 @@ DEPENDS += "perl"
 SRC_URI = "git://github.com/makamaka/JSON.git;protocol=https;branch=master"

 SRCREV = "39bc0e567c202762a575fed2844ebdb941c3ca09"
+# Upstream tags are plain "X.YZ" (e.g. 4.11); PV mirrors them padded (4.05 -> 4.05000).
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
+# PV uses CPAN zero-padded versioning (4.05000) which cannot be compared
+# against upstream's plain tags (4.11); the regex resolves but vercmp mis-sorts.
+UPSTREAM_VERSION_UNKNOWN = "1"


 inherit cpan
diff --git a/meta-oe/recipes-devtools/poke/poke_4.3.bb b/meta-oe/recipes-devtools/poke/poke_4.3.bb
index 5b80294697..14597c93c2 100644
--- a/meta-oe/recipes-devtools/poke/poke_4.3.bb
+++ b/meta-oe/recipes-devtools/poke/poke_4.3.bb
@@ -12,6 +12,8 @@ SRC_URI = "${GNU_MIRROR}/poke/poke-${PV}.tar.gz \
 DEPENDS = "flex-native bison-native bdwgc readline"

 SRC_URI[sha256sum] = "a84cb9175d50d45a411f2481fd0662b83cb32ce517316b889cfb570819579373"
+UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/poke/"
+UPSTREAM_CHECK_REGEX = "poke-(?P<pver>\d+(\.\d+)+)\.tar"

 inherit autotools gettext pkgconfig

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb b/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
index 2396ad719c..36642d3947 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
@@ -24,7 +24,12 @@ SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=${PROTOC_BRANCH}
            file://0001-fix-protobuf-native-build-failure-with-gcc-10.patch \
            "

-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d\.\d+\.\d+)"
+# Upstream dropped the language-major prefix after v6.31.1: releases are now
+# tagged vNN.N (v33.6 == this recipe's 6.33.6, cf. PROTOC_VERSION above). Match
+# those two-component tags so the real latest release is reported; the leading
+# "6." in PV means the comparison stays off-by-a-major, so this reads as UPDATE
+# rather than MATCH even when current.
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)$"

 CVE_PRODUCT = "google:protobuf protobuf:protobuf google-protobuf protobuf-cpp"

diff --git a/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb b/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb
index d80eac7756..ed2e45710a 100644
--- a/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb
+++ b/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb
@@ -8,6 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4325afd396febcb659c36b49533135d4"
 SRC_URI = "https://launchpad.net/python-distutils-extra/trunk/${PV}/+download/python-distutils-extra-${PV}.tar.gz"
 SRC_URI[sha256sum] = "723f24f4d65fc8d99b33a002fbbb3771d4cc9d664c97085bf37f3997ae8063af"

+# The per-version +download directory derived from SRC_URI is not browsable;
+# the project-wide download page lists every release tarball.
+UPSTREAM_CHECK_URI = "https://launchpad.net/python-distutils-extra/+download"
+UPSTREAM_CHECK_REGEX = "python-distutils-extra-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
 inherit setuptools3

 S = "${UNPACKDIR}/python-distutils-extra-${PV}"
diff --git a/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb b/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
index 672c46055d..6b92d9c376 100644
--- a/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
+++ b/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
@@ -8,6 +8,8 @@ SRC_URI = " \
 "

 SRCREV = "45eb2ffa5378396e85432872833890b0a1cba872"
+# Upstream repo has no tags/releases; track commits.
+UPSTREAM_CHECK_COMMITS = "1"


 inherit autotools
diff --git a/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb b/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
index fc2e19cf5b..40e1608d4f 100644
--- a/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
+++ b/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
@@ -16,6 +16,10 @@ SRC_URI += "git://github.com/westerndigitalcorporation/spdm-utils.git;protocol=h
 include spdm-utils-crates.inc

 SRCREV = "8805327c9ac0d354c6ef891ccdd0527bbecf80e0"
+# Tags are "vX.Y.Z"; PV 0.7.2 is a post-v0.7.1 snapshot, so the newest tag stays
+# below PV until v0.7.2 is cut. Regex is correct for that point.
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_VERSION_UNKNOWN = "1"

 PV .= "+git"

diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
index 8a8f5d8d25..eec22439fe 100644
--- a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
+++ b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
@@ -10,6 +10,8 @@ SRC_URI = " \
     git://github.com/armlabs/ssd1306_linux.git;protocol=https;branch=master \
 "
 SRCREV = "19128ed4b6108408fea05b9d0551236b6d638dbc"
+# Upstream repo has no tags/releases; track commits.
+UPSTREAM_CHECK_COMMITS = "1"


 # coreutils provides fmt which is used in the Makefile
diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb b/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
index 6f452d3b93..2b9f10514e 100644
--- a/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
@@ -11,6 +11,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5c64b2e8cc50917b2744a90950faa7cd"

 SRCREV = "81b3d2a0c47895c22e9bb8c577f5ab521f76e5d2"
+# The 1.4 line has only -rc tags so far (1.4.0-rc1/rc2), which the checker skips;
+# older stable tags are "vX.Y.Z". Marked unknown until 1.4.0 final is tagged.
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_VERSION_UNKNOWN = "1"
 SRC_URI = "git://git.code.sf.net/p/tclap/code;branch=1.4"

 inherit cmake
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
index fd86edce68..077f3cd2c6 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
@@ -13,6 +13,10 @@ SRC_URI = "git://github.com/mirror/xmlrpc-c.git;branch=master;protocol=https \
            "
 SRCREV = "8ce36bce2438df9b02fcaafd19efa90a56426601"

+# The github mirror carries no tags, and upstream releases on SourceForge use a
+# different (1.NN.PP) numbering than this recipe's PV, so track new commits.
+UPSTREAM_CHECK_COMMITS = "1"
+
 S = "${UNPACKDIR}/${BP}/advanced"

 inherit autotools-brokensep binconfig pkgconfig
diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.27.1.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.27.1.bb
index 799d84a621..53d1e55f5b 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.27.1.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.27.1.bb
@@ -20,6 +20,12 @@ SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BPN}-commu
            "
 SRC_URI[sha256sum] = "878e52c4a6cc3bd28048b527a920fba86ce4cd99c5760adc42417a811efa6e6b"

+# The S3 tarball bucket denies listing, so track the release tags of the
+# upstream git repository instead. Tarballs are published as
+# cfengine-community-<pver>.tar.gz for every 3.x.y tag.
+UPSTREAM_CHECK_URI = "https://github.com/cfengine/core/tags"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>3(\.\d+)+)$"
+
 inherit autotools-brokensep systemd

 export EXPLICIT_VERSION = "${PV}"
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index 57c0c237c4..1c68956f2c 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -18,6 +18,10 @@ SRC_URI = "${GITHUB_BASE_URI}download/${BP}/${BP}.tar.bz2 \
            "
 SRC_URI[sha256sum] = "5bae043042c19c31f77eb8464e56a01a5454e0b39fa07cf7ad0f1bfc9c3a09d6"

+# Release tags are "collectd-<pver>", which the github-releases default regex
+# ("releases/tag/v?...") does not match.
+UPSTREAM_CHECK_REGEX = "releases/tag/collectd-(?P<pver>\d+(\.\d+)+)$"
+
 inherit autotools python3native update-rc.d pkgconfig systemd github-releases

 SYSTEMD_SERVICE:${PN} = "collectd.service"
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.4.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.4.bb
index fce316a7dd..cf2e56f86e 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.4.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.4.bb
@@ -24,6 +24,10 @@ SRC_URI:append:class-target = " \
 SRC_URI[archive.sha256sum] = "458d94769625e73d5f6232500f49cbadcb2b183380d43d2266a0f9701aeb9c5b"
 SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"

+# Tarballs live in per-version subdirectories, the listing above them has no filenames
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/gnuplot/files/gnuplot/"
+UPSTREAM_CHECK_REGEX = "gnuplot/(?P<pver>\d+(\.\d+)+)/"
+
 # for building docs (they deserve it) we need *doc2* tools native
 BBCLASSEXTEND = "native"
 DEPENDS:class-native = "readline-native"
diff --git a/meta-oe/recipes-extended/libqb/libqb_2.0.10.bb b/meta-oe/recipes-extended/libqb/libqb_2.0.10.bb
index 9ea1d542fa..1c6ccffee5 100644
--- a/meta-oe/recipes-extended/libqb/libqb_2.0.10.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_2.0.10.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
 inherit autotools pkgconfig

 SRC_URI = "https://github.com/ClusterLabs/${BPN}/releases/download/v${PV}/${BP}.tar.xz"
+UPSTREAM_CHECK_URI = "https://github.com/ClusterLabs/libqb/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 SRC_URI[sha256sum] = "326a69fb5b2ee4479f0db4f98d10d670ad0798b5ded8c4cfd585b765fd8941e8"

 DEPENDS += "libxml2"
diff --git a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
index 4911cebd16..7ad8549420 100644
--- a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
+++ b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
@@ -20,6 +20,8 @@ SRC_URI = "\
 "

 SRC_URI[sha256sum] = "bd4d4b7e37da02fc67e47ddf20b6f1243c0a7af7b02b918d5e72138ea8727547"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/linuxconsole/files/"
+UPSTREAM_CHECK_REGEX = "linuxconsoletools-(?P<pver>\d+(\.\d+)+)\.tar"

 S = "${UNPACKDIR}/linuxconsoletools-${PV}"

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.14.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.14.bb
index e40db809e6..7370023219 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.14.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.14.bb
@@ -13,6 +13,8 @@ RDEPENDS:${PN} = "perl"

 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
 SRC_URI[sha256sum] = "2fc66eca83419053991484b7d6e778f46b03704ce778893473d7a9cb7dd915f9"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/logwatch/files/"
+UPSTREAM_CHECK_REGEX = "logwatch-(?P<pver>\d+(\.\d+)+)/"

 do_install() {
     install -m 0755 -d ${D}${sysconfdir}/logwatch/scripts/services
diff --git a/meta-oe/recipes-extended/nana/nana_git.bb b/meta-oe/recipes-extended/nana/nana_git.bb
index bad5a797a7..8c814e5305 100644
--- a/meta-oe/recipes-extended/nana/nana_git.bb
+++ b/meta-oe/recipes-extended/nana/nana_git.bb
@@ -6,6 +6,10 @@ SECTION = "Development/Languages/C and C++"

 PV = "2.5+git"
 SRCREV = "6d70617db8b9972e6c1008265fc228aba91c2042"
+
+# Upstream git repo has no tags (2.5 was the last tarball release on Savannah),
+# so there is no version to compare against; track commits instead.
+UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI = "git://github.com/pjmaker/nana;protocol=https;branch=master \
     file://0001-Makefile.am-fix-build-with-separate-build-dir.patch \
     file://0002-man-Makefile.am-we-seem-not-to-need-the-work-around-.patch \
diff --git a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
index d5629b06e5..dfa1827f55 100644
--- a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
+++ b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
@@ -10,6 +10,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            "
 SRC_URI[sha256sum] = "c4cc33f8838f4523f27c3d7584eedbe59f4c587f0821612f5ac2201adc18b367"

+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/nicstat/files/"
+UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
 do_compile() {
     ${CC} ${CFLAGS} ${LDFLAGS} -o nicstat nicstat.c
 }
diff --git a/meta-oe/recipes-extended/qhull/qhull_2020.2.bb b/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
index 3e3d1007e9..1f1cf71c23 100644
--- a/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
+++ b/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
@@ -9,6 +9,9 @@ SRC_URI = "http://www.qhull.org/download/qhull-2020-src-8.0.2.tgz \
     file://0002-allow-build-with-cmake-4.patch \
 "
 SRC_URI[sha256sum] = "b5c2d7eb833278881b952c8a52d20179eab87766b00b865000469a45c1838b7e"
+# Upstream ships a single "qhull-2020-src-8.0.2.tgz"; the dual 2020.2 / 8.0.2
+# numbering has no parseable listing that maps to PV.
+UPSTREAM_VERSION_UNKNOWN = "1"

 CFLAGS += "-fPIC"

diff --git a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
index c7f320660f..2eef885428 100644
--- a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
+++ b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
@@ -11,6 +11,9 @@ SECTION = "System Environment/Daemons"

 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.gz/be2a88f8ccddf2a40ac484cb3294fedc/${BP}.tar.gz"
 SRC_URI[sha256sum] = "4d6145d435a5d8b567b9798620f57f9b0a464078a1deba267958f168fbe776e6"
+# Snapshot ss981107 from the Fedora lookaside cache; upstream is long dead and
+# there is no release listing to check.
+UPSTREAM_VERSION_UNKNOWN = "1"

 SRC_URI += "file://0001-rarpd.8-add-man-file.patch \
     file://0002-Makefile-modify-compile-parameters.patch \
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 591321b7e9..c5ac1f684b 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -33,6 +33,9 @@ SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \

 SRC_URI[sha256sum] = "634a67b2f7ac3b386a79160eb44413d618e33e4e7fc74ae68b0240484af149dd"

+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/sblim/files/sblim-sfcb/1.4%20branch%20%28current%29/"
+UPSTREAM_CHECK_REGEX = "sblim-sfcb-(?P<pver>\d+(\.\d+)+)\.tar\.bz2"
+
 CVE_STATUS[CVE-2012-3381] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."

 inherit autotools
diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
index ccd2f90c3b..85e645c315 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
@@ -16,6 +16,10 @@ SRC_URI = "http://prdownloads.sourceforge.net/scsirastools/scsirastools-${PV}.ta
 "
 SRC_URI[sha256sum] = "e7b997e75decb06a650c42c35cd63d0c94c34e39cf133c723337b0eeabbfdf6a"

+# prdownloads.sourceforge.net has no browsable listing, use the SF files page
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/scsirastools/files/scsirastools/"
+UPSTREAM_CHECK_REGEX = "scsirastools-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
 inherit autotools update-rc.d

 # mdadm Makefile has CC set to gcc, hence override CC to ${CC}
diff --git a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
index 1b3a484ccb..9754ae49db 100644
--- a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
+++ b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
@@ -8,6 +8,11 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BPN}-1.2-0.10-src.ta
            "
 SRC_URI[sha256sum] = "9bf8c42acaa247efd9321bdb1fc2390022f0c554d77fbbd4a7363d990fc0270b"

+# The Fedora lookaside cache only ever holds the one tarball we fetch; upstream
+# publishes sgpio tarballs as attachments on the dmraid eventing wiki page
+UPSTREAM_CHECK_URI = "https://sourceware.org/lvm2/wiki/DMRAID_Eventing"
+UPSTREAM_CHECK_REGEX = "sgpio-(?P<pver>\d+(\.\d+)+)\.tgz"
+
 S = "${UNPACKDIR}/${BPN}"

 LICENSE = "GPL-2.0-or-later"
diff --git a/meta-oe/recipes-extended/socketcan/socketcand_git.bb b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
index 2732258b49..1244d175e3 100644
--- a/meta-oe/recipes-extended/socketcan/socketcand_git.bb
+++ b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
@@ -7,6 +7,11 @@ LIC_FILES_CHKSUM = " \

 SRC_URI = "git://github.com/linux-can/socketcand;branch=master;protocol=https"
 SRCREV = "998b0394d028e791aa97d549bfc686b4fbadf5ee"
+# Release tags are "0.6.1" (older ones "v0.6.0").
+UPSTREAM_CHECK_GITTAGREGEX = "v?(?P<pver>\d+(\.\d+)+)"
+# PV is "git" (AUTOINC recipe with no numeric PV), so the resolved tag (0.6.1)
+# has nothing to compare against; reported unknown rather than broken.
+UPSTREAM_VERSION_UNKNOWN = "1"

 inherit meson pkgconfig

diff --git a/meta-oe/recipes-graphics/framebuffer-vncserver/framebuffer-vncserver_git.bb b/meta-oe/recipes-graphics/framebuffer-vncserver/framebuffer-vncserver_git.bb
index d7ce066cb2..1e7df6a9cc 100644
--- a/meta-oe/recipes-graphics/framebuffer-vncserver/framebuffer-vncserver_git.bb
+++ b/meta-oe/recipes-graphics/framebuffer-vncserver/framebuffer-vncserver_git.bb
@@ -19,6 +19,9 @@ SRC_URI = "\
 "
 SRCREV = "1963e57bebfde420baeecbb2c6848a2382488413"

+# Upstream repo carries no tags and publishes no GitHub releases
+UPSTREAM_CHECK_COMMITS = "1"
+
 inherit cmake systemd

 do_install:append() {
diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb
index dbd2b0e748..0d313af902 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.32.bb
@@ -13,6 +13,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.bz2;name=gphoto2 \
 "
 SRC_URI[gphoto2.sha256sum] = "4e379a0f12f72b49ee5ee2283ffd806b5d12d099939d75197a3f4bbc7f27a1a1"

+# Tarballs live in per-version subdirectories, the top level listing has no filenames
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/gphoto/files/gphoto/"
+UPSTREAM_CHECK_REGEX = "gphoto/(?P<pver>\d+(\.\d+)+)/"
+
 inherit autotools pkgconfig gettext

 EXTRA_OECONF += "--with-jpeg-prefix=${STAGING_INCDIR} \
diff --git a/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb b/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
index 64cc6c4a0e..80793ed340 100644
--- a/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
+++ b/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
@@ -15,6 +15,12 @@ LIC_FILES_CHKSUM = "file://REUSE.toml;md5=9f87c97ba36aab42411bf93c094a61f2"
 SRC_URI = "git://github.com/KhronosGroup/KTX-Software.git;protocol=https;branch=main;lfs=0"
 SRCREV = "6269d2752ed04446c2d4749f54f3aad4f94555b5"

+# Upstream tags are "v<ver>". PV 5.0.0 is really the v5.0.0-rc1 tag pinned
+# above, and the checker skips rc/alpha/beta tags, so the newest resolvable
+# release (4.4.2) is always lower than PV until 5.0.0 final is tagged.
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_VERSION_UNKNOWN = "1"
+
 inherit cmake

 # BASISU does not work with avx
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb
index 02ef8ed4a7..cd6441ded7 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb
@@ -17,6 +17,12 @@ SRC_URI = "\
 SRCREV_demo = "045137cf0fa1781483cb796261a11b5eb21e99d9"
 SRCREV_lvgl = "85aa60d18b3d5e5588d7b247abf90198f07c8a63"
 SRCREV_FORMAT = "demo_lvgl"
+# The version check runs against the first SRC_URI (the demo repo), whose tags
+# are "vX.Y.Z" but top out at v9.2.2 -- below PV 9.5.0+git, which follows the
+# bundled lvgl release. Regex is correct; marked unknown until the demo repo
+# tags a >=9.5.0 release.
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_VERSION_UNKNOWN = "1"

 inherit cmake pkgconfig

diff --git a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
index 88cdce26d1..9793e0db42 100644
--- a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
+++ b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
@@ -10,5 +10,10 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/parallel-deqp-runner.git;protocol=h
 PV = "2020.06.15+git"
 SRCREV = "e1642fb691d29b1462504b58916f7f514a963e80"

+# Upstream only has mesa-ci-YYYY-MM-DD tags, which the default tag regex
+# truncates to the year (e.g. "2020") and which use "-" separators that do not
+# compare against the dotted PV; track commits instead.
+UPSTREAM_CHECK_COMMITS = "1"
+

 inherit pkgconfig meson
diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
index 4cfbde5354..7a601f05a4 100644
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.49.1.bb
@@ -14,6 +14,11 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
           "
 SRC_URI[sha256sum] = "d961c1b781627bf417f9b340693d64fc219e0113ad3a3af1a3424c7aa373ef79"

+# The SF release directories are named terminus-font-4.49 while the tarball
+# inside is terminus-font-4.49.1.tar.gz, so scan the project homepage instead
+UPSTREAM_CHECK_URI = "http://terminus-font.sourceforge.net/"
+UPSTREAM_CHECK_REGEX = "terminus-font-(?P<pver>\d+(\.\d+)+)\.tar"
+
 inherit allarch fontcache

 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-fonts.inc b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-fonts.inc
index 03ca4c0902..e64d221621 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-fonts.inc
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-fonts.inc
@@ -10,6 +10,8 @@ SRC_URI = " \
     https://github.com/adobe-fonts/source-han-sans/releases/download/${PV}R/${ZIPNAME}.zip;subdir=${BP};downloadfilename=${BP}.zip \
     file://44-${BPN}.conf \
 "
+UPSTREAM_CHECK_URI = "https://github.com/adobe-fonts/source-han-sans/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)R"

 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
index b1a32413e3..1fb4cdcf78 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
@@ -15,3 +15,8 @@ require ttf.inc
 FILES:${PN} = "${datadir}"

 SRC_URI[sha256sum] = "e3c19e04ea7a565b4acff6f1e4248084d2e10752e305bf7dd6c76e80860dc1db"
+
+# Upstream (CJKUnifonts) is dormant; Debian carries the canonical tarball. PV is
+# the date embedded in the Debian version 0.2.<date>.2, so match just that part.
+UPSTREAM_CHECK_URI = "https://deb.debian.org/debian/pool/main/f/fonts-arphic-uming/"
+UPSTREAM_CHECK_REGEX = "fonts-arphic-uming_0\.2\.(?P<pver>\d+)\.\d+\.orig\.tar"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
index 0697e69399..67e16ebec1 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
@@ -25,6 +25,10 @@ SRC_URI = "git://github.com/google/fonts.git;protocol=https;branch=main;subpath=

 S = "${UNPACKDIR}"

+# google/fonts is a rolling monorepo; its v0.x.y tags version the tooling, not
+# the fonts, so track new commits instead.
+UPSTREAM_CHECK_COMMITS = "1"
+
 do_install:append() {
     install -d ${D}${datadir}/fonts/truetype/
     find ${S} -path 'fira*/*.tt[cf]' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/{} \;
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
index 373bdb4bde..ac8d3388d2 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
@@ -16,3 +16,8 @@ FILES:ttf-hunky-sans = "${datadir}/fonts/truetype/HunkySans*.ttf"
 FILES:ttf-hunky-serif = "${datadir}/fonts/truetype/HunkySerif*.ttf"

 SRC_URI[sha256sum] = "3fc528737ccd12ec3c09c4a91447d241d3c5bceeeb4d24b7f2c29b15c9735328"
+
+# The SourceForge download mirror has no browsable listing; check the project's
+# file area instead. 0.3.1 (2005) is still the last release.
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/hunkyfonts/files/hunkyfonts/"
+UPSTREAM_CHECK_REGEX = "hunkyfonts-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb
index 165ea7576a..457603008a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb
@@ -10,6 +10,10 @@ SRC_URI = "https://moji.or.jp/wp-content/ipafont/IPAfont/IPAfont00303.zip "

 SRC_URI[sha256sum] = "f755ed79a4b8e715bed2f05a189172138aedf93db0f465b4e20c344a02766fe5"

+# Ver.003.03 (the last IPAfont release) is only published as unversioned-directory
+# zips named IPAfont00303.zip; no listing exposes a version comparable to PV.
+UPSTREAM_VERSION_UNKNOWN = "1"
+
 S = "${UNPACKDIR}/IPAfont00303"

 PACKAGES = "ttf-ipag ttf-ipagp ttf-ipam ttf-ipamp"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_git.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_git.bb
index c491a44095..9d2c802ac8 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_git.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_git.bb
@@ -8,6 +8,9 @@ LIC_FILES_CHKSUM = "file://OFL.txt;md5=ee870a4a7cee012360178b2f8bccb725"
 SRC_URI = "git://github.com/coz-m/MPLUS_FONTS.git;protocol=https;branch=master"
 SRCREV = "80ac404d0c80442781b6f4c6119a8c9e71770806"

+# Upstream publishes no tags or GitHub releases, so track new commits instead.
+UPSTREAM_CHECK_COMMITS = "1"
+
 PACKAGESPLITFUNCS:prepend = "split_ttf_mplus_packages "

 python split_ttf_mplus_packages() {
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
index b224f46869..d14260bdf9 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
@@ -12,6 +12,10 @@ LIC_FILES_CHKSUM = "file://IPA_Font_License_Agreement_v1.0.txt;md5=6cd3351ba979c
 SRC_URI = "https://launchpad.net/takao-fonts/trunk/15.03/+download/TakaoFonts_00303.01.tar.xz"
 SRC_URI[sha256sum] = "e9871f72ac69acb3e277aebbee7ca01fbebf54800733e29fafdc46133fc3552f"

+# Launchpad project dormant since the 15.03 release; the only published tarballs
+# are named TakaoFonts_00303.01, which is not comparable to PV 003.03.01.
+UPSTREAM_VERSION_UNKNOWN = "1"
+
 S = "${UNPACKDIR}/TakaoFonts_00303.01"

 PACKAGES = "ttf-takao-pgothic ttf-takao-gothic ttf-takao-pmincho ttf-takao-mincho"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
index e5ac219938..0387d53ff1 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
@@ -12,8 +12,11 @@ SRC_URI = "https://assets.ubuntu.com/v1/${SHA1SUM}-ubuntu-font-family-${PV}.zip"

 SRC_URI[sha256sum] = "61a2b342526fd552f19fef438bb9211a8212de19ad96e32a1209c039f1d68ecf"

-UPSTREAM_CHECK_URI = "https://repology.org/project/fonts:ubuntu/packages"
-UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
+# assets.ubuntu.com has no browsable listing and design.ubuntu.com intermittently
+# serves brotli-encoded HTML that the wget fetcher cannot decode, so check the
+# Ubuntu archive pool. Match only plain releases, not +git snapshots.
+UPSTREAM_CHECK_URI = "http://archive.ubuntu.com/ubuntu/pool/main/f/fonts-ubuntu/"
+UPSTREAM_CHECK_REGEX = "fonts-ubuntu_(?P<pver>\d+(\.\d+)+)\.orig\.tar"

 S = "${UNPACKDIR}/ubuntu-font-family-${PV}"

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20220612.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20220612.bb
index 0ff5628ed3..d4ffc03355 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20220612.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20220612.bb
@@ -12,6 +12,11 @@ SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/fonts-vlgo

 SRC_URI[sha256sum] = "c201dd3fa73492a2551a339fe235608d3be771237fd5868a526f1b3eb3164d93"

+# The Launchpad +sourcefiles URL has no browsable listing; the Debian pool
+# carries the same orig tarballs and is indexable.
+UPSTREAM_CHECK_URI = "https://deb.debian.org/debian/pool/main/f/fonts-vlgothic/"
+UPSTREAM_CHECK_REGEX = "fonts-vlgothic_(?P<pver>\d+)\.orig\.tar"
+
 S = "${UNPACKDIR}/VLGothic"

 do_install:append () {
diff --git a/meta-oe/recipes-kernel/blktests/blktests.bb b/meta-oe/recipes-kernel/blktests/blktests.bb
index ded03a4de2..4417a5dbb0 100644
--- a/meta-oe/recipes-kernel/blktests/blktests.bb
+++ b/meta-oe/recipes-kernel/blktests/blktests.bb
@@ -10,6 +10,11 @@ SRC_URI = " \
 	git://github.com/osandov/blktests.git;nobranch=1;protocol=https \
 	"

+# Upstream repo carries no tags at all (releases are plain master commits) and
+# UPSTREAM_CHECK_COMMITS cannot work here because SRC_URI uses nobranch=1, so
+# there is no ref for latest_revision to resolve.
+UPSTREAM_VERSION_UNKNOWN = "1"
+

 inherit autotools-brokensep

diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.2.bb b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.2.bb
index 9634ca476b..7945c6f535 100644
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.2.bb
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.2.bb
@@ -25,6 +25,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ipmiutil/ipmiutil-${PV}.tar.gz \
           "
 SRC_URI[sha256sum] = "37f9bc8e6b18c1155e4d5ea38c87b83908b7acc7a44fbc5e3af493f26ef8b767"

+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/ipmiutil/files/"
+UPSTREAM_CHECK_REGEX = "ipmiutil-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
+
 inherit autotools-brokensep pkgconfig systemd

 PACKAGECONFIG ?= "lanplus gpl"
diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.4.0.bb b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.4.0.bb
index e8e4f36d6c..2798f307a5 100644
--- a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.4.0.bb
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.4.0.bb
@@ -10,6 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d568123389d9a12625cca2b089b1728b"
 SRC_URI = "https://github.com/oracle/ktls-utils/releases/download/${BP}/${BP}.tar.gz"
 SRC_URI[sha256sum] = "acd9e1851e492e7e16b879b30fc800f4a98d4214fa534ebb7e24d379f5984770"

+# Release tags are "ktls-utils-<ver>"; the lookahead keeps -rc tags out.
+UPSTREAM_CHECK_URI = "https://github.com/oracle/ktls-utils/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/ktls-utils-(?P<pver>\d+(\.\d+)+)(?!-)"
+
+
 inherit autotools pkgconfig systemd

 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
index dbc44e1b22..221a1701f9 100644
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
@@ -12,6 +12,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;b
            file://0002-Drop-using-_LARGEFILE64_SOURCE.patch \
            file://0001-Do-not-emit-useless-rpath.patch"
 SRCREV = "18233e4c32857cb7ddd4960beeec8360ed834fc5"
+# The kernel.org mirror we fetch from only tags up to trace-cmd-v2.9.x; the 3.x
+# line (PV 3.1.5) lives in the newer trace-cmd.org repo, so no tag here matches PV.
+UPSTREAM_CHECK_GITTAGREGEX = "trace-cmd-v(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_VERSION_UNKNOWN = "1"


 DEPENDS += "libtraceevent libtracefs zstd xmlto-native asciidoc-native swig-native bison-native flex-native"
diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
index 2d47116cf0..95decaf8c2 100644
--- a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
@@ -12,6 +12,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/id3lib/id3lib-${PV}.tar.gz;name=archive \
 SRC_URI[archive.sha256sum] = "2749cc3c0cd7280b299518b1ddf5a5bcfe2d1100614519b68702230e26c7d079"
 SRC_URI[patch.sha256sum] = "6170f085972fdeb5fd69e346860100416707bb0b9f3a73a17a64945dc8b7cfe1"

+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/id3lib/files/id3lib/"
+UPSTREAM_CHECK_REGEX = "id3lib/(?P<pver>\d+(\.\d+)+)/"
+
 CVE_STATUS[CVE-2007-4460] = "patched: fix is included in debian patch"

 inherit autotools
diff --git a/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb b/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb
index ed1033f444..13622407a5 100644
--- a/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb
+++ b/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb
@@ -8,6 +8,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/modplug-xmms/libmodplug-${PV}.tar.gz \
            file://0001-fastmix-Drop-register-storage-class-keyword.patch"

 SRC_URI[sha256sum] = "457ca5a6c179656d66c01505c0d95fafaead4329b9dbaa0f997d00a3508ad9de"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/modplug-xmms/files/libmodplug/"
+UPSTREAM_CHECK_REGEX = "libmodplug-(?P<pver>\d+(\.\d+)+)\.tar"

 inherit autotools pkgconfig

diff --git a/meta-oe/recipes-multimedia/live555/live555_20260112.bb b/meta-oe/recipes-multimedia/live555/live555_20260112.bb
index ee92fd36c4..9ea943328c 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20260112.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20260112.bb
@@ -17,6 +17,9 @@ SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz
 MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"

 SRC_URI[sha256sum] = "2c54c2e090065849d0ab8cc7b06942f4e66dde17f2a0c80ae20b907d562c937e"
+# PV is a compact date (YYYYMMDD) while upstream tarballs use live.YYYY.MM.DD,
+# which do not compare against PV; the check cannot map the two schemes.
+UPSTREAM_VERSION_UNKNOWN = "1"
 CVE_PRODUCT = "live555 live555_media_server live555:streaming_media live555:liblivemedia"

 S = "${UNPACKDIR}/live"
diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb
index d7a2820a79..e11b80771f 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb
@@ -9,6 +9,8 @@ SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
 SRC_URI[sha256sum] = "ad9d64dfc8f83684876419ea7cd4ff4a41d8bcd8c23ef37ecb3a200a16b46d19"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mikmod/files/libmikmod/"
+UPSTREAM_CHECK_REGEX = "/(?P<pver>\d+(\.\d+)+)/"

 inherit autotools binconfig lib_package

diff --git a/meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb b/meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb
index 311f33e134..1b8b9c8fe6 100644
--- a/meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb
+++ b/meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb
@@ -13,5 +13,10 @@ SRC_URI[sha256sum] = "6c303e36cfde05a6c88fb940c62b6a18e7cdbfb91f077733ebc98f1049

 inherit autotools gettext pkgconfig github-releases

+# github-releases defaults GITHUB_BASE_URI to github.com/<BPN>/<BPN>, which 404s
+# for this project; releases live under the OpenPrinting org.
+GITHUB_BASE_URI = "https://github.com/OpenPrinting/${BPN}/releases/"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
+
 FILES:${PN} += "${datadir}"
 RDEPENDS:${PN} += "ghostscript"
diff --git a/meta-oe/recipes-printing/cups/libppd_2.1.1.bb b/meta-oe/recipes-printing/cups/libppd_2.1.1.bb
index 1b7d2be844..953cc6dd4d 100644
--- a/meta-oe/recipes-printing/cups/libppd_2.1.1.bb
+++ b/meta-oe/recipes-printing/cups/libppd_2.1.1.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c1fca671047153ce6825c4ab06f2ab49"
 DEPENDS = "libcupsfilters"

 SRC_URI = "https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz"
+UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/libppd/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
 SRC_URI[sha256sum] = "3fa341cc03964046d2bf6b161d80c1b4b2e20609f38d860bcaa11cb70c1285e4"

 inherit autotools gettext pkgconfig github-releases
diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
index 82953b798c..7243be6531 100644
--- a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
+++ b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
@@ -19,6 +19,9 @@ SRC_URI = "https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz \
            "
 SRC_URI[sha256sum] = "f5a9f47de28530b1ae2069cfbc647a9a641baeeabe809bb0ef2b3ec5b9668d70"

+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/gimp-print/files/gutenprint-5.3/"
+UPSTREAM_CHECK_REGEX = "gutenprint-5\.3/(?P<pver>\d+(\.\d+)+)/"
+
 inherit autotools gettext pkgconfig

 DEPENDS += "glib-2.0-native cups gutenprint-native tiff libusb libpng libjpeg-turbo ghostscript"
diff --git a/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb b/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
index 662519d5b2..060cb055fc 100644
--- a/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
+++ b/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
@@ -9,6 +9,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ed4cfe4688e1ac2cc2e6748766571949"
 SRC_URI = "gitsm://github.com/DMTF/spdm-emu;protocol=https;branch=main"

 SRCREV = "5fca359b15e4edd4f070ca83c9da02799b6f78ae"
+# Upstream release tags are "X.Y.Z" (newest 3.8.0).
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
+# PV is "git" (AUTOINC recipe with no numeric PV), so the resolved tag (3.8.0)
+# has nothing to compare against; reported unknown rather than broken.
+UPSTREAM_VERSION_UNKNOWN = "1"
 inherit cmake pkgconfig systemd

 DEPENDS = "openssl"
diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
index 5160ac87e5..f13dc766da 100644
--- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
+++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
@@ -8,6 +8,11 @@ SECTION = "System Environment/Kernel"
 SRC_URI = "${SOURCEFORGE_MIRROR}/tomoyo/${BP}.tar.gz"
 SRC_URI[sha256sum] = "f5d1f422df0f68937245fb97c18336bcd813221955cbcdb3b1a3f65b3cae1a06"

+# downloads.sourceforge.net has no browsable listing; the dated re-releases all
+# live in the 2.6 directory, so check that page directly
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/tomoyo/files/tomoyo-tools/2.6/"
+UPSTREAM_CHECK_REGEX = "tomoyo-tools-(?P<pver>\d+(\.\d+)+-\d+)\.tar\.gz"
+
 # there are periodic new releases of the same version, with this date updated
 PV .= "-20250707"
 S = "${UNPACKDIR}/${BPN}"
diff --git a/meta-oe/recipes-shells/mksh/mksh_59c.bb b/meta-oe/recipes-shells/mksh/mksh_59c.bb
index b475ac09a5..5c14a9b7c6 100644
--- a/meta-oe/recipes-shells/mksh/mksh_59c.bb
+++ b/meta-oe/recipes-shells/mksh/mksh_59c.bb
@@ -10,6 +10,9 @@ LIC_FILES_CHKSUM = "file://main.c;beginline=6;endline=26;md5=6efc2c249328e4d2bd3
 SRC_URI = "http://www.mirbsd.org/MirOS/dist/mir/${BPN}/${BPN}-R${PV}.tgz"

 SRC_URI[sha256sum] = "77ae1665a337f1c48c61d6b961db3e52119b38e58884d1c89684af31f87bc506"
+# mirbsd.org serves no browsable listing; PV 59c is the current release
+# (matches Debian's mksh_59c). Distinct "RNNx" scheme defeats generic checks.
+UPSTREAM_VERSION_UNKNOWN = "1"

 UPSTREAM_CHECK_REGEX = "${BPN}-R(?P<pver>.*)\.tgz"

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
index 331c92707d..2b2de3407e 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
@@ -13,6 +13,11 @@ DEPENDS = "ncurses bison-native libcap libpcre2 gdbm groff-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.xz"
 SRC_URI[sha256sum] = "36fa734374b44783582cec09bcd67822e2f992c779ec1624ab5596df078d2f81"

+# The SourceForge download mirror has no browsable listing; check the per-release
+# directories in the project's file area instead.
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/zsh/files/zsh/"
+UPSTREAM_CHECK_REGEX = "zsh/(?P<pver>\d+(\.\d+)+)/"
+
 inherit autotools gettext update-alternatives manpages

 EXTRA_AUTORECONF += "--exclude=aclocal"
diff --git a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
index 85443984a2..aeef828136 100644
--- a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
+++ b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
@@ -9,6 +9,10 @@ SRC_URI = "git://github.com/ajaxorg/ace-builds.git;protocol=https;branch=master"
 PV = "02.07.17+git"
 SRCREV = "812e2c56aed246931a667f16c28b096e34597016"

+# Upstream tags are v<major>.<minor>.<micro> (currently v1.44.0), which cannot be
+# compared with this recipe's zero-padded date-like PV, so track commits instead.
+UPSTREAM_CHECK_COMMITS = "1"
+
 FILES:${PN} = "${datadir}/ace-builds"


diff --git a/meta-oe/recipes-support/anthy-unicode/anthy-unicode_1.0.0.20260213.bb b/meta-oe/recipes-support/anthy-unicode/anthy-unicode_1.0.0.20260213.bb
index e8c4d9b97c..db63838539 100644
--- a/meta-oe/recipes-support/anthy-unicode/anthy-unicode_1.0.0.20260213.bb
+++ b/meta-oe/recipes-support/anthy-unicode/anthy-unicode_1.0.0.20260213.bb
@@ -17,7 +17,7 @@ SRC_URI:append:class-native = " file://native-helpers.patch"
 SRC_URI[sha256sum] = "666e91b92c76eb5bee7ee88dca1478eb55122c2af2641f055d4e51cf9d904860"

 UPSTREAM_CHECK_URI = "https://github.com/fujiwarat/anthy-unicode/releases"
-UPSTREAM_CHECK_REGEX = "anthy-unicode-(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"

 DEPENDS:class-target = "anthy-unicode-native"
 RDEPENDS:${PN}:class-target = "libanthy-unicode0"
diff --git a/meta-oe/recipes-support/asio/asio_1.36.0.bb b/meta-oe/recipes-support/asio/asio_1.36.0.bb
index d196a35c69..bd23e5b112 100644
--- a/meta-oe/recipes-support/asio/asio_1.36.0.bb
+++ b/meta-oe/recipes-support/asio/asio_1.36.0.bb
@@ -21,6 +21,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=92db288d8a7d89bb9c5821c447c3052c"

 SRC_URI[sha256sum] = "7bf4dbe3c1ccd9cc4c94e6e6be026dcc2110f9201d286bb9500dc85d69825524"

+# Releases live in per-version directories named "<pver> (Stable)" / "<pver> (Development)",
+# so match only the stable ones.
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/asio/files/asio/"
+UPSTREAM_CHECK_REGEX = "files/asio/(?P<pver>\d+(\.\d+)+)%20%28Stable%29"
+
 PACKAGECONFIG ??= "boost"

 PACKAGECONFIG[boost] = "--with-boost=${STAGING_LIBDIR},--without-boost,boost"
diff --git a/meta-oe/recipes-support/bvi/bvi_1.5.0.bb b/meta-oe/recipes-support/bvi/bvi_1.5.0.bb
index b60702139a..326ddbd415 100644
--- a/meta-oe/recipes-support/bvi/bvi_1.5.0.bb
+++ b/meta-oe/recipes-support/bvi/bvi_1.5.0.bb
@@ -8,6 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a36207309d382da27cd66fdaae922e3c"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz"
 SRC_URI[sha256sum] = "6540716a1a3b2b9711635108da14b26baea488881d4a682121c0bddbba6b74cb"

+# Tarballs live in per-version subdirectories, the top level listing has no filenames
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/bvi/files/bvi/"
+UPSTREAM_CHECK_REGEX = "bvi/(?P<pver>\d+(\.\d+)+)/"
+
 DEPENDS += "ncurses"

 # The project uses old style C interfaces and it is not compatible with C23
diff --git a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
index fc8681ca44..cf3cd9c4b4 100644
--- a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
+++ b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2ef696d66c156139232201f223c22592"

 SRC_URI = "git://git.linuxtv.org/edid-decode.git;protocol=https;branch=master"
 SRCREV = "5920bf2a756b2f748c49ff6a08b9f421026473c5"
+# Upstream (git.linuxtv.org) publishes no tags or releases; track commits.
+UPSTREAM_CHECK_COMMITS = "1"
 PV = "0.0+git"

 # Upstream repo does not tag
diff --git a/meta-oe/recipes-support/epeg/epeg_git.bb b/meta-oe/recipes-support/epeg/epeg_git.bb
index 647d82ec53..35352fcac8 100644
--- a/meta-oe/recipes-support/epeg/epeg_git.bb
+++ b/meta-oe/recipes-support/epeg/epeg_git.bb
@@ -8,4 +8,8 @@ DEPENDS = "jpeg libexif"
 SRC_URI = "git://github.com/mattes/epeg.git;branch=master;protocol=https"
 SRCREV = "17bbae0f0a0b777e5fb01e0d16891e07153a41eb"

+# PV is just "git", so it can never be compared against the upstream v0.9.x
+# tags. SRCREV is pinned to master HEAD (== tag v0.9.3), so track commits.
+UPSTREAM_CHECK_COMMITS = "1"
+
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
index c80bf12ade..5ac28585b0 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
@@ -10,6 +10,10 @@ SRC_URI = "http://downloads.sourceforge.net/espeak/espeak-1.48.04-source.zip \
 "
 SRC_URI[sha256sum] = "bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2ec612f09b207f0659"

+# Tarballs live under per-minor-release directories (espeak-1.48/), not the top level
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/espeak/files/espeak/espeak-1.48/"
+UPSTREAM_CHECK_REGEX = "espeak-(?P<pver>\d+(\.\d+)+)-source\.zip"
+
 S = "${UNPACKDIR}/espeak-${PV}-source"

 DEPENDS = "portaudio-v19 qemu-helper-native"
diff --git a/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb b/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
index 2057caff78..01d85eb2d6 100644
--- a/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
+++ b/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
@@ -10,6 +10,12 @@ SRC_URI = "${GNU_MIRROR}/gengetopt/${BPN}-${PV}.tar.xz"

 SRC_URI[sha256sum] = "b941aec9011864978dd7fdeb052b1943535824169d2aa2b0e7eae9ab807584ac"

+# ftpmirror.gnu.org redirects to a random mirror, several of which serve a
+# non-Apache index the auto-derived regex cannot parse. Pin the check to the
+# canonical GNU FTP listing.
+UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/gengetopt/"
+UPSTREAM_CHECK_REGEX = "gengetopt-(?P<pver>\d+(\.\d+)+)\.tar"
+
 inherit autotools texinfo

 CXXFLAGS += "-std=c++14"
diff --git a/meta-oe/recipes-support/gsl/gsl_2.8.bb b/meta-oe/recipes-support/gsl/gsl_2.8.bb
index 45c776112b..88e03b623a 100644
--- a/meta-oe/recipes-support/gsl/gsl_2.8.bb
+++ b/meta-oe/recipes-support/gsl/gsl_2.8.bb
@@ -2,3 +2,8 @@ include gsl.inc

 SRC_URI = "${GNU_MIRROR}/gsl/gsl-${PV}.tar.gz"
 SRC_URI[sha256sum] = "6a99eeed15632c6354895b1dd542ed5a855c0f15d9ad1326c6fe2b2c9e423190"
+
+# GNU_MIRROR resolves to ftpmirror.gnu.org, which round-robins to mirrors whose
+# directory listings are not always parseable; check the canonical archive.
+UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/gsl/"
+UPSTREAM_CHECK_REGEX = "gsl-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.142.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.142.bb
index ca2df394e2..f77b88fedd 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.142.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.142.bb
@@ -9,6 +9,9 @@ SRC_URI = "https://prdownloads.sourceforge.net/${BPN}2/${BPN}_${PV}.zip \
            file://0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch"
 SRC_URI[sha256sum] = "6d7196bd6591ec2977474c681e351b4a33eb5c2d64c9e2e6727b004f330b3752"

+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/${BPN}2/files/"
+UPSTREAM_CHECK_REGEX = "${BPN}_(?P<pver>\d+(\.\d+)+)\.zip"
+
 inherit autotools

 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 350be8dc0e..3f062cacd6 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -19,6 +19,9 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"

+UPSTREAM_CHECK_URI = "https://support.hdfgroup.org/releases/hdf5/"
+UPSTREAM_CHECK_REGEX = "\./(?P<pver>\d+(\.\d+)+)/index\.html"
+
 FILES:${PN} += "${libdir}/libhdf5.settings ${datadir}/*"

 EXTRA_OECMAKE = " \
diff --git a/meta-oe/recipes-support/hstr/hstr_3.2.0.bb b/meta-oe/recipes-support/hstr/hstr_3.2.0.bb
index 418eeafdbc..0b25ff5642 100644
--- a/meta-oe/recipes-support/hstr/hstr_3.2.0.bb
+++ b/meta-oe/recipes-support/hstr/hstr_3.2.0.bb
@@ -14,7 +14,11 @@ S = "${UNPACKDIR}/${BPN}"

 SRC_URI[sha256sum] = "abf0a8625545b2022d62bf0d1c576e3cc783c4ea7cc2ae2843c518743f77f4c9"

-UPSTREAM_CHECK_URI = "https://github.com/dvorka/hstr/releases"
-UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
+# Upstream tags/release names are 2-component ("v3.2") while the tarball it
+# ships is 3-component ("hstr-3.2.0-tarball.tgz"), so a tag-based check always
+# resolves lower than PV. Check the release directory holding the tarballs
+# instead; bump it together with SRC_URI on upgrade.
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/hstr/files/v3.2/"
+UPSTREAM_CHECK_REGEX = "hstr-(?P<pver>\d+(\.\d+)+)-tarball\.tgz"

 inherit autotools pkgconfig bash-completion
diff --git a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
index e032573516..ee04f7938f 100644
--- a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
+++ b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
@@ -13,4 +13,8 @@ PV = "1.0.1+git"
 SRCREV = "a0cec3b34fb112168aaae9fbb024e15302563b34"
 SRC_URI = "git://github.com/libimobiledevice/idevicerestore;protocol=https;branch=master"

+# PV tracks master, which is ahead of the only release tag (1.0.0), so a
+# tag-based check can never resolve >= PV.
+UPSTREAM_CHECK_COMMITS = "1"
+
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb b/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
index 60b27a6c92..03dfdbd6f7 100644
--- a/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
+++ b/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
@@ -30,6 +30,9 @@ SRC_URI = "\
 "
 SRC_URI[sha256sum] = "fd92a1a9faa10fb81bbf752c7ee1e257f17e1ec4c2964f8a47adf8a3eaa7df41"

+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/i/${DEBIAN_PKG_NAME}/"
+UPSTREAM_CHECK_REGEX = "${DEBIAN_PKG_NAME}_(?P<pver>\d+(\.\d+)+)\+dfsg\d*\.orig\.tar\.xz"
+
 S = "${UNPACKDIR}/${DEBIAN_PKG_NAME}-${DEBIAN_PKG_VERSION}"

 OECMAKE_SOURCEPATH = "${S}/src"
diff --git a/meta-oe/recipes-support/joe/joe_4.8.bb b/meta-oe/recipes-support/joe/joe_4.8.bb
index 7b901e1e3b..8c0d6c4808 100644
--- a/meta-oe/recipes-support/joe/joe_4.8.bb
+++ b/meta-oe/recipes-support/joe/joe_4.8.bb
@@ -15,3 +15,7 @@ PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,ncurses-termin
 inherit autotools-brokensep mime-xdg

 SRC_URI[sha256sum] = "6995b28ee20dcdbbcb5a45a4c110642dc96d67748aea27450c74cdb4dd07cc20"
+
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/joe-editor/files/JOE%20sources/"
+UPSTREAM_CHECK_REGEX = "joe-(?P<pver>\d+(\.\d+)+)/"
+
diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
index 89b2dff0ba..d669f505cb 100644
--- a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
+++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
@@ -9,6 +9,11 @@ SRC_URI = "git://git.0pointer.net/libatasmart.git;protocol=http;branch=master \
            file://0001-Makefile.am-add-CFLAGS-and-LDFLAGS-definiton.patch \
 "

+# Upstream defunct: 0.19 (2012) is the last release and git.0pointer.net no
+# longer serves the repo (all requests redirect to a placeholder page), so
+# there is no listing or tag source to check.
+UPSTREAM_VERSION_UNKNOWN = "1"
+

 inherit autotools lib_package pkgconfig

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-20.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-20.bb
index 2f10a10931..1e18c5c191 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-20.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-20.bb
@@ -14,6 +14,10 @@ SRC_URI = " \
 "
 SRCREV = "47d67f43c58af36143060888fc8e69a9cb0eddea"

+# Upstream is dormant at 0.30; the Debian packaging repo we fetch from tags
+# releases as "debian/<upstream>-<debrev>", which PV mirrors.
+UPSTREAM_CHECK_GITTAGREGEX = "debian/(?P<pver>\d+(\.\d+)+-\d+)"
+
 EXTRA_OECONF = "\
     --enable-null \
     --disable-oss \
diff --git a/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb b/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb
index 20966a535c..b755c5d0b5 100644
--- a/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb
+++ b/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb
@@ -5,6 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=42fa47330d4051cd219f7d99d023de3a"
 SRC_URI = "https://github.com/libconfuse/libconfuse/releases/download/v${PV}/confuse-${PV}.tar.gz"
 SRC_URI[sha256sum] = "3a59ded20bc652eaa8e6261ab46f7e483bc13dad79263c15af42ecbb329707b8"

+UPSTREAM_CHECK_URI = "https://github.com/libconfuse/libconfuse/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
+
+
 SRC_URI += "file://0001-only-apply-search-path-logic-to-relative-pathnames.patch"
 SRC_URI += "file://CVE-2022-40320.patch"

diff --git a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
index 2bda6542ad..40dc084b23 100644
--- a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
+++ b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
@@ -13,5 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}.tar.gz \
            file://0001-Support-OpenSSL-1.1.0.patch \
            "
 SRC_URI[sha256sum] = "0df60157b052f0e774ade8a8bac59d6e8d4b464058cc55f9208d72e41156811f"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/liboauth/files/"
+UPSTREAM_CHECK_REGEX = "liboauth-(?P<pver>\d+(\.\d+)+)\.tar"

 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index ec26056b30..b57e9201c8 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -13,6 +13,9 @@ SRC_URI = "https://www.ibr.cs.tu-bs.de/projects/${BPN}/download/${BP}.tar.gz \
           "

 SRC_URI[sha256sum] = "f21accdadb1bb328ea3f8a13fc34d715baac6e2db66065898346322c725754d3"
+# Upstream download dir (ibr.cs.tu-bs.de) forbids scripted access and its newest
+# tarball is 0.4.8, below this recipe's 0.5.0 snapshot; no other release channel.
+UPSTREAM_VERSION_UNKNOWN = "1"

 UPSTREAM_CHECK_URI = "https://repology.org/project/libsmi/information"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index b91a455aff..cca9717f8b 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -15,6 +15,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'${PV}'.replace('.', '_')}.t
            file://CVE-2023-34194.patch \
 "
 SRC_URI[sha256sum] = "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593"
+# Upstream (SourceForge tinyxml) is dead at 2.6.2 (2011), its final release.
+UPSTREAM_VERSION_UNKNOWN = "1"

 S = "${UNPACKDIR}/tinyxml"

diff --git a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
index eca800dc5e..3689824583 100644
--- a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
+++ b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
@@ -10,6 +10,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
           "

 SRC_URI[sha256sum] = "5991020192f52cc40fa852fbf6bbf5bd5db5d5d00aa9905c67f6f0eadeed48ea"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4c/files/log4c/"
+UPSTREAM_CHECK_REGEX = "/(?P<pver>\d+(\.\d+)+)/"

 PACKAGECONFIG ??= "expat"
 PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat"
diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.6.bb b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.6.bb
index 72cca22ca1..40a12d106e 100644
--- a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.6.bb
+++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.6.bb
@@ -7,6 +7,8 @@ SRC_URI = "http://downloads.sourceforge.net/${BPN}/${BP}.tar.gz \
            file://fix-pc.patch;striplevel=2 \
           "
 SRC_URI[sha256sum] = "a036bc6bd6044479e6c456de7edd042b060ea5c843e47beb75f59baea9b20e3a"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cpp/files/log4cpp-1.1.x%20%28new%29/log4cpp-1.1/"
+UPSTREAM_CHECK_REGEX = "log4cpp-(?P<pver>\d+(\.\d+)+)\.tar"

 S = "${UNPACKDIR}/${BPN}"

diff --git a/meta-oe/recipes-support/mcelog/mce-test_git.bb b/meta-oe/recipes-support/mcelog/mce-test_git.bb
index 3b96210633..4a7a4664e0 100644
--- a/meta-oe/recipes-support/mcelog/mce-test_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-test_git.bb
@@ -18,6 +18,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-test.git;protocol=git;
 SRCREV = "9d11fc3e05eae7b454efeb5941beded56f80445b"
 PV = "20230601+git"

+# Upstream has a single ancient tag (v1.0) which is older than the snapshot
+# date used as PV, so tag-based checking cannot work; track commits instead.
+UPSTREAM_CHECK_COMMITS = "1"
+
 RDEPENDS:${PN} = "mcelog mce-inject dialog bash"

 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
diff --git a/meta-oe/recipes-support/minini/minini_1.2.b.bb b/meta-oe/recipes-support/minini/minini_1.2.b.bb
index 582f183938..9baa803382 100644
--- a/meta-oe/recipes-support/minini/minini_1.2.b.bb
+++ b/meta-oe/recipes-support/minini/minini_1.2.b.bb
@@ -17,6 +17,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb21481ad45c5578ae8c8d37b8c8d76d"
 SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/minini/minIni_12b.zip;subdir=${BP}"

 SRC_URI[sha256sum] = "b08839af74acb36061fb76e1123bf56711bc5cf7a08b32e189b0ad78a2e888e2"
+# Upstream lived on code.google.com (defunct); only archived zips remain, no
+# browsable release listing.
+UPSTREAM_VERSION_UNKNOWN = "1"

 do_configure[noexec] = "1"

diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
index 5fd927bc64..378451e54e 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
@@ -16,6 +16,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \

 SRC_URI[sha256sum] = "738b121b11f2b3f1744150c00cb381222eb6cf67161a7742797eb4f03e64a2ba"

+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/sipe/files/sipe/"
+UPSTREAM_CHECK_REGEX = "pidgin-sipe-(?P<pver>\d+(\.\d+)+)/"
+
 PACKAGECONFIG ??= "nss krb5"
 PACKAGECONFIG[nss] = "--enable-nss=yes,--enable-nss=no,nss"
 PACKAGECONFIG[openssl] = "--enable-openssl=yes,--enable-openssl=no,openssl"
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb b/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb
index af44864fa9..397ca3e4d0 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.14.bb
@@ -14,6 +14,9 @@ SRC_URI = "\

 SRC_URI[sha256sum] = "0ffc9994def10260f98a55cd132deefa8dc4a9835451cc0e982747bd458e2356"

+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/pidgin/files/Pidgin/"
+UPSTREAM_CHECK_REGEX = "Pidgin/(?P<pver>\d+(\.\d+)+)/"
+
 CVE_STATUS[CVE-2011-3594] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."

 PACKAGECONFIG ??= "gnutls consoleui avahi dbus idn nss \
diff --git a/meta-oe/recipes-support/psutils/psutils_2.10.bb b/meta-oe/recipes-support/psutils/psutils_2.10.bb
index 14792acaa5..bfb5cbe75b 100644
--- a/meta-oe/recipes-support/psutils/psutils_2.10.bb
+++ b/meta-oe/recipes-support/psutils/psutils_2.10.bb
@@ -4,6 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87212b5f1ae096371049a12f80034f32"
 SRC_URI = "https://github.com/rrthomas/psutils/releases/download/v${PV}/psutils-${PV}.tar.gz"
 SRC_URI[sha256sum] = "6f8339fd5322df5c782bfb355d9f89e513353220fca0700a5a28775404d7e98b"

+UPSTREAM_CHECK_URI = "https://github.com/rrthomas/psutils/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
+
 inherit perlnative autotools

 export PERL = "/usr/bin/env perl"
diff --git a/meta-oe/recipes-support/re2/re2_2025.11.05.bb b/meta-oe/recipes-support/re2/re2_2025.11.05.bb
index 91306b3621..21430a1f7f 100644
--- a/meta-oe/recipes-support/re2/re2_2025.11.05.bb
+++ b/meta-oe/recipes-support/re2/re2_2025.11.05.bb
@@ -12,6 +12,13 @@ SRC_URI = "git://github.com/google/re2.git;branch=main;protocol=https;tag=2025-1

 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(-\d+)+)"

+# The tag regex above does find the newest upstream tag (2025-11-05), but
+# upstream tags use "-" separators while PV uses ".", and bb.utils.vercmp_string
+# parses "2025-11-05" as version "2025-11" + revision "05", so the two can never
+# compare equal. Flag the version as unknown rather than permanently broken: a
+# genuinely newer upstream tag still shows up as KNOWN_BROKEN.
+UPSTREAM_VERSION_UNKNOWN = "1"
+
 DEPENDS = "abseil-cpp ${@bb.utils.contains('PTEST_ENABLED', '1', 'gtest googlebenchmark', '', d)}"

 inherit cmake ptest
diff --git a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
index c8f286d723..f61b7d4afc 100644
--- a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
+++ b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
@@ -13,7 +13,8 @@ SRC_URI = " \
 SRC_URI[sha256sum] = "81c3d07cf15ce50441f43a82cefd0ac32767c535b5291bcc41bd2311d1337644"
 S = "${UNPACKDIR}/${BP}-Source"

-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/srecord/files/releases"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/srecord/files/srecord/1.65/"
+UPSTREAM_CHECK_REGEX = "srecord-(?P<pver>\d+(\.\d+)+)-Source\.tar\.gz"

 DEPENDS = "boost libgcrypt"

diff --git a/meta-oe/recipes-support/stm32flash/stm32flash_0.7.bb b/meta-oe/recipes-support/stm32flash/stm32flash_0.7.bb
index 0998aa6778..f639b0b937 100644
--- a/meta-oe/recipes-support/stm32flash/stm32flash_0.7.bb
+++ b/meta-oe/recipes-support/stm32flash/stm32flash_0.7.bb
@@ -11,3 +11,8 @@ do_install() {
 }

 SRC_URI[sha256sum] = "c4c9cd8bec79da63b111d15713ef5cc2cd947deca411d35d6e3065e227dc414a"
+
+# downloads.sourceforge.net has no browsable listing, use the SF files page.
+# Regex excludes the 0.3beta/0.3beta2 tarballs and the win64 binary zips.
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/stm32flash/files/"
+UPSTREAM_CHECK_REGEX = "stm32flash-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
diff --git a/meta-oe/recipes-support/testdisk/testdisk_7.2.bb b/meta-oe/recipes-support/testdisk/testdisk_7.2.bb
index 66d0cd4d0d..e266a6b607 100644
--- a/meta-oe/recipes-support/testdisk/testdisk_7.2.bb
+++ b/meta-oe/recipes-support/testdisk/testdisk_7.2.bb
@@ -7,6 +7,11 @@ DEPENDS = "jpeg ncurses e2fsprogs"
 SRC_URI = "https://www.cgsecurity.org/${BP}.tar.bz2"
 SRC_URI[sha256sum] = "f8343be20cb4001c5d91a2e3bcd918398f00ae6d8310894a5a9f2feb813c283f"

+# The tarball sits at the site root which is not a browsable listing; the
+# download wiki page is where releases are announced
+UPSTREAM_CHECK_URI = "https://www.cgsecurity.org/wiki/TestDisk_Download"
+UPSTREAM_CHECK_REGEX = "testdisk-(?P<pver>\d+(\.\d+)+)\.tar\.bz2"
+
 inherit autotools pkgconfig
 COMPATIBLE_HOST:libc-musl = "null"

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index 02908b905a..aaa419afba 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -10,6 +10,11 @@ SRC_URI = " \
 SRC_URI[ucd.sha256sum] = "033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600"
 SRC_URI[ucd-license.sha256sum] = "e7a93b009565cfce55919a381437ac4db883e9da2126fa28b91d12732bc53d96"

+# The tarball name (UCD.zip) carries no version, so check the per-release
+# directories in the Public/zipped/ index instead.
+UPSTREAM_CHECK_URI = "https://www.unicode.org/Public/zipped/"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
+
 inherit allarch

 S = "${UNPACKDIR}"
diff --git a/meta-oe/recipes-support/usbids/usbids_2025.12.13.bb b/meta-oe/recipes-support/usbids/usbids_2025.12.13.bb
index ebaa1d1f99..27d88ee541 100644
--- a/meta-oe/recipes-support/usbids/usbids_2025.12.13.bb
+++ b/meta-oe/recipes-support/usbids/usbids_2025.12.13.bb
@@ -9,6 +9,10 @@ SRC_URI = "git://github.com/usbids/usbids.git;branch=master;protocol=https"
 # December 13, 2025
 SRCREV = "5de1427442504bc8e28d35cca5397d64ea177456"

+# The database is published as a rolling git repo with no tags or releases, so
+# track new commits instead.
+UPSTREAM_CHECK_COMMITS = "1"
+

 do_install() {
 	install -d ${D}${datadir}
diff --git a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
index e42b19a8d0..7ba33b7891 100644
--- a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
@@ -14,5 +14,11 @@ SRCREV = "9752b50e922572e4cd214ac45ed95e4ee410fe24"

 PV = "1.0.6+git"

+# bitmath.org only tags up to v1.0.5 while this recipe already tracks the 1.0.6
+# development head, so tag comparison always looks like a regression. Upstream
+# development moved to gitlab.freedesktop.org/libevdev/evemu (2.x), which is a
+# different source; track new commits on the current remote instead.
+UPSTREAM_CHECK_COMMITS = "1"
+

 PARALLEL_MAKE = ""
diff --git a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
index c8cfd884e2..5db32e6391 100644
--- a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
+++ b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
@@ -20,6 +20,11 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/xmlstar/${BP}.tar.gz \
 		   file://0001-Define-ATTRIBUTE_UNUSED-if-its-not-defined.patch"
 SRC_URI[sha256sum] = "15d838c4f3375332fd95554619179b69e4ec91418a3a5296e7c631b7ed19e7ca"

+# The SourceForge download mirror has no browsable listing; check the release
+# directories in the project's file area instead.
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/xmlstar/files/xmlstarlet/"
+UPSTREAM_CHECK_REGEX = "xmlstarlet/(?P<pver>\d+(\.\d+)+)/"
+
 inherit autotools

 # doc build: requires (native) xstlproc, fop, pdf2ps
diff --git a/meta-oe/recipes-test/fwts/fwts_22.11.00.bb b/meta-oe/recipes-test/fwts/fwts_22.11.00.bb
index 2448082620..29fe018a9f 100644
--- a/meta-oe/recipes-test/fwts/fwts_22.11.00.bb
+++ b/meta-oe/recipes-test/fwts/fwts_22.11.00.bb
@@ -16,6 +16,11 @@ SRC_URI = "http://fwts.ubuntu.com/release/fwts-V${PV}.tar.gz;subdir=${BP} \
            "
 SRC_URI[sha256sum] = "4af4e1e0f1ae9313297af722d744ba47a81c81bc5bdeab3f4f40837a39e4b808"

+# fwts.ubuntu.com no longer serves a browsable release listing (port 80/443
+# both refuse/time out), so track the upstream git release tags instead.
+UPSTREAM_CHECK_URI = "https://github.com/fwts/fwts/tags"
+UPSTREAM_CHECK_REGEX = "releases/tag/V(?P<pver>\d+(\.\d+)+)"
+
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|powerpc64).*-linux"

 DEPENDS = "libpcre glib-2.0 dtc bison-native flex-native libbsd"
diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index 3c123f9294..4bb3e60126 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -15,6 +15,10 @@ SRC_URI = " \
     file://0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch \
 "

+# git.linaro.org no longer serves this repo (HTTP 504) and there is no
+# replacement upstream, so no version can be resolved.
+UPSTREAM_VERSION_UNKNOWN = "1"
+

 CFLAGS += "-pthread"

diff --git a/meta-oe/recipes-test/trompeloeil/trompeloeil_v49.bb b/meta-oe/recipes-test/trompeloeil/trompeloeil_v49.bb
index adb3237621..bca48e0161 100644
--- a/meta-oe/recipes-test/trompeloeil/trompeloeil_v49.bb
+++ b/meta-oe/recipes-test/trompeloeil/trompeloeil_v49.bb
@@ -5,6 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"

 SRC_URI = "git://github.com/rollbear/trompeloeil.git;branch=main;protocol=https;tag=${PV}"
 SRCREV = "eaeb89c1ce9d354b0ba7eb921fd5712cdbd78adf"
+# PV carries the leading "v" (v49), and git URIs don't strip it, so the check
+# regex must capture the "v" too for the versions to compare equal.
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>v\d+)"


 inherit cmake

