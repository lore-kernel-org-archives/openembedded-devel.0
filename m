Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E01BC02198
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 07:17:21 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.25355.1739690231005513635
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Feb 2025 23:17:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bqaGGpqE;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-307bc125e2eso32944621fa.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Feb 2025 23:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739690229; x=1740295029; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skgh9alinfrYwUxxz0JWLP+in4c76Rq8Bim+XJc0BAE=;
        b=bqaGGpqEBc6wXGVDyyg5X84vyu9ZHYRbSdgjFgoB0Qsyf8y/lwIHEzQsE1CUHy+qir
         dZYTlooSsUBQOnPPe4oAz4CPCvD6Kgkth/VG4VcNklSePcqy6KNZGkhQJuQPDtflb3fk
         7ckEfubk1S5F6H9Q/BMhT96U1/JPqnYrAFnTRBJ2OCMItqRZwCaV+kUwMit8BE7D/2Mh
         PonCQRNeLbVERdioFV6c64ld70+JUEShkR0qyTlAAzHRX8lD5jGtBLKwADmayNjBXwVs
         +4qA2UmqWGVcKb3MW9djyfK05745pI2eb1ir7xyiYUykr+BTOhX3zDlNJds+3jlRteUF
         8YJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739690229; x=1740295029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skgh9alinfrYwUxxz0JWLP+in4c76Rq8Bim+XJc0BAE=;
        b=VPlAkwlRog09UDYPUArFCFwqwQ60FmuyLwwNRCOQkQPNe26B/KDpxjow4IbnrTDX0Y
         FDmy7PZSstG4j1Gl2n1aOwKforgo6KRnpYXnKl5huTySvsY417RbBS7kA3ezBlBGv4YR
         Psoj0iNWqAh/l/FR3NPLv8EmOgGGP/5DyOAm//tzT9FQAWP0UJ9SMlcznZkwUH+fvy6/
         qqhPrvEKYVq/ODZZrCryLpPOag84Lu5dFj9p1n5jFlshTKZ92dUauqTzDKotmYxIWEWM
         l43KOelsIwJKOZ1f0Cln//Kgzj47vdjHlVadgknWC/O+aXQBgPblkIDG3YPwssfvUvsX
         nPgQ==
X-Gm-Message-State: AOJu0YzcPgjo8JIGosKFmKVw+2ZwFu7pbfwIUsp7PIMzmmmJct2+Ge17
	d71LJITkyr/91nhNkYQMYonNRXEHnnBuIGqZ8+yU016jwLO3tIPMLaxU7LDfnhaSRpZOTeSJDrR
	6PeedRK8IGX29m4P1nWu2ENcMkUU=
X-Gm-Gg: ASbGnctwvsP7xZE6oBsjcCKjDcfzEc4a1X/CQRKcmFkF5lcE6WTV6BlYGIcU79EX+2z
	sEMQYlUT8Hbs6n0+I3tX+pwGV9+14d6Ev6DPTDZPiHmMy0zd5GqlY+2xroBRXAhD8x9assKef6l
	XmtKs=
X-Google-Smtp-Source: AGHT+IEVYbFxk0d9g41DWmRaAfPDJ6hpX6tUzUASlyrDv5WEqPznaycVSlH5WB/zwSiPhe95pafYW83sVp1lHTeZS0I=
X-Received: by 2002:a2e:8199:0:b0:302:264e:29ec with SMTP id
 38308e7fff4ca-30927a701demr12151641fa.11.1739690228852; Sat, 15 Feb 2025
 23:17:08 -0800 (PST)
MIME-Version: 1.0
References: <20250215154924.1410-1-alex.kiernan@gmail.com> <CAMKF1sqOg=xvu5VdMxa0H3CQXbdr-o5CYaw9=OFrPeXryq8-ww@mail.gmail.com>
In-Reply-To: <CAMKF1sqOg=xvu5VdMxa0H3CQXbdr-o5CYaw9=OFrPeXryq8-ww@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 16 Feb 2025 07:16:57 +0000
X-Gm-Features: AWEUYZni87s0hd33xm6AZ_p2FTbqRU36X1nPC_0eBqG2WFyqnOD0NcsmBAMV7aQ
Message-ID: <CAO5Uq5Scau-0yvuahVvFQ3tor+AtGRbqh2M7WpdNwe7Z_sEcuQ@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] gpiod-sysfs-proxy: Fix deprecation warning
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Feb 2025 07:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115499

Interesting... host sed differences? I'll have a dig.

On Sun, Feb 16, 2025 at 3:30=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> I am seeing this install error
>
> sed: -e expression #1, char 17: unknown option to `s'
>
> see
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1502125/raw_inl=
ine
>
> On Sat, Feb 15, 2025 at 7:49=E2=80=AFAM Alex Kiernan via
> lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Replace `\/` sequences to fix:
> >
> >   gpiod-sysfs-proxy_0.1.2.bb: Var <MOUNTPOINT>:1: DeprecationWarning: i=
nvalid escape sequence \/
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >  .../gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb                | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-suppor=
t/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb b/meta-filesystems/dynamic-l=
ayers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2=
.bb
> > index fef2589106cd..13e4e680fb6d 100644
> > --- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod=
-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
> > +++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod=
-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
> > @@ -24,7 +24,7 @@ SRC_URI[sha256sum] =3D "4bdd4b8a7042f63a40507ae0f16b3=
60011e67cbb2f0276289636487a54
> >  # non-standard behavior so make sure the user actually wants it.
> >  PACKAGECONFIG[sys-class-mount] =3D ""
> >
> > -export MOUNTPOINT=3D"${@bb.utils.contains('PACKAGECONFIG', 'sys-class-=
mount', '\/sys\/class\/gpio', '\/run\/gpio', d)}"
> > +export MOUNTPOINT=3D"${@bb.utils.contains('PACKAGECONFIG', 'sys-class-=
mount', '/sys/class/gpio', '/run/gpio', d)}"
> >
> >  do_install:append() {
> >      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false'=
,d)}; then
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#115495): https://lists.openembedded.org/g/openembed=
ded-devel/message/115495
> > Mute This Topic: https://lists.openembedded.org/mt/111201199/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Alex Kiernan

