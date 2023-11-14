Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162B9C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 18:37:34 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.785.1699987043556125386
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 10:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EWN+gvPj;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6cd1918afb2so3796917a34.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 10:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699987042; x=1700591842; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98eo9IFTVLix0BJm9sj4K1Wp5CW11LK4hmUg9hCOdNM=;
        b=EWN+gvPj1J1tWsIkvhDdhC5MuuHTrY0GqEuQWrPQpMSDHyGWwN41Va6uwosCgTp6bU
         vWkWFqWAbO5zW8V94tj7Lqt1nH88AjS/GQRKO9ZgfeyOCLgEz2IDf6lq6YRhM39o9jHp
         BzDhfxAmw0xvLLP5eV3rU+ysjhIhco1OTttm/X0lBav7igahsSgmkvCeRW7rGC1SPh/k
         NpG/3qF/ncefORyLUAx6IPIiQC044J2rlVHSoPNLmPj0ZZbt78A3tToRVSG0hwu4knNY
         IztHRcD3C0I9YhVX0FQ5KlZdSjyD0FYXl4EC6s7Syn+OhO5xrkDjFoPZ+3yBKtHcSjx4
         Q2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699987042; x=1700591842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98eo9IFTVLix0BJm9sj4K1Wp5CW11LK4hmUg9hCOdNM=;
        b=nOOYJDMnVr0M6eSy0n8kSyKeftcF+ab33zgq4aSpuce6qPd1AXoDGYTK+SysxZS/Og
         yw6vMqQqh6BUHI0pNRbTODiJQbCxLqn7/p2ABGgPBAkrbBV+IS3bHLj/k+c4z5oKeXss
         U4PNaz0LxLdnzW1pfk9G2uAI+evRFRLfdbcNLltZErlbL50qwoSPJ3RVhLlf7tBtGxIh
         gg0FY17bhp2ltvqiz+03LhHuTTCZ8SosiAAU+1ckTECh3LhFdBwz9AuT00aMZtP9yqET
         TOpZWQnUv9ohcJwGqGDYb44SILSvXEnghvCGBaTJGCtwY6a3qKReyt0q19jsW9TTcj/1
         wuYQ==
X-Gm-Message-State: AOJu0Yxd0CugEudXWRYL8LdOaO+Fh+8bErB45SVzyzeOxIZahavFCei0
	JSIzyYXNCnfQ5mHSz0SV96ecLexL7b86n7izLt4=
X-Google-Smtp-Source: AGHT+IHyhPoPKjFSKP3KuURCb3RH8iyBlTFAlGfowo5T8oiKHeeZImLNNI8nHregsIEe2QG303F4K1ZA5OoKRZzemq8=
X-Received: by 2002:a05:6870:fb87:b0:1ef:b669:ba1f with SMTP id
 kv7-20020a056870fb8700b001efb669ba1fmr13982138oab.8.1699987042548; Tue, 14
 Nov 2023 10:37:22 -0800 (PST)
MIME-Version: 1.0
References: <20231112131355.189550-1-alperyasinak1@gmail.com>
 <169990043623.4418.7053029550355734291.b4-ty@gmail.com> <CA+chaQeKBdDYo+mJ_Xs=4wXMk33uwaLFJDv2jkmB7xzX7j4LJQ@mail.gmail.com>
In-Reply-To: <CA+chaQeKBdDYo+mJ_Xs=4wXMk33uwaLFJDv2jkmB7xzX7j4LJQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Nov 2023 10:36:56 -0800
Message-ID: <CAMKF1spaQa4EXBVqVmNUTfzW7D1Vwi7UOTX3Q1eDKjXh0fXL1w@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] libebml: upgrade 1.3.0 -> 1.4.4
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	alperak <alperyasinak1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 18:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106721

interesting, did not fail for yoe CI world build, but then it uses
clang and here I see you are using g++ so maybe something to look
into. Thanks for report.

On Tue, Nov 14, 2023 at 6:51=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> This seems to break gerbera build (I haven't looked further, just noticed=
 this as new failure in world builds):
>
> FAILED: gerbera
> : && TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-=
native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++ --sysroot=3DTOPDIR/BUILD=
/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot -m64 -march=3Dcore2=
 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORT=
IFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -Werror=
=3Dreturn-type  --sysroot=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1=
.12.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-p=
refix-map  -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbe=
ra/1.12.1/git=3D/usr/src/debug/gerbera/1.12.1-r0  -fdebug-prefix-map=3DTOPD=
IR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/git=3D/usr/src/debug/gerbe=
ra/1.12.1-r0  -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/ge=
rbera/1.12.1/build=3D/usr/src/debug/gerbera/1.12.1-r0  -fdebug-prefix-map=
=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/build=3D/usr/src/de=
bug/gerbera/1.12.1-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe=
-linux/gerbera/1.12.1/recipe-sysroot=3D  -fmacro-prefix-map=3DTOPDIR/BUILD/=
work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot=3D  -fdebug-prefix-m=
ap=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-na=
tive=3D  -fvisibility-inlines-hidden  -m64 -march=3Dcore2 -mtune=3Dcore2 -m=
sse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wf=
ormat -Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type  --=
sysroot=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysro=
ot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro=
-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/git=3D/u=
sr/src/debug/gerbera/1.12.1-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemu=
x86_64-oe-linux/gerbera/1.12.1/git=3D/usr/src/debug/gerbera/1.12.1-r0  -fma=
cro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/build=
=3D/usr/src/debug/gerbera/1.12.1-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work=
/qemux86_64-oe-linux/gerbera/1.12.1/build=3D/usr/src/debug/gerbera/1.12.1-r=
0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.=
1/recipe-sysroot=3D  -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-l=
inux/gerbera/1.12.1/recipe-sysroot=3D  -fdebug-prefix-map=3DTOPDIR/BUILD/wo=
rk/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-native=3D  -fvisibilit=
y-inlines-hidden  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-pr=
efix-map  -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerber=
a/1.12.1/git=3D/usr/src/debug/gerbera/1.12.1-r0  -fdebug-prefix-map=3DTOPDI=
R/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/git=3D/usr/src/debug/gerber=
a/1.12.1-r0  -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/ger=
bera/1.12.1/build=3D/usr/src/debug/gerbera/1.12.1-r0  -fdebug-prefix-map=3D=
TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/build=3D/usr/src/debug=
/gerbera/1.12.1-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-li=
nux/gerbera/1.12.1/recipe-sysroot=3D  -fmacro-prefix-map=3DTOPDIR/BUILD/wor=
k/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot=3D  -fdebug-prefix-map=
=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-nati=
ve=3D  -Wl,-z,relro,-z,now -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
fcanon-prefix-map  -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-lin=
ux/gerbera/1.12.1/git=3D/usr/src/debug/gerbera/1.12.1-r0  -fdebug-prefix-ma=
p=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/git=3D/usr/src/deb=
ug/gerbera/1.12.1-r0  -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-=
linux/gerbera/1.12.1/build=3D/usr/src/debug/gerbera/1.12.1-r0  -fdebug-pref=
ix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/build=3D/usr/=
src/debug/gerbera/1.12.1-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86=
_64-oe-linux/gerbera/1.12.1/recipe-sysroot=3D  -fmacro-prefix-map=3DTOPDIR/=
BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot=3D  -fdebug-pr=
efix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysr=
oot-native=3D  -Wl,-z,relro,-z,now CMakeFiles/gerbera.dir/src/main.cc.o -o =
gerbera  liblibgerbera.a  -latomic  TOPDIR/BUILD/work/qemux86_64-oe-linux/g=
erbera/1.12.1/recipe-sysroot/usr/lib/libuuid.so  TOPDIR/BUILD/work/qemux86_=
64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib/libupnp.so  TOPDIR/BUILD/=
work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib/libixml.so  =
TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib=
/libspdlog.so.1.12.0  TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
recipe-sysroot/usr/lib/libfmt.so.10.1.0  TOPDIR/BUILD/work/qemux86_64-oe-li=
nux/gerbera/1.12.1/recipe-sysroot/usr/lib/libpugixml.so  TOPDIR/BUILD/work/=
qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib/libsqlite3.so  TO=
PDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib/l=
ibnsl.so  TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysro=
ot/usr/lib/libcurl.so  TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/recipe-sysroot/usr/lib/libebml.a  TOPDIR/BUILD/work/qemux86_64-oe-linux/ge=
rbera/1.12.1/recipe-sysroot/usr/lib/libmatroska.a  TOPDIR/BUILD/work/qemux8=
6_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib/libz.so && :
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-nativ=
e/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux=
/13.2.0/ld: TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sys=
root/usr/lib/libmatroska.a(KaxBlockData.cpp.o): warning: relocation against=
 `_ZTVN7libebml12EbmlSIntegerE' in read-only section `.text'
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-nativ=
e/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux=
/13.2.0/ld: TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sys=
root/usr/lib/libmatroska.a(KaxSemantic.cpp.o): in function `libmatroska::Ka=
xReferenceVirtual::KaxReferenceVirtual()':
> /usr/src/debug/libmatroska/1.7.1-r0/src/KaxSemantic.cpp:174:(.text+0xda5)=
: undefined reference to `libebml::EbmlSInteger::EbmlSInteger()'
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-nativ=
e/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux=
/13.2.0/ld: TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sys=
root/usr/lib/libmatroska.a(KaxSemantic.cpp.o): in function `libmatroska::Ka=
xDiscardPadding::KaxDiscardPadding()':
> /usr/src/debug/libmatroska/1.7.1-r0/src/KaxSemantic.cpp:176:(.text+0xde5)=
: undefined reference to `libebml::EbmlSInteger::EbmlSInteger()'
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-nativ=
e/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux=
/13.2.0/ld: TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sys=
root/usr/lib/libmatroska.a(KaxSemantic.cpp.o): in function `libmatroska::Ka=
xTrackOffset::KaxTrackOffset()':
> /usr/src/debug/libmatroska/1.7.1-r0/src/KaxSemantic.cpp:280:(.text+0x11e7=
): undefined reference to `libebml::EbmlSInteger::EbmlSInteger(long)'
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-nativ=
e/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux=
/13.2.0/ld: TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sys=
root/usr/lib/libmatroska.a(KaxSemantic.cpp.o): in function `libebml::EbmlSI=
nteger::~EbmlSInteger()':
> /usr/include/ebml/EbmlSInteger.h:54:(.text._ZN11libmatroska17KaxDiscardPa=
ddingD2Ev[_ZN11libmatroska17KaxDiscardPaddingD5Ev]+0x3): undefined referenc=
e to `vtable for libebml::EbmlSInteger'
> ...
>
> On Mon, Nov 13, 2023 at 7:34=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>>
>> On Sun, 12 Nov 2023 16:13:55 +0300, alperak wrote:
>> > Changelog:
>> >
>> > https://github.com/Matroska-Org/libebml/blob/master/NEWS.md
>> >
>> >
>>
>> Applied, thanks!
>>
>> [1/1] libebml: upgrade 1.3.0 -> 1.4.4
>>       commit: 7d1a0cd654ecaa68e27e09666744901e21b775a9
>>
>> Best regards,
>> --
>> Khem Raj <raj.khem@gmail.com>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#106660): https://lists.openembedded.org/g/openembedd=
ed-devel/message/106660
>> Mute This Topic: https://lists.openembedded.org/mt/102541696/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

