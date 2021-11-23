Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB60C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 17:20:52 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web08.14251.1637688051224709795
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Nov 2021 09:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Boaovu+Y;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id l8so20534433qtk.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Nov 2021 09:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=niVQxN7RF2N8kk5QBDFyKEWlZmqGeOo4A6IE5gymRJI=;
        b=Boaovu+YFkuPCSHi0k6IUS00zYCclVBF5raGR3UyESFxU6JqKZ0AGBvoeMM3VlQ4S0
         l+CC0bcHc0+pSl4iZlOIfvaqZDASA6L6mzQXgBUv6gcUOJ2eNoPrQJuF2vSfT08UoX66
         vZvIGJ3jaatPQlg6G7UOeqph7Rm2PF8POG0W4kfJGu3mT2hM8lZTWje2ijPg9QQM689W
         XFJfg0+iuw0JXpkHeAUjRtcaOqbCIL2tUKXEyjdZss4GhsH8Uk1foQf2RMP19rue5mEn
         6gTyDFSnCxU7Agt+piK6AFq0rX8Ue8NhdDFVx6Y8T4Eik0fGiEVI1s9iOw5fpxT6xxvz
         bXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=niVQxN7RF2N8kk5QBDFyKEWlZmqGeOo4A6IE5gymRJI=;
        b=6vSEd+aX3CIJuw7PsKwG3UWg6lIiLH8KwsG8eksJFaCwtfAXNuVbU4o5SVuYzAuJE6
         8yyfPOUTM7dclGzN86ZWcvbOyAhfDbzjKG5KnYul2zM0n7JJQa8LEvnNQHxGixWioRDd
         17WMNi0Um1SD9DrggB3mcmOdm/rNE3HZlE/t6f5XdYBaMzeth9BpoIE172QhVzQeVzCV
         Di2yuNURCujHzpsJvQB0nYtxphLOjL/B0cF4hOql1GasKCCdbDKzTVg31+LpsZPRIxPL
         fdxyOzJLCLIYjNWG6C9GogMVpXgLiUPCBXeYuJjG6Ftq1lYvmrh1o26yO4F+GzhFcNrR
         KT5g==
X-Gm-Message-State: AOAM532JKy51aqKOiKSx9vTWaVWO7c65jrlyocYUglLZ85glDiYzIEqD
	XJoi3vH1+ZOYxJFGMJOsw+e++niZFn00sHcp0YW/b5eMTL2OXQ==
X-Google-Smtp-Source: 
 ABdhPJyi4b7mdBdlppjFcXvJn/x1oT9zJWkNRYkD2iTEn+R5eNJdxXaxM0FcVCXHN3gH83t4YYJrmw/ATV5WXydREqI=
X-Received: by 2002:a05:622a:15c5:: with SMTP id
 d5mr8197870qty.227.1637688049832;
 Tue, 23 Nov 2021 09:20:49 -0800 (PST)
MIME-Version: 1.0
References: <20211122131956.1240075-1-ross.burton@arm.com>
 <83e579bb-7d43-f905-c658-5cbc32e9f6a6@gmail.com>
In-Reply-To: <83e579bb-7d43-f905-c658-5cbc32e9f6a6@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Nov 2021 09:20:23 -0800
Message-ID: 
 <CAMKF1soY_mbVHbs0fQi5ytpQxFGty1M1ab_9VnHg0XEpJsAc7A@mail.gmail.com>
Subject: Re: [oe] [PATCH] fwupd: upgrade to 1.7.2
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Nov 2021 17:20:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94108

also seen on YP AB
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1748

