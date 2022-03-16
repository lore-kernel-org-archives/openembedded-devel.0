Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CABC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 19:33:16 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.1159.1647459193737587678
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 12:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JS+nhS7N;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id v13so2755515qkv.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 12:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=geJ4neOEF7uUifTc/MeiBLsGr+R2xvLWV1v0QgJXuyU=;
        b=JS+nhS7NgHp2I2ETLCvomLIg5fT2oWtVS/E/MgQ1HLGs/gGOABDz+KhHbF1Ioc22gD
         E5Iku7cxg+aU1CX2P7dtw3ouQLJHV08OlyJIdo+78v5jwrFD15G5YQ110pTxXYAmaO8X
         POfzajDbsNwNrm201201pDGfsJhMituw7ZKdhCzbZhjHNcmVpBYUkcQjWMHi+dwtVbaQ
         jPxdbhXC88ZQjsqmIvLt/MjyLfvx5oKN5adGn+67vr9CK+UkNPTm0HH1ZtvrgJdNUCcF
         YsG/sY4s/NXxciyuE+KXQXnhIEP3ZunM+2WIlaRYW52NIbb//xcJW+xhs/QWBdNwwk/a
         YzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=geJ4neOEF7uUifTc/MeiBLsGr+R2xvLWV1v0QgJXuyU=;
        b=dof/F1WFWwDoSCxVbMivF9INsPHlYDwoytXUlf1j5PQ6kyBq7bmdRYeFCguAswoubg
         YsnCNhDwp9ZvOLnxvBtQVSWGN21TUb6DsY5hFzb29FGbJ7YP2PcRoipcDU7S7SPNk7hR
         f+vviK/zD376E0bv0V0i5U3NLSu/jzwWv522/2Ahrkj4v8+gMioBdTaJEoMCXfYQ/Oml
         86tWIYJTy72KTGfD3Lp2mWkUv6hmnWrPu68o79Z0CtCc9MncBJeVXmadPoZkLMBhlIft
         ZuGFzp9Y192lloppMWFjevwGTNJcYokEK7X4047nuInJs0GQqT9+x3xq7qi8+RMLOWzB
         ZHdg==
X-Gm-Message-State: AOAM533qXnCVPy3lLE4SKzlpe7TP3OP2r0PB1vojBX9FBfWtTB/fMGxk
	ffnRVWmDaWokJMQhFYsfsqfz9BIKwKmp5wAp6Ac=
X-Google-Smtp-Source: 
 ABdhPJwria+53fiYr4g5fmma1Ix+siW72JnPTi7cgpDyS7gX6L1iYfnHtTudg4HHmfPZOPP4n/sR2/2IqhDND4Suwmo=
X-Received: by 2002:a05:620a:4103:b0:67b:49f4:3ee4 with SMTP id
 j3-20020a05620a410300b0067b49f43ee4mr938246qko.72.1647459192711; Wed, 16 Mar
 2022 12:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220316143115.3790996-1-anudeepthika@code1.emi.philips.com>
 <CAMKF1spJ-0sNHybVutCD9hnrOnoxgg5k0cOYim6EB6nWLy1jZg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spJ-0sNHybVutCD9hnrOnoxgg5k0cOYim6EB6nWLy1jZg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Mar 2022 12:32:46 -0700
Message-ID: 
 <CAMKF1soTk3cgv+QgtAfFe7-BSDBfkNDL5EUPHQutNenufG0+=Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v5] usbguard: Add inital recipe
To: Nandipati.AnuDeepthika@philips.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 19:33:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96027

add a packageconfig knob for seccomp as well
something like

PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"

