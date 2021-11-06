Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5FBC433EF
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 19:52:06 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.23205.1636228325099452189
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Nov 2021 12:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gCtfWjOI;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id p17so10834087qkj.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Nov 2021 12:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LYCpH/lxBr0BY3IxRhkHgMsSQqFTj1lkvKhuUbF8ICQ=;
        b=gCtfWjOIHH6RxJQ+Q38UUrSnb/0WeBpB0DtEnsKvS4R6z1PXH5jr4RdjGst3R47fTF
         eRzHeO/bFq2r6hlxdqgN354BKJDIhOAn3ZXaJI4xhxuD3qT6PlJe5w0ytporcPKsgK6/
         caa1db1PNNOV4RVmSbTLy8az/41u5CZEwTa6mnRbhKoZd7Ecpe11zJMHMxEyI17ILM7l
         tQJJ6xvDSYrtg2RfoxY1QcWbM50vmmdp9eSLNx8AZFHZ9KmQGpgjIzcmKe9lhotwkFhl
         NQ9zJ0iBM9ESRGDsdLVrsPKjxuzW5Wo1OnhaIoU4hC85m6BOJs6TPXiGY45pH+k2WEb9
         iptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LYCpH/lxBr0BY3IxRhkHgMsSQqFTj1lkvKhuUbF8ICQ=;
        b=jfT6reMx1qsMl1NuggyZHRXVIPF+6sz8jeI6Mqe7cJBAmwXPV74QvljKBRxv3JTCqf
         0nASFVK+9TX8dnbK8/30d3s0ara3Ef9HXCnciXqCH/ADV1XQp1+WXCoHog86twsNSpM+
         eFMzhafGTg8gx+nwtZDnkkankPMCBoy7aHctz+v1rdi3BtHgcNT975/569LZJ18MU4L1
         U4lRg9Oy3/FVMdw522H02gxbZxigg0YIgbCp7TW4r+/CoYGg1Q//uH4sQOGjpgKF6PWc
         1Kdpl+ic8B9y0D3F80TkI+MTCVdnrCIij7fedKy1t85eVTDL3UnMD4Q0zGOvzTSkwXsn
         rK+Q==
X-Gm-Message-State: AOAM531HnblzKZZLG/0rFn1A83bU5Vl+OQ1pO95unNJ09QjRUooiDVob
	O29vfyQY9/mTRVLMVKYFMrfYDiLHcRmLl4nzPb3qt1nNDo4=
X-Google-Smtp-Source: 
 ABdhPJz5DG1MvvaDVt0pes5jFcE3icuf5EXY0ctItj0TxFjERGDR3+RPs3V0KG98lIeRhTaPXFkFqkYWHO/FGWN/JKk=
X-Received: by 2002:ae9:dc84:: with SMTP id
 q126mr56210907qkf.128.1636228323908;
 Sat, 06 Nov 2021 12:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211105194052.2934833-1-ross.burton@arm.com>
In-Reply-To: <20211105194052.2934833-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Nov 2021 12:51:37 -0700
Message-ID: 
 <CAMKF1sowhr1aFBjE+WBZaKmzK7oVcGquk6Aa9UZGno8XEH8crg@mail.gmail.com>
Subject: Re: [oe] [PATCH v2] fwupd: add new recipe
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Nov 2021 19:52:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93862

Hi Ross

this fails to compile on x86/x86_64

https://errors.yoctoproject.org/Errors/Details/616488/
https://errors.yoctoproject.org/Errors/Details/616487/

