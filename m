Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D175C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 18:23:26 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web08.1140.1646245405574472257
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:23:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ltnMTzcc;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id w7so2191117qvr.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=laVTavmvRrYfnImvQd3o8nvvUNXyTwxGZHKLubFRLLs=;
        b=ltnMTzccia2JbOKf5Y2yTp1wwjX8PCrymzewH31qN8Mvu1ocv0cyBELbESp+w6Yrca
         or9fKjsxg8J0aYhFYGew5LAX+9528Ww5tru8rWF9ZmxmQWoc0Chqut7ETwO/NCDCeK96
         srOf3m17xj2kWsJ5pVR1N7jLVDAKcaqJKdDzMs8szFc8ANKA0dCR0bawzUG3BxCbwrQT
         2z070uA3N81kQ4Ne7xIlBlFKPN9slUILYudnzRPBfsECwUkqND7DFb8DN5NtrkUubr8a
         4XbLIYmLODbxcZFCNmn7ImSRDbKVTWtSUQ1ro9BojpTsXp1WZeX70v1j6SzSiTjtcfQq
         8AVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=laVTavmvRrYfnImvQd3o8nvvUNXyTwxGZHKLubFRLLs=;
        b=HMJ8drxvovbJjTxJ7cbq+SKLcX0G6FZx20YC5jBIOzLj+xcRlADn227cRS1RAYDaxQ
         1Zh5YKsYPZ04BFWqPii6AclbYS9ow7F58qG9jItUYrYf/+tw73ARijRwl9/2VSxSW0F2
         owwuKpVvnyvnCRTQiYnWAHzkNjxTFMxSzRxujdnpx5XajEf6oH6jlozK2j+zjaC7f61g
         wn5reAdCUyk1gXu+dVTp24pP0Wxso8S1tqzCA5fDl3cFvW6bn/4fTAzMFOVeJX/P/l/a
         0drlpqyZDvv94I9N8frnUbCYlr2GXCrFZYYV6cIHPPjMR3x97473JtyCXKxUmCiBvqu5
         3YxA==
X-Gm-Message-State: AOAM533pZhemLbusOKE20AqPnivV2qxHm8IkF+aMkF5G9hSFsKpqejdF
	tsQC7r0+K4pdYLyXbfewaapJocRNL/egNoehcfY=
X-Google-Smtp-Source: 
 ABdhPJwRl7l47n3NzBDMH5MhjEi244TxNIg+18fcZRWoYMxpWuhq/HfNsN5QvmxOvGA7Ok/tt3ZHAXUYaKh9LV1jqRY=
X-Received: by 2002:a05:6214:2a83:b0:435:3075:e990 with SMTP id
 jr3-20020a0562142a8300b004353075e990mr753322qvb.110.1646245404455; Wed, 02
 Mar 2022 10:23:24 -0800 (PST)
MIME-Version: 1.0
References: <20220302152713.1876638-1-adrian.freihofer@siemens.com>
 <20220302152713.1876638-2-adrian.freihofer@siemens.com>
In-Reply-To: <20220302152713.1876638-2-adrian.freihofer@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2022 10:22:58 -0800
Message-ID: 
 <CAMKF1soNHGXursGGE1Y95_0__au5W9CtskpZqqPaF1y0Q7w7EQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH V2 1/2] networkmanager: switch to
 meson
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 18:23:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95697

I am seeing libnma failing with

