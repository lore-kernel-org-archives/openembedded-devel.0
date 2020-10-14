Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.5278.1602654509242710291
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 22:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GD4M4ZBW;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id y9so1039623qvk.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 22:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tl6a4+i0flRd8cYuyXI0EubwmL3JkgYWREGJGL8xckw=;
        b=GD4M4ZBW8xkevdfeGjs5kp0mRS1S3Gse3oYVtkNxiU+NClTHmfW6ylFerzSCruhotR
         wZiEbd7JFiITpuIa8mfgH80wkEvCZxIdbVCPi2Gkv6eqq2fWcYriJzTHzWWB27+75Xnr
         Tg7Jbj7X87Nr4fRK6p0AhaldozIgehEGvlXTjoofUVz1LaaVe+mdG+Mre41RstJWz5+h
         MB5tvnyusUM2S7ad3d79X72uQ6fXMuX76JX2TgV6ZAG6z7nFL7FmwoAGq1Gm7Ifq44JF
         brhCg6Y/l8c8VmxWMevAhMap2RGyBc0cCkLf3m+fBciCusq3NZFp1weDnQlTr81xvLvw
         q2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tl6a4+i0flRd8cYuyXI0EubwmL3JkgYWREGJGL8xckw=;
        b=oqfEyoPjPww+QRvW6d4D6CU3s9s9ucP9HzAWBa2C7CUgAp4RSz5lyHVHdevRP90t2A
         CIybqLj4tUi0MlNwa0dEHev6WdgUSQLNsTiW2g4Y/rTBXZgS17jF/DtziWV5MS7LhG2g
         QPx4a7X+DXN9t/SOcSgppd60qGHp3IQhTRBell1oQFRUIHOPdpatcQo54kfTOYM0As7Z
         ZENkeTN+WH+2kZMJVOwmY5SODuH1ZEKOs3vuqwYcv9tziWga0m8IpnjwybcYJaM7SbJT
         TL8sNMH60wx6VJunmaeF2ApudyucrHD5h8jmjd7sA9xQENnLZhpdn/AKtok26iBv5F67
         A/qQ==
X-Gm-Message-State: AOAM531zT53S1E1IEOfozqNu5l4PeDBpY3Dj7hyVBdd3+zvNQRoGC/PN
	9SzQRflZIxBWmZ418W77w63E9csKkRoWjoJpAXE=
X-Google-Smtp-Source: ABdhPJyBXVz+NHPUON9aZ4kU0HONjqCW+vbqjMRru7Lt8iNEBS/9OMuj4yTUgYRurF4uf+AYzd92nH5pe8IMiKbfsW4=
X-Received: by 2002:a05:6214:7a1:: with SMTP id v1mr3217579qvz.19.1602654508226;
 Tue, 13 Oct 2020 22:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201014010617.1086948-1-schnitzeltony@gmail.com> <20201014010617.1086948-4-schnitzeltony@gmail.com>
In-Reply-To: <20201014010617.1086948-4-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 13 Oct 2020 22:48:02 -0700
Message-ID: <CAMKF1spCYTg55rSRn39s1q230z86KQu9cvMpP5EpPxQ_OY4qqQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 4/8] wxwidgets: Add what's necessary so that consumers of wxwidgets_git can find it
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 6:06 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> When I created wxwidgets recipe I had no test case for consumers of wxwi=
dgets.
> This changed now and it showed that wxwidgets is building fine but is
> completely useless: It is a collection of libraries that are impossible =
to
> find for other recipes.
>
> To get rid wxwidgets now inherits binconfig: wxwidgets creates wx-config=
 that
> at least cmake relies upon. wx-config content had to be adjusted:
>
> * As is it is a symlink to a useless file: Make it a file with usable co=
ntents
> * To let wx-config report correct libraries a patch was added disabling =
cross
>   magic not working here.
> * Set full sysroot paths for includedir/libdir/bindir so that sstate can=
 adjust
>   them when creating recipe-sysroot for recipes depending on wxwidgets
>

