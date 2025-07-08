Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B21C83F0F
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 10:03:53 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.14972.1751969031584169843
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 03:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mOou5QsX;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54d98aa5981so5449696e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 03:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751969029; x=1752573829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=squekDr7lt1IVmsNB6Xr8oEU0EkN0mHmXglCK9cJR8s=;
        b=mOou5QsXO0OAN4MILnvKPR+odC78qohehOp9DR3QH125DepSdySnY0oG7s+2dv8+RK
         elsUnpDYDPOdaiiLpThQ9ePDtHU23UfGzkdYHlddiVSh0o0mNDyyfGnY9vP8bFj8Zix1
         MlgOBOA8SUTBcsZRAXhb7DS636X5rR5LyevYDM2f3Xc7KV0XM1O1fq5BM/B9AhQuEfit
         SDZvd51sHb2DyzVImvhw7P0aKGNu5NTDGE/hCi8xU1mUpJKn2+B/8SsfemX7otmD85kU
         GLkExvw+CkD71TNSb1iWT9HByDobY0mXww+lXco7h0GEa/vtuuRVSn0OiIKxB+DBd424
         SHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969029; x=1752573829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=squekDr7lt1IVmsNB6Xr8oEU0EkN0mHmXglCK9cJR8s=;
        b=d7+zBv1WYdbIX29uvl3Irdf7Mgra+fIC1M2EO7bfpW+n9hqml3VI49iQTNGlhQ/7Mh
         fKhhL0QnGzTt+dYXp6REOtAXmSPxWXgsZ1ZYvslbXqid+LfYIeT9FPav69b0+762yVbc
         cCOxTM8NFrejgEpXv0XSbPrYpqEPGKAh4l7JkF1ISvaQ6vZXyO4OhHycUDAO5ftditoT
         FyV3Ix0w1olqyjzXJZXFtm9Bx5ftB5IsRXUaA7OzZ1zSD/OG37uLoYGZMcG1xUROAeqH
         G6wx318UZkr8FsVEQpV+szNySonH0wohSHlNFoNFd/mcfu5ezklCrXZ31SU6vTeB4vy/
         YK5g==
X-Gm-Message-State: AOJu0Yz574CGI7xACKYymp8UnxY4Sz+YeU1KXwgFQ6Z/Z3stGtO1zgmt
	ge61yRgxdIKtyJqkoW1K5rF8bTeS4+XJfJ8Io2qIUe+XPw+KA8L7Gxudd2uHDGgc3cM3C8y5XNt
	sifis
X-Gm-Gg: ASbGnct6IktV9wYo7wHOO3KVJS2Fh8UDujPc7EgPqRDq6eEGtqSROrfVg6oKLrU4q1R
	m+bkO3eRKD9uRIVVigrtIIvrGQS6dlZ9Ohe6j5FTMRKOzdUjPaCfWkqRCSVJHs+/bgXjQ6Fm7F1
	3FEtD1/eZJy2NWWFBixOppgDxPArM11e/6r9b69MOIljWvEgUwN8aU9oEVSp48qcu82FSXPz75J
	iO1MqpjapXvZpR8VIMwtNF4dG3gk4n1GBqAfYMy0tVw04+3HWiKCApXavLmCIIOZ7FQWeQ4JB1c
	b4UEOWSt8YP0EW1CIKN0hMllDhQ/oV7jkFWROFwDfx2yU95a0cknfULN2SxD8j8S6hwRliZWbst
	ZXe/n9BukJY1qZpYHJg0eOJqAkugGkOAa+ffV5Cw=
X-Google-Smtp-Source: AGHT+IFl11uly7DoltFN+ofMQNZPJ9cGTgmKoJsytBA74e3L7vZ8tl4YEgReeNaVnVoPyNmzCthOSw==
X-Received: by 2002:a05:6512:2309:b0:553:ccef:e318 with SMTP id 2adb3069b0e04-557aa680289mr4951641e87.41.1751969029244;
        Tue, 08 Jul 2025 03:03:49 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d9013sm1623585e87.84.2025.07.08.03.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:03:48 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [meta-oe][PATCH 3/4] fwupd: update to 2.0.12
Date: Tue,  8 Jul 2025 13:03:28 +0300
Message-ID: <20250708100330.138561-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708100330.138561-1-mikko.rapeli@linaro.org>
References: <20250708100330.138561-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 10:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118305

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
---
 ...certs.py-use-usr-bin-env-for-python3.patch |  28 ++++
 ...-reduce-lzma-compression-level-from-.patch |  47 ++++++
 meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb     | 137 ++++++------------
 3 files changed, 120 insertions(+), 92 deletions(-)
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-build-certs.py-use-usr-bin-env-for-python3.patch
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-fu-lzma-common.c-reduce-lzma-compression-level-from-.patch

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/0001-build-certs.py-use-usr-bin-env-for-python3.patch b/meta-oe/recipes-bsp/fwupd/fwupd/0001-build-certs.py-use-usr-bin-env-for-python3.patch
new file mode 100644
index 000000000000..3a4ecb1f29e2
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
index 000000000000..b0d3863eaa2e
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
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
index 52d80be05b41..f7a53979ee68 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
@@ -2,11 +2,25 @@ SUMMARY = "A simple daemon to allow session software to update firmware"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "glib-2.0 libxmlb json-glib libjcat gcab vala-native python3-jinja2-native"
+DEPENDS = "\
+    curl \
+    gcab \
+    glib-2.0 \
+    json-glib \
+    libjcat \
+    libusb \
+    libxmlb \
+    python3-jinja2-native \
+    vala-native \
+"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-           file://run-ptest"
-SRC_URI[sha256sum] = "a69de9a494a364095cc820faa10a68ec38d31f55eed5388322182048b81d10b3"
+SRC_URI = "\
+    https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+    file://0001-build-certs.py-use-usr-bin-env-for-python3.patch \
+    file://0001-fu-lzma-common.c-reduce-lzma-compression-level-from-.patch \
+    file://run-ptest \
+"
+SRC_URI[sha256sum] = "83eab17ef2e65249491aef5e99419827b43ac56d40c5b0747b59ee94b147215e"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
@@ -22,113 +36,52 @@ GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 
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
 
 PACKAGECONFIG[bluetooth] = "-Dbluez=enabled,-Dbluez=disabled"
