Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7072CAC5A7
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 07:57:14 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.7285.1758700626366301664
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 00:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+vVBfHJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-4258ac8f64dso7042745ab.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 00:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758700625; x=1759305425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wY7b898HAMwKpAwl4pitBvf3DhBncFlBEUza9I66P4k=;
        b=D+vVBfHJvS1kboYmc8eyJ+KOLqCWGSJ4YDlgmbrMaIbZj5YGvT5prY3D6U3aEkcP8d
         9EQWenVlruPaU82NRMheHr0+NI6VP54gwBnVc4cWr6diRuZ4vCFRRVLrdOqMkDKfeEKK
         P9lrlzmqoiMQZNxWC9ctSdKolrCoxE3LXUBzNKq/NxvzWPZ7o3pkrX1hiHqpwEfBtdkd
         dwApEvxBPieaATbGJTiK4VqCHVA5bHOexB4OY0Dw4Uvw6q3T5WVKEu608daKiEOmHU5j
         xUIoZUFC2Nv3VYNOtStH1CqOmNNlZo8qRudEFgFqR6QF+HWxDABOsHV77Ig3RngBtKOF
         xhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758700625; x=1759305425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wY7b898HAMwKpAwl4pitBvf3DhBncFlBEUza9I66P4k=;
        b=ZjgC3ZY7EjpMSLxjohWCYk96kyLF8Bo3c0INt+Ldiz5YLKnkFHSfoeqZj6r1qeD0OC
         z9umysQTv+k3haIVbp8J9DiYsy3boyijqHp9RCxhIaQrjGdKQPVpdCRRW4gZfRF+EP3v
         qFrW4+T+LJkCrhGZZOIp36/CkyiDKztOx+xLWLdFCxlMQCreE5mZowU+YDzNOmIEakEc
         hI1cyUwMOqQ6zmS9iBDiTHM6ecgkakbzFkUfeNupQvp1nrdJPJzSkIn68QEIBlIZdxSC
         Xf7lKG4IUdmsvj5ubhKeZnnhQkJBd1ZU5CtAAYh49aKVL1dEsKHqh8aNx8+/wQtrfpQ2
         ldVA==
X-Gm-Message-State: AOJu0YwpyqPUBIWluIyCGeG9vkONcM50WkMp64+1dioMmqHCLLwnBcVL
	YFVOiY4fa9JKPpLFYnNhpZy4USPPuVWjt+cnRDGKTgreVhKWaEv7tJBh9A8BqA==
X-Gm-Gg: ASbGncuPTKOqnfFnTYZ/bFLHlRsMUSqxnt9uMAnSceANXAuI5IAGoQi7m09QkxJrGAH
	b3aNT7ZKP4UXm9FJhU/nzobNmDW0mJAIesH0TEcPDdTVVvN4k3RNkf4Hg/m6gpW2FfODWpKlG18
	BNtFmTv8L2dhURzwtpyhu36ST20z8H5Sw5wc1DChBfhsNw+YfzTDksl+GtF5IIdKKaWoceoAW59
	XVhk2BM9Hij8IEBlyCOywlq1dsuqRWlSuhUoWoEO1VVyIa9P794W4A/AXBr3caVuBcjxLuDssdA
	cnvpACQPggGaOyZtYbaZkJDQLRDklJqwJzY1zXiIC0J6aB4M8/4I0KK6x2FJ6YScnG+o0RWJT8A
	3VM3DmCB5mMBTTtKITFeZGrtp4dVLvUUNqhcho40QzblqrPjepTnt
X-Google-Smtp-Source: AGHT+IEuS2L5jS+aTGD+14KkkGun3W1bxshXSJOzDYjhbYKHakK0vpO3nrtDn6qbqQihA3EFhwSEDg==
X-Received: by 2002:a05:6e02:929:b0:425:8c01:e416 with SMTP id e9e14a558f8ab-4258c01e679mr19898145ab.0.1758700625147;
        Wed, 24 Sep 2025 00:57:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.216.253])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-55dba4465f4sm3203576173.37.2025.09.24.00.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 00:57:04 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 3/6] fwupd: update to 2.0.12
