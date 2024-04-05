Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE78CD1284
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 06:54:25 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.5410.1712300059631820536
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 23:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CPi6N/TQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6e695b7391dso841198a34.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 23:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712300059; x=1712904859; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRHopMGIHyjLxCnc4xAIIgfrY2gTR3NR0cQoIiHhJQc=;
        b=CPi6N/TQuHRy/mibuPzlvA8oeGXCU8xV4grT/62hv9lLR2Nb4gZSQiYv4shXOk8A39
         LpHyErEWil7BjGAaBNLskwo/xlzvmNbIKE/p6R4PZNwtNhNrBlnpar/UwVjF/Ja4AOXx
         aLzJVhIKsidH+GXlIHW9Zr1vkcIAzDaurvZso4dNeVvUMGWMVP0l+qW8+baoUtervbL3
         7vmnY7ertU7p2ifnD+OigOII/OWpH9StnkULPjDihCCA3TLRpD2BBsc9e9vPrv3Gg6B7
         HdGjWZfk6khQFGKkfCNOXoIkOT+atMT7GSpeYvEAWcFyJtArd6M7kExLopV7N0OZZD9E
         Ztng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712300059; x=1712904859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRHopMGIHyjLxCnc4xAIIgfrY2gTR3NR0cQoIiHhJQc=;
        b=odSLqo1UC1xCnxhY1AzI7MLBJoeXBPSOJIyJXuWNQ8tovUTis8njW0KUZXgupn1k1L
         JDphoRnc4k/G58jkciSrAm2gmvJprJEIU7Xy4EV0RvLxMZjEDBszqcEC08CLh09x3cZ2
         GtCzmLui/EIPccSgDX4hsKP8fnW225CaaOV6v7EOWhPrwJocluvVxg16F6ko8sqyaE4X
         BlrOWjNj5mLabjSN4du+ZBzkzwLifaRRV0HHVeQjA49J8vmQFvq2L3ZuKXeyh67QJ0iS
         8hZJPeGulNLEN9XK2+LRe2AhRDQAqVluQvQedumOGZZlzws8nEwxUXCMaxkPxp//Zs7Q
         7uYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZZSpuAhO+xUZLOzllaRQH7fNXIsBQSKwA6oquWizVHkQvcXKj5W/I2O6vY7P3i/y19/zBnhyMFnJRuCvL6EPQcvKyS1p5X6MSRct1hPy+Z3eGHYEBoT62+A==
X-Gm-Message-State: AOJu0YzUldt3YCDe8ydqYgYGUSb7/GK++GwXymsAFWrGpbWOjDRCJLla
	0FsbsecPh9hTWYKI7J0PaWJyAkhjqIzaE/pG/MTwNajBeGv8PaTve3LcoBrrJWcf3zT3FmqyDm9
	EbJ0AcwnbWBL4vPkd0KmI0mTF0k4=
X-Google-Smtp-Source: AGHT+IFD8Iz+bmQbkeZznUpZpq8Ywfac1x3bHGuwzqU8s4+jB7uTSWkfbbDnatrTE5D41+xwhjdfUNMTgbLDUynfurA=
X-Received: by 2002:a05:6870:1296:b0:22e:8ed:9f7a with SMTP id
 22-20020a056870129600b0022e08ed9f7amr582476oal.4.1712300058663; Thu, 04 Apr
 2024 23:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240402054947.10487-1-f_l_k@t-online.de> <CA+chaQe_3orTvmZcOJ1f0zaVSs4rPa0ySFZimpbfpiBKvitLgg@mail.gmail.com>
In-Reply-To: <CA+chaQe_3orTvmZcOJ1f0zaVSs4rPa0ySFZimpbfpiBKvitLgg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Apr 2024 23:53:51 -0700
Message-ID: <CAMKF1soi03XeFUaRw21Sbyt_BOwZ0zJ2MtVYQw4v=6Z8f07d_w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] libjxl: add recipe
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 06:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109814

On Thu, Apr 4, 2024 at 10:55=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> I'm seeing build failure in 32bit arm builds (with multilib):
>
> lib32-libjxl/0.10.2/recipe-sysroot-native/usr/lib/arm-oemllib32-linux-gnu=
eabi/gcc/arm-oemllib32-linux-gnueabi/13.2.0/include/arm_neon.h:7526:1:
> error: inlining failed in call to 'always_inline' 'float32x4_t
> vcvt_f32_f16(float16x4_t)': target specific option mismatch
>  7526 | vcvt_f32_f16 (float16x4_t __a)
>       | ^~~~~~~~~~~~
> In file included from
> TOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-libjxl/0.10.2/git/th=
ird_party/skcms/skcms.cc:2315:
> TOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-libjxl/0.10.2/git/th=
ird_party/skcms/src/Transform_inl.h:155:24:
> note: called from here
>   155 |     return vcvt_f32_f16((float16x4_t)half);
>       |            ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
>
> should I try to reproduce on some publicly available arm MACHINE (like
> qemuarm) or is someone else seeing this as well?

