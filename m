Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B230CFB424
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 16:07:16 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.33642.1728230835475936024
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Oct 2024 09:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H2qjpAQG;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5e7e14594f9so616927eaf.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 09:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728230835; x=1728835635; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuiwp5LnNvtw0ign96JTy50qCglwGWZv6uVuhB8JLaw=;
        b=H2qjpAQGgBYVXc5xniAYaSiZqM9hJPs79SO2AuPFwrxB7Ss4xupauTiCDrbYw9RuAY
         A/3PsaqnBFc/u7i9GPZG+GjSaSPAZwXM0gcUzKnxHrN1ul+8iig9yW3W/CudvXOgAp46
         aJa335IeywmqXCuwWhQHw0kHCMloRITFpNPQm3/9kf0EuR/my/X1n0oQx0pSvLw/Bi60
         2XIuZ1NifoHE7tWiY+U+I8lXnSBI5zdmKQmgb6ZSRwdznoIpwiRrPOSMbKIqZG0F6TWK
         t1xDZLlLnAFF9s2W/xPQD1admFLq4ZI6ATjw0yA50MPjuK8cl9PEaBdR7/Ikod5Ne7dg
         Guyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728230835; x=1728835635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuiwp5LnNvtw0ign96JTy50qCglwGWZv6uVuhB8JLaw=;
        b=BPkcacMe8FzD3LQIz2MemaEGNa+aA5N5ivrcc84y8gEtr895dX8crbHMHg2qLBS/9N
         GLFwxtfEdHUJIofjWx45diFnwKSh0qUk/vF1fY4mvELmIXxsklzx0jA8BpWGxXWTmcAO
         K79w6g3/8CuTVJlC63waeAVu0Hi6OvTi4O4PiPR4sJF8/xF9nQmAcHGQxuos2hzwzxR/
         XMq18SIpkr7zCvd18xDECMchNYDh0/mGtX/tnQrZ1ppf0TnmqEjR+1p8CS5UzFM9Ntee
         q0OQpaDBjsdTsNpDbGfibzzhGhMeQrGBX14BPBxPT20AcNt3FEfZ53k4OZyPY0h5/8ON
         uH2w==
X-Forwarded-Encrypted: i=1; AJvYcCX3U4wgH8BRTrH5ZjMiRIQT8UUARgFNtfDrvIuIX5fsSaoi46Gh53xtw+TfD7LEKLCalq0HroyNCH+5CPmubqtMkw0=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx04VC7XGDHcP3m/1/+uJXPQE6xjqi+bIFsxtvOI4g211ik+j3N
	bcMS58WNIR5+KeCoovnd3txIdqR8dEaZc5OT+SbAbnVwgvw4HaMJFyBJ1LTVk3Lqo2s0SzWhb0z
	H/0dElNE9eh63j2VKotDRt7aG7822l4JIDNw=
X-Google-Smtp-Source: AGHT+IEdRVsSw3x0D1T00rg38AnK4C9MU8Er5+WcMAICVmn3STrmWdNs3NARuKxZV5hq4amzIGzzsnp4wji0HMM+HlI=
X-Received: by 2002:a05:6870:1f0c:b0:261:44d:3b86 with SMTP id
 586e51a60fabf-287c1e15af9mr5007227fac.23.1728230834594; Sun, 06 Oct 2024
 09:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240925144556.1451584-1-dmitry.baryshkov@linaro.org>
 <CAB2nKc_d33JRj7kLQju6SdB9OnnE37E82baQoj2nVPirsqnFOQ@mail.gmail.com>
 <CANPvuR=PVPxLbXD13WQ3YDxEFCtMGrEZv0ng1JkHS=FK5FPT_Q@mail.gmail.com> <CALT56yOAdVUp-kfK2-sy=4-x2zeKk1D9qyeO++5qJfWOw5Zcng@mail.gmail.com>
In-Reply-To: <CALT56yOAdVUp-kfK2-sy=4-x2zeKk1D9qyeO++5qJfWOw5Zcng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 6 Oct 2024 09:06:48 -0700
Message-ID: <CAMKF1sri+95bnhqVmsCG+bnukQ--jPrOXoH9CQdynCBQBbtkCg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] libdevmapper: Inherit nopackages
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, Armin Kuster <akuster808@gmail.com>, 
	vincent.prince.fr@gmail.com, openembedded-devel@lists.openembedded.org, 
	Peter Kjellerstedt <pkj@axis.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 16:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112682

Usually there is a monthly update to stable branches that Armin
prepares over the month in stable/<release>-nut branch on
meta-openembedded-contrib repo e.g. for scarthgap

https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/scar=
thgap-nut

I do see this patch staged there, so it will be in the next point
release in October.


On Sun, Oct 6, 2024 at 8:15=E2=80=AFAM Dmitry Baryshkov <dbaryshkov@gmail.c=
om> wrote:
>
> Hello,
>
> On Thu, 26 Sept 2024 at 12:13, Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
> >
> >
> >
> > Vincent Prince via lists.openembedded.org <vincent.prince.fr=3Dgmail.co=
m@lists.openembedded.org> escreveu (quinta, 26/09/2024 =C3=A0(s) 10:49):
> >>
> >> Hello all,
> >>
> >> Any update on this backport patch? :)
> >
> >
> > The patch is not yet on the staging tree but I believe it will be there=
 soon.
> > https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/=
scarthgap-nut
> >
> > but yes, this should be a priority given that the scarthgap recipe is b=
roken.
>
> And it still hasn't been merged. Armin, Khem, is there anything
> delaying the patch from being applied?
>
> >
> > Jose
> >
> >>
> >>
> >> Best regards,
> >> Vincent
> >>
> >> Le mer. 25 sept. 2024 =C3=A0 16:46, Dmitry Baryshkov via
> >> lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>=
 a
> >> =C3=A9crit :
> >> >
> >> > From: Peter Kjellerstedt <pkj@axis.com>
> >> >
> >> > This fixes errors from buildhistory changes where packages-split wou=
ld
> >> > be empty.
> >> >
> >> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> >> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > (cherry picked from commit 90f96e053ad3eefa7693d9748efdfbfa72d7dcfd)
> >> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> > ---
> >> >
> >> > The oe-core got commit c9e2a8fa2f03 ("buildhistory: Simplify interce=
pt
> >> > call sites and drop SSTATEPOSTINSTFUNC usage") backported to the
> >> > scarthgap branch. Backport the fix for libdevmapper too.
> >> >
> >> > ---
> >> >  meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb | 2 ++
> >> >  1 file changed, 2 insertions(+)
> >> >
> >> > diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb b/=
meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> >> > index be558ce1d218..3b4439c3ae06 100644
> >> > --- a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> >> > +++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> >> > @@ -5,6 +5,8 @@ require lvm2.inc
> >> >
> >> >  DEPENDS +=3D "autoconf-archive-native"
> >> >
> >> > +inherit nopackages
> >> > +
> >> >  TARGET_CC_ARCH +=3D "${LDFLAGS}"
> >> >
> >> >  do_install() {
> >> > --
> >> > 2.39.5
> >> >
> >> >
> >> >
> >> >
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#112515): https://lists.openembedded.org/g/openembe=
dded-devel/message/112515
> >> Mute This Topic: https://lists.openembedded.org/mt/108648856/5052612
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [quaresma.jose@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>
>
>
> --
> With best wishes
> Dmitry

