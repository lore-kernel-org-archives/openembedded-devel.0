Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7772C4167B
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 14:51:32 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.14434.1699973491007496390
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 06:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V/JqWg4+;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-32dc918d454so3403575f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 06:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699973489; x=1700578289; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dgYmM5wvDWL0E+5fhONtBu9eMHifns725xx88/xwfIs=;
        b=V/JqWg4+sfha8HxWcYqcREeWkCMlGmeWRYUcmNAh9hggzkuiKvmyvzmwskiGzWQgFM
         5/LIjdKal/MLKq5CsqK0euefg2msyYZBZxs2/ogpQhiQdeUMCmqoc8q80vhHEwx35AK2
         KZVYmpZoOFd/XCWWn4elksncyzDc2LxmvoKOg0mFnD7se5DD4811ppmXgkHAJCrdu0kN
         9Cqepk/yAvgSWegvKkEq9S9sne2xF5RTNmG75jXPZSbJCLHI5WjtQG7m/9EUD6YXbAZe
         0BoKAnrd6b3HHbuuhxYAnSMMrEapJ6mNWHI3EUeZea5H4+hykj3O20l9jI6VBB9gq1AW
         j3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699973489; x=1700578289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgYmM5wvDWL0E+5fhONtBu9eMHifns725xx88/xwfIs=;
        b=DcLrxWC96kdgrQJQ6Btmp64GcsN2ykQa/C0FpglJPi2+0wkGbaHsRFVmtWJ6aTbrpC
         gPE/Z3Pjo+jgOYfBSp55XmBElFY57WVK8YC2j/hSMUNwGRiXOeN37SAuztqJTE8+DgOh
         iOSRFFw7pbOwx3XDUinwSCjgNEvYgqUbEKIo/dE+cjJGvNnGrylgXzA5aVSEkQUaRlp0
         UUhRPZyIusHIJ1eVy8excdW83p6T+HtxrwnwRs7RJf/4WR7hzjLRctFuZIUHgTOV0skw
         qQF7ZIJjGn2S1w48nwAVW4cCJyA3I9ZWeLdfxFngpgOp3NOGYOH+ZwUnT+EPX5zh838O
         NoYQ==
X-Gm-Message-State: AOJu0Ywfry5zWl/YihJ3eYiAOyd4MGMcmmHKhzPEegvDy5mPfd2Isrvv
	AYbmQMGNDi1Zo+F3TcBDW7mC51i1pjIpHx4i0k0=
X-Google-Smtp-Source: AGHT+IHKWhnUKKcrLov+xxoNmf/ovjfs5IGoP/Vt1nwd0bPrd6GAmmRQneXCK0U5JTCYk+EADryEfnqbO8d1/C7WjXQ=
X-Received: by 2002:adf:a3da:0:b0:32f:7db1:22fb with SMTP id
 m26-20020adfa3da000000b0032f7db122fbmr6291776wrb.28.1699973489010; Tue, 14
 Nov 2023 06:51:29 -0800 (PST)
MIME-Version: 1.0
References: <20231112131355.189550-1-alperyasinak1@gmail.com> <169990043623.4418.7053029550355734291.b4-ty@gmail.com>
In-Reply-To: <169990043623.4418.7053029550355734291.b4-ty@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Nov 2023 15:51:17 +0100
Message-ID: <CA+chaQeKBdDYo+mJ_Xs=4wXMk33uwaLFJDv2jkmB7xzX7j4LJQ@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] libebml: upgrade 1.3.0 -> 1.4.4
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	alperak <alperyasinak1@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f0b77b060a1deb47"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 14:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106718

--000000000000f0b77b060a1deb47
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This seems to break gerbera build (I haven't looked further, just noticed
this as new failure in world builds):

FAILED: gerbera
: &&
TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-native/=
usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++
--sysroot=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sys=
root
-m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-=
strong
 -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-secu=
rity
-Werror=3Dreturn-type
 --sysroot=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sy=
sroot
 -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map
 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
git=3D/usr/src/debug/gerbera/1.12.1-r0
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
git=3D/usr/src/debug/gerbera/1.12.1-r0
 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
build=3D/usr/src/debug/gerbera/1.12.1-r0
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
build=3D/usr/src/debug/gerbera/1.12.1-r0
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
recipe-sysroot=3D
 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
recipe-sysroot=3D
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
recipe-sysroot-native=3D
 -fvisibility-inlines-hidden  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
-mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat
-Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type
 --sysroot=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sy=
sroot
 -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map
 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
git=3D/usr/src/debug/gerbera/1.12.1-r0
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
git=3D/usr/src/debug/gerbera/1.12.1-r0
 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
build=3D/usr/src/debug/gerbera/1.12.1-r0
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
build=3D/usr/src/debug/gerbera/1.12.1-r0
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
recipe-sysroot=3D
 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
