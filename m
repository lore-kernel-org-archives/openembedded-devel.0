Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E91CE7A94
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 13:53:42 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.61355.1695650016779751960
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 06:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=A+ev7XnZ;
 spf=pass (domain: thaumatec.com, ip: 209.85.215.179, mailfrom: dse@thaumatec.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-578d0dcd4e1so3778447a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 06:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1695650016; x=1696254816; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lw0PLZ5mK5ALztsYtTWNSoNzg/Slgxp9yKhm6yCBZ50=;
        b=A+ev7XnZk0rCnUnAqU2UJ8oVdvP1btq+zC022vaM7X6f+USJXP5xVfliAS6REibqsL
         1kdyS/ngf0AISLOqBv2odSgXlP5TYXBoFV+olsEAX13j3tUq2LK7YCAm6/4fifG/UCYT
         lv06grBEZpxTs+5MIxVg9YzFSQA686at2e9DivzVs4PUeAeoMFvAtVi2uoA0E2wjMksx
         FXGBqBf7z5qhrRjal98C3jQEVOWNHup5lGxSpqI1jjfbXl3slaPc1C3eTUvVOGPCy8WD
         CJqnwmRrPMjMKYYtkDr4qIlYGvO0Z9Zm5QDjQaggysaSHKFM2jwe/pTv5ALRM02ViVfV
         /EDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695650016; x=1696254816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lw0PLZ5mK5ALztsYtTWNSoNzg/Slgxp9yKhm6yCBZ50=;
        b=IJHgO6p0U62++KfN3BGOsVeDjMMKrC8RHqNkkaai44muYzZE/STt62MpXBrqz/nX3u
         T9W26ek1vcxbJUca+EVu8X1wFPjClfgSdAaM6xVOWPeo0qf+c6zgbFmKe1PpjxYYzqQ7
         uwzIgEi2ovuikkz0AT+G8BnIFN+yBC9D1Fs9ie5dK9A86jUY6sJkeIHkc0v25M15vuTM
         YiBWDBM726WmvIYblH5es3IHQ4Cvm6XtL+qP7z+06PBcpIYf62JRCfkFHcWTXqgVgT/r
         WSDcWtPwiH/XzpL/BKdLVaWyJV+gv5t0X/+jxuzi2i53p4FLwmGsSvlEfAGgZo1AQkEL
         XzQg==
X-Gm-Message-State: AOJu0YwVPZ8s0f2Ui3r6uLAv3+49lqAASccCKhKNH7+JCPnyL0fw5gmS
	y9NKM+H0uQtR1Gi+goaUQO1pkP6Xj/jkAFtjAoQaMQ==
X-Google-Smtp-Source: AGHT+IGjuUoVKwwKMdb8F8lI2KFDhJPeFI28j8eaehBZCCWYGHD4O/X3ZK2Hfn6vR3ja6dhHehs2WiS8yI6fw8wtZmg=
X-Received: by 2002:a17:90b:3a91:b0:274:7fbd:9bc0 with SMTP id
 om17-20020a17090b3a9100b002747fbd9bc0mr3913841pjb.7.1695650016007; Mon, 25
 Sep 2023 06:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230918110305.38374-1-dse@thaumatec.com> <CAMKF1sqGaJqAHp4_6gsvNPqXywGf=Gjv7ML2d=G16ZbLCW8N4g@mail.gmail.com>
In-Reply-To: <CAMKF1sqGaJqAHp4_6gsvNPqXywGf=Gjv7ML2d=G16ZbLCW8N4g@mail.gmail.com>
From: Daniel Semkowicz <dse@thaumatec.com>
Date: Mon, 25 Sep 2023 15:53:24 +0200
Message-ID: <CAHgnY3kDUAUSR=o-HXEoBuybqqW47_4AGJScDUgvo-KDRewczg@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH v1 0/2] cockpit: Separate packagekit
 and apps packages
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 13:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105129

Hello,

Could you please provide some details about test setup? I tried to
build cockpit using meta-yoe with yoe distro and qemux86, but it was
built without any error. Building using clean poky also does not show
any error. It seems to be related to environment.

Best regards
Daniel

On Wed, Sep 20, 2023 at 10:04=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> I usually see this error with this package
>
> https://errors.yoctoproject.org/Errors/Details/737847/
>
> Can you see if anything pops up to fix it while you are here ?
>
> On Mon, Sep 18, 2023 at 4:03=E2=80=AFAM Daniel Semkowicz <dse@thaumatec.c=
om> wrote:
> >
> > "Packagekit" and "apps" Cockpit modules were included in the main ${PN}
> > package. Move them to a separate packages like all other existing Cockp=
it
> > modules. This allows to choose which modules are installed in the syste=
m.
> >
> > Daniel Semkowicz (2):
> >   cockpit: Move packagekit to a separate package
> >   cockpit: Move apps to a separate package
> >
> >  meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > --
> > 2.41.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#104924): https://lists.openembedded.org/g/openembed=
ded-devel/message/104924
> > Mute This Topic: https://lists.openembedded.org/mt/101430711/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

