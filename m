Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20383C4167B
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 17:49:30 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.38694.1698947366089117776
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Nov 2023 10:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qj5nkW9+;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1dcfe9cd337so595319fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 10:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698947365; x=1699552165; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzmPBEs8o3TN2iR4ujmk8+R0degdP8fva8hNLnhwiUU=;
        b=Qj5nkW9+aLUW+RWM4UbK/x+3/pAmmTCnn0ECNlDsdQkMLv2xZqzjkjfvXtMP3YNpMY
         Hlp7DM6HZ2OWLQYzNKuKmsUcHy8tmczBLcy3tL97A/1kmQDP/IaU3VOBuWF1aKxGQsiA
         hNyJ6izVixtu0bj39YNuOor0xG8G0FKh1rdktN205zruTwu5qxrckwzoEPda3moB6ZEN
         IlYX5sxJDKvz+td1HXKsBET6zva+LuRg3tQ7Y+g5HrwhsVlpTbd+R2VidrdjuqK43tTV
         xhBOWR5ebasDJbMBo62XS4BU0rCCw7SHfQqI3UyAfhAR+4CISfNVbgJ4ekKqDupkK1jf
         ZHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698947365; x=1699552165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzmPBEs8o3TN2iR4ujmk8+R0degdP8fva8hNLnhwiUU=;
        b=mzqXuR3JsQgga9KeESfQAQ5BU7WF/KI6+K80ArHKVLpSuBSFZ7a8KjTObUNUecFcSI
         rd5s5pB1IZES9N5hbRW7VNO1Yf+vykFWwV/USm5uvQAhzGGJelHL78kUJVZOjW+u96E5
         pexuB6fsgu+hdODRWm6O1D4+AqSZSE1mcg+n6XJkU0QBPd0Ki2BBgH3DJ3gwhcTC7jlQ
         fWFw9KnEGqgCUK/Hs8sxT6YTYCHs5qmRFDq8X0P8djDyAOgUMMF0BY7z+1Lj/PXDPQ8u
         GS/wT0SGD8rPrw0n1ruDeHzU5wLerzzJ38IfLNGw75rTJkkdNl14pIBZ3HqJ5Boz8Ktv
         y/0g==
X-Gm-Message-State: AOJu0YzlwXKw6gOIsCGRpoqSxpVGm2+py+w2nyZDa7JHy+lSbDoL2zaF
	OnyEyzW4VjC4be+9rflZf4Cl6prdJC4ch0c1BB8=
X-Google-Smtp-Source: AGHT+IGPUpwPaCEkAScYsAVIeS+s2kBVg79VYdIoQtk+DBUkVP/txGpJD41fymKOrYHxaGY7EE4KsSRuzzUHPigtbDY=
X-Received: by 2002:a05:6871:530a:b0:1d5:aed5:6579 with SMTP id
 hx10-20020a056871530a00b001d5aed56579mr21716306oac.4.1698947365254; Thu, 02
 Nov 2023 10:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231102172736.221038-1-johnathanx.mantey@intel.com>
In-Reply-To: <20231102172736.221038-1-johnathanx.mantey@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Nov 2023 10:48:59 -0700
Message-ID: <CAMKF1sqafeMMeYfk-eY3gSEUFUL0=XKmSAaJ5Ha9gY68NDFqNQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] Update ipmitool to eliminate unneeded patch
To: Johnathan Mantey <johnathanx.mantey@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 17:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105843

Thanks for the patch, few nits for future reference
The patch is not generated against standalone meta-openembedded repo
so please do so. it makes it easy
for us to appy it. The subject line has a familiar format

recipe: <summary>

Details.

The append is not needed the option can be merged into the options
just above it.

I have made this tweaks and pushed it into staging ( master-next )
please test it out as well on your end

