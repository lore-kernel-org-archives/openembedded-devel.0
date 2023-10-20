Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7603ACDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 12:47:08 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.53274.1697806027772960787
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Oct 2023 05:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UazmV8Wc;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-32ddfb38c02so566539f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697806026; x=1698410826; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E+06WaAlkNujWxVyFfdR+rjoqC2JyjAnK4N7kdUPCDE=;
        b=UazmV8Wc/BBFd0RBXeskTfdAvzFNtNdHWyNozqQ4VlK5ATouo/lxDERoO/+1umxZ7T
         wAMm5AyQsRFRRhTFb4DtiCgu0KLh8dWdErY8QYFG+H9dFGdYEv97znPa+QHZ3lbsZgTW
         RYCpCRCqCYvk38YRgf/7OHJn3ahWbI4aeFI8v6H5mJFt+dR/jX8k4Xv70V87KZK2LNpQ
         DsgJrGr3FSlJDxt8e+WzpKh30UF9FkSygyJnYRHnkYoDPE5iARgm0fiacEpGOJ5FJFXg
         HQCaaCaq30Scp+rRo7LhGLyYO8CZ9XnZh2FWvoQhVy9iyl8yNFIJumfuJ/r6YOzM1JV3
         pQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697806026; x=1698410826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+06WaAlkNujWxVyFfdR+rjoqC2JyjAnK4N7kdUPCDE=;
        b=UhgGcGAflNSfEC8wK2NYfetOY3QlXM6gyiiO3ctURbmmHvQq9qGynOADSlORiJa5qi
         KiPrH8biQMZIbdCez/kbsS4By05fh/My+K/C+SG85DkSfeyvQEnv22e0pTG5xMWLDbe6
         cmd0y+QhtV2xd9JsPqJX4kqVnOwvNcsWhhN5nBpSt2E7QgivgnQk4i2+LLYvkuZ+6YBK
         Nw/haLvein16cmHar9JkMF6hffNSIl30xlFXIZZxN6yMRWK/dQBk84D5NrmXcOP2KJi+
         S7Zu7DuRDzHWn1btjff2i1t/RKwv9l2l0/lgFZt5KZq1Bm+TepPA9DBRfZn159d2kFUt
         izSw==
X-Gm-Message-State: AOJu0YzR18K9uVrQ3hMJuvPsYXVKAlpUOvVZyLoB4ywNLrzw+bsCev0N
	wbwHOVtZbC2J3GBK48D9iOOqkV7vtnwoc6S0vWc=
X-Google-Smtp-Source: AGHT+IHqL2AY2Aht8Xmr4kJPnMU7h/aMFOd2+bAdLQSDsQOjOgp2bwQjHCghCIH4CeJFhtCSYYI/nfU99WaUGdSuxaQ=
X-Received: by 2002:a5d:618d:0:b0:32d:b194:706 with SMTP id
 j13-20020a5d618d000000b0032db1940706mr1272514wru.16.1697806025949; Fri, 20
 Oct 2023 05:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231017171702.2964390-1-raj.khem@gmail.com>
In-Reply-To: <20231017171702.2964390-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 20 Oct 2023 14:46:50 +0200
Message-ID: <CA+chaQe8BRQWX98AgNuah4PmopCpNdppzE+geh_SoqvbzD-KHw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] leveldb: Upgrade to 1.23 plus latest git
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000013058d0608254582"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 12:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105621

--00000000000013058d0608254582
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2023 at 7:17=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> Switch to git submods as it needs gtest and benchmarks checked out at a
> particular commit
>

But it probably shouldn't install gtest files as this now causes conflicts
when leveldb is used in component which itself also depends on gtest e.g.
leveldb-tl in meta-webosose:

ERROR: lib32-leveldb-tl-0.1.6-r4 do_prepare_recipe_sysroot: The file
/usr/lib/pkgconfig/gtest.pc is installed by both lib32-googletest and
lib32-leveldb, aborting

Without gtest enabled in leveldb-tl it fails a bit later:
 FAILED: mksandwich
| : &&
/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-tl/=
1.0.6+git/recipe-sysroot-native/usr/bin/x86_64-webos-linux/x86_64-webos-lin=
ux-g++
--sysroot=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux=
/leveldb-tl/1.0.6+git/recipe-sysroot
-m64 -march=3Dnehalem -mtune=3Dgeneric -mfpmath=3Dsse -msse4.2
 --sysroot=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linu=
x/leveldb-tl/1.0.6+git/recipe-sysroot
 -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map
 -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git-r=
0
 -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git-r=
0
 -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+git=
-r0
 -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+git=
-r0
 -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D
 -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D
 -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/recipe-sysroot-native=3D
 -fvisibility-inlines-hidden -std=3Dc++14 -Wall -Wextra -Wconversion -Werro=
r
 -m64 -march=3Dnehalem -mtune=3Dgeneric -mfpmath=3Dsse -msse4.2
 --sysroot=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linu=
x/leveldb-tl/1.0.6+git/recipe-sysroot
 -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map
 -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git-r=
0
 -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git-r=
0
 -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+git=
-r0
 -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+git=
-r0
 -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D
 -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D
 -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/recipe-sysroot-native=3D
 -fvisibility-inlines-hidden -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
-fcanon-prefix-map
 -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git-r=
0
 -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git-r=
0
 -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+git=
-r0
 -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+git=
-r0
 -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D
 -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D
 -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/recipe-sysroot-native=3D
 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map
 -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git-r=
0
 -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/git=3D/usr/src/debug/leveldb-tl/1.0.6+git-r=
0
 -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+git=
-r0
 -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/build=3D/usr/src/debug/leveldb-tl/1.0.6+git=
-r0
 -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D
 -fmacro-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/recipe-sysroot=3D
 -fdebug-prefix-map=3D/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-w=
ebos-linux/leveldb-tl/1.0.6+git/recipe-sysroot-native=3D
 -rdynamic CMakeFiles/mksandwich.dir/mksandwich.cpp.o -o mksandwich
 lib/libgtest.a  lib/libgtest_main.a  -lleveldb  -lsnappy  lib/libgtest.a
&& :
|
/OE/build/luneos-scarthgap/tmp-glibc/work/corei7-64-webos-linux/leveldb-tl/=
1.0.6+git/recipe-sysroot-native/usr/bin/x86_64-webos-linux/../../libexec/x8=
6_64-webos-linux/gcc/x86_64-webos-linux/13.2.0/ld:
CMakeFiles/mksandwich.dir/mksandwich.cpp.o:(.rodata._ZTIN7leveldb10AsIterat=
orINS_10SandwichDBINS_8BottomDBEtE4Part6WalkerEEE[_ZTIN7leveldb10AsIterator=
INS_10SandwichDBINS_8BottomDBEtE4Part6WalkerEEE]+0x10):
undefined reference to `typeinfo for leveldb::Iterator'
| collect2: error: ld returned 1 exit status

Will send a fix after fixing the 2nd issue as well.

--00000000000013058d0608254582
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Oct 17, 2023 at 7:17=E2=80=AFPM K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Switch to git submods as it needs gtest and benchmarks =
checked out at a<br>
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

--00000000000013058d0608254582--

