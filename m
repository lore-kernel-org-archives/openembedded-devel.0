Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.3254.1585630683699806248
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2020 21:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H/vEgyUb;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id v7so21782176qkc.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 21:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=td7Pcg2ua0bLsXVxrb2O8mUGx1RBL5Bkz9+/qvIaSpI=;
        b=H/vEgyUb0RsQcWneAaUW8SEpFr8nlQ+JH77XupLrJces5PHl39LCuT4Kp5a29QBET0
         KPSZ7BzTFfRNFAvJZcI2oYsKv4y6RFu3p+HkZ5CXKnATyy87TnZK8jw+AzBX3wg4IRgt
         owrlNGJWoBly9f5EUFP0JSDRU4Wm1QY8N9Jy3N98KrbeVc/1ZiCZLNEowqj+yoZbuVpE
         fYmhsnEwg8IXGo9umXTg6qHoQX9lHszQR39uwIk5IXqK5nAgfTabplqFnEXmq9l6lq6w
         v6iYeu8QoRbUea+Bdo3Seobd3W2vHsoqzRyfcvEVqcN72ZAegduDUsHrp1q0bc/VjD6w
         ciNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=td7Pcg2ua0bLsXVxrb2O8mUGx1RBL5Bkz9+/qvIaSpI=;
        b=DEmZDDWPwE9J/Zn3u+Zye5W/h7pbTxyjCmBqx/AiEIrR0zppaqZgxS2CJbA+e8ZoWI
         V0zmQGEg44qXcuwFuS9SMBXET6aOL0SB6ROQTEaBWU3IKj9n3x3L0C90WXhwxaneWMBE
         FBx/L0kejgpIZcB5Xx0Jb5xVHDNm1N2bn7VPMu/m2fhFPhekD7XoIAKit8vWqgFC/Oux
         HMup0FmJinLdurmnngZfhe1+nG+cGNAJ8ZVA9gkTatFFdfm+TIpt9E0y649ljXhyqFaU
         c8O2dW66X8ZvaICUKsza1KUiS1p/Ya3EgzR8k+Oc5FDqFgohZaAVrjcoFVaFdFz3KYDP
         KfOw==
X-Gm-Message-State: ANhLgQ3M88B7a53c3yskw0gcJJOs/DE5CP0KQ/4JNpFfISJI03KMCSFy
	VWPbaWLEdfdPv5puOD317vGWlUMVUOR04ALUFyE=
X-Google-Smtp-Source: ADFU+vv3DCC4p+MUufUwXLAhrsZ3w6O3msAEjunBOY2jjFU01MHDj9YJh1S0gNPkX2na0/vgZRsyewkopyyfn2Gphbk=
X-Received: by 2002:a05:620a:22b:: with SMTP id u11mr3224627qkm.225.1585630682463;
 Mon, 30 Mar 2020 21:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200330222616.2354-1-schnitzeltony@gmail.com>
In-Reply-To: <20200330222616.2354-1-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 30 Mar 2020 21:57:36 -0700
Message-ID: <CAMKF1sry1VWmFTZEVt_Xj6GsVetGbaYLZd8_x3=J3YTUM9m7og@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/6] wxwidgets: initial add 3.1.3
To: "Andreas M?ller" <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fails on musl

https://errors.yoctoproject.org/Errors/Details/399768/

