Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDC9CD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 06:56:15 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.5424.1712300165839677426
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 23:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lUdY18Hd;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516d3776334so602853e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 23:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712300164; x=1712904964; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4cDb4UksJZNcGTPzXeQ/Cr9E9l77dDlA4l8xlOvQuw=;
        b=lUdY18Hd/iaWTm/txtocqR9mtR2l9ffD3zhTyy1Tqr92I6et/sPoAiQ8Qkl3K6+/mY
         +4JdpE0M90589inUEqRymbOcU8o166qrc5GpQ/PnXc7Jf1H9Qn+u9Xt7MSWrdDV4npWP
         zYy2ug6u8rLrTqiWG6ZA2yV9CTP7og9FuFmy6fDM2ff9S2oS6+rvt5XIOYEiCnNW0lxm
         HYOVscyrrQbcMiNdBvcVHBAie4RLG9wHp0RiRNitEI+86xEku9q46UbtZUcZ0sYiklEf
         p2XiomBH0eSoOuyDdVz2B/q/waPv7ZyjrA4NyFp2UzYv8XJ/Rg4BjLWdz9KGrwaLJccy
         n9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712300164; x=1712904964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4cDb4UksJZNcGTPzXeQ/Cr9E9l77dDlA4l8xlOvQuw=;
        b=nXwIcG3MiWwIgX8kVS8c+GajeGrocn/0pTkY+ovdBTteihfO0toNOkIjHSAuWxN1zl
         dyCetNs2ttJRBNinqYPNhrnn1n+ppLL3vhFVMZgaTVCNaDi8nTLmNP8k0CaT3jLN7l/v
         5Efsp4J5pko9jYvu1nlFVM4f1eb7M2cv7pjJeCWG9pILD1IbN/EQ8SQpGSnSi616V7xA
         EQISfOSiV6AlZqgTE+sAcVXyCILlPa2C1IqL+YCLYL0tZVt2wgmgf7FNi9zNgOwFXraY
         G9Ngf5+RPj+5MNWJCMSw0A+Yr2oJGs1Y4KBlgtYz4vStfNC2fsM2GO+sdTX5pcBYYKkJ
         06aA==
X-Forwarded-Encrypted: i=1; AJvYcCVU1DsUCWnViDP5kJVqJAmjA+j1GR+0SbNvgJI1OTin0NvYPniEbTFmqxIzgfGaE28ZknWngJ9rn/MGyuHf8FZJ1WUwbZG2kQ7ImnKFI4eQzCZNWlqP1mpNbQ==
X-Gm-Message-State: AOJu0YzMwU/PID+eAg79y23nsMcNByFC79v/2NEc7jzcNtSHNJc8KZPs
	XrDL8uCSZnKcs98K4RD0wjbnBGvbsAjPIAO5s0B1i0+aENO4VSAR/CQ/8fshz8flNpo+z9nLgwV
	i723kMV7lleovizo8LwEUJ9gnbIc=
X-Google-Smtp-Source: AGHT+IFopnXqZrnHn5QUSAOXpztF68hSFrbcJNrTfQuc98DXjmKnIIMXDte+JO81qzOWvbgClPcosXTntktZV1W6DsQ=
X-Received: by 2002:a05:6512:3e17:b0:516:cc31:dbf0 with SMTP id
 i23-20020a0565123e1700b00516cc31dbf0mr569517lfv.17.1712300163758; Thu, 04 Apr
 2024 23:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240402054947.10487-1-f_l_k@t-online.de> <CA+chaQe_3orTvmZcOJ1f0zaVSs4rPa0ySFZimpbfpiBKvitLgg@mail.gmail.com>
 <CAMKF1soi03XeFUaRw21Sbyt_BOwZ0zJ2MtVYQw4v=6Z8f07d_w@mail.gmail.com>
In-Reply-To: <CAMKF1soi03XeFUaRw21Sbyt_BOwZ0zJ2MtVYQw4v=6Z8f07d_w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 5 Apr 2024 08:55:43 +0200
Message-ID: <CA+chaQdio7TrBL97WKDbztR3LRnkFG9Zkzc4JcM3gX5gOEnHCA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] libjxl: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 06:56:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109815

> btw what is your 32bit multilib defaultltune in this failing case

none of the public ones, that's why I wanted to reproduce it with
generic qemuarm first, will trigger the build and report back

