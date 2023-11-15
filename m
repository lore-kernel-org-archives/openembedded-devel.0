Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F39C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 11:26:09 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.10898.1700047564999167288
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 03:26:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OQ4hkZ8b;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40859c466efso52051085e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 03:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700047563; x=1700652363; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GaqUJtckcIMqD0Q9TVGiwIyw9qXwJtYzAwCfU0hUhrs=;
        b=OQ4hkZ8bxvqdKYGkfFV85A/IJys96SkFN+mRoxpZbYnu9da7OB3wKis1n2GsPGmHCL
         +RjWmlPz98O13klEELbW3q4aFSVy19/lVGDY4FVdP1ZOdEYXOt8YWWB147/8Qxz63KtG
         xRRBYQqtAfGsm2FZaJGxk/EXKbF/Pe4rWPICpBue0waWA+X11vgiKX5hP3BI2kTAoJcN
         kPz5eAqlV6FLG8zXg1N2DgdMt8nYzL5Zg5GWcydkKXHHuZjF61Htj2tQDilPeEjj7u4A
         Pf+RTiGKJi583NG0+SierzZ8vc9RGBQRnc++aC2EouV5150VhKjEvKnIan+KkFZRuEzJ
         4t7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700047563; x=1700652363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaqUJtckcIMqD0Q9TVGiwIyw9qXwJtYzAwCfU0hUhrs=;
        b=ffFgyULTIJNZdBdEzBKAKFrsQLjGQOzbloaPn9aYVqXTY6/oEp2C5g1YJj/aRDoPKC
         AKQIKYJeYR+c2lW63SIjNw00T77do5WBYWPSEgac2qBqMSMqQuFnVB1jbfLA76VNnuPB
         nLX67O0msLGGLcOC2Vi8773waqDXiSxWODblAfpZL8GUopIf9+z/xoanvClxFWE7oQn+
         LIlqrdtcAQ4UE8Wm7L0Nw1iAFj45PVK1nyui5jE41biD23Peuw4jHt5MMLzqhmj10sDa
         hBnqPtAj+meEXiLMMnLTC+qKJ6kvM0pd1jUtiZqBMqh9XW9BGOXxil+UJJP9R8PpSCEt
         JGGA==
X-Gm-Message-State: AOJu0YwaxELMXhPJNpf6scdaz7z7IKqTQ1HGGLIxX2c1uhpyDe1hlz1g
	7z4XW/YTgDmdfxqsJbdLjb0Tl0P859CCqAONzi4=
X-Google-Smtp-Source: AGHT+IF0aPP5uQR246VYJVL+gE5H9VTqHnGaYkEkmiFl5cR8PdZ8lUrESkfnJUgRzuVbTynUSPcZ3PkGYS5tWiViHTo=
X-Received: by 2002:a5d:64a5:0:b0:32f:9696:c3e8 with SMTP id
 m5-20020a5d64a5000000b0032f9696c3e8mr10642808wrp.51.1700047562938; Wed, 15
 Nov 2023 03:26:02 -0800 (PST)
MIME-Version: 1.0
References: <20231109204747.44268-1-brgl@bgdev.pl> <1797BFA10F7BC007.27160@lists.openembedded.org>
In-Reply-To: <1797BFA10F7BC007.27160@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Nov 2023 12:25:51 +0100
Message-ID: <CA+chaQdCf=DfW5tew4M-Uz8w6BCs9bvbDi0TahOr17vNBrUzUw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-gpiod: update to v2.1.3
To: martin.jansa@gmail.com
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000171d21060a2f2b73"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 11:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106753

--000000000000171d21060a2f2b73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> seen in multilib builds but maybe it can be reproduced in regular 32bit
target on 64bit build host

Yes, nodistro build for qemux86 shows the same:
http://errors.yoctoproject.org/Errors/Build/174247/

