Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CBBECAAD3
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 15:10:50 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web09.6744.1663427443652909610
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Sep 2022 08:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KzLstbRs;
 spf=pass (domain: gmail.com, ip: 209.85.167.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id o204so9560042oia.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Sep 2022 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=/ViI7eCznkn16v5Ct83cmiDlr5pdDXQCKVjHpUJbzlI=;
        b=KzLstbRsBbBnlTmnTSuEdmH059tiRqoTjiaziHpeJJ0ZV56Ovu2iJ0L6ZZsx1xQ/L+
         WQhns6sVOivDek+15yD0JsBE9vCZUtOgTpPcoDIIIiUA7CTOd0Qm9r/7umYjFzaXqt4V
         G0aMIuOpuQ4Gd5SfWTyWYi/Xw981fwc9jrQ8gwyLvwIBjah9k/UNgTeKJbAcXU7psYqC
         MaDiAVgw3Li+n/G+Ckk5trPIG5/Z2yKZWlvgLYMsx1QgHpGR5AcOW9j0ahg8pgqv76vV
         4mUoLHa4P250sfbYptL2gJ3Tenc3SMuEyIMQlmFvGEFaLB5MZYaY9HMtJzyI4fuFUscu
         7tMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/ViI7eCznkn16v5Ct83cmiDlr5pdDXQCKVjHpUJbzlI=;
        b=YiWV0fvIAJZYDnBKoAcr/j4LRYA1tPOwZVwUtOmjugIh8Rn4wOkNYb1SvsKwkrea0L
         Qn1DAh30MoR2S+ghAp4DYNY1YNJhgvo+C7xPsGV69EWuUyhLAEboZPxHixkQN2JgrRz0
         3w05bOQYtCtLVm4jrjlj6vVGpwW/u6u0lyne88hZQvV6/KmeIHFQhCxhyVEO22bTH7LG
         PFs4FX8x+zSc1DKyDpEoPMIygCHgW8hmnbOBqLejcUwqj3nWG8QEEY+ut/2/VvracmT+
         wkH3BgIQWhUwdoV2a6oHq+mbcrGCqxTfbduoRHuggXRBE9+AIRlZG/HlH0w2oWMQ6WYX
         RKdg==
X-Gm-Message-State: ACgBeo2W/ZUK9ek7B5jMfGBRHyVjpShG5A4GG7b5cZLwqf1TB2Xa7f4i
	RVWzIAW+dL099zA72YtD8jz5OunFFclLoPjvAdw=
X-Google-Smtp-Source: 
 AA6agR7FDror/MI9WS7wuE4R/YwrDthnjCE9ZnMuIOg13gFKGLUG6DAeezynL0SzS9QSLRVSsz4qe6DTf3DyS+6HOWE=
X-Received: by 2002:a05:6808:1988:b0:34f:de19:411c with SMTP id
 bj8-20020a056808198800b0034fde19411cmr8606662oib.262.1663427442811; Sat, 17
 Sep 2022 08:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220916172332.3096-1-Wolfgang.Meyer@gossenmetrawatt.com>
 <CAMKF1sqy-zHmxrA-rRNpq+r8tpFXX=UVT3n=8z2WgO75=jM5jw@mail.gmail.com>
 <aa519a830f7c4dabf6683bece84a2be4afb46166.camel@gossenmetrawatt.com>
 <CAMKF1spZO2CQ7V3_mVZ6p0r0rNgOK360ajVs1-Hx+GK5gkiLtQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spZO2CQ7V3_mVZ6p0r0rNgOK360ajVs1-Hx+GK5gkiLtQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Sep 2022 08:10:16 -0700
Message-ID: 
 <CAMKF1sqKkZD7y2+6fDLsXj0i+dtmGwUYAGmqwOsjcG6_5OjQhg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/4] fbida: Switch to git fetcher
To: "Meyer, Wolfgang" <Wolfgang.Meyer@gossenmetrawatt.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Sep 2022 15:10:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98850

