Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991EAC3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 16:18:53 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.25116.1747757926415717325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 09:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YmqKGv4c;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2dab7a32fb7so1990135fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 09:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747757925; x=1748362725; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyZDahK5q3AK5Kh62xNSoy5ie4ShMsyq/MaAuAJPNg4=;
        b=YmqKGv4cg6/0F/v+meENniMxTKPsFKOx8B3rcd2O139DxvjPJeGPoLLnvXX9SMPp5U
         N8T0qUGHav5sPZAZjo8gg/upqBG1OHptU85GU/Gw3zCdDhJmcx7K1v50H7GO7lHGQFrN
         BY+sLUPoW2mjjcvmLROUJqmKW6XU8i++NrdA1EmgaTlfhEBJSr3/4AilG7OptQ4pNYHK
         n2YBlpYR2qWtlZ8S2lMbqb8/LgStw1EyHvAVjep41o6Zij7JJ257/acQWRTayWkTYpYj
         /h4Asae3Mw4Fwdq7DdjpPnnWc5dNazUmBv67f6By8Qbqr5VCEtjR9cKX/pEFJRU/qlOZ
         XGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747757925; x=1748362725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyZDahK5q3AK5Kh62xNSoy5ie4ShMsyq/MaAuAJPNg4=;
        b=bt3NLPOEnl71CPuPhvI8SdGxn13otvnbFuype83gyVnGF1eddIZAGc/dTXxwXJMXmI
         3ceYCNgRSY+4QCa6Ope2uJyW15k5VrlhtUwbNAi2E70neGrH3DXuv1cfMWd5xe0p0mpr
         CXP+HS6Ev4Z8KznxHERpDrSWGDOptFS0qzRXdZyv/JoI7uPQCJZEVoa3iFWNnl+SYVdF
         g6/LbdP5xIZw/vWQUzhtgV+zOvU+1lPPS35GXdSnpKzE+Mu2d4SbPmEg+H4YEbeEW3qS
         n3Og4hEjt+rlzgJ8gT7umyYx8BO5zbyAVrg8yMoDOWSdknGfJMymPtRw0cXrUZH7jNkM
         Z/Ww==
X-Gm-Message-State: AOJu0Yxcz9pYeZ/yg7ZC9uM+auwIuLtvwvpzZGVRbJT2VgV3rzQb0J22
	J2bxaj0/7R1xNkmBPP/aS283Z+952SO2TiaZee2NrocqUb5O9Pa2xj74coDYVV5OnDOwqPGVmFP
	E/I00RNMEwStHbU/OJRIl7ZKyCT+TiFo=
X-Gm-Gg: ASbGncsKEqj7FYzHZDLWWKHzgnsIXr2aw54WpskTagFwIDiuzPe0xekswN8m3lNzB6l
	1mDnH4SsCDJyHqnQwbwGOW7aeex6b3SkDXoHwaLW4+ke+27l+QleWjZQ8BI5Q4jK+FGycAUgGxW
	M+CWlWGphbY6jrUHCmF+4gK2eaUSxpfvg=
X-Google-Smtp-Source: AGHT+IFaP/ws3otkJhbxqx2KYdUgwuVeeCVHsE8g6UGm7bugAnnHCbaSfW9tzy7uh5i0vMidvqrXeUH9tfWMxVHz0sY=
X-Received: by 2002:a05:6870:168b:b0:2bc:7811:5bb8 with SMTP id
 586e51a60fabf-2e3c1cc6a6dmr8682939fac.18.1747757925521; Tue, 20 May 2025
 09:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250520160418.814173-1-dmitry.baryshkov@oss.qualcomm.com>
 <CAMKF1sqy1pMCvotLvX=KbCKbjJ=WRVhRR56zBhfDoOokNXiz4Q@mail.gmail.com> <CAO9ioeWXnyshnpE+HjMSRhf69JLp-KZnQrB_SgAUDEsGqvJpbw@mail.gmail.com>
In-Reply-To: <CAO9ioeWXnyshnpE+HjMSRhf69JLp-KZnQrB_SgAUDEsGqvJpbw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 09:18:18 -0700
X-Gm-Features: AX0GCFsBjeO25hdSxhbFIkq8JxrtKHEUai0VxOFB2yzqjh6LuXqrPHWOZbiCGic
Message-ID: <CAMKF1sod0CK69cK1jGToN9eQ6VrKE7sRQxsmM23TY94xLAEUUg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libglvnd: provide virtual packages
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 16:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117518

On Tue, May 20, 2025 at 9:07=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, 20 May 2025 at 19:06, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, May 20, 2025 at 9:04=E2=80=AFAM Dmitry Baryshkov via
> > lists.openembedded.org
> > <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> > >
> > > Add corresponding PROVIDES in order to let libglvnd declare that it
> > > provides corresponding libraries.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/me=
ta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> > > index 4094aa4fc613..53f422aff1d2 100644
> > > --- a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> > > +++ b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
> > > @@ -28,3 +28,10 @@ PACKAGECONFIG[gles1] =3D "-Dgles1=3Dtrue,-Dgles1=
=3Dfalse,"
> > >  PACKAGECONFIG[gles2] =3D "-Dgles2=3Dtrue,-Dgles2=3Dfalse,"
> > >
> > >  BBCLASSEXTEND =3D "native nativesdk"
> > > +
> > > +PROVIDES =3D " \
> > > +    ${@bb.utils.contains('PACKAGECONFIG', 'glx', 'virtual/libgl virt=
ual/glx', '', d)} \
> > > +    ${@bb.utils.contains('PACKAGECONFIG', 'gles1', 'virtual/libgles1=
', '', d)} \
> > > +    ${@bb.utils.contains('PACKAGECONFIG', 'gles2', 'virtual/libgles2=
 virtual/libgles3', '', d)} \
> > > +    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', =
d)} \
> > > +"
> >
> > Is there a corresponding changes/documentation update required to
> > reflect it in Core for selection
>
> I'm working in it and will post separately, as it concerns OE-Core.
>

Thanks, I think both changes should go hand in hand.

>
> --
> With best wishes
> Dmitry