On Wed, Nov 15, 2023 at 9:48=E2=80=AFAM Martin Jansa via lists.openembedded=
.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> This seems to be mixing native python headers in target build causing
> do_compile_ptest_base failure in some builds (seen in multilib builds but
> maybe it can be reproduced in regular 32bit target on 64bit build host):
>
> building 'tests.gpiosim._ext' extension
> creating /tmp/libgpiod-5k0x8gv3/tests
> creating /tmp/libgpiod-5k0x8gv3/tests/gpiosim
> ccache arm-oemllib32-linux-gnueabi-gcc -mthumb -mfpu=3Dneon
> -mfloat-abi=3Dsoftfp -mcpu=3Dcortex-a9 -mtune=3Dcortex-a9
> -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-secu=
rity
> -Werror=3Dformat-security -Werror=3Dreturn-type -funwind-tables -D_TIME_B=
ITS=3D64
> -D_FILE_OFFSET_BITS=3D64
> --sysroot=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-=
gpiod/2.1.3/lib32-recipe-sysroot
> -DNDEBUG -g -O3 -Wall
> -isystemTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpio=
d/2.1.3/recipe-sysroot-native/usr/include
> -O2 -pipe
> -isystemTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpio=
d/2.1.3/recipe-sysroot-native/usr/include
> -O2 -pipe -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32=
-python3-gpiod/2.1.3/gpiod-2.1.3=3D/usr/src/debug/lib32-python3-gpiod/2.1.3=
-r0
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32=
-python3-gpiod/2.1.3/gpiod-2.1.3=3D/usr/src/debug/lib32-python3-gpiod/2.1.3=
-r0
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32=
-python3-gpiod/2.1.3/gpiod-2.1.3=3D/usr/src/debug/lib32-python3-gpiod/2.1.3=
-r0
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32=
-python3-gpiod/2.1.3/gpiod-2.1.3=3D/usr/src/debug/lib32-python3-gpiod/2.1.3=
-r0
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32=
-python3-gpiod/2.1.3/lib32-recipe-sysroot=3D
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32=
-python3-gpiod/2.1.3/lib32-recipe-sysroot=3D
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32=
-python3-gpiod/2.1.3/recipe-sysroot-native=3D
> -fPIC -D_GNU_SOURCE=3D1 -I../../include -I../../tests/gpiosim
> -ITOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.=
3/recipe-sysroot-native/usr/include/python3.11
> -c tests/gpiosim/ext.c -o /tmp/libgpiod-5k0x8gv3/tests/gpiosim/ext.o -Wal=
l
> -Wextra
> In file included from
> TOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/=
recipe-sysroot-native/usr/include/python3.11/Python.h:38,
>                  from tests/gpiosim/ext.c:5:
> TOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/=
recipe-sysroot-native/usr/include/python3.11/pyport.h:601:2:
> error: #error "LONG_BIT definition appears wrong for platform (bad
> gcc/glibc config?)."
>   601 | #error "LONG_BIT definition appears wrong for platform (bad
> gcc/glibc config?)."
>       |  ^~~~~
>
> On Thu, Nov 9, 2023 at 9:47=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> The python bindings for libgpiod have undergone several significant
>> changes that make them easier to use for users of pip. The libgpiod
>> sources are now vendored with the python3-gpiod as the biggest complaint
>> by far was the fact that if the system doesn't provide the correct
>> version of libgpiod, the python bindings won't build.
>>
>> This is however irrelevant for the meta-python recipe as we use the
>> provided switch to keep linking against the libgpiod provided by
>> meta-openembedded.
>>
>> We have changed the way the tests are built, they are now generated by a
>> separate build script and no longer by setup.py. The package now
>> correctly build with the preferred pep517 method so change the inherited
>> classes.
>>
>> We have also gained control over the gpiod module on pypi (which
>> previously hosted a pure python GPIO library) so the location of the
>> sources has changed.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> ---
>>  ...-gpiod_2.0.1.bb =3D> python3-gpiod_2.1.3.bb} | 25 ++++++++++++------=
-
>>  1 file changed, 16 insertions(+), 9 deletions(-)
>>  rename meta-python/recipes-devtools/python/{python3-gpiod_2.0.1.bb =3D>
>> python3-gpiod_2.1.3.bb} (54%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.0.1.bb
>> b/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
>> similarity index 54%
>> rename from meta-python/recipes-devtools/python/python3-gpiod_2.0.1.bb
>> rename to meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
>> index ea8c18562..ef2f01fd4 100644
>> --- a/meta-python/recipes-devtools/python/python3-gpiod_2.0.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
>> @@ -3,17 +3,18 @@ SUMMARY =3D "Python bindings for libgpiod."
>>  LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
>>  # The actual license files live in the upstream libgpiod from which the
>> pypi
>>  # package is spun out.
>> -LIC_FILES_CHKSUM =3D
>> "file://setup.py;beginline=3D57;endline=3D57;md5=3D120334ed83ec0cb248605=
e775bd13b87"
>> +LIC_FILES_CHKSUM =3D
>> "file://setup.py;beginline=3D237;endline=3D237;md5=3Df5ddb56912b7f20bf94=
aa4d1bdcd3533"
>>
>>  SRC_URI +=3D "file://run-ptest"
>>
>> -SRC_URI[sha256sum] =3D
>> "d5c0f9502e97e7359b9dd601e29f15d668983ce50f5c13323f3302845f790fa6"
>> +SRC_URI[sha256sum] =3D
>> "a33193d6cab79d252329f71666a35a3668e04f1f82bf9b93ee2c9ae852398b20"
>>
>> -inherit setuptools3 ptest pypi
>> +inherit setuptools3-base python_pep517 ptest pypi
>>
>> -PYPI_PACKAGE =3D "libgpiod"
>> -
>> -DEPENDS +=3D "libgpiod"
>> +DEPENDS +=3D " \
>> +    libgpiod \
>> +    python3-setuptools-native \
>> +"
>>  RDEPENDS:${PN} +=3D " \
>>      libgpiod (>=3D 2.0) \
>>      python3-datetime \
>> @@ -24,14 +25,20 @@ RDEPENDS:${PN}-ptest +=3D " \
>>      python3-setuptools \
>>  "
>>
>> -export GPIOD_WITH_TESTS =3D "${@bb.utils.contains("PTEST_ENABLED", "1",
>> "1", "0", d)}"
>> +export LINK_SYSTEM_LIBGPIOD =3D "1"
>> +
>> +do_compile_ptest() {
>> +    ${STAGING_BINDIR_NATIVE}/python3-native/python3 build_tests.py
>> +}
>>
>>  do_install_ptest() {
>>      install -d ${D}${PTEST_PATH}/gpiod-test/gpiosim
>>      install -d ${D}${PTEST_PATH}/gpiod-test/procname
>>      install -m 0644 ${S}/tests/*.py ${D}${PTEST_PATH}/gpiod-test/
>> -    install -m 0644 ${B}/build/lib*/tests/gpiosim/_ext*
>> ${D}${PTEST_PATH}/gpiod-test/gpiosim
>> +    install -m 0644 ${B}/tests/gpiosim/_ext*
>> ${D}${PTEST_PATH}/gpiod-test/gpiosim
>>      install -m 0644 ${S}/tests/gpiosim/*.py
>> ${D}${PTEST_PATH}/gpiod-test/gpiosim
>> -    install -m 0644 ${B}/build/lib*/tests/procname/_ext*
>> ${D}${PTEST_PATH}/gpiod-test/procname
>> +    install -m 0644 ${B}/tests/procname/_ext*
>> ${D}${PTEST_PATH}/gpiod-test/procname
>>      install -m 0644 ${S}/tests/procname/*.py
>> ${D}${PTEST_PATH}/gpiod-test/procname
>>  }
>> +
>> +INSANE_SKIP:${PN}-ptest +=3D "buildpaths"
>> --
>> 2.40.1
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106749):
> https://lists.openembedded.org/g/openembedded-devel/message/106749
> Mute This Topic: https://lists.openembedded.org/mt/102494202/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000171d21060a2f2b73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&gt; seen in multilib builds but maybe it=
 can be reproduced in regular 32bit target on 64bit build host</div><div di=
r=3D"ltr"><br></div><div dir=3D"ltr">Yes, nodistro build for qemux86 shows =
the same:</div><div dir=3D"ltr"><div><a href=3D"http://errors.yoctoproject.=
org/Errors/Build/174247/">http://errors.yoctoproject.org/Errors/Build/17424=
7/</a><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Nov 15, 2023 at 9:48=E2=80=AFAM Martin Jansa via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;mart=
in.jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr">This seems to be mixing native python =
headers in target build causing do_compile_ptest_base failure in some build=
s (seen in multilib builds but maybe it can be reproduced in regular 32bit =
target on 64bit build host):<div><br></div><div>building &#39;tests.gpiosim=
._ext&#39; extension<br>creating /tmp/libgpiod-5k0x8gv3/tests<br>creating /=
tmp/libgpiod-5k0x8gv3/tests/gpiosim<br>ccache arm-oemllib32-linux-gnueabi-g=
cc -mthumb -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mcpu=3Dcortex-a9 -mtune=3Dcor=
tex-a9 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat=
-security -Werror=3Dformat-security -Werror=3Dreturn-type -funwind-tables -=
D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64 --sysroot=3DTOPDIR/BUILD/work/mac=
h-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/lib32-recipe-sysroot -D=
NDEBUG -g -O3 -Wall -isystemTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/=
lib32-python3-gpiod/2.1.3/recipe-sysroot-native/usr/include -O2 -pipe -isys=
temTOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3=
/recipe-sysroot-native/usr/include -O2 -pipe -O2 -pipe -g -feliminate-unuse=
d-debug-types -fcanon-prefix-map -fmacro-prefix-map=3DTOPDIR/BUILD/work/mac=
h-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/gpiod-2.1.3=3D/usr/src/=
debug/lib32-python3-gpiod/2.1.3-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/m=
ach-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/gpiod-2.1.3=3D/usr/sr=
c/debug/lib32-python3-gpiod/2.1.3-r0 -fmacro-prefix-map=3DTOPDIR/BUILD/work=
/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/gpiod-2.1.3=3D/usr/=
src/debug/lib32-python3-gpiod/2.1.3-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/wo=
rk/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/gpiod-2.1.3=3D/us=
r/src/debug/lib32-python3-gpiod/2.1.3-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/=
work/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/lib32-recipe-sy=
sroot=3D -fmacro-prefix-map=3DTOPDIR/BUILD/work/mach-oemllib32-linux-gnueab=
i/lib32-python3-gpiod/2.1.3/lib32-recipe-sysroot=3D -fdebug-prefix-map=3DTO=
PDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpiod/2.1.3/reci=
pe-sysroot-native=3D -fPIC -D_GNU_SOURCE=3D1 -I../../include -I../../tests/=
gpiosim -ITOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpio=
d/2.1.3/recipe-sysroot-native/usr/include/python3.11 -c tests/gpiosim/ext.c=
 -o /tmp/libgpiod-5k0x8gv3/tests/gpiosim/ext.o -Wall -Wextra<br>In file inc=
luded from TOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3-gpi=
od/2.1.3/recipe-sysroot-native/usr/include/python3.11/Python.h:38,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from tests/gpios=
im/ext.c:5:<br>TOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-python3=
-gpiod/2.1.3/recipe-sysroot-native/usr/include/python3.11/pyport.h:601:2: e=
rror: #error &quot;LONG_BIT definition appears wrong for platform (bad gcc/=
glibc config?).&quot;<br>=C2=A0 601 | #error &quot;LONG_BIT definition appe=
ars wrong for platform (bad gcc/glibc config?).&quot;<br>=C2=A0 =C2=A0 =C2=
=A0 | =C2=A0^~~~~<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, Nov 9, 2023 at 9:47=E2=80=AFPM Bartosz G=
olaszewski &lt;<a href=3D"mailto:brgl@bgdev.pl" target=3D"_blank">brgl@bgde=
v.pl</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">From: Bartosz Golaszewski &lt;<a href=3D"mailto:bartosz.golaszewski@lin=
aro.org" target=3D"_blank">bartosz.golaszewski@linaro.org</a>&gt;<br>
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
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#106749): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/106749" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/106749</a><br>
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
</blockquote></div></div>

--000000000000171d21060a2f2b73--

