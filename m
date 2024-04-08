Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553CCCD128A
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 13:50:52 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.107232.1712584248581958833
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Apr 2024 06:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xaw/fVQL;
 spf=pass (domain: linaro.org, ip: 209.85.219.169, mailfrom: fathi.boudra@linaro.org)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-ddaad2aeab1so3836170276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712584248; x=1713189048; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iF5GOT4Agg6wVP/EjCqAxUXrxVxFZ3BM1EJ7BRMg0K0=;
        b=xaw/fVQLXgi03N8DZa/HqvO81Fb06/JVLxD0MJbQh0YXrOfzydn1rZIGAmkI6y01Il
         4OovRF9xyKbAQIrljeptNehuD9y0pcpMfx1MWXS7kwpelVQD6fcw7J0w2YBiA1fsGeWA
         Lcjx46BAojEXzUlgzx5AQZICTH7l//50+pYSxUwOiXETpqaaY/KJlLTD7UXuZdTTZ1ui
         E7nmINf2pMb8363dLzPgdPWeTkRqbhh2ztKij+B7hf1HVqGYZvOgfZDqrMnNKVbkSyGT
         XMtbXb1UXcdk0SpyWFHyGiuQ07O6Xw6aK/ujqUtDB4JZOS9FB3fZIL6+Nb1gnJR0ZqwR
         Ekvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712584248; x=1713189048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iF5GOT4Agg6wVP/EjCqAxUXrxVxFZ3BM1EJ7BRMg0K0=;
        b=NdHYrHF2yaWPC6p1CGEd4PYCCD4T2TqNuxUMbe+D07Ekb+tyr6+NS6vx5uTIXJQOtb
         sAz7pZGeYboY/bmAni7h/u/ZHBX2N/7rxxQclt2OJUp2RpcvghaovCwwBqeG5qyWp1aA
         DGWnRdwrzjHPjGyppvzG9ueh1q/ek7CbpcGl5R4Lo/N5GHVod6MpANWDk02Ul0iZJ0gg
         1DMcZbcKrOGRDmNRT4rftS21PyAQiZcHx13s2Mtt8NhtcaTYeHCiP2d+emzC2RiVA2pw
         cCPY6nH8QUaPfPWrDOMuNKcuxlkbAyFVIYSgd4G6V4l+QG7IL8cwVVI/+n2SUs0OXCL9
         Le1Q==
X-Gm-Message-State: AOJu0YzyHBF0co01JAyoBqUmLLykNA1MZ0Dr468SJx4nRFvKJKO6Hx3/
	sl9rxu/V/NtIxcsoc6KqImBhDs8v1f9qOQ8rxN66fAivIjciFjRhcvJpn48dGqDJOLuJlSy+XDv
	eubzfsEokKd9h3ktAatpIwt9ioaEuMcDneeylBCdCgcuH0Zg8O6k4Sw==
X-Google-Smtp-Source: AGHT+IGYWOlDv9c/vZuFhFZhYIQrzVtLfprEhGU5fCZKbcLLy9V1sW5XXV+hWRZg2Yz9FbLRm26XvXzm5Pd5ecrvPDw=
X-Received: by 2002:a05:6902:1b01:b0:dc6:bbbd:d4f4 with SMTP id
 eh1-20020a0569021b0100b00dc6bbbdd4f4mr8305008ybb.33.1712584247665; Mon, 08
 Apr 2024 06:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240405162459.1286945-1-fathi.boudra@linaro.org> <CAMKF1soBViCDq1i8+ZS8k32U3rV5Hb4DbqPCXZy-+qeEgaMPtg@mail.gmail.com>
In-Reply-To: <CAMKF1soBViCDq1i8+ZS8k32U3rV5Hb4DbqPCXZy-+qeEgaMPtg@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Mon, 8 Apr 2024 15:50:35 +0200
Message-ID: <CAGNsrLBXGFP01o43JG8DKaLWhV9vr+cJUFaMYr=E9i5=010Cgw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] composefs: add a new recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 13:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109864

Hi Khem,

On Sat, 6 Apr 2024 at 03:04, Khem Raj <raj.khem@gmail.com> wrote:
>
> fails with latest musl
>
> https://errors.yoctoproject.org/Errors/Details/761688/

I tried to reproduce:

local.conf:
MACHINE =3D "qemuarm64"
TCLIBC =3D "musl"
TOOLCHAIN =3D "clang"

$ bitbake -e musl |grep "^PV=3D"
PV=3D"1.2.4+git"

Build Configuration:
BB_VERSION           =3D "2.7.3"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "debian"
TARGET_SYS           =3D "aarch64-oe-linux-musl"
MACHINE              =3D "qemuarm64"
DISTRO               =3D "nodistro"
DISTRO_VERSION       =3D "nodistro.0"
TUNE_FEATURES        =3D "aarch64 crc cortexa57"
TARGET_FPU           =3D ""
meta                 =3D "master:486ed69939f1b7572f121960c2dde246032686e7"
meta-clang           =3D "master:13dcab852c5bcd51fd75ae84ace9eddd99254653"
meta-filesystems
meta-networking
meta-oe
meta-python          =3D "master:5a02b76b82d1f48986212c33dddf7986385c79ef"

I couldn't reproduce the build failure. What am I missing?

> On Fri, Apr 5, 2024 at 9:25=E2=80=AFAM Fathi Boudra <fathi.boudra@linaro.=
org> wrote:
> >
> > Tools to handle creating and mounting composefs images
> >
> > Flexible mechanism to support read-only mountable filesystem trees,
> > stacking on top of Linux filesystem.
> >
> > It will allow to enable filesystem integrity by leveraging the stack:
> > ostree -> composefs -> fs-verity
> >
> > For reference:
> > https://github.com/containers/composefs?tab=3Dreadme-ov-file#filesystem=
-integrity
> > https://ostreedev.github.io/ostree/composefs/#using-composefs-with-ostr=
ee
> >
> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> > ---
> >  .../composefs/composefs_1.0.3.bb              | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/composefs/composefs_1.0.3.=
bb
> >
> > diff --git a/meta-oe/recipes-extended/composefs/composefs_1.0.3.bb b/me=
ta-oe/recipes-extended/composefs/composefs_1.0.3.bb
> > new file mode 100644
> > index 0000000000..ddc67d9b57
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/composefs/composefs_1.0.3.bb
> > @@ -0,0 +1,20 @@
> > +SUMMARY =3D "Tools to handle creating and mounting composefs images"
> > +HOMEPAGE =3D "https://github.com/containers/composefs"
> > +LICENSE =3D "GPL-3.0-or-later & LGPL-2.0-or-later & Apache-2.0"
> > +LIC_FILES_CHKSUM =3D "\
> > +    file://BSD-2-Clause.txt;md5=3D121c8a0a8fa5961a26b7863034ebcce8 \
> > +    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> > +    file://COPYING.LESSERv3;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> > +    file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
> > +    file://COPYINGv3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> > +    file://LICENSE.Apache-2.0;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
> > +"
> > +DEPENDS =3D "fuse3 openssl"
> > +SRCREV =3D "2d5cdcb9176cfe4ccf1761ef6d78e1c48de35649"
> > +PV =3D "1.0.3"
> > +
> > +SRC_URI =3D "git://github.com/containers/composefs.git;protocol=3Dhttp=
s;branch=3Dmain"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit autotools pkgconfig
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#109825): https://lists.openembedded.org/g/openembed=
ded-devel/message/109825
> > Mute This Topic: https://lists.openembedded.org/mt/105351850/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

Cheers,
--=20
Fathi Boudra

