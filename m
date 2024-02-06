Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1A5C4829A
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 13:28:26 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.21267.1707226099843751045
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 05:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z3Z5SfCe;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-339289fead2so640632f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 05:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707226098; x=1707830898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ca9C2gt067n9zY5HGRYC6uY5bwGnPmMUuG9Sj0WdeI=;
        b=Z3Z5SfCeK29vUxyOENxVXKwWV8OthHd6rZ05/uzLtCq+QoZnKpKvhPogah2On3mYgZ
         1Qc36QmC0AG/Nrw4HTfln4p+KXJA5kWA275Lg/b+H16WPb3mj3nVaONkrULNToIwLNre
         LnClY5wK7TgS1lU8IrgT4XhkeGjaOrHwVN2KkxBerKnJq7yULn/i48JUxAfOwqnoNNL8
         Sw839aUaTonD/p6YTtqZiUWK/UQzrS24adcaAh/twTVC9RoTDVIBTALQzAp4xblrDCjv
         NATwpQfHOBdQaEtFUPt5c4bNkZ05lO/9C/KhdsEV24mVDgxQ3aMH8TLfdnHqHG9HbgXD
         lvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707226098; x=1707830898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ca9C2gt067n9zY5HGRYC6uY5bwGnPmMUuG9Sj0WdeI=;
        b=nGPG1uA3TDmrsszBR6Dfs8lb0SKuY3NSvUgxvHX1QMcbx9l/Cm5YpdulMbWkOO/nv8
         wiWC0xEmflCIBrlYbsO4JzVMRdbHWWXJZDMCCsI+SOmNcIWgGSZVlwDw8ggsMiGWveBl
         bYNL5J8rRNZ2INP2t6DwLcf5VM/Plui95hqs6EQCx8Xrbhrz53L/J/wibRt12mwNu3bG
         UkD3hh0JMQaKu1xFSnJ4okYpQbO7ZGqVAnhNjFn33pR4AJhiIMmb+fukGpQqfdyxHHBR
         gWAEzDI7jAEmrQAEbAVqXxS0UHtH5GgZOzkdZxIGl4UQoFFtjXh0LizCizKwEqQZKsxS
         PAww==
X-Gm-Message-State: AOJu0YzdzE9zF8/TtV0TZe30sPr4Gt5ci+CB5rBfG2OsQrsVP/mxzxeb
	tb2KlIqblfORZePaLf6rvtQ1LWxOHlBEK11ksPJ3D1DHpsXhFFdLFCXDhJp1
X-Google-Smtp-Source: AGHT+IEYwzZ2UhcfmeVCYZ88Qg/u8sDU78XGkZRTrsr+UpQN3J9YGOwqNMhD6sAFm6GHd6XdZbJYgQ==
X-Received: by 2002:a5d:4c8f:0:b0:33b:4649:9943 with SMTP id z15-20020a5d4c8f000000b0033b46499943mr1495655wrs.52.1707226097381;
        Tue, 06 Feb 2024 05:28:17 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q11-20020adfab0b000000b0033b2276e71csm2127779wrc.62.2024.02.06.05.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 05:28:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][RFC][PATCH 1/5] recipes: drop ${SRCPV} usage
Date: Tue,  6 Feb 2024 14:28:08 +0100
Message-ID: <20240206132812.1362456-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 13:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108628

* Drop SRCPV similarly like oe-core did in:
  https://git.openembedded.org/openembedded-core/commit/?h=nanbield&id=843f82a246a535c353e08072f252d1dc78217872

* SRCPV is deferred now from PV to PKGV since:
  https://git.openembedded.org/openembedded-core/commit/?h=nanbield&id=a8e7b0f932b9ea69b3a218fca18041676c65aba0

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb | 2 +-
 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb       | 2 +-
 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb | 2 +-
 meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb           | 2 +-
 meta-gnome/recipes-support/keybinder/keybinder_3.0.bb           | 2 +-
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb           | 2 +-
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb    | 2 +-
 meta-multimedia/recipes-dvb/oscam/oscam_svn.bb                  | 2 +-
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb          | 2 +-
 meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb     | 2 +-
 .../recipes-multimedia/dleyna/dleyna-server_0.6.0.bb            | 2 +-
 meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb   | 2 +-
 .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb        | 2 +-
 .../recipes-support/gst-instruments/gst-instruments_git.bb      | 2 +-
 meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb     | 2 +-
 meta-networking/recipes-connectivity/bluepy/bluepy_git.bb       | 2 +-
 .../recipes-connectivity/openthread/ot-br-posix_git.bb          | 2 +-
 .../recipes-connectivity/openthread/ot-daemon_git.bb            | 2 +-
 meta-networking/recipes-connectivity/openthread/wpantund_git.bb | 2 +-
 meta-networking/recipes-connectivity/relayd/relayd_git.bb       | 2 +-
 meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb           | 2 +-
 meta-networking/recipes-protocols/openflow/openflow_git.bb      | 2 +-
 meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb    | 2 +-
 meta-networking/recipes-support/arptables/arptables_git.bb      | 2 +-
 meta-networking/recipes-support/celt051/celt051_git.bb          | 2 +-
 .../recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb         | 2 +-
 .../recipes-support/lowpan-tools/lowpan-tools_git.bb            | 2 +-
 meta-networking/recipes-support/netcf/netcf_0.2.8.bb            | 2 +-
 meta-networking/recipes-support/netperf/netperf_git.bb          | 2 +-
 meta-networking/recipes-support/ntimed/ntimed_git.bb            | 2 +-
 meta-networking/recipes-support/phytool/phytool.bb              | 2 +-
 .../dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb   | 2 +-
 .../meta-python/recipes-extended/lcdproc/lcdproc_git.bb         | 2 +-
 meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb            | 2 +-
 meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb          | 2 +-
 meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb      | 2 +-
 meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb                | 2 +-
 meta-oe/recipes-bsp/firmwared/firmwared_git.bb                  | 2 +-
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb             | 2 +-
 .../libimobiledevice-glue/libimobiledevice-glue_git.bb          | 2 +-
 .../libimobiledevice/libimobiledevice_git.bb                    | 2 +-
 meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb   | 2 +-
 meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb           | 2 +-
 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb             | 2 +-
 meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb              | 2 +-
 meta-oe/recipes-core/glfw/glfw_3.3.8.bb                         | 2 +-
 meta-oe/recipes-core/libnfc/libnfc_git.bb                       | 2 +-
 meta-oe/recipes-core/mdbus2/mdbus2_git.bb                       | 2 +-
 meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb           | 2 +-
 meta-oe/recipes-core/opencl/opencl-clhpp_git.bb                 | 2 +-
 meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb    | 2 +-
 meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb              | 2 +-
 meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb   | 2 +-
 meta-oe/recipes-devtools/guider/guider_3.9.8.bb                 | 2 +-
 meta-oe/recipes-devtools/libubox/libubox_git.bb                 | 2 +-
 meta-oe/recipes-devtools/lshw/lshw_02.20.bb                     | 2 +-
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb                   | 2 +-
 meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb     | 2 +-
 meta-oe/recipes-devtools/openocd/openocd_git.bb                 | 2 +-
 meta-oe/recipes-devtools/pmtools/pmtools_git.bb                 | 2 +-
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb             | 2 +-
 meta-oe/recipes-devtools/yasm/yasm_git.bb                       | 2 +-
 meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb           | 2 +-
 meta-oe/recipes-extended/figlet/figlet_git.bb                   | 2 +-
 meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb         | 2 +-
 meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb       | 2 +-
 meta-oe/recipes-extended/libimobiledevice/libplist_git.bb       | 2 +-
 meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb     | 2 +-
 meta-oe/recipes-extended/libuio/libuio_0.2.1.bb                 | 2 +-
 meta-oe/recipes-extended/md5deep/md5deep_git.bb                 | 2 +-
 meta-oe/recipes-extended/mraa/mraa_git.bb                       | 2 +-
 meta-oe/recipes-extended/p8platform/p8platform_git.bb           | 2 +-
 meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb   | 2 +-
 meta-oe/recipes-extended/qad/qad_git.bb                         | 2 +-
 meta-oe/recipes-extended/qcbor/qcbor_git.bb                     | 2 +-
 meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb               | 2 +-
 meta-oe/recipes-extended/socketcan/can-isotp_git.bb             | 2 +-
 meta-oe/recipes-extended/tipcutils/tipcutils_git.bb             | 2 +-
 meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb       | 2 +-
 meta-oe/recipes-extended/upm/upm_git.bb                         | 2 +-
 meta-oe/recipes-extended/zsync/zsync-curl_git.bb                | 2 +-
 meta-oe/recipes-graphics/aml/aml_git.bb                         | 2 +-
 meta-oe/recipes-graphics/fbida/fbida_git.bb                     | 2 +-
 meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb                     | 2 +-
 meta-oe/recipes-graphics/openbox/obconf_git.bb                  | 2 +-
 .../parallel-deqp-runner/parallel-deqp-runner_git.bb            | 2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb             | 2 +-
 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb                | 2 +-
 meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb                | 2 +-
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb         | 2 +-
 .../recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb    | 2 +-
 meta-oe/recipes-support/cli11/cli11_2.3.2.bb                    | 2 +-
 meta-oe/recipes-support/edid-decode/edid-decode_git.bb          | 2 +-
 meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb          | 2 +-
 meta-oe/recipes-support/function2/function2_4.2.4.bb            | 2 +-
 meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb       | 2 +-
 meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb    | 2 +-
 meta-oe/recipes-support/iksemel/iksemel_1.5.bb                  | 2 +-
 meta-oe/recipes-support/iniparser/iniparser_4.1.bb              | 2 +-
 meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb                | 2 +-
 meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb            | 2 +-
 meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb    | 2 +-
 meta-oe/recipes-support/libfann/libfann_git.bb                  | 2 +-
 meta-oe/recipes-support/libusbgx/libusbgx_git.bb                | 2 +-
 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb              | 2 +-
 meta-oe/recipes-support/mcelog/mce-test_git.bb                  | 2 +-
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb                      | 2 +-
 meta-oe/recipes-support/picocom/picocom_git.bb                  | 2 +-
 meta-oe/recipes-support/pidgin/icyque_git.bb                    | 2 +-
 meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb           | 2 +-
 meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb       | 2 +-
 meta-oe/recipes-support/serial-utils/pty-forward-native.bb      | 2 +-
 meta-oe/recipes-support/serial-utils/serial-forward_git.bb      | 2 +-
 meta-oe/recipes-support/synergy/synergy_git.bb                  | 2 +-
 meta-oe/recipes-support/utouch/utouch-evemu_git.bb              | 2 +-
 meta-oe/recipes-support/utouch/utouch-frame_git.bb              | 2 +-
 meta-oe/recipes-support/utouch/utouch-mtview_git.bb             | 2 +-
 meta-oe/recipes-support/zbar/zbar_git.bb                        | 2 +-
 meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb                     | 2 +-
 meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb | 2 +-
 meta-python/recipes-devtools/gyp/gyp_git.bb                     | 2 +-
 meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb | 2 +-
 meta-webserver/recipes-httpd/cherokee/cherokee_git.bb           | 2 +-
 123 files changed, 123 insertions(+), 123 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index 6bf321e237..7228172b80 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://utils/mkyaffs2image.c;beginline=11;endline=13;md5=5f5
                     file://utils/mkyaffsimage.c;beginline=10;endline=12;md5=5f5464f9b3e981ca574e65b00e438561 \
                     "
 