On Tue, Nov 23, 2021 at 8:23 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Fails on qemux86/clang
>
> https://errors.yoctoproject.org/Errors/Details/617816/
>
>
> On 11/22/21 5:19 AM, Ross Burton wrote:
> > PACKAGECONFIG changes:
> > - Rename bluez to bluetooth
> > - Remove plugin_altos as the plugin was removed upstream
> > - Move lzma to efi-specific as it's only used by the UEFI code
> > - Disable AMT and Thunderbolt on non-x86
> > - Add offline option and enable it in systemd builds
> > - Add disabled options for compat-cli, fish-completion, and metainfo.
> >
> > Also drop upstreamed patches.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >   meta-oe/recipes-bsp/fwupd/fwupd/io.patch      |  36 -----
> >   meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch | 141 ------------------
> >   .../fwupd/{fwupd_1.7.1.bb => fwupd_1.7.2.bb}  |  27 ++--
> >   3 files changed, 14 insertions(+), 190 deletions(-)
> >   delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/io.patch
> >   delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch
> >   rename meta-oe/recipes-bsp/fwupd/{fwupd_1.7.1.bb => fwupd_1.7.2.bb} (84%)
> >
> > diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/io.patch b/meta-oe/recipes-bsp/fwupd/fwupd/io.patch
> > deleted file mode 100644
> > index 7cef88507b..0000000000
> > --- a/meta-oe/recipes-bsp/fwupd/fwupd/io.patch
> > +++ /dev/null
> > @@ -1,36 +0,0 @@
> > -Upstream-Status: Submitted [https://github.com/fwupd/fwupd/pull/3970]
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > -
> > -From c3711712d0603f14beef64b0ef0b2fd03c0442e0 Mon Sep 17 00:00:00 2001
> > -From: Ross Burton <ross.burton@arm.com>
> > -Date: Tue, 9 Nov 2021 16:26:45 +0000
> > -Subject: [PATCH] build: check that outb is present in io.h
> > -
> > -The flashrom plugin can use inb/outb to do a CMOS reset. The build gates
> > -this on whether io.h exists (since bc43ad) as with glibc if io.h exists,
> > -inb/outb are defined. However on musl, io.h always exists but it may not
> > -define inb/outb.
> > -
> > -Thus, fwupd builds with musl on non-x86 platforms will fail to link. Fix
> > -this by checking for both io.h and that outb() is defined.
> > -
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ----
> > - meson.build | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/meson.build b/meson.build
> > -index dabfc1ce..4c548cf9 100644
> > ---- a/meson.build
> > -+++ b/meson.build
> > -@@ -308,7 +308,7 @@ endif
> > - if cc.has_header('sys/socket.h')
> > -   conf.set('HAVE_SOCKET_H', '1')
> > - endif
> > --if cc.has_header('sys/io.h')
> > -+if cc.has_header('sys/io.h') and cc.has_function('outb', prefix: '#include <sys/io.h>')
> > -   conf.set('HAVE_IO_H', '1')
> > - endif
> > - if cc.has_header('linux/ethtool.h')
> > ---
> > -2.25.1
> > diff --git a/meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch b/meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch
> > deleted file mode 100644
> > index e0f83c4b6c..0000000000
> > --- a/meta-oe/recipes-bsp/fwupd/fwupd/no-bash.patch
> > +++ /dev/null
> > @@ -1,141 +0,0 @@
> > -Upstream-Status: Backport [a346c582cc0f34ac6c7c11251919c84553424efb]
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > -
> > -diff --git a/data/installed-tests/fwupd.sh b/data/installed-tests/fwupd.sh
> > -index 5b1f5d22..eaa5ec7f 100755
> > ---- a/data/installed-tests/fwupd.sh
> > -+++ b/data/installed-tests/fwupd.sh
> > -@@ -1,4 +1,4 @@
> > --#!/bin/bash
> > -+#!/bin/sh
> > -
> > - exec 2>&1
> > - dirname=`dirname $0`
> > -@@ -7,7 +7,7 @@ run_test()
> > - {
> > -         if [ -f $dirname/$1 ]; then
> > -                 $dirname/$1
> > --                rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
> > -+                rc=$?; if [ $rc != 0 ]; then exit $rc; fi
> > -         fi
> > - }
> > -
> > -diff --git a/data/installed-tests/fwupdmgr.sh b/data/installed-tests/fwupdmgr.sh
> > -index e3f7ee31..3d65395e 100755
> > ---- a/data/installed-tests/fwupdmgr.sh
> > -+++ b/data/installed-tests/fwupdmgr.sh
> > -@@ -1,4 +1,4 @@
> > --#!/bin/bash
> > -+#!/bin/sh
> > -
> > - exec 2>&1
> > - device=08d460be0f1f9f128413f816022a6439e0078018
> > -@@ -13,47 +13,47 @@ error()
> > - # ---
> > - echo "Getting the list of remotes..."
> > - fwupdmgr get-remotes
> > --rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> > -+rc=$?; if [ $rc != 0 ]; then error $rc; fi
> > -
> > - # ---
> > - echo "Enabling fwupd-tests remote..."
> > - fwupdmgr enable-remote fwupd-tests
> > --rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> > -+rc=$?; if [ $rc != 0 ]; then error $rc; fi
> > -
> > - # ---
> > - echo "Update the device hash database..."
> > - fwupdmgr verify-update $device
> > --rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> > -+rc=$?; if [ $rc != 0 ]; then error $rc; fi
> > -
> > - # ---
> > - echo "Getting devices (should be one)..."
> > - fwupdmgr get-devices --no-unreported-check
> > --rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> > -+rc=$?; if [ $rc != 0 ]; then error $rc; fi
> > -
> > - # ---
> > - echo "Testing the verification of firmware..."
> > - fwupdmgr verify $device
> > --rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> > -+rc=$?; if [ $rc != 0 ]; then error $rc; fi
> > -
> > - # ---
> > - echo "Getting updates (should be one)..."
> > - fwupdmgr --no-unreported-check --no-metadata-check get-updates
> > --rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> > -+rc=$?; if [ $rc != 0 ]; then error $rc; fi
> > -
> > - # ---
> > - echo "Installing test firmware..."
> > - fwupdmgr update $device -y
> > --rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> > -+rc=$?; if [ $rc != 0 ]; then error $rc; fi
> > -
> > - # ---
> > - echo "Getting updates (should be none)..."
> > - fwupdmgr --no-unreported-check --no-metadata-check get-updates
> > --rc=$?; if [[ $rc != 2 ]]; then error $rc; fi
> > -+rc=$?; if [ $rc != 2 ]; then error $rc; fi
> > -
> > - # ---
> > - echo "Testing the verification of firmware (again)..."
> > - fwupdmgr verify $device
> > --rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> > -+rc=$?; if [ $rc != 0 ]; then error $rc; fi
> > -
> > - if [ -z "$CI_NETWORK" ]; then
> > -         echo "Skipping remaining tests due to CI_NETWORK not being set"
> > -@@ -63,27 +63,27 @@ fi
> > - # ---
> > - echo "Downgrading to older release (requires network access)"
> > - fwupdmgr downgrade $device -y
> > --rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> > -+rc=$?; if [ $rc != 0 ]; then error $rc; fi
> > -
> > - # ---
> > - echo "Downgrading to older release (should be none)"
> > - fwupdmgr downgrade $device
> > --rc=$?; if [[ $rc != 2 ]]; then error $rc; fi
> > -+rc=$?; if [ $rc != 2 ]; then error $rc; fi
> > -
> > - # ---
> > - echo "Updating all devices to latest release (requires network access)"
> > - fwupdmgr --no-unreported-check --no-metadata-check --no-reboot-check update -y
> > --rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> > -+rc=$?; if [ $rc != 0 ]; then error $rc; fi
> > -
> > - # ---
> > - echo "Getting updates (should be none)..."
> > - fwupdmgr --no-unreported-check --no-metadata-check get-updates
> > --rc=$?; if [[ $rc != 2 ]]; then error $rc; fi
> > -+rc=$?; if [ $rc != 2 ]; then error $rc; fi
> > -
> > - # ---
> > - echo "Refreshing from the LVFS (requires network access)..."
> > - fwupdmgr refresh
> > --rc=$?; if [[ $rc != 0 ]]; then error $rc; fi
> > -+rc=$?; if [ $rc != 0 ]; then error $rc; fi
> > -
> > - # success!
> > - exit 0
> > -diff --git a/plugins/uefi-capsule/fwupd.grub.conf.in b/plugins/uefi-capsule/fwupd.grub.conf.in
> > -index 92bd49a1..9c3a22f2 100755
> > ---- a/plugins/uefi-capsule/fwupd.grub.conf.in
> > -+++ b/plugins/uefi-capsule/fwupd.grub.conf.in
> > -@@ -1,4 +1,4 @@
> > --#! /bin/bash
> > -+#! /bin/sh
> > - # SPDX-License-Identifier: LGPL-2.1+
> > - set -e
> > -
> > -@@ -8,7 +8,7 @@ set -e
> > -
> > - if [ -f @localstatedir@/lib/fwupd/uefi_capsule.conf ] &&
> > -    ls /sys/firmware/efi/efivars/fwupd-*-0abba7dc-e516-4167-bbf5-4d9d1c739416 1>/dev/null 2>&1; then
> > --      source @localstatedir@/lib/fwupd/uefi_capsule.conf
> > -+      . @localstatedir@/lib/fwupd/uefi_capsule.conf
> > -       if [ "${EFI_PATH}" != "" ] && [ "${ESP}" != "" ]; then
> > -       echo "Adding Linux Firmware Updater entry" >&2
> > - cat << EOF
> > diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.1.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.2.bb
> > similarity index 84%
> > rename from meta-oe/recipes-bsp/fwupd/fwupd_1.7.1.bb
> > rename to meta-oe/recipes-bsp/fwupd/fwupd_1.7.2.bb
> > index 5827c39e9f..932acfa4e9 100644
> > --- a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.1.bb
> > +++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.2.bb
> > @@ -4,11 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> >
> >   DEPENDS = "glib-2.0 libxmlb json-glib sqlite3 libjcat gcab vala-native"
> >
> > -SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/1.7.1/${BP}.tar.xz \
> > -           file://run-ptest \
> > -           file://no-bash.patch \
> > -           file://io.patch"
> > -SRC_URI[sha256sum] = "ae56ceb44b786f21f54d133ac70bc5d9cb8cd4bda0167339c669a228da67fa3c"
> > +SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
> > +           file://run-ptest"
> > +SRC_URI[sha256sum] = "8632df69c3bafc59387cdcb517c3ce31a597a09026e44f5907d8384671b9f834"
> >
> >   UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
> >
> > @@ -21,11 +19,11 @@ GIDOCGEN_MESON_OPTION = 'docs'
> >   GIDOCGEN_MESON_ENABLE_FLAG = 'docgen'
> >   GIDOCGEN_MESON_DISABLE_FLAG = 'none'
> >
> > -PACKAGECONFIG ??= "curl gnutls gudev gusb lzma \
> > -                   ${@bb.utils.filter('DISTRO_FEATURES', 'polkit systemd', d)} \
> > -                   ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'plugin_uefi_capsule plugin_uefi_pk', '', d)} \
> > +PACKAGECONFIG ??= "curl gnutls gudev gusb \
> > +                   ${@bb.utils.filter('DISTRO_FEATURES', 'bluetooth polkit', d)} \
> > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd offline', '', d)} \
> > +                   ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'lzma plugin_uefi_capsule plugin_uefi_pk', '', d)} \
> >                      ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests plugin_dummy', '', d)} \
> > -                   plugin_altos \
> >                      plugin_amt \
> >                      plugin_emmc \
> >                      plugin_fastboot \
> > @@ -43,22 +41,25 @@ PACKAGECONFIG ??= "curl gnutls gudev gusb lzma \
> >                      plugin_synaptics_rmi \
> >                      plugin_thunderbolt"
> >
> > -PACKAGECONFIG[bluez] = "-Dbluez=true,-Dbluez=false"
> > +PACKAGECONFIG[bluetooth] = "-Dbluez=true,-Dbluez=false"
> > +PACKAGECONFIG[compat-cli] = "-Dcompat_cli=true,-Dcompat_cli=false"
> >   PACKAGECONFIG[consolekit] = "-Dconsolekit=true,-Dconsolekit=false,consolekit"
> >   PACKAGECONFIG[curl] = "-Dcurl=true,-Dcurl=false,curl"
> >   PACKAGECONFIG[firmware-packager] = "-Dfirmware-packager=true,-Dfirmware-packager=false"
> > +PACKAGECONFIG[fish-completion] = "-Dfish_completion=true,-Dfish_completion=false"
> >   PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
> >   PACKAGECONFIG[gudev] = "-Dgudev=true,-Dgudev=false,libgudev"
> >   PACKAGECONFIG[gusb] = "-Dgusb=true,-Dgusb=false,libgusb"
> >   PACKAGECONFIG[libarchive] = "-Dlibarchive=true,-Dlibarchive=false,libarchive"
> >   PACKAGECONFIG[lzma] = "-Dlzma=true,-Dlzma=false,xz"
> >   PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false"
> > +PACKAGECONFIG[metainfo] = "-Dmetainfo=true,-Dmetainfo=false"
> > +PACKAGECONFIG[offline] = "-Doffline=true,-Doffline=false"
> >   PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false,polkit"
> >   PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
> >   PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,gcab-native"
> >
> >   # TODO plugins-all meta-option that expands to all plugin_*?
> > -PACKAGECONFIG[plugin_altos] = "-Dplugin_altos=true,-Dplugin_altos=false,elfutils"
> >   PACKAGECONFIG[plugin_amt] = "-Dplugin_amt=true,-Dplugin_amt=false"
> >   PACKAGECONFIG[plugin_dell] = "-Dplugin_dell=true,-Dplugin_dell=false,libsmbios"
> >   PACKAGECONFIG[plugin_dummy] = "-Dplugin_dummy=true,-Dplugin_dummy=false"
> > @@ -82,8 +83,8 @@ PACKAGECONFIG[plugin_tpm] = "-Dplugin_tpm=true,-Dplugin_tpm=false,tpm2-tss"
> >   PACKAGECONFIG[plugin_uefi_capsule] = "-Dplugin_uefi_capsule=true -Dplugin_uefi_capsule_splash=false,-Dplugin_uefi_capsule=false,efivar fwupd-efi"
> >   PACKAGECONFIG[plugin_uefi_pk] = "-Dplugin_uefi_pk=true,-Dplugin_uefi_pk=false"
> >
> > -# Always disable these plugins on non-x86 platforms as they don't compile
> > -DISABLE_NON_X86 = "plugin_msr plugin_intel_spi"
> > +# Always disable these plugins on non-x86 platforms as they don't compile or are useless
> > +DISABLE_NON_X86 = "plugin_amt plugin_intel_spi plugin_msr plugin_thunderbolt"
> >   DISABLE_NON_X86:x86 = ""
> >   DISABLE_NON_X86:x86-64 = ""
> >   PACKAGECONFIG:remove = "${DISABLE_NON_X86}"
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#94094): https://lists.openembedded.org/g/openembedded-devel/message/94094
> > Mute This Topic: https://lists.openembedded.org/mt/87234584/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

