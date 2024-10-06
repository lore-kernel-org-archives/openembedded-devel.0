Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBE4CFB43F
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 16:08:16 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.33665.1728230894554280464
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Oct 2024 09:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M8PyHtNX;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8d51a7d6f5so568260666b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728230893; x=1728835693; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeO4MNNdOcsVLdyd5AoEOisvj/57+niChepLGG1sjeg=;
        b=M8PyHtNXDy+EKQLpDr6QPO8lAtn90ZRLOpGQljDhVQkGSAFy2RVWAzRHPo6w2XoPrm
         /ca/LhekF3R2bnU9VkrMmBkXsEEA4ISR92Dprk8/9zrqsRVWdlnTLrA4EDSJOs0nx88r
         0dROYKcKjyAjqYNQdBVzeiB+8fYdSVB5DEakUGAEjvrFPmXiYmLen8qDyQeGH6GVOyIh
         dHSdOqkrsem2FXt4x5PlEmuYKTmOWEpFOUs1wKgIyCNleaxSaDwWQBWx72yJMnVotJVD
         jjhQN0o7kDGpNE8GeS6agr9XRxGewX/UM25+uUihpC24gptmBqg677fo7Mo8XeJTD6bC
         JOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728230893; x=1728835693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeO4MNNdOcsVLdyd5AoEOisvj/57+niChepLGG1sjeg=;
        b=MtWYu4QulxJFsg5YxWrAdl94hCkLjDrQ01R0cWroI4KTgg7ySAhPQWszKbJ20lGh/v
         lZK8ZvQKfIy1BJ/02tlp/5lgzRXUCU417XS8wsHNH2lncJlFSxZAiShcQzeMYi2qsz93
         5HJ228bytQ8jHGBS+V2HlLjfO+0FrRKkc6lHSVMeYSgIqvglZIoEVN/BySIdV/mDLPYz
         EOtG1CINOh+mJ1SX/fS71CVsJUbrrB4GJkIauZG1Y+IIoa89mDu9bERAhQcpEbJvzSK0
         fXL2pHhJ26gkJHgU+DDAsNOuxqOj0QKVXteXvYUdLTBJXtGl/VNtlmH01zdJs0FAMxoh
         OLNg==
X-Forwarded-Encrypted: i=1; AJvYcCXOFgJNSzqlOcQuaqe3Yvwgo8Rue9irCRRQ9GUKp6YIfS7GMYN3zte7rXbLWNdkxi/Iyba+lr6vE6ktuyKbVDwyz28=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyYMTCho+1m2x88g5j2NlTSYz/BbsThYNOYDaz4nnGVSWs1N2Ex
	Vj83OgS5fqd4ZCxoWVUTQ6COzBbhRR/R3HMm1nU33vRF1qyycxAhR7LfGOnVUUwJeKV7a9v1LK1
	zLXt/O/BO2T+BZt+fXwxW4aGzqoA=
X-Google-Smtp-Source: AGHT+IGlVXk2b47CzuYXQ7Q+zbG0AeBjkFxCARUKs9KIb/LIny5FZ62D9pJvB/tjI0urtLWpMMRuu0VYfnABz2aAh/8=
X-Received: by 2002:a17:907:3183:b0:a8d:29b7:ecf3 with SMTP id
 a640c23a62f3a-a991bce3fbcmr1038352366b.13.1728230892520; Sun, 06 Oct 2024
 09:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240925144556.1451584-1-dmitry.baryshkov@linaro.org>
 <CAB2nKc_d33JRj7kLQju6SdB9OnnE37E82baQoj2nVPirsqnFOQ@mail.gmail.com>
 <CANPvuR=PVPxLbXD13WQ3YDxEFCtMGrEZv0ng1JkHS=FK5FPT_Q@mail.gmail.com>
 <CALT56yOAdVUp-kfK2-sy=4-x2zeKk1D9qyeO++5qJfWOw5Zcng@mail.gmail.com> <CAMKF1sri+95bnhqVmsCG+bnukQ--jPrOXoH9CQdynCBQBbtkCg@mail.gmail.com>
