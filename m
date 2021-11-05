Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3609CC433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 19:37:47 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.10564.1636141066074701176
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 12:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=mZzqzlwP;
 spf=pass (domain: burtonini.com, ip: 209.85.128.54,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f54.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso10298940wmc.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 12:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9UH4q9t3bL8iey5BCHa1SKs2hnVVHvmZR7l+E9nlZl8=;
        b=mZzqzlwPxpUobLl7qpFcO2z553rEtN+EzmyUoJVAP9dl7ee/uQyqkUGGlvU4/SvEQs
         7bE3l9e8xenT6wgCoVj5uJpfemPsks5HNWjRdta6IFDbgJp7vFrUsXNrdX/Cm0QKGl05
         VBkFz75CPTrrQE3Tpfqqnq6PGkRu0fdxmQGAKMMx0N/8Gc6hS6X7+n1WDdis3HwqxykU
         i50eSN0kM3hyQBytsMQ2xuzV8eXNzc+pP13gk/8H+zXc2AOsx5QneIUqka4ATa5O7EzZ
         5OynrkL/Pn/WHkSynxgApBfyR2lJzYvx+Ydzi97mR39KlUkQ9W5+njjzzGGg7yOF8WQa
         UEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9UH4q9t3bL8iey5BCHa1SKs2hnVVHvmZR7l+E9nlZl8=;
        b=HK6JdgevjIRMtYWXi3PzTsG0H5qnCSFXUpEeuyg8Gnvdv0LeohRN6EkBnZfnsyhtrD
         YapHNIbLwNROji3v02H5FlvcK3GU9Cs7Vv0Ky9y0kBCil2sEKQxKkocTc/14P4ajTXX5
         LPGLSFPlFvvw5VVlhj83OK1qnM4UM7dkvO7+D/YiVXKr1rT4BqukAuFLLhcg/NsBgf3C
         fsU+BwKFXzmAPmDF9fjda+BqJllIOC3JgPV/FApQWag3jJzl3Wgv6UZqNBzdwWiuZ/2o
         yDgbjKHlSaUXPmqytEyWa4H2gorrS+Y20+NZWGYNOrQZMZZDTlbAnMWK3l+D5pkoi1VD
         4Y5A==
X-Gm-Message-State: AOAM533grVbiAs0MFktJKpCr637jWRIjRvOsi75MNNNr/FxKyp7ntx11
	SBH559Vfsof5gY2X5YSpNIa41Lv8vIDHWMwmuf3AOA==
X-Google-Smtp-Source: 
 ABdhPJy819S56CO/0N89uGeZZymY/vdjukU1QGktWzKsTA+vtWx3/KysaHgOeCwLLg/1W6GscP0EZFLP6zIScIOy0yc=
X-Received: by 2002:a1c:488:: with SMTP id 130mr33113033wme.157.1636141064238;
 Fri, 05 Nov 2021 12:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211105165106.3763152-1-ross.burton@arm.com>
In-Reply-To: <20211105165106.3763152-1-ross.burton@arm.com>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 5 Nov 2021 19:37:33 +0000
Message-ID: 
 <CAAnfSTvuvWdj5kt1-yae7aGb5AtHiKdhsKOcud71ur8JhzxNfg@mail.gmail.com>
Subject: Re: [oe] [PATCH] fwupd: add new recipe
To: ross@burtonini.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000efceaa05d00fc626"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 19:37:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93848

--000000000000efceaa05d00fc626
Content-Type: text/plain; charset="UTF-8"

Bug in this, v2 coming soon.

On Fri, 5 Nov 2021 at 16:51, Ross Burton via lists.openembedded.org <ross=
burtonini.com@lists.openembedded.org> wrote:

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
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch
> b/meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch
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
> +diff --git a/data/installed-tests/fwupdmgr.sh
> b/data/installed-tests/fwupdmgr.sh
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
> + fwupdmgr --no-unreported-check --no-metadata-check --no-reboot-check
> update -y
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
> +diff --git a/plugins/uefi-capsule/fwupd.grub.conf.in
> b/plugins/uefi-capsule/fwupd.grub.conf.in
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
> +    ls
> /sys/firmware/efi/efivars/fwupd-*-0abba7dc-e516-4167-bbf5-4d9d1c739416
> 1>/dev/null 2>&1; then
> +-      source @localstatedir@/lib/fwupd/uefi_capsule.conf
> ++      . @localstatedir@/lib/fwupd/uefi_capsule.conf
> +       if [ "${EFI_PATH}" != "" ] && [ "${ESP}" != "" ]; then
> +       echo "Adding Linux Firmware Updater entry" >&2
> + cat << EOF
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/run-ptest
> b/meta-oe/recipes-bsp/fwupd/fwupd/run-ptest
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
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.1.bb
> b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.1.bb
> new file mode 100644
> index 0000000000..f034b847a3
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.1.bb
> @@ -0,0 +1,101 @@
> +SUMMARY = "A simple daemon to allow session software to update firmware"
> +LICENSE = "LGPL-2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +DEPENDS = "glib-2.0 libxmlb json-glib sqlite3 libjcat gcab vala-native"
> +
> +SRC_URI = "
> https://github.com/${BPN}/${BPN}/releases/download/1.7.1/${BP}.tar.xz \
> +           file://run-ptest \
> +           file://no-bash.patch"
> +SRC_URI[sha256sum] =
> "ae56ceb44b786f21f54d133ac70bc5d9cb8cd4bda0167339c669a228da67fa3c"
> +
> +UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
> +
> +# Machine-specific as we examine MACHINE_FEATURES to decide whether to
> build the UEFI plugins
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit meson vala gobject-introspection systemd bash-completion
> pkgconfig gi-docgen ptest manpages
> +
> +GIDOCGEN_MESON_OPTION = 'docs'
> +GIDOCGEN_MESON_ENABLE_FLAG = 'docgen'
> +GIDOCGEN_MESON_DISABLE_FLAG = 'none'
> +
> +PACKAGECONFIG ??= "gnutls gudev gusb curl \
> +                   ${@bb.utils.filter('DISTRO_FEATURES', 'polkit
> systemd', d)} \
> +                   ${@bb.utils.contains('MACHINE_FEATURES', 'efi',
> 'plugin_uefi_capsule plugin_uefi_pk', '', d)} \
> +                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests
> plugin_dummy', '', d)} \
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
> +PACKAGECONFIG[consolekit] =
> "-Dconsolekit=true,-Dconsolekit=false,consolekit"
> +PACKAGECONFIG[curl] = "-Dcurl=true,-Dcurl=false,curl"
> +PACKAGECONFIG[firmware-packager] =
> "-Dfirmware-packager=true,-Dfirmware-packager=false"
> +PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
> +PACKAGECONFIG[gudev] = "-Dgudev=true,-Dgudev=false,libgudev"
> +PACKAGECONFIG[gusb] = "-Dgusb=true,-Dgusb=false,libgusb"
> +PACKAGECONFIG[libarchive] =
> "-Dlibarchive=true,-Dlibarchive=false,libarchive"
> +PACKAGECONFIG[lzma] = "-Dlzma=true,-Dlzma=false,xz"
> +PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false"
> +PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false,polkit"
> +PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
> +PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,gcab-native"
> +
> +# TODO plugins-all meta-option that expands to all plugin_*?
> +PACKAGECONFIG[plugin_altos] =
> "-Dplugin_altos=true,-Dplugin_altos=false,elfutils"
> +PACKAGECONFIG[plugin_amt] = "-Dplugin_amt=true,-Dplugin_amt=false"
> +PACKAGECONFIG[plugin_dell] =
> "-Dplugin_dell=true,-Dplugin_dell=false,libsmbios"
> +PACKAGECONFIG[plugin_dummy] = "-Dplugin_dummy=true,-Dplugin_dummy=false"
> +PACKAGECONFIG[plugin_emmc] = "-Dplugin_emmc=true,-Dplugin_emmc=false"
> +PACKAGECONFIG[plugin_fastboot] =
> "-Dplugin_fastboot=true,-Dplugin_fastboot=false"
> +PACKAGECONFIG[plugin_flashrom] =
> "-Dplugin_flashrom=true,-Dplugin_flashrom=false,flashrom"
> +PACKAGECONFIG[plugin_intel_spi] =
> "-Dplugin_intel_spi=true,-Dplugin_intel_spi=false"
> +PACKAGECONFIG[plugin_logitech_bulkcontroller] =
> "-Dplugin_logitech_bulkcontroller=true,-Dplugin_logitech_bulkcontroller=false,protobuf-c-native
> protobuf-c"
> +PACKAGECONFIG[plugin_modem_manager] =
> "-Dplugin_modem_manager=true,-Dplugin_modem_manager=false,libqmi
> modemmanager"
> +PACKAGECONFIG[plugin_msr] = "-Dplugin_msr=true,-Dplugin_msr=false,cpuid"
> +PACKAGECONFIG[plugin_nvme] = "-Dplugin_nvme=true,-Dplugin_nvme=false"
> +PACKAGECONFIG[plugin_parade_lspcon] =
> "-Dplugin_parade_lspcon=true,-Dplugin_parade_lspcon=false"
> +PACKAGECONFIG[plugin_platform_integrity] =
> "-Dplugin_platform_integrity=true,-Dplugin_platform_integrity=false"
> +PACKAGECONFIG[plugin_realtek_mst] =
> "-Dplugin_realtek_mst=true,-Dplugin_realtek_mst=false"
> +PACKAGECONFIG[plugin_redfish] =
> "-Dplugin_redfish=true,-Dplugin_redfish=false"
> +PACKAGECONFIG[plugin_synaptics_mst] =
> "-Dplugin_synaptics_mst=true,-Dplugin_synaptics_mst=false"
> +PACKAGECONFIG[plugin_synaptics_rmi] =
> "-Dplugin_synaptics_rmi=true,-Dplugin_synaptics_rmi=false"
> +PACKAGECONFIG[plugin_thunderbolt] =
> "-Dplugin_thunderbolt=true,-Dplugin_thunderbolt=false"
> +PACKAGECONFIG[plugin_tpm] =
> "-Dplugin_tpm=true,-Dplugin_tpm=false,tpm2-tss"
> +# Turn off the capsule splash as it needs G-I at buildtime, which isn't
> currently supported
> +PACKAGECONFIG[plugin_uefi_capsule] = "-Dplugin_uefi_capsule=true
> -Dplugin_uefi_capsule_splash=false,-Dplugin_uefi_capsule=false,efivar
> fwupd-efi"
> +PACKAGECONFIG[plugin_uefi_pk] =
> "-Dplugin_uefi_pk=true,-Dplugin_uefi_pk=false"
> +
> +# Always disable these plugins on non-x86 platforms as they don't compile
> +DISABLE_NON_X86 = "plugin_msr plugin_intel_spi"
> +DISABLE_NON_X86:x86 = ""
> +DISABLE_NON_X86:x86-64 = ""
> +PACKAGECONFIG:remove:aarch64 = "${DISABLE_NON_X86}"
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
> View/Reply Online (#93846):
> https://lists.openembedded.org/g/openembedded-devel/message/93846
> Mute This Topic: https://lists.openembedded.org/mt/86845457/1676615
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000efceaa05d00fc626
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Bug in this, v2 coming soon.</div><div dir=3D"auto"><br><=
/div><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Fri, 5 Nov 2021 at 16:51, Ross Burton via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;ross=3D<a href=3D"mailto:burtoni=
ni.com@lists.openembedded.org">burtonini.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)">Signed-off-by: Ross Burton &lt;<a href=3D=
"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt;<=
br>
---<br>
=C2=A0meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch | 141 +++++++++++++++++=
+<br>
=C2=A0meta-oe/recipes-bsp/fwupd/fwupd/run-ptest=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A06 +<br>
=C2=A0meta-oe/recipes-bsp/fwupd/<a href=3D"http://fwupd_1.7.1.bb" rel=3D"no=
referrer" target=3D"_blank">fwupd_1.7.1.bb</a>=C2=A0 =C2=A0 =C2=A0 | 101 ++=
+++++++++++<br>
=C2=A03 files changed, 248 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch<br>
=C2=A0create mode 100755 meta-oe/recipes-bsp/fwupd/fwupd/run-ptest<br>
=C2=A0create mode 100644 meta-oe/recipes-bsp/fwupd/<a href=3D"http://fwupd_=
1.7.1.bb" rel=3D"noreferrer" target=3D"_blank">fwupd_1.7.1.bb</a><br>
<br>
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch b/meta-oe/recipe=
s-bsp/fwupd/fwupd/no-bash.patch<br>
new file mode 100644<br>
index 0000000000..e0f83c4b6c<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch<br>
@@ -0,0 +1,141 @@<br>
+Upstream-Status: Backport [a346c582cc0f34ac6c7c11251919c84553424efb]<br>
+Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
+<br>
+diff --git a/data/installed-tests/fwupd.sh b/data/installed-tests/fwupd.sh=
<br>
+index 5b1f5d22..eaa5ec7f 100755<br>
+--- a/data/installed-tests/fwupd.sh<br>
++++ b/data/installed-tests/fwupd.sh<br>
+@@ -1,4 +1,4 @@<br>
+-#!/bin/bash<br>
++#!/bin/sh<br>
+ <br>
+ exec 2&gt;&amp;1<br>
+ dirname=3D`dirname $0`<br>
+@@ -7,7 +7,7 @@ run_test()<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f $dirname/$1 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$dirname/$1<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc=3D$?; if [[ $r=
c !=3D 0 ]]; then exit $rc; fi<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc=3D$?; if [ $rc=
 !=3D 0 ]; then exit $rc; fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+ }<br>
