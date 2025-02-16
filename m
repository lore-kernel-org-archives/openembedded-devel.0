Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5143C02198
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 07:45:31 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.25372.1739691927480860855
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Feb 2025 23:45:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j3igdvlq;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54605bfcc72so625426e87.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Feb 2025 23:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739691925; x=1740296725; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uYBvbYu8tT8ikXIJZQarDnpYXbU2W9iQwouiZHg+wU=;
        b=j3igdvlqG+Sg8ZFTR/SJEUtgloHTgtaDjUvZyQihqPW/wXjBJbm6SRXY7YTfYdzJVk
         GOFjQPweWzR0AbmZSxaNFGIr+0YEg58HShR1v7IzF05g56b4UlJ206ljkeQ1PQtDVDfv
         au16+rMzTvFBT5vLk0lgguJOZXASX5Wizw5uRpnZ5vHfA/CI6sqqYb/RpI8debTFUtY/
         XY3w86BYJ1Byj3rFnRb/Lo8p61zBBiZKEV6ylYCVL9X8Qz9UFHIGYipdptJiQ2z1QGx8
         SeJauhJoEkdDKTDCFKTaKdgNNopd9Sw/Yn6TCAHns1Jhin+Te4UiIqNEoJMJXXNUnuNa
         b8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739691925; x=1740296725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uYBvbYu8tT8ikXIJZQarDnpYXbU2W9iQwouiZHg+wU=;
        b=ZT+NJvuEefZTPmFhnyumKMo/lS+RMZSAHl6UIgpxOj8+/eJ3cC4vFaBv/SRdY7iKWm
         M92z21+eNAgkX3U+TDehmBvt1Z2z2aL7+a2fUlI8C1yo5t0GHZ2d+ZMHBTx5vZnsPRiF
         MaPzlVHVOXzTlEZtitz03J+3hpv4orzIMI0/N8hEjSjEU8J/Z7Zn0a/G6IhQEx2X8M3a
         R1arodVHkFeurw506BjnONLleNBq7wJdtJsfw+Iyw4/xUK2lirkQFa12rgdZx1fEnjiV
         RIkltJGO5ybFGYEOyHIYrx6jzjfeSJKSFlNjJfY0Nm5s1LNgdzOITnLkQi18+CxhdzpF
         nzgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRy8Y9p60Q5A/0fK5cXuADc5AqxzBC61+voPxhvcdl4tCC7UY+bT0aUys3yYKMbxT7oCkrkshs0LHDt6f74V7z/ig=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxoYIKvv7Mcb8klBXntbYmJd0EF2wpoSCNxiywRiB6K3AE2P7kT
	2cId1EuORZoEOYEJKeQ/Fly9SIzPuvL8xc+x02P1gb76KIKm3UGlOXItHsOBpGYvhIxkVJu6Qan
	WYKTcIvzESt/ik+8JbkjKva4nZFg=
X-Gm-Gg: ASbGncvXw3CS/khVYFDVU/YmJv3UfpFrB0Ck8qaiDQwiAtyYgrWoTOjHu6EyRtwmPKl
	ivWcePtjkYu1RvLPqjtMMtT6kYgAXUwTuKJ6huFOqqoS9RPs6StSquHm52yAgng7PJn6BElEdvy
	nivgQ=
X-Google-Smtp-Source: AGHT+IE/R/NjBaxZTKG5ym76fjJsaeH78Yyfzb5D0FC+fuX9f7N8iJYbfLY4qHnSK4r5LfUyDNNrV7zcvYmpJ+whUnc=
X-Received: by 2002:a05:6512:3b0f:b0:545:964:bd40 with SMTP id
 2adb3069b0e04-5451df5bb20mr4428207e87.0.1739691925086; Sat, 15 Feb 2025
 23:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20250215154924.1410-1-alex.kiernan@gmail.com> <CAMKF1sqOg=xvu5VdMxa0H3CQXbdr-o5CYaw9=OFrPeXryq8-ww@mail.gmail.com>
 <18249F0C5AAEDE20.31881@lists.openembedded.org>
In-Reply-To: <18249F0C5AAEDE20.31881@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 16 Feb 2025 07:45:13 +0000
X-Gm-Features: AWEUYZlCG76S4CuUv2kwocHOniJeg62HevP2bppTci3anNXARMDHzVnd1qW7MfE
Message-ID: <CAO5Uq5SSM7ftxJPa0S+eUw9S0q=CORaixsyb848PV+Xk_CKM5A@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] gpiod-sysfs-proxy: Fix deprecation warning
To: alex.kiernan@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Feb 2025 07:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115500

On Sun, Feb 16, 2025 at 7:17=E2=80=AFAM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Interesting... host sed differences? I'll have a dig.
>

Nope... not being built here, so whilst I fixed the warning I added
the error :-(

> On Sun, Feb 16, 2025 at 3:30=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > I am seeing this install error
> >
> > sed: -e expression #1, char 17: unknown option to `s'
> >
> > see
> > https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1502125/raw_i=
nline
> >
> > On Sat, Feb 15, 2025 at 7:49=E2=80=AFAM Alex Kiernan via
> > lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org=
>
> > wrote:
> > >
> > > Replace `\/` sequences to fix:
> > >
> > >   gpiod-sysfs-proxy_0.1.2.bb: Var <MOUNTPOINT>:1: DeprecationWarning:=
 invalid escape sequence \/
> > >
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > ---
> > >  .../gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb                | 2 =
+-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-supp=
ort/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb b/meta-filesystems/dynamic=
-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1=
.2.bb
> > > index fef2589106cd..13e4e680fb6d 100644
> > > --- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpi=
od-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
> > > +++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpi=
od-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
> > > @@ -24,7 +24,7 @@ SRC_URI[sha256sum] =3D "4bdd4b8a7042f63a40507ae0f16=
b360011e67cbb2f0276289636487a54
> > >  # non-standard behavior so make sure the user actually wants it.
> > >  PACKAGECONFIG[sys-class-mount] =3D ""
> > >
> > > -export MOUNTPOINT=3D"${@bb.utils.contains('PACKAGECONFIG', 'sys-clas=
s-mount', '\/sys\/class\/gpio', '\/run\/gpio', d)}"
> > > +export MOUNTPOINT=3D"${@bb.utils.contains('PACKAGECONFIG', 'sys-clas=
s-mount', '/sys/class/gpio', '/run/gpio', d)}"
> > >
> > >  do_install:append() {
> > >      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','fals=
e',d)}; then
> > >
> > >
> > >
>
>
>
> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115499): https://lists.openembedded.org/g/openembedde=
d-devel/message/115499
> Mute This Topic: https://lists.openembedded.org/mt/111201199/3618097
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
lex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