-PV = "0.0+git${SRCPV}"
+PV = "0.0+git"
 
 DEPENDS = "mtd-utils"
 
diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index fbf7753b02..ad846af470 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -19,7 +19,7 @@ SRC_URI[aufs_type.sha256sum] = "7ff6566adb9c7a3b6862cdc85a690ab546f1d0bc81ddd595
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-PV = "4.9+git${SRCPV}"
+PV = "4.9+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
index ca2ec9cc4f..47613207af 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
@@ -7,7 +7,7 @@ SRC_URI = "\
     git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master \
 "
 
-PV = "1.0+git${SRCPV}"
+PV = "1.0+git"
 SRCREV = "b5e5a829895ac98ccfe4629fbfbd8b819262bd00"
 
 S = "${WORKDIR}/git"
diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
index 01900cce39..90c12efadf 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=00aefaa50aad75c21367df66102d542c \
 
 DEPENDS = "gtk+ glib-2.0 libwnck libxinerama lua virtual/libx11"
 
-PV .= "+git${SRCPV}"
+PV .= "+git"
 
 SRCREV = "b9d7ad9c09a5fb17a1562ee1d892798c646e9ec9"
 
diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
index 278592dc6e..7960009078 100644
--- a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
+++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f18f9c6d8b4cfcc7d7804a243a4c0b4"
 S = "${WORKDIR}/git"
 
 SRCREV = "736ccef40d39603b8111c8a3a0bca0319bbafdc0"
-PV = "3.0+git${SRCPV}"
+PV = "3.0+git"
 SRC_URI = "git://github.com/engla/keybinder.git;branch=keybinder-3.0;protocol=https \
 "
 
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index 62d1effccc..a92c0e8966 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "kexecboot is a graphical linux-as-bootloader implementation based
 HOMEPAGE = "https://github.com/kexecboot/kexecboot/wiki"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PV = "0.6+git${SRCPV}"
+PV = "0.6+git"
 S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/kexecboot/kexecboot.git;branch=master;protocol=https"
 SRC_URI:append:libc-klibc = "\
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index 5c7e84cc99..adfc3ba73a 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -5,7 +5,7 @@ SECTION = "kernel/userland"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
                     file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
-PV = "2.0.18+git${SRCPV}"
+PV = "2.0.18+git"
 
 DEPENDS = "zlib xz"
 
diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
index bd2df5d8d6..8fbf9ab2c8 100644
--- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
@@ -9,7 +9,7 @@ DEPENDS = "libusb1 openssl pcsc-lite"
 SRC_URI = "svn://www.streamboard.tv/svn/oscam;module=trunk;protocol=http \
            "
 SRCREV = "11718"
-PV = "1.10+${SRCPV}"
+PV = "1.10+"
 
 S = "${WORKDIR}/trunk"
 
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index d64ee96f78..2d79777001 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/tvheadend/tvheadend.git;branch=master;protocol=https
            "
 
 SRCREV = "cc602833684953fc3e6f1c89d4f08f6dfef179e3"
-PV = "4.3+git${SRCPV}"
+PV = "4.3+git"
 PKGV = "4.3+git${GITPKGV}"
 
 S = "${WORKDIR}/git"
diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
index ab0d8bca9f..5007c88fff 100644
--- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
+++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8449a4f133a93f6254b496d4fb476e83"
 SRC_URI = "git://github.com/Arkq/bluez-alsa.git;protocol=https;branch=master"
 
 SRCREV = "dd05a1baa261b94da9ba977b5e3392c8b4dc7a5e"
-PV = "4.0.0+git${SRCPV}"
+PV = "4.0.0+git"
 
 S  = "${WORKDIR}/git"
 
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
index 719aecede1..b0a347f252 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4 libxml2 dleyna-core"
 RDEPENDS:${PN} = "dleyna-connector-dbus"
 
-PV .= "+git${SRCPV}"
+PV .= "+git"
 SRC_URI = "git://github.com/01org/${BPN}.git;branch=master;protocol=https"
 SRCREV = "eb895ae82715e9889a948ffa810c0f828b4f4c76"
 S = "${WORKDIR}/git"
diff --git a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
index fb74881c03..3d631ea0b6 100644
--- a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
+++ b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "The squish library (abbreviated to libsquish) is an open source DXT c
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://alpha.cpp;beginline=3;endline=22;md5=6665e479f71feb92d590ea9ae9b9f6d5"
 
-PV = "1.10+git${SRCPV}"
+PV = "1.10+git"
 
 SRCREV = "52e7d93c5947f72380521116c05d97c528863ba8"
 SRC_URI = "git://github.com/OpenELEC/libsquish.git;protocol=https;branch=master \
diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index 3b365444e2..e8b10bc680 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24"
 DEPENDS = "expat libxml2 libxml2-native neon neon-native libmusicbrainz-native"
 
-PV = "5.1.0+git${SRCPV}"
+PV = "5.1.0+git"
 
 SRCREV = "8be45b12a86bc0e46f2f836c8ac88e1e98d82aee"
 SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git;branch=master;protocol=https \