+ <br>
+diff --git a/data/installed-tests/fwupdmgr.sh b/data/installed-tests/fwupd=
mgr.sh<br>
+index e3f7ee31..3d65395e 100755<br>
+--- a/data/installed-tests/fwupdmgr.sh<br>
++++ b/data/installed-tests/fwupdmgr.sh<br>
+@@ -1,4 +1,4 @@<br>
+-#!/bin/bash<br>
++#!/bin/sh<br>
+ <br>
+ exec 2&gt;&amp;1<br>
+ device=3D08d460be0f1f9f128413f816022a6439e0078018<br>
+@@ -13,47 +13,47 @@ error()<br>
+ # ---<br>
+ echo &quot;Getting the list of remotes...&quot;<br>
+ fwupdmgr get-remotes<br>
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi<br>
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi<br>
+ <br>
+ # ---<br>
+ echo &quot;Enabling fwupd-tests remote...&quot;<br>
+ fwupdmgr enable-remote fwupd-tests<br>
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi<br>
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi<br>
+ <br>
+ # ---<br>
+ echo &quot;Update the device hash database...&quot;<br>
+ fwupdmgr verify-update $device<br>
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi<br>
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi<br>
+ <br>
+ # ---<br>
+ echo &quot;Getting devices (should be one)...&quot;<br>
+ fwupdmgr get-devices --no-unreported-check<br>
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi<br>
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi<br>
+ <br>
+ # ---<br>
+ echo &quot;Testing the verification of firmware...&quot;<br>
+ fwupdmgr verify $device<br>
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi<br>
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi<br>
+ <br>
+ # ---<br>
+ echo &quot;Getting updates (should be one)...&quot;<br>
+ fwupdmgr --no-unreported-check --no-metadata-check get-updates<br>
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi<br>
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi<br>
+ <br>
+ # ---<br>
+ echo &quot;Installing test firmware...&quot;<br>
+ fwupdmgr update $device -y<br>
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi<br>
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi<br>
+ <br>
+ # ---<br>
+ echo &quot;Getting updates (should be none)...&quot;<br>
+ fwupdmgr --no-unreported-check --no-metadata-check get-updates<br>
+-rc=3D$?; if [[ $rc !=3D 2 ]]; then error $rc; fi<br>
++rc=3D$?; if [ $rc !=3D 2 ]; then error $rc; fi<br>
+ <br>
+ # ---<br>
+ echo &quot;Testing the verification of firmware (again)...&quot;<br>
+ fwupdmgr verify $device<br>
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi<br>
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi<br>
+ <br>
+ if [ -z &quot;$CI_NETWORK&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Skipping remaining tests due =
to CI_NETWORK not being set&quot;<br>
+@@ -63,27 +63,27 @@ fi<br>
+ # ---<br>
+ echo &quot;Downgrading to older release (requires network access)&quot;<b=
r>
+ fwupdmgr downgrade $device -y<br>
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi<br>
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi<br>
+ <br>
+ # ---<br>
+ echo &quot;Downgrading to older release (should be none)&quot;<br>
+ fwupdmgr downgrade $device<br>
+-rc=3D$?; if [[ $rc !=3D 2 ]]; then error $rc; fi<br>
++rc=3D$?; if [ $rc !=3D 2 ]; then error $rc; fi<br>
+ <br>
+ # ---<br>
+ echo &quot;Updating all devices to latest release (requires network acces=
s)&quot;<br>
+ fwupdmgr --no-unreported-check --no-metadata-check --no-reboot-check upda=
te -y<br>
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi<br>
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi<br>
+ <br>
+ # ---<br>
+ echo &quot;Getting updates (should be none)...&quot;<br>
+ fwupdmgr --no-unreported-check --no-metadata-check get-updates<br>
+-rc=3D$?; if [[ $rc !=3D 2 ]]; then error $rc; fi<br>
++rc=3D$?; if [ $rc !=3D 2 ]; then error $rc; fi<br>
+ <br>
+ # ---<br>
+ echo &quot;Refreshing from the LVFS (requires network access)...&quot;<br=
>
+ fwupdmgr refresh<br>
+-rc=3D$?; if [[ $rc !=3D 0 ]]; then error $rc; fi<br>
++rc=3D$?; if [ $rc !=3D 0 ]; then error $rc; fi<br>
+ <br>
+ # success!<br>
+ exit 0<br>
+diff --git a/plugins/uefi-capsule/<a href=3D"http://fwupd.grub.conf.in" re=
l=3D"noreferrer" target=3D"_blank">fwupd.grub.conf.in</a> b/plugins/uefi-ca=
psule/<a href=3D"http://fwupd.grub.conf.in" rel=3D"noreferrer" target=3D"_b=
lank">fwupd.grub.conf.in</a><br>
+index 92bd49a1..9c3a22f2 100755<br>
+--- a/plugins/uefi-capsule/<a href=3D"http://fwupd.grub.conf.in" rel=3D"no=
referrer" target=3D"_blank">fwupd.grub.conf.in</a><br>
++++ b/plugins/uefi-capsule/<a href=3D"http://fwupd.grub.conf.in" rel=3D"no=
referrer" target=3D"_blank">fwupd.grub.conf.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#! /bin/bash<br>
++#! /bin/sh<br>
+ # SPDX-License-Identifier: LGPL-2.1+<br>
+ set -e<br>
+ <br>
+@@ -8,7 +8,7 @@ set -e<br>
+ <br>
+ if [ -f @localstatedir@/lib/fwupd/uefi_capsule.conf ] &amp;&amp;<br>
+=C2=A0 =C2=A0 ls /sys/firmware/efi/efivars/fwupd-*-0abba7dc-e516-4167-bbf5=
-4d9d1c739416 1&gt;/dev/null 2&gt;&amp;1; then<br>
+-=C2=A0 =C2=A0 =C2=A0 source @localstatedir@/lib/fwupd/uefi_capsule.conf<b=
r>
++=C2=A0 =C2=A0 =C2=A0 . @localstatedir@/lib/fwupd/uefi_capsule.conf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${EFI_PATH}&quot; !=3D &quot;&quot; =
] &amp;&amp; [ &quot;${ESP}&quot; !=3D &quot;&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Adding Linux Firmware Updater entry&=
quot; &gt;&amp;2<br>
+ cat &lt;&lt; EOF<br>
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/run-ptest b/meta-oe/recipes-bs=
p/fwupd/fwupd/run-ptest<br>
new file mode 100755<br>
index 0000000000..dbc0fc32a2<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-bsp/fwupd/fwupd/run-ptest<br>
@@ -0,0 +1,6 @@<br>
+#! /bin/sh<br>
+<br>
+# Don&#39;t run all of the fwupd tests, as fwupd/fwupdmgr.test needs a cus=
tom<br>
+# /etc/fwupd/daemon.conf with DisabledPlugins unset.<br>
+<br>
+gnome-desktop-testing-runner fwupd/fwupd.test<br>
diff --git a/meta-oe/recipes-bsp/fwupd/<a href=3D"http://fwupd_1.7.1.bb" re=
l=3D"noreferrer" target=3D"_blank">fwupd_1.7.1.bb</a> b/meta-oe/recipes-bsp=
/fwupd/<a href=3D"http://fwupd_1.7.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">fwupd_1.7.1.bb</a><br>
new file mode 100644<br>
index 0000000000..f034b847a3<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-bsp/fwupd/<a href=3D"http://fwupd_1.7.1.bb" rel=3D"no=
referrer" target=3D"_blank">fwupd_1.7.1.bb</a><br>
@@ -0,0 +1,101 @@<br>
+SUMMARY =3D &quot;A simple daemon to allow session software to update firm=
ware&quot;<br>
+LICENSE =3D &quot;LGPL-2.1+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd255951079008b3=
64516c&quot;<br>
+<br>
+DEPENDS =3D &quot;glib-2.0 libxmlb json-glib sqlite3 libjcat gcab vala-nat=
ive&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/$%7BBPN%7D/$%7BBPN%7D/rele=
ases/download/1.7.1/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/${BPN}/${BPN}/releases/download/1.7.1/${BP}.tar.xz</a> \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://no-bash.patch&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ae56ceb44b786f21f54d133ac70bc5d9cb8cd4bda0167=
339c669a228da67fa3c&quot;<br>
+<br>
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/$%7BBPN%7D/$%7B=
BPN%7D/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/${=
BPN}/${BPN}/releases</a>&quot;<br>
+<br>
+# Machine-specific as we examine MACHINE_FEATURES to decide whether to bui=
ld the UEFI plugins<br>
+PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
+<br>
+inherit meson vala gobject-introspection systemd bash-completion pkgconfig=
 gi-docgen ptest manpages<br>
+<br>
+GIDOCGEN_MESON_OPTION =3D &#39;docs&#39;<br>
+GIDOCGEN_MESON_ENABLE_FLAG =3D &#39;docgen&#39;<br>
+GIDOCGEN_MESON_DISABLE_FLAG =3D &#39;none&#39;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;gnutls gudev gusb curl \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;polkit systemd&#39;, d)} \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;MACHINE_FEATURES&#39;, &#39;efi&#39;, &#39;plugin_uefi=
_capsule plugin_uefi_pk&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;PTEST_ENABLED&#39;, &#39;1&#39;, &#39;tests plugin_dum=
my&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_altos \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_amt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_emmc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_fastboot \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_flashrom \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_intel_spi \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_logitech_bulkcontroller \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_modem_manager \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_msr \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_nvme \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_parade_lspcon \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_platform_integrity \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_realtek_mst \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_redfish \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_synaptics_mst \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_synaptics_rmi \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugi=
n_thunderbolt&quot;<br>
+<br>
+PACKAGECONFIG[bluez] =3D &quot;-Dbluez=3Dtrue,-Dbluez=3Dfalse&quot;<br>
+PACKAGECONFIG[consolekit] =3D &quot;-Dconsolekit=3Dtrue,-Dconsolekit=3Dfal=
se,consolekit&quot;<br>
+PACKAGECONFIG[curl] =3D &quot;-Dcurl=3Dtrue,-Dcurl=3Dfalse,curl&quot;<br>
+PACKAGECONFIG[firmware-packager] =3D &quot;-Dfirmware-packager=3Dtrue,-Dfi=
rmware-packager=3Dfalse&quot;<br>
+PACKAGECONFIG[gnutls] =3D &quot;-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls&qu=
ot;<br>
+PACKAGECONFIG[gudev] =3D &quot;-Dgudev=3Dtrue,-Dgudev=3Dfalse,libgudev&quo=
t;<br>
+PACKAGECONFIG[gusb] =3D &quot;-Dgusb=3Dtrue,-Dgusb=3Dfalse,libgusb&quot;<b=
r>
+PACKAGECONFIG[libarchive] =3D &quot;-Dlibarchive=3Dtrue,-Dlibarchive=3Dfal=
se,libarchive&quot;<br>
+PACKAGECONFIG[lzma] =3D &quot;-Dlzma=3Dtrue,-Dlzma=3Dfalse,xz&quot;<br>
+PACKAGECONFIG[manpages] =3D &quot;-Dman=3Dtrue,-Dman=3Dfalse&quot;<br>
+PACKAGECONFIG[polkit] =3D &quot;-Dpolkit=3Dtrue,-Dpolkit=3Dfalse,polkit&qu=
ot;<br>
+PACKAGECONFIG[systemd] =3D &quot;-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,system=
d&quot;<br>
+PACKAGECONFIG[tests] =3D &quot;-Dtests=3Dtrue,-Dtests=3Dfalse,gcab-native&=
quot;<br>
+<br>
+# TODO plugins-all meta-option that expands to all plugin_*?<br>
+PACKAGECONFIG[plugin_altos] =3D &quot;-Dplugin_altos=3Dtrue,-Dplugin_altos=
=3Dfalse,elfutils&quot;<br>
+PACKAGECONFIG[plugin_amt] =3D &quot;-Dplugin_amt=3Dtrue,-Dplugin_amt=3Dfal=
se&quot;<br>
+PACKAGECONFIG[plugin_dell] =3D &quot;-Dplugin_dell=3Dtrue,-Dplugin_dell=3D=
false,libsmbios&quot;<br>
+PACKAGECONFIG[plugin_dummy] =3D &quot;-Dplugin_dummy=3Dtrue,-Dplugin_dummy=
=3Dfalse&quot;<br>
+PACKAGECONFIG[plugin_emmc] =3D &quot;-Dplugin_emmc=3Dtrue,-Dplugin_emmc=3D=
false&quot;<br>
+PACKAGECONFIG[plugin_fastboot] =3D &quot;-Dplugin_fastboot=3Dtrue,-Dplugin=
_fastboot=3Dfalse&quot;<br>
+PACKAGECONFIG[plugin_flashrom] =3D &quot;-Dplugin_flashrom=3Dtrue,-Dplugin=
_flashrom=3Dfalse,flashrom&quot;<br>
+PACKAGECONFIG[plugin_intel_spi] =3D &quot;-Dplugin_intel_spi=3Dtrue,-Dplug=
in_intel_spi=3Dfalse&quot;<br>
+PACKAGECONFIG[plugin_logitech_bulkcontroller] =3D &quot;-Dplugin_logitech_=
bulkcontroller=3Dtrue,-Dplugin_logitech_bulkcontroller=3Dfalse,protobuf-c-n=
ative protobuf-c&quot;<br>
+PACKAGECONFIG[plugin_modem_manager] =3D &quot;-Dplugin_modem_manager=3Dtru=
e,-Dplugin_modem_manager=3Dfalse,libqmi modemmanager&quot;<br>
+PACKAGECONFIG[plugin_msr] =3D &quot;-Dplugin_msr=3Dtrue,-Dplugin_msr=3Dfal=
se,cpuid&quot;<br>
+PACKAGECONFIG[plugin_nvme] =3D &quot;-Dplugin_nvme=3Dtrue,-Dplugin_nvme=3D=
false&quot;<br>
+PACKAGECONFIG[plugin_parade_lspcon] =3D &quot;-Dplugin_parade_lspcon=3Dtru=
e,-Dplugin_parade_lspcon=3Dfalse&quot;<br>
+PACKAGECONFIG[plugin_platform_integrity] =3D &quot;-Dplugin_platform_integ=
rity=3Dtrue,-Dplugin_platform_integrity=3Dfalse&quot;<br>
+PACKAGECONFIG[plugin_realtek_mst] =3D &quot;-Dplugin_realtek_mst=3Dtrue,-D=
plugin_realtek_mst=3Dfalse&quot;<br>
+PACKAGECONFIG[plugin_redfish] =3D &quot;-Dplugin_redfish=3Dtrue,-Dplugin_r=
edfish=3Dfalse&quot;<br>
+PACKAGECONFIG[plugin_synaptics_mst] =3D &quot;-Dplugin_synaptics_mst=3Dtru=
e,-Dplugin_synaptics_mst=3Dfalse&quot;<br>
+PACKAGECONFIG[plugin_synaptics_rmi] =3D &quot;-Dplugin_synaptics_rmi=3Dtru=
e,-Dplugin_synaptics_rmi=3Dfalse&quot;<br>
+PACKAGECONFIG[plugin_thunderbolt] =3D &quot;-Dplugin_thunderbolt=3Dtrue,-D=
plugin_thunderbolt=3Dfalse&quot;<br>
+PACKAGECONFIG[plugin_tpm] =3D &quot;-Dplugin_tpm=3Dtrue,-Dplugin_tpm=3Dfal=
se,tpm2-tss&quot;<br>
+# Turn off the capsule splash as it needs G-I at buildtime, which isn&#39;=
t currently supported<br>
+PACKAGECONFIG[plugin_uefi_capsule] =3D &quot;-Dplugin_uefi_capsule=3Dtrue =
-Dplugin_uefi_capsule_splash=3Dfalse,-Dplugin_uefi_capsule=3Dfalse,efivar f=
wupd-efi&quot;<br>
+PACKAGECONFIG[plugin_uefi_pk] =3D &quot;-Dplugin_uefi_pk=3Dtrue,-Dplugin_u=
efi_pk=3Dfalse&quot;<br>
+<br>
+# Always disable these plugins on non-x86 platforms as they don&#39;t comp=
ile<br>
+DISABLE_NON_X86 =3D &quot;plugin_msr plugin_intel_spi&quot;<br>
+DISABLE_NON_X86:x86 =3D &quot;&quot;<br>
+DISABLE_NON_X86:x86-64 =3D &quot;&quot;<br>
+PACKAGECONFIG:remove:aarch64 =3D &quot;${DISABLE_NON_X86}&quot;<br>
+<br>
+FILES:${PN} +=3D &quot;${libdir}/fwupd-plugins-* \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${systemd_unitdir}=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/fish \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/metainf=
o \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/icons \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/dbus-1 =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/polkit-=
1 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${nonarch_libdir}/=
modules-load.d&quot;<br>
+<br>
+FILES:${PN}-ptest +=3D &quot;${libexecdir}/installed-tests/ \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${datadir}/installed-tests/&quot;<br>
+RDEPENDS:${PN}-ptest +=3D &quot;gnome-desktop-testing&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93846): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93846" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93846</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86845457/1676=
615" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86845457/1676615</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ross@burtonini.com" targ=
et=3D"_blank">ross@burtonini.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000efceaa05d00fc626--