| DEBUG: Executing shell function do_compile
| [1/1] /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/libnma/1.8.34-=
r0/recipe-sysroot-native/usr/bin/vapigen
--quiet --library=3Dlibnma
--directory=3D/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/libnma/1=
.8.34-r0/build/src
--pkg=3Dlibnm --pkg=3Dgtk+-3.0 --pkg=3Dgio-2.0
--metadatadir=3D/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/libnma=
/1.8.34-r0/libnma-1.8.34/src
/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/libnma/1.8.34-r0/build=
/src/NMA-1.0.gir
| FAILED: src/libnma.vapi
| /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/libnma/1.8.34-r0/rec=
ipe-sysroot-native/usr/bin/vapigen
--quiet --library=3Dlibnma
--directory=3D/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/libnma/1=
.8.34-r0/build/src
--pkg=3Dlibnm --pkg=3Dgtk+-3.0 --pkg=3Dgio-2.0
--metadatadir=3D/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/libnma=
/1.8.34-r0/libnma-1.8.34/src
/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/libnma/1.8.34-r0/build=
/src/NMA-1.0.gir
| error: Package `libnm' not found in specified Vala API directories
or GObject-Introspection GIR directories

Can you also see if you can see the same build regression?

On Wed, Mar 2, 2022 at 7:27 AM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> - Switch to meson build-system
> - Removed 0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch
>   nm-shared.xml gets installed into /usr/lib/firewalld/zones where also
>   firewalld installs its xml files. Not 100% sure this is as it was
>   before but it seams to be consistent with firewalld.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  ...e.ac-Fix-pkgconfig-sysroot-locations.patch | 22 -----
>  ...1-do-not-ask-host-for-ifcfg-defaults.patch | 27 ++++++
>  ...ttings-settings-property-documentati.patch | 60 --------------
>  ...d-to-var-libdir-rather-than-hardcod-.patch | 30 -------
>  .../networkmanager/networkmanager_1.36.0.bb   | 83 ++++++++++---------
>  5 files changed, 71 insertions(+), 151 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager/0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager/0001-do-not-ask-host-for-ifcfg-defaults.patch
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager/0002-Do-not-create-settings-settings-property-documentati.pat=
ch
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager/0003-install-firewalld-to-var-libdir-rather-than-hardcod-.pat=
ch
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch b/meta=
-networking/recipes-connectivity/networkmanager/networkmanager/0001-Fixed-c=
onfigure.ac-Fix-pkgconfig-sysroot-locations.patch
> deleted file mode 100644
> index 19c8c74811..0000000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -From 9bcf4c81a559d1e7deac47b2e510d7f1e5837a02 Mon Sep 17 00:00:00 2001
> -From: Pablo Saavedra <psaavedra@igalia.com>
> -Date: Tue, 13 Mar 2018 17:36:20 +0100
> -Subject: [PATCH] Fixed configure.ac: Fix pkgconfig sysroot locations
> -
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 65ceffb..ad4b0fc 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -561,7 +561,7 @@ if test "$have_jansson" =3D "yes"; then
> -       AC_DEFINE(WITH_JANSSON, 1, [Define if JANSSON is enabled])
> -
> -       AC_CHECK_TOOLS(READELF, [eu-readelf readelf])
> --      JANSSON_LIBDIR=3D`$PKG_CONFIG --variable=3Dlibdir jansson`
> -+      JANSSON_LIBDIR=3D${PKG_CONFIG_SYSROOT_DIR}`$PKG_CONFIG --variable=
=3Dlibdir jansson`
> -       JANSSON_SONAME=3D`$READELF -d $JANSSON_LIBDIR/libjansson.so |sed =
-n 's/.*SONAME.*\[[\([^]]*\)]]/\1/p'`
> -
> -       if test "$JANSSON_SONAME" =3D ""; then
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/0001-do-not-ask-host-for-ifcfg-defaults.patch b/meta-networking/reci=
pes-connectivity/networkmanager/networkmanager/0001-do-not-ask-host-for-ifc=
fg-defaults.patch
> new file mode 100644
> index 0000000000..d3393b50c1
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
0001-do-not-ask-host-for-ifcfg-defaults.patch
> @@ -0,0 +1,27 @@
> +From 3894ddf5f677a42ed01d676b68e25a414fd8a0ce Mon Sep 17 00:00:00 2001
> +From: Adrian Freihofer <adrian.freihofer@siemens.com>
> +Date: Sun, 29 Aug 2021 15:50:35 +0200
> +Subject: [PATCH] do-not-ask-host-for-ifcfg-defaults
> +
> +---
> + meson.build | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 3c4be61509..8833c62fa3 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -304,8 +304,8 @@ else
> +   distro =3D 'unknown'
> + endif
> +
> +-enable_ifcfg_rh =3D get_option('ifcfg_rh') or (distro =3D=3D 'redhat')
> +-enable_ifupdown =3D get_option('ifupdown') or (distro =3D=3D 'debian')
> ++enable_ifcfg_rh =3D get_option('ifcfg_rh')
> ++enable_ifupdown =3D get_option('ifupdown')
> +
> + config_plugins_default =3D get_option('config_plugins_default')
> + if config_plugins_default =3D=3D ''
> +--
> +2.31.1
> +
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/0002-Do-not-create-settings-settings-property-documentati.patch b/me=
ta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-no=
t-create-settings-settings-property-documentati.patch
> deleted file mode 100644
> index 86e8eaafc5..0000000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
0002-Do-not-create-settings-settings-property-documentati.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From d0dead0478a070b96f37bd3b310443eaa8c93a25 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> -Date: Mon, 5 Jul 2021 00:42:23 +0200
> -Subject: [PATCH] Do not create settings settings/property documentation
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -It was tried to get this work by adding python3-pygobject-native to DEPE=
NDS but
> -compile could not find (configure passed) python module gi.
> -Anyway it is not necessary for us to have the settings/property docs.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> -Signed-off-by: Vinicius Aquino <voa.aquino@gmail.com>
> ----
> - Makefile.am  | 5 -----
> - configure.ac | 5 -----
> - 2 files changed, 10 deletions(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 5a62070..3d0ebcd 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -1860,15 +1860,10 @@ src/libnm-client-impl/libnm.typelib: src/libnm-c=
lient-impl/libnm.gir
> - INTROSPECTION_GIRS +=3D src/libnm-client-impl/NM-1.0.gir
> -
> - libnm_noinst_data =3D \
> --      src/nmcli/generate-docs-nm-settings-nmcli.xml \
> --      man/nm-settings-docs-dbus.xml \
> --      man/nm-settings-docs-nmcli.xml \
> -       src/libnm-client-impl/nm-property-infos-dbus.xml \
> -       src/libnm-client-impl/nm-property-infos-ifcfg-rh.xml \
> -       src/libnm-client-impl/nm-property-infos-keyfile.xml \
> -       src/libnm-client-impl/nm-property-infos-nmcli.xml \
> --      src/libnm-client-impl/nm-settings-docs-gir.xml \
> --      src/libnmc-setting/settings-docs-input.xml \
> -       $(NULL)
> -
> - noinst_DATA +=3D $(libnm_noinst_data)
> -diff --git a/configure.ac b/configure.ac
> -index 8fe23de..dc24850 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1258,11 +1258,6 @@ GTK_DOC_CHECK(1.0)
> - # check if we can build setting property documentation
> - build_docs=3Dno
> - if test -n "$INTROSPECTION_MAKEFILE"; then
> --      # If g-i is installed we know we have python, but we might not ha=
ve pygobject
> --      if ! "$PYTHON" -c 'from gi.repository import GObject' > /dev/null=
 2>&1; then
> --              AC_MSG_ERROR(["--enable-introspection aims to build the s=
ettings documentation. This requires GObject introspection for python (pygo=
bject)])
> --      fi
> --
> -       AC_PATH_PROG(PERL, perl)
> -       if test -z "$PERL"; then
> -               AC_MSG_ERROR([--enable-introspection requires perl])
> ---
> -2.31.1
> -
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch b/me=
ta-networking/recipes-connectivity/networkmanager/networkmanager/0003-insta=
ll-firewalld-to-var-libdir-rather-than-hardcod-.patch
> deleted file mode 100644
> index 11741897f6..0000000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 6388b16b93ba805f8877a94f47509f701250812f Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Mon, 6 Jul 2020 19:33:54 -0700
> -Subject: [PATCH] install firewalld to var-libdir rather than hardcod lib
> -
> -The oe install firewalld (split packages) to ${libdir}/firewalld/zones
> -
> -Upstream-Status: Inappropriate [oe specific]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - Makefile.am | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 358b01a..5745339 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -4778,7 +4778,7 @@ data/server.conf: $(srcdir)/data/server.conf.in
> -       $(AM_V_GEN) $(data_edit) $< >$@
> -
> - if WITH_FIREWALLD_ZONE
> --firewalldzonedir =3D $(prefix)/lib/firewalld/zones
> -+firewalldzonedir =3D $(libdir)/firewalld/zones
> - firewalldzone_DATA =3D data/nm-shared.xml
> - endif
> -
> ---
> -2.21.0
> -
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.36.0.bb b/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.36.0.bb
> index 76e49949f4..18541cbc03 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.36.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.36.0.bb
> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
>  "
>
>  DEPENDS =3D " \
> +    coreutils-native \
>      intltool-native \
>      libxslt-native \
>      libnl \
> @@ -16,32 +17,37 @@ DEPENDS =3D " \
>      libndp \
>      libnewt \
>      curl \
> +    dbus \
>  "
>
> -inherit gnomebase gettext update-rc.d systemd vala gobject-introspection=
 gtk-doc update-alternatives upstream-version-is-even
> +GNOMEBASEBUILDCLASS =3D "meson"
> +inherit gnomebase gettext update-rc.d systemd gobject-introspection gtk-=
doc update-alternatives upstream-version-is-even
>
>  SRC_URI =3D " \
>      ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkMana=
ger-${PV}.tar.xz \
>      file://${BPN}.initd \
> -    file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch=
 \
> -    file://0002-Do-not-create-settings-settings-property-documentati.pat=
ch \
> -    file://0003-install-firewalld-to-var-libdir-rather-than-hardcod-.pat=
ch \
> +    file://0001-do-not-ask-host-for-ifcfg-defaults.patch \
>  "
>  SRC_URI[sha256sum] =3D "faa389c9e9ca78243cfab4a8bed6db132f82e5b5e66bb9d4=
4af93379d1348398"
>
>  S =3D "${WORKDIR}/NetworkManager-${PV}"
>
> -EXTRA_OECONF =3D " \
> -    --disable-ifcfg-rh \
> -    --disable-more-warnings \
> -    --with-iptables=3D${sbindir}/iptables \
> -    --with-tests \
> -    --with-nmtui=3Dyes \
> -    --with-udev-dir=3D${nonarch_base_libdir}/udev \
> -    --with-dhclient=3Dno \
> -    --with-dhcpcd=3Dno \
> -    --with-dhcpcanon=3Dno \
> -    --with-netconfig=3Dno \
> +# ['auto', 'symlink', 'file', 'netconfig', 'resolvconf']
> +NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT ??=3D "auto"
> +
> +# ['dhcpcanon', 'dhclient', 'dhcpcd', 'internal', 'nettools']
> +NETWORKMANAGER_DHCP_DEFAULT ??=3D "internal"
> +
> +EXTRA_OEMESON =3D "\
> +    -Difcfg_rh=3Dfalse \
> +    -Dtests=3Dyes \
> +    -Dnmtui=3Dtrue \
> +    -Dudev_dir=3D${nonarch_base_libdir}/udev \
> +    -Dlibpsl=3Dfalse \
> +    -Dqt=3Dfalse \
> +    -Dconfig_dns_rc_manager_default=3D${NETWORKMANAGER_DNS_RC_MANAGER_DE=
FAULT} \
> +    -Dconfig_dhcp_default=3D${NETWORKMANAGER_DHCP_DEFAULT} \
> +    -Ddhcpcanon=3Dfalse \
>  "
>
>  # stolen from https://github.com/void-linux/void-packages/blob/master/sr=
cpkgs/NetworkManager/template
> @@ -52,7 +58,7 @@ CFLAGS:append:libc-musl =3D " \
>  "
>
>  do_compile:prepend() {
> -    export GIR_EXTRA_LIBS_PATH=3D"${B}/src/libnm-client-impl/.libs"
> +    export GI_TYPELIB_PATH=3D"${B}}/src/libnm-client-impl${GI_TYPELIB_PA=
TH:+:$GI_TYPELIB_PATH}"
>  }
>
>  PACKAGECONFIG ??=3D "nss ifupdown dnsmasq nmcli \
> @@ -64,33 +70,32 @@ PACKAGECONFIG ??=3D "nss ifupdown dnsmasq nmcli \
>
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'nmcli', 'bash-completion'=
, '', d)}
>
> -PACKAGECONFIG[systemd] =3D " \
> -    --with-systemdsystemunitdir=3D${systemd_unitdir}/system --with-sessi=
on-tracking=3Dsystemd, \
> -    --without-systemdsystemunitdir, \
> +PACKAGECONFIG[systemd] =3D "\
> +    -Dsystemdsystemunitdir=3D${systemd_unitdir}/system -Dsession_trackin=
g=3Dsystemd,\
> +    -Dsystemdsystemunitdir=3Dno -Dsystemd_journal=3Dfalse -Dsession_trac=
king=3Dno\
>  "
> -PACKAGECONFIG[polkit] =3D "--enable-polkit,--disable-polkit,polkit"
> -PACKAGECONFIG[bluez5] =3D "--enable-bluez5-dun,--disable-bluez5-dun,blue=
z5"
> +PACKAGECONFIG[polkit] =3D "-Dpolkit=3Dtrue,-Dpolkit=3Dfalse,polkit"
> +PACKAGECONFIG[bluez5] =3D "-Dbluez5_dun=3Dtrue,-Dbluez5_dun=3Dfalse,blue=
z5"
>  # consolekit is not picked by shlibs, so add it to RDEPENDS too
> -PACKAGECONFIG[consolekit] =3D "--with-session-tracking=3Dconsolekit,,con=
solekit,consolekit"
> -PACKAGECONFIG[modemmanager] =3D "--with-modem-manager-1=3Dyes,--with-mod=
em-manager-1=3Dno,modemmanager"
> -PACKAGECONFIG[ppp] =3D "--enable-ppp,--disable-ppp,ppp,ppp"
> -PACKAGECONFIG[dnsmasq] =3D "--with-dnsmasq=3D${bindir}/dnsmasq"
> -PACKAGECONFIG[nss] =3D "--with-crypto=3Dnss,,nss"
> -PACKAGECONFIG[resolvconf] =3D "--with-resolvconf=3D${base_sbindir}/resol=
vconf,,,resolvconf"
> -PACKAGECONFIG[gnutls] =3D "--with-crypto=3Dgnutls,,gnutls"
> -PACKAGECONFIG[wifi] =3D "--with-wext=3Dyes --enable-wifi=3Dyes,--with-we=
xt=3Dno --enable-wifi=3Dno,,wpa-supplicant"
> -PACKAGECONFIG[ifupdown] =3D "--enable-ifupdown,--disable-ifupdown"
> -PACKAGECONFIG[qt4-x11-free] =3D "--enable-qt,--disable-qt,qt4-x11-free"
> -PACKAGECONFIG[cloud-setup] =3D "--with-nm-cloud-setup=3Dyes,--with-nm-cl=
oud-setup=3Dno"
> -PACKAGECONFIG[nmcli] =3D "--with-nmcli=3Dyes,--with-nmcli=3Dno,readline"
> -PACKAGECONFIG[ovs] =3D "--enable-ovs,--disable-ovs,jansson"
> -PACKAGECONFIG[audit] =3D "--with-libaudit,--without-libaudit,audit"
> -PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux"
> +PACKAGECONFIG[consolekit] =3D "-Dsession_tracking_consolekit=3Dtrue,-Dse=
ssion_tracking_consolekit=3Dfalse,consolekit,consolekit"
> +PACKAGECONFIG[modemmanager] =3D "-Dmodem_manager=3Dtrue,-Dmodem_manager=
=3Dfalse,modemmanager mobile-broadband-provider-info"
> +PACKAGECONFIG[ppp] =3D "-Dppp=3Dtrue,-Dppp=3Dfalse,ppp,ppp"
> +PACKAGECONFIG[dnsmasq] =3D "-Ddnsmasq=3D${bindir}/dnsmasq"
> +PACKAGECONFIG[nss] =3D "-Dcrypto=3Dnss,,nss"
> +PACKAGECONFIG[resolvconf] =3D "-Dresolvconf=3D${base_sbindir}/resolvconf=
,-Dresolvconf=3Dno,,resolvconf"
> +PACKAGECONFIG[gnutls] =3D "-Dcrypto=3Dgnutls,,gnutls"
> +PACKAGECONFIG[wifi] =3D "-Dwext=3Dtrue -Dwifi=3Dtrue,-Dwext=3Dfalse -Dwi=
fi=3Dfalse"
> +PACKAGECONFIG[ifupdown] =3D "-Difupdown=3Dtrue,-Difupdown=3Dfalse"
> +PACKAGECONFIG[cloud-setup] =3D "-Dnm_cloud_setup=3Dtrue,-Dnm_cloud_setup=
=3Dfalse"
> +PACKAGECONFIG[nmcli] =3D "-Dnmcli=3Dtrue,-Dnmcli=3Dfalse"
> +PACKAGECONFIG[ovs] =3D "-Dovs=3Dtrue,-Dovs=3Dfalse,jansson"
> +PACKAGECONFIG[audit] =3D "-Dlibaudit=3Dyes,-Dlibaudit=3Dno"
> +PACKAGECONFIG[selinux] =3D "-Dselinux=3Dtrue,-Dselinux=3Dfalse,libselinu=
x"
>
>  PACKAGES =3D+ " \
> -  ${PN}-nmcli ${PN}-nmcli-doc \
> -  ${PN}-nmtui ${PN}-nmtui-doc \
> -  ${PN}-adsl ${PN}-cloud-setup \
> +    ${PN}-nmcli ${PN}-nmcli-doc \
> +    ${PN}-nmtui ${PN}-nmtui-doc \
> +    ${PN}-adsl ${PN}-cloud-setup \
>  "
>
>  SYSTEMD_PACKAGES =3D "${PN} ${PN}-cloud-setup"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95691): https://lists.openembedded.org/g/openembedded=
-devel/message/95691
> Mute This Topic: https://lists.openembedded.org/mt/89503414/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