This is not seen at least in my CI jobs even for qemuarm but then it
was with clang
so it will be good to reproduce it with gcc/qemuarm perhaps. btw what is yo=
ur
32bit multilib defaultltune in this failing case

>
> On Tue, Apr 2, 2024 at 7:50=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wr=
ote:
> >
> > Import this recipe from meta-wayland, because it is a prerequisite
> > for the Gnome desktop. The recently updated gnome-backgrounds package
> > has converted most of the backgrounds to jxl and to keep them usable
> > the gdk-pixbuf-loader for jpegxl must be provided. This is included
> > in the libjxl package itself.
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  .../libjxl/libjxl_2.10.0.bb                   | 42 +++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >  create mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
> >
> > diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb b/meta-=
oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
> > new file mode 100644
> > index 000000000..0c4f79fdb
> > --- /dev/null
> > +++ b/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
> > @@ -0,0 +1,42 @@
> > +SUMMARY =3D "Reference implementation of JPEG XL (encoder and decoder)=
"
> > +HOMEPAGE =3D "https://github.com/libjxl/libjxl/"
> > +
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6a905a337cc228a1f68f0b5416f=
52a7f"
> > +
> > +inherit cmake pkgconfig mime
> > +
> > +DEPENDS =3D "highway brotli"
> > +
> > +SRC_URI =3D "gitsm://github.com/libjxl/libjxl.git;protocol=3Dhttps;nob=
ranch=3D1"
> > +
> > +SRCREV =3D "e1489592a770b989303b0edc5cc1dc447bbe0515"
> > +S =3D "${WORKDIR}/git"
> > +
> > +EXTRA_OECMAKE =3D " \
> > +       -DCMAKE_BUILD_TYPE=3DRelease \
> > +       -DJPEGXL_ENABLE_PLUGINS=3DON \
> > +       -DBUILD_TESTING=3DOFF \
> > +       -DJPEGXL_WARNINGS_AS_ERRORS=3DOFF \
> > +       -DJPEGXL_ENABLE_SIZELESS_VECTORS=3DON \
> > +       -DJPEGXL_ENABLE_SJPEG=3DOFF \
> > +       -DJPEGXL_ENABLE_BENCHMARK=3DOFF \
> > +       -DJPEGXL_ENABLE_EXAMPLES=3DOFF \
> > +       -DJPEGXL_ENABLE_MANPAGES=3DOFF \
> > +       -DJPEGXL_ENABLE_SKCMS=3DON \
> > +       -DJPEGXL_FORCE_SYSTEM_BROTLI=3DON \
> > +       -DJPEGXL_FORCE_SYSTEM_HWY=3DON \
> > +       -DJPEGXL_ENABLE_JNI=3DOFF \
> > +       -DJPEGXL_ENABLE_TCMALLOC=3DOFF \
> > +       -DJPEGXL_ENABLE_TOOLS=3DOFF \
> > +"
> > +
> > +PACKAGECONFIG ?=3D "mime gdk-pixbuf-loader"
> > +PACKAGECONFIG[gdk-pixbuf-loader] =3D "-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=
=3DON,-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=3DOFF,gdk-pixbuf"
> > +PACKAGECONFIG[gimp] =3D "-DJPEGXL_ENABLE_PLUGIN_GIMP210=3DON,-DJPEGXL_=
ENABLE_PLUGIN_GIMP210=3DOFF,gimp"
> > +PACKAGECONFIG[mime] =3D "-DJPEGXL_ENABLE_PLUGIN_MIME=3DON,-DJPEGXL_ENA=
BLE_PLUGIN_MIME=3DOFF"
> > +
> > +FILES:${PN} +=3D "${libdir}/gdk-pixbuf-2.0 ${datadir}"
> > +
> > +CXXFLAGS:append:arm =3D " -mfp16-format=3Dieee"
> > +
> > --
> > 2.44.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109812): https://lists.openembedded.org/g/openembedde=
d-devel/message/109812
> Mute This Topic: https://lists.openembedded.org/mt/105282918/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