On Fri, Apr 5, 2024 at 8:54=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Apr 4, 2024 at 10:55=E2=80=AFPM Martin Jansa <martin.jansa@gmail.=
com> wrote:
> >
> > I'm seeing build failure in 32bit arm builds (with multilib):
> >
> > lib32-libjxl/0.10.2/recipe-sysroot-native/usr/lib/arm-oemllib32-linux-g=
nueabi/gcc/arm-oemllib32-linux-gnueabi/13.2.0/include/arm_neon.h:7526:1:
> > error: inlining failed in call to 'always_inline' 'float32x4_t
> > vcvt_f32_f16(float16x4_t)': target specific option mismatch
> >  7526 | vcvt_f32_f16 (float16x4_t __a)
> >       | ^~~~~~~~~~~~
> > In file included from
> > TOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-libjxl/0.10.2/git/=
third_party/skcms/skcms.cc:2315:
> > TOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-libjxl/0.10.2/git/=
third_party/skcms/src/Transform_inl.h:155:24:
> > note: called from here
> >   155 |     return vcvt_f32_f16((float16x4_t)half);
> >       |            ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
> >
> > should I try to reproduce on some publicly available arm MACHINE (like
> > qemuarm) or is someone else seeing this as well?
>
> This is not seen at least in my CI jobs even for qemuarm but then it
> was with clang
> so it will be good to reproduce it with gcc/qemuarm perhaps. btw what is =
your
> 32bit multilib defaultltune in this failing case
>
> >
> > On Tue, Apr 2, 2024 at 7:50=E2=80=AFAM Markus Volk <f_l_k@t-online.de> =
wrote:
> > >
> > > Import this recipe from meta-wayland, because it is a prerequisite
> > > for the Gnome desktop. The recently updated gnome-backgrounds package
> > > has converted most of the backgrounds to jxl and to keep them usable
> > > the gdk-pixbuf-loader for jpegxl must be provided. This is included
> > > in the libjxl package itself.
> > >
> > > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > > ---
> > >  .../libjxl/libjxl_2.10.0.bb                   | 42 +++++++++++++++++=
++
> > >  1 file changed, 42 insertions(+)
> > >  create mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.b=
b
> > >
> > > diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb b/met=
a-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
> > > new file mode 100644
> > > index 000000000..0c4f79fdb
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
> > > @@ -0,0 +1,42 @@
> > > +SUMMARY =3D "Reference implementation of JPEG XL (encoder and decode=
r)"
> > > +HOMEPAGE =3D "https://github.com/libjxl/libjxl/"
> > > +
> > > +LICENSE =3D "BSD-3-Clause"
> > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6a905a337cc228a1f68f0b541=
6f52a7f"
> > > +
> > > +inherit cmake pkgconfig mime
> > > +
> > > +DEPENDS =3D "highway brotli"
> > > +
> > > +SRC_URI =3D "gitsm://github.com/libjxl/libjxl.git;protocol=3Dhttps;n=
obranch=3D1"
> > > +
> > > +SRCREV =3D "e1489592a770b989303b0edc5cc1dc447bbe0515"
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +EXTRA_OECMAKE =3D " \
> > > +       -DCMAKE_BUILD_TYPE=3DRelease \
> > > +       -DJPEGXL_ENABLE_PLUGINS=3DON \
> > > +       -DBUILD_TESTING=3DOFF \
> > > +       -DJPEGXL_WARNINGS_AS_ERRORS=3DOFF \
> > > +       -DJPEGXL_ENABLE_SIZELESS_VECTORS=3DON \
> > > +       -DJPEGXL_ENABLE_SJPEG=3DOFF \
> > > +       -DJPEGXL_ENABLE_BENCHMARK=3DOFF \
> > > +       -DJPEGXL_ENABLE_EXAMPLES=3DOFF \
> > > +       -DJPEGXL_ENABLE_MANPAGES=3DOFF \
> > > +       -DJPEGXL_ENABLE_SKCMS=3DON \
> > > +       -DJPEGXL_FORCE_SYSTEM_BROTLI=3DON \
> > > +       -DJPEGXL_FORCE_SYSTEM_HWY=3DON \
> > > +       -DJPEGXL_ENABLE_JNI=3DOFF \
> > > +       -DJPEGXL_ENABLE_TCMALLOC=3DOFF \
> > > +       -DJPEGXL_ENABLE_TOOLS=3DOFF \
> > > +"
> > > +
> > > +PACKAGECONFIG ?=3D "mime gdk-pixbuf-loader"
> > > +PACKAGECONFIG[gdk-pixbuf-loader] =3D "-DJPEGXL_ENABLE_PLUGIN_GDKPIXB=
UF=3DON,-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=3DOFF,gdk-pixbuf"
> > > +PACKAGECONFIG[gimp] =3D "-DJPEGXL_ENABLE_PLUGIN_GIMP210=3DON,-DJPEGX=
L_ENABLE_PLUGIN_GIMP210=3DOFF,gimp"
> > > +PACKAGECONFIG[mime] =3D "-DJPEGXL_ENABLE_PLUGIN_MIME=3DON,-DJPEGXL_E=
NABLE_PLUGIN_MIME=3DOFF"
> > > +
> > > +FILES:${PN} +=3D "${libdir}/gdk-pixbuf-2.0 ${datadir}"
> > > +
> > > +CXXFLAGS:append:arm =3D " -mfp16-format=3Dieee"
> > > +
> > > --
> > > 2.44.0
> > >
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#109812): https://lists.openembedded.org/g/openembed=
ded-devel/message/109812
> > Mute This Topic: https://lists.openembedded.org/mt/105282918/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

