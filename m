Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60EA8C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:09:18 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.11216.1634656157813226976
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dj6dRtEo;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so101346pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jO1fN6d1zc2jgpy/U8Lz2qDTTxFnlHvZguzpwQYwzfE=;
        b=dj6dRtEo9fWywMWRrbqal0u0tKlW68LRexWzfNE0lOTXYkbbjdGylj+INZD3GiOXAO
         Ht5szPdtde1uqaPg/RHXo42l7pqz4vn+ZDgTPGD1+5lYNn/gafDalgqDtl/leMuyIKUE
         H5S+G0ErKwV9F2tJkDfhyY5kX8F6bnCdEpwmcMsefoVpgQHrQxeR7Hb1Mn4eFMnjVd3q
         rVycbLHHS+bNIkLthQA9MtOoiBnnRvhn1CzYjGSgzdOTHuXTjy6dKKWRzL7vnwooyrN1
         TW7QrVw48Thc1PZOf+YDQPOBCN0G2hFWy+ixVSe71y2fpdYSC8GeMhYZ/nzpIHcbTO2x
         9nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jO1fN6d1zc2jgpy/U8Lz2qDTTxFnlHvZguzpwQYwzfE=;
        b=W6Pu5N4ymOWa6rwamlxvceBfk0gh9gsVciJvVgnH4XDS/fGUvAOhKGqgGqjXeqAhnk
         lFgOyeXjrElXdzV+SntSiI37w2xxYTdZNdp4zEax4Sn1UtXVmOqL4yFf1n8j/o03021/
         hwT2TxQ3Edjge9eqwM7/XqG6enO+tGIp2XO2YFjgo3Tkn2Y9Oantp8v32I8JtYmkywNL
         5APIlc9lrXl2Wc9RQeEFhi8qqoJ7CVcq+xQn6HbxpqcTbm1/Gnp6p0pkcjpdrw0BnerS
         FwJ7Y9zKApApl0T6NPjlnzHeQ2VpGZTCm0xHEFqox8ZUgdabguaDKSaGzJQrnbF4PM6V
         5G6A==
X-Gm-Message-State: AOAM531RpJHFHfINlH6nO6RkGY0ZZ/YH+AbAmEoro4pK7roe6Vd3jgBp
	AfegsuXyTrwYtm9egBkndjEyhef9K4I7KJENWDY=
X-Google-Smtp-Source: 
 ABdhPJzsJh7MZQfjrT+5pj6WGkFxI6vB3sdesP2y5WnTpPf6pFcE9rganGZp2K737rOjWzdzH3ISOYPqWjVZKORud18=
X-Received: by 2002:a17:902:e746:b0:13f:398e:a0e2 with SMTP id
 p6-20020a170902e74600b0013f398ea0e2mr33435297plf.48.1634656157153; Tue, 19
 Oct 2021 08:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211016165223.1271496-1-raj.khem@gmail.com>
 <1ea36ba81f0d4fe0b43d36b415ee6255@axis.com>
 <0d71ee5f-5302-297b-2e65-87072d96a213@gmail.com>
In-Reply-To: <0d71ee5f-5302-297b-2e65-87072d96a213@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 19 Oct 2021 17:09:06 +0200
Message-ID: 
 <CA+chaQfD8hFQA7wYLYAbq3UN51xOTXEqkPZyrtwEbzTv9=rFjw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] protobuf-c: Do not use gold linker
To: Khem Raj <raj.khem@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000093c52805ceb60b42"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 15:09:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93466

--00000000000093c52805ceb60b42
Content-Type: text/plain; charset="UTF-8"

I'm seeing the same failure now, but it fails with bfd (with this fix) as
well:

| make[1]: Entering directory
'/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/build'
| ./x86_64-oe-linux-libtool  --tag=CXX   --mode=link x86_64-oe-linux-g++
 -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
-fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat
-Wformat-security -Werror=format-security
--sysroot=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot
-std=c++11  -pthread -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=/usr/src/debug/protobuf-c/1.4.0-r0

 -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=/usr/src/debug/protobuf-c/1.4.0-r0

 -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot=

 -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot-native=
 -fvisibility-inlines-hidden  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
-fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=/usr/src/debug/protobuf-c/1.4.0-r0

 -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=/usr/src/debug/protobuf-c/1.4.0-r0

 -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot=

 -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot-native=
 -Wl,-z,relro,-z,now  -fuse-ld=bfd  -o protoc-c/protoc-gen-c
