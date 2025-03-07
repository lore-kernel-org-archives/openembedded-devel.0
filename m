Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A53C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 19:08:21 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.19231.1741374493657473443
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 11:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YrMocYec;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3f3edbef7d2so682150b6e.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 11:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741374493; x=1741979293; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+nDIkhXjm/g8f1qIud1J6gwfiOxU5oVRJDfA0zfN14=;
        b=YrMocYec/VxY6vApRfF6qwXtiWyXp4Akue/5sLMjg5Gipi2acP6Tdl/W8Y5uE/Yers
         huG3Ep8/xFQH9Hd0h5N+WOFxGGxynObRtmee3EdLyZURL66O2e2gb6ccH+si6ainpfIY
         lLQbOd1SCfxaSfLXs3fZz4jckfwHte/R/9/T+Xpr05/SbIxrIQ72cMKvYEZMCHxOFlGg
         QHPWw991CN9ACxdm1YfdFKxTc51IUoZYi/c/L5+bEHCpIs+2DEj82m0V5SfaJXCkhsRg
         ndYPwp64faXJ4wyCdYIjsGIXV35BE3X+8PohI/aYrPphrKpVivqlNxWhIR2fL2WLj9Qt
         Ef+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741374493; x=1741979293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+nDIkhXjm/g8f1qIud1J6gwfiOxU5oVRJDfA0zfN14=;
        b=LqCqJbzxDv1+IlFHZbcaBB3CkjBYHngmuBOemLLmQpxgxMLPxaJBGtZWaqUCYlEdjZ
         e2GNOZbKnCgUWyYppEGD6heaLPRXGEhYssVLPJjaoSRrADdtcVnDZ3gR1OV6sxJCAti9
         VExFWUVMczn/RwFT1IvudamltI/dJ01lpDUrLPfA+IW5778Z3s5m+brKMxmM3R5iAuT8
         3WhZxDi0xE1z7WxhVa/6ttHG+mqlFmIhoIa39sTt+Kt4ktbs2H7QQxSpoYfLmAPMaNxV
         ZsUEATQdDNGMyUUdLgIAajkjwt/X9nTxWxJh7nFjqA25K5BKaM1rUKUgJbjx197FJhPm
         xT7g==
X-Forwarded-Encrypted: i=1; AJvYcCWKxUOOjY+Cd2+qybItOSTp7byMcVtuYGlCuEpEccqDb5aq+rBUu0kp7Hk8Tr/PsKhzg4eroTXmOyKyzYCSmj4k/LQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy8/d1eeQBwlCaoYnXY3DQ/+HE1Nqm6LkKc26CswNdqwQ4PMoNY
	aDk2y19zF/HKcVptF1pS5VXQEnWFfPEe4+U2e6CLwtf+tpeFFclKYXULOYiKXUJotGcNIK6FD4s
	yRXRapYAK5yVOfSqzkCT/tLgZtaU=
X-Gm-Gg: ASbGncvoGPu3F2gEsrKYX+vGn8J8VJc4+BAo1kKCR9T/0OoBGLAJc66JzQkZsWNLx2u
	PJ0wYK3ebjsSMbCEcHG/VVJd+nizBarAlGHE05M3xNmy6iiWPIMG5Ko4mX5dTCtRfm0ff7T8yU3
	zfzOljo1M9iAwiiqPLPXgBVraoiw==
X-Google-Smtp-Source: AGHT+IHxkXbpm9/2SNf1APr4kXw0ybmbGXlPU+UU5Xeq5IvmSsFJcgMphZ2Td5tcChv+JtEMNmPqUgXyKtE3YejTL+o=
X-Received: by 2002:a05:6808:4490:b0:3f4:17af:63c3 with SMTP id
 5614622812f47-3f697c037eemr2671564b6e.32.1741374491404; Fri, 07 Mar 2025
 11:08:11 -0800 (PST)
MIME-Version: 1.0
References: <CAGAhMBz9zz0K8Fnj__NkEVvbsD8SibEs=BKR8YFE9mv+mG6tsw@mail.gmail.com>
 <17fde519-38d7-4c44-8592-a0ff6efd56fe@balister.org> <CA+chaQdAgNa4V-c9B48CkLOAxYhGcc2bcmb=mUMqe2U+gFf+Hg@mail.gmail.com>
In-Reply-To: <CA+chaQdAgNa4V-c9B48CkLOAxYhGcc2bcmb=mUMqe2U+gFf+Hg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Mar 2025 11:07:45 -0800
X-Gm-Features: AQ5f1JoH-_M2YIZ9QU7vYmE7P-YUQpdTkLQpq0Etp0U4HgJu5gap5rl01qmKuIo
Message-ID: <CAMKF1sprcWE99WFDtfF1SeMYzZ_M5RbkeJtN4DACTyyB0WKcwg@mail.gmail.com>
Subject: Re: [oe] [meta-python] python3-scipy
To: martin.jansa@gmail.com
Cc: philip@balister.org, rob.woolleywr@gmail.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 19:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115799

On Fri, Mar 7, 2025 at 10:55=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Fri, Mar 7, 2025 at 7:38=E2=80=AFPM Philip Balister via
> lists.openembedded.org <philip=3Dbalister.org@lists.openembedded.org>
> wrote:
> >
> > On 3/6/25 1:07 PM, Rob Woolley via lists.openembedded.org wrote:
> > > The meta-scipy layer was archived on Nov 30, 2023 (https://github.com=
/
> > > tuxable-ltd/meta-scipy <https://github.com/tuxable-ltd/meta-scipy>)
> > >
> > > I need python3-scipy for some recipes in ROS 2 (notably pinocchio), s=
o I
> > > patched it up and got it building again: https://github.com/robwoolle=
y/
> > > meta-scipy <https://github.com/robwoolley/meta-scipy>
> > >
> > > I don't know the history behind why it was in a separate layer.  Woul=
d
> > > it be worth submitting to meta-python instead of resurrecting the met=
a-
> > > scipy layer?
> >
> > I want to say because scipy needs fortran and that is not built by
> > default. So world builds woul dneed to skip scipy unless fortran was
> > enabled.
> >
> > Does this sound right?
>
> Which is the same as meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
> which also depends on libgfortran and only has:
> EXCLUDE_FROM_WORLD =3D "1"
> and comment about how to enable fortran in gcc.
>
> Just depending on fortran shouldn't eliminate it from meta-python.

I think, I will need someone to signup to maintain it there, there are
changes always
happening that will require fixing these packages, In the end it falls
on my plate whenever
there is a python upgrade in core or something else which breaks it,

>
> Cheers,
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115798): https://lists.openembedded.org/g/openembedde=
d-devel/message/115798
> Mute This Topic: https://lists.openembedded.org/mt/111555507/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

