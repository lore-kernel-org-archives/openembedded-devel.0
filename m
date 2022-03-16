Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2205DC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 06:30:36 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web09.22104.1647412234917159006
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 23:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e0wA1bGB;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id kd12so1190173qvb.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 23:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lEYwXctNC0yhQVl4/RScfkeTz+cfZWcokkejUc1gyjw=;
        b=e0wA1bGBNeN0J+picEh3wGRTycx6MdjwUUDXRR7swZQWLO+dFFZIEJfDla+GO4Agiv
         kOvKPlB+pojegVCk0TTFvXZp4JdDKyurgnoJR9aSffOYi3JHGe3Q3ngJG3Sn+qV6vvRS
         pHGMtqlNZzBOdNb7JA4PjRWKNs4PoSipGLOrKo3FKMWcd0AqYzpIyQ0ZT+hx8s6W3uSa
         zQQamPwN3FvZzzeRbJJIoxBAKuAuTYLbqd+FfZVWWrGHRNAJyFBtbuFdEbQCKVAmiRqx
         oUqqOVwr//8dVSOar8juz8T/3ADyOtm5F0KsRWNXgrkFGy1h4eyidsOHwplKJCNLomIx
         Fyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lEYwXctNC0yhQVl4/RScfkeTz+cfZWcokkejUc1gyjw=;
        b=NoPGu65tXoqHYo6ovkSFfP9qZB9wMnsiv+uNt+hsN4OteGE5XD9rfLvjIAOm+FWEgK
         17+AXSDwzsB44s1j4OTYswh9EWbVIWcrcgntPtwUTyxBMz4+G2BtLCbhRlWsuz3u2jtn
         YUKoETsn1x92F5acCdqHYQMfY1wiiuI83WbJieef/f5IjF2oU0DXvd6kRg3rYYwdgTtR
         V89oEHwfCImRC+VcNy9fPYfxAEfnmBol5dIFtq2LyjjmhZm54g2pB9v+RXCHUxMEZOdV
         AnlIAlDxHc8SljB7x65w19iZqOR6vHaTIB6Vb+bz3TRKg426jNUAoWerGH64gc+xcM83
         dHWA==
X-Gm-Message-State: AOAM5327Tx0WxROH9YxNlIe14o+KMVbEzzEl8Ye6dar5klQixPfbfkJj
	ZnFIVYkvUmHSIHCsebO6txDT6Jk1a/pn/S3wQUs=
X-Google-Smtp-Source: 
 ABdhPJy55CGXYJ9xCvbKo0mHCDeKl8ulOqlf18XTsRYC4gOfXb6sYb/sl/1sCT8GD4B5TyKR4S7/TRYqGMBC2Ub+tuw=
X-Received: by 2002:a05:6214:2465:b0:43e:9638:3584 with SMTP id
 im5-20020a056214246500b0043e96383584mr15109996qvb.110.1647412233825; Tue, 15
 Mar 2022 23:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220316103450.3790172-1-anudeepthika@code1.emi.philips.com>
In-Reply-To: <20220316103450.3790172-1-anudeepthika@code1.emi.philips.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Mar 2022 23:30:07 -0700
Message-ID: 
 <CAMKF1sp851ZLRGdOkpi235nbPVi3SUjWWpP9=6+-SxX9xaBugg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v4] usbguard: Add inital recipe
To: Nandipati.AnuDeepthika@philips.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 06:30:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96005

On Tue, Mar 15, 2022 at 10:05 PM Anu Deepthika via
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
>  .../usbguard/usbguard_1.1.0.bb                |  75 +++++++++++++
>  2 files changed, 181 insertions(+)
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
> index 000000000..ca97a3a8b
> --- /dev/null
> +++ b/meta-oe/recipes-security/usbguard/usbguard_1.1.0.bb
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
> +PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
> +
> +SYSTEMD_PACKAGES = "${PN}"
> +
> +SYSTEMD_SERVICE_${PN} = "usbguard.service"

this should be SYSTEMD_SERVICE:${PN}

> +
> +SYSTEMD_PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'dbus', '${PN}-dbus', '', d)}"
> +
> +SYSTEMD_SERVICE_${PN}-dbus = "usbguard-dbus.service"

should be SYSTEMD_SERVICE:${PN}-dbus

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
> +INSANE_SKIP:${PN} += "empty-dirs"
> +

this should be not needed, if you delete the empty dirs during
do_install Is there a valid reason to package them ?

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
> View/Reply Online (#96004): https://lists.openembedded.org/g/openembedded-devel/message/96004
> Mute This Topic: https://lists.openembedded.org/mt/89815916/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

