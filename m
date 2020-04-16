Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.9543.1587052209437971506
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 08:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rvIiGx0R;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id t3so17946151qkg.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2020 08:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kx0Cuvs1zU4SgGb9AFcE2QlhksMBTSqpLwIhILH9xF8=;
        b=rvIiGx0RRf/dE5lbrXNulq9T4jSubo3Kp6YTlaaIhgWyDppuJyuB9w5ABllWM4dYx0
         /J3rg9Jt3jP+EVJ0TNNuFTNzl0MgZrIouqzTgj0p5S/X9pzNOVmloNWNq1/xeo57MMj/
         uoH46/3936I7QJXEfBW8qJGxI/+w1QKoiMtYGkdBjdC4ezv8oWhXwvGG25bPaZw2QrT/
         R0rS8RHm18XHWbmdhtw0xa3I1OcyvekqNZK3niXXm2JSfI5UYQhJYLq9lPNTB3QfLAvU
         QcDrvvLkq9hON0MsHc2CHSfme8lhQJD6mKuZgdoYRPhu9pW73RwFTSLTMDCKK8Ez2GnW
         oDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kx0Cuvs1zU4SgGb9AFcE2QlhksMBTSqpLwIhILH9xF8=;
        b=WFdhEY4RoGjpnVeRS1D1tN/A2H/JA3OoWT9gk4v3d38QVMbj3ouJsatwhlFcWBogp6
         qrRdI6vakyvLiV7VHxr03QANg4KF4ncxjbu2Uh4NPyGf0CAtB6M7xKDpUnSKNlEd1WJq
         9/0BZlf8MG4lySMsZHZ3Xf8wudEp1Iq6auc4gK4jC3UE4z1U9ExWqzTNPdNGmlEY4xUL
         A6ESPAgR0itLSEvggYkaHTiUW4NKzOqclIph9y1IGiWHzvpreZPDYQ0XHFEr3Rt8tljK
         g+6DOo/c4C/t9E8NM5n5Yj2QZCpGiDsC9r1PDndFpevIuikGXB3gRWLM5OqQzlmLrD1G
         Rj7Q==
X-Gm-Message-State: AGi0PublXJY7Y+fyajUtvKoE5dwnXXzKSwOOsBVdxQwca4a5mOPYzLf+
	VzQjQYl5dPeSVGd+a74M2BWWio7JT5cFrtbPkVoz1KXy
X-Google-Smtp-Source: APiQypIYHKXrHN1kd9vItelI06fJ9+VDqe2EPSDvoqhCbRoixzYDxjMj7aMhtcPpusxL0MwQ18mj8Vgs+TOAXBrS1UY=
X-Received: by 2002:a37:7143:: with SMTP id m64mr20368232qkc.215.1587052208303;
 Thu, 16 Apr 2020 08:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200416014636.1738216-1-raj.khem@gmail.com> <CALbNGRQ9n-DQ0GJTShMuGr2kTgKFhC3YtACUetdycySCW8=Lrg@mail.gmail.com>
In-Reply-To: <CALbNGRQ9n-DQ0GJTShMuGr2kTgKFhC3YtACUetdycySCW8=Lrg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 16 Apr 2020 08:49:41 -0700
Message-ID: <CAMKF1sqzfM7Debfdz8yus+r9ZHms3zKDR6rOi70OHYvZo0xN3Q@mail.gmail.com>
Subject: Re: [meta-multimedia][PATCH] vlc: Use pkgconfig to find userland graphics libs
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 11:21 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Thu, Apr 16, 2020 at 3:46 AM Khem Raj <raj.khem@gmail.com> wrote:
> My comments:
>
> * The commit message is a bit misleading. How about: 'vlc: Add
> PACKAGECONFIG for mma/x264/fluidsynth'?
> * ARM_INSTRUCTION_SET =3D "arm" is not mentioned. How about an extra
> patch for that?
>

yes good catch. I should have done that, will send a v2

