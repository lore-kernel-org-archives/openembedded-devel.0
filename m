Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB647C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 15:17:19 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.11303.1647962239178119036
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 08:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oCwwJ5Np;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id t2so875524qtw.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 08:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g2lQ5/cOeeRaqglraGvJTbmRjEr4f9DHrekuUR4Q2tQ=;
        b=oCwwJ5Np1cO9J+MyNir/ryWyOg3Q9kxJZAA+1I73OeGIIyDs904n9S9YJNVuXHbcgu
         kjoGZmQ9Wt+I+Vm7bTVSuzJ/c/wOiEwqQXIMVBNhHV6spzJHr8YgL5QededfWvWUzWPR
         hTSxBGpsSBdPvL4/0uOv6mNb1BQzIZwf8QIaXW+koyo+wkdoBORQO4+vF7qcg6weMaSD
         uLtUbjNwb/1BSgsbbnYmjQ6yvNkHZL/OhmgV6zdAPHVTzKxAPsnmmaoMKZWuN23PWrB0
         uNoz5+YjWC2uKzxsLl16YmmIeeTzekCtiUMQl2ELPRippex4GM6BPLb0xv/QQ1KFVHOW
         3f+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g2lQ5/cOeeRaqglraGvJTbmRjEr4f9DHrekuUR4Q2tQ=;
        b=Mbj8JN8qgX27ajTXLe9lu4gSw7YCUoWfSNjPzGAPxRS7Ho8OZEVUdJNg11pZaRDXDf
         x/eM0YUUFa2V3+v/DF/vaE8D4xjVBpNFt3dPW/8OQkjbaCPFxbCCrowzmEgJMuqYkTkf
         z5lE/rQcXC8v7j7PlKCVUeGqwZDiG+3ChUKRB53hmZmDs2xwN9tjd56fqsroJq4qPSjp
         REmfWpHVz/98Z805lL6nuBf4Sta+HywzbnKxZEHDGiS0wvVT5Uhe6N7SHVUNkGuLcSfY
         e2KrloIW6bvQAq8gqqzsEISVLCSzW5l6ACdxEnw1wYic0TsBGUKoeaTtJOtqe4TRMbJ6
         I4nw==
X-Gm-Message-State: AOAM533kwA+4igf7uFaszCjea1nXLn5GDp1u1bwV68yngjbzsCX1LtQ9
	rcag34sK7Ay7UUI+pJcpco7KzqFTlDRYEK+BCuHerQig5A5dvg==
X-Google-Smtp-Source: 
 ABdhPJz6pNgvTUgR1USZ3v/56zkQWKh/VpTSKFWDdna2gQq46tJNFoO0hfoTA1dwrBSlx2IK/kPDFcC55Lp+NLXD87E=
X-Received: by 2002:ac8:5842:0:b0:2e1:aa10:e7cd with SMTP id
 h2-20020ac85842000000b002e1aa10e7cdmr20774040qth.330.1647962237999; Tue, 22
 Mar 2022 08:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220321161755.3866390-1-anudeepthika@code1.emi.philips.com>
In-Reply-To: <20220321161755.3866390-1-anudeepthika@code1.emi.philips.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Mar 2022 08:16:52 -0700
Message-ID: 
 <CAMKF1spP4k3jgJ12y9vHXwkzRcx2rmcDBCmZkEe1ROEhEMgeHQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v6] usbguard: Add inital recipe
To: Nandipati.AnuDeepthika@philips.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 15:17:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96142

Seeing this

https://errors.yoctoproject.org/Errors/Details/652984/

perhaps do

bitbake -ccleanall usbguard
bitbake usbguard

On Mon, Mar 21, 2022 at 3:48 AM Anu Deepthika via
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
>  .../usbguard/usbguard_1.1.1.bb                |  75 +++++++++++++
>  2 files changed, 181 insertions(+)
>  create mode 100644 meta-oe/recipes-security/usbguard/usbguard/0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch
>  create mode 100644 meta-oe/recipes-security/usbguard/usbguard_1.1.1.bb
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
> diff --git a/meta-oe/recipes-security/usbguard/usbguard_1.1.1.bb b/meta-oe/recipes-security/usbguard/usbguard_1.1.1.bb
> new file mode 100644
> index 000000000..1e1f807db
> --- /dev/null
> +++ b/meta-oe/recipes-security/usbguard/usbguard_1.1.1.bb
> @@ -0,0 +1,75 @@
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
> +PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
> +PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
> +
> +SYSTEMD_PACKAGES = "${PN}"
> +
> +SYSTEMD_SERVICE:${PN} = "usbguard.service"
> +
> +SYSTEMD_PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'dbus', '${PN}-dbus', '', d)}"
> +
> +SYSTEMD_SERVICE:${PN}-dbus = "usbguard-dbus.service"
> +
> +PACKAGES =+ "${PN}-dbus"
> +
> +FILES:${PN} += "\
> +    ${systemd_unitdir}/system/usbguard.service \
> +    ${systemd_unitdir}/system/usbguard-dbus.service \
> +    ${datadir}/polkit-1 \
> +    ${datadir}/polkit-1/actions \
> +    ${datadir}/dbus-1 \
> +    ${nonarch_libdir}/tmpfiles.d \
> +"
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
> +    rm -rf ${D}${localstatedir}/log
> +}
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96104): https://lists.openembedded.org/g/openembedded-devel/message/96104
> Mute This Topic: https://lists.openembedded.org/mt/89924944/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