recipe-sysroot=3D
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
recipe-sysroot-native=3D
 -fvisibility-inlines-hidden  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-neede=
d
-fcanon-prefix-map
 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
git=3D/usr/src/debug/gerbera/1.12.1-r0
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
git=3D/usr/src/debug/gerbera/1.12.1-r0
 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
build=3D/usr/src/debug/gerbera/1.12.1-r0
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
build=3D/usr/src/debug/gerbera/1.12.1-r0
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
recipe-sysroot=3D
 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
recipe-sysroot=3D
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
recipe-sysroot-native=3D
 -Wl,-z,relro,-z,now -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
-fcanon-prefix-map
 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
git=3D/usr/src/debug/gerbera/1.12.1-r0
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
git=3D/usr/src/debug/gerbera/1.12.1-r0
 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
build=3D/usr/src/debug/gerbera/1.12.1-r0
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
build=3D/usr/src/debug/gerbera/1.12.1-r0
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
recipe-sysroot=3D
 -fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
recipe-sysroot=3D
 -fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/=
recipe-sysroot-native=3D
 -Wl,-z,relro,-z,now CMakeFiles/gerbera.dir/src/main.cc.o -o gerbera
 liblibgerbera.a  -latomic
 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/li=
b/libuuid.so
 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/li=
b/libupnp.so
 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/li=
b/libixml.so
 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/li=
b/libspdlog.so.1.12.0
 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/li=
b/libfmt.so.10.1.0
 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/li=
b/libpugixml.so
 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/li=
b/libsqlite3.so
 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/li=
b/libnsl.so
 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/li=
b/libcurl.so
 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/li=
b/libebml.a
 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/li=
b/libmatroska.a
 TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/li=
b/libz.so
&& :
TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-native/=
usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/1=
3.2.0/ld:
TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib=
/libmatroska.a(KaxBlockData.cpp.o):
warning: relocation against `_ZTVN7libebml12EbmlSIntegerE' in read-only
section `.text'
TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-native/=
usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/1=
3.2.0/ld:
TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib=
/libmatroska.a(KaxSemantic.cpp.o):
in function `libmatroska::KaxReferenceVirtual::KaxReferenceVirtual()':
/usr/src/debug/libmatroska/1.7.1-r0/src/KaxSemantic.cpp:174:(.text+0xda5):
undefined reference to `libebml::EbmlSInteger::EbmlSInteger()'
TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-native/=
usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/1=
3.2.0/ld:
TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib=
/libmatroska.a(KaxSemantic.cpp.o):
in function `libmatroska::KaxDiscardPadding::KaxDiscardPadding()':
/usr/src/debug/libmatroska/1.7.1-r0/src/KaxSemantic.cpp:176:(.text+0xde5):
undefined reference to `libebml::EbmlSInteger::EbmlSInteger()'
TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-native/=
usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/1=
3.2.0/ld:
TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib=
/libmatroska.a(KaxSemantic.cpp.o):
in function `libmatroska::KaxTrackOffset::KaxTrackOffset()':
/usr/src/debug/libmatroska/1.7.1-r0/src/KaxSemantic.cpp:280:(.text+0x11e7):
undefined reference to `libebml::EbmlSInteger::EbmlSInteger(long)'
TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-native/=
usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/1=
3.2.0/ld:
TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib=
/libmatroska.a(KaxSemantic.cpp.o):
in function `libebml::EbmlSInteger::~EbmlSInteger()':
/usr/include/ebml/EbmlSInteger.h:54:(.text._ZN11libmatroska17KaxDiscardPadd=
ingD2Ev[_ZN11libmatroska17KaxDiscardPaddingD5Ev]+0x3):
undefined reference to `vtable for libebml::EbmlSInteger'
...

On Mon, Nov 13, 2023 at 7:34=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