In-Reply-To: <CAMKF1sri+95bnhqVmsCG+bnukQ--jPrOXoH9CQdynCBQBbtkCg@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Sun, 6 Oct 2024 18:08:01 +0200
Message-ID: <CALT56yOFbY=TLCOfPSv40C+OyP03XTN7Tne1C3TfVE6ve0kPow@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] libdevmapper: Inherit nopackages
To: Khem Raj <raj.khem@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, Armin Kuster <akuster808@gmail.com>, 
	vincent.prince.fr@gmail.com, openembedded-devel@lists.openembedded.org, 
	Peter Kjellerstedt <pkj@axis.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 16:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112683

On Sun, 6 Oct 2024 at 18:07, Khem Raj <raj.khem@gmail.com> wrote:
>
> Usually there is a monthly update to stable branches that Armin
> prepares over the month in stable/<release>-nut branch on
> meta-openembedded-contrib repo e.g. for scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/sc=
arthgap-nut
>
> I do see this patch staged there, so it will be in the next point
> release in October.

Ack, thanks. I didn't notice that there is a monthly cadence. Please
excuse me then.

>
>
> On Sun, Oct 6, 2024 at 8:15=E2=80=AFAM Dmitry Baryshkov <dbaryshkov@gmail=
.com> wrote:
> >
> > Hello,
> >
> > On Thu, 26 Sept 2024 at 12:13, Jose Quaresma <quaresma.jose@gmail.com> =
wrote:
> > >
> > >
> > >
> > > Vincent Prince via lists.openembedded.org <vincent.prince.fr=3Dgmail.=
com@lists.openembedded.org> escreveu (quinta, 26/09/2024 =C3=A0(s) 10:49):
> > >>
> > >> Hello all,
> > >>
> > >> Any update on this backport patch? :)
> > >
> > >
> > > The patch is not yet on the staging tree but I believe it will be the=
re soon.
> > > https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstabl=
e/scarthgap-nut
> > >
> > > but yes, this should be a priority given that the scarthgap recipe is=
 broken.
> >
> > And it still hasn't been merged. Armin, Khem, is there anything
> > delaying the patch from being applied?
> >
> > >
> > > Jose
> > >
> > >>
> > >>
> > >> Best regards,
> > >> Vincent
> > >>
> > >> Le mer. 25 sept. 2024 =C3=A0 16:46, Dmitry Baryshkov via
> > >> lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.or=
g> a
> > >> =C3=A9crit :
> > >> >
> > >> > From: Peter Kjellerstedt <pkj@axis.com>
> > >> >
> > >> > This fixes errors from buildhistory changes where packages-split w=
ould
> > >> > be empty.
> > >> >
> > >> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > >> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >> > (cherry picked from commit 90f96e053ad3eefa7693d9748efdfbfa72d7dcf=
d)
> > >> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> > ---
> > >> >
> > >> > The oe-core got commit c9e2a8fa2f03 ("buildhistory: Simplify inter=
cept
> > >> > call sites and drop SSTATEPOSTINSTFUNC usage") backported to the
> > >> > scarthgap branch. Backport the fix for libdevmapper too.
> > >> >
> > >> > ---
> > >> >  meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb | 2 ++
> > >> >  1 file changed, 2 insertions(+)
> > >> >
> > >> > diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb =
b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> > >> > index be558ce1d218..3b4439c3ae06 100644
> > >> > --- a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> > >> > +++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> > >> > @@ -5,6 +5,8 @@ require lvm2.inc
> > >> >
> > >> >  DEPENDS +=3D "autoconf-archive-native"
> > >> >
> > >> > +inherit nopackages
> > >> > +
> > >> >  TARGET_CC_ARCH +=3D "${LDFLAGS}"
> > >> >
> > >> >  do_install() {
> > >> > --
> > >> > 2.39.5
> > >> >
> > >> >
> > >> >
> > >> >
> > >>
> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >> Links: You receive all messages sent to this group.
> > >> View/Reply Online (#112515): https://lists.openembedded.org/g/openem=
bedded-devel/message/112515
> > >> Mute This Topic: https://lists.openembedded.org/mt/108648856/5052612
> > >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> > >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/uns=
ub [quaresma.jose@gmail.com]
> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >>
> > >
> > >
> > > --
> > > Best regards,
> > >
> > > Jos=C3=A9 Quaresma
> >
> >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