On Sat, Sep 17, 2022 at 7:55 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Sep 17, 2022 at 1:48 AM Meyer, Wolfgang
> <Wolfgang.Meyer@gossenmetrawatt.com> wrote:
> >
> > Am Freitag, dem 16.09.2022 um 12:10 -0700 schrieb Khem Raj:
> > > Can you rebase this series on top of master-next and resend please.
> > >
> >
> > In order to get this right for the future: is this the default
> > procedure when sending patches?
>
> usually patches against master are fine, occasionally there are conflict
> where it make my life easier if I ask submitter to rebase on master-next
> master-next is the integration branch that I use for testing and staging
> submitted patches.

well the problem might be that these patches are somehow getting corrupted
I tried to apply the v2 series and I get

patching file meta-oe/recipes-graphics/fbida/fbida_git.bb (renamed
from meta-oe/recipes-graphics/fbida/fbida_2.14.bb)
patch: **** malformed patch at line 166: 9"

Could you try applying these patches in a test sandbox after
downloading from ml or patchework and see if it working for you ?
https://patchwork.yoctoproject.org/project/oe/patch/20220917084459.17933-1-=
Wolfgang.Meyer@gossenmetrawatt.com/

>
> >
> > > On Fri, Sep 16, 2022 at 10:23 AM Wolfgang Meyer
> > > <wolfgang.meyer@gossenmetrawatt.com> wrote:
> > > > fbida has not seen any versioned releases for five years even
> > > > though
> > > > has not stalled. Update to latest commit that builds with the
> > > > legacy gnumake
> > > > style build system ([2019-01-24] ac9005bf0).
> > > >
> > > > Support for lirc, curl, sane, and cairo-gl has been dropped, the
> > > > corresponding
> > > > packageconfigs and dependencies were removed from the recipe.
> > > > Dependencies to
> > > > libinput and udev have been added.
> > > >
> > > > Signed-off-by: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
> > > > ---
> > > >  .../fbida/{fbida_2.14.bb =3D> fbida_git.bb}     | 38 +++++++------
> > > > ------
> > > >  .../fbida/files/cairo-weak-detect.patch       | 17 ---------
> > > >  2 files changed, 14 insertions(+), 41 deletions(-)
> > > >  rename meta-oe/recipes-graphics/fbida/{fbida_2.14.bb =3D>
> > > > fbida_git.bb} (63%)
> > > >  delete mode 100644 meta-oe/recipes-graphics/fbida/files/cairo-
> > > > weak-detect.patch
> > > >
> > > > diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.14.bb b/meta-
> > > > oe/recipes-graphics/fbida/fbida_git.bb
> > > > similarity index 63%
> > > > rename from meta-oe/recipes-graphics/fbida/fbida_2.14.bb
> > > > rename to meta-oe/recipes-graphics/fbida/fbida_git.bb
> > > > index 3d65399cd..aadaaf57e 100644
> > > > --- a/meta-oe/recipes-graphics/fbida/fbida_2.14.bb
> > > > +++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
> > > > @@ -1,23 +1,25 @@
> > > >  SUMMARY =3D "Framebuffer image and doc viewer tools"
> > > >  DESCRIPTION =3D "The fbida project contains a few applications for
> > > > viewing and editing images, \
> > > > -               with the main focus being photos."
> > > > -HOMEPAGE =3D "http://linux.bytesex.org/fbida/"
> > > > +with the main focus being photos."
> > > > +HOMEPAGE =3D "https://www.kraxel.org/blog/linux/fbida/"
> > > >  AUTHOR =3D "Gerd Hoffmann"
> > > >  SECTION =3D "utils"
> > > >
> > > >  LICENSE =3D "GPL-2.0-only"
> > > >  LIC_FILES_CHKSUM =3D
> > > > "file://COPYING;md5=3De8feb78a32950a909621bbb51f634b39"
> > > >
> > > > -DEPENDS =3D "virtual/libiconv jpeg fontconfig freetype libexif
> > > > libdrm pixman poppler libepoxy cairo"
> > > > +DEPENDS =3D "virtual/libiconv jpeg fontconfig freetype libexif
> > > > libdrm pixman udev libinput poppler libepoxy cairo"
> > > >
> > > > -SRC_URI =3D "
> > > > https://www.kraxel.org/releases/fbida/fbida-${PV}.tar.gz \
> > > > -          file://0001-Avoid-using-host-path.patch \
> > > > -          file://fix-preprocessor.patch \
> > > > -           file://support-jpeg-turbo.patch \
> > > > -           file://cairo-weak-detect.patch \
> > > > -           file://fbida-gcc10.patch \
> > > > -          "
> > > > -SRC_URI[sha256sum] =3D
> > > > "95b7c01556cb6ef9819f358b314ddfeb8a4cbe862b521a3ed62f03d163154438"
> > > > +PV =3D "2.14+git${SRCPV}"
> > > > +SRC_URI =3D "\
> > > > +        git://github.com/kraxel/fbida;protocol=3Dhttps;branch=3Dma=
ster
> > > >       \
> > > > +        file://0001-Avoid-using-host-
> > > > path.patch                         \
> > > > +        file://fix-
> > > > preprocessor.patch                                   \
> > > > +        file://support-jpeg-
> > > > turbo.patch                                 \
> > > > +        file://fbida-
> > > > gcc10.patch                                        \
> > > > +"
> > > > +SRCREV =3D "ac9005bf0bbf50f14dc1b368be5084c8e0510a5d"
> > > > +S =3D "${WORKDIR}/git"
> > > >
> > > >  inherit pkgconfig features_check
> > > >
> > > > @@ -26,18 +28,12 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
> > > >
> > > >  EXTRA_OEMAKE =3D "STRIP=3D 'srcdir=3D${S}' -f ${S}/GNUmakefile"
> > > >
> > > > -PACKAGECONFIG ??=3D "gif png curl"
> > > > -PACKAGECONFIG[curl] =3D ",,curl"
> > > > +PACKAGECONFIG ??=3D "gif png"
> > > >  PACKAGECONFIG[gif] =3D ",,giflib"
> > > >  PACKAGECONFIG[png] =3D ",,libpng"
> > > >  PACKAGECONFIG[tiff] =3D ",,tiff"
> > > >  PACKAGECONFIG[motif] =3D ",,libx11 libxext libxpm libxt openmotif"
> > > >  PACKAGECONFIG[webp] =3D ",,libwebp"
> > > > -PACKAGECONFIG[lirc] =3D ",,lirc"
> > > > -# This can only be enabled when cairo has egl enabled in its
> > > > packageconfig support too
> > > > -PACKAGECONFIG[egl] =3D ",,"
> > > > -
> > > > -EXTRA_OEMAKE +=3D ""${@bb.utils.contains('PACKAGECONFIG', 'egl',
> > > > 'HAVE_CAIRO_GL=3Dyes', 'HAVE_CAIRO_GL=3Dno', d)}""
> > > >
> > > >  CFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-
> > > > DEGL_NO_X11=3D1', d)}"
> > > >
> > > > @@ -48,9 +44,6 @@ do_compile() {
> > > >
> > > >      # Be sure to respect preferences (force to "no")
> > > >      # Also avoid issues when ${BUILD_ARCH} =3D=3D ${HOST_ARCH}
> > > > -    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'curl', d)}" ];
> > > > then
> > > > -        sed -i -e '/^HAVE_LIBCURL/s/:=3D.*$/:=3D no/' ${S}/GNUmake=
file
> > > > -    fi
> > > >      if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'gif', d)}" ];
> > > > then
> > > >          sed -i -e '/^HAVE_LIBGIF/s/:=3D.*$/:=3D no/' ${S}/GNUmakef=
ile
> > > >      fi
> > > > @@ -66,9 +59,6 @@ do_compile() {
> > > >      if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'webp', d)}" ];
> > > > then
> > > >          sed -i -e '/^HAVE_LIBWEBP/s/:=3D.*$/:=3D no/' ${S}/GNUmake=
file
> > > >      fi
> > > > -    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'lirc', d)}" ];
> > > > then
> > > > -        sed -i -e '/^HAVE_LIBLIRC/s/:=3D.*$/:=3D no/' ${S}/GNUmake=
file
> > > > -    fi
> > > >
> > > >      oe_runmake
> > > >  }
> > > > diff --git a/meta-oe/recipes-graphics/fbida/files/cairo-weak-
> > > > detect.patch b/meta-oe/recipes-graphics/fbida/files/cairo-weak-
> > > > detect.patch
> > > > deleted file mode 100644
> > > > index c7c579cc4..000000000
> > > > --- a/meta-oe/recipes-graphics/fbida/files/cairo-weak-detect.patch
> > > > +++ /dev/null
> > > > @@ -1,17 +0,0 @@
> > > > -OE configures cairo to disable EGL support, however fbida expects
> > > > cairo with egl support
> > > > -this patch therefore makes it possible to set HAVE_CAIRO_GL via
> > > > recipe
> > > > -
> > > > -Upstream-Status: Inappropriate [OE-Specific]
> > > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > -
> > > > ---- a/GNUmakefile
> > > > -+++ b/GNUmakefile
> > > > -@@ -67,7 +67,7 @@ define make-config
> > > > - LIB           :=3D $(LIB)
> > > > - RESDIR                :=3D $(call ac_resdir)
> > > > - HAVE_LINUX_FB_H       :=3D $(call ac_header,linux/fb.h)
> > > > --HAVE_CAIRO_GL :=3D $(call ac_pkg_config,cairo-gl)
> > > > -+HAVE_CAIRO_GL ?=3D $(call ac_pkg_config,cairo-gl)
> > > > - HAVE_LIBPCD   :=3D $(call ac_lib,pcd_open,pcd)
> > > > - HAVE_LIBGIF   :=3D $(call ac_lib,DGifOpenFileName,gif)
> > > > - HAVE_LIBWEBP  :=3D $(call ac_pkg_config,libwebp)
> > > > --
> > > > 2.37.3
> > > >
> > > >
> > > > Gossen Metrawatt GmbH
> > > >
> > > > S=C3=BCdwestpark 15
> > > > 90449 N=C3=BCrnberg
> > > > Germany
> > > >
> > > > http://www.gossenmetrawatt.com
> > > > Amtsgericht N=C3=BCrnberg HRB 24 602/USt-IdNr. DE815002769
> > > > Gesch=C3=A4ftsf=C3=BChrer: Marcel Hutka, Matthias Wist
> > > >
> > > > Gossen Metrawatt GmbH is a member of GMC INSTRUMENTS-Group
> > > >
> > > > [
> > > > https://www.gmc-instruments.de/media/mailfooter/mailfooter.jpg]<htt=
p://www.gossenmetrawatt.com
> > > > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#98838):
> > > > https://lists.openembedded.org/g/openembedded-devel/message/98838
> > > > Mute This Topic: https://lists.openembedded.org/mt/93727697/1997914
> > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > Unsubscribe:
> > > > https://lists.openembedded.org/g/openembedded-devel/unsub
> > > > [raj.khem@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >
> >
> > Gossen Metrawatt GmbH
> >
> > S=C3=BCdwestpark 15
> > 90449 N=C3=BCrnberg
> > Germany
> >
> > http://www.gossenmetrawatt.com
> > Amtsgericht N=C3=BCrnberg HRB 24 602/USt-IdNr. DE815002769
> > Gesch=C3=A4ftsf=C3=BChrer: Marcel Hutka, Matthias Wist
> >
> > Gossen Metrawatt GmbH is a member of GMC INSTRUMENTS-Group
> >
> > [https://www.gmc-instruments.de/media/mailfooter/mailfooter.jpg]<http:/=
/www.gossenmetrawatt.com>