>
> On Sun, 12 Nov 2023 16:13:55 +0300, alperak wrote:
> > Changelog:
> >
> > https://github.com/Matroska-Org/libebml/blob/master/NEWS.md
> >
> >
>
> Applied, thanks!
>
> [1/1] libebml: upgrade 1.3.0 -> 1.4.4
>       commit: 7d1a0cd654ecaa68e27e09666744901e21b775a9
>
> Best regards,
> --
> Khem Raj <raj.khem@gmail.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106660):
> https://lists.openembedded.org/g/openembedded-devel/message/106660
> Mute This Topic: https://lists.openembedded.org/mt/102541696/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f0b77b060a1deb47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This seems to break gerbera build (I haven&#39;t looked fu=
rther, just noticed this as new failure in world builds):<div><br></div><di=
v>FAILED: gerbera <br>: &amp;&amp; TOPDIR/BUILD/work/qemux86_64-oe-linux/ge=
rbera/1.12.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-=
g++ --sysroot=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe=
-sysroot -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-p=
rotector-strong =C2=A0-O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security =
-Werror=3Dformat-security -Werror=3Dreturn-type =C2=A0--sysroot=3DTOPDIR/BU=
ILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot =C2=A0-O2 -pipe =
-g -feliminate-unused-debug-types -fcanon-prefix-map =C2=A0-fmacro-prefix-m=
ap=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/git=3D/usr/src/de=
bug/gerbera/1.12.1-r0 =C2=A0-fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_=
64-oe-linux/gerbera/1.12.1/git=3D/usr/src/debug/gerbera/1.12.1-r0 =C2=A0-fm=
acro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/buil=
d=3D/usr/src/debug/gerbera/1.12.1-r0 =C2=A0-fdebug-prefix-map=3DTOPDIR/BUIL=
D/work/qemux86_64-oe-linux/gerbera/1.12.1/build=3D/usr/src/debug/gerbera/1.=
12.1-r0 =C2=A0-fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/ge=
rbera/1.12.1/recipe-sysroot=3D =C2=A0-fmacro-prefix-map=3DTOPDIR/BUILD/work=
/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot=3D =C2=A0-fdebug-prefix-=
map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-n=
ative=3D =C2=A0-fvisibility-inlines-hidden =C2=A0-m64 -march=3Dcore2 -mtune=
=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong =C2=A0-O2 -D_FORTIF=
Y_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -Werror=
=3Dreturn-type =C2=A0--sysroot=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerb=
era/1.12.1/recipe-sysroot =C2=A0-O2 -pipe -g -feliminate-unused-debug-types=
 -fcanon-prefix-map =C2=A0-fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64=
-oe-linux/gerbera/1.12.1/git=3D/usr/src/debug/gerbera/1.12.1-r0 =C2=A0-fdeb=
ug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/git=3D=
/usr/src/debug/gerbera/1.12.1-r0 =C2=A0-fmacro-prefix-map=3DTOPDIR/BUILD/wo=
rk/qemux86_64-oe-linux/gerbera/1.12.1/build=3D/usr/src/debug/gerbera/1.12.1=
-r0 =C2=A0-fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerber=
a/1.12.1/build=3D/usr/src/debug/gerbera/1.12.1-r0 =C2=A0-fdebug-prefix-map=
=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot=3D =
=C2=A0-fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.=
12.1/recipe-sysroot=3D =C2=A0-fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86=
_64-oe-linux/gerbera/1.12.1/recipe-sysroot-native=3D =C2=A0-fvisibility-inl=
ines-hidden =C2=A0-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-pr=
efix-map =C2=A0-fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/g=
erbera/1.12.1/git=3D/usr/src/debug/gerbera/1.12.1-r0 =C2=A0-fdebug-prefix-m=
ap=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/git=3D/usr/src/de=
bug/gerbera/1.12.1-r0 =C2=A0-fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_=
64-oe-linux/gerbera/1.12.1/build=3D/usr/src/debug/gerbera/1.12.1-r0 =C2=A0-=
fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/bu=
ild=3D/usr/src/debug/gerbera/1.12.1-r0 =C2=A0-fdebug-prefix-map=3DTOPDIR/BU=
ILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot=3D =C2=A0-fmacro=
-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-s=
ysroot=3D =C2=A0-fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/=
gerbera/1.12.1/recipe-sysroot-native=3D =C2=A0-Wl,-z,relro,-z,now -Wl,-O1 -=
Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map =C2=A0-fmacro-pref=
ix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/git=3D/usr/sr=
c/debug/gerbera/1.12.1-r0 =C2=A0-fdebug-prefix-map=3DTOPDIR/BUILD/work/qemu=
x86_64-oe-linux/gerbera/1.12.1/git=3D/usr/src/debug/gerbera/1.12.1-r0 =C2=
=A0-fmacro-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.=
1/build=3D/usr/src/debug/gerbera/1.12.1-r0 =C2=A0-fdebug-prefix-map=3DTOPDI=
R/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/build=3D/usr/src/debug/gerb=
era/1.12.1-r0 =C2=A0-fdebug-prefix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-li=
nux/gerbera/1.12.1/recipe-sysroot=3D =C2=A0-fmacro-prefix-map=3DTOPDIR/BUIL=
D/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot=3D =C2=A0-fdebug-p=
refix-map=3DTOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sys=
root-native=3D =C2=A0-Wl,-z,relro,-z,now CMakeFiles/gerbera.dir/src/main.cc=
.o -o gerbera =C2=A0liblibgerbera.a =C2=A0-latomic =C2=A0TOPDIR/BUILD/work/=
qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib/libuuid.so =C2=A0=
TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib=
/libupnp.so =C2=A0TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/reci=
pe-sysroot/usr/lib/libixml.so =C2=A0TOPDIR/BUILD/work/qemux86_64-oe-linux/g=
erbera/1.12.1/recipe-sysroot/usr/lib/libspdlog.so.1.12.0 =C2=A0TOPDIR/BUILD=
/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib/libfmt.so.1=
0.1.0 =C2=A0TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sys=
root/usr/lib/libpugixml.so =C2=A0TOPDIR/BUILD/work/qemux86_64-oe-linux/gerb=
era/1.12.1/recipe-sysroot/usr/lib/libsqlite3.so =C2=A0TOPDIR/BUILD/work/qem=
ux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib/libnsl.so =C2=A0TOPD=
IR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib/lib=
curl.so =C2=A0TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-s=
ysroot/usr/lib/libebml.a =C2=A0TOPDIR/BUILD/work/qemux86_64-oe-linux/gerber=
a/1.12.1/recipe-sysroot/usr/lib/libmatroska.a =C2=A0TOPDIR/BUILD/work/qemux=
86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib/libz.so &amp;&amp; :<b=
r>TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-nativ=
e/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux=
/13.2.0/ld: TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sys=
root/usr/lib/libmatroska.a(KaxBlockData.cpp.o): warning: relocation against=
 `_ZTVN7libebml12EbmlSIntegerE&#39; in read-only section `.text&#39;<br>TOP=
DIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-native/usr=
/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/13.2=
.0/ld: TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/=
usr/lib/libmatroska.a(KaxSemantic.cpp.o): in function `libmatroska::KaxRefe=
renceVirtual::KaxReferenceVirtual()&#39;:<br>/usr/src/debug/libmatroska/1.7=
.1-r0/src/KaxSemantic.cpp:174:(.text+0xda5): undefined reference to `libebm=
l::EbmlSInteger::EbmlSInteger()&#39;<br>TOPDIR/BUILD/work/qemux86_64-oe-lin=
ux/gerbera/1.12.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libex=
ec/x86_64-oe-linux/gcc/x86_64-oe-linux/13.2.0/ld: TOPDIR/BUILD/work/qemux86=
_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib/libmatroska.a(KaxSemanti=
c.cpp.o): in function `libmatroska::KaxDiscardPadding::KaxDiscardPadding()&=
#39;:<br>/usr/src/debug/libmatroska/1.7.1-r0/src/KaxSemantic.cpp:176:(.text=
+0xde5): undefined reference to `libebml::EbmlSInteger::EbmlSInteger()&#39;=
<br>TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-sysroot-nat=
ive/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-lin=
ux/13.2.0/ld: TOPDIR/BUILD/work/qemux86_64-oe-linux/gerbera/1.12.1/recipe-s=
ysroot/usr/lib/libmatroska.a(KaxSemantic.cpp.o): in function `libmatroska::=
KaxTrackOffset::KaxTrackOffset()&#39;:<br>/usr/src/debug/libmatroska/1.7.1-=
r0/src/KaxSemantic.cpp:280:(.text+0x11e7): undefined reference to `libebml:=
:EbmlSInteger::EbmlSInteger(long)&#39;<br>TOPDIR/BUILD/work/qemux86_64-oe-l=
inux/gerbera/1.12.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../lib=
exec/x86_64-oe-linux/gcc/x86_64-oe-linux/13.2.0/ld: TOPDIR/BUILD/work/qemux=
86_64-oe-linux/gerbera/1.12.1/recipe-sysroot/usr/lib/libmatroska.a(KaxSeman=
tic.cpp.o): in function `libebml::EbmlSInteger::~EbmlSInteger()&#39;:<br>/u=
sr/include/ebml/EbmlSInteger.h:54:(.text._ZN11libmatroska17KaxDiscardPaddin=
gD2Ev[_ZN11libmatroska17KaxDiscardPaddingD5Ev]+0x3): undefined reference to=
 `vtable for libebml::EbmlSInteger&#39;<br></div><div>...</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov =
13, 2023 at 7:34=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.c=
om">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><br>
On Sun, 12 Nov 2023 16:13:55 +0300, alperak wrote:<br>
&gt; Changelog:<br>
&gt; <br>
&gt; <a href=3D"https://github.com/Matroska-Org/libebml/blob/master/NEWS.md=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/Matroska-Org/libe=
bml/blob/master/NEWS.md</a><br>
&gt; <br>
&gt; <br>
<br>
Applied, thanks!<br>
<br>
[1/1] libebml: upgrade 1.3.0 -&gt; 1.4.4<br>
=C2=A0 =C2=A0 =C2=A0 commit: 7d1a0cd654ecaa68e27e09666744901e21b775a9<br>
<br>
Best regards,<br>
-- <br>
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#106660): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/106660" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/106660</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102541696/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102541696/3617156</a><br>
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

--000000000000f0b77b060a1deb47--

