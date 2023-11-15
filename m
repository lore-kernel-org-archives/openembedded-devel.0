Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08721C47074
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 10:21:59 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.10189.1700043712790041244
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 02:21:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jWlj7P/6;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32fdd0774d9so4115437f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 02:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700043711; x=1700648511; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J1kuxKu7w0jHXa8k6B8iSG4gTnocJqpb3Dy0gD+2+wI=;
        b=jWlj7P/6EiR4QrLQ9zgcjzzrOcQV9CgEi/arO6/fAY8kPgWZmtiOqLfzDEivD+/Sop
         cd8+NMaJrPkMk+jUoy/CWOAg7N52fY0xItAf4zrYzWzstOwJDwx593eShh2NkuHDE0Qc
         gGKDBzyfXDpIBSvunalezYnr3ytVz19ftKPPoBI8rHHqjXkI5/pyOi/AxcapyaP0pKVJ
         M5vL3aatN58NZ6SzJQn5rTpAxBfIvQBvM7EaeZMCiUDSTkQ5pYLZQ7BsZfcM6X+k3LWe
         LveweWVxvBJV6z63a0hTNIfnpf3g4Z5icmjaVLlxKZ9xtoxepHc+ZhkeeD0lIAB98RtX
         Rf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700043711; x=1700648511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1kuxKu7w0jHXa8k6B8iSG4gTnocJqpb3Dy0gD+2+wI=;
        b=WH7RmFUcVD7BikYKhgBqWrByvPXHI77y7nuIcblOpBjpJprGKnlOlSU0cXzv2PskQ3
         IcUugM27LpsY1OgJ34gjnNVPBNbmVNSC4b5YQFuE10risPnBM7ahGC2uOQFGvczj+NmS
         lYfqs/duGB1Bixx2kbVYY2ByvqICWRsv2xxty1PzkH8g/1Eoko4MFdZZWxVNBTu3UYPH
         992a5yMfmMX1hex2tiJSrEsqgFh4amYUZwGqiGSX+NJ91OitsdZhxQ6/iBB2TcbFGymt
         qy8EkFhqDuDQGdR2vlZN0wcvY4w0WFVApkHovvJq4Gp8tZcfz6Ec1Z4MsJNq73N2xheg
         syew==
X-Gm-Message-State: AOJu0YyNyQBzIqiuq1lwVVh0u5ezESbgrMB4tAwero5WHlMKOimzSOYx
	BcfNRKYcApw4GtgqmEsuMFODSNVpuklNFmD9QM0=
X-Google-Smtp-Source: AGHT+IGtbiMD6ofHcMeScKbZ0d3qgfnVY9Whv1L3vAlWJLAFJJ9qZvgewEj3Mx4p64tYbyqF7qW9qmgOOIpgkIF5y4s=
X-Received: by 2002:adf:fdcd:0:b0:32d:8982:ff1c with SMTP id
 i13-20020adffdcd000000b0032d8982ff1cmr8060158wrs.36.1700043710812; Wed, 15
 Nov 2023 02:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20231112131355.189550-1-alperyasinak1@gmail.com>
 <169990043623.4418.7053029550355734291.b4-ty@gmail.com> <CA+chaQeKBdDYo+mJ_Xs=4wXMk33uwaLFJDv2jkmB7xzX7j4LJQ@mail.gmail.com>
 <CAMKF1spaQa4EXBVqVmNUTfzW7D1Vwi7UOTX3Q1eDKjXh0fXL1w@mail.gmail.com>
In-Reply-To: <CAMKF1spaQa4EXBVqVmNUTfzW7D1Vwi7UOTX3Q1eDKjXh0fXL1w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Nov 2023 11:21:37 +0100
Message-ID: <CA+chaQfoVmHQu_b6VajBdgVWkPvyQ_JCbaVQ-P2grWwmaSGhCQ@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] libebml: upgrade 1.3.0 -> 1.4.4
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	alperak <alperyasinak1@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007c5a12060a2e45f0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 10:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106750

--0000000000007c5a12060a2e45f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Full log with nodistro build:
http://errors.yoctoproject.org/Errors/Details/742478/