is wx-config wrapping pkg-config? if so then perhaps it would be
better to make pkgconfig work here instead

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...able-cross-magic-it-does-not-work-fo.patch | 35 +++++++++++++++++++
>  .../wxwidgets/wxwidgets_git.bb                | 25 +++++++++++--
>  2 files changed, 58 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx=
-config.in-Disable-cross-magic-it-does-not-work-fo.patch
>
> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx-config=
.in-Disable-cross-magic-it-does-not-work-fo.patch b/meta-oe/recipes-extende=
d/wxwidgets/wxwidgets/0001-wx-config.in-Disable-cross-magic-it-does-not-wor=
k-fo.patch
> new file mode 100644
> index 000000000..b3b9e79c5
> --- /dev/null
> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx-config.in-Dis=
able-cross-magic-it-does-not-work-fo.patch
> @@ -0,0 +1,35 @@
> +From a071243763f4b06fc7e71f541c49cecf380b6f27 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.=
com>
> +Date: Sun, 11 Oct 2020 22:16:55 +0200
> +Subject: [PATCH] wx-config.in: Disable cross magic - it does not work f=
or us
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +E.g 'wx-config --libs' appends a '-Linux' to all libraries (e.g
> +-lwx_gtk3u_xrc-3.1 is reported as -lwx_gtk3u_xrc-3.1-Linux) which is wr=
ong and
> +make projects depending on wxwidgets fail.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + wx-config.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/wx-config.in b/wx-config.in
> +index d132e3182f..d0d162e8a3 100755
> +--- a/wx-config.in
> ++++ b/wx-config.in
> +@@ -396,7 +396,7 @@ get_mask()
> + }
> +
> + # Returns true if this script is for a cross compiled config.
> +-is_cross()  { [ "x@cross_compiling@" =3D "xyes" ]; }
> ++is_cross()  { [ "xno" =3D "xyes" ]; }
> +
> +
> + # Determine the base directories we require.
> +--
> +2.26.2
> +
> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb b/meta-=
oe/recipes-extended/wxwidgets/wxwidgets_git.bb
> index 95a6e8527..555399f74 100644
> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
> @@ -10,7 +10,7 @@ LICENSE =3D "wxWidgets"
>  LIC_FILES_CHKSUM =3D "file://docs/licence.txt;md5=3D981f50a934828620b08=
f44d75db557c6"
>
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt', 'cmake_qt5', 'cmake=
', d)}
> -inherit features_check lib_package
> +inherit features_check lib_package binconfig
>
>  # All toolkit-configs except 'no_gui' require x11 explicitly (see toolk=
it.cmake)
>  REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'no=
_gui', '', 'x11', d)}"
> @@ -21,7 +21,10 @@ DEPENDS +=3D " \
>      tiff \
>  "
>
> -SRC_URI =3D "git://github.com/wxWidgets/wxWidgets.git"
> +SRC_URI =3D " \
> +    git://github.com/wxWidgets/wxWidgets.git \
> +    file://0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.pa=
tch \
> +"
>  PV =3D "3.1.3"
>  SRCREV=3D "8a40d23b27ed1c80b5a2ca9f7e8461df4fbc1a31"
>  S =3D "${WORKDIR}/git"
> @@ -67,6 +70,24 @@ PACKAGECONFIG[opengl] =3D ",,libglu"
>  PACKAGECONFIG[sdl_audio] =3D "-DwxUSE_LIBSDL=3DON,-DwxUSE_LIBSDL=3DOFF,=
libsdl2"
>  PACKAGECONFIG[webkit] =3D "-DwxUSE_WEBVIEW_WEBKIT=3DON,-DwxUSE_WEBVIEW_=
WEBKIT=3DOFF,webkitgtk,,,no_gui"
>
> +do_compile_append() {
> +    # if not at re-compile
> +    if [ -L ${B}/wx-config ]; then
> +        # ${B}/wx-config is a symlink for build and not needed after co=
mpile
> +        # So for our purposes do:
> +        # 1. make a file out of wx-config so that binconfig.bbclass det=
ects it
> +        # 2. make sure we do not move the file used for compiling into =
sysroot
> +        cp --remove-destination `readlink ${B}/wx-config | sed 's:inpla=
ce-::'` ${B}/wx-config
> +    fi
> +    # 3. Set full sysroot paths so sstate can translate them when setti=
ng
> +    #    up wxwidgets's consumer sysroots
> +    sed -i \
> +        -e 's,^includedir=3D.*,includedir=3D"${STAGING_INCDIR}",g' \
> +        -e 's,^libdir=3D.*",libdir=3D"${STAGING_LIBDIR}",g' \
> +        -e 's,^bindir=3D.*",bindir=3D"${STAGING_BINDIR}",g' \
> +        ${B}/wx-config
> +}
> +
>  do_install_append() {
>      # do not ship bindir if empty
>      rmdir --ignore-fail-on-non-empty ${D}${bindir}
> --
> 2.26.2
>
>
>=20
>
