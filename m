Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD05D3A679
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 17:38:06 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.2785.1730223481534370019
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Oct 2024 10:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EXVq5c4e;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53b34ed38easo3077227e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 10:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730223479; x=1730828279; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4IaR9B4HcUMP0ECXdRac8xrQpMuLeJ2JFQzSf20m2g=;
        b=EXVq5c4et7Q3BP4raIiVzZlj7VW/quYFr+lw4uAE0J9NmraypeFUg23TsFPOCrY4sI
         jw372Ny6hAHjF1MUEbPDE0gHmFE4TqyRsEebj4RE5drCE5WRd46vnsKvkRopNyDjeDb7
         QqZGSEbKslTUYfxyDThKF3VSInpUj0hdKW1np9dlAbNRte0bMCGdUv8Xi9n88PTmmOgi
         C+BnjfwoFWLI4XrO1zpXgiFcZBXJcREBIA4FsUWwBG9Nwf0T/YaYKpEaIT7lXMj1KxgW
         d++H+sQONt/DH9RrNuE8avcxzkqcfQcPfGXMHMVC0Z3Kqk5UD40srldBXs18kW3Ir6nF
         8Sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730223479; x=1730828279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4IaR9B4HcUMP0ECXdRac8xrQpMuLeJ2JFQzSf20m2g=;
        b=S6Puw5EaCsqxGIkcJWyougW3vxuCOZ0STwHREFxr0E3diVhL6OiOngSrN1rOosgEzq
         4ogudnKUYgG4oqe3dq5QY4Goy4fB3N0tVpmqwqmDDCc8id80TFefhoP/LfJrZQjHW8nK
         ujKG3yp4TjQ2cfHaMLrHaLKlxL9qpN2tljUHdvEcy5dBPHbLNOPbFu+worddtlolDjsv
         MeqRtqTAcjmQECsSZWpwTV9blIhV3yw+46ceiFWEgVdaZYLITcwl+jiA+KAMjX7PWrA+
         ID5A40udSWepb/jB5+jk2Uoerh3hOR3qozcR6md6XOmKIOqhlwZHyb1zE6t81U8UOdQW
         J0Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXcnm+5qDEYxGairdEp2nIdecNyMSqy/0+5iLsWjU4SFsOUnkCjyKFs0dLifcw+d8+npZ3EEdsJ7Aw+ZhtzNjLifzM=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy7AD8T+tKl9dkUWZl3mZSwnmw98ZQd7/i56AoDtqhJE+7EqkA2
	GC9JPO66LzzHv6vCYfgqO9Kv29zMha9WFWOKyfnqXadKdVLPCMDMXRDggQWp4lVSCOcB6i68Txy
	S71zZvDvZd+s6UMDsq5n6C+cksxo=
X-Google-Smtp-Source: AGHT+IGFq2maFWMtcUNdPTK3yfm2L7JGXY1Dl2uMYU+AioWgWnrqRxcFRlOhw3miuFO+CrMYS22gRkK7yM+z7aZUqqU=
X-Received: by 2002:a05:6512:3f1d:b0:539:9524:92bc with SMTP id
 2adb3069b0e04-53b34a3219cmr5832705e87.55.1730223479086; Tue, 29 Oct 2024
 10:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20241024135126.48781-1-brgl@bgdev.pl> <29bbf4a17cfa28fc45c0f3e7fe3b472170d6bdec.camel@siemens.com>
 <CAMKF1spzk7ezwr1ekRq+NxoLFuT3gZ66-ARsc1_ZYfi0czwUgg@mail.gmail.com>
 <CA+chaQdCQquu7TDt=YONbXmA8rpdoALUDPJ22eJRe50Zumo73g@mail.gmail.com>
 <CAMRc=MdDpw6O-T5uGsos4gFr87J85wtFxLK1F+TeJLd8JctdwA@mail.gmail.com>
 <CA+chaQdB0DWJ_UjrFp3NRzDyU48rLtf8--XUj9yvrKRXUQ0GVQ@mail.gmail.com>
 <CAMRc=McXnYFrM5gPftv8BpBSc2X8=E-++PrP-LiPy2Cs5qCG4A@mail.gmail.com>
 <CAMKF1sqNfxKB2trWzexx+o6N9A1-D=pwBOD5avaXoF85xDz+yw@mail.gmail.com> <1802FCB4738F9D46.10203@lists.openembedded.org>
In-Reply-To: <1802FCB4738F9D46.10203@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 29 Oct 2024 18:37:47 +0100
Message-ID: <CA+chaQfxekcEdP7wUiPzHrT3faFXpXHDPTSdemN92613xp5MJA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] libgpiod: update to v2.2
To: martin.jansa@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, 
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 17:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113332

In some other world builds which do have e.g. multilib enabled it
didn't get to do_compile as S is set incorrectly (should use BPN not
PN, why not default BP?) for lib32-libgpiod:

ERROR: lib32-libgpiod-2.2-r0 do_populate_lic: QA Issue:
lib32-libgpiod: LIC_FILES_CHKSUM points to an invalid file:
lib32-libgpiod/2.2/sources-unpack/lib32-libgpiod-2.2/LICENSES/GPL-2.0-or-la=
ter.txt
[license-checksum]

On Tue, Oct 29, 2024 at 6:31=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> My builds were on ubuntu-20.04 as well, nothing special in my config.
>
> https://valkyrie.yoctoproject.org/#/builders/87/builds/16/steps/40/logs/s=
tdio
> seems to be from debian-12
>
> On Tue, Oct 29, 2024 at 6:27=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > On Tue, Oct 29, 2024 at 10:24=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> > >
> > > On Tue, Oct 29, 2024 at 5:54=E2=80=AFPM Martin Jansa <martin.jansa@gm=
ail.com> wrote:
> > > >
> > > > > I'm not sure how you got there
> > > >
> > > > bitbake python3-gpiod
> > > >
> > >
> > > There must be something more to it though as a simple 'bitbake
> > > python3-gpiod' works fine for me. Anything particular in the config?
> > >
> >
> > yeah it worked in AB CI and also my world build builds on different
> > architectures but I am able to see a build
> > failure on one machine today which is new and runs ubuntu 20.04, I
> > will share if I find more.
> >
> > > Bart
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113331): https://lists.openembedded.org/g/openembedde=
d-devel/message/113331
> Mute This Topic: https://lists.openembedded.org/mt/109190169/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

