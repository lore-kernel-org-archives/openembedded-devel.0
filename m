Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9052DC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:48:08 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.9100.1700038082401155887
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:48:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mq2zsAtk;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-32faea0fa1fso317704f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 00:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700038081; x=1700642881; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9g6IJgd1I3P46xDUC0WEbmEh7lutEaWr/Bi5UAU+xr8=;
        b=mq2zsAtk705YD9Lkvojp3m5eC8SLWc5LlaH0hagHvwDaTHhadACOh6/vqJYbwv+6kL
         NyDjsip6yI5PMDJ6u5dgqsAb87DSb77sKXlFFx22mVknIxHTlrtedNIFCtvWOaG5sBIQ
         weVzmJiZffwu4xqj0VdK+2FhqiHb1x4NmYYEAz69wyv0f9SIY21yjEvgmDtCSErqqmjf
         qI9GzR7EFYEg4rDKXiWD35SnYVS1pNW9ImtkwJBNrjLjoDvZ6+vFk4iMvs/J7/SAbpqL
         A7gZ0Zi60ZAtJVjoxFV1Fp9Z3HBsRGwA+61ZjgE0/3pPWSqUZNLRycsahPifCsMfGFlk
         /PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700038081; x=1700642881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9g6IJgd1I3P46xDUC0WEbmEh7lutEaWr/Bi5UAU+xr8=;
        b=YYvr1uPNqPodEW6rQPhUyajfbsbzpItBlnVr58jWDEi/Aqy4pjY8xrQlYsghcw5LO7
         U+cV2kCi7TLlfbXjDPM2ns7S03ZAaq/k8pltrsRvSUXOursIiZ1/pTK6Y1DYjD23Yz4u
         94EEaJX8N/C64StXBbkydtf1l71nndfJT+SayePMRA7L/ktoqpSWOD5sw/3xEPUnzzbf
         swbPfLVrl6ymXO8gcN4YZn5W3qXxtJs2R7sdOm4zc2ZnD19GqrsQKJOT2aDPOYNDu4nJ
         yWDjmRzRoe30AYpAPIPgocXBYNyEyoLEwVSYF1/OvK8dNbPXGV5vT0UjQD1UG8mjXl6a
         cOSw==
X-Gm-Message-State: AOJu0YyLy7i5Y6IcaV8DCgzHCRRr2ySQCm95kNay7lGOz2O4Vil+aZ5p
	Oc/1YAE+qtReXa1k1zkXKgjDxXY40U+NMkQHVso=
X-Google-Smtp-Source: AGHT+IFFosT5nOnrUHF4QcGC64gwqSjSkvTaqFH6FWOrlzK3CDgpFbSk7yGLNo3NbblXZZA6DhrbPn9QJmiCzymt+f0=
X-Received: by 2002:a5d:6c6d:0:b0:32f:99f4:ebd9 with SMTP id
 r13-20020a5d6c6d000000b0032f99f4ebd9mr3863756wrz.29.1700038080703; Wed, 15
 Nov 2023 00:48:00 -0800 (PST)
MIME-Version: 1.0
References: <20231109204747.44268-1-brgl@bgdev.pl>
In-Reply-To: <20231109204747.44268-1-brgl@bgdev.pl>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Nov 2023 09:47:48 +0100
Message-ID: <CA+chaQeFe0GG3d5zXtUeEaXHda1Zeiq+pRbxZR27wUMKnwGkMw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-gpiod: update to v2.1.3
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e7b12d060a2cf5ba"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 08:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106749

--000000000000e7b12d060a2cf5ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This seems to be mixing native python headers in target build causing
do_compile_ptest_base failure in some builds (seen in multilib builds but
maybe it can be reproduced in regular 32bit target on 64bit build host):