On Mon, Mar 30, 2020 at 3:26 PM Andreas M?ller <schnitzeltony@gmail.com> w=
rote:
>
> * need it for 0.a.d and audacity
> * did extensive testing with PACKAGECONFIG combinations (exception: mspa=
ck -
>   libmspack is in meta-security)
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-oe/licenses/wxWidgets                    | 54 +++++++++++++
>  .../wxwidgets/wxwidgets_git.bb                | 79 +++++++++++++++++++
>  2 files changed, 133 insertions(+)
>  create mode 100644 meta-oe/licenses/wxWidgets
>  create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
>
> diff --git a/meta-oe/licenses/wxWidgets b/meta-oe/licenses/wxWidgets
> new file mode 100644
> index 000000000..0f6b9d6a8
> --- /dev/null
> +++ b/meta-oe/licenses/wxWidgets
> @@ -0,0 +1,54 @@
> +                wxWindows Library Licence, Version 3.1
> +                =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +  Copyright (c) 1998-2005 Julian Smart, Robert Roebling et al
> +
> +  Everyone is permitted to copy and distribute verbatim copies
> +  of this licence document, but changing it is not allowed.
> +
> +                       WXWINDOWS LIBRARY LICENCE
> +     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
> +
> +  This library is free software; you can redistribute it and/or modify =
it
> +  under the terms of the GNU Library General Public Licence as publishe=
d by
> +  the Free Software Foundation; either version 2 of the Licence, or (at
> +  your option) any later version.
> +
> +  This library is distributed in the hope that it will be useful, but
> +  WITHOUT ANY WARRANTY; without even the implied warranty of
> +  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lib=
rary
> +  General Public Licence for more details.
> +
> +  You should have received a copy of the GNU Library General Public Lic=
ence
> +  along with this software, usually in a file named COPYING.LIB.  If no=
t,
> +  write to the Free Software Foundation, Inc., 51 Franklin Street, Fift=
h Floor,
> +  Boston, MA 02110-1301 USA.
> +
> +  EXCEPTION NOTICE
> +
> +  1. As a special exception, the copyright holders of this library give
> +  permission for additional uses of the text contained in this release =
of
> +  the library as licenced under the wxWindows Library Licence, applying
> +  either version 3.1 of the Licence, or (at your option) any later vers=
ion of
> +  the Licence as published by the copyright holders of version
> +  3.1 of the Licence document.
> +
> +  2. The exception is that you may use, copy, link, modify and distribu=
te
> +  under your own terms, binary object code versions of works based
> +  on the Library.
> +
> +  3. If you copy code from files distributed under the terms of the GNU
> +  General Public Licence or the GNU Library General Public Licence into=
 a
> +  copy of this library, as this licence permits, the exception does not
> +  apply to the code that you add in this way.  To avoid misleading anyo=
ne as
> +  to the status of such modified files, you must delete this exception
> +  notice from such code and/or adjust the licensing conditions notice
> +  accordingly.
> +
> +  4. If you write modifications of your own for this library, it is you=
r
> +  choice whether to permit this exception to apply to your modification=
s.
> +  If you do not wish that, you must delete the exception notice from su=
ch
> +  code and/or adjust the licensing conditions notice accordingly.
> +
> +
> +
> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb b/meta-=
oe/recipes-extended/wxwidgets/wxwidgets_git.bb
> new file mode 100644
> index 000000000..72d56a066
> --- /dev/null
> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
> @@ -0,0 +1,79 @@
> +SUMMARY =3D "Cross-Plattform GUI Library"
> +DESCRIPTIOM =3D "wxWidgets is a free and open source cross-platform C++=
 framework for writing advanced GUI applications using native controls."