On Fri, Nov 5, 2021 at 12:43 PM Ross Burton <ross@burtonini.com> wrote:
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch | 141 ++++++++++++++++++
>  meta-oe/recipes-bsp/fwupd/fwupd/run-ptest     |   6 +
>  meta-oe/recipes-bsp/fwupd/fwupd_1.7.1.bb      | 101 +++++++++++++
>  3 files changed, 248 insertions(+)
>  create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch
>  create mode 100755 meta-oe/recipes-bsp/fwupd/fwupd/run-ptest
>  create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd_1.7.1.bb
>
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch b/meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch
> new file mode 100644
> index 0000000000..e0f83c4b6c
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch
> @@ -0,0 +1,141 @@
> +Upstream-Status: Backport [a346c582cc0f34ac6c7c11251919c84553424efb]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +diff --git a/data/installed-tests/fwupd.sh b/data/installed-tests/fwupd.sh
> +index 5b1f5d22..eaa5ec7f 100755
> +--- a/data/installed-tests/fwupd.sh
> ++++ b/data/installed-tests/fwupd.sh
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> +
> + exec 2>&1
> + dirname=`dirname $0`
> +@@ -7,7 +7,7 @@ run_test()
> + {
> +         if [ -f $dirname/$1 ]; then
> +                 $dirname/$1
> +-                rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
> ++                rc=$?; if [ $rc != 0 ]; then exit $rc; fi
> +         fi
> + }
> +
> +diff --git a/data/installed-tests/fwupdmgr.sh b/data/installed-tests/fwupdmgr.sh
> +index e3f7ee31..3d65395e 100755
> +--- a/data/installed-tests/fwupdmgr.sh
> ++++ b/data/installed-tests/fwupdmgr.sh
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> +
> + exec 2>&1
> + device=08d460be0f1f9f128413f816022a6439e0078018
> +@@ -13,47 +13,47 @@ error()
> + # ---
> + echo "Getting the list of remotes..."
> + fwupdmgr get-remotes
> +-rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> ++rc=$?; if [ $rc != 0 ]; then error $rc; fi
> +
> + # ---
> + echo "Enabling fwupd-tests remote..."
> + fwupdmgr enable-remote fwupd-tests
> +-rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> ++rc=$?; if [ $rc != 0 ]; then error $rc; fi
> +
> + # ---
> + echo "Update the device hash database..."
> + fwupdmgr verify-update $device
> +-rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> ++rc=$?; if [ $rc != 0 ]; then error $rc; fi
> +
> + # ---
> + echo "Getting devices (should be one)..."
> + fwupdmgr get-devices --no-unreported-check
> +-rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> ++rc=$?; if [ $rc != 0 ]; then error $rc; fi
> +
> + # ---
> + echo "Testing the verification of firmware..."
> + fwupdmgr verify $device
> +-rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> ++rc=$?; if [ $rc != 0 ]; then error $rc; fi
> +
> + # ---
> + echo "Getting updates (should be one)..."
> + fwupdmgr --no-unreported-check --no-metadata-check get-updates
> +-rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> ++rc=$?; if [ $rc != 0 ]; then error $rc; fi
> +
> + # ---
> + echo "Installing test firmware..."
> + fwupdmgr update $device -y
> +-rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> ++rc=$?; if [ $rc != 0 ]; then error $rc; fi
> +
> + # ---
> + echo "Getting updates (should be none)..."
> + fwupdmgr --no-unreported-check --no-metadata-check get-updates
> +-rc=$?; if [[ $rc != 2 ]]; then error $rc; fi
> ++rc=$?; if [ $rc != 2 ]; then error $rc; fi
> +
> + # ---
> + echo "Testing the verification of firmware (again)..."
> + fwupdmgr verify $device
> +-rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> ++rc=$?; if [ $rc != 0 ]; then error $rc; fi
> +
> + if [ -z "$CI_NETWORK" ]; then
> +         echo "Skipping remaining tests due to CI_NETWORK not being set"
> +@@ -63,27 +63,27 @@ fi
> + # ---
> + echo "Downgrading to older release (requires network access)"
> + fwupdmgr downgrade $device -y
> +-rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> ++rc=$?; if [ $rc != 0 ]; then error $rc; fi
> +
> + # ---
> + echo "Downgrading to older release (should be none)"
> + fwupdmgr downgrade $device
> +-rc=$?; if [[ $rc != 2 ]]; then error $rc; fi
> ++rc=$?; if [ $rc != 2 ]; then error $rc; fi
> +
> + # ---
> + echo "Updating all devices to latest release (requires network access)"
> + fwupdmgr --no-unreported-check --no-metadata-check --no-reboot-check update -y
> +-rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> ++rc=$?; if [ $rc != 0 ]; then error $rc; fi
> +
> + # ---
> + echo "Getting updates (should be none)..."
> + fwupdmgr --no-unreported-check --no-metadata-check get-updates
> +-rc=$?; if [[ $rc != 2 ]]; then error $rc; fi
> ++rc=$?; if [ $rc != 2 ]; then error $rc; fi
> +
> + # ---
> + echo "Refreshing from the LVFS (requires network access)..."
> + fwupdmgr refresh
> +-rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> ++rc=$?; if [ $rc != 0 ]; then error $rc; fi
> +
> + # success!
> + exit 0
> +diff --git a/plugins/uefi-capsule/fwupd.grub.conf.in b/plugins/uefi-capsule/fwupd.grub.conf.in
> +index 92bd49a1..9c3a22f2 100755
> +--- a/plugins/uefi-capsule/fwupd.grub.conf.in
> ++++ b/plugins/uefi-capsule/fwupd.grub.conf.in
> +@@ -1,4 +1,4 @@
> +-#! /bin/bash
> ++#! /bin/sh
> + # SPDX-License-Identifier: LGPL-2.1+
> + set -e
> +
> +@@ -8,7 +8,7 @@ set -e
> +
> + if [ -f @localstatedir@/lib/fwupd/uefi_capsule.conf ] &&
> +    ls /sys/firmware/efi/efivars/fwupd-*-0abba7dc-e516-4167-bbf5-4d9d1c739416 1>/dev/null 2>&1; then
> +-      source @localstatedir@/lib/fwupd/uefi_capsule.conf
> ++      . @localstatedir@/lib/fwupd/uefi_capsule.conf
> +       if [ "${EFI_PATH}" != "" ] && [ "${ESP}" != "" ]; then
> +       echo "Adding Linux Firmware Updater entry" >&2
> + cat << EOF
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/run-ptest b/meta-oe/recipes-bsp/fwupd/fwupd/run-ptest
> new file mode 100755
> index 0000000000..dbc0fc32a2
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/fwupd/fwupd/run-ptest
> @@ -0,0 +1,6 @@
> +#! /bin/sh
> +
> +# Don't run all of the fwupd tests, as fwupd/fwupdmgr.test needs a custom
> +# /etc/fwupd/daemon.conf with DisabledPlugins unset.
> +
> +gnome-desktop-testing-runner fwupd/fwupd.test
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.1.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.1.bb
> new file mode 100644
> index 0000000000..697e6b9414
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.1.bb
> @@ -0,0 +1,101 @@
> +SUMMARY = "A simple daemon to allow session software to update firmware"
> +LICENSE = "LGPL-2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +DEPENDS = "glib-2.0 libxmlb json-glib sqlite3 libjcat gcab vala-native"
> +
> +SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/1.7.1/${BP}.tar.xz \
> +           file://run-ptest \
> +           file://no-bash.patch"
> +SRC_URI[sha256sum] = "ae56ceb44b786f21f54d133ac70bc5d9cb8cd4bda0167339c669a228da67fa3c"
> +
> +UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
> +
> +# Machine-specific as we examine MACHINE_FEATURES to decide whether to build the UEFI plugins
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit meson vala gobject-introspection systemd bash-completion pkgconfig gi-docgen ptest manpages
> +
> +GIDOCGEN_MESON_OPTION = 'docs'
> +GIDOCGEN_MESON_ENABLE_FLAG = 'docgen'
> +GIDOCGEN_MESON_DISABLE_FLAG = 'none'
> +
> +PACKAGECONFIG ??= "gnutls gudev gusb curl \
> +                   ${@bb.utils.filter('DISTRO_FEATURES', 'polkit systemd', d)} \
> +                   ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'plugin_uefi_capsule plugin_uefi_pk', '', d)} \
> +                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests plugin_dummy', '', d)} \
> +                   plugin_altos \
> +                   plugin_amt \
> +                   plugin_emmc \
> +                   plugin_fastboot \
> +                   plugin_flashrom \
> +                   plugin_intel_spi \
> +                   plugin_logitech_bulkcontroller \
> +                   plugin_modem_manager \
> +                   plugin_msr \
> +                   plugin_nvme \
> +                   plugin_parade_lspcon \
> +                   plugin_platform_integrity \
> +                   plugin_realtek_mst \
> +                   plugin_redfish \
> +                   plugin_synaptics_mst \
> +                   plugin_synaptics_rmi \
> +                   plugin_thunderbolt"
> +
> +PACKAGECONFIG[bluez] = "-Dbluez=true,-Dbluez=false"
> +PACKAGECONFIG[consolekit] = "-Dconsolekit=true,-Dconsolekit=false,consolekit"
> +PACKAGECONFIG[curl] = "-Dcurl=true,-Dcurl=false,curl"
> +PACKAGECONFIG[firmware-packager] = "-Dfirmware-packager=true,-Dfirmware-packager=false"
> +PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
> +PACKAGECONFIG[gudev] = "-Dgudev=true,-Dgudev=false,libgudev"
> +PACKAGECONFIG[gusb] = "-Dgusb=true,-Dgusb=false,libgusb"
> +PACKAGECONFIG[libarchive] = "-Dlibarchive=true,-Dlibarchive=false,libarchive"
> +PACKAGECONFIG[lzma] = "-Dlzma=true,-Dlzma=false,xz"
> +PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false"
> +PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false,polkit"
> +PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
> +PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,gcab-native"
> +
> +# TODO plugins-all meta-option that expands to all plugin_*?
> +PACKAGECONFIG[plugin_altos] = "-Dplugin_altos=true,-Dplugin_altos=false,elfutils"
> +PACKAGECONFIG[plugin_amt] = "-Dplugin_amt=true,-Dplugin_amt=false"
> +PACKAGECONFIG[plugin_dell] = "-Dplugin_dell=true,-Dplugin_dell=false,libsmbios"
> +PACKAGECONFIG[plugin_dummy] = "-Dplugin_dummy=true,-Dplugin_dummy=false"
> +PACKAGECONFIG[plugin_emmc] = "-Dplugin_emmc=true,-Dplugin_emmc=false"
> +PACKAGECONFIG[plugin_fastboot] = "-Dplugin_fastboot=true,-Dplugin_fastboot=false"
> +PACKAGECONFIG[plugin_flashrom] = "-Dplugin_flashrom=true,-Dplugin_flashrom=false,flashrom"
> +PACKAGECONFIG[plugin_intel_spi] = "-Dplugin_intel_spi=true,-Dplugin_intel_spi=false"
> +PACKAGECONFIG[plugin_logitech_bulkcontroller] = "-Dplugin_logitech_bulkcontroller=true,-Dplugin_logitech_bulkcontroller=false,protobuf-c-native protobuf-c"
> +PACKAGECONFIG[plugin_modem_manager] = "-Dplugin_modem_manager=true,-Dplugin_modem_manager=false,libqmi modemmanager"
> +PACKAGECONFIG[plugin_msr] = "-Dplugin_msr=true,-Dplugin_msr=false,cpuid"
> +PACKAGECONFIG[plugin_nvme] = "-Dplugin_nvme=true,-Dplugin_nvme=false"
> +PACKAGECONFIG[plugin_parade_lspcon] = "-Dplugin_parade_lspcon=true,-Dplugin_parade_lspcon=false"
> +PACKAGECONFIG[plugin_platform_integrity] = "-Dplugin_platform_integrity=true,-Dplugin_platform_integrity=false"
> +PACKAGECONFIG[plugin_realtek_mst] = "-Dplugin_realtek_mst=true,-Dplugin_realtek_mst=false"
> +PACKAGECONFIG[plugin_redfish] = "-Dplugin_redfish=true,-Dplugin_redfish=false"
> +PACKAGECONFIG[plugin_synaptics_mst] = "-Dplugin_synaptics_mst=true,-Dplugin_synaptics_mst=false"
> +PACKAGECONFIG[plugin_synaptics_rmi] = "-Dplugin_synaptics_rmi=true,-Dplugin_synaptics_rmi=false"
> +PACKAGECONFIG[plugin_thunderbolt] = "-Dplugin_thunderbolt=true,-Dplugin_thunderbolt=false"
> +PACKAGECONFIG[plugin_tpm] = "-Dplugin_tpm=true,-Dplugin_tpm=false,tpm2-tss"
> +# Turn off the capsule splash as it needs G-I at buildtime, which isn't currently supported
> +PACKAGECONFIG[plugin_uefi_capsule] = "-Dplugin_uefi_capsule=true -Dplugin_uefi_capsule_splash=false,-Dplugin_uefi_capsule=false,efivar fwupd-efi"
> +PACKAGECONFIG[plugin_uefi_pk] = "-Dplugin_uefi_pk=true,-Dplugin_uefi_pk=false"
> +
> +# Always disable these plugins on non-x86 platforms as they don't compile
> +DISABLE_NON_X86 = "plugin_msr plugin_intel_spi"
> +DISABLE_NON_X86:x86 = ""
> +DISABLE_NON_X86:x86-64 = ""
> +PACKAGECONFIG:remove = "${DISABLE_NON_X86}"
> +
> +FILES:${PN} += "${libdir}/fwupd-plugins-* \
> +                ${systemd_unitdir} \
> +                ${datadir}/fish \
> +                ${datadir}/metainfo \
> +                ${datadir}/icons \
> +                ${datadir}/dbus-1 \
> +                ${datadir}/polkit-1 \
> +                ${nonarch_libdir}/modules-load.d"
> +
> +FILES:${PN}-ptest += "${libexecdir}/installed-tests/ \
> +                      ${datadir}/installed-tests/"
> +RDEPENDS:${PN}-ptest += "gnome-desktop-testing"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93849): https://lists.openembedded.org/g/openembedded-devel/message/93849
> Mute This Topic: https://lists.openembedded.org/mt/86849594/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