Date: Wed, 24 Sep 2025 19:56:40 +1200
Message-ID: <20250924075643.2047506-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
References: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 07:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119758

From: Mikko Rapeli <mikko.rapeli@linaro.org>

New major version release which drops many configure
options, changes from libgusb to libusb etc.

Upstream changelogs:

https://github.com/fwupd/fwupd/releases/tag/2.0.0
https://github.com/fwupd/fwupd/releases/tag/2.0.1
https://github.com/fwupd/fwupd/releases/tag/2.0.2
https://github.com/fwupd/fwupd/releases/tag/2.0.3
https://github.com/fwupd/fwupd/releases/tag/2.0.4
https://github.com/fwupd/fwupd/releases/tag/2.0.5
https://github.com/fwupd/fwupd/releases/tag/2.0.6
https://github.com/fwupd/fwupd/releases/tag/2.0.7
https://github.com/fwupd/fwupd/releases/tag/2.0.8
https://github.com/fwupd/fwupd/releases/tag/2.0.9
https://github.com/fwupd/fwupd/releases/tag/2.0.10
https://github.com/fwupd/fwupd/releases/tag/2.0.11
https://github.com/fwupd/fwupd/releases/tag/2.0.12

Tested with genericarm64 machine on qemu with ptests and
manually on AMD KV260.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 738d27a759228e9a2ee52ca5edf728df7edd588e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...certs.py-use-usr-bin-env-for-python3.patch |  28 ++++
 ...-reduce-lzma-compression-level-from-.patch |  47 ++++++
 meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb     | 134 ------------------
 meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb     |  93 ++++++++++++
 4 files changed, 168 insertions(+), 134 deletions(-)
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-build-certs.py-use-usr-bin-env-for-python3.patch
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-fu-lzma-common.c-reduce-lzma-compression-level-from-.patch
 delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/0001-build-certs.py-use-usr-bin-env-for-python3.patch b/meta-oe/recipes-bsp/fwupd/fwupd/0001-build-certs.py-use-usr-bin-env-for-python3.patch
