Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96425C54E5D
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 08:08:08 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.9873.1710835678302453037
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Mar 2024 01:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZlGkfWvR;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d24a727f78so60936091fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 01:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835676; x=1711440476; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C3XxTDue4Y94w3WOMgNfMjYHoTG7TMDUjSDZFFxM4C0=;
        b=ZlGkfWvR+oqocKkpfc4p2xUPYLAVQCT/kGLw4u2YGzaYCgNVEx/6iSdTX0FSOSoU/M
         pVtRzlDtSMxBNGEwM0WXe0lrxDWcX16GrXgUUCexQRfKTRALKRuK997IF0l7Eukx/HSf
         rvjZXx9ihj59yvTQPn1/Ajpy/HRxRXlXSlF1jwXHR24ZlBv2gJf9MmFZaPCGtAEPTiK6
         rVQY5x9FfpUX5+qTTKRK2Yg3SyxRWswYHZH4Dfvg089Mb2ZorDVVDhuBWF7Q48CcCCYR
         7jOLvT/XwLe3fdv0JgG1Loyq1BTDGk36KKiT2/jp839dsYOzTXjWa4FtlvzSboIPtqWB
         UpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835676; x=1711440476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3XxTDue4Y94w3WOMgNfMjYHoTG7TMDUjSDZFFxM4C0=;
        b=eZt5OjhqNuYQ9wlMYy6As/v81ATrj+MtAPoXIYqaQNNv0TWrwx9i8V7nRWeORq67kx
         GPdsYS619S8enzHM+srycJSTkcKdFtpFYHEZAJIGJGya0Gz+fx/zEPqTw1DMfzWA5n+L
         8WWtJGV4c94KdlUurEcjarnnBnXsdwVNVL1MTCVoXhAYFixQ3MlJz+MkRd8mVFl/Wxsl
         JNjml75+yKQ3+lCv6kbsoMpCSFN2To0XhoLW0mdsK86teqvaqkRDbJMxrjauwIQObA2k
         FnqAa5rG1tOQI62LhtBWVnqjvs0o27BGEu8vZerjk4eDx5njaph+IxydCbL9Jp3RgdDp
         0hgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZSH14Zr4EQAjjIsB/wwPDdDtn6Qu/kY7hbHxeNNKKOtaucdr3kslY3Wre1/L9yo5zIlS7VfN/to9qYxMw8t6h3az2QNCuN46fcqZCv/VhkwtYQVMhxFCGPg==
X-Gm-Message-State: AOJu0YyTnVEc3SdZqvtqNrNKVADbcON6WwN8u4Sgvuy7IKtaGqoeBD/L
	z5nCTrGH8gd0SSwVktYDOwIg5aJxZnAHBVu5esYMD8dPOHWAcJTjQVLzwwxJrpoV7i68GgnrotC
	59z5IbzwsDd3i40gugOmhrAe5d3w=
X-Google-Smtp-Source: AGHT+IGZBvjpNw2w2wcyzRpHcQaXws10PSInMz5G/FIPgxDFq46eswdB4yYgnSGJ14ALp8+xAzkNssVfy+wfnbOWjNQ=
X-Received: by 2002:a2e:9019:0:b0:2d2:b068:6d2a with SMTP id
 h25-20020a2e9019000000b002d2b0686d2amr9482689ljg.16.1710835675899; Tue, 19
 Mar 2024 01:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <0afe6e7d5c9f3de0c3b82a646236bb9bbbe8210f.1710445397.git.joerg.sommer@navimatix.de>
 <CAMKF1sqA7eN1pMRKzeSQp8UZKhdADaW5yHLaXZHOd9+-jDaexA@mail.gmail.com>
 <CAMKF1sozBtpLKoYQRribC2+58bcsaDSRC9A6acNVAQuC_9KFjg@mail.gmail.com>
 <AM6PR0102MB36562D01AE5A0C995D43D2D2FC282@AM6PR0102MB3656.eurprd01.prod.exchangelabs.com>
 <17BD2FF4E034D083.32184@lists.openembedded.org>
In-Reply-To: <17BD2FF4E034D083.32184@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 19 Mar 2024 09:07:35 +0100
Message-ID: <CA+chaQdqy_QYo3=f+weqs0ZjXE7bVmfWmSaBeUBUYMoJO=ACWw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH v2] spandsp: new telephony DSP library
To: martin.jansa@gmail.com
Cc: joerg.sommer@navimatix.de, Khem Raj <raj.khem@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bb32c90613fef830"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 08:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109473

