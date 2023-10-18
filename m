Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 373EDCDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 04:40:54 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.275265.1697604049112829465
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Oct 2023 21:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OYj/nrb+;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1dc9c2b2b79so3066409fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 21:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697604048; x=1698208848; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCQoRHcG4px0iO+Y33D5WxMFDsAmhd5fLCb+7LMwfRo=;
        b=OYj/nrb+ZMLFEP8Egu5RauHxZ/xI2fEmKTyCMtCqzaD3mn+AgCY9Bkj4L9i7KYyP8M
         eI/DvBLTSYc2B0ZFFlSyV8P2Y+x73eTdr+1Yh5e/OoakOWIPxXsqLDrNkXvccsi0dacp
         8C1R+6l8h+EgqQOZ3//y8sUPAnxZHv4pbfS9/XC5zKlR159SFJi6zls77hjp1MmN/lf5
         gCu2zIhnYooyD7CQhLH9BUaCLxX4Ihu3WFQKSlHI6sgRPLBL8K9/dAl9K/8Ap6O//ik/
         d8gcO7Nis+nZ6OEeetJO7DnreJNHFOtB8SzTbzeX9VRusb2Uu/0B/6znKhJ3ojNXliTY
         EWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697604048; x=1698208848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCQoRHcG4px0iO+Y33D5WxMFDsAmhd5fLCb+7LMwfRo=;
        b=Soxv7DuKbkzE4FyAkPX7ei9cs7D5LafOlVLr3N6xHBOCIlsXwi95XhCz7wXyenB/kP
         dWCHtRtcSefwXMPzVLDiy/5eqcBIteWltTu1ZwsOLATCkVSUR2pt1tH9kZr+r31xjqIC
         OR+D9v0utodmKvBz42S0kzP/lO5NPPaO17nUK84FcjdFqn2UXxiM4LSAth7dfv301oYm
         3PvWHriaHw7WPhGlvsSXArOyd5GTYhJSmLzvLoJwHqqfoxKVmO4WvSle2jhjxkyxpHNh
         GOozPtlUBZYtIPXNNZ3f15H1ykvfxMlCNxIG5GMCCKIgw3q/0kyqKjkakuJxrOVhbhhT
         cWag==
X-Gm-Message-State: AOJu0YzYl8G3P9bl7rbNGbP9jyLlDlH/mIKPuUieZSX/SBIGO1bTtGqw
	mWDhwUYKtNL5QdZVkXD6BB4yTJP/KBKux7/BMdQ=
X-Google-Smtp-Source: AGHT+IFFFTa10Orr+ySmieEvIrNVbOTv2g8ioIKjr2LpQ+0VhmEOdFkCNUbQkf1Vjd5cUxxiypWlY38mhAWoWyv+8NA=
X-Received: by 2002:a05:6870:1305:b0:1c8:bfd1:ecc0 with SMTP id
 5-20020a056870130500b001c8bfd1ecc0mr3833720oab.0.1697604048209; Tue, 17 Oct
 2023 21:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231017133214.1562048-1-luca.fancellu@arm.com> <20231017133214.1562048-2-luca.fancellu@arm.com>
In-Reply-To: <20231017133214.1562048-2-luca.fancellu@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Oct 2023 21:40:22 -0700
Message-ID: <CAMKF1spNBkb9jwMjA2F_w36=djB4Bi44qjZed4NCt3k5E_Yd8A@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] linuxptp: Drop unneeded downstream patches
To: luca fancellu <luca.fancellu@arm.com>
Cc: openembedded-devel@lists.openembedded.org, diego.sueiro@arm.com, 
	rahul.singh@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 04:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105564

Seeing a build failure - https://errors.yoctoproject.org/Errors/Details/739=
959/

