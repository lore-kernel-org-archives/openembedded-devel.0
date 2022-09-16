Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23713ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 19:11:11 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web08.10251.1663355463049819251
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 12:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lUNkB0Jf;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-127d10b4f19so53371456fac.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 12:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=/oFNvnLx8QVo8eVR/P0n4kNbtuGdEohR5ebGWMjPCls=;
        b=lUNkB0JfL7UT5O8k96KTsRzQuPb09z/UuYhI6wI9YYFP/C2q44MOnVrcwD6YTQBO/h
         d10Ba7BhXkYygCyH0bPykK2T8ACnZNZfJ39mrIfkJEEwFyikrBslP8+b+PvR9Er4+/y2
         4STanG3wnT5qUUAYd6kAtzmYz8KnuM4oDX6jma/+RhBjknoQQTj1JZHF4VzY/+zOSgfA
         EE6RdJX1BkN4a8LRtw4d1J89gq7v2qAQcu45hOa2aDqscecUs30jhyxxRDA2ZC/1dsJM
         skJNTk7NoA1D4JikVExBEDnOQHW1C8uvlUeog/hJ5Am4SqGfSLjuDdt4RrcqkHeYgT09
         3aaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/oFNvnLx8QVo8eVR/P0n4kNbtuGdEohR5ebGWMjPCls=;
        b=kCi9cGFGHazkFsLtBj/aUaunw/bqkuu3FkFPP1fj6muiE3eTkg+AJwzm3Hm7fB2mK3
         gC7tyb3YLAE4dSlFtP6A4/x+FLpkjvjBojpGJlRG5tuhEsiRAOtLsaVbkiyoBcO8E+69
         IFLClzSbLNeHgN8EfBLVtde4ztgDSN2xPpzEv/ic1XU+fzOcsgSEWIVkg3bF9YSX9QnD
         CI8EcDYjzMolMLCm4wi3V0G8YzTesg8IloHTDIRoyi8iQG1moWcEzGYHOUI3zHOBsbk8
         qyYpljuHHnkSymuDuXqmRikkGbgHTnY66aL6wqQdPCxpDbSoXHOJ4OXFhs7cRkyVn5B1
         pO9Q==
X-Gm-Message-State: ACgBeo21+EBDJjVyA1NsMmJ7K8yVdFmMSdv/rOq0lCifUz385N2qUj8r
	BFg1s8mgyMSsnfKoKWgcjHbFFVCUBPoOU4v4FS4xnA12rx0=
X-Google-Smtp-Source: 
 AA6agR4fScIeQnKIKhPIUUXKHFNaSN7GCnQbB2Jn1Otvq6PXWfj4cHC/DEAdScY3FxV93gpAkFVof4dPWXqJ85yM6I8=
X-Received: by 2002:a05:6870:f222:b0:10b:7326:18c2 with SMTP id
 t34-20020a056870f22200b0010b732618c2mr9029013oao.55.1663355461220; Fri, 16
 Sep 2022 12:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220916172332.3096-1-Wolfgang.Meyer@gossenmetrawatt.com>
In-Reply-To: <20220916172332.3096-1-Wolfgang.Meyer@gossenmetrawatt.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Sep 2022 12:10:35 -0700
Message-ID: 
 <CAMKF1sqy-zHmxrA-rRNpq+r8tpFXX=UVT3n=8z2WgO75=jM5jw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/4] fbida: Switch to git fetcher
To: Wolfgang Meyer <wolfgang.meyer@gossenmetrawatt.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Sep 2022 19:11:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98842

Can you rebase this series on top of master-next and resend please.

On Fri, Sep 16, 2022 at 10:23 AM Wolfgang Meyer
<wolfgang.meyer@gossenmetrawatt.com> wrote:
>
> fbida has not seen any versioned releases for five years even though
> has not stalled. Update to latest commit that builds with the legacy gnum=
ake
> style build system ([2019-01-24] ac9005bf0).
>
> Support for lirc, curl, sane, and cairo-gl has been dropped, the correspo=
nding
> packageconfigs and dependencies were removed from the recipe. Dependencie=
s to
> libinput and udev have been added.
>
> Signed-off-by: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
> ---
>  .../fbida/{fbida_2.14.bb =3D> fbida_git.bb}     | 38 +++++++------------
>  .../fbida/files/cairo-weak-detect.patch       | 17 ---------
>  2 files changed, 14 insertions(+), 41 deletions(-)
>  rename meta-oe/recipes-graphics/fbida/{fbida_2.14.bb =3D> fbida_git.bb} =
(63%)
>  delete mode 100644 meta-oe/recipes-graphics/fbida/files/cairo-weak-detec=
t.patch
>
> diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.14.bb b/meta-oe/recip=
es-graphics/fbida/fbida_git.bb
> similarity index 63%
> rename from meta-oe/recipes-graphics/fbida/fbida_2.14.bb
> rename to meta-oe/recipes-graphics/fbida/fbida_git.bb
> index 3d65399cd..aadaaf57e 100644
> --- a/meta-oe/recipes-graphics/fbida/fbida_2.14.bb
> +++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
> @@ -1,23 +1,25 @@
>  SUMMARY =3D "Framebuffer image and doc viewer tools"
>  DESCRIPTION =3D "The fbida project contains a few applications for viewi=
ng and editing images, \
> -               with the main focus being photos."
> -HOMEPAGE =3D "http://linux.bytesex.org/fbida/"
> +with the main focus being photos."
> +HOMEPAGE =3D "https://www.kraxel.org/blog/linux/fbida/"
>  AUTHOR =3D "Gerd Hoffmann"
>  SECTION =3D "utils"
>
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De8feb78a32950a909621bbb51f634=
b39"
>
> -DEPENDS =3D "virtual/libiconv jpeg fontconfig freetype libexif libdrm pi=
xman poppler libepoxy cairo"
> +DEPENDS =3D "virtual/libiconv jpeg fontconfig freetype libexif libdrm pi=
xman udev libinput poppler libepoxy cairo"
>
> -SRC_URI =3D "https://www.kraxel.org/releases/fbida/fbida-${PV}.tar.gz \
> -          file://0001-Avoid-using-host-path.patch \
> -          file://fix-preprocessor.patch \
> -           file://support-jpeg-turbo.patch \
> -           file://cairo-weak-detect.patch \
> -           file://fbida-gcc10.patch \
> -          "
> -SRC_URI[sha256sum] =3D "95b7c01556cb6ef9819f358b314ddfeb8a4cbe862b521a3e=
d62f03d163154438"
> +PV =3D "2.14+git${SRCPV}"
> +SRC_URI =3D "\
> +        git://github.com/kraxel/fbida;protocol=3Dhttps;branch=3Dmaster  =
    \
