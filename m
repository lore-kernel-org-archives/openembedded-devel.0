Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web10.1647.1587018085733981880
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2020 23:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MgOhWUTv;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id w20so19864607iob.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2020 23:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=smP8Og7WAHh5mMzw1I7AuA8E6rjE9FtMYtvpfUH9iXI=;
        b=MgOhWUTv9vQnkDX/RhQAho9jIf7vFc9+VFBEkJJub9ACN6yasdiUfgqsF3sQRXyhdL
         pAMdv2du5DDcMBRkBvlUL+Ohf5tav/KfYzlGAPJjXCFaA47SArz9t3TRpBkKsc1TfHPm
         mDaa45qzfpV5Diodjqs45vobKrJT0rTS+d1sJPmpBUecXmEbeOegIg1n+lYJfBMYdBhp
         f7q0ubyc/d9WYo7wLTKkPRCY6SpO+xymggLNJg896ilI0bwkVOf82b/ko3TTnYyNnPul
         2WsBemR2eRELCvwJcY/l/3Rq1zysqEQpZN05ItH8fZQopodl6EqfbOBMtPdH4kckv4BD
         TZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=smP8Og7WAHh5mMzw1I7AuA8E6rjE9FtMYtvpfUH9iXI=;
        b=WfTbbdT/R1vcGHunDXMlxWbXApdvaS3dSUUimg0Bx/JoD1oWLCsPbvZpz9eEvxZcRz
         kMo4/cNCkmNf4fmSVcGcuuBuIzOlzn6cAL/CbsuQd1SIQ4pZuVNQvGKe5PaeLUZysNAf
         pVPtH5MhWWoQvte1dadEgUdqZaCQMYxDqm97lzUIQAfitH5n7mDJ9o9rOhc6SOY+rZnc
         tNPVyidnRx4zicnmjri8fXPix1z9sG9vbFjVbMukoYKLXkt/F3giFxgbJQTkO4sC1Rc8
         CQ6UlGdSdG8/SMRmr791JUqGrE/HtPyORFfY7zRnXgFV3H0hgxq163uX5ub6PS8wszym
         C+6w==
X-Gm-Message-State: AGi0PubT4B/VmwU+z8eAI5mGuH6eSTIjCRAseHJ634AwOdhz0jdBHOYb
	Rtw8vLZSqySL+1Uk+caYWuvqy6pIDngrGa1tlag=
X-Google-Smtp-Source: APiQypJfZ42INdhAKaMzb5syNdcajLh1ewu/alhxxOSYUZx9f5Wn18A+oXsSX03m4mptZ9lt6ECn8wNbid6ty/FmTxE=
X-Received: by 2002:a5e:d709:: with SMTP id v9mr20620850iom.195.1587018084852;
 Wed, 15 Apr 2020 23:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200416014636.1738216-1-raj.khem@gmail.com>
In-Reply-To: <20200416014636.1738216-1-raj.khem@gmail.com>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Thu, 16 Apr 2020 08:21:12 +0200
Message-ID: <CALbNGRQ9n-DQ0GJTShMuGr2kTgKFhC3YtACUetdycySCW8=Lrg@mail.gmail.com>
Subject: Re: [meta-multimedia][PATCH] vlc: Use pkgconfig to find userland graphics libs
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 3:46 AM Khem Raj <raj.khem@gmail.com> wrote:
My comments:

* The commit message is a bit misleading. How about: 'vlc: Add
PACKAGECONFIG for mma/x264/fluidsynth'?
* ARM_INSTRUCTION_SET =3D "arm" is not mentioned. How about an extra
patch for that?

Andreas