diff --git a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
index 8f0ad65120..df688bbcda 100644
--- a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
+++ b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02"
 DEPENDS = "gstreamer1.0"
 SRCREV = "cb8977a6711657e32853159cd539d1d75fcbc772"
-PV = "0.3.1+git${SRCPV}"
+PV = "0.3.1+git"
 
 SRC_URI = "git://github.com/kirushyk/gst-instruments.git;protocol=https;branch=master"
 
diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
index 1e70a3dec6..39569e9d06 100644
--- a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
+++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
@@ -23,7 +23,7 @@ inherit lib_package
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fc37e1037ae673975fbcb96a98f7191"
 
-PV .= "+git${SRCPV}"
+PV .= "+git"
 SRCREV = "79c060eea3eea1257797f15ea1608a9a9923aa6f"
 SRC_URI = "git://www.bearssl.org/git/BearSSL;protocol=https;branch=master \
            file://0002-test-test_x509.c-fix-potential-overflow-issue.patch \
diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
index 8e164708ed..5b784d9a04 100644
--- a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
+++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only & PD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=59e0d45ea684dda215889aa1b5acd001"
 DEPENDS = "glib-2.0"
 SRCREV = "7ad565231a97c304c0eff45f2649cd005e69db09"
-PV = "1.3.0+git${SRCPV}"
+PV = "1.3.0+git"
 
 SRC_URI = "git://github.com/IanHarvey/bluepy.git;protocol=https;branch=master \
            file://0001-bluepy-Fix-username-issue-with-tarballs.patch \
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index 720228dc14..71e5a8d43b 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=87109e44b2fda96a8991f27684a7349c \
                     "
 DEPENDS = "autoconf-archive dbus readline avahi jsoncpp boost libnetfilter-queue"
 SRCREV = "ad6822257ffddbac295db97186e4ab449a2ed32a"
-PV = "0.3.0+git${SRCPV}"
+PV = "0.3.0+git"
 
 SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=main \
            file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch \
diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
index 18703d6c4d..1583a3f837 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=543b6fe90ec5901a683320a36390c65f \
                     "
 DEPENDS = "readline"
 SRCREV = "7dfde1f12923f03c9680be4d838b94b7a2320324"
-PV = "0.1+git${SRCPV}"
+PV = "0.1+git"
 
 SRC_URI = "git://github.com/openthread/openthread.git;protocol=https;branch=main \
            file://0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch \
diff --git a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
index ebb3fc3c1c..b75d686e58 100644
--- a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e7820bc7f7d1638a6b54fc2e8d7fb103 \
                     "
 DEPENDS = "autoconf-archive dbus readline boost"
 SRCREV = "0fb1f57e4224e2df3e630e146702bfcf63fbf07a"
-PV = "0.07.01+git${SRCPV}"
+PV = "0.07.01+git"
 
 SRC_URI = "gitsm://github.com/openthread/wpantund.git;protocol=https;branch=master \
            "
diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
index 79e1743fdf..871df69909 100644
--- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
+++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
@@ -8,7 +8,7 @@ DEPENDS = "libubox"
 SRC_URI = "git://git.openwrt.org/project/relayd.git;branch=master"
 
 SRCREV = "f646ba40489371e69f624f2dee2fc4e19ceec00e"
-PV = "0.0.1+git${SRCPV}"
+PV = "0.0.1+git"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
index 19bd32ccd4..d075ec4788 100644
--- a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
+++ b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 DEPENDS = "libnfnetlink"
 PROVIDES = "ulogd"
 
-PV .= "+git${SRCPV}"
+PV .= "+git"
 
 SRC_URI = "git://git.netfilter.org/ulogd2;branch=master \
            file://ulogd.init \
diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
index 1ac5dd4105..f39888e8f1 100644
--- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -1,7 +1,7 @@
 include ${BPN}.inc
 
 SRCREV = "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
-PV = "1.0+git${SRCPV}"
+PV = "1.0+git"
 
 SRC_URI += "file://0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch \
            file://0002-lib-netdev-Adjust-header-include-sequence.patch \
diff --git a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb
index 812f4fbcf0..71d738ddc1 100644
--- a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb
+++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb
@@ -13,7 +13,7 @@ inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
 DEPENDS = "libnl libconfig readline"
 
 SRCREV = "85e55837a81d710e5baa7da47f7ed0d205c8ede5"
-PV .= "+git${SRCPV}"
+PV .= "+git"
 SRC_URI = "git://github.com/intel/openlldp.git;protocol=https;branch=branch-1.1 \
            file://0001-Fix-musl-libc-build-issue.patch \
            file://0001-autotools-Add-include-path-to-generated-version.h.patch \
diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
index 898b69682d..949794bf30 100644
--- a/meta-networking/recipes-support/arptables/arptables_git.bb
+++ b/meta-networking/recipes-support/arptables/arptables_git.bb
@@ -3,7 +3,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 SRCREV = "efae8949e31f8b2eb6290f377a28384cecaf105a"
-PV = "0.0.5+git${SRCPV}"
+PV = "0.0.5+git"
 
 SRC_URI = " \
     git://git.netfilter.org/arptables;branch=master \
diff --git a/meta-networking/recipes-support/celt051/celt051_git.bb b/meta-networking/recipes-support/celt051/celt051_git.bb
index 62682cfce3..4842a0fbdf 100644
--- a/meta-networking/recipes-support/celt051/celt051_git.bb
+++ b/meta-networking/recipes-support/celt051/celt051_git.bb
@@ -12,7 +12,7 @@ like Speex, GSM, or G.729."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=375f60ab360d17f0172737036ff155b2"
 
-PV = "0.5.1.3+git${SRCPV}"
+PV = "0.5.1.3+git"
 
 SRCREV = "5555aae843f57241d005e330b9cb65602d56db0f"
 
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
index 4a9d2f54d9..3f945eeeee 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 
 SRCREV = "05b50d379ff0037de4957bb2a1befcce88b70225"
 
-PV .= "+git${SRCPV}"
+PV .= "+git"
 LK_REL = "1.0.19"
 
 SRC_URI = " \
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index baaff1f219..f0b7e9184e 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "flex-native bison-native libnl python"
 
-PV = "0.3.1+git${SRCPV}"
+PV = "0.3.1+git"
 SRC_URI = "git://github.com/linux-wpan/lowpan-tools;branch=master;protocol=https \
            file://no-help2man.patch \
            file://0001-Fix-build-errors-with-clang.patch \
diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
index f60bb9f104..59ce3e9991 100644
--- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
+++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
 
 SRCREV = "2c5d4255857531bc09d91dcd02e86545f29004d4"
-PV .= "+git${SRCPV}"
+PV .= "+git"
 
 SRC_URI = "git://pagure.io/netcf.git;protocol=https;branch=master \
 "
diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
index 4074f0cd07..6e459eeeb4 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.netperf.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e661ab33a2a71ad6652c178dedf8aaa2"
 
-PV = "2.7.0+git${SRCPV}"
+PV = "2.7.0+git"
 
 SRC_URI = "git://github.com/HewlettPackard/netperf.git;branch=master;protocol=https \
            file://cpu_set.patch \
diff --git a/meta-networking/recipes-support/ntimed/ntimed_git.bb b/meta-networking/recipes-support/ntimed/ntimed_git.bb
index 9badfd75d1..955c03f42d 100644
--- a/meta-networking/recipes-support/ntimed/ntimed_git.bb
+++ b/meta-networking/recipes-support/ntimed/ntimed_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://main.c;beginline=2;endline=24;md5=89db8e76f2951f3fad1
 SRC_URI = "git://github.com/bsdphk/Ntimed;branch=master;protocol=https \
            file://use-ldflags.patch"
 
-PV = "0.0+git${SRCPV}"
+PV = "0.0+git"
 SRCREV = "db0abbb4c80f2ecef6bc5d9639bca5bea28532a2"
 
 S = "${WORKDIR}/git"
diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-networking/recipes-support/phytool/phytool.bb
index c2c4335910..b918e50c68 100644
--- a/meta-networking/recipes-support/phytool/phytool.bb
+++ b/meta-networking/recipes-support/phytool/phytool.bb
@@ -2,7 +2,7 @@ SUMMARY = "PHY interface tool for Linux"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
 