On Wed, Mar 16, 2022 at 12:30 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> 1.1.1 is latest release [1], can you update to this release and resend.
>
> [1] https://github.com/USBGuard/usbguard/releases/tag/usbguard-1.1.1
>
> On Wed, Mar 16, 2022 at 2:01 AM Anu Deepthika via
> lists.openembedded.org
> <Nandipati.AnuDeepthika=philips.com@lists.openembedded.org> wrote:
> >
> > From: "Anu Deepthika, Nandipati" <Nandipati.AnuDeepthika@philips.com>
> >
> > Set one crypto-backend library at a time
> > OpenSSL is the crypto-backend library set for device hashing
> > Override PACKAGECONFIG to replace it with libsodium or libgcrypt
> >
> > Signed-off-by: Anu Deepthika, Nandipati <Nandipati.AnuDeepthika@philips.com>
> > ---
> >  ...kgconfig-instead-of-libgcrypt-config.patch | 106 ++++++++++++++++++
> >  .../usbguard/usbguard_1.1.0.bb                |  74 ++++++++++++
> >  2 files changed, 180 insertions(+)
> >  create mode 100644 meta-oe/recipes-security/usbguard/usbguard/0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch
> >  create mode 100644 meta-oe/recipes-security/usbguard/usbguard_1.1.0.bb
> >
> > diff --git a/meta-oe/recipes-security/usbguard/usbguard/0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch b/meta-oe/recipes-security/usbguard/usbguard/0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch
> > new file mode 100644
> > index 000000000..a7a3eb043
> > --- /dev/null
> > +++ b/meta-oe/recipes-security/usbguard/usbguard/0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch
> > @@ -0,0 +1,106 @@
> > +From e36cbf9d7a32de9945a8b6c62ad29dfb60358081 Mon Sep 17 00:00:00 2001
> > +From: "Anu Deepthika, Nandipati" <Nandipati.AnuDeepthika@philips.com>
> > +Date: Wed, 9 Mar 2022 02:03:51 +0530
> > +Subject: [PATCH] Add and use pkgconfig instead of libgcrypt-config
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Anu Deepthika, Nandipati <Nandipati.AnuDeepthika@philips.com>
> > +---
> > + m4/libgcrypt.m4 | 56 ++-----------------------------------------------
> > + 1 file changed, 2 insertions(+), 54 deletions(-)
> > +
> > +diff --git a/m4/libgcrypt.m4 b/m4/libgcrypt.m4
> > +index 9a29eb5..465fe24 100644
> > +--- a/m4/libgcrypt.m4
> > ++++ b/m4/libgcrypt.m4
> > +@@ -22,17 +22,7 @@ dnl with a changed API.
> > + dnl
> > + AC_DEFUN([AM_PATH_LIBGCRYPT],
> > + [ AC_REQUIRE([AC_CANONICAL_HOST])
> > +-  AC_ARG_WITH(libgcrypt-prefix,
> > +-            AS_HELP_STRING([--with-libgcrypt-prefix=PFX],
> > +-                           [prefix where LIBGCRYPT is installed (optional)]),
> > +-     libgcrypt_config_prefix="$withval", libgcrypt_config_prefix="")
> > +-  if test x$libgcrypt_config_prefix != x ; then
> > +-     if test x${LIBGCRYPT_CONFIG+set} != xset ; then
> > +-        LIBGCRYPT_CONFIG=$libgcrypt_config_prefix/bin/libgcrypt-config
> > +-     fi
> > +-  fi
> > +
> > +-  AC_PATH_TOOL(LIBGCRYPT_CONFIG, libgcrypt-config, no)
> > +   tmp=ifelse([$1], ,1:1.2.0,$1)
> > +   if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
> > +      req_libgcrypt_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
> > +@@ -41,44 +31,8 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
> > +      req_libgcrypt_api=0
> > +      min_libgcrypt_version="$tmp"
> > +   fi
> > ++  PKG_CHECK_MODULES(LIBGCRYPT, [libgcrypt >= $min_libgcrypt_version], [ok=yes], [ok=no])
> > +
> > +-  AC_MSG_CHECKING(for LIBGCRYPT - version >= $min_libgcrypt_version)
> > +-  ok=no
> > +-  if test "$LIBGCRYPT_CONFIG" != "no" ; then
> > +-    req_major=`echo $min_libgcrypt_version | \
> > +-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
> > +-    req_minor=`echo $min_libgcrypt_version | \
> > +-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
> > +-    req_micro=`echo $min_libgcrypt_version | \
> > +-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
> > +-    libgcrypt_config_version=`$LIBGCRYPT_CONFIG --version`
> > +-    major=`echo $libgcrypt_config_version | \
> > +-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
> > +-    minor=`echo $libgcrypt_config_version | \
> > +-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\2/'`
> > +-    micro=`echo $libgcrypt_config_version | \
> > +-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\3/'`
> > +-    if test "$major" -gt "$req_major"; then
> > +-        ok=yes
> > +-    else
> > +-        if test "$major" -eq "$req_major"; then
> > +-            if test "$minor" -gt "$req_minor"; then
> > +-               ok=yes
> > +-            else
> > +-               if test "$minor" -eq "$req_minor"; then
> > +-                   if test "$micro" -ge "$req_micro"; then
> > +-                     ok=yes
> > +-                   fi
> > +-               fi
> > +-            fi
> > +-        fi
> > +-    fi
> > +-  fi
> > +-  if test $ok = yes; then
> > +-    AC_MSG_RESULT([yes ($libgcrypt_config_version)])
> > +-  else
> > +-    AC_MSG_RESULT(no)
> > +-  fi
> > +   if test $ok = yes; then
> > +      # If we have a recent libgcrypt, we should also check that the
> > +      # API is compatible
> > +@@ -96,10 +50,8 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
> > +      fi
> > +   fi
> > +   if test $ok = yes; then
> > +-    LIBGCRYPT_CFLAGS=`$LIBGCRYPT_CONFIG --cflags`
> > +-    LIBGCRYPT_LIBS=`$LIBGCRYPT_CONFIG --libs`
> > +     ifelse([$2], , :, [$2])
> > +-    libgcrypt_config_host=`$LIBGCRYPT_CONFIG --host 2>/dev/null || echo none`
> > ++      libgcrypt_config_host=`$PKG_CONFIG --variable=host libgcrypt`
> > +     if test x"$libgcrypt_config_host" != xnone ; then
> > +       if test x"$libgcrypt_config_host" != x"$host" ; then
> > +   AC_MSG_WARN([[
> > +@@ -112,10 +64,6 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
> > + ***]])
> > +       fi
> > +     fi
> > +-  else
> > +-    LIBGCRYPT_CFLAGS=""
> > +-    LIBGCRYPT_LIBS=""
> > +-    ifelse([$3], , :, [$3])
> > +   fi
> > +   AC_SUBST(LIBGCRYPT_CFLAGS)
> > +   AC_SUBST(LIBGCRYPT_LIBS)
> > +--
> > +2.25.1
> > +
> > diff --git a/meta-oe/recipes-security/usbguard/usbguard_1.1.0.bb b/meta-oe/recipes-security/usbguard/usbguard_1.1.0.bb
> > new file mode 100644
> > index 000000000..3a2966ff4
> > --- /dev/null
> > +++ b/meta-oe/recipes-security/usbguard/usbguard_1.1.0.bb
> > @@ -0,0 +1,74 @@
> > +# Copyright (c) 2021 Koninklijke Philips N.V.
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +SUMMARY = "USBGuard daemon for blacklisting and whitelisting of USB devices"
> > +DESCRIPTION = "The USBGuard software framework helps to protect your computer against \
> > +rogue USB devices (a.k.a. Bad USB) by implementing basic whitelisting and blacklisting \
> > +capabilities based on device attributes. This recipe takes OpenSSL as crypto-backend for \
> > +computing device hashes (Supported values are sodium, gcrypt, openssl)."
> > +HOMEPAGE = "https://usbguard.github.io/"
> > +LICENSE = "GPL-2.0-only"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > +
> > +SRC_URI = "https://github.com/USBGuard/usbguard/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
> > +    file://0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch"
> > +
> > +SRC_URI[sha256sum] = "a39104042b0c57f969c4e6580f6d80ad7066551eda966600695e644081128a2d"
> > +
> > +inherit autotools-brokensep bash-completion pkgconfig systemd
> > +
> > +DEPENDS = "glib-2.0-native libcap-ng libqb libxml2-native libxslt-native pegtl protobuf protobuf-native xmlto-native"
> > +
> > +S = "${WORKDIR}/${BPN}-${PV}"
> > +
> > +EXTRA_OECONF += "\
> > +    --with-bundled-catch \
> > +    --with-bundled-pegtl \
> > +"
> > +
> > +PACKAGECONFIG ?= "\
> > +    openssl \
> > +    ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
> > +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> > +"
> > +
> > +# USBGuard has made polkit mandatory to configure with-dbus
> > +PACKAGECONFIG[dbus] = "--with-dbus,--without-dbus,dbus-glib polkit"
> > +PACKAGECONFIG[libgcrypt] = "--with-crypto-library=gcrypt,,libgcrypt,,,libsodium openssl"
> > +PACKAGECONFIG[libsodium] = "--with-crypto-library=sodium,,libsodium,,,libgcrypt openssl"
> > +PACKAGECONFIG[openssl] = "--with-crypto-library=openssl,,openssl,,,libgcrypt libsodium"
> > +PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit"
> > +PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
> > +
> > +SYSTEMD_PACKAGES = "${PN}"
> > +
> > +SYSTEMD_SERVICE:${PN} = "usbguard.service"
> > +
> > +SYSTEMD_PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'dbus', '${PN}-dbus', '', d)}"
> > +
> > +SYSTEMD_SERVICE:${PN}-dbus = "usbguard-dbus.service"
> > +
> > +PACKAGES =+ "${PN}-dbus"
> > +
> > +FILES:${PN} += "\
> > +    ${systemd_unitdir}/system/usbguard.service \
> > +    ${systemd_unitdir}/system/usbguard-dbus.service \
> > +    ${datadir}/polkit-1 \
> > +    ${datadir}/polkit-1/actions \
> > +    ${datadir}/dbus-1 \
> > +    ${nonarch_libdir}/tmpfiles.d \
> > +"
> > +
> > +do_install:append() {
> > +# Create /var/log/usbguard in runtime.
> > +    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
> > +        install -d ${D}${nonarch_libdir}/tmpfiles.d
> > +        echo "d ${localstatedir}/log/${BPN} 0755 root root -" > ${D}${nonarch_libdir}/tmpfiles.d/${BPN}.conf
> > +    fi
> > +    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'sysvinit', d)}" ]; then
> > +        install -d ${D}${sysconfdir}/default/volatiles
> > +        echo "d root root 0755 ${localstatedir}/log/${BPN} none" > ${D}${sysconfdir}/default/volatiles/99_${BPN}
> > +    fi
> > +    rm -rf ${D}${localstatedir}/log
> > +}
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#96020): https://lists.openembedded.org/g/openembedded-devel/message/96020
> > Mute This Topic: https://lists.openembedded.org/mt/89817582/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