protoc-c/protoc_gen_c-c_bytes_field.o protoc-c/protoc_gen_c-c_enum.o
protoc-c/protoc_gen_c-c_enum_field.o protoc-c/protoc_gen_c-c_extension.o
protoc-c/protoc_gen_c-c_field.o protoc-c/protoc_gen_c-c_file.o
protoc-c/protoc_gen_c-c_generator.o protoc-c/protoc_gen_c-c_helpers.o
protoc-c/protoc_gen_c-c_message.o protoc-c/protoc_gen_c-c_message_field.o
protoc-c/protoc_gen_c-c_primitive_field.o protoc-c/protoc_gen_c-c_service.o
protoc-c/protoc_gen_c-c_string_field.o
protobuf-c/protoc_c_protoc_gen_c-protobuf-c.pb.o
protoc-c/protoc_gen_c-main.o -lprotobuf -lpthread -lprotoc
| x86_64-oe-linux-libtool: link: x86_64-oe-linux-g++ -m64 -march=core2
-mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2
-D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
--sysroot=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot
-std=c++11 -pthread -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=/usr/src/debug/protobuf-c/1.4.0-r0
-fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=/usr/src/debug/protobuf-c/1.4.0-r0
-fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot=
-fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot-native=
-fvisibility-inlines-hidden -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
-fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=/usr/src/debug/protobuf-c/1.4.0-r0
-fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=/usr/src/debug/protobuf-c/1.4.0-r0
-fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot=
-fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot-native=
-Wl,-z -Wl,relro -Wl,-z -Wl,now -fuse-ld=bfd -o protoc-c/protoc-gen-c
protoc-c/protoc_gen_c-c_bytes_field.o protoc-c/protoc_gen_c-c_enum.o
protoc-c/protoc_gen_c-c_enum_field.o protoc-c/protoc_gen_c-c_extension.o
protoc-c/protoc_gen_c-c_field.o protoc-c/protoc_gen_c-c_file.o
protoc-c/protoc_gen_c-c_generator.o protoc-c/protoc_gen_c-c_helpers.o
protoc-c/protoc_gen_c-c_message.o protoc-c/protoc_gen_c-c_message_field.o
protoc-c/protoc_gen_c-c_primitive_field.o protoc-c/protoc_gen_c-c_service.o
protoc-c/protoc_gen_c-c_string_field.o
protobuf-c/protoc_c_protoc_gen_c-protobuf-c.pb.o
protoc-c/protoc_gen_c-main.o  -lprotobuf -lpthread -lprotoc -pthread
|
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.2.0/ld.bfd:
protobuf-c/protoc_c_protoc_gen_c-protobuf-c.pb.o:(.data.rel.ro+0x30):
undefined reference to
`descriptor_table_google_2fprotobuf_2fdescriptor_2eproto'
| collect2: error: ld returned 1 exit status

There is possible fix in meta-webosose:
https://github.com/webosose/meta-webosose/commit/9250cad447658cc6cc431572cb3b2c606e3fe257

I've verified that it fixes protobuf-c build for me, should I send it to
meta-oe?



On Sun, Oct 17, 2021 at 11:23 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 10/17/21 3:51 AM, Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: openembedded-devel@lists.openembedded.org <openembedded-
> >> devel@lists.openembedded.org> On Behalf Of Khem Raj
> >> Sent: den 16 oktober 2021 18:52
> >> To: openembedded-devel@lists.openembedded.org
> >> Cc: Khem Raj <raj.khem@gmail.com>
> >> Subject: [oe] [meta-oe][PATCH 1/3] protobuf-c: Do not use gold linker
> >
> > Add a motivation as to why this is needed.
> >
>
> yeah, I should have added that gold linker ends up with symbols being
> exported with weak attribute while libprotobuf.map lists these symbols
> as global and exported. Gold linker ignores any mapping directive inside
> extern 'C' blocks, it could be a bug in linker [1]
>
> also see gentoo bug [2]
>
> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=24527
> [2] https://bugs.gentoo.org/683892
>
> > //Peter
> >
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>   meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
> b/meta-
> >> oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
> >> index cc037d3934..b5ab0a171c 100644
> >> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
> >> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
> >> @@ -19,6 +19,8 @@ S = "${WORKDIR}/git"
> >>
> >>   inherit autotools pkgconfig
> >>
> >> +LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -
> >> fuse-ld=bfd ', '', d)}"
> >> +
> >>   # After several fix attempts there is still a race between generating
> >>   # t.test-full.pb.h and compiling cxx_generate_packed_data.c despite
> >>   # BUILT_SOURCES and explicit dependencies.
> >> --
> >> 2.33.1
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93410):
> https://lists.openembedded.org/g/openembedded-devel/message/93410
> Mute This Topic: https://lists.openembedded.org/mt/86375042/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000093c52805ceb60b42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m seeing the same failure now, but it fails wit=
h bfd (with this fix) as well:</div><div><br></div><div>| make[1]: Entering=
 directory &#39;/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf=
-c/1.4.0-r0/build&#39;<br></div>| ./x86_64-oe-linux-libtool =C2=A0--tag=3DC=
XX =C2=A0 --mode=3Dlink x86_64-oe-linux-g++ =C2=A0-m64 -march=3Dcore2 -mtun=
e=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong =C2=A0-O2 -D_FORTI=
FY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sysroo=
t=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/=
recipe-sysroot -std=3Dc++11 =C2=A0-pthread -O2 -pipe -g -feliminate-unused-=
debug-types -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-=
oe-linux/protobuf-c/1.4.0-r0=3D/usr/src/debug/protobuf-c/1.4.0-r0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-fdebu=
g-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-=
c/1.4.0-r0=3D/usr/src/debug/protobuf-c/1.4.0-r0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-fdebug-prefix-map=3D/OE/b=
uild/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sy=
sroot=3D =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe=
-linux/protobuf-c/1.4.0-r0/recipe-sysroot-native=3D =C2=A0-fvisibility-inli=
nes-hidden =C2=A0-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-pre=
fix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4=
.0-r0=3D/usr/src/debug/protobuf-c/1.4.0-r0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-fdebug-prefix-map=3D/OE/build=
/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=3D/usr/src/de=
bug/protobuf-c/1.4.0-r0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc=
/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot=3D =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-fdebug-pref=
ix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.=
0-r0/recipe-sysroot-native=3D =C2=A0-Wl,-z,relro,-z,now =C2=A0-fuse-ld=3Dbf=
d =C2=A0-o protoc-c/protoc-gen-c protoc-c/protoc_gen_c-c_bytes_field.o prot=
oc-c/protoc_gen_c-c_enum.o protoc-c/protoc_gen_c-c_enum_field.o protoc-c/pr=
otoc_gen_c-c_extension.o protoc-c/protoc_gen_c-c_field.o protoc-c/protoc_ge=
n_c-c_file.o protoc-c/protoc_gen_c-c_generator.o protoc-c/protoc_gen_c-c_he=
lpers.o protoc-c/protoc_gen_c-c_message.o protoc-c/protoc_gen_c-c_message_f=
ield.o protoc-c/protoc_gen_c-c_primitive_field.o protoc-c/protoc_gen_c-c_se=
rvice.o protoc-c/protoc_gen_c-c_string_field.o protobuf-c/protoc_c_protoc_g=
en_c-protobuf-c.pb.o protoc-c/protoc_gen_c-main.o -lprotobuf -lpthread -lpr=
otoc<br>| x86_64-oe-linux-libtool: link: x86_64-oe-linux-g++ -m64 -march=3D=
core2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong -O2 -D_=
FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --s=
ysroot=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.=
0-r0/recipe-sysroot -std=3Dc++11 -pthread -O2 -pipe -g -feliminate-unused-d=
ebug-types -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-o=
e-linux/protobuf-c/1.4.0-r0=3D/usr/src/debug/protobuf-c/1.4.0-r0 -fdebug-pr=
efix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.=
4.0-r0=3D/usr/src/debug/protobuf-c/1.4.0-r0 -fdebug-prefix-map=3D/OE/build/=
oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot=
=3D -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux=
/protobuf-c/1.4.0-r0/recipe-sysroot-native=3D -fvisibility-inlines-hidden -=
Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/OE/buil=
d/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=3D/usr/src/d=
ebug/protobuf-c/1.4.0-r0 -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/w=
ork/core2-64-oe-linux/protobuf-c/1.4.0-r0=3D/usr/src/debug/protobuf-c/1.4.0=
-r0 -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux=
/protobuf-c/1.4.0-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/OE/build/oe-co=
re/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot-nati=
ve=3D -Wl,-z -Wl,relro -Wl,-z -Wl,now -fuse-ld=3Dbfd -o protoc-c/protoc-gen=
-c protoc-c/protoc_gen_c-c_bytes_field.o protoc-c/protoc_gen_c-c_enum.o pro=
toc-c/protoc_gen_c-c_enum_field.o protoc-c/protoc_gen_c-c_extension.o proto=
c-c/protoc_gen_c-c_field.o protoc-c/protoc_gen_c-c_file.o protoc-c/protoc_g=
en_c-c_generator.o protoc-c/protoc_gen_c-c_helpers.o protoc-c/protoc_gen_c-=
c_message.o protoc-c/protoc_gen_c-c_message_field.o protoc-c/protoc_gen_c-c=
_primitive_field.o protoc-c/protoc_gen_c-c_service.o protoc-c/protoc_gen_c-=
c_string_field.o protobuf-c/protoc_c_protoc_gen_c-protobuf-c.pb.o protoc-c/=
protoc_gen_c-main.o =C2=A0-lprotobuf -lpthread -lprotoc -pthread<br>| /OE/b=
uild/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sy=
sroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_=
64-oe-linux/11.2.0/ld.bfd: protobuf-c/protoc_c_protoc_gen_c-protobuf-c.pb.o=
:(.<a href=3D"http://data.rel.ro">data.rel.ro</a>+0x30): undefined referenc=
e to `descriptor_table_google_2fprotobuf_2fdescriptor_2eproto&#39;<br>| col=
lect2: error: ld returned 1 exit status<br><div><br></div><div>There is pos=
sible fix in meta-webosose:</div><div><a href=3D"https://github.com/webosos=
e/meta-webosose/commit/9250cad447658cc6cc431572cb3b2c606e3fe257">https://gi=
thub.com/webosose/meta-webosose/commit/9250cad447658cc6cc431572cb3b2c606e3f=
e257</a><br></div><div><br></div><div>I&#39;ve verified that it fixes proto=
buf-c build for me, should I send it to meta-oe?</div><div><br></div><div><=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Sun, Oct 17, 2021 at 11:23 PM Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><br>
<br>
On 10/17/21 3:51 AM, Peter Kjellerstedt wrote:<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org"=
 target=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;openem=