building 'tests.gpiosim._ext' extension
creating /tmp/libgpiod-5k0x8gv3/tests
creating /tmp/libgpiod-5k0x8gv3/tests/gpiosim
ccache arm-oemllib32-linux-gnueabi-gcc -mthumb -mfpu=3Dneon
-mfloat-abi=3Dsoftfp -mcpu=3Dcortex-a9 -mtune=3Dcortex-a9
-fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-securi=
ty
-Werror=3Dformat-security -Werror=3Dreturn-type -funwind-tables -D_TIME_BIT=
S=3D64
-D_FILE_OFFSET_BITS=3D64
--sysroot=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gp=
iod/2.1.3/lib32-recipe-sysroot
-DNDEBUG -g -O3 -Wall
-isystemTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/=
2.1.3/recipe-sysroot-native/usr/include
-O2 -pipe
-isystemTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/=
2.1.3/recipe-sysroot-native/usr/include
-O2 -pipe -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map
-fmacro-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-p=
ython3-gpiod/2.1.3/gpiod-2.1.3=3D/usr/src/debug/lib32-python3-gpiod/2.1.3-r=
0
-fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-p=
ython3-gpiod/2.1.3/gpiod-2.1.3=3D/usr/src/debug/lib32-python3-gpiod/2.1.3-r=
0
-fmacro-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-p=
ython3-gpiod/2.1.3/gpiod-2.1.3=3D/usr/src/debug/lib32-python3-gpiod/2.1.3-r=
0
-fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-p=
ython3-gpiod/2.1.3/gpiod-2.1.3=3D/usr/src/debug/lib32-python3-gpiod/2.1.3-r=
0
-fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-p=
ython3-gpiod/2.1.3/lib32-recipe-sysroot=3D
-fmacro-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-p=
ython3-gpiod/2.1.3/lib32-recipe-sysroot=3D
-fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-p=
ython3-gpiod/2.1.3/recipe-sysroot-native=3D
-fPIC -D_GNU_SOURCE=3D1 -I../../include -I../../tests/gpiosim
-ITOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/=
recipe-sysroot-native/usr/include/python3.11
-c tests/gpiosim/ext.c -o /tmp/libgpiod-5k0x8gv3/tests/gpiosim/ext.o -Wall
-Wextra
In file included from
TOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/re=
cipe-sysroot-native/usr/include/python3.11/Python.h:38,
                 from tests/gpiosim/ext.c:5:
TOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/re=
cipe-sysroot-native/usr/include/python3.11/pyport.h:601:2:
error: #error "LONG_BIT definition appears wrong for platform (bad
gcc/glibc config?)."
  601 | #error "LONG_BIT definition appears wrong for platform (bad
gcc/glibc config?)."
      |  ^~~~~