> +HOMEPAGE =3D "https://www.wxwidgets.org/"
> +BUGTRACKER =3D "https://trac.wxwidgets.org/"
> +
> +# wxWidgets licence is a modified version of LGPL explicitly allowing n=
ot
> +# distributing the sources of an application using the library even in =
the
> +# case of static linking.
> +LICENSE =3D "wxWidgets"
> +LIC_FILES_CHKSUM =3D "file://docs/licence.txt;md5=3D981f50a934828620b08=
f44d75db557c6"
> +
> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt', 'cmake_qt5', 'cmake=
', d)}
> +inherit features_check lib_package
> +
> +# All toolkit-configs except 'no_gui' require x11 explicitly (see toolk=
it.cmake)
> +REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'no=
_gui', '', 'x11', d)}"
> +
> +DEPENDS +=3D " \
> +    jpeg \
> +    libpng \
> +    tiff \
> +"
> +
> +SRC_URI =3D "git://github.com/wxWidgets/wxWidgets.git"
> +PV =3D "3.1.3"
> +SRCREV=3D "8a40d23b27ed1c80b5a2ca9f7e8461df4fbc1a31"
> +S =3D "${WORKDIR}/git"
> +
> +# These can be either 'builtin' or 'sys' and builtin means cloned soure=
s are
> +# build. So these cannot be PACKAGECONFIGs and let's use libs where we =
can (see
> +# DEPENDS)
> +EXTRA_OECMAKE +=3D " \
> +    -DwxUSE_LIBJPEG=3Dsys \
> +    -DwxUSE_LIBPNG=3Dsys \
> +    -DwxUSE_LIBTIFF=3Dsys \
> +    -DwxUSE_REGEX=3Dbuiltin \
> +"
> +
> +PACKAGECONFIG ?=3D "gtk"
> +
> +# Note on toolkit-PACKAGECONFIGs: select exactly one of 'no_gui' / 'gtk=
' / 'qt'
> +PACKAGECONFIG[no_gui] =3D "-DwxUSE_GUI=3DOFF,,,,,qt gtk"
> +PACKAGECONFIG[gtk] =3D "-DwxBUILD_TOOLKIT=3Dgtk3 -DwxUSE_GUI=3DON,,gtk+=
3,,,no_gui qt"
> +PACKAGECONFIG[qt] =3D "-DwxBUILD_TOOLKIT=3Dqt  -DwxUSE_GUI=3DON,,qtbase=
,,,no_gui gtk"
> +python () {
> +    pkgconfig =3D d.getVar('PACKAGECONFIG')
> +    if (not 'no_gui' in pkgconfig) and (not 'gtk' in pkgconfig) and (no=
t 'qt' in pkgconfig):
> +        bb.error("PACKAGECONFIG must select a toolkit. Add one of no_gu=
i / gtk / qt!")
> +}
> +
> +# Notes on other PACKAGECONFIGs:
> +# * 'no_gui' overrides some configs below so they are marked as conflic=
ting
> +#   with 'no_gui' to avoid surprises
> +# * qt+gstreamer is broken due to incorrect references on glib-2.0 -> m=
ark
> +#   as conflicting
> +# * wxUSE_LIBGNOMEVFS is for gtk2 (see init.cmake) which we don't suppo=
rt
> +#   -> no gvfs PACKAGECONFIG
> +# * libmspack is in meta-security
> +PACKAGECONFIG[gstreamer] =3D "-DwxUSE_MEDIACTRL=3DON,-DwxUSE_MEDIACTRL=
=3DOFF,gstreamer1.0-plugins-base,,,no_gui qt"
> +PACKAGECONFIG[libsecret] =3D "-DwxUSE_SECRETSTORE=3DON,-DwxUSE_SECRETST=
ORE=3DOFF,libsecret,,,no_gui"
> +PACKAGECONFIG[lzma] =3D "-DwxUSE_LIBLZMA=3DON,-DwxUSE_LIBLZMA=3DOFF,xz"
> +PACKAGECONFIG[mspack] =3D "-DwxUSE_LIBMSPACK=3DON,-DwxUSE_LIBMSPACK=3DO=
FF,libmspack"
> +PACKAGECONFIG[sdl_audio] =3D "-DwxUSE_LIBSDL=3DON,-DwxUSE_LIBSDL=3DOFF,=
libsdl2"
> +PACKAGECONFIG[webkit] =3D "-DwxUSE_WEBVIEW_WEBKIT=3DON,-DwxUSE_WEBVIEW_=
WEBKIT=3DOFF,webkitgtk,,,no_gui"
> +
> +do_install_append() {
> +    # do not ship bindir if empty
> +    rmdir --ignore-fail-on-non-empty ${D}${bindir}
> +}
> +
> +# lib names are not canonical
> +FILES_SOLIBSDEV =3D ""
> +
> +FILES_${PN} +=3D " \
> +    ${libdir}/libwx_*.so \
> +    ${libdir}/wx/ \
> +"
> +
> +FILES_${PN}-dev +=3D "${libdir}/wx/include/"
> --
> 2.21.1
>
>=20