-PV = "2+git${SRCPV}"
+PV = "2+git"
 SRCREV = "8882328c08ba2efb13c049812098f1d0cb8adf0c"
 SRC_URI = "git://github.com/wkz/phytool.git;branch=master;protocol=https"
 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
index bff82fe35d..90c9a7147c 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS += "fmt libinih"
 
-PV .= "+git${SRCPV}"
+PV .= "+git"
 
 SRCREV = "8416326777b2aada0706539b8f9f6acefa476b16"
 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
index 4cae4947f2..c29c51a2ae 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
@@ -9,7 +9,7 @@ DEPENDS = "ncurses lirc"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
                     file://README.md;beginline=107;md5=5db392f043253a2d64b1737068ce6b58"
 
-PV = "0.5.9+git${SRCPV}"
+PV = "0.5.9+git"
 SRCREV = "0e2ce9b9c46c47363436f9ee730f7c71bf455f0f"
 SRC_URI = "git://github.com/lcdproc/lcdproc;branch=master;protocol=https"
 
diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
index 7969af6c37..c58524aa64 100644
--- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
+++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
@@ -7,7 +7,7 @@ PROVIDES += "cpuburn-neon"
 
 SRCREV = "ad7e646700d14b81413297bda02fb7fe96613c3f"
 
-PV = "1.0+git${SRCPV}"
+PV = "1.0+git"
 
 SRC_URI = "git://github.com/ssvb/cpuburn-arm.git;branch=master;protocol=https \
            file://0001-cpuburn-a8.S-Remove-.func-.endfunc.patch \
diff --git a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb b/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
index 17bbb9b6ce..4ace4515ad 100644
--- a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
+++ b/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9a825c63897c53f487ef900598c31527"
 
 SRCREV = "b6b2ce5f9f87a09b14499cb00c600c601f022634"
-PV = "20110206+git${SRCPV}"
+PV = "20110206+git"
 
 SRC_URI = "git://git.musl-libc.org/libc-bench;branch=master \
            file://0001-build-Do-not-override-ldflags-from-environment.patch \
diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
index 025aacf251..200a0de849 100644
--- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/ssvb/tinymembench/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://main.c;endline=22;md5=879b9bbb60851454885b5fa47eb6b345"
 
-PV = "0.4.9+git${SRCPV}"
+PV = "0.4.9+git"
 
 SRCREV = "a2cf6d7e382e3aea1eb39173174d9fa28cad15f3"
 SRC_URI = "git://github.com/ssvb/tinymembench.git;branch=master;protocol=https \
diff --git a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
index 455859ec86..03076cbc60 100644
--- a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
+++ b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = " sysfsutils"
 
 SRCREV = "1c57818ecee186aa47af0342149577df5302c022"
-PV = "0.18+git${SRCPV}"
+PV = "0.18+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
index e8b491a435..0a041835e1 100644
--- a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
+++ b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=7b486c2338d225a1405d979ed2c15ce8 \
 SRC_URI = "git://github.com/teg/firmwared.git;branch=master;protocol=https \
            file://firmwared.service"
 
-PV = "0+git${SRCPV}"
+PV = "0+git"
 SRCREV = "2e6b5db43d63a5c0283a4cae9a6a20b7ad107a04"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index aec41edf7a..f54d833a01 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://CMakeLists.txt;beginline=1;endline=6;md5=a87ee154f005
 DEPENDS = "bluez5 glib-2.0"
 DEPENDS += "glib-2.0-native"
 
-PV = "0.2+git${SRCPV}"
+PV = "0.2+git"
 
 SRC_URI = "git://github.com/labapart/gattlib.git;branch=master;protocol=https \
            file://dbus-avoid-strange-chars-from-the-build-dir.patch \
diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
index b63aabdc0c..d37c547c98 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libplist"
 
-PV = "1.0.0+git${SRCPV}"
+PV = "1.0.0+git"
 
 SRCREV = "114098d30e783fbb3def5c9b49427a86621cfcb1"
 SRC_URI = "git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master"
diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
index 1a0590c57b..b8d7e8872b 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libplist usbmuxd libusbmuxd libtasn1 gnutls libgcrypt libimobiledevice-glue openssl"
 
-PV = "1.3.0+git${SRCPV}"
+PV = "1.3.0+git"
 
 SRCREV = "860ffb707af3af94467d2ece4ad258dda957c6cd"
 SRC_URI = "git://github.com/libimobiledevice/libimobiledevice;protocol=https;branch=master \
diff --git a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
index 7bac3117cd..3549cac568 100644
--- a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
+++ b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1-or-later.txt;md5=4fbd65380cdd255951
 
 SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib.git;protocol=https;branch=qrtr-1-2"
 
-PV = "1.2.2+git${SRCPV}"
+PV = "1.2.2+git"
 SRCREV = "8991f0e93713ebf4da48ae4f23940ead42f64c8c"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
index d5411b19b2..d9cca404d7 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
@@ -8,7 +8,7 @@ DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurse
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https"
 SRCREV = "d067bd802e44f0e6a747aabcc311ada2175fd550"
 
-PV = "0.9.8+git${SRCPV}"
+PV = "0.9.8+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
index 1492234495..569d6a41cf 100644
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
@@ -9,7 +9,7 @@ DEPENDS = "udev libusb1 libplist libimobiledevice-glue"
 inherit autotools pkgconfig gitpkgv systemd
 
 PKGV = "${GITPKGVTAG}"
-PV = "1.1.2+git${SRCPV}"
+PV = "1.1.2+git"
 
 SRCREV = "01c94c77f59404924f1c46d99c4e5e0c7817281b"
 SRC_URI = "git://github.com/libimobiledevice/usbmuxd;protocol=https;branch=master"
diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
index d096cd618e..122a3f9916 100644
--- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://dbus-daemon-proxy.c;endline=19;md5=41df6d21fe1c97d6a1cc22a5bf374cba"
 DEPENDS = "dbus dbus-glib"
 SRCREV = "1226a0a1374628ff191f6d8a56000be5e53e7608"
-PV = "0.0.0+gitr${SRCPV}"
+PV = "0.0.0+gitr"
 PR = "r1.59"
 
 SRC_URI = "git://github.com/alban/dbus-daemon-proxy;branch=master;protocol=https \
diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.8.bb b/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
index ad7a3a7ed4..684355ef3e 100644
--- a/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
+++ b/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
@@ -10,7 +10,7 @@ SECTION = "lib"
 
 inherit pkgconfig cmake features_check
 
-PV .= "+git${SRCPV}"
+PV .= "+git"
 SRCREV = "7482de6071d21db77a7236155da44c172a7f6c9e"
 SRC_URI = "git://github.com/glfw/glfw.git;branch=3.3-stable;protocol=https"
 
diff --git a/meta-oe/recipes-core/libnfc/libnfc_git.bb b/meta-oe/recipes-core/libnfc/libnfc_git.bb
index 9733749628..a97a2841f7 100644
--- a/meta-oe/recipes-core/libnfc/libnfc_git.bb
+++ b/meta-oe/recipes-core/libnfc/libnfc_git.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 
 inherit autotools pkgconfig
 
-PV = "1.8.0+git${SRCPV}"
+PV = "1.8.0+git"
 
 S = "${WORKDIR}/git"
 SRCREV = "f02ff51449240102c27a97173dc495e8e7789046"
diff --git a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
index c6db78b4ab..a7ac358f27 100644
--- a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
+++ b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07"
 
 DEPENDS = "readline"
 
-PV = "2.3.3+git${SRCPV}"
+PV = "2.3.3+git"
 
 SRC_URI = "git://github.com/freesmartphone/mdbus.git;protocol=https;branch=master \
            file://0001-Fix-arguments-in-GLib.DBusSignalCallback-for-Vala-0..patch \
diff --git a/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb b/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
index 163a74ebe3..0bb45b8eaf 100644
--- a/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
+++ b/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=81a81bf31abecc50c20862fc8a716329"
 
 SRC_URI = "gitsm://github.com/pullmoll/musl-rpmatch.git;protocol=https;branch=master"
 
-PV = "1.0+git${SRCPV}"
+PV = "1.0+git"
 SRCREV = "46267b154987d3e1f25d3a75423faa62bb5ee342"
 
 inherit autotools
diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
index 8a712602cc..7ae0362d37 100644
--- a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https;branch=
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-PV = "2.0.16+git${SRCPV}"
+PV = "2.0.16+git"
 SRCREV = "1df82b9749739f2681081092ae163bb0f0d40f66"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