On Thu, Nov 9, 2023 at 9:47=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The python bindings for libgpiod have undergone several significant
> changes that make them easier to use for users of pip. The libgpiod
> sources are now vendored with the python3-gpiod as the biggest complaint
> by far was the fact that if the system doesn't provide the correct
> version of libgpiod, the python bindings won't build.
>
> This is however irrelevant for the meta-python recipe as we use the
> provided switch to keep linking against the libgpiod provided by
> meta-openembedded.
>
> We have changed the way the tests are built, they are now generated by a
> separate build script and no longer by setup.py. The package now
> correctly build with the preferred pep517 method so change the inherited
> classes.
>
> We have also gained control over the gpiod module on pypi (which
> previously hosted a pure python GPIO library) so the location of the
> sources has changed.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  ...-gpiod_2.0.1.bb =3D> python3-gpiod_2.1.3.bb} | 25 ++++++++++++-------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-gpiod_2.0.1.bb =3D>
> python3-gpiod_2.1.3.bb} (54%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.0.1.bb
> b/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
> similarity index 54%
> rename from meta-python/recipes-devtools/python/python3-gpiod_2.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
> index ea8c18562..ef2f01fd4 100644
> --- a/meta-python/recipes-devtools/python/python3-gpiod_2.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
> @@ -3,17 +3,18 @@ SUMMARY =3D "Python bindings for libgpiod."
>  LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
>  # The actual license files live in the upstream libgpiod from which the
> pypi
>  # package is spun out.
> -LIC_FILES_CHKSUM =3D
> "file://setup.py;beginline=3D57;endline=3D57;md5=3D120334ed83ec0cb248605e=
775bd13b87"
> +LIC_FILES_CHKSUM =3D
> "file://setup.py;beginline=3D237;endline=3D237;md5=3Df5ddb56912b7f20bf94a=
a4d1bdcd3533"
>
>  SRC_URI +=3D "file://run-ptest"
>
> -SRC_URI[sha256sum] =3D
> "d5c0f9502e97e7359b9dd601e29f15d668983ce50f5c13323f3302845f790fa6"
> +SRC_URI[sha256sum] =3D
> "a33193d6cab79d252329f71666a35a3668e04f1f82bf9b93ee2c9ae852398b20"
>
> -inherit setuptools3 ptest pypi
> +inherit setuptools3-base python_pep517 ptest pypi
>
> -PYPI_PACKAGE =3D "libgpiod"
> -
> -DEPENDS +=3D "libgpiod"
> +DEPENDS +=3D " \
> +    libgpiod \
> +    python3-setuptools-native \
> +"
>  RDEPENDS:${PN} +=3D " \
>      libgpiod (>=3D 2.0) \
>      python3-datetime \
> @@ -24,14 +25,20 @@ RDEPENDS:${PN}-ptest +=3D " \
>      python3-setuptools \
>  "
>
> -export GPIOD_WITH_TESTS =3D "${@bb.utils.contains("PTEST_ENABLED", "1",
> "1", "0", d)}"
> +export LINK_SYSTEM_LIBGPIOD =3D "1"
> +
> +do_compile_ptest() {
> +    ${STAGING_BINDIR_NATIVE}/python3-native/python3 build_tests.py
> +}
>
>  do_install_ptest() {
>      install -d ${D}${PTEST_PATH}/gpiod-test/gpiosim
>      install -d ${D}${PTEST_PATH}/gpiod-test/procname
>      install -m 0644 ${S}/tests/*.py ${D}${PTEST_PATH}/gpiod-test/
> -    install -m 0644 ${B}/build/lib*/tests/gpiosim/_ext*
> ${D}${PTEST_PATH}/gpiod-test/gpiosim
> +    install -m 0644 ${B}/tests/gpiosim/_ext*
> ${D}${PTEST_PATH}/gpiod-test/gpiosim
>      install -m 0644 ${S}/tests/gpiosim/*.py
> ${D}${PTEST_PATH}/gpiod-test/gpiosim
> -    install -m 0644 ${B}/build/lib*/tests/procname/_ext*
> ${D}${PTEST_PATH}/gpiod-test/procname
> +    install -m 0644 ${B}/tests/procname/_ext*
> ${D}${PTEST_PATH}/gpiod-test/procname
>      install -m 0644 ${S}/tests/procname/*.py
> ${D}${PTEST_PATH}/gpiod-test/procname
>  }
> +
> +INSANE_SKIP:${PN}-ptest +=3D "buildpaths"
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106520):
> https://lists.openembedded.org/g/openembedded-devel/message/106520
> Mute This Topic: https://lists.openembedded.org/mt/102494202/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e7b12d060a2cf5ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This seems to be mixing native python headers in target bu=
ild causing do_compile_ptest_base failure in some builds (seen in multilib =
builds but maybe it can be reproduced in regular 32bit target on 64bit buil=
d host):<div><br></div><div>building &#39;tests.gpiosim._ext&#39; extension=
<br>creating /tmp/libgpiod-5k0x8gv3/tests<br>creating /tmp/libgpiod-5k0x8gv=
3/tests/gpiosim<br>ccache arm-oemllib32-linux-gnueabi-gcc -mthumb -mfpu=3Dn=
eon -mfloat-abi=3Dsoftfp -mcpu=3Dcortex-a9 -mtune=3Dcortex-a9 -fstack-prote=
ctor-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3D=
format-security -Werror=3Dreturn-type -funwind-tables -D_TIME_BITS=3D64 -D_=
FILE_OFFSET_BITS=3D64 --sysroot=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gn=
ueabi/lib32-python3-gpiod/2.1.3/lib32-recipe-sysroot -DNDEBUG -g -O3 -Wall =
-isystemTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/=
2.1.3/recipe-sysroot-native/usr/include -O2 -pipe -isystemTOPDIR/BUILD/work=
/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -O2 -pipe -g -feliminate-unused-debug-types -fcano=
n-prefix-map -fmacro-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gn=
ueabi/lib32-python3-gpiod/2.1.3/gpiod-2.1.3=3D/usr/src/debug/lib32-python3-=
gpiod/2.1.3-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-=
gnueabi/lib32-python3-gpiod/2.1.3/gpiod-2.1.3=3D/usr/src/debug/lib32-python=
3-gpiod/2.1.3-r0 -fmacro-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linu=
x-gnueabi/lib32-python3-gpiod/2.1.3/gpiod-2.1.3=3D/usr/src/debug/lib32-pyth=
on3-gpiod/2.1.3-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-li=
nux-gnueabi/lib32-python3-gpiod/2.1.3/gpiod-2.1.3=3D/usr/src/debug/lib32-py=
thon3-gpiod/2.1.3-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-=
linux-gnueabi/lib32-python3-gpiod/2.1.3/lib32-recipe-sysroot=3D -fmacro-pre=
fix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpio=
d/2.1.3/lib32-recipe-sysroot=3D -fdebug-prefix-map=3DTOPDIR/BUILD/work/mach=
-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/recipe-sysroot-native=3D=
 -fPIC -D_GNU_SOURCE=3D1 -I../../include -I../../tests/gpiosim -ITOPDIR/BUI=
LD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/recipe-sysro=
ot-native/usr/include/python3.11 -c tests/gpiosim/ext.c -o /tmp/libgpiod-5k=
0x8gv3/tests/gpiosim/ext.o -Wall -Wextra<br>In file included from TOPDIR/BU=
ILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/recipe-sysr=
oot-native/usr/include/python3.11/Python.h:38,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from tests/gpiosim/ext.c:5:<br>TOPDIR=
/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/recipe-s=
ysroot-native/usr/include/python3.11/pyport.h:601:2: error: #error &quot;LO=
NG_BIT definition appears wrong for platform (bad gcc/glibc config?).&quot;=
<br>=C2=A0 601 | #error &quot;LONG_BIT definition appears wrong for platfor=
m (bad gcc/glibc config?).&quot;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0^~~~~<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Nov 9, 2023 at 9:47=E2=80=AFPM Bartosz Golaszewski &lt;<a href=
=3D"mailto:brgl@bgdev.pl">brgl@bgdev.pl</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">From: Bartosz Golaszewski &lt;<a hre=
f=3D"mailto:bartosz.golaszewski@linaro.org" target=3D"_blank">bartosz.golas=
zewski@linaro.org</a>&gt;<br>
<br>
The python bindings for libgpiod have undergone several significant<br>
changes that make them easier to use for users of pip. The libgpiod<br>
sources are now vendored with the python3-gpiod as the biggest complaint<br=
>
by far was the fact that if the system doesn&#39;t provide the correct<br>
version of libgpiod, the python bindings won&#39;t build.<br>
<br>
This is however irrelevant for the meta-python recipe as we use the<br>
provided switch to keep linking against the libgpiod provided by<br>
meta-openembedded.<br>
<br>
We have changed the way the tests are built, they are now generated by a<br=
>
separate build script and no longer by setup.py. The package now<br>
correctly build with the preferred pep517 method so change the inherited<br=
>
classes.<br>
<br>
We have also gained control over the gpiod module on pypi (which<br>
previously hosted a pure python GPIO library) so the location of the<br>
sources has changed.<br>
<br>
Signed-off-by: Bartosz Golaszewski &lt;<a href=3D"mailto:bartosz.golaszewsk=
i@linaro.org" target=3D"_blank">bartosz.golaszewski@linaro.org</a>&gt;<br>
---<br>
=C2=A0...-<a href=3D"http://gpiod_2.0.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">gpiod_2.0.1.bb</a> =3D&gt; <a href=3D"http://python3-gpiod_2.1.3.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-gpiod_2.1.3.bb</a>} | 25 +++++=
+++++++-------<br>
=C2=A01 file changed, 16 insertions(+), 9 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-gpiod_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-gpiod_2.0.1.b=
b</a> =3D&gt; <a href=3D"http://python3-gpiod_2.1.3.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-gpiod_2.1.3.bb</a>} (54%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
gpiod_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-gpiod_2.0.1.bb=
</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-gpiod_=
2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-gpiod_2.1.3.bb</a><b=
r>
similarity index 54%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-g=
piod_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-gpiod_2.0.1.bb<=
/a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-gpi=
od_2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-gpiod_2.1.3.bb</a=
><br>
index ea8c18562..ef2f01fd4 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-gpiod_2=
.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-gpiod_2.0.1.bb</a><br=
>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-gpiod_2=
.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-gpiod_2.1.3.bb</a><br=
>
@@ -3,17 +3,18 @@ SUMMARY =3D &quot;Python bindings for libgpiod.&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-or-later &amp; LGPL-2.1-or-later &amp; CC-B=
Y-SA-4.0&quot;<br>
=C2=A0# The actual license files live in the upstream libgpiod from which t=
he pypi<br>
=C2=A0# package is spun out.<br>
-LIC_FILES_CHKSUM =3D &quot;file://setup.py;beginline=3D57;endline=3D57;md5=
=3D120334ed83ec0cb248605e775bd13b87&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://setup.py;beginline=3D237;endline=3D237;m=
d5=3Df5ddb56912b7f20bf94aa4d1bdcd3533&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://run-ptest&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;d5c0f9502e97e7359b9dd601e29f15d668983ce50f5c1=
3323f3302845f790fa6&quot;<br>
+SRC_URI[sha256sum] =3D &quot;a33193d6cab79d252329f71666a35a3668e04f1f82bf9=
b93ee2c9ae852398b20&quot;<br>
<br>
-inherit setuptools3 ptest pypi<br>
+inherit setuptools3-base python_pep517 ptest pypi<br>
<br>
-PYPI_PACKAGE =3D &quot;libgpiod&quot;<br>
-<br>
-DEPENDS +=3D &quot;libgpiod&quot;<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 libgpiod \<br>
+=C2=A0 =C2=A0 python3-setuptools-native \<br>
+&quot;<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0libgpiod (&gt;=3D 2.0) \<br>
=C2=A0 =C2=A0 =C2=A0python3-datetime \<br>
@@ -24,14 +25,20 @@ RDEPENDS:${PN}-ptest +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-setuptools \<br>
=C2=A0&quot;<br>
<br>
-export GPIOD_WITH_TESTS =3D &quot;${@bb.utils.contains(&quot;PTEST_ENABLED=
&quot;, &quot;1&quot;, &quot;1&quot;, &quot;0&quot;, d)}&quot;<br>
+export LINK_SYSTEM_LIBGPIOD =3D &quot;1&quot;<br>
+<br>
+do_compile_ptest() {<br>
+=C2=A0 =C2=A0 ${STAGING_BINDIR_NATIVE}/python3-native/python3 build_tests.=
py<br>
+}<br>
<br>
=C2=A0do_install_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/gpiod-test/gpiosim<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/gpiod-test/procname<br>
=C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/tests/*.py ${D}${PTEST_PATH}/gpiod=
-test/<br>
-=C2=A0 =C2=A0 install -m 0644 ${B}/build/lib*/tests/gpiosim/_ext* ${D}${PT=
EST_PATH}/gpiod-test/gpiosim<br>
+=C2=A0 =C2=A0 install -m 0644 ${B}/tests/gpiosim/_ext* ${D}${PTEST_PATH}/g=
piod-test/gpiosim<br>
=C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/tests/gpiosim/*.py ${D}${PTEST_PAT=
H}/gpiod-test/gpiosim<br>
-=C2=A0 =C2=A0 install -m 0644 ${B}/build/lib*/tests/procname/_ext* ${D}${P=
TEST_PATH}/gpiod-test/procname<br>
+=C2=A0 =C2=A0 install -m 0644 ${B}/tests/procname/_ext* ${D}${PTEST_PATH}/=
gpiod-test/procname<br>
=C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/tests/procname/*.py ${D}${PTEST_PA=
TH}/gpiod-test/procname<br>
=C2=A0}<br>
+<br>
+INSANE_SKIP:${PN}-ptest +=3D &quot;buildpaths&quot;<br>
-- <br>
2.40.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#106520): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/106520" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/106520</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102494202/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102494202/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e7b12d060a2cf5ba--

