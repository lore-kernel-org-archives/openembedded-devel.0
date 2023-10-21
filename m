Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170ECC001DF
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 00:15:03 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.69444.1697847296965062424
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Oct 2023 17:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j4lPghNz;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-407c3adef8eso11270355e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 17:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697847295; x=1698452095; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oq4wtpnkNP49EJV/xDDbinoUOmNADfm+7Rjt2SiC/6I=;
        b=j4lPghNzPsv81X2zJgOSOwOD/NGU91RqRY4LYBsAHszl96Rf3kozwPqEiG/m0vyema
         4+jc1hQEOBF/034N2uz13ryLdUJUcQFyG5vZ2hMmVfZUqRZSJwRiUu9zN3SPNSVFs9CR
         pUlJRfDhQbUaygb63zB+iFme8vYttq0Cy8oHArLxFdLL4/LKiuguBFmlYhSvBK5NXaT9
         hbUNyGtnNDdR/ghMLcZq4XPNEFU4fdKfHMenVybT1WftK7TMIB6D6lv9ErgbBeuEIV/h
         VN9xi1KHcSRmsWliy6flnGWmn3H4EzsCcroj8uMcCee0NyqduZYhfcVRUXeOZb373amE
         ePaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697847295; x=1698452095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oq4wtpnkNP49EJV/xDDbinoUOmNADfm+7Rjt2SiC/6I=;
        b=bIIHLpC5YEePLEIuhiB6SSD0ECuQJh6qJgUZWO5HDHP9ex56jP34kagee4hSt348NQ
         aIiIJ5lhUYOSvjPd2uJOXdSVplhMi56tnb2voWbP4u9UlCTfQHjUgo8felKnZ7DqcSch
         eR5rAzLw3CNnFmkicPqJ8Tha7wDj02gyvYOLmCtck3a0eHRTnprV8s4p6dUZF8PlLovn
         sMmPZ04Ps6LTSCjGiSN0ZXFNlsl57Skqqqkk/wrz+NQmQajgh2zXCZAdFErg+uuSZWDU
         8pBMls3cyygskx+u5Y2wO4RD+0HkVctfikvyN6OEsQob4bda59Jxh6Aqcu4wkXzxqO7h
         ydAg==
X-Gm-Message-State: AOJu0Yyk8aa7yYHfpckR0LCizNfMZMZBZ0print0LHVZaq3uZ/JMliH5
	fqEYZyq4bhnW6bYu9GLCujtiPvB75ln3J1E8Ccw=
X-Google-Smtp-Source: AGHT+IFQf8ECcKENEyXaIN9KDDdwD/hu1mCl5RClEUVlm5QGPp2pAXDrKPfQRrdQb6had99QE82Xsj1/FT8MmID3ZMQ=
X-Received: by 2002:a5d:6144:0:b0:32d:9d91:6273 with SMTP id
 y4-20020a5d6144000000b0032d9d916273mr2275866wrt.71.1697847295032; Fri, 20 Oct
 2023 17:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231017171702.2964390-1-raj.khem@gmail.com> <178FD1965785F9A4.11247@lists.openembedded.org>
In-Reply-To: <178FD1965785F9A4.11247@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 21 Oct 2023 02:14:38 +0200
Message-ID: <CA+chaQdSx=jxVpQuai+KEvo_LE7vJsBfK1KTaMP7nkH9qFQUzw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] leveldb: Upgrade to 1.23 plus latest git
To: martin.jansa@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e742db06082ee077"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Oct 2023 00:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105624

--000000000000e742db06082ee077
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've sent a fix for the first part with gtest.

The 2nd part is caused by:
https://github.com/google/leveldb/commit/69061b464ab1da287da9b7ffec1ed911b7=
54403b
which is relatively easy to fix in leveldb-tl:
https://github.com/webOS-ports/meta-webos-ports/commit/ada50397377dbdd471ed=
66fbcbfa5dbb8e3546d6
but a bit worse in db8:
https://github.com/webOS-ports/meta-webos-ports/commit/b98d9d358914ecfbd7d9=
857fb7cfb05f6a47c90b
but then 7 other recipes start failing as they are using db8 and use rtti.