index df6ca75461..d3922cf79e 100644
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/OpenSC/${BPN}.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 # master
 SRCREV = "8bed16034f629a0361fa8ff89deed2b43dc45d8b"
-PV .= "+1.30.0+git${SRCPV}"
+PV .= "+1.30.0+git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "pkcs11-helper-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb b/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
index aed7977595..d872c4dbb5 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
                     file://thirdparty/snappy/COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
 
 SRCREV = "9352fc02bba106fbbeef9e8452ef34643c0d0764"
-PV .= "+11.1+git${SRCPV}"
+PV .= "+11.1+git"
 SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
           "
 
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index 277fac9f7c..47a3d88853 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-2-Clause & Apache-2.0"
 HOMEPAGE = "http://concurrencykit.org"
 SECTION = "base"
 
-PV = "0.7.0+git${SRCPV}"
+PV = "0.7.0+git"
 SRCREV = "6e8e5bec2e2f8cef2072a68579cbb07ababf3331"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0b24c1a8f9ad516a297d055b0294231"
 SRC_URI = "git://github.com/concurrencykit/ck.git;branch=master;protocol=https \
diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
index 15d43e9790..0d93297a07 100644
--- a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://github.com/iipeace/guider/issues"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
 
-PV = "3.9.8+git${SRCPV}"
+PV = "3.9.8+git"
 
 SRC_URI = "git://github.com/iipeace/${BPN};branch=master;protocol=https"
 SRCREV = "a502cd93b13235b7539557a91328de00b7c51bc3"
diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/recipes-devtools/libubox/libubox_git.bb
index b2898c9c7f..39e18cdafd 100644
--- a/meta-oe/recipes-devtools/libubox/libubox_git.bb
+++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
 "
 
 SRCREV = "07413cce72e19520af55dfcbc765484f5ab41dd9"
-PV = "1.0.1+git${SRCPV}"
+PV = "1.0.1+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.20.bb b/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
index 70ae38caa2..0fb68d8684 100644
--- a/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
+++ b/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64|riscv64).*-linux"
 
-PV .= "+git${SRCPV}"
+PV .= "+git"
 SRCREV = "4c6497c8b0a67cd9fa9693e9101a7cafd3297e81"
 SRC_URI = " \
     git://github.com/lyonel/lshw.git;protocol=https;branch=master \
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index d690dd4f02..63971970cf 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -10,7 +10,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 PE = "1"
-PV = "7.91+git${SRCPV}"
+PV = "7.91+git"
 SRCREV = "c22d359433b333937ee3d803450dc41998115685"
 
 DEPENDS = "elfutils"
diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
index b5d05d40e5..36e46021bb 100644
--- a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
+++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=b67209a1e36b682a8226de19d265b1e0"
 
 SRC_URI = "git://github.com/nlohmann/fifo_map.git;branch=master;protocol=https"
 
-PV = "1.0.0+git${SRCPV}"
+PV = "1.0.0+git"
 
 SRCREV = "d732aaf9a315415ae8fd7eb11e3a4c1f80e42a48"
 
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 19ef987387..36cdb00f2b 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -17,7 +17,7 @@ SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
 SRCREV_jimtcl = "fcbb4499a6b46ef69e7a95da53e30796e20817f0"
 SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
 
-PV = "0.12+gitr${SRCPV}"
+PV = "0.12+gitr"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep gettext
diff --git a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
index 56d895a099..ad149de12c 100644
--- a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
+++ b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://lesswatts.org/projects/acpi"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-PV = "20130209+git${SRCPV}"
+PV = "20130209+git"
 
 SRC_URI = "git://github.com/anyc/pmtools.git;branch=master;protocol=https \
     file://pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch \
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index 65294fafad..8519479c4d 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/miloyip/rapidjson.git;branch=master;protocol=https"
 
 SRCREV = "0ccdbf364c577803e2a751f5aededce935314313"
 
-PV = "1.1.0+git${SRCPV}"
+PV = "1.1.0+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 26540b4295..079f805d6c 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a12d8903508fb6bfd49d8d82c6170dd9"
 DEPENDS += "flex-native bison-native"
 PACKAGECONFIG[docs] = ",,xmlto-native,"
 
-PV = "1.3.0+git${SRCPV}"
+PV = "1.3.0+git"
 # v1.3.0
 SRCREV = "ba463d3c26c0ece2e797b8d6381b161633b5971a"
 SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
index 28db39ac20..3d438871ed 100644
--- a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
+++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "boost"
 SRCREV = "42ebcec9dc2c99a1b3a4542787572045763ad196"
-PV = "0.6.3+git${SRCPV}"
+PV = "0.6.3+git"
 
 SRC_URI = "\
     git://github.com/docopt/docopt.cpp.git;protocol=https;branch=master \
diff --git a/meta-oe/recipes-extended/figlet/figlet_git.bb b/meta-oe/recipes-extended/figlet/figlet_git.bb
index 61b050aac6..9789ac16d4 100644
--- a/meta-oe/recipes-extended/figlet/figlet_git.bb
+++ b/meta-oe/recipes-extended/figlet/figlet_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/cmatsuoka/figlet.git;branch=master;protocol=https \
            file://0001-build-add-autotools-support-to-allow-easy-cross-comp.patch"
 SRCREV = "5bbcd7383a8c3a531299b216b0c734e1495c6db3"
 S = "${WORKDIR}/git"
-PV = "2.2.5+git${SRCPV}"
+PV = "2.2.5+git"
 
 inherit autotools
 
diff --git a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
index 39d6459227..bfa0e79d8f 100644
--- a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
+++ b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "A handy serial sniffer"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
-PV = "2.3.6+git${SRCPV}"
+PV = "2.3.6+git"
 
 SRC_URI = "git://github.com/snarlistic/jpnevulator.git;protocol=https;branch=master"
 SRCREV = "bc1d4f6587a4a4829b5d55e3ca7ad584da6de545"
diff --git a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
index 6f2ead9a8d..d540737bc9 100644
--- a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
+++ b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
@@ -10,7 +10,7 @@ DEPENDS += "libunwind"
 
 SRC_URI = "git://github.com/ianlancetaylor/libbacktrace;protocol=https;branch=master"
 
-PV = "1.0+git${SRCPV}"
+PV = "1.0+git"
 SRCREV = "9ae4f4ae4481b1e69d38ed810980d33103544613"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
index 6fbc28394f..26dd821f96 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
@@ -8,7 +8,7 @@ DEPENDS = "libxml2 glib-2.0 swig python3"
 
 inherit autotools pkgconfig python3native python3targetconfig
 
-PV = "2.3.0+git${SRCPV}"
+PV = "2.3.0+git"
 
 SRCREV = "2cd858c679d25633077ca78b67182a9b77653816"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master"
diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
index 91a9b4af2c..b9f5c34094 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
@@ -7,7 +7,7 @@ DEPENDS = "udev libusb1 libplist libimobiledevice-glue"
 inherit autotools pkgconfig gitpkgv
 
 PKGV = "${GITPKGVTAG}"
-PV = "2.0.2+git${SRCPV}"
+PV = "2.0.2+git"
 
 SRCREV = "36ffb7ab6e2a7e33bd1b56398a88895b7b8c615a"
 SRC_URI = "git://github.com/libimobiledevice/libusbmuxd;protocol=https;branch=master"
diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
index 65bf9ba647..6e6c8cc226 100644
--- a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
+++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
@@ -7,7 +7,7 @@ SRCREV = "17d96e8f9a5bce7cee5e2222855ab46a246dba51"
 
 SRC_URI = "git://git.code.sf.net/p/libuio/code;branch=master;protocol=https"
 
-PV .= "+0.2.2+git${SRCPV}"
+PV .= "+0.2.2+git"
 
 inherit autotools
 
diff --git a/meta-oe/recipes-extended/md5deep/md5deep_git.bb b/meta-oe/recipes-extended/md5deep/md5deep_git.bb
index b1a38cf6f2..5351a37db6 100644
--- a/meta-oe/recipes-extended/md5deep/md5deep_git.bb
+++ b/meta-oe/recipes-extended/md5deep/md5deep_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://md5deep.sourceforge.net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9190f660105b9a56cdb272309bfd5491"
 