> +        file://0001-Avoid-using-host-path.patch                         =
\
> +        file://fix-preprocessor.patch                                   =
\
> +        file://support-jpeg-turbo.patch                                 =
\
> +        file://fbida-gcc10.patch                                        =
\
> +"
> +SRCREV =3D "ac9005bf0bbf50f14dc1b368be5084c8e0510a5d"
> +S =3D "${WORKDIR}/git"
>
>  inherit pkgconfig features_check
>
> @@ -26,18 +28,12 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
>
>  EXTRA_OEMAKE =3D "STRIP=3D 'srcdir=3D${S}' -f ${S}/GNUmakefile"
>
> -PACKAGECONFIG ??=3D "gif png curl"
> -PACKAGECONFIG[curl] =3D ",,curl"
> +PACKAGECONFIG ??=3D "gif png"
>  PACKAGECONFIG[gif] =3D ",,giflib"
>  PACKAGECONFIG[png] =3D ",,libpng"
>  PACKAGECONFIG[tiff] =3D ",,tiff"
>  PACKAGECONFIG[motif] =3D ",,libx11 libxext libxpm libxt openmotif"
>  PACKAGECONFIG[webp] =3D ",,libwebp"
> -PACKAGECONFIG[lirc] =3D ",,lirc"
> -# This can only be enabled when cairo has egl enabled in its packageconf=
ig support too
> -PACKAGECONFIG[egl] =3D ",,"
> -
> -EXTRA_OEMAKE +=3D ""${@bb.utils.contains('PACKAGECONFIG', 'egl', 'HAVE_C=
AIRO_GL=3Dyes', 'HAVE_CAIRO_GL=3Dno', d)}""
>
>  CFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_N=
O_X11=3D1', d)}"
>
> @@ -48,9 +44,6 @@ do_compile() {
>
>      # Be sure to respect preferences (force to "no")
>      # Also avoid issues when ${BUILD_ARCH} =3D=3D ${HOST_ARCH}
> -    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'curl', d)}" ]; then
> -        sed -i -e '/^HAVE_LIBCURL/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
> -    fi
>      if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'gif', d)}" ]; then
>          sed -i -e '/^HAVE_LIBGIF/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
>      fi
> @@ -66,9 +59,6 @@ do_compile() {
>      if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'webp', d)}" ]; then
>          sed -i -e '/^HAVE_LIBWEBP/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
>      fi
> -    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'lirc', d)}" ]; then
> -        sed -i -e '/^HAVE_LIBLIRC/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
> -    fi
>
>      oe_runmake
>  }
> diff --git a/meta-oe/recipes-graphics/fbida/files/cairo-weak-detect.patch=
 b/meta-oe/recipes-graphics/fbida/files/cairo-weak-detect.patch
> deleted file mode 100644
> index c7c579cc4..000000000
> --- a/meta-oe/recipes-graphics/fbida/files/cairo-weak-detect.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -OE configures cairo to disable EGL support, however fbida expects cairo =
with egl support
> -this patch therefore makes it possible to set HAVE_CAIRO_GL via recipe
> -
> -Upstream-Status: Inappropriate [OE-Specific]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ---- a/GNUmakefile
> -+++ b/GNUmakefile
> -@@ -67,7 +67,7 @@ define make-config
> - LIB           :=3D $(LIB)
> - RESDIR                :=3D $(call ac_resdir)
> - HAVE_LINUX_FB_H       :=3D $(call ac_header,linux/fb.h)
> --HAVE_CAIRO_GL :=3D $(call ac_pkg_config,cairo-gl)
> -+HAVE_CAIRO_GL ?=3D $(call ac_pkg_config,cairo-gl)
> - HAVE_LIBPCD   :=3D $(call ac_lib,pcd_open,pcd)
> - HAVE_LIBGIF   :=3D $(call ac_lib,DGifOpenFileName,gif)
> - HAVE_LIBWEBP  :=3D $(call ac_pkg_config,libwebp)
> --
> 2.37.3
>
>
> Gossen Metrawatt GmbH
>
> S=C3=BCdwestpark 15
> 90449 N=C3=BCrnberg
> Germany
>
> http://www.gossenmetrawatt.com
> Amtsgericht N=C3=BCrnberg HRB 24 602/USt-IdNr. DE815002769
> Gesch=C3=A4ftsf=C3=BChrer: Marcel Hutka, Matthias Wist
>
> Gossen Metrawatt GmbH is a member of GMC INSTRUMENTS-Group
>
> [https://www.gmc-instruments.de/media/mailfooter/mailfooter.jpg]<http://w=
ww.gossenmetrawatt.com>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98838): https://lists.openembedded.org/g/openembedded=
-devel/message/98838
> Mute This Topic: https://lists.openembedded.org/mt/93727697/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