if I revert this libebml upgrade and libmatroska upgrade (which depends on
newer libebml), then gerbera builds again.

On Tue, Nov 14, 2023 at 7:37=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> interesting, did not fail for yoe CI world build, but then it uses
> clang and here I see you are using g++ so maybe something to look
> into. Thanks for report.
>
> On Tue, Nov 14, 2023 at 6:51=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com>
> wrote:
> >
> > This seems to break gerbera build (I haven't looked further, just
> noticed this as new failure in world builds):
> >
> > FAILED: gerbera
> > : &&
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-nativ=
e/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++
> --sysroot=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-s=
ysroot
> -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse
> -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat
> -Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type
> --sysroot=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-s=
ysroot
> -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/git=3D/usr/src/debug/gerbera/1.12.1-r0
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/git=3D/usr/src/debug/gerbera/1.12.1-r0
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/build=3D/usr/src/debug/gerbera/1.12.1-r0
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/build=3D/usr/src/debug/gerbera/1.12.1-r0
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/recipe-sysroot=3D
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/recipe-sysroot=3D
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/recipe-sysroot-native=3D
> -fvisibility-inlines-hidden  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
> -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wform=
at
> -Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type
> --sysroot=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-s=
ysroot
> -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/git=3D/usr/src/debug/gerbera/1.12.1-r0
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/git=3D/usr/src/debug/gerbera/1.12.1-r0
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/build=3D/usr/src/debug/gerbera/1.12.1-r0
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/build=3D/usr/src/debug/gerbera/1.12.1-r0
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/recipe-sysroot=3D
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/recipe-sysroot=3D
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/recipe-sysroot-native=3D
> -fvisibility-inlines-hidden  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-need=
ed
> -fcanon-prefix-map
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/git=3D/usr/src/debug/gerbera/1.12.1-r0
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/git=3D/usr/src/debug/gerbera/1.12.1-r0
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/build=3D/usr/src/debug/gerbera/1.12.1-r0
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/build=3D/usr/src/debug/gerbera/1.12.1-r0
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/recipe-sysroot=3D
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/recipe-sysroot=3D
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/recipe-sysroot-native=3D
> -Wl,-z,relro,-z,now -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> -fcanon-prefix-map
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/git=3D/usr/src/debug/gerbera/1.12.1-r0
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/git=3D/usr/src/debug/gerbera/1.12.1-r0
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/build=3D/usr/src/debug/gerbera/1.12.1-r0
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/build=3D/usr/src/debug/gerbera/1.12.1-r0
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/recipe-sysroot=3D
> -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/recipe-sysroot=3D
> -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1=
/recipe-sysroot-native=3D
> -Wl,-z,relro,-z,now CMakeFiles/gerbera.dir/src/main.cc.o -o gerbera
> liblibgerbera.a  -latomic
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libuuid.so
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libupnp.so
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libixml.so
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libspdlog.so.1.12.0
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libfmt.so.10.1.0
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libpugixml.so
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libsqlite3.so
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libnsl.so
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libcurl.so
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libebml.a
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libmatroska.a
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libz.so
> && :
> >
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-nativ=
e/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux=
/13.2.0/ld:
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libmatroska.a(KaxBlockData.cpp.o):
> warning: relocation against `_ZTVN7libebml12EbmlSIntegerE' in read-only
> section `.text'
> >
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-nativ=
e/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux=
/13.2.0/ld:
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libmatroska.a(KaxSemantic.cpp.o):
> in function `libmatroska::KaxReferenceVirtual::KaxReferenceVirtual()':
> >
> /usr/src/debug/libmatroska/1.7.1-r0/src/KaxSemantic.cpp:174:(.text+0xda5)=
:
> undefined reference to `libebml::EbmlSInteger::EbmlSInteger()'
> >
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-nativ=
e/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux=
/13.2.0/ld:
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libmatroska.a(KaxSemantic.cpp.o):
> in function `libmatroska::KaxDiscardPadding::KaxDiscardPadding()':
> >
> /usr/src/debug/libmatroska/1.7.1-r0/src/KaxSemantic.cpp:176:(.text+0xde5)=
:
> undefined reference to `libebml::EbmlSInteger::EbmlSInteger()'
> >
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-nativ=
e/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux=
/13.2.0/ld:
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libmatroska.a(KaxSemantic.cpp.o):
> in function `libmatroska::KaxTrackOffset::KaxTrackOffset()':
> >
> /usr/src/debug/libmatroska/1.7.1-r0/src/KaxSemantic.cpp:280:(.text+0x11e7=
):
> undefined reference to `libebml::EbmlSInteger::EbmlSInteger(long)'
> >
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-nativ=
e/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux=
/13.2.0/ld:
> TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/l=
ib/libmatroska.a(KaxSemantic.cpp.o):
> in function `libebml::EbmlSInteger::~EbmlSInteger()':
> >
> /usr/include/ebml/EbmlSInteger.h:54:(.text._ZN11libmatroska17KaxDiscardPa=
ddingD2Ev[_ZN11libmatroska17KaxDiscardPaddingD5Ev]+0x3):
> undefined reference to `vtable for libebml::EbmlSInteger'
> > ...
> >
> > On Mon, Nov 13, 2023 at 7:34=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
> >>
> >>
> >> On Sun, 12 Nov 2023 16:13:55 +0300, alperak wrote:
> >> > Changelog:
> >> >
> >> > https://github.com/Matroska-Org/libebml/blob/master/NEWS.md
> >> >
> >> >
> >>
> >> Applied, thanks!
> >>
> >> [1/1] libebml: upgrade 1.3.0 -> 1.4.4
> >>       commit: 7d1a0cd654ecaa68e27e09666744901e21b775a9
> >>
> >> Best regards,
> >> --
> >> Khem Raj <raj.khem@gmail.com>
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#106660):
> https://lists.openembedded.org/g/openembedded-devel/message/106660
> >> Mute This Topic: https://lists.openembedded.org/mt/102541696/3617156
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [martin.jansa@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--0000000000007c5a12060a2e45f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Full log with nodistro build:<div><a href=3D"http://errors=
.yoctoproject.org/Errors/Details/742478/" target=3D"_blank">http://errors.y=
octoproject.org/Errors/Details/742478/</a><br></div><div><br></div><div>if =
I revert this libebml upgrade and libmatroska upgrade (which depends on new=
er libebml), then gerbera builds again.</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 14, 2023 at 7:37=
=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">interesting, did not fail for yoe CI world build, b=
ut then it uses<br>
clang and here I see you are using g++ so maybe something to look<br>
into. Thanks for report.<br>
<br>
On Tue, Nov 14, 2023 at 6:51=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:=
martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; This seems to break gerbera build (I haven&#39;t looked further, just =
noticed this as new failure in world builds):<br>
&gt;<br>
&gt; FAILED: gerbera<br>
&gt; : &amp;&amp; TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/reci=
pe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++ --sysroot=3DT=
OPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot -m64 -ma=
rch=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong=
=C2=A0 -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dforma=
t-security -Werror=3Dreturn-type=C2=A0 --sysroot=3DTOPDIR/BUILD/work/qemux8=
6_64-oe-linux/gerbera/1.12.1/recipe-sysroot=C2=A0 -O2 -pipe -g -feliminate-=
unused-debug-types -fcanon-prefix-map=C2=A0 -fmacro-prefix-map=3DTOPDIR/BUI=
LD/work/qemux86_64-oe-linux/gerbera/1.12.1/git=3D/usr/src/debug/gerbera/1.1=
2.1-r0=C2=A0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/ger=
bera/1.12.1/git=3D/usr/src/debug/gerbera/1.12.1-r0=C2=A0 -fmacro-prefix-map=
=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/build=3D/usr/src/de=
bug/gerbera/1.12.1-r0=C2=A0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_=
64-oe-linux/gerbera/1.12.1/build=3D/usr/src/debug/gerbera/1.12.1-r0=C2=A0 -=
fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/re=
cipe-sysroot=3D=C2=A0 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-=
linux/gerbera/1.12.1/recipe-sysroot=3D=C2=A0 -fdebug-prefix-map=3DTOPDIR/BU=
ILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-native=3D=C2=A0 =
-fvisibility-inlines-hidden=C2=A0 -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3=
 -mfpmath=3Dsse -fstack-protector-strong=C2=A0 -O2 -D_FORTIFY_SOURCE=3D2 -W=
format -Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type=C2=
=A0 --sysroot=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe=
-sysroot=C2=A0 -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-m=
ap=C2=A0 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera=
/1.12.1/git=3D/usr/src/debug/gerbera/1.12.1-r0=C2=A0 -fdebug-prefix-map=3DT=
OPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/git=3D/usr/src/debug/ge=
rbera/1.12.1-r0=C2=A0 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-=
linux/gerbera/1.12.1/build=3D/usr/src/debug/gerbera/1.12.1-r0=C2=A0 -fdebug=
-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/build=3D=
/usr/src/debug/gerbera/1.12.1-r0=C2=A0 -fdebug-prefix-map=3DTOPDIR/BUILD/wo=
rk/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot=3D=C2=A0 -fmacro-prefi=
x-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot=
=3D=C2=A0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerber=
a/1.12.1/recipe-sysroot-native=3D=C2=A0 -fvisibility-inlines-hidden=C2=A0 -=
Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map=C2=A0 -fma=
cro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/git=
=3D/usr/src/debug/gerbera/1.12.1-r0=C2=A0 -fdebug-prefix-map=3DTOPDIR/BUILD=
/work/qemux86_64-oe-linux/gerbera/1.12.1/git=3D/usr/src/debug/gerbera/1.12.=
1-r0=C2=A0 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbe=
ra/1.12.1/build=3D/usr/src/debug/gerbera/1.12.1-r0=C2=A0 -fdebug-prefix-map=
=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/build=3D/usr/src/de=
bug/gerbera/1.12.1-r0=C2=A0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_=
64-oe-linux/gerbera/1.12.1/recipe-sysroot=3D=C2=A0 -fmacro-prefix-map=3DTOP=
DIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot=3D=C2=A0 -=
fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/re=
cipe-sysroot-native=3D=C2=A0 -Wl,-z,relro,-z,now -Wl,-O1 -Wl,--hash-style=
=3Dgnu -Wl,--as-needed -fcanon-prefix-map=C2=A0 -fmacro-prefix-map=3DTOPDIR=
/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/git=3D/usr/src/debug/gerbera=
/1.12.1-r0=C2=A0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux=
/gerbera/1.12.1/git=3D/usr/src/debug/gerbera/1.12.1-r0=C2=A0 -fmacro-prefix=
-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/build=3D/usr/sr=
c/debug/gerbera/1.12.1-r0=C2=A0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemu=
x86_64-oe-linux/gerbera/1.12.1/build=3D/usr/src/debug/gerbera/1.12.1-r0=C2=
=A0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12=
.1/recipe-sysroot=3D=C2=A0 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_6=
4-oe-linux/gerbera/1.12.1/recipe-sysroot=3D=C2=A0 -fdebug-prefix-map=3DTOPD=
IR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-native=3D=
=C2=A0 -Wl,-z,relro,-z,now CMakeFiles/gerbera.dir/src/main.cc.o -o gerbera=
=C2=A0 liblibgerbera.a=C2=A0 -latomic=C2=A0 TOPDIR/BUILD/work/qemux86_64-oe=
-linux/gerbera/1.12.1/recipe-sysroot/usr/lib/libuuid.so=C2=A0 TOPDIR/BUILD/=
work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib/libupnp.so=
=C2=A0 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/=
usr/lib/libixml.so=C2=A0 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12=
.1/recipe-sysroot/usr/lib/libspdlog.so.1.12.0=C2=A0 TOPDIR/BUILD/work/qemux=
86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib/libfmt.so.10.1.0=C2=A0=
 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/li=
b/libpugixml.so=C2=A0 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
recipe-sysroot/usr/lib/libsqlite3.so=C2=A0 TOPDIR/BUILD/work/qemux86_64-oe-=
linux/gerbera/1.12.1/recipe-sysroot/usr/lib/libnsl.so=C2=A0 TOPDIR/BUILD/wo=
rk/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib/libcurl.so=C2=
=A0 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr=
/lib/libebml.a=C2=A0 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/r=
ecipe-sysroot/usr/lib/libmatroska.a=C2=A0 TOPDIR/BUILD/work/qemux86_64-oe-l=
inux/gerbera/1.12.1/recipe-sysroot/usr/lib/libz.so &amp;&amp; :<br>
&gt; TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-na=
tive/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-li=
nux/13.2.0/ld: TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-=
sysroot/usr/lib/libmatroska.a(KaxBlockData.cpp.o): warning: relocation agai=
nst `_ZTVN7libebml12EbmlSIntegerE&#39; in read-only section `.text&#39;<br>
&gt; TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-na=
tive/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-li=
nux/13.2.0/ld: TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-=
sysroot/usr/lib/libmatroska.a(KaxSemantic.cpp.o): in function `libmatroska:=
:KaxReferenceVirtual::KaxReferenceVirtual()&#39;:<br>
&gt; /usr/src/debug/libmatroska/1.7.1-r0/src/KaxSemantic.cpp:174:(.text+0xd=
a5): undefined reference to `libebml::EbmlSInteger::EbmlSInteger()&#39;<br>
&gt; TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-na=
tive/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-li=
nux/13.2.0/ld: TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-=
sysroot/usr/lib/libmatroska.a(KaxSemantic.cpp.o): in function `libmatroska:=
:KaxDiscardPadding::KaxDiscardPadding()&#39;:<br>
&gt; /usr/src/debug/libmatroska/1.7.1-r0/src/KaxSemantic.cpp:176:(.text+0xd=
e5): undefined reference to `libebml::EbmlSInteger::EbmlSInteger()&#39;<br>
&gt; TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-na=
tive/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-li=
nux/13.2.0/ld: TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-=
sysroot/usr/lib/libmatroska.a(KaxSemantic.cpp.o): in function `libmatroska:=
:KaxTrackOffset::KaxTrackOffset()&#39;:<br>
&gt; /usr/src/debug/libmatroska/1.7.1-r0/src/KaxSemantic.cpp:280:(.text+0x1=
1e7): undefined reference to `libebml::EbmlSInteger::EbmlSInteger(long)&#39=
;<br>
&gt; TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-na=
tive/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-li=
nux/13.2.0/ld: TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-=
sysroot/usr/lib/libmatroska.a(KaxSemantic.cpp.o): in function `libebml::Ebm=
lSInteger::~EbmlSInteger()&#39;:<br>
&gt; /usr/include/ebml/EbmlSInteger.h:54:(.text._ZN11libmatroska17KaxDiscar=
dPaddingD2Ev[_ZN11libmatroska17KaxDiscardPaddingD5Ev]+0x3): undefined refer=
ence to `vtable for libebml::EbmlSInteger&#39;<br>
&gt; ...<br>
&gt;<br>
&gt; On Mon, Nov 13, 2023 at 7:34=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Sun, 12 Nov 2023 16:13:55 +0300, alperak wrote:<br>
&gt;&gt; &gt; Changelog:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"https://github.com/Matroska-Org/libebml/blob/maste=
r/NEWS.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/Matroska=
-Org/libebml/blob/master/NEWS.md</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; Applied, thanks!<br>
&gt;&gt;<br>
&gt;&gt; [1/1] libebml: upgrade 1.3.0 -&gt; 1.4.4<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0commit: 7d1a0cd654ecaa68e27e09666744901e=
21b775a9<br>
&gt;&gt;<br>
&gt;&gt; Best regards,<br>
&gt;&gt; --<br>
&gt;&gt; Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blan=
k">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#106660): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/106660" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/106660</a><=
br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1025=
41696/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/102541696/3617156</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedd=
ed.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gm=
ail.com" target=3D"_blank">martin.jansa@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div>

--0000000000007c5a12060a2e45f0--