-PV = "4.4+git${SRCPV}"
+PV = "4.4+git"
 
 SRCREV = "877613493ff44807888ce1928129574be393cbb0"
 
diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index 61f36d724d..37bd36432f 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=91e7de50a8d3cf01057f318d72460acd"
 
 SRCREV = "3c288a09109969eef9c2da7d92d3c62f92a015cc"
-PV = "2.2.0+git${SRCPV}"
+PV = "2.2.0+git"
 
 SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=https;branch=master \
            file://0001-cmake-Use-a-regular-expression-to-match-x86-architec.patch \
diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
index bb9574feb2..dc7280f099 100644
--- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
+++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://libcec.pulse-eight.com/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://src/os.h;md5=752555fa94e82005d45fd201fee5bd33"
 
-PV = "2.1.0.1+git${SRCPV}"
+PV = "2.1.0.1+git"
 
 SRC_URI = "git://github.com/Pulse-Eight/platform.git;branch=master;protocol=https"
 SRCREV = "a7cd0d5780ed80a4e70480d1650749f29e8a1fb2"
diff --git a/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb b/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
index 88a18aa137..25951c9de4 100644
--- a/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
+++ b/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-PV = "0.0.1+git${SRCPV}"
+PV = "0.0.1+git"
 
 SRCREV = "45863e849b39c4921d6553e6d27e267a96ac7d77"
 SRC_URI = "git://github.com/lib-cpp/${BPN}.git;branch=master;protocol=https"
diff --git a/meta-oe/recipes-extended/qad/qad_git.bb b/meta-oe/recipes-extended/qad/qad_git.bb
index 056f28a0a4..0bc94121a7 100644
--- a/meta-oe/recipes-extended/qad/qad_git.bb
+++ b/meta-oe/recipes-extended/qad/qad_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.com/CodethinkLabs/qad/qad;branch=main;protocol=https \
 SRCREV = "ae0c099c1fdc0ca6f5d631cea6b302937122b362"
 
 S = "${WORKDIR}/git"
-PV = "0.0+git${SRCPV}"
+PV = "0.0+git"
 
 DEPENDS = "cjson libmicrohttpd libdrm libpng"
 
diff --git a/meta-oe/recipes-extended/qcbor/qcbor_git.bb b/meta-oe/recipes-extended/qcbor/qcbor_git.bb
index 9c562d5a66..a87454fa95 100644
--- a/meta-oe/recipes-extended/qcbor/qcbor_git.bb
+++ b/meta-oe/recipes-extended/qcbor/qcbor_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/laurencelundblade/QCBOR;protocol=https;branch=master
 
 SRCREV = "44754f738c6534a4304a83d4c6e97b3d3193d887"
 
-PV = "1.2+git${SRCPV}"
+PV = "1.2+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb
index fa1c6c7ecd..a5a3b43feb 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb
@@ -11,7 +11,7 @@ SECTION = "utils"
 LICENSE = "LGPL-2.0-or-later & GPL-2.0-only & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://README.license;md5=60487bf0bf429d6b5aa72b6d37a0eb22"
 
-PV .= "+git${SRCPV}"
+PV .= "+git"
 
 SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
index 993efab395..a60b55e7e7 100644
--- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
@@ -1,7 +1,7 @@
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=72d977d697c3c05830fdff00a7448931"
 SRCREV = "beb4650660179963a8ed5b5cbf2085cc1b34f608"
-PV = "1.0+git${SRCPV}"
+PV = "1.0+git"
 
 SRC_URI = "git://github.com/hartkopp/can-isotp.git;protocol=https;branch=master"
 
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
index fc64ec0fcb..596aa260e7 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://git.code.sf.net/p/tipc/tipcutils;branch=master \
            file://0001-test-ptts-Set-recv-buffer-size-too-max-to-receive-as.patch \
            "
 SRCREV = "7ab2211b87414ba240b0b2e4af219c1057c9cf9a"
-PV = "2.2.0+git${SRCPV}"
+PV = "2.2.0+git"
 
 inherit autotools pkgconfig
 
diff --git a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
index 3a3dd192be..0b14f9557a 100644
--- a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
+++ b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 # matches debian/0.5.0-1 tag
 SRCREV = "44a173195986d0d853316cb02a58785ded66c12b"
-PV = "0.5.0+git${SRCPV}"
+PV = "0.5.0+git"
 SRC_URI = "git://github.com/wertarbyte/${BPN}.git;branch=debian;protocol=https"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index a86f4a80d8..8468ff775d 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=66493d54e65bfc12c7983ff2e884f37f"
 DEPENDS = "libjpeg-turbo mraa python3-setuptools-native"
 
 SRCREV = "5cf20df96c6b35c19d5b871ba4e319e96b4df72d"
-PV = "2.0.0+git${SRCPV}"
+PV = "2.0.0+git"
 
 SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=https;branch=master \
            file://0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch \
diff --git a/meta-oe/recipes-extended/zsync/zsync-curl_git.bb b/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
index 84593387d3..1bc4010f8a 100644
--- a/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
+++ b/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/probonopd/zsync-curl;protocol=https;branch=master \
            file://make.patch"
 SRCREV = "00141c2806ccc4ddf2ff6263ee1612d19c0b713f"
 
-PV = "0.6.2+git${SRCPV}"
+PV = "0.6.2+git"
 
 inherit autotools
 
diff --git a/meta-oe/recipes-graphics/aml/aml_git.bb b/meta-oe/recipes-graphics/aml/aml_git.bb
index eed62adae0..2633e0d215 100644
--- a/meta-oe/recipes-graphics/aml/aml_git.bb
+++ b/meta-oe/recipes-graphics/aml/aml_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/any1/aml;branch=master;protocol=https"
 
 SRCREV = "b83f3576ce4187d9285f06e9066ef43a691464d4"
 
-PV = "0.3.0+git${SRCPV}"
+PV = "0.3.0+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-graphics/fbida/fbida_git.bb b/meta-oe/recipes-graphics/fbida/fbida_git.bb
index 65c9041a3b..247a1fcbb2 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_git.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e8feb78a32950a909621bbb51f634b39"
 
 DEPENDS = "virtual/libiconv jpeg fontconfig freetype libexif libdrm pixman udev libinput cairo"
 
-PV = "2.14+git${SRCPV}"
+PV = "2.14+git"
 SRC_URI = "git://github.com/kraxel/fbida;protocol=https;branch=master \
            file://fix-preprocessor.patch \
            file://support-jpeg-turbo.patch \
diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
index 3797314b47..dd520b245e 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
@@ -18,7 +18,7 @@ SRC_URI = " \
     file://glmTargets.cmake \
 "
 SRCREV = "efec5db081e3aad807d0731e172ac597f6a39447"
-PV .= "+0.9.9.9+git${SRCPV}"
+PV .= "+0.9.9.9+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-graphics/openbox/obconf_git.bb b/meta-oe/recipes-graphics/openbox/obconf_git.bb
index efffd962d4..1210af70ea 100644
--- a/meta-oe/recipes-graphics/openbox/obconf_git.bb
+++ b/meta-oe/recipes-graphics/openbox/obconf_git.bb
@@ -8,7 +8,7 @@ DEPENDS = " \
     startup-notification \
     gtk+3 \
 "
-PV = "2.0.4+git${SRCPV}"
+PV = "2.0.4+git"
 
 SRCREV = "63ec47c5e295ad4f09d1df6d92afb7e10c3fec39"
 SRC_URI = " \
diff --git a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
index eff6ad8f83..2ec89bc05b 100644
--- a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
+++ b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/parallel-deqp-runner.git;protocol=h
            "
 
 # Modify these as desired
-PV = "2020.06.15+git${SRCPV}"
+PV = "2020.06.15+git"
 SRCREV = "e1642fb691d29b1462504b58916f7f514a963e80"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
index 7fa155a22f..119612cd73 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.droidfonts.com/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.txt;md5=83544262a86f1f1ec761e75897df92bc"
 SRCREV = "21e6e2de1f0062f949fcc52d0b4559dfa3246e0e"
-PV = "0.1+gitr${SRCPV}"
+PV = "0.1+gitr"
 PR = "r3"
 
 SRC_URI = "git://github.com/android/platform_frameworks_base.git;branch=master;protocol=https"
diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
index 3633bbc26b..74f80e1844 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/x11vnc.h;endline=31;md5=e871a2ad004776794b616822dcab6314"
 
 SRCREV = "87cd0530f438372dda3c70bb491a6fd19f09acc2"
-PV .= "+git${SRCPV}"
+PV .= "+git"
 
 SRC_URI = "git://github.com/LibVNC/x11vnc;branch=master;protocol=https \
            file://starting-fix.patch \
diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb
index 76e8f72c4f..bec9b75ebd 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
 
 LICENSE_FLAGS = "commercial"
 
-PV .= "+git${SRCPV}"
+PV .= "+git"
 
 SRC_URI = "git://github.com/knik0/faad2.git;branch=master;protocol=https"
 SRCREV = "216f00e8ddba6f2c64caf481a04f1ddd78b93e78"
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
index 594b51b439..52759ef18e 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
@@ -32,7 +32,7 @@ SRC_URI = "\
 
 SRCREV = "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
 
-PV .= "+git${SRCPV}"
+PV .= "+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
index 746d4182a9..6d64ab71bf 100644
--- a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
+++ b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=794d11c5219c59c9efa2487c2b4066b2"
 
 SRC_URI = "git://github.com/ajaxorg/ace-builds.git;protocol=https;branch=master"
 
-PV = "02.07.17+git${SRCPV}"
+PV = "02.07.17+git"
 SRCREV = "812e2c56aed246931a667f16c28b096e34597016"
 
 FILES:${PN} = "${datadir}/ace-builds"
diff --git a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
index 7c6b2547cb..ef3c951bbf 100644
--- a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
+++ b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/CLIUtils/CLI11"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=afb20fe5f67e21074b10b864d9563c11"
 SRCREV = "291c58789c031208f08f4f261a858b5b7083e8e2"
-PV .= "+git${SRCPV}"
+PV .= "+git"
 
 SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https \
             https://github.com/philsquared/Catch/releases/download/v2.13.7/catch.hpp \
diff --git a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
index 48b52eefca..bb8c9de71d 100644
--- a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
+++ b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2ef696d66c156139232201f223c22592"
 
 SRC_URI= "git://git.linuxtv.org/edid-decode.git;protocol=https;branch=master"
 SRCREV = "5920bf2a756b2f748c49ff6a08b9f421026473c5"