--000000000000bb32c90613fef830
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 16, 2024 at 9:02=E2=80=AFAM Martin Jansa via lists.openembedded=
.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> I'm seeing the same errors with gcc :)
>
> libtool: compile:  ccache arm-oe-linux-gnueabi-gcc -mthumb -mfpu=3Dneon
> -mfloat-abi=3Dsoftfp -mcpu=3Dcortex-a9 -mtune=3Dcortex-a9
> -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-secu=
rity
> -Werror=3Dformat-security -Werror=3Dreturn-type -funwind-tables -D_TIME_B=
ITS=3D64
> -D_FILE_OFFSET_BITS=3D64
> --sysroot=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spandsp/3.0.0+g=
it/lib32-recipe-sysroot
> -DHAVE_CONFIG_H -I. -I../../git/src -I.. -DNDEBUG -Wunused-but-set-variab=
le
> -std=3Dgnu99 -ffast-math -Wall -Wunused-variable -Wwrite-strings
> -Wstrict-prototypes -Wmissing-prototypes -fvisibility=3Dhidden
> -DHAVE_VISIBILITY=3D1 -O2 -pipe -g -feliminate-unused-debug-types
> -fcanon-prefix-map
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spands=
p/3.0.0+git/git=3D/usr/src/debug/lib32-spandsp/3.0.0+git
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spands=
p/3.0.0+git/git=3D/usr/src/debug/lib32-spandsp/3.0.0+git
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spands=
p/3.0.0+git/build=3D/usr/src/debug/lib32-spandsp/3.0.0+git
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spands=
p/3.0.0+git/build=3D/usr/src/debug/lib32-spandsp/3.0.0+git
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spands=
p/3.0.0+git/lib32-recipe-sysroot=3D
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spands=
p/3.0.0+git/lib32-recipe-sysroot=3D
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spands=
p/3.0.0+git/recipe-sysroot-native=3D
> -c ../../git/src/t38_terminal.c  -fPIC -DPIC -o .libs/t38_terminal.o
> ../../git/src/ademco_contactid.c:449:110: error: expected ')' before ';'
> token
>   449 | static const int detection_threshold            =3D
> goertzel_threshold_dbm0(GOERTZEL_SAMPLES_PER_BLOCK, -42.0f);
>       |
>                                            ^
> In file included from ../../git/src/ademco_contactid.c:66:
> ../../git/src/spandsp/tone_detect.h:63:55: note: to match this '('
>    63 | #define goertzel_threshold_dbm0(len,thresh)     (int)
> ((len*len*256.0*256.0/2.0*pow(10.0, (thresh - DBM0_MAX_SINE_POWER)/10.0))
>       |                                                       ^
> ../../git/src/ademco_contactid.c:449:51: note: in expansion of macro
> 'goertzel_threshold_dbm0'
>   449 | static const int detection_threshold            =3D
> goertzel_threshold_dbm0(GOERTZEL_SAMPLES_PER_BLOCK, -42.0f);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~
> ../../git/src/ademco_contactid.c:449:18: warning: 'detection_threshold'
> defined but not used [-Wunused-const-variable=3D]
>   449 | static const int detection_threshold            =3D
> goertzel_threshold_dbm0(GOERTZEL_SAMPLES_PER_BLOCK, -42.0f);
>       |                  ^~~~~~~~~~~~~~~~~~~
> ../../git/src/ademco_contactid.c:210:35: warning: 'ademco_codes' defined
> but not used [-Wunused-const-variable=3D]
>   210 | static const struct ademco_code_s ademco_codes[] =3D
>       |                                   ^~~~~~~~~~~~
> make[2]: *** [Makefile:1091: ademco_contactid.lo] Error 1
>
> This is with master-next meta-oe from yesterday in build with multilib
> (night not be important)
>

The failure on gcc was caused by arm build using SPANDSP_USE_FIXED_POINT
and missing ')' in one of the macros, see comments in:
https://github.com/freeswitch/spandsp/commit/5394b2cae6c482ccb835335b769469=
977e6802ae#commitcomment-139934289
and the fix:
https://github.com/freeswitch/spandsp/pull/75

--000000000000bb32c90613fef830
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 16, 2024 at 9:02=E2=80=AF=
AM Martin Jansa via <a href=3D"http://lists.openembedded.org">lists.openemb=
edded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I&#39;m seeing t=
he same errors with gcc :)<div><br></div><div>libtool: compile: =C2=A0ccach=
e arm-oe-linux-gnueabi-gcc -mthumb -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mcpu=
=3Dcortex-a9 -mtune=3Dcortex-a9 -fstack-protector-strong -O2 -D_FORTIFY_SOU=
RCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -Werror=3Dretu=
rn-type -funwind-tables -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64 --sysroo=
t=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spandsp/3.0.0+git/lib32-r=
ecipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I.. -DNDEBUG -Wunused-bu=
t-set-variable -std=3Dgnu99 -ffast-math -Wall -Wunused-variable -Wwrite-str=
ings -Wstrict-prototypes -Wmissing-prototypes -fvisibility=3Dhidden -DHAVE_=
VISIBILITY=3D1 -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-m=
ap -fmacro-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spand=
sp/3.0.0+git/git=3D/usr/src/debug/lib32-spandsp/3.0.0+git -fdebug-prefix-ma=
p=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spandsp/3.0.0+git/git=3D/=
usr/src/debug/lib32-spandsp/3.0.0+git -fmacro-prefix-map=3DTOPDIR/BUILD/wor=
k/mach-oe-linux-gnueabi/lib32-spandsp/3.0.0+git/build=3D/usr/src/debug/lib3=
2-spandsp/3.0.0+git -fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gn=
ueabi/lib32-spandsp/3.0.0+git/build=3D/usr/src/debug/lib32-spandsp/3.0.0+gi=
t -fdebug-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spands=
p/3.0.0+git/lib32-recipe-sysroot=3D -fmacro-prefix-map=3DTOPDIR/BUILD/work/=
mach-oe-linux-gnueabi/lib32-spandsp/3.0.0+git/lib32-recipe-sysroot=3D -fdeb=
ug-prefix-map=3DTOPDIR/BUILD/work/mach-oe-linux-gnueabi/lib32-spandsp/3.0.0=
+git/recipe-sysroot-native=3D -c ../../git/src/t38_terminal.c =C2=A0-fPIC -=
DPIC -o .libs/t38_terminal.o<br>../../git/src/ademco_contactid.c:449:110: e=
rror: expected &#39;)&#39; before &#39;;&#39; token<br>=C2=A0 449 | static =
const int detection_threshold =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
goertzel_threshold_dbm0(GOERTZEL_SAMPLES_PER_BLOCK, -42.0f);<br>=C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>In file included from ../../git/src/ademco_=
contactid.c:66:<br>../../git/src/spandsp/tone_detect.h:63:55: note: to matc=
h this &#39;(&#39;<br>=C2=A0 =C2=A063 | #define goertzel_threshold_dbm0(len=
,thresh) =C2=A0 =C2=A0 (int) ((len*len*256.0*256.0/2.0*pow(10.0, (thresh - =
DBM0_MAX_SINE_POWER)/10.0))<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^<br>../../git/src/ademco_contactid.c:449:51: note: in=
 expansion of macro &#39;goertzel_threshold_dbm0&#39;<br>=C2=A0 449 | stati=
c const int detection_threshold =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D goertzel_threshold_dbm0(GOERTZEL_SAMPLES_PER_BLOCK, -42.0f);<br>=C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~<br>../../=
git/src/ademco_contactid.c:449:18: warning: &#39;detection_threshold&#39; d=
efined but not used [-Wunused-const-variable=3D]<br>=C2=A0 449 | static con=
st int detection_threshold =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D goe=
rtzel_threshold_dbm0(GOERTZEL_SAMPLES_PER_BLOCK, -42.0f);<br>=C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~=
~~~~~~~~~~~~~~~<br>../../git/src/ademco_contactid.c:210:35: warning: &#39;a=
demco_codes&#39; defined but not used [-Wunused-const-variable=3D]<br>=C2=
=A0 210 | static const struct ademco_code_s ademco_codes[] =3D<br>=C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~<br=
>make[2]: *** [Makefile:1091: ademco_contactid.lo] Error 1<br></div><div><b=
r></div><div>This is with master-next meta-oe from yesterday in build with =
multilib (night not be important)</div></div></blockquote><div><br></div><d=
iv>The failure on gcc was caused by arm build using=C2=A0SPANDSP_USE_FIXED_=
POINT and missing &#39;)&#39; in one of the macros, see comments in:</div><=
div><a href=3D"https://github.com/freeswitch/spandsp/commit/5394b2cae6c482c=
cb835335b769469977e6802ae#commitcomment-139934289">https://github.com/frees=
witch/spandsp/commit/5394b2cae6c482ccb835335b769469977e6802ae#commitcomment=
-139934289</a><br></div><div>and the fix:</div><div><a href=3D"https://gith=
ub.com/freeswitch/spandsp/pull/75">https://github.com/freeswitch/spandsp/pu=
ll/75</a></div></div></div>

--000000000000bb32c90613fef830--

