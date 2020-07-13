Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.11165.1594606039762084859
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R7AiBFkl;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id j10so8866968qtq.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NpU6YHH74xVGiVN5/MkGkvuRQBEAUfTRhus3/WkW7Ss=;
        b=R7AiBFklGhaHNiRKoTPzCETY/1BrJik1LF+ixcrMoWZ3SeD2dg9ltJOintgB+qjbz2
         rxmwK+IXQJmt+U8W8IIMrxX1siBtgtPbUxeWFiOVBLoYB3DSaTl3m0JJgCY1Ml++y6DU
         +ZU7ThEWswY6q4FjU9O1lgRA4JsO/SyEzK/tDKlkJaAKqGxW9JYcrKNEvJl100AG7R/w
         9MzKnCjiZAxhh0QPT4VSyV+8C2q+L8QTx9J99nXhlnXH7oFxn+ChW+0+7zxriQAqWFol
         atiOvgGUGTJA70+dA5fmsKakL1k/2X3A2ZZ8RDoHwrxLNWtz2a3juheP2jetGLuNOe/g
         1GJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NpU6YHH74xVGiVN5/MkGkvuRQBEAUfTRhus3/WkW7Ss=;
        b=lpZk5Yh19L02X8yDlAIXzBuuMrjcI/Lp3pNrbOAHXLKuXzrXRq9CzNaNuh9onj2zAy
         kewChoSW4jyIagSQWAR3QT9EQXgS3I5VR0eofl6f6b2fdvn3dROiTXcsSFxzBAuWdHYf
         DvQB5k/t6/MpJgzus1/pz4cM43RCiV1lCVZ7X8XAEo648oqfynB4h0imh3hyGS+pwrOh
         49J99B5+1pcwLKT2eX1zbZhGhVF9KUuP/TpnRDNMTCPifNtCTzLjmapmQSUkk23K7p4/
         aCfU0buJlI4EpPuiJvCPq4iN5HiY3xjFlC4NPJQY1XUklQQS4YGvWcjzxbHFahmRIB3k
         MEQg==
X-Gm-Message-State: AOAM533cIrg0tSPQfWDu9VJvUUHJAnJXujSFq2Njl7zYywvAnJPuYp5F
	1eeJZ51BZSDbTag43WTIq7uRVCB6sppYyAfYD2A=
X-Google-Smtp-Source: ABdhPJzIeM79U8s4BHzVBBL0lMELBMm1ldgCiFxv3TWwo29nAyrxoFDlfbhz0mlwtskFZDkXWItcLfPxWgi9siuUUns=
X-Received: by 2002:aed:3621:: with SMTP id e30mr82458595qtb.190.1594606038829;
 Sun, 12 Jul 2020 19:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200710142114.10612-1-anibal.limon@linaro.org>
In-Reply-To: <20200710142114.10612-1-anibal.limon@linaro.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 12 Jul 2020 19:06:53 -0700
Message-ID: <CAMKF1sq-+=LrQu+=3CENSU2MS1ynFzUsujfdKJKAbjf5F9Pkrg@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] recipes-graphics: Add opengl-es-cts install in /usr/lib
To: Anibal Limon <anibal.limon@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails to compile
musl - https://errors.yoctoproject.org/Errors/Details/420539/
clang - https://errors.yoctoproject.org/Errors/Details/420544/

On Fri, Jul 10, 2020 at 7:21 AM Anibal Limon <anibal.limon@linaro.org> wro=
te:
>
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Commonly this kind of testing tools are installed in /usr/lib
> like piglit, remove version.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  .../vk-gl-cts/opengl-es-cts_3.2.6.1.bb        | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2=
.6.1.bb
>
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb=
 b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
> new file mode 100644
> index 000000000..226f70027
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
> @@ -0,0 +1,45 @@
> +DESCRIPTION =3D "OpenGL CTS"
> +LICENSE =3D "Apache-2.0"
> +PR =3D "r0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6=
bd57"
> +
> +SRC_URI =3D "\
> +       git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=3Dhttps;tag=
=
=3D${BPN}-${PV};name=3Dvk-gl-cts \
> +       git://github.com/google/amber;protocol=3Dhttps;destsuffix=3Dgit/=
external/amber/src;name=3Damber;branch=3Dmain \
> +       git://github.com/KhronosGroup/glslang.git;protocol=3Dhttps;dests=
uffix=3Dgit/external/glslang/src;name=3Dglslang \
> +       git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=3Dhttps=
;destsuffix=3Dgit/external/spirv-headers/src;name=3Dspirv-headers \
> +       git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=3Dhttps;d=
estsuffix=3Dgit/external/spirv-tools/src;name=3Dspirv-tools \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +SRCREV_FORMAT =3D "vk-gl-cts"
> +SRCREV_amber =3D "d26ee22dd7faab1845a531d410f7ec1db407402a"
> +SRCREV_glslang =3D "c538b5d796fb24dd418fdd650c7f76e56bcc3dd8"
> +SRCREV_spirv-headers =3D "e4322e3be589e1ddd44afb20ea842a977c1319b8"
> +SRCREV_spirv-tools =3D "1eb89172a82b436d8037e8a8c29c80f7e1f7df74"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit pkgconfig cmake
> +
> +DEPENDS +=3D "libpng zlib virtual/libgles2 virtual/egl"
> +
> +EXTRA_OECMAKE_append =3D "-DDEQP_TARGET=3Dsurfaceless"
> +
> +CTSDIR =3D "${libdir}/${BPN}"
> +
> +do_install() {
> +       install -d ${D}/${CTSDIR}
> +
> +       install -m 0755 ${B}/external/openglcts/modules/cts-runner ${D}/=
${CTSDIR}
> +       install -m 0755 ${B}/external/openglcts/modules/glcts ${D}/${CTS=
DIR}
> +       for dir in gl_cts gles2 gles3 gles31 gles32 ; do
> +               cp -r ${B}/external/openglcts/modules/$dir ${D}/${CTSDIR=
}/
> +       done
> +       install -m 0755 ${B}/modules/gles3/deqp-gles3 ${D}/${CTSDIR}
> +
> +       rm -r ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}/*/cmake_install.cmake =
${D}/${CTSDIR}/*/CMakeFiles
> +}
> +
> +FILES_${PN} +=3D "${CTSDIR}"
> --
> 2.27.0
>
>=20