bedded-<br>
&gt;&gt; <a href=3D"mailto:devel@lists.openembedded.org" target=3D"_blank">=
devel@lists.openembedded.org</a>&gt; On Behalf Of Khem Raj<br>
&gt;&gt; Sent: den 16 oktober 2021 18:52<br>
&gt;&gt; To: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" t=
arget=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt;&gt; Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; Subject: [oe] [meta-oe][PATCH 1/3] protobuf-c: Do not use gold lin=
ker<br>
&gt; <br>
&gt; Add a motivation as to why this is needed.<br>
&gt; <br>
<br>
yeah, I should have added that gold linker ends up with symbols being <br>
exported with weak attribute while libprotobuf.map lists these symbols <br>
as global and exported. Gold linker ignores any mapping directive inside <b=
r>
extern &#39;C&#39; blocks, it could be a bug in linker [1]<br>
<br>
also see gentoo bug [2]<br>
<br>
[1] <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D24527" rel=
=3D"noreferrer" target=3D"_blank">https://sourceware.org/bugzilla/show_bug.=
cgi?id=3D24527</a><br>
[2] <a href=3D"https://bugs.gentoo.org/683892" rel=3D"noreferrer" target=3D=
"_blank">https://bugs.gentoo.org/683892</a><br>
<br>
&gt; //Peter<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta-oe/recipes-devtools/protobuf/<a href=3D"http://pr=
otobuf-c_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">protobuf-c_1.4.0.bb=
</a> | 2 ++<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://p=
rotobuf-c_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">protobuf-c_1.4.0.b=
b</a> b/meta-<br>
&gt;&gt; oe/recipes-devtools/protobuf/<a href=3D"http://protobuf-c_1.4.0.bb=
" rel=3D"noreferrer" target=3D"_blank">protobuf-c_1.4.0.bb</a><br>
&gt;&gt; index cc037d3934..b5ab0a171c 100644<br>
&gt;&gt; --- a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf=
-c_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">protobuf-c_1.4.0.bb</a><b=
r>
&gt;&gt; +++ b/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf=
-c_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">protobuf-c_1.4.0.bb</a><b=
r>
&gt;&gt; @@ -19,6 +19,8 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0inherit autotools pkgconfig<br>
&gt;&gt;<br>
&gt;&gt; +LDFLAGS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;=
, &#39;ld-is-gold&#39;, &#39; -<br>
&gt;&gt; fuse-ld=3Dbfd &#39;, &#39;&#39;, d)}&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0# After several fix attempts there is still a race bet=
ween generating<br>
&gt;&gt;=C2=A0 =C2=A0# t.test-full.pb.h and compiling cxx_generate_packed_d=
ata.c despite<br>
&gt;&gt;=C2=A0 =C2=A0# BUILT_SOURCES and explicit dependencies.<br>
&gt;&gt; --<br>
&gt;&gt; 2.33.1<br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93410): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93410" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93410</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86375042/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86375042/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000093c52805ceb60b42--

