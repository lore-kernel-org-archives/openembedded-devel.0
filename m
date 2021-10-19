Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC65C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 16:06:37 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.12007.1634659597004293471
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 09:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=igED3zjd;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id 77so409861qkh.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 09:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DKxJQGs6ck78+R9xJ+/GF+a9KLvDy6NeMAPco0ea7bQ=;
        b=igED3zjdaiv9x5pY62GwuQXAVuC1nz5xLwN142W8kVo9LrHuH7tKGdzoHAXlP+KqxN
         8Ns68NfTkjFneo9bdeq8YJ3Yb0RFRVNhGysbt7SDL1k8IZK14KvGbt2Q3fu1Smw0Bmg/
         A+90dTU3K7WQf2dIypRtEAH9bbLNLO2KtpRp52a48eSeFfQJoMAS+6q9VjIpZHT3BK+m
         OUi4xSuDUwn0OMVFVTxMNpdc64YIOKYTAqm4Os5lFC5ID2ZiL/DhE6IJ2kPffv7BixVp
         spusUjJ1dLjPBA+rJxJA+jraSGfv1Ic2Q4jjvXFKTsyAhXYeK5BNod1kbxLekl84olop
         /Qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DKxJQGs6ck78+R9xJ+/GF+a9KLvDy6NeMAPco0ea7bQ=;
        b=RSgbVg+7+HeJxyx/JT7JRv6tId7aochSglBjWK6Fyahy1LSXzWI+8HLN8CbuZYxIKn
         i+VF/icQ0T4Yj3iWj0Bb+34u8TxdD6Jav6Du9kX5IkgwugkFb+Q+n6JQtY4pOxMbMPuk
         0sSTDaYX9/poO+qenUDkqh1bSGHozdrEisdWWwBsGDaj14Q1lCCYoQcDwlN52SdIyXZz
         gUCqHomuSfRmXtd9a5+cDPBT9pLrciNs9kWNu1h2bero3PfAj97Ds7R3P1bTmCP33PPo
         UYlnbv4ozemB9ZxWCRxz+P8AS2863hqcs1acCVmMsyKf6tqom2kJlkwn6qAjDhJUQIc+
         9gpw==
X-Gm-Message-State: AOAM531srDigeL7MC9R6g5MISq/VIbRoC5IPYQheK1YFm2zK+su/agj7
	Y8dQDyax2QgQEvQaQFdfM4UBY6siBMH9+9bgexM=
X-Google-Smtp-Source: 
 ABdhPJwsW04xTWeDVXZEOk+PjdK2VuxkCc7pnfPhbALehK8uueBRFO+6B5fMBYrisnvPlz8JiWbr7QUujCiaKX538Vw=
X-Received: by 2002:a37:6744:: with SMTP id b65mr725115qkc.98.1634659596015;
 Tue, 19 Oct 2021 09:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211016165223.1271496-1-raj.khem@gmail.com>
 <1ea36ba81f0d4fe0b43d36b415ee6255@axis.com>
 <0d71ee5f-5302-297b-2e65-87072d96a213@gmail.com>
 <CA+chaQfD8hFQA7wYLYAbq3UN51xOTXEqkPZyrtwEbzTv9=rFjw@mail.gmail.com>
In-Reply-To: 
 <CA+chaQfD8hFQA7wYLYAbq3UN51xOTXEqkPZyrtwEbzTv9=rFjw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Oct 2021 09:06:10 -0700
Message-ID: 
 <CAMKF1srWe-NVQCA7-Y9h=utiFHFOJ5Vo=6tk1wVd3kcBzSr48A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] protobuf-c: Do not use gold linker
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 16:06:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93472

On Tue, Oct 19, 2021 at 8:09 AM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> I'm seeing the same failure now, but it fails with bfd (with this fix) as=
 well:
>
> | make[1]: Entering directory '/OE/build/oe-core/tmp-glibc/work/core2-64-=
oe-linux/protobuf-c/1.4.0-r0/build'
> | ./x86_64-oe-linux-libtool  --tag=3DCXX   --mode=3Dlink x86_64-oe-linux-=
g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-prote=
ctor-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=
=3Dformat-security --sysroot=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe=
-linux/protobuf-c/1.4.0-r0/recipe-sysroot -std=3Dc++11  -pthread -O2 -pipe =
-g -feliminate-unused-debug-types -fmacro-prefix-map=3D/OE/build/oe-core/tm=
p-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=3D/usr/src/debug/protobu=
f-c/1.4.0-r0                      -fdebug-prefix-map=3D/OE/build/oe-core/tm=
p-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=3D/usr/src/debug/protobu=
f-c/1.4.0-r0                      -fdebug-prefix-map=3D/OE/build/oe-core/tm=
p-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot=3D       =
               -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-=
