Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.752.1632425050809561449
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Sep 2021 12:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=UWSDSWe2;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1632425051;
  x=1663961051;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0kewI/Z1aRlS2Vn8HoaeVF9uGlM/di0hJzhZc0UVHh0=;
  b=UWSDSWe2seCuAIDeT2ZC/3Sxav+01KgR+zNScPBQhkWeX8hBT6hL6P6n
   RGGVCnVc+Iu/kXm/aaGhXJegraFb9vka/6GHPHeTbKajeNVKcjcKGWtGf
   KJUPQ/pnYe/l/s6uTxtK9ens3mOdxr3MR6xEWl6eu8rKCJBMd4+5/aYaD
   /S4sHbivdGRRAXVpVKM5F1xr1k6ELTuxm7Tr96pkt8ikMpTTwfiDVXMXw
   DiNWSCWRC1aNVsroS86ciGScLrPgWzTvCB0RN3fQu9Mtt8j2T2HUMoxkM
   95NtR4/IYguhwGzxwPgpNywksWInAqiFMSooZDmmZvrFqoMmxEMY2aShk
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Trevor Woerner <twoerner@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH v2] vk-gl-cts: allow the user to specify the target
Thread-Topic: [oe] [meta-oe][PATCH v2] vk-gl-cts: allow the user to specify
 the target
Thread-Index: AQHXsKyMbai5plgoqEKHflbdtQqZjaux+qsw
Date: Thu, 23 Sep 2021 19:24:07 +0000
Message-ID: <ea5ca6b018214c50826e5a1bef9bd86d@axis.com>
References: <20210923185506.2188-1-twoerner@gmail.com>
In-Reply-To: <20210923185506.2188-1-twoerner@gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Trevor Woerner
> Sent: den 23 september 2021 20:55
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH v2] vk-gl-cts: allow the user to specify th=
e
> target
>=20
> When building opengl-es-cts (for example), instead of hard-coding a
> specific target to build (surfaceless), leave the choice empty by default
> which instructs the package's build system to search the sysroot and try
> to
> determine which target to use (i.e. the "Default" target).
>=20
> Provide overrides (in the form of PACAKGECONFIGs) to allow the user to
> specify a specific target to build (if they don't want the target selecte=
d
> automatically).
>=20
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v2:
> - add logic to try to guess which dependencies (x11/wayland) will be
>   required in the case where the user doesn't set a target explicitly
> - add comments to explain the code, and explain how the newly added
>   PACKAGECONFIGs work
> ---
>  .../vk-gl-cts/khronos-cts.inc                 | 33 +++++++++++++++++--
>  1 file changed, 30 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-
> oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> index f61921473..903f006db 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> @@ -18,9 +18,9 @@ S =3D "${WORKDIR}/git"
>=20
>  inherit pkgconfig cmake features_check
>=20
> -REQUIRED_DISTRO_FEATURES +=3D "opengl"
> +ANY_OF_DISTRO_FEATURES +=3D "opengl wayland"
>=20
> -DEPENDS +=3D "libpng zlib virtual/libgles2 virtual/egl"
> +DEPENDS +=3D "libpng zlib virtual/libgles2"
>=20
>  SRC_URI +=3D "file://0001-Workaround-for-GCC-11-uninit-variable-warnings=
-946.patch;patchdir=3Dexternal/amber/src \
>              file://0001-Include-limits-header-for-numeric_limits.patch;p=
atchdir=3Dexternal/vulkancts \
> @@ -36,7 +36,34 @@ SRC_URI:append:toolchain-clang =3D "\
>  	file://fix-clang-private-operator.patch \
>  "
>=20
> -EXTRA_OECMAKE:append =3D " -DDEQP_TARGET=3Dsurfaceless"
> +# The best thing for the user to do is to not specify any of the followi=
ng
> +# PACKAGECONFIGs (i.e. leave it blank) which tells the project to do its=
 own
> +# probing and build what it thinks is appropriate.
> +# However, if you want, you can specify one of the following PACKAGECONF=
IGs
> +# to override this behaviour.
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[surfaceless] =3D "-DDEQP_TARGET=3Dsurfaceless,,"
> +PACKAGECONFIG[wayland] =3D "-DDEQP_TARGET=3Dwayland,,wayland"
> +PACKAGECONFIG[x11_egl] =3D "-DDEQP_TARGET=3Dx11_egl,,virtual/libx11 virt=
ual/egl"
> +PACKAGECONFIG[x11_glx] =3D "-DDEQP_TARGET=3Dx11_glx,,virtual/libx11"
> +PACKAGECONFIG[x11_egl_glx] =3D "-DDEQP_TARGET=3Dx11_glx,,virtual/libx11 =
virtual/egl"
> +
> +python __anonymous() {
> +    packageconfig =3D (d.getVar("PACKAGECONFIG") or "").split()
> +    if len(packageconfig) > 1:
> +        bb.fatal("only one PACKAGECONFIG of 'surfaceless wayland x11_egl=
 x11_glx x11_egl_glx' can be specified at a time")

If they are mutually exclusive, it is better to use the sixth argument for=
=20
the PACKAGECONFIG varflags, which allows you to specify other incompatible=
=20
varflags. I.e, the above would then become:

PACKAGECONFIG[surfaceless] =3D "-DDEQP_TARGET=3Dsurfaceless,,,,, wayland x1=
1_egl x11_glx x11_egl_glx"
PACKAGECONFIG[wayland] =3D "-DDEQP_TARGET=3Dwayland,, wayland,,, surfaceles=
s x11_egl x11_glx x11_egl_glx"
PACKAGECONFIG[x11_egl] =3D "-DDEQP_TARGET=3Dx11_egl,, virtual/libx11 virtua=
l/egl,,, surfaceless wayland x11_glx x11_egl_glx"
PACKAGECONFIG[x11_glx] =3D "-DDEQP_TARGET=3Dx11_glx,, virtual/libx11,,, sur=
faceless wayland x11_egl x11_egl_glx"
PACKAGECONFIG[x11_egl_glx] =3D "-DDEQP_TARGET=3Dx11_glx,, virtual/libx11 vi=
rtual/egl,,, surfaceless wayland x11_egl x11_glx"

This allows other PACKAGECONFIGs to be added without breaking the logic.

> +
> +    # if the user doesn't specify any PACKAGECONFIG then the cts build s=
ystem
> +    # is going to probe the sysroot to try to figure out what to build
> +    # in this case we try to guess whether the user is building for wayl=
and
> +    # or x11 and add the required dependencies automatically
> +    distrofeatures =3D (d.getVar("DISTRO_FEATURES") or "")
> +    if len(packageconfig) =3D=3D 0:

A better test is:

    if not bb.utils.contains_any("PACKAGECONFIG", [ "surfaceless", "wayland=
", "x11_egl", "x11_glx", "x11_egl_glx" ], True, False, d):

> +        if "wayland" in distrofeatures:
> +            d.appendVar("DEPENDS", " wayland ")
> +        if "x11" in distrofeatures:
> +            d.appendVar("DEPENDS", " virtual/libx11 virtual/egl ")
> +}
>=20
>  CTSDIR =3D "/usr/lib/${BPN}"
>=20
> --
> 2.30.0.rc0