On Tue, Oct 17, 2023 at 6:32=E2=80=AFAM luca fancellu <luca.fancellu@arm.co=
m> wrote:
>
> Drop Use-cross-cpp-in-incdefs.patch which is "Inappropriate"
> but can removed just by passing CROSS_COMPILE=3D'${TARGET_PREFIX}'
> into EXTRA_OEMAKE.
>
> Drop build-Allow-CC-and-prefix-to-be-overriden.patch that can
> be removed by passing CC=3D'${CC}' in EXTRA_OEMAKE and, as already
> the case, passing prefix=3D${prefix} in the oe_runmake command line.
>
> While there, drop ARCH from EXTRA_OEMAKE because it's not used in
> the codebase.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  .../linuxptp/Use-cross-cpp-in-incdefs.patch   | 28 ---------------
>  ...-Allow-CC-and-prefix-to-be-overriden.patch | 35 -------------------
>  .../linuxptp/linuxptp_4.1.bb                  |  5 ++-
>  3 files changed, 2 insertions(+), 66 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cr=
oss-cpp-in-incdefs.patch
>  delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/build-=
Allow-CC-and-prefix-to-be-overriden.patch
>
> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp=
-in-incdefs.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cros=
s-cpp-in-incdefs.patch
> deleted file mode 100644
> index 9c87851e48ef..000000000000
> --- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-inc=
defs.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From be8808005772da48c052cf34a343a6d140541f6a Mon Sep 17 00:00:00 2001
> -From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> -Date: Fri, 23 Dec 2016 18:12:29 +0100
> -Subject: [PATCH] linuxptp: Use cross cpp in incdefs
> -
> -Use cross cpp incdefs.sh shell script since we are doing cross compiling
> -we need to ensure we use correct setttings from toolchain
> -
> -Upstream-Status: Inappropriate [OE-Specific]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - incdefs.sh | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/incdefs.sh b/incdefs.sh
> -index a9e94f7..dd1692f 100755
> ---- a/incdefs.sh
> -+++ b/incdefs.sh
> -@@ -27,7 +27,7 @@ user_flags()
> -       printf " -D_GNU_SOURCE"
> -
> -       # Get list of directories searched for header files.
> --      dirs=3D$(echo "" | ${CROSS_COMPILE}cpp -Wp,-v 2>&1 >/dev/null | g=
rep ^" /")
> -+      dirs=3D$(${CPP} -Wp,-v -xc /dev/null 2>&1 >/dev/null | grep ^" /"=
)
> -
> -       # Look for clock_adjtime().
> -       for d in $dirs; do
> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/build-Allow-C=
C-and-prefix-to-be-overriden.patch b/meta-oe/recipes-connectivity/linuxptp/=
linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch
> deleted file mode 100644
> index d4d6fac0ee5c..000000000000
> --- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-p=
refix-to-be-overriden.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 886bca11ff8fcc55386b6e4397b13e64950f93fb Mon Sep 17 00:00:00 2001
> -From: Otavio Salvador <otavio@ossystems.com.br>
> -Date: Tue, 1 Jul 2014 17:37:31 -0300
> -Subject: [PATCH] build: Allow CC and prefix to be overriden
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> -
> ----
> - makefile | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/makefile b/makefile
> -index 3e3b8b3..5c1a1f9 100644
> ---- a/makefile
> -+++ b/makefile
> -@@ -18,7 +18,7 @@
> - KBUILD_OUTPUT ?=3D
> -
> - DEBUG =3D
> --CC    =3D $(CROSS_COMPILE)gcc
> -+CC    ?=3D $(CROSS_COMPILE)gcc
> - VER     =3D -DVER=3D$(version)
> - CFLAGS        =3D -Wall $(VER) $(incdefs) $(DEBUG) $(EXTRA_CFLAGS)
> - LDLIBS        =3D -lm -lrt -pthread $(EXTRA_LDFLAGS)
> -@@ -43,7 +43,7 @@ incdefs :=3D $(shell $(srcdir)/incdefs.sh)
> - version :=3D $(shell $(srcdir)/version.sh $(srcdir))
> - VPATH =3D $(srcdir)
> -
> --prefix        =3D /usr/local
> -+prefix        ?=3D /usr/local
> - sbindir       =3D $(prefix)/sbin
> - mandir        =3D $(prefix)/man
> - man8dir       =3D $(mandir)/man8
> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb b/meta=
-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
> index 95ed76e621e6..d362eaa004a0 100644
> --- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
> @@ -8,8 +8,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
>  LINUXPTP_SRC_URI =3D "http://sourceforge.net/projects/linuxptp"
>
>  SRC_URI =3D "${LINUXPTP_SRC_URI}/files/v4.1/linuxptp-${PV}.tgz \
> -           file://build-Allow-CC-and-prefix-to-be-overriden.patch \
> -           file://Use-cross-cpp-in-incdefs.patch \
>             file://0001-include-string.h-for-strncpy.patch \
>             file://systemd/phc2sys@.service \
>             file://systemd/ptp4l@.service \
> @@ -23,7 +21,8 @@ inherit systemd
>  UPSTREAM_CHECK_URI =3D "${LINUXPTP_SRC_URI}/files/"
>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
>
> -EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} EXTRA_CFLAGS=3D'${CFLAGS}' mandi=
r=3D${mandir}"
> +EXTRA_OEMAKE =3D "CC=3D'${CC}' CROSS_COMPILE=3D'${TARGET_PREFIX}' \
> +    EXTRA_CFLAGS=3D'${CFLAGS}' mandir=3D'${mandir}'"
>
>  export KBUILD_OUTPUT=3D"${RECIPE_SYSROOT}"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105553): https://lists.openembedded.org/g/openembedde=
d-devel/message/105553
> Mute This Topic: https://lists.openembedded.org/mt/102017520/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