-PACKAGECONFIG[compat-cli] = "-Dcompat_cli=true,-Dcompat_cli=false"
-PACKAGECONFIG[consolekit] = "-Dconsolekit=enabled,-Dconsolekit=disabled,consolekit"
-PACKAGECONFIG[curl] = "-Dcurl=enabled,-Dcurl=disabled,curl"
 PACKAGECONFIG[firmware-packager] = "-Dfirmware-packager=true,-Dfirmware-packager=false"
 PACKAGECONFIG[fish-completion] = "-Dfish_completion=true,-Dfish_completion=false"
 PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
-PACKAGECONFIG[gudev] = "-Dgudev=enabled,-Dgudev=disabled,libgudev"
-PACKAGECONFIG[gusb] = "-Dgusb=enabled,-Dgusb=disabled,libgusb"
 PACKAGECONFIG[hsi] = "-Dhsi=enabled,-Dhsi=disabled"
 PACKAGECONFIG[libarchive] = "-Dlibarchive=enabled,-Dlibarchive=disabled,libarchive"
+PACKAGECONFIG[libdrm] = "-Dlibdrm=enabled,-Dlibdrm=disabled,libdrm"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false"
 PACKAGECONFIG[metainfo] = "-Dmetainfo=true,-Dmetainfo=false"
-PACKAGECONFIG[offline] = "-Doffline=enabled,-Doffline=disabled"
 PACKAGECONFIG[polkit] = "-Dpolkit=enabled,-Dpolkit=disabled,polkit"
-PACKAGECONFIG[sqlite] = "-Dsqlite=enabled,-Dsqlite=disabled,sqlite3"
+PACKAGECONFIG[readline] = "-Dreadline=enabled,-Dreadline=disabled,readline"
 PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,gcab-native"
 
-
 # TODO plugins-all meta-option that expands to all plugin_*?
-PACKAGECONFIG[plugin_acpi_phat] = "-Dplugin_acpi_phat=enabled,-Dplugin_acpi_phat=disabled"
-PACKAGECONFIG[plugin_android_boot] = "-Dplugin_android_boot=enabled,-Dplugin_android_boot=disabled"
-PACKAGECONFIG[plugin_bcm57xx] = "-Dplugin_bcm57xx=enabled,-Dplugin_bcm57xx=disabled"
-PACKAGECONFIG[plugin_cfu] = "-Dplugin_cfu=enabled,-Dplugin_cfu=disabled"
-PACKAGECONFIG[plugin_emmc] = "-Dplugin_emmc=enabled,-Dplugin_emmc=disabled"
-PACKAGECONFIG[plugin_ep963x] = "-Dplugin_ep963x=enabled,-Dplugin_ep963x=disabled"
-PACKAGECONFIG[plugin_fastboot] = "-Dplugin_fastboot=enabled,-Dplugin_fastboot=disabled"
 PACKAGECONFIG[plugin_flashrom] = "-Dplugin_flashrom=enabled,-Dplugin_flashrom=disabled,flashrom"
-PACKAGECONFIG[plugin_gpio] = "-Dplugin_gpio=enabled,-Dplugin_gpio=disabled"
-PACKAGECONFIG[plugin_igsc] = "-Dplugin_igsc=enabled,-Dplugin_igsc=disabled"
-PACKAGECONFIG[plugin_intel_me] = "-Dplugin_intel_me=enabled,-Dplugin_intel_me=disabled"
-PACKAGECONFIG[plugin_intel_spi] = "-Dplugin_intel_spi=true -Dlzma=enabled,-Dplugin_intel_spi=false -Dlzma=disabled,xz"
-PACKAGECONFIG[plugin_logitech_bulkcontroller] = "-Dplugin_logitech_bulkcontroller=enabled,-Dplugin_logitech_bulkcontroller=disabled,protobuf-c-native protobuf-c"
-PACKAGECONFIG[plugin_logitech_scribe] = "-Dplugin_logitech_scribe=enabled,-Dplugin_logitech_scribe=disabled"
+PACKAGECONFIG[protobuf] = "-Dprotobuf=enabled,-Dprotobuf=disabled,protobuf-c-native protobuf-c"
 PACKAGECONFIG[plugin_modem_manager] = "-Dplugin_modem_manager=enabled,-Dplugin_modem_manager=disabled,libqmi modemmanager"
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
+PACKAGECONFIG[plugin_uefi_capsule_splash] = "-Dplugin_uefi_capsule_splash=true,-Dplugin_uefi_capsule_splash=false,python3-pygobject"
 
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
 
 FILES:${PN}-ptest += "${libexecdir}/installed-tests/ \
                       ${datadir}/installed-tests/"
-RDEPENDS:${PN}-ptest += "gnome-desktop-testing"
+RDEPENDS:${PN}-ptest += "gnome-desktop-testing python3"
 
 INSANE_SKIP:${PN}-ptest += "buildpaths"
-- 
2.43.0