>
> Add mmal, x264, fluidsynth as packageconfigs so it can be easily
> enabled/disabled by users
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...packageconfig-to-detect-mmal-support.patch | 61 +++++++++++++++++++
>  .../recipes-multimedia/vlc/vlc_3.0.9.2.bb     |  9 ++-
>  2 files changed, 67 insertions(+), 3 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-p=
ackageconfig-to-detect-mmal-support.patch
>
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packagec=
onfig-to-detect-mmal-support.patch b/meta-multimedia/recipes-multimedia/vlc=
/vlc/0001-Use-packageconfig-to-detect-mmal-support.patch
> new file mode 100644
> index 0000000000..424aaa2815
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packageconfig-t=
o-detect-mmal-support.patch
> @@ -0,0 +1,61 @@
> +From e8716a7755eef93e1033bb913e1eb4faee54658f Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 15 Apr 2020 18:29:26 -0700
> +Subject: [PATCH] Use packageconfig to detect mmal support
> +
> +This needs userland graphics libraries, because distros may install it
> +in different locations, therefore its best to rely on pkgconf to find
> +the libs and header locations instead of assuming /opt/vc which might
> +work on some distros ( like raspbian ) but not everywhere
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + configure.ac | 31 +++++++++++--------------------
> + 1 file changed, 11 insertions(+), 20 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index d7cf692..f81b99d 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -3427,27 +3427,18 @@ AC_ARG_ENABLE(mmal,
> +   AS_HELP_STRING([--enable-mmal],
> +     [Multi-Media Abstraction Layer (MMAL) hardware plugin (default enab=
le)]))
> + if test "${enable_mmal}" !=3D "no"; then
> +-  VLC_SAVE_FLAGS
> +-  LDFLAGS=3D"${LDFLAGS} -L/opt/vc/lib -lvchostif"
> +-  CPPFLAGS=3D"${CPPFLAGS} -isystem /opt/vc/include -isystem /opt/vc/inc=
lude/interface/vcos/pthreads -isystem /opt/vc/include/interface/vmcs_host/l=
inux"
> +-  AC_CHECK_HEADERS(interface/mmal/mmal.h,
> +-    [ AC_CHECK_LIB(bcm_host, vc_tv_unregister_callback_full, [
> +-        have_mmal=3D"yes"
> +-        VLC_ADD_PLUGIN([mmal])
> +-        VLC_ADD_LDFLAGS([mmal],[ -L/opt/vc/lib ])
> +-        VLC_ADD_CFLAGS([mmal],[ -isystem /opt/vc/include -isystem /opt/=
vc/include/interface/vcos/pthreads -isystem /opt/vc/include/interface/vmcs_=
host/linux ])
> +-        VLC_ADD_LIBS([mmal],[ -lbcm_host -lmmal -lmmal_core -lmmal_comp=
onents -lmmal_util -lvchostif ]) ], [
> +-          AS_IF([test "${enable_mmal}" =3D "yes"],
> +-            [ AC_MSG_ERROR([Cannot find bcm library...]) ],
> +-            [ AC_MSG_WARN([Cannot find bcm library...]) ])
> +-          ],
> +-        [])
> +-    ] , [ AS_IF([test "${enable_mmal}" =3D "yes"],
> +-      [ AC_MSG_ERROR([Cannot find development headers for mmal...]) ],
> +-      [ AC_MSG_WARN([Cannot find development headers for mmal...]) ]) ]=
)
> +-  VLC_RESTORE_FLAGS
> ++      PKG_CHECK_MODULES(BCMHOST, [bcm_host], [
> ++      HAVE_BCMHOST=3Dyes
> ++      AC_DEFINE(HAVE_BCMHOST, 1, [Define this if you have have userlang=
 graphics installed])
> ++      VLC_ADD_LIBS([bcmhost],[$BCMHOST_LIBS])
> ++      VLC_ADD_CFLAGS([bcmhost],[$BCMHOST_CFLAGS])
> ++      ],:
> ++      [AC_MSG_WARN([${BCMHOST_PKG_ERRORS}: userland graphics not availa=
ble.])
> ++      HAVE_BCMHOST=3Dno])
> ++
> ++      AC_CHECK_HEADERS(interface/mmal/mmal.h)
> + fi
> +-AM_CONDITIONAL([HAVE_MMAL], [test "${have_mmal}" =3D "yes"])
> ++AM_CONDITIONAL([HAVE_MMAL], [test "${have_bcmhost}" =3D "yes"])
> +
> + dnl
> + dnl evas plugin
> +--
> +2.26.1
> +
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb b/meta=
-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
> index 556e79c7e6..35fda3f8b0 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
>
>  DEPENDS =3D "coreutils-native fribidi libtool libgcrypt libgcrypt-native=
 \
>     dbus libxml2 gnutls \
> -   tremor faad2 ffmpeg flac fluidsynth alsa-lib \
> +   tremor faad2 ffmpeg flac alsa-lib \
>     lua-native lua libidn \
>     avahi jpeg xz libmodplug mpeg2dec \
>     libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
> @@ -22,6 +22,7 @@ SRC_URI =3D "http://download.videolan.org/pub/videolan/=
${BPN}/${PV}/${BP}.tar.xz \
>             file://0006-make-opencv-configurable.patch \
>             file://0007-use-vorbisidec.patch \
>             file://0008-fix-luaL-checkint.patch \
> +           file://0001-Use-packageconfig-to-detect-mmal-support.patch \
>  "
>  SRC_URI[sha256sum] =3D "a9bdad293d81cd48516abad8d490d8ab4012964ae541ff19=
e00021e071e47601"
>
> @@ -29,7 +30,6 @@ inherit autotools features_check gettext pkgconfig feat=
ures_check mime-xdg
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -ARM_INSTRUCTION_SET =3D "arm"
>  export BUILDCC =3D "${BUILD_CC}"
>  EXTRA_OECONF =3D "\
>      --enable-run-as-root \
> @@ -51,12 +51,15 @@ EXTRA_OECONF =3D "\
>  "
>
>  PACKAGECONFIG ?=3D " \
> -    live555 dc1394 dv1394 notify fontconfig freetype dvdread png \
> +    live555 dc1394 dv1394 notify fontconfig fluidsynth freetype dvdread =
png \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>  "
>
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'qmake5_paths', '',=
 d)}
>
> +PACKAGECONFIG[mmal] =3D "        --enable-omxil --enable-omxil-vout --en=
able-rpi-omxil --enable-mmal,,userland"
> +PACKAGECONFIG[x264] =3D "--enable-x264,--disable-x264,x264"
> +PACKAGECONFIG[fluidsynth] =3D ",,fluidsynth"
>  PACKAGECONFIG[mad] =3D "--enable-mad,--disable-mad,libmad"
>  PACKAGECONFIG[a52] =3D "--enable-a52,--disable-a52,liba52"
>  PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jack,jack"
> --
> 2.26.1
>
