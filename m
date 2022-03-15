Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE9FC433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 18:38:31 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web09.15073.1647369510412676658
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 11:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nD1+lafj;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id r1so160584qvr.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 11:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hIQUCFJ2hpK4bVnLlgkdRRG7YeUaUxVdhDM1aRzmTVA=;
        b=nD1+lafjNX3pf49ho/8YNRB/0EkfIocEda3fDeSa2zWTFHRkqJ6mhAcgEhI3kdb0fk
         XzAFfpfaOHeo4Zaz8kevbjAXyGMvGVcpAgh4By83BygWc//8j4qoFn7tC42Xm7f8E8Cf
         O1YIwjkpC4ft4MxePZjcljZC2W1NVSXMd3PMxOslqgirG+hWJqEVEggQRCCDySjfWuES
         WB9ogLMx0IWfrKWyZAvackQWFk1GMs73By7ynCMy7K4WaBgVqClLDrPW3Gikh/b81v80
         JogNq9RnVBVPJ/wf52eKOsauxgLJyceLAZ4PUh5N0GX/K4EAl8JnD/Eg0kgdRAdk8MCR
         bjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hIQUCFJ2hpK4bVnLlgkdRRG7YeUaUxVdhDM1aRzmTVA=;
        b=zfwNmDX3fsXopNrinsNcbNErybbdRUeNgLFNwQyRkeFwrrCJ3PRwnOE2w8wB16hqdy
         1T5j1Im3vfm9PWCGh7qPpmxBwnX2lC84cKNkuJc6WjbvL2RbbPLv0zYU9v1cfGQUhh+t
         VF9NFCrH9aG0XqWo1XooNdp0z4Jl5J5funhC1NTVDpHtyCROJ8SyX7FmbfYgfcPRFsmW
         xS+zuCLviJ6Dd3KpgvFX5uXN7c6HMjRVwJ2stki+TcJqnCLSFEmu9MTI0cb3wGDO9Pxi
         pgLXqd0Ue5Epu7s88ubA0j9X3ulY2LafLvCq7targDhMu9vxz6x1LCrfThIPdXTVm6Ob
         vsEg==
X-Gm-Message-State: AOAM533SPomOyusygewBSkR3E3oFUxSUIUGy/v5o7MGqB7BhXzb68eRd
	7V6RvjtFN5K20CZPM+/3ghg1fMy2DnlRBKLzzho=
X-Google-Smtp-Source: 
 ABdhPJx6Obs42qNH7VJAEUfvMhF6texBjY1a6OmqJeDLPedqMoqJHR1xgv9+w6AkZhodrf1tjzkLf34DB97k3FNTKAo=
X-Received: by 2002:a05:6214:623:b0:435:c552:65bb with SMTP id
 a3-20020a056214062300b00435c55265bbmr22477243qvx.16.1647369509420; Tue, 15
 Mar 2022 11:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220315185222.3788812-1-anudeepthika@code1.emi.philips.com>
In-Reply-To: <20220315185222.3788812-1-anudeepthika@code1.emi.philips.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Mar 2022 11:38:03 -0700
Message-ID: 
 <CAMKF1sqYMcKk7BMifs+BpEJ3+e5DB61TAZ0bav0Hrh6FzLtx9g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] usbguard: Add inital recipe
To: Nandipati.AnuDeepthika@philips.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Mar 2022 18:38:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96002

Thanks for patch it needs some rework however on distros using systemd
in DISTRO_FEATURES

ERROR: usbguard-1.1.0-r0 do_package: QA Issue: usbguard:
Files/directories were installed but not shipped in any package:
  /usr/lib/tmpfiles.d
  /usr/lib/tmpfiles.d/usbguard.conf
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
usbguard: 2 installed and not shipped files. [installed-vs-shipped]


