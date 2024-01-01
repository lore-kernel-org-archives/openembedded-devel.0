Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B227C4706F
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 18:48:51 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.12082.1704134927476227606
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 10:48:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HTjUAbzz;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e835800adso4898603e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 10:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704134925; x=1704739725; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMowkAmQ3OOFAdgrRHWH2SvmqHwCln0depUU17NVV10=;
        b=HTjUAbzzIkFN9Yw3VvYdNX/aXiThzrwvqw4BWK17xLRje7JOnRm4ZCqvbarCaxCfel
         nSY1PbJxRQSkZYihhBGD7Z24qCmrFnrmxBohU2mdOf7IxUkXcr2E4OMldAxbS+tKddiJ
         QjxRDwIXkesX1uAUUAidY8cX5pLH1kU5a51z0vud58TKLeOh130DsPDCm2Pc23qnxS+w
         aflQEKKH36moz0HOcxEuxiiG/7+YVq3U6OqemFUuo6o4dUQphdAIXva0+p3sLJlbBb5n
         jBTSb5SEzisP6I5cKLmJ/IvkNw85cXGrQiZsgIEbXB0dmqOEiUYpBMRnuvG2iwl4oLGP
         jnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704134925; x=1704739725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMowkAmQ3OOFAdgrRHWH2SvmqHwCln0depUU17NVV10=;
        b=JfdbiSGb4WHgmKKHEynOc/eZU98oVmrrje3y+hfgsEjX99Hno/kJh6X2/VLQXei68h
         /+nOKe8T6Eb5ADPRTUjYc57Dww/agqb6zIwY8FQvKeawiCsJCQWjDTkuYOijyyG2vQ4B
         jDLEkL+dw3lbvLgJ5CLqNLsn7lInxMUMYvD7iJnBqlrtU0N7ywGH7/1i1eKvS1aVo0TU
         Z9LUnXd47y2nSKccPY0UWIRt0AjHaUHKpefTJpGNHTVT1gjj4ZNrMErprEvY8CdacQAN
         wdoI1NVK+gJMOEVgg1CnbsziSTM6+vw5kaIxs3J0/4Zq2onGnxKKkPTLgS92mj+dNtIp
         bORA==
X-Gm-Message-State: AOJu0Yxls+x91/YmKQg45/cM5RGP4L7srX2tqHSBkWvLaBqCmirM8loZ
	ROVHX8b092IZMcpa3PG7a1EGmkzb8XZHRvJ6ioI=
X-Google-Smtp-Source: AGHT+IFqNpR0b9BtVgw2jkPS2VZL/nFSmuO2/qAGqgFVc8v6yTzb8onWrZO/pQm1OqysU4Y906RrOHc3yVuU3goAg7Y=
X-Received: by 2002:a05:6512:3f29:b0:50e:8762:3b7 with SMTP id
 y41-20020a0565123f2900b0050e876203b7mr2971111lfa.169.1704134925490; Mon, 01
 Jan 2024 10:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20231231122329.405225-1-alex@linutronix.de> <20231231122329.405225-3-alex@linutronix.de>
 <CAMKF1soKwb-BN86fjw2j=89iA6R1f--+hk5uP0nLFxK6UK=uow@mail.gmail.com>
In-Reply-To: <CAMKF1soKwb-BN86fjw2j=89iA6R1f--+hk5uP0nLFxK6UK=uow@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Jan 2024 19:48:34 +0100
Message-ID: <CANNYZj92yJnTzXSVgDFgX3SHwHUfWWu-zeXviXmYDgg2-kb8FA@mail.gmail.com>
Subject: Re: [oe] [PATCH 03/23] audit: disable python bindings as incompatible
 with python 3.12
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 18:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107986

On Sun, 31 Dec 2023 at 18:04, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sun, Dec 31, 2023 at 4:23=E2=80=AFAM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta-oe/recipes-security/audit/audit_3.1.2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-security/audit/audit_3.1.2.bb b/meta-oe/re=
cipes-security/audit/audit_3.1.2.bb
> > index 5380e9022..1f2c821f0 100644
> > --- a/meta-oe/recipes-security/audit/audit_3.1.2.bb
> > +++ b/meta-oe/recipes-security/audit/audit_3.1.2.bb
> > @@ -32,7 +32,7 @@ DEPENDS =3D "python3 tcp-wrappers libcap-ng linux-lib=
c-headers swig-native"
> >  EXTRA_OECONF =3D " --with-libwrap \
> >          --enable-gssapi-krb5=3Dno \
> >          --with-libcap-ng=3Dyes \
> > -        --with-python3=3Dyes \
> > +        --with-python3=3Dno \
>
> Can you share how it fails?

| make[4]: Entering directory
'/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/audit/3.=
1.2/build/bindings/python/python3'
| /bin/bash ../../../libtool  --tag=3DCC   --mode=3Dlink
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
-mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2
-Wformat -Wformat-security -Werror=3Dformat-security
--sysroot=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-lin=
ux/audit/3.1.2/recipe-sysroot
-shared -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map
 -fmacro-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-6=
4-poky-linux/audit/3.1.2/git=3D/usr/src/debug/audit/3.1.2
 -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-6=
4-poky-linux/audit/3.1.2/git=3D/usr/src/debug/audit/3.1.2
 -fmacro-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-6=
4-poky-linux/audit/3.1.2/build=3D/usr/src/debug/audit/3.1.2
 -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-6=
4-poky-linux/audit/3.1.2/build=3D/usr/src/debug/audit/3.1.2
 -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-6=
4-poky-linux/audit/3.1.2/recipe-sysroot=3D
 -fmacro-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-6=
4-poky-linux/audit/3.1.2/recipe-sysroot=3D
 -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-6=
4-poky-linux/audit/3.1.2/recipe-sysroot-native=3D
 -module -avoid-version -Wl,-z,relro -Wl,-O1 -Wl,--hash-style=3Dgnu
-Wl,--as-needed -fcanon-prefix-map
-fmacro-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64=
-poky-linux/audit/3.1.2/git=3D/usr/src/debug/audit/3.1.2
 -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-6=
4-poky-linux/audit/3.1.2/git=3D/usr/src/debug/audit/3.1.2
 -fmacro-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-6=
4-poky-linux/audit/3.1.2/build=3D/usr/src/debug/audit/3.1.2
 -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-6=
4-poky-linux/audit/3.1.2/build=3D/usr/src/debug/audit/3.1.2
 -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-6=
4-poky-linux/audit/3.1.2/recipe-sysroot=3D
 -fmacro-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-6=
4-poky-linux/audit/3.1.2/recipe-sysroot=3D
 -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-6=
4-poky-linux/audit/3.1.2/recipe-sysroot-native=3D
 -Wl,-z,relro,-z,now -o auparse.la -rpath
auparse_la-auparse_python.lo ../../../auparse/libauparse.la
../../../lib/libaudit.la
| libtool:   error: only absolute run-paths are allowed

This is due to lack of distutils in 3.12 and poorly written defaults
in autotools macros, which can be resolved via setuptools dependency;
I'll send a replacement patch in a moment.

Alex