Maybe I'm just doing something silly (or too many silly things at the same
time instead of sleep(), lets see tomorrow).

On Fri, Oct 20, 2023 at 2:47=E2=80=AFPM Martin Jansa via lists.openembedded=
.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> On Tue, Oct 17, 2023 at 7:17=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>
>> Switch to git submods as it needs gtest and benchmarks checked out at a
>> particular commit
>>
>
> But it probably shouldn't install gtest files as this now causes conflict=
s
> when leveldb is used in component which itself also depends on gtest e.g.
> leveldb-tl in meta-webosose:
>
> ERROR: lib32-leveldb-tl-0.1.6-r4 do_prepare_recipe_sysroot: The file
> /usr/lib/pkgconfig/gtest.pc is installed by both lib32-googletest and
> lib32-leveldb, aborting
>
> Without gtest enabled in leveldb-tl it fails a bit later:
>  FAILED: mksandwich
> | : &&
> /OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-t=
l/1.0.6+git/recipe-sysroot-native/usr/bin/x86_64-webos-linux/x86_64-webos-l=
inux-g++
> --sysroot=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-lin=
ux/leveldb-tl/1.0.6+git/recipe-sysroot
> -m64 -march=3Dnehalem -mtune=3Dgeneric -mfpmath=3Dsse -msse4.2
>  --sysroot=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-li=
nux/leveldb-tl/1.0.6+git/recipe-sysroot
>  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map
>  -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git=
-r0
>  -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git=
-r0
>  -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+g=
it-r0
>  -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+g=
it-r0
>  -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D
>  -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D
>  -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot-native=3D
>  -fvisibility-inlines-hidden -std=3Dc++14 -Wall -Wextra -Wconversion -Wer=
ror
>  -m64 -march=3Dnehalem -mtune=3Dgeneric -mfpmath=3Dsse -msse4.2
>  --sysroot=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-li=
nux/leveldb-tl/1.0.6+git/recipe-sysroot
>  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map
>  -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git=
-r0
>  -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git=
-r0
>  -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+g=
it-r0
>  -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+g=
it-r0
>  -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D
>  -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D
>  -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot-native=3D
>  -fvisibility-inlines-hidden -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-need=
ed
> -fcanon-prefix-map
>  -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git=
-r0
>  -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git=
-r0
>  -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+g=
it-r0
>  -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+g=
it-r0
>  -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D
>  -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D
>  -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot-native=3D
>  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map
>  -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git=
-r0
>  -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git=
-r0
>  -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+g=
it-r0
>  -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+g=
it-r0
>  -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D
>  -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D
>  -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64=
-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot-native=3D
>  -rdynamic CMakeFiles/mksandwich.dir/mksandwich.cpp.o -o mksandwich
>  lib/libgtest.a  lib/libgtest_main.a  -lleveldb  -lsnappy  lib/libgtest.a
> && :
> |
> /OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-t=
l/1.0.6+git/recipe-sysroot-native/usr/bin/x86_64-webos-linux/../../libexec/=
x86_64-webos-linux/gcc/x86_64-webos-linux/13.2.0/ld:
> CMakeFiles/mksandwich.dir/mksandwich.cpp.o:(.rodata._ZTIN7leveldb10AsIter=
atorINS_10SandwichDBINS_8BottomDBEtE4Part6WalkerEEE[_ZTIN7leveldb10AsIterat=
orINS_10SandwichDBINS_8BottomDBEtE4Part6WalkerEEE]+0x10):
> undefined reference to `typeinfo for leveldb::Iterator'
> | collect2: error: ld returned 1 exit status
>
> Will send a fix after fixing the 2nd issue as well.
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105621):
> https://lists.openembedded.org/g/openembedded-devel/message/105621
> Mute This Topic: https://lists.openembedded.org/mt/102022571/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e742db06082ee077
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve sent a fix for the first part with gtest.<div><br=
></div><div>The 2nd part is caused by:</div><div><a href=3D"https://github.=
com/google/leveldb/commit/69061b464ab1da287da9b7ffec1ed911b754403b">https:/=
/github.com/google/leveldb/commit/69061b464ab1da287da9b7ffec1ed911b754403b<=
/a><br></div><div>which is relatively easy to fix in leveldb-tl:</div><div>=
<a href=3D"https://github.com/webOS-ports/meta-webos-ports/commit/ada503973=
77dbdd471ed66fbcbfa5dbb8e3546d6">https://github.com/webOS-ports/meta-webos-=
ports/commit/ada50397377dbdd471ed66fbcbfa5dbb8e3546d6</a><br></div><div>but=
 a bit worse in db8:</div><div><a href=3D"https://github.com/webOS-ports/me=
ta-webos-ports/commit/b98d9d358914ecfbd7d9857fb7cfb05f6a47c90b">https://git=
hub.com/webOS-ports/meta-webos-ports/commit/b98d9d358914ecfbd7d9857fb7cfb05=
f6a47c90b</a><br></div><div>but then 7 other recipes start failing as they =
are using db8 and use rtti.</div><div><br></div><div>Maybe I&#39;m just doi=
ng something silly (or too many silly things at the same time instead of sl=
eep(), lets see tomorrow).</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 20, 2023 at 2:47=E2=80=AFPM Mar=
tin Jansa via <a href=3D"http://lists.openembedded.org">lists.openembedded.=
org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.o=
rg">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Tu=
e, Oct 17, 2023 at 7:17=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">S=
witch to git submods as it needs gtest and benchmarks checked out at a<br>
particular commit<br></blockquote><div><br></div><div>But it probably shoul=
dn&#39;t install gtest files as this now causes conflicts when leveldb is u=
sed in component which itself also depends on gtest e.g. leveldb-tl in meta=
-webosose:</div><div><br></div><div>ERROR: lib32-leveldb-tl-0.1.6-r4 do_pre=
pare_recipe_sysroot: The file /usr/lib/pkgconfig/gtest.pc is installed by b=
oth lib32-googletest and lib32-leveldb, aborting</div><div><br></div><div>W=
ithout gtest enabled in leveldb-tl it fails a bit later:</div><div>=C2=A0FA=
ILED: mksandwich<br>| : &amp;&amp; /OE/build/luneos-scarthgap/tmp-glibc/wor=
k/corei7-64-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot-native/usr/bin/=
x86_64-webos-linux/x86_64-webos-linux-g++ --sysroot=3D/OE/build/luneos-scar=
thgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-tl/1.0.6+git/recipe-sysr=
oot -m64 -march=3Dnehalem -mtune=3Dgeneric -mfpmath=3Dsse -msse4.2 =C2=A0--=
sysroot=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/l=
eveldb-tl/1.0.6+git/recipe-sysroot =C2=A0-O2 -pipe -g -feliminate-unused-de=
bug-types -fcanon-prefix-map =C2=A0-fmacro-prefix-map=3D/OE/build/luneos-sc=
arthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-tl/1.0.6+git/git=3D/us=
r/src/debug/leveldb-tl/1.0.6+git-r0 =C2=A0-fdebug-prefix-map=3D/OE/build/lu=
neos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-tl/1.0.6+git/gi=
t=3D/usr/src/debug/leveldb-tl/1.0.6+git-r0 =C2=A0-fmacro-prefix-map=3D/OE/b=
uild/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-tl/1.0.6=
+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+git-r0 =C2=A0-fdebug-prefix-ma=
p=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb=
-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+git-r0 =C2=A0-fdebug-=
prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linu=
x/leveldb-tl/1.0.6+git/recipe-sysroot=3D =C2=A0-fmacro-prefix-map=3D/OE/bui=
ld/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-tl/1.0.6+g=
it/recipe-sysroot=3D =C2=A0-fdebug-prefix-map=3D/OE/build/luneos-scarthgap/=
tmp-glibc/work/corei7-64-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot-na=
tive=3D =C2=A0-fvisibility-inlines-hidden -std=3Dc++14 -Wall -Wextra -Wconv=
ersion -Werror =C2=A0-m64 -march=3Dnehalem -mtune=3Dgeneric -mfpmath=3Dsse =
-msse4.2 =C2=A0--sysroot=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7=
-64-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot =C2=A0-O2 -pipe -g -fel=
iminate-unused-debug-types -fcanon-prefix-map =C2=A0-fmacro-prefix-map=3D/O=
E/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-tl/1.=
0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git-r0 =C2=A0-fdebug-prefix-m=
ap=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveld=
b-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git-r0 =C2=A0-fmacro-p=
refix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux=
/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+git-r0 =C2=A0=
-fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-we=
bos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+git-=
r0 =C2=A0-fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/cor=
ei7-64-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D =C2=A0-fmacro-pre=
fix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/l=
eveldb-tl/1.0.6+git/recipe-sysroot=3D =C2=A0-fdebug-prefix-map=3D/OE/build/=
luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-tl/1.0.6+git/=
recipe-sysroot-native=3D =C2=A0-fvisibility-inlines-hidden -Wl,-O1 -Wl,--ha=
sh-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map =C2=A0-fmacro-prefix-map=
=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-=
tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git-r0 =C2=A0-fdebug-pre=
fix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/l=
eveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git-r0 =C2=A0-fma=
cro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-=
linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+git-r0 =
=C2=A0-fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7=
-64-webos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.=
6+git-r0 =C2=A0-fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/wo=
rk/corei7-64-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D =C2=A0-fmac=
ro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-l=
inux/leveldb-tl/1.0.6+git/recipe-sysroot=3D =C2=A0-fdebug-prefix-map=3D/OE/=
build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-tl/1.0.=
6+git/recipe-sysroot-native=3D =C2=A0-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--a=
s-needed -fcanon-prefix-map =C2=A0-fmacro-prefix-map=3D/OE/build/luneos-sca=
rthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-tl/1.0.6+git/git=3D/usr=
/src/debug/leveldb-tl/1.0.6+git-r0 =C2=A0-fdebug-prefix-map=3D/OE/build/lun=
eos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-tl/1.0.6+git/git=
=3D/usr/src/debug/leveldb-tl/1.0.6+git-r0 =C2=A0-fmacro-prefix-map=3D/OE/bu=
ild/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-tl/1.0.6+=
git/build=3D/usr/src/debug/leveldb-tl/1.0.6+git-r0 =C2=A0-fdebug-prefix-map=
=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-=
tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+git-r0 =C2=A0-fdebug-p=
refix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux=
/leveldb-tl/1.0.6+git/recipe-sysroot=3D =C2=A0-fmacro-prefix-map=3D/OE/buil=
d/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-tl/1.0.6+gi=
t/recipe-sysroot=3D =C2=A0-fdebug-prefix-map=3D/OE/build/luneos-scarthgap/t=
mp-glibc/work/corei7-64-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot-nat=
ive=3D =C2=A0-rdynamic CMakeFiles/mksandwich.dir/mksandwich.cpp.o -o mksand=
wich =C2=A0lib/libgtest.a =C2=A0lib/libgtest_main.a =C2=A0-lleveldb =C2=A0-=
lsnappy =C2=A0lib/libgtest.a &amp;&amp; :<br>| /OE/build/luneos-scarthgap/t=
mp-glibc/work/corei7-64-webos-linux/leveldb-tl/1.0.6+git/recipe-sysroot-nat=
ive/usr/bin/x86_64-webos-linux/../../libexec/x86_64-webos-linux/gcc/x86_64-=
webos-linux/13.2.0/ld: CMakeFiles/mksandwich.dir/mksandwich.cpp.o:(.rodata.=
_ZTIN7leveldb10AsIteratorINS_10SandwichDBINS_8BottomDBEtE4Part6WalkerEEE[_Z=
TIN7leveldb10AsIteratorINS_10SandwichDBINS_8BottomDBEtE4Part6WalkerEEE]+0x1=
0): undefined reference to `typeinfo for leveldb::Iterator&#39;<br>| collec=
t2: error: ld returned 1 exit status<br></div><div><br></div><div>Will send=
 a fix after fixing the 2nd issue as well.</div><div><br></div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105621): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105621" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105621</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102022571/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102022571/3617156</a><br>
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

--000000000000e742db06082ee077--