-PV = "0.0+git${SRCPV}"
+PV = "0.0+git"
 S = "${WORKDIR}/git"
 
 do_install() {
diff --git a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
index 4501b082de..b8cd1f620a 100644
--- a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
+++ b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
@@ -11,7 +11,7 @@ SRCREV = "86a5627dbeac8d9d9bc34326a758d6a477e876e4"
 SRC_URI = "git://git@gitlab.freedesktop.org/libevdev/evemu.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-PV = "gitr${SRCPV}"
+PV = "gitr"
 
 inherit autotools pkgconfig
 
diff --git a/meta-oe/recipes-support/function2/function2_4.2.4.bb b/meta-oe/recipes-support/function2/function2_4.2.4.bb
index 2748b84f7c..98d05f6e25 100644
--- a/meta-oe/recipes-support/function2/function2_4.2.4.bb
+++ b/meta-oe/recipes-support/function2/function2_4.2.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://naios.github.io/function2"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 SRCREV = "a354bd093d2b6e50c9325dbce84d20b4e77aabc6"
-PV .= "+git${SRCPV}"
+PV .= "+git"
 
 SRC_URI += "gitsm://github.com/Naios/function2;branch=master;protocol=https"
 
diff --git a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
index 047acf28db..0ec426afb9 100644
--- a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
@@ -133,7 +133,7 @@ LIC_FILES_CHKSUM = " \
 
 RDEPENDS:${PN} = "hunspell"
 
-PV = "0.0.0+git${SRCPV}"
+PV = "0.0.0+git"
 SRCREV = "820a65e539e34a3a8c2a855d2450b84745c624ee"
 SRC_URI = "git://github.com/wooorm/dictionaries.git;branch=master;protocol=https"
 
diff --git a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
index 3dbd8db63f..8218b08084 100644
--- a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
+++ b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libirecovery libimobiledevice libzip curl libimobiledevice-glue openssl"
 
-PV = "1.0.1+git${SRCPV}"
+PV = "1.0.1+git"
 
 SRCREV = "ecae6c6e8ca6b6bad080a1c73f10ffd0e67d75a7"
 SRC_URI = "git://github.com/libimobiledevice/idevicerestore;protocol=https;branch=master"
diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.5.bb b/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
index e01c0897bb..017e7d26a6 100644
--- a/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
+++ b/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 SRCREV = "978b733462e41efd5db72bc9974cb3b0d1d5f6fa"
-PV = "1.5+git${SRCPV}"
+PV = "1.5+git"
 
 SRC_URI = "git://github.com/meduketto/iksemel.git;protocol=https;branch=master \
            file://fix-configure-option-parsing.patch \
diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
index 5e42cdcb06..c80668d279 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e02baf71c76e0650e667d7da133379ac"
 
 DEPENDS = "doxygen-native"
 
-PV .= "+git${SRCPV}"
+PV .= "+git"
 
 SRC_URI = "git://github.com/ndevilla/iniparser.git;protocol=https;branch=master \
            file://0001-iniparser.pc-Make-libpath-a-variable.patch \
diff --git a/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb b/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
index 6a1e7b75e1..e0683b177b 100644
--- a/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
+++ b/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/libb64"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=81296a564fa0621472714aae7c763d96"
 
-PV .= "+2.0.0.2+git${SRCPV}"
+PV .= "+2.0.0.2+git"
 SRCREV = "ce864b17ea0e24a91e77c7dd3eb2d1ac4175b3f0"
 
 SRC_URI = "git://github.com/libb64/libb64;protocol=https;branch=master \
diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index c5f26ecb4e..e100265f7d 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -16,7 +16,7 @@ DEPENDS = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '', d)} "
 
 PROVIDES += "${PN}-dev"
 
-PV .= "+git${SRCPV}"
+PV .= "+git"
 SRCREV = "ebef1e929807629befafbb2918ea1a08c7194554"
 SRC_URI = "git://github.com/USCiLab/cereal.git;branch=master;protocol=https \
            file://0001-sandbox-Do-not-use-int8_t-in-std-uniform_int_distrib.patch \
diff --git a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
index a69194996b..dd7f457b10 100644
--- a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
+++ b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER.txt;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "libusb udev"
 
-PV = "1.0.0+git${SRCPV}"
+PV = "1.0.0+git"
 
 SRCREV = "655e2d544183d094f0e2d119c7e0c6206a0ddb3f"
 SRC_URI = "git://github.com/cyrozap/${BPN}.git;branch=master;protocol=https \
diff --git a/meta-oe/recipes-support/libfann/libfann_git.bb b/meta-oe/recipes-support/libfann/libfann_git.bb
index 2f52a0f3bd..40f91ac43d 100644
--- a/meta-oe/recipes-support/libfann/libfann_git.bb
+++ b/meta-oe/recipes-support/libfann/libfann_git.bb
@@ -12,7 +12,7 @@ SRCREV ?= "7ec1fc7e5bd734f1d3c89b095e630e83c86b9be1"
 SRC_URI = "git://github.com/libfann/fann.git;branch=master;protocol=https \
           "
 
-PV = "2.2.0+git${SRCPV}"
+PV = "2.2.0+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index 7998b0c155..f8ebcc7767 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
-PV = "0.2.0+git${SRCPV}"
+PV = "0.2.0+git"
 SRCREV = "721e3a1cbd7e2b6361bb439d3959e7403e4f0092"
 SRCBRANCH = "master"
 SRC_URI = " \
diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
index 48be8dfa96..844e5acf90 100644
--- a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
+++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://linux-iscsi.org/index.php/Lio-utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=c3ea231a32635cbb5debedf3e88aa3df"
 
-PV = "4.1+git${SRCPV}"
+PV = "4.1+git"
 
 SRC_URI = "git://github.com/Datera/lio-utils.git;branch=master;protocol=https \
            file://0001-Makefiles-Respect-environment-variables-and-add-LDFL.patch \
diff --git a/meta-oe/recipes-support/mcelog/mce-test_git.bb b/meta-oe/recipes-support/mcelog/mce-test_git.bb
index fd302db897..05e98e86ed 100644
--- a/meta-oe/recipes-support/mcelog/mce-test_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-test_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-test.git;protocol=git;
            file://0001-gcov_merge.py-scov_merge.py-switch-to-python3.patch \
           "
 SRCREV = "025014dedca39d2b8a57a82e52286e72e157d73a"
-PV = "20222810+git${SRCPV}"
+PV = "20222810+git"
 
 RDEPENDS:${PN} = "mcelog mce-inject dialog bash"
 
diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
index 5193df3174..21ef9fdc3b 100644
--- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/projectNe10/Ne10.git;branch=master;protocol=https \
 SRCREV = "18c4c982a595dad069cd8df4932aefb1d257591f"
 
 S = "${WORKDIR}/git"
-PV .= "gitr+${SRCPV}"
+PV .= "gitr+"
 
 inherit cmake
 
diff --git a/meta-oe/recipes-support/picocom/picocom_git.bb b/meta-oe/recipes-support/picocom/picocom_git.bb
index 4ec256bb99..cc0d88faca 100644
--- a/meta-oe/recipes-support/picocom/picocom_git.bb
+++ b/meta-oe/recipes-support/picocom/picocom_git.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://gitlab.com/wsakernel/picocom"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000e4830620e310fe65c0eb69df9e8a"
 
 BASEPV = "2023-04"
-PV = "${BASEPV}+git${SRCPV}"
+PV = "${BASEPV}+git"
 
 SRCREV = "12537df0314767d5af35bddddbbca3694e6a0342"
 
diff --git a/meta-oe/recipes-support/pidgin/icyque_git.bb b/meta-oe/recipes-support/pidgin/icyque_git.bb
index fe75415de2..76ed26e88e 100644
--- a/meta-oe/recipes-support/pidgin/icyque_git.bb
+++ b/meta-oe/recipes-support/pidgin/icyque_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 DEPENDS = "pidgin json-glib"
 
-PV = "0.1+gitr${SRCPV}"
+PV = "0.1+gitr"
 
 inherit pkgconfig
 
diff --git a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
index 96b97b6744..1981f1ee9c 100644
--- a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
+++ b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/EionRobb/skype4pidgin;branch=master;protocol=https"
 SRCREV = "b226d1c457d73900ae89b8a7469247fbe33677a6"
 
 S = "${WORKDIR}/git"
-PV = "1.7+git${SRCPV}"
+PV = "1.7+git"
 
 do_compile() {
     oe_runmake -C skypeweb;
diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
index c49a2599ac..2bf4d0a449 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
@@ -3,7 +3,7 @@ SECTION = "libs/multimedia"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
 
-PV .= "+git${SRCPV}"
+PV .= "+git"
 
 SRC_URI = "git://github.com/PortAudio/portaudio.git;branch=master;protocol=https"
 SRCREV = "929e2e8f7af281c5eb4fa07758930d542ec43d97"
diff --git a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
index 2fe61e6f59..41a93f3249 100644
--- a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
+++ b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07"
 SECTION = "console/network"
 SRCREV = "00dbec2636ae0385ad028587e20e446272ff97ec"
-PV = "1.1+gitr${SRCPV}"
+PV = "1.1+gitr"
 
 SRC_URI = "git://github.com/freesmartphone/cornucopia.git;protocol=https;branch=master"
 S = "${WORKDIR}/git/tools/serial_forward"
diff --git a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
index 84bb25e4cd..751bdffead 100644
--- a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
+++ b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07"
 SECTION = "console/devel"
 SRCREV = "07c6fdede0870edc37a8d51d033b6e7e29aa7c91"
-PV = "1.1+gitr${SRCPV}"
+PV = "1.1+gitr"
 
 SRC_URI = "git://github.com/freesmartphone/cornucopia.git;branch=master;protocol=https \
            file://0001-serial_forward-Disable-default-static-linking.patch;striplevel=3 \
diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/recipes-support/synergy/synergy_git.bb
index f2e7a91618..fb767942fe 100644
--- a/meta-oe/recipes-support/synergy/synergy_git.bb
+++ b/meta-oe/recipes-support/synergy/synergy_git.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/symless/synergy-core;protocol=https;nobranch=1"
 
 # Version 1.10.1-stable
 SRCREV ?= "1b4c076127687aceac931d269e898beaac1cad9f"
-PV = "1.10.1+git${SRCPV}"
+PV = "1.10.1+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
index a6d09f69e9..bd69dbb11c 100644
--- a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://bitmath.org/git/evemu.git;protocol=http;branch=master \
            "
 SRCREV = "9752b50e922572e4cd214ac45ed95e4ee410fe24"
 
-PV = "1.0.6+git${SRCPV}"
+PV = "1.0.6+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
index 3b1cf60c27..ddd27a7e30 100644
--- a/meta-oe/recipes-support/utouch/utouch-frame_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
@@ -16,6 +16,6 @@ SRC_URI = "git://bitmath.org/git/frame.git;protocol=http;branch=master \
            "
 SRCREV = "95363d5a1f7394d71144bf3b408ef4e6db4350fc"
 
-PV = "1.1.2+git${SRCPV}"
+PV = "1.1.2+git"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
index e348e39bba..d964d7f263 100644
--- a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
@@ -14,6 +14,6 @@ SRCREV = "ad437c38dc111cf3990a03abf14efe1b5d89604b"
 
 DEPENDS += "mtdev utouch-frame utouch-evemu libx11"
 
-PV = "1.1.7+git${SRCPV}"
+PV = "1.1.7+git"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb b/meta-oe/recipes-support/zbar/zbar_git.bb
index 3be1f27a6f..975779cd18 100644
--- a/meta-oe/recipes-support/zbar/zbar_git.bb
+++ b/meta-oe/recipes-support/zbar/zbar_git.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/mchehab/zbar.git;branch=master;protocol=https \
 SRCREV = "89e7900d85dd54ef351a7ed582aec6a5a5d7fa37"
 
 S = "${WORKDIR}/git"
-PV = "0.23.1+git${SRCPV}"
+PV = "0.23.1+git"
 
 DEPENDS += "xmlto-native"
 
diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
index 7461fcc4d7..6c94e9e275 100644
--- a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
+++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
@@ -7,7 +7,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "a01cc69ee9536f90e57c61a198f2d1944d3d4313"
-PV .= "+git${SRCPV}"
+PV .= "+git"
 SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git;protocol=https;branch=stable-1.1 \
            file://0001-include-Check-for-previous-declaration-of-uintptr_t.patch \
            file://run-ptest \
diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
index 7abdcb2523..e909676abc 100644
--- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
+++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/MIT;md5=544799d0b492f119fa04641d1b8868ed"
 
 SRC_URI = "git://github.com/cbrake/linux-serial-test.git;protocol=https;branch=master"
 
-PV = "0+git${SRCPV}"
+PV = "0+git"
 SRCREV = "2ee61484167eab846f7b7c565284d7c350d738d3"
 
 S = "${WORKDIR}/git"
diff --git a/meta-python/recipes-devtools/gyp/gyp_git.bb b/meta-python/recipes-devtools/gyp/gyp_git.bb
index 0f94a4476d..6ac4228a8b 100644
--- a/meta-python/recipes-devtools/gyp/gyp_git.bb
+++ b/meta-python/recipes-devtools/gyp/gyp_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://chromium.googlesource.com/external/gyp;protocol=https;branch=ma
 SRCREV = "a03d7413becefc8d55c8aa3df58b55b9bd0e9052"
 
 S = "${WORKDIR}/git"
-PV = "0.1+git${SRCPV}"
+PV = "0.1+git"
 
 inherit setuptools3
 
diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
index 040788609e..4dbf595c19 100644
--- a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
+++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/jchampio/apache-websocket.git;branch=master;protocol
 
 SRCREV = "0ee34c77fc78ff08fd548706300b80a7bc7874e4"
 
-PV = "0.1.2+git${SRCPV}"
+PV = "0.1.2+git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
index 3dc4ca8bbb..7763a31881 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "unzip-native libpcre openssl mysql5 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRCREV = "9a75e65b876bcc376cb6b379dca1f7ce4a055c59"
-PV = "1.2.104+git${SRCPV}"
+PV = "1.2.104+git"
 SRC_URI = "git://github.com/cherokee/webserver;branch=master;protocol=https \
            file://cherokee.init \
            file://cherokee.service \
-- 
2.43.0