64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot-native=3D  -fvisibility-inli=
nes-hidden  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-m=
ap=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=
=3D/usr/src/debug/protobuf-c/1.4.0-r0                      -fdebug-prefix-m=
ap=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=
=3D/usr/src/debug/protobuf-c/1.4.0-r0                      -fdebug-prefix-m=
ap=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=
/recipe-sysroot=3D                      -fdebug-prefix-map=3D/OE/build/oe-c=
ore/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot-nat=
ive=3D  -Wl,-z,relro,-z,now  -fuse-ld=3Dbfd  -o protoc-c/protoc-gen-c proto=
c-c/protoc_gen_c-c_bytes_field.o protoc-c/protoc_gen_c-c_enum.o protoc-c/pr=
otoc_gen_c-c_enum_field.o protoc-c/protoc_gen_c-c_extension.o protoc-c/prot=
oc_gen_c-c_field.o protoc-c/protoc_gen_c-c_file.o protoc-c/protoc_gen_c-c_g=
enerator.o protoc-c/protoc_gen_c-c_helpers.o protoc-c/protoc_gen_c-c_messag=
e.o protoc-c/protoc_gen_c-c_message_field.o protoc-c/protoc_gen_c-c_primiti=
ve_field.o protoc-c/protoc_gen_c-c_service.o protoc-c/protoc_gen_c-c_string=
_field.o protobuf-c/protoc_c_protoc_gen_c-protobuf-c.pb.o protoc-c/protoc_g=
en_c-main.o -lprotobuf -lpthread -lprotoc
> | x86_64-oe-linux-libtool: link: x86_64-oe-linux-g++ -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong -O2 -D_FORTIF=
Y_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sysroot=
=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/r=
ecipe-sysroot -std=3Dc++11 -pthread -O2 -pipe -g -feliminate-unused-debug-t=
ypes -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linu=
x/protobuf-c/1.4.0-r0=3D/usr/src/debug/protobuf-c/1.4.0-r0 -fdebug-prefix-m=
ap=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=
=3D/usr/src/debug/protobuf-c/1.4.0-r0 -fdebug-prefix-map=3D/OE/build/oe-cor=
e/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot=3D -f=
debug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/proto=
buf-c/1.4.0-r0/recipe-sysroot-native=3D -fvisibility-inlines-hidden -Wl,-O1=
 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/OE/build/oe-c=
ore/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0=3D/usr/src/debug/p=
rotobuf-c/1.4.0-r0 -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/co=
re2-64-oe-linux/protobuf-c/1.4.0-r0=3D/usr/src/debug/protobuf-c/1.4.0-r0 -f=
debug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/proto=
buf-c/1.4.0-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/OE/build/oe-core/tmp=
-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/recipe-sysroot-native=3D =
-Wl,-z -Wl,relro -Wl,-z -Wl,now -fuse-ld=3Dbfd -o protoc-c/protoc-gen-c pro=
toc-c/protoc_gen_c-c_bytes_field.o protoc-c/protoc_gen_c-c_enum.o protoc-c/=
protoc_gen_c-c_enum_field.o protoc-c/protoc_gen_c-c_extension.o protoc-c/pr=
otoc_gen_c-c_field.o protoc-c/protoc_gen_c-c_file.o protoc-c/protoc_gen_c-c=
_generator.o protoc-c/protoc_gen_c-c_helpers.o protoc-c/protoc_gen_c-c_mess=
age.o protoc-c/protoc_gen_c-c_message_field.o protoc-c/protoc_gen_c-c_primi=
tive_field.o protoc-c/protoc_gen_c-c_service.o protoc-c/protoc_gen_c-c_stri=
ng_field.o protobuf-c/protoc_c_protoc_gen_c-protobuf-c.pb.o protoc-c/protoc=
_gen_c-main.o  -lprotobuf -lpthread -lprotoc -pthread
> | /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/protobuf-c/1.4.0-r0/=
recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux=
/gcc/x86_64-oe-linux/11.2.0/ld.bfd: protobuf-c/protoc_c_protoc_gen_c-protob=
uf-c.pb.o:(.data.rel.ro+0x30): undefined reference to `descriptor_table_goo=
gle_2fprotobuf_2fdescriptor_2eproto'
> | collect2: error: ld returned 1 exit status
>
> There is possible fix in meta-webosose:
> https://github.com/webosose/meta-webosose/commit/9250cad447658cc6cc431572=
cb3b2c606e3fe257
>
> I've verified that it fixes protobuf-c build for me, should I send it to =
meta-oe?
>

yes please

>
>
> On Sun, Oct 17, 2021 at 11:23 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 10/17/21 3:51 AM, Peter Kjellerstedt wrote:
>> >> -----Original Message-----
>> >> From: openembedded-devel@lists.openembedded.org <openembedded-
>> >> devel@lists.openembedded.org> On Behalf Of Khem Raj
>> >> Sent: den 16 oktober 2021 18:52
>> >> To: openembedded-devel@lists.openembedded.org
>> >> Cc: Khem Raj <raj.khem@gmail.com>
>> >> Subject: [oe] [meta-oe][PATCH 1/3] protobuf-c: Do not use gold linker
>> >
>> > Add a motivation as to why this is needed.
>> >
>>
>> yeah, I should have added that gold linker ends up with symbols being
>> exported with weak attribute while libprotobuf.map lists these symbols
>> as global and exported. Gold linker ignores any mapping directive inside
>> extern 'C' blocks, it could be a bug in linker [1]
>>
>> also see gentoo bug [2]
>>
>> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=3D24527
>> [2] https://bugs.gentoo.org/683892
>>
>> > //Peter
>> >
>> >>
>> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> ---
>> >>   meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb | 2 ++
>> >>   1 file changed, 2 insertions(+)
>> >>
>> >> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb b/=
meta-
>> >> oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
>> >> index cc037d3934..b5ab0a171c 100644
>> >> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
>> >> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
>> >> @@ -19,6 +19,8 @@ S =3D "${WORKDIR}/git"
>> >>
>> >>   inherit autotools pkgconfig
>> >>
>> >> +LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', =
' -
>> >> fuse-ld=3Dbfd ', '', d)}"
>> >> +
>> >>   # After several fix attempts there is still a race between generati=
ng
>> >>   # t.test-full.pb.h and compiling cxx_generate_packed_data.c despite
>> >>   # BUILT_SOURCES and explicit dependencies.
>> >> --
>> >> 2.33.1
>> >
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#93410): https://lists.openembedded.org/g/openembedde=
d-devel/message/93410
>> Mute This Topic: https://lists.openembedded.org/mt/86375042/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
Martin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

