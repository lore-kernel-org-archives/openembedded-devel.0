Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FDBC83F1A
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 08:55:02 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.4137.1752137700591830910
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 01:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qjf67iJh;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-558f7472d64so1473992e87.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 01:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752137699; x=1752742499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8135OznvrDepoiN/6bbF/p4wcwjrHYzjJP0nrAg2IfU=;
        b=qjf67iJh6UADyAwR4woW+USvnesJChtP6jFrbvo8pDyOwk0aPetd7ehSAEdLN+fr2l
         7ii6QlBBJ87Sxik3GNX8F4Pg201sfBX8oTaAAA3CVeTuo7EGPIPLX4YJ8efu9MdRTUwy
         0Rs8ic/FE13srXnN5XhMi2vUfFbzaFkg09+6sCK9Iof60/8B3vwJJsm0LtDDM4joSnYB
         tO8g1DeFnAFf/r1YCjfiF4LPrWYi4PsEGqru1paUMItGNxszmrONMjDY7u8H4hr8H1dK
         r4VNEaGoVVm/Fi8i+nLJTnCp7MFaE+jint6ZTDES1Bg/ssO/Hcr5RxT/V7P4M6mTQ9NB
         yUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752137699; x=1752742499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8135OznvrDepoiN/6bbF/p4wcwjrHYzjJP0nrAg2IfU=;
        b=b8M1B+AKglfnoHg1PCD2LqbL/IHVQ4WxAJOeW2AHOyxSqo1aCjn5FMxVmtBExl8Qbi
         KyfZ9Acvv+NekPYMYp/pw0ZBmmitkxcrJVtbwYalBbH2vRMOJ5a9skfgSdAMTUwudKZ9
         +Vgc0i1l9QS/s1qKiHO2XYUxlLboN0f4pfQXOPNKeX54qU328jujr3NKoKP6BghlTgEm
         wwv5wbiu77pgWu+Vkvhtv51J5rK2++ZA8w2B2V0ipXaHrFkpTofhrxEKr7eGRl2ZNlh5
         mT0bxo2LHvRUBgYz8dVFp7KJuryeMcXau7eX0NgbwVgs9j9hUaBtB/WJlONoqxsaVxWp
         6m8A==
X-Gm-Message-State: AOJu0YxOrzYwKipp13u4O3N50AWh/90aF0XhXO2quNCV3LuJRCXb1kaD
	ZWcBhIlMUYQsBelGF8oOkGgREMnXXUII7W2vvlC8fGkW3ViG8YPQOSL5bh3jcKzf2SqS7rmSh6V
	iv99e
X-Gm-Gg: ASbGncsMkzHXdbna9vax1xG5Ef4XBQyUtf3zTbjSCLs6u+u5oex+CgH184kjAp/6lQq
	yg7nQ+PyWuY+1pBmzmhAV/KQn5emyFAau7ZeZxHia/f5HVTocpqUJ15z8HjelSOVEfJCLKU0uQo
	XMWLxI6kxGcRmrAd4djMyn0r1bwEdaQlx/OxcGg6blCSV1PKTh/WRiFdHGQlvGWTEc5EAIB3Agi
	1xZQPtQy297ogvn8tJS2L7q6hawBH9e5hcZcXFLzBQlS+tQh0Uf7AL8wLXcKsTYsAllwjFRzMr2
	i2AkZAbh884XadDmZN/LmOc8mlFHJ8xD0tEpEt0a7lmEMxpliAPJCE1kP1kvo7ML75EvkjPM8EV
	voo2WGVmiZs0a5Yu2JNpIHeWKqfgsHp2hqFtoSlo=
X-Google-Smtp-Source: AGHT+IERcr5Fpob+1jZbj3MX87aPXwbeC8YcFMnciShqbo45m6JiwftBgjucJyey68EaP/YoIEqZnQ==
X-Received: by 2002:a05:6512:3083:b0:557:e3be:c7c5 with SMTP id 2adb3069b0e04-5590073d65emr779038e87.28.1752137698541;
        Thu, 10 Jul 2025 01:54:58 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b6bb33sm282286e87.174.2025.07.10.01.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 01:54:58 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 3/4] fwupd: update to 2.0.12
Date: Thu, 10 Jul 2025 11:54:37 +0300
Message-ID: <20250710085438.270911-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710085438.270911-1-mikko.rapeli@linaro.org>
References: <20250710085438.270911-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 08:55:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118402

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
 meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb     | 138 ++++++------------
 3 files changed, 121 insertions(+), 92 deletions(-)
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-build-certs.py-use-usr-bin-env-for-python3.patch
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-fu-lzma-common.c-reduce-lzma-compression-level-from-.patch

v2: added build dependency to hwdata to fix build error:
    https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2928031/raw_inline
    | ../sources/fwupd-2.0.12/meson.build:323:4: ERROR: Problem encountered: could not auto-detect -Dvendor_ids_dir=

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
index 52d80be05b41..ce21ad42fed9 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
@@ -2,11 +2,26 @@ SUMMARY = "A simple daemon to allow session software to update firmware"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "glib-2.0 libxmlb json-glib libjcat gcab vala-native python3-jinja2-native"
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
@@ -22,113 +37,52 @@ GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
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