> Andreas
>
> >
> > Add mmal, x264, fluidsynth as packageconfigs so it can be easily
> > enabled/disabled by users
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  ...packageconfig-to-detect-mmal-support.patch | 61 +++++++++++++++++++
> >  .../recipes-multimedia/vlc/vlc_3.0.9.2.bb     |  9 ++-
> >  2 files changed, 67 insertions(+), 3 deletions(-)
> >  create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use=
-packageconfig-to-detect-mmal-support.patch
> >
> > diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packag=
econfig-to-detect-mmal-support.patch b/meta-multimedia/recipes-multimedia/v=
lc/vlc/0001-Use-packageconfig-to-detect-mmal-support.patch
> > new file mode 100644
> > index 0000000000..424aaa2815
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packageconfig=
-to-detect-mmal-support.patch
> > @@ -0,0 +1,61 @@
> > +From e8716a7755eef93e1033bb913e1eb4faee54658f Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 15 Apr 2020 18:29:26 -0700
> > +Subject: [PATCH] Use packageconfig to detect mmal support
> > +
> > +This needs userland graphics libraries, because distros may install it
> > +in different locations, therefore its best to rely on pkgconf to find
> > +the libs and header locations instead of assuming /opt/vc which might
> > +work on some distros ( like raspbian ) but not everywhere
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + configure.ac | 31 +++++++++++--------------------
> > + 1 file changed, 11 insertions(+), 20 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index d7cf692..f81b99d 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -3427,27 +3427,18 @@ AC_ARG_ENABLE(mmal,
> > +   AS_HELP_STRING([--enable-mmal],
> > +     [Multi-Media Abstraction Layer (MMAL) hardware plugin (default en=
able)]))
> > + if test "${enable_mmal}" !=3D "no"; then
> > +-  VLC_SAVE_FLAGS
> > +-  LDFLAGS=3D"${LDFLAGS} -L/opt/vc/lib -lvchostif"
> > +-  CPPFLAGS=3D"${CPPFLAGS} -isystem /opt/vc/include -isystem /opt/vc/i=
nclude/interface/vcos/pthreads -isystem /opt/vc/include/interface/vmcs_host=
/linux"
> > +-  AC_CHECK_HEADERS(interface/mmal/mmal.h,
> > +-    [ AC_CHECK_LIB(bcm_host, vc_tv_unregister_callback_full, [
> > +-        have_mmal=3D"yes"
> > +-        VLC_ADD_PLUGIN([mmal])
> > +-        VLC_ADD_LDFLAGS([mmal],[ -L/opt/vc/lib ])
> > +-        VLC_ADD_CFLAGS([mmal],[ -isystem /opt/vc/include -isystem /op=
t/vc/include/interface/vcos/pthreads -isystem /opt/vc/include/interface/vmc=
s_host/linux ])
> > +-        VLC_ADD_LIBS([mmal],[ -lbcm_host -lmmal -lmmal_core -lmmal_co=
mponents -lmmal_util -lvchostif ]) ], [
> > +-          AS_IF([test "${enable_mmal}" =3D "yes"],
> > +-            [ AC_MSG_ERROR([Cannot find bcm library...]) ],
> > +-            [ AC_MSG_WARN([Cannot find bcm library...]) ])
> > +-          ],
> > +-        [])
> > +-    ] , [ AS_IF([test "${enable_mmal}" =3D "yes"],
> > +-      [ AC_MSG_ERROR([Cannot find development headers for mmal...]) ]=
,
> > +-      [ AC_MSG_WARN([Cannot find development headers for mmal...]) ])=
 ])
> > +-  VLC_RESTORE_FLAGS
> > ++      PKG_CHECK_MODULES(BCMHOST, [bcm_host], [
> > ++      HAVE_BCMHOST=3Dyes
> > ++      AC_DEFINE(HAVE_BCMHOST, 1, [Define this if you have have userla=
ng graphics installed])
> > ++      VLC_ADD_LIBS([bcmhost],[$BCMHOST_LIBS])
> > ++      VLC_ADD_CFLAGS([bcmhost],[$BCMHOST_CFLAGS])
> > ++      ],:
> > ++      [AC_MSG_WARN([${BCMHOST_PKG_ERRORS}: userland graphics not avai=
lable.])
> > ++      HAVE_BCMHOST=3Dno])
> > ++
> > ++      AC_CHECK_HEADERS(interface/mmal/mmal.h)
> > + fi
> > +-AM_CONDITIONAL([HAVE_MMAL], [test "${have_mmal}" =3D "yes"])
> > ++AM_CONDITIONAL([HAVE_MMAL], [test "${have_bcmhost}" =3D "yes"])
> > +
> > + dnl
> > + dnl evas plugin
> > +--
> > +2.26.1
> > +
> > diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb b/me=
ta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
> > index 556e79c7e6..35fda3f8b0 100644
> > --- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
> > +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
> >
> >  DEPENDS =3D "coreutils-native fribidi libtool libgcrypt libgcrypt-nati=
ve \
> >     dbus libxml2 gnutls \
> > -   tremor faad2 ffmpeg flac fluidsynth alsa-lib \
> > +   tremor faad2 ffmpeg flac alsa-lib \
> >     lua-native lua libidn \
> >     avahi jpeg xz libmodplug mpeg2dec \
> >     libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
> > @@ -22,6 +22,7 @@ SRC_URI =3D "http://download.videolan.org/pub/videola=
n/${BPN}/${PV}/${BP}.tar.xz \
> >             file://0006-make-opencv-configurable.patch \
> >             file://0007-use-vorbisidec.patch \
> >             file://0008-fix-luaL-checkint.patch \
> > +           file://0001-Use-packageconfig-to-detect-mmal-support.patch =
\
> >  "
> >  SRC_URI[sha256sum] =3D "a9bdad293d81cd48516abad8d490d8ab4012964ae541ff=
19e00021e071e47601"
> >
> > @@ -29,7 +30,6 @@ inherit autotools features_check gettext pkgconfig fe=
atures_check mime-xdg
> >
> >  REQUIRED_DISTRO_FEATURES =3D "x11"
> >
> > -ARM_INSTRUCTION_SET =3D "arm"
> >  export BUILDCC =3D "${BUILD_CC}"
> >  EXTRA_OECONF =3D "\
> >      --enable-run-as-root \
> > @@ -51,12 +51,15 @@ EXTRA_OECONF =3D "\
> >  "
> >
> >  PACKAGECONFIG ?=3D " \
> > -    live555 dc1394 dv1394 notify fontconfig freetype dvdread png \
> > +    live555 dc1394 dv1394 notify fontconfig fluidsynth freetype dvdrea=
d png \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> >  "
> >
> >  inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'qmake5_paths', '=
', d)}
> >
> > +PACKAGECONFIG[mmal] =3D "        --enable-omxil --enable-omxil-vout --=
enable-rpi-omxil --enable-mmal,,userland"
> > +PACKAGECONFIG[x264] =3D "--enable-x264,--disable-x264,x264"
> > +PACKAGECONFIG[fluidsynth] =3D ",,fluidsynth"
> >  PACKAGECONFIG[mad] =3D "--enable-mad,--disable-mad,libmad"
> >  PACKAGECONFIG[a52] =3D "--enable-a52,--disable-a52,liba52"
> >  PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jack,jack"
> > --
> > 2.26.1
> >