On Thu, Nov 2, 2023 at 10:27=E2=80=AFAM Johnathan Mantey
<johnathanx.mantey@intel.com> wrote:
>
> The upstream ipmitool code has implemented an autoconfig control to
> enable and disable dynamic fetching of the IANA numbers file. As a
> result the patch removing the code that blocks fetching the IANA numbers =
is
> no longer relevant.
>
> The patch being removed explicitlly blocks downloading the IANA
> numbers file. Maintain this behavior at this level by using the
> --disable-registry-download feature.
>
> In order for that autoconfig switch to work, the recipe must inherit
> the pkgconfig feature. Without the pkgconfig dependency the code in
> the configure.ac file causes a compile time error.
>
> Tested:
> IANA numbers file isn't downloaded.
> Manually downloaded IANA file is installed in /usr/share/misc
> Enabling registry download enables dynamic download of IANA numbers
>
> Signed-off-by: Johnathan Mantey <johnathanx.mantey@intel.com>
> ---
>  ...-the-logic-to-download-IANA-PEN-data.patch | 41 -------------------
>  .../ipmitool/ipmitool_1.8.19.bb               |  8 ++--
>  2 files changed, 5 insertions(+), 44 deletions(-)
>  delete mode 100644 meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipm=
itool/0001-configure-Remove-the-logic-to-download-IANA-PEN-data.patch
>
> diff --git a/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool/0=
001-configure-Remove-the-logic-to-download-IANA-PEN-data.patch b/meta-opene=
mbedded/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-configure-Remove-the-=
logic-to-download-IANA-PEN-data.patch
> deleted file mode 100644
> index 442f132718..0000000000
> --- a/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-con=
figure-Remove-the-logic-to-download-IANA-PEN-data.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 63d72f97bd106dd2101cd7fdac6df4f7a053d67c Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 2 Sep 2022 08:27:39 -0700
> -Subject: [PATCH] configure: Remove the logic to download IANA PEN databa=
se
> - during configure
> -
> -OE will do all downloading before it starts to configure therefore this
> -step is moved out into bitbake recipe, so we can make it immutable build
> -
> -Upstream-Status: Inappropriate [OE-Specific]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - configure.ac | 16 +---------------
> - 1 file changed, 1 insertion(+), 15 deletions(-)
> -
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -56,21 +56,7 @@ if test "x$exec_prefix" =3D "xNONE"; then
> -       exec_prefix=3D"$prefix"
> - fi
> -
> --if test "x$WGET" =3D "x"; then
> --      if test "x$CURL" =3D "x"; then
> --              AC_MSG_WARN([** Neither wget nor curl could be found.])
> --              AC_MSG_WARN([** IANA PEN database will not be installed b=
y `make install` !])
> --      else
> --              DOWNLOAD=3D"$CURL --location --progress-bar"
> --              AM_CONDITIONAL([DOWNLOAD], [true])
> --      fi
> --else
> --      DOWNLOAD=3D"$WGET -c -nd -O -"
> --      AM_CONDITIONAL([DOWNLOAD], [true])
> --fi
> --
> --AC_MSG_WARN([** Download is:])
> --AC_MSG_WARN($DOWNLOAD)
> -+AM_CONDITIONAL([DOWNLOAD], [false])
> - AC_SUBST(DOWNLOAD, $DOWNLOAD)
> -
> - dnl
> diff --git a/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1=
.8.19.bb b/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.1=
9.bb
> index ab9074bba5..1c541faf8c 100644
> --- a/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.b=
b
> +++ b/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.b=
b
> @@ -21,10 +21,9 @@ LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9aa91e13d644326bf281924212862=
184"
>
>  DEPENDS =3D "openssl readline ncurses"
> -SRCREV =3D "19d78782d795d0cf4ceefe655f616210c9143e62"
> +SRCREV =3D "ab5ce5baff097ebb6e2a17a171858be213ee68d3"
>  SRC_URI =3D "git://codeberg.org/ipmitool/ipmitool;protocol=3Dhttps;branc=
h=3Dmaster \
>             ${IANA_ENTERPRISE_NUMBERS} \
> -           file://0001-configure-Remove-the-logic-to-download-IANA-PEN-d=
ata.patch \
>             "
>  IANA_ENTERPRISE_NUMBERS ?=3D ""
>
> @@ -34,7 +33,7 @@ IANA_ENTERPRISE_NUMBERS ?=3D ""
>
>  S =3D "${WORKDIR}/git"
>
> -inherit autotools
> +inherit autotools pkgconfig
>
>  do_install:append() {
>          if [ -e ${WORKDIR}/iana-enterprise-numbers ]; then
> @@ -50,5 +49,8 @@ FILES:${PN} +=3D "${datadir}/misc"
>  # --enable-file-security adds some security checks
>  # --disable-intf-free disables FreeIPMI support - we don't want to depen=
d on
>  #   FreeIPMI libraries, FreeIPMI has its own ipmitoool-like utility.
> +# --disable-registry-download prevents the IANA numbers from being fetch=
ed
> +#   at build time, as it is not repeatable.
>  #
>  EXTRA_OECONF =3D "--disable-dependency-tracking --enable-file-security -=
-disable-intf-free"
> +EXTRA_OECONF:append =3D " --disable-registry-download "
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105842): https://lists.openembedded.org/g/openembedde=
d-devel/message/105842
> Mute This Topic: https://lists.openembedded.org/mt/102347757/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