new file mode 100644
index 0000000000..3a4ecb1f29
--- /dev/null
+++ b/meta-oe/recipes-bsp/fwupd/fwupd/0001-build-certs.py-use-usr-bin-env-for-python3.patch
@@ -0,0 +1,28 @@
+From 2c3896878ba8118b48c55528c6bac98f05f223f3 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Thu, 3 Jul 2025 13:34:21 +0000
+Subject: [PATCH] build-certs.py: use /usr/bin/env for python3
+
+Avoids errors if python3 install path is not
+in /usr/bin.
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ data/tests/build-certs.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Submitted [https://github.com/fwupd/fwupd/pull/8998]
+
+diff --git a/data/tests/build-certs.py b/data/tests/build-certs.py
+index 3b8503b72bcf..222e8a4a0f8b 100755
+--- a/data/tests/build-certs.py
++++ b/data/tests/build-certs.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ # SPDX-License-Identifier: LGPL-2.1+
+ 
+ import os
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/0001-fu-lzma-common.c-reduce-lzma-compression-level-from-.patch b/meta-oe/recipes-bsp/fwupd/fwupd/0001-fu-lzma-common.c-reduce-lzma-compression-level-from-.patch
new file mode 100644
index 0000000000..b0d3863eaa
--- /dev/null
+++ b/meta-oe/recipes-bsp/fwupd/fwupd/0001-fu-lzma-common.c-reduce-lzma-compression-level-from-.patch
@@ -0,0 +1,47 @@
+From c96668ab830d016eeff977d5ca4f99d288cf38c0 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Tue, 8 Jul 2025 07:05:02 +0000
+Subject: [PATCH] fu-lzma-common.c: reduce lzma compression level from 9 to
+ default 6
+
+xz manual page says default is 6 and levels higher than that can cause
+huge CPU and memory usage. On yocto qemu target, the fwupd tests
+fail to run with compression level 9:
+
+FuSelfTest:ERROR:../sources/fwupd-2.0.12/libfwupdplugin/fu-self-test.c:6342:fu_lzma_func: assertion failed (error == NULL): failed to set up LZMA encoder rc=5 (FwupdError, 10)
+not ok /fwupd/lzma - FuSelfTest:ERROR:../sources/fwupd-2.0.12/libfwupdplugin/fu-self-test.c:6342:fu_lzma_func: assertion failed (error == NULL): failed to set up LZMA encoder rc=5 (FwupdError, 10)
+
+With default compression level 6 the tests pass.
+
+https://linux.die.net/man/1/xz
+
+ -6 ... -9
+    Excellent compression with medium to high memory usage.
+    These are also slower than the lower preset levels.
+    The default is -6. Unless you want to maximize the compression ratio,
+    you probably don't want a higher preset level than -7 due to
+    speed and memory usage.
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ libfwupdplugin/fu-lzma-common.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Submitted [https://github.com/fwupd/fwupd/pull/9019]
+
+diff --git a/libfwupdplugin/fu-lzma-common.c b/libfwupdplugin/fu-lzma-common.c
+index a64ec773da91..d381ed52e135 100644
+--- a/libfwupdplugin/fu-lzma-common.c
++++ b/libfwupdplugin/fu-lzma-common.c
+@@ -89,7 +89,7 @@ fu_lzma_compress_bytes(GBytes *blob, GError **error)
+ 	strm.next_in = g_bytes_get_data(blob, NULL);
+ 	strm.avail_in = g_bytes_get_size(blob);
+ 
+-	rc = lzma_easy_encoder(&strm, 9, LZMA_CHECK_CRC64);
++	rc = lzma_easy_encoder(&strm, 6, LZMA_CHECK_CRC64);
+ 	if (rc != LZMA_OK) {
+ 		lzma_end(&strm);
+ 		g_set_error(error,
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
deleted file mode 100644
index a098bf8eea..0000000000
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
+++ /dev/null
@@ -1,134 +0,0 @@
-SUMMARY = "A simple daemon to allow session software to update firmware"
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-DEPENDS = "glib-2.0 libxmlb json-glib libjcat gcab vala-native python3-jinja2-native"
-
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-           file://run-ptest"
-SRC_URI[sha256sum] = "a1d484778ae87c69b38f417659b33fe3d689373ce0831d1f95617b8aa76e8c37"
-
-UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-
-# Machine-specific as we examine MACHINE_FEATURES to decide whether to build the UEFI plugins
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit meson vala gobject-introspection systemd bash-completion pkgconfig gi-docgen ptest manpages
-
-GIDOCGEN_MESON_OPTION = 'docs'
-GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
-GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
-GIR_MESON_ENABLE_FLAG = 'enabled'
-GIR_MESON_DISABLE_FLAG = 'disabled'
-
-PACKAGECONFIG ??= "curl gnutls gudev gusb \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'bluetooth polkit', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd offline', '', d)} \
-                   ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'plugin_uefi_capsule plugin_uefi_pk', '', d)} \
-                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
-                   hsi \
-                   plugin_android_boot \
-                   plugin_acpi_phat \
-                   plugin_bcm57xx \
-                   plugin_emmc \
-                   plugin_ep963x \
-                   plugin_fastboot \
-                   plugin_flashrom \
-                   plugin_gpio \
-                   plugin_igsc \
-                   plugin_intel_me \
-                   plugin_intel_spi \
-                   plugin_logitech_bulkcontroller \
-                   plugin_logitech_scribe \
-                   plugin_modem_manager \
-                   plugin_msr \
-                   plugin_nitrokey \
-                   plugin_nvme \
-                   plugin_parade_lspcon \
-                   plugin_pixart_rf \
-                   plugin_realtek_mst \
-                   plugin_redfish \
-                   plugin_synaptics_mst \
-                   plugin_synaptics_rmi \
-                   plugin_scsi \
-                   plugin_uf2 \
-                   plugin_upower \
-                   sqlite"
-
-PACKAGECONFIG[bluetooth] = "-Dbluez=enabled,-Dbluez=disabled"
-PACKAGECONFIG[compat-cli] = "-Dcompat_cli=true,-Dcompat_cli=false"
-PACKAGECONFIG[consolekit] = "-Dconsolekit=enabled,-Dconsolekit=disabled,consolekit"
-PACKAGECONFIG[curl] = "-Dcurl=enabled,-Dcurl=disabled,curl"
-PACKAGECONFIG[firmware-packager] = "-Dfirmware-packager=true,-Dfirmware-packager=false"
-PACKAGECONFIG[fish-completion] = "-Dfish_completion=true,-Dfish_completion=false"
-PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
-PACKAGECONFIG[gudev] = "-Dgudev=enabled,-Dgudev=disabled,libgudev"
-PACKAGECONFIG[gusb] = "-Dgusb=enabled,-Dgusb=disabled,libgusb"
-PACKAGECONFIG[hsi] = "-Dhsi=enabled,-Dhsi=disabled"
-PACKAGECONFIG[libarchive] = "-Dlibarchive=enabled,-Dlibarchive=disabled,libarchive"
-PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false"
-PACKAGECONFIG[metainfo] = "-Dmetainfo=true,-Dmetainfo=false"
-PACKAGECONFIG[offline] = "-Doffline=enabled,-Doffline=disabled"
-PACKAGECONFIG[polkit] = "-Dpolkit=enabled,-Dpolkit=disabled,polkit"
-PACKAGECONFIG[sqlite] = "-Dsqlite=enabled,-Dsqlite=disabled,sqlite3"
-PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
-PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,gcab-native"
-
-
-# TODO plugins-all meta-option that expands to all plugin_*?
-PACKAGECONFIG[plugin_acpi_phat] = "-Dplugin_acpi_phat=enabled,-Dplugin_acpi_phat=disabled"
-PACKAGECONFIG[plugin_android_boot] = "-Dplugin_android_boot=enabled,-Dplugin_android_boot=disabled"
-PACKAGECONFIG[plugin_bcm57xx] = "-Dplugin_bcm57xx=enabled,-Dplugin_bcm57xx=disabled"
-PACKAGECONFIG[plugin_cfu] = "-Dplugin_cfu=enabled,-Dplugin_cfu=disabled"
-PACKAGECONFIG[plugin_emmc] = "-Dplugin_emmc=enabled,-Dplugin_emmc=disabled"
-PACKAGECONFIG[plugin_ep963x] = "-Dplugin_ep963x=enabled,-Dplugin_ep963x=disabled"
-PACKAGECONFIG[plugin_fastboot] = "-Dplugin_fastboot=enabled,-Dplugin_fastboot=disabled"
-PACKAGECONFIG[plugin_flashrom] = "-Dplugin_flashrom=enabled,-Dplugin_flashrom=disabled,flashrom"
-PACKAGECONFIG[plugin_gpio] = "-Dplugin_gpio=enabled,-Dplugin_gpio=disabled"
-PACKAGECONFIG[plugin_igsc] = "-Dplugin_igsc=enabled,-Dplugin_igsc=disabled"
-PACKAGECONFIG[plugin_intel_me] = "-Dplugin_intel_me=enabled,-Dplugin_intel_me=disabled"
-PACKAGECONFIG[plugin_intel_spi] = "-Dplugin_intel_spi=true -Dlzma=enabled,-Dplugin_intel_spi=false -Dlzma=disabled,xz"
-PACKAGECONFIG[plugin_logitech_bulkcontroller] = "-Dplugin_logitech_bulkcontroller=enabled,-Dplugin_logitech_bulkcontroller=disabled,protobuf-c-native protobuf-c"
-PACKAGECONFIG[plugin_logitech_scribe] = "-Dplugin_logitech_scribe=enabled,-Dplugin_logitech_scribe=disabled"
-PACKAGECONFIG[plugin_modem_manager] = "-Dplugin_modem_manager=enabled,-Dplugin_modem_manager=disabled,libqmi modemmanager"
-PACKAGECONFIG[plugin_msr] = "-Dplugin_msr=enabled,-Dplugin_msr=disabled,cpuid"
-PACKAGECONFIG[plugin_nitrokey] = "-Dplugin_nitrokey=enabled,-Dplugin_nitrokey=disabled"
-PACKAGECONFIG[plugin_nvme] = "-Dplugin_nvme=enabled,-Dplugin_nvme=disabled"
-PACKAGECONFIG[plugin_parade_lspcon] = "-Dplugin_parade_lspcon=enabled,-Dplugin_parade_lspcon=disabled"
-PACKAGECONFIG[plugin_pixart_rf] = "-Dplugin_pixart_rf=enabled,-Dplugin_pixart_rf=disabled"
-PACKAGECONFIG[plugin_powerd] = "-Dplugin_powerd=enabled,-Dplugin_powerd=disabled"
-PACKAGECONFIG[plugin_realtek_mst] = "-Dplugin_realtek_mst=enabled,-Dplugin_realtek_mst=disabled"
-PACKAGECONFIG[plugin_redfish] = "-Dplugin_redfish=enabled,-Dplugin_redfish=disabled"
-PACKAGECONFIG[plugin_scsi] = "-Dplugin_scsi=enabled,-Dplugin_scsi=disabled"
-PACKAGECONFIG[plugin_synaptics_mst] = "-Dplugin_synaptics_mst=enabled,-Dplugin_synaptics_mst=disabled"
-PACKAGECONFIG[plugin_synaptics_rmi] = "-Dplugin_synaptics_rmi=enabled,-Dplugin_synaptics_rmi=disabled"
-PACKAGECONFIG[plugin_tpm] = "-Dplugin_tpm=enabled,-Dplugin_tpm=disabled,tpm2-tss"
-# Turn off the capsule splash as it needs G-I at buildtime, which isn't currently supported
-PACKAGECONFIG[plugin_uefi_capsule] = "-Dplugin_uefi_capsule=enabled -Dplugin_uefi_capsule_splash=false,-Dplugin_uefi_capsule=disabled,efivar fwupd-efi"
-PACKAGECONFIG[plugin_uefi_pk] = "-Dplugin_uefi_pk=enabled,-Dplugin_uefi_pk=disabled"
-PACKAGECONFIG[plugin_uf2] = "-Dplugin_uf2=enabled,-Dplugin_uf2=disabled"
-PACKAGECONFIG[plugin_upower] = "-Dplugin_upower=enabled,-Dplugin_upower=disabled"
-
-# Always disable these plugins on non-x86 platforms as they don't compile or are useless
-DISABLE_NON_X86 = "plugin_intel_me plugin_intel_spi plugin_msr"
-DISABLE_NON_X86:x86 = ""
-DISABLE_NON_X86:x86-64 = ""
-PACKAGECONFIG:remove = "${DISABLE_NON_X86}"
-
-FILES:${PN} += "${libdir}/fwupd-plugins-* \
-                ${libdir}/fwupd-${PV} \
-                ${systemd_unitdir} \
-                ${nonarch_libdir}/sysusers.d/fwupd.conf \
-                ${datadir}/fish \
-                ${datadir}/metainfo \
-                ${datadir}/icons \
-                ${datadir}/dbus-1 \
-                ${datadir}/polkit-1 \
-                ${nonarch_libdir}/modules-load.d"
-
-FILES:${PN}-ptest += "${libexecdir}/installed-tests/ \
-                      ${datadir}/installed-tests/"
-RDEPENDS:${PN}-ptest += "gnome-desktop-testing"
-
-INSANE_SKIP:${PN}-ptest += "buildpaths"
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
new file mode 100644
index 0000000000..eb43c3d865
--- /dev/null
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
@@ -0,0 +1,93 @@
+SUMMARY = "A simple daemon to allow session software to update firmware"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "\
+    curl \
+    gcab \
+    glib-2.0 \
+    json-glib \
+    hwdata \
+    libjcat \
+    libusb \
+    libxmlb \
+    python3-jinja2-native \
+    vala-native \
+"
+
+SRC_URI = "\
+    https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+    file://0001-build-certs.py-use-usr-bin-env-for-python3.patch \
+    file://0001-fu-lzma-common.c-reduce-lzma-compression-level-from-.patch \
+    file://run-ptest \
+"
+SRC_URI[sha256sum] = "83eab17ef2e65249491aef5e99419827b43ac56d40c5b0747b59ee94b147215e"
+
+UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+
+# Machine-specific as we examine MACHINE_FEATURES to decide whether to build the UEFI plugins
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit meson vala gobject-introspection systemd bash-completion pkgconfig gi-docgen ptest manpages
+
+GIDOCGEN_MESON_OPTION = 'docs'
+GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
+GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+
+EXTRA_OEMESON = "-Dvendor_ids_dir=${datadir}/hwdata"
+
+PACKAGECONFIG ??= "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'bluetooth polkit', d)} \
+    gnutls \
+    hsi \
+    plugin_flashrom \
+    plugin_modem_manager \
+    protobuf \
+"
+
+PACKAGECONFIG[bluetooth] = "-Dbluez=enabled,-Dbluez=disabled"
+PACKAGECONFIG[firmware-packager] = "-Dfirmware-packager=true,-Dfirmware-packager=false"
+PACKAGECONFIG[fish-completion] = "-Dfish_completion=true,-Dfish_completion=false"
+PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
+PACKAGECONFIG[hsi] = "-Dhsi=enabled,-Dhsi=disabled"
+PACKAGECONFIG[libarchive] = "-Dlibarchive=enabled,-Dlibarchive=disabled,libarchive"
+PACKAGECONFIG[libdrm] = "-Dlibdrm=enabled,-Dlibdrm=disabled,libdrm"
+PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false"
+PACKAGECONFIG[metainfo] = "-Dmetainfo=true,-Dmetainfo=false"
+PACKAGECONFIG[polkit] = "-Dpolkit=enabled,-Dpolkit=disabled,polkit"
+PACKAGECONFIG[readline] = "-Dreadline=enabled,-Dreadline=disabled,readline"
+PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
+PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,gcab-native"
+
+# TODO plugins-all meta-option that expands to all plugin_*?
+PACKAGECONFIG[plugin_flashrom] = "-Dplugin_flashrom=enabled,-Dplugin_flashrom=disabled,flashrom"
+PACKAGECONFIG[protobuf] = "-Dprotobuf=enabled,-Dprotobuf=disabled,protobuf-c-native protobuf-c"
+PACKAGECONFIG[plugin_modem_manager] = "-Dplugin_modem_manager=enabled,-Dplugin_modem_manager=disabled,libqmi modemmanager"
+PACKAGECONFIG[plugin_uefi_capsule_splash] = "-Dplugin_uefi_capsule_splash=true,-Dplugin_uefi_capsule_splash=false,python3-pygobject"
+
+FILES:${PN} += "\
+    ${libdir}/fwupd-plugins-* \
+    ${libdir}/fwupd-${PV} \
+    ${systemd_unitdir} \
+    ${nonarch_libdir}/sysusers.d/fwupd.conf \
+    ${datadir}/fish \
+    ${datadir}/metainfo \
+    ${datadir}/icons \
+    ${datadir}/dbus-1 \
+    ${datadir}/polkit-1 \
+    ${nonarch_libdir}/modules-load.d \
+"
+
+FILES:${PN}-ptest += "${libexecdir}/installed-tests/ \
+                      ${datadir}/installed-tests/"
+RDEPENDS:${PN}-ptest += "gnome-desktop-testing python3"
+
+# ESP mounting, not strictly necessary
+RRECOMMENDS:${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'udisks2', '', d)}"
+
+INSANE_SKIP:${PN}-ptest += "buildpaths"