On Tue, Mar 15, 2022 at 6:22 AM Anu Deepthika via
lists.openembedded.org
<Nandipati.AnuDeepthika=philips.com@lists.openembedded.org> wrote:
>
> From: "Anu Deepthika, Nandipati" <Nandipati.AnuDeepthika@philips.com>
>
> Set one crypto-backend library at a time
> OpenSSL is the crypto-backend library set for device hashing
> Override PACKAGECONFIG to replace it with libsodium or libgcrypt
>
> Signed-off-by: Anu Deepthika, Nandipati <Nandipati.AnuDeepthika@philips.com>
> ---
>  ...kgconfig-instead-of-libgcrypt-config.patch | 106 ++++++++++++++++++
>  .../usbguard/usbguard_1.1.0.bb                |  74 ++++++++++++
>  2 files changed, 180 insertions(+)
>  create mode 100644 meta-oe/recipes-security/usbguard/usbguard/0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch
>  create mode 100644 meta-oe/recipes-security/usbguard/usbguard_1.1.0.bb
>
> diff --git a/meta-oe/recipes-security/usbguard/usbguard/0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch b/meta-oe/recipes-security/usbguard/usbguard/0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch
> new file mode 100644
> index 000000000..a7a3eb043
> --- /dev/null
> +++ b/meta-oe/recipes-security/usbguard/usbguard/0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch
> @@ -0,0 +1,106 @@
> +From e36cbf9d7a32de9945a8b6c62ad29dfb60358081 Mon Sep 17 00:00:00 2001
> +From: "Anu Deepthika, Nandipati" <Nandipati.AnuDeepthika@philips.com>
> +Date: Wed, 9 Mar 2022 02:03:51 +0530
> +Subject: [PATCH] Add and use pkgconfig instead of libgcrypt-config
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Anu Deepthika, Nandipati <Nandipati.AnuDeepthika@philips.com>
> +---
> + m4/libgcrypt.m4 | 56 ++-----------------------------------------------
> + 1 file changed, 2 insertions(+), 54 deletions(-)
> +
> +diff --git a/m4/libgcrypt.m4 b/m4/libgcrypt.m4
> +index 9a29eb5..465fe24 100644
> +--- a/m4/libgcrypt.m4
> ++++ b/m4/libgcrypt.m4
> +@@ -22,17 +22,7 @@ dnl with a changed API.
> + dnl
> + AC_DEFUN([AM_PATH_LIBGCRYPT],
> + [ AC_REQUIRE([AC_CANONICAL_HOST])
> +-  AC_ARG_WITH(libgcrypt-prefix,
> +-            AS_HELP_STRING([--with-libgcrypt-prefix=PFX],
> +-                           [prefix where LIBGCRYPT is installed (optional)]),
> +-     libgcrypt_config_prefix="$withval", libgcrypt_config_prefix="")
> +-  if test x$libgcrypt_config_prefix != x ; then
> +-     if test x${LIBGCRYPT_CONFIG+set} != xset ; then
> +-        LIBGCRYPT_CONFIG=$libgcrypt_config_prefix/bin/libgcrypt-config
> +-     fi
> +-  fi
> +
> +-  AC_PATH_TOOL(LIBGCRYPT_CONFIG, libgcrypt-config, no)
> +   tmp=ifelse([$1], ,1:1.2.0,$1)
> +   if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
> +      req_libgcrypt_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
> +@@ -41,44 +31,8 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
> +      req_libgcrypt_api=0
> +      min_libgcrypt_version="$tmp"
> +   fi
> ++  PKG_CHECK_MODULES(LIBGCRYPT, [libgcrypt >= $min_libgcrypt_version], [ok=yes], [ok=no])
> +
> +-  AC_MSG_CHECKING(for LIBGCRYPT - version >= $min_libgcrypt_version)
> +-  ok=no
> +-  if test "$LIBGCRYPT_CONFIG" != "no" ; then
> +-    req_major=`echo $min_libgcrypt_version | \
> +-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
> +-    req_minor=`echo $min_libgcrypt_version | \
> +-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
> +-    req_micro=`echo $min_libgcrypt_version | \
> +-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
> +-    libgcrypt_config_version=`$LIBGCRYPT_CONFIG --version`
> +-    major=`echo $libgcrypt_config_version | \
> +-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
> +-    minor=`echo $libgcrypt_config_version | \
> +-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\2/'`
> +-    micro=`echo $libgcrypt_config_version | \
> +-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\3/'`
> +-    if test "$major" -gt "$req_major"; then
> +-        ok=yes
> +-    else
> +-        if test "$major" -eq "$req_major"; then
> +-            if test "$minor" -gt "$req_minor"; then
> +-               ok=yes
> +-            else
> +-               if test "$minor" -eq "$req_minor"; then
> +-                   if test "$micro" -ge "$req_micro"; then
> +-                     ok=yes
> +-                   fi
> +-               fi
> +-            fi
> +-        fi
> +-    fi
> +-  fi
> +-  if test $ok = yes; then
> +-    AC_MSG_RESULT([yes ($libgcrypt_config_version)])
> +-  else
> +-    AC_MSG_RESULT(no)
> +-  fi
> +   if test $ok = yes; then
> +      # If we have a recent libgcrypt, we should also check that the
> +      # API is compatible
> +@@ -96,10 +50,8 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
> +      fi
> +   fi
> +   if test $ok = yes; then
> +-    LIBGCRYPT_CFLAGS=`$LIBGCRYPT_CONFIG --cflags`
> +-    LIBGCRYPT_LIBS=`$LIBGCRYPT_CONFIG --libs`
> +     ifelse([$2], , :, [$2])
> +-    libgcrypt_config_host=`$LIBGCRYPT_CONFIG --host 2>/dev/null || echo none`
> ++      libgcrypt_config_host=`$PKG_CONFIG --variable=host libgcrypt`
> +     if test x"$libgcrypt_config_host" != xnone ; then
> +       if test x"$libgcrypt_config_host" != x"$host" ; then
> +   AC_MSG_WARN([[
> +@@ -112,10 +64,6 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
> + ***]])
> +       fi
> +     fi
> +-  else
> +-    LIBGCRYPT_CFLAGS=""
> +-    LIBGCRYPT_LIBS=""
> +-    ifelse([$3], , :, [$3])
> +   fi
> +   AC_SUBST(LIBGCRYPT_CFLAGS)
> +   AC_SUBST(LIBGCRYPT_LIBS)
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-security/usbguard/usbguard_1.1.0.bb b/meta-oe/recipes-security/usbguard/usbguard_1.1.0.bb
> new file mode 100644
> index 000000000..93b4707a1
> --- /dev/null
> +++ b/meta-oe/recipes-security/usbguard/usbguard_1.1.0.bb
> @@ -0,0 +1,74 @@
> +# Copyright (c) 2021 Koninklijke Philips N.V.
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +SUMMARY = "USBGuard daemon for blacklisting and whitelisting of USB devices"
> +DESCRIPTION = "The USBGuard software framework helps to protect your computer against \
> +rogue USB devices (a.k.a. Bad USB) by implementing basic whitelisting and blacklisting \
> +capabilities based on device attributes. This recipe takes OpenSSL as crypto-backend for \
> +computing device hashes (Supported values are sodium, gcrypt, openssl)."
> +HOMEPAGE = "https://usbguard.github.io/"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "https://github.com/USBGuard/usbguard/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
> +    file://0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch"
> +
> +SRC_URI[sha256sum] = "a39104042b0c57f969c4e6580f6d80ad7066551eda966600695e644081128a2d"
> +
> +inherit autotools-brokensep bash-completion pkgconfig systemd
> +
> +DEPENDS = "glib-2.0-native libcap-ng libqb libxml2-native libxslt-native pegtl protobuf protobuf-native xmlto-native"
> +
> +S = "${WORKDIR}/${BPN}-${PV}"
> +
> +EXTRA_OECONF += "\
> +    --with-bundled-catch \
> +    --with-bundled-pegtl \
> +"
> +
> +PACKAGECONFIG ?= "\
> +    openssl \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +"
> +
> +# USBGuard has made polkit mandatory to configure with-dbus
> +PACKAGECONFIG[dbus] = "--with-dbus,--without-dbus,dbus-glib polkit"
> +PACKAGECONFIG[libgcrypt] = "--with-crypto-library=gcrypt,,libgcrypt,,,libsodium openssl"
> +PACKAGECONFIG[libsodium] = "--with-crypto-library=sodium,,libsodium,,,libgcrypt openssl"
> +PACKAGECONFIG[openssl] = "--with-crypto-library=openssl,,openssl,,,libgcrypt libsodium"
> +PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit"
> +PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
> +
> +SYSTEMD_PACKAGES = "${PN}"
> +
> +SYSTEMD_SERVICE_${PN} = "usbguard.service"
> +
> +SYSTEMD_PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'dbus', '${PN}-dbus', '', d)}"
> +
> +SYSTEMD_SERVICE_${PN}-dbus = "usbguard-dbus.service"
> +
> +PACKAGES =+ "${PN}-dbus"
> +
> +FILES:${PN} += "\
> +    ${systemd_unitdir}/system/usbguard.service \
> +    ${systemd_unitdir}/system/usbguard-dbus.service \
> +    ${datadir}/polkit-1 \
> +    ${datadir}/polkit-1/actions \
> +    ${datadir}/dbus-1 \
> +"
> +
> +INSANE_SKIP:${PN} += "empty-dirs"
> +
> +do_install:append() {
> +# Create /var/log/usbguard in runtime.
> +    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
> +        install -d ${D}${nonarch_libdir}/tmpfiles.d
> +        echo "d ${localstatedir}/log/${BPN} 0755 root root -" > ${D}${nonarch_libdir}/tmpfiles.d/${BPN}.conf
> +    fi
> +    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'sysvinit', d)}" ]; then
> +        install -d ${D}${sysconfdir}/default/volatiles
> +        echo "d root root 0755 ${localstatedir}/log/${BPN} none" > ${D}${sysconfdir}/default/volatiles/99_${BPN}
> +    fi
> +}
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95992): https://lists.openembedded.org/g/openembedded-devel/message/95992
> Mute This Topic: https://lists.openembedded.org/mt/89797353/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

