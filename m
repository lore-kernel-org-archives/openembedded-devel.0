Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F197AC4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 12:29:21 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.147596.1698668955351749616
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Oct 2023 05:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bs05lNrw;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7a94de8c70cso130746039f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698668954; x=1699273754; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjRFLbOLAbSOkbZOeuUIlozgZ0JhoRRh9rBZMmRNRtE=;
        b=bs05lNrw/oLaAb/NMHbMhFo3OjJyVJMTE/iQWNoStUSdpoVFmoC5Druz4932Fxl62A
         4uC2TOrGCnRaTxyRF1AhTQsQ+zhJ0enK3vPNDzeRSXurRRGGOk4cINyOGXO4z/os45Ie
         In/G10aEcNQpzZPO89e1gMKtnBaD8KD3DKS79r2BWaY940+bSuev+aehIYy2PeOkRpGX
         d9Tv0qg/rvlvx73s7NEknubt/dMdfcUbIhxJLlpY004Vqkn2Ip5BdwL5SflA6/DKAK5y
         WX8xeC1actKrDzIVYs9FJSZl9pT98csIGCCffUtHvXmvE76mVYlo1TD+D2ph7B6ueu/w
         NvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698668954; x=1699273754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjRFLbOLAbSOkbZOeuUIlozgZ0JhoRRh9rBZMmRNRtE=;
        b=qGBnQts2jKV5eY2d7+0dcu1GFDFxe0D6n2q7SR3qpmh3bQwMOSqoaN8UDx3d4BEGMD
         h0OiaOb/+ZS+oXjtGqVF4btt8rdL2ZckzSfG1IQAi6umq7wHVz/coB6Faq6TRitfw1I6
         p/feyTlBnDADG/DoVCYMYM3bbcbbdNwXqIPO/BUvXoIz6ZktDIh+TQ2mBE2FoN+Nw8s1
         C76Zu/GQvGv/mOP5yj40qTyAtnrlblYepOJUQBwvQjSb3XyVssu4mLUzczP5Wd69dQXw
         ZN4mPQNwRlaZrFYMskgwT1ORkViKStGGmahfdqiWTSPQG+YX/lzlNVBNQOtGhZd18RUu
         71rw==
X-Gm-Message-State: AOJu0Ywqkk8HIVeMK45YDER8uiMrKix2tCJXd5nTkhF8IHgrulFYDKTk
	4J1CJKlWE0AJkwOKwhECSScHsxHAy230FWHUOdI=
X-Google-Smtp-Source: AGHT+IFfI73TfWU2ZeJdvRJyiLNoL2+Y3UkFgHaBHlG2O+0S7RNGuQCPANRJLmlaziMdLN8zSsMsbcB+I8C9/lrexAk=
X-Received: by 2002:a05:6602:1691:b0:7a9:8166:8711 with SMTP id
 s17-20020a056602169100b007a981668711mr11877664iow.14.1698668954436; Mon, 30
 Oct 2023 05:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <d9ff922b-383a-4cec-b206-84d86987f4f8@navimatix.de>
 <CANPvuRkMCLPXo9FWwU+gDn4=O51=7OGWMj=Z47NGEv6F-8uZTw@mail.gmail.com>
 <CADkTA4N-aH1jf3SAVykTQ+G+t-baWNEOBjH5O56u25QJmmqw5w@mail.gmail.com>
 <CAMKF1srD7oyOwy8-ycm=wqqnpC8fGT858pManMLS6QCWL9tXXA@mail.gmail.com>
 <CANPvuRmrKmZC65RqFkHV2-wTZnMmLwH0f_cQprmB3Boc5w7sNg@mail.gmail.com>
 <c89d8ff8-d3b1-40b7-bf07-3d8928c0fa48@navimatix.de> <CADkTA4NK8=9su8PUSiLETUpe725fezrHqacneiKkjDz4iDP6Lw@mail.gmail.com>
 <034542e5-9942-42b1-b57a-49c007d7e058@navimatix.de>
In-Reply-To: <034542e5-9942-42b1-b57a-49c007d7e058@navimatix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 30 Oct 2023 08:29:03 -0400
Message-ID: <CADkTA4MKV9h6ttdFEtKdiQ7jP8LfPbbWk8agqK9g0goExWZNmw@mail.gmail.com>
Subject: Re: [oe] openssl-native.rm_work runs before kernel-module.install ->
 no signature
To: =?UTF-8?B?SsO2cmcgU29tbWVy?= <joerg.sommer@navimatix.de>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 12:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105792

On Mon, Oct 30, 2023 at 4:40=E2=80=AFAM J=C3=B6rg Sommer <joerg.sommer@navi=
matix.de> wrote:
>
> On 26.10.23 17:25, Bruce Ashfield wrote:
> > On Thu, Oct 26, 2023 at 7:16=E2=80=AFAM J=C3=B6rg Sommer <joerg.sommer@=
navimatix.de> wrote:
> >>
> >> On 26.10.23 10:34, Jose Quaresma wrote:
> >>>
> >>>
> >>> Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> escreveu no
> >>> dia quarta, 25/10/2023 =C3=A0(s) 18:18:
> >>>
> >>>     I wonder if something like below would help
> >>>
> >>>     diff --git
> >>>     a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> >>>     <http://make-mod-scripts_1.0.bb>
> >>>     b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> >>>     <http://make-mod-scripts_1.0.bb>
> >>>     index 2cff48c39c3..6133721334c 100644
> >>>     --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.b=
b
> >>>     <http://make-mod-scripts_1.0.bb>
> >>>     +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.b=
b
> >>>     <http://make-mod-scripts_1.0.bb>
> >>>     @@ -12,7 +12,7 @@ S =3D "${WORKDIR}"
> >>>
> >>>      do_configure[depends] +=3D "virtual/kernel:do_shared_workdir
> >>>     openssl-native:do_populate_sysroot"
> >>>      do_compile[depends] +=3D "virtual/kernel:do_compile_kernelmodule=
s"
> >>>     -
> >>>     +do_populate_sysroot[depends] +=3D "openssl-native:do_populate_sy=
sroot"
> >>>
> >>>
> >>> This doesn't solve the problem because at compile time the openssl is
> >>> already there on native sysroot
> >>
> >> How about a patch like this:
> >>
> >
> > I proposed something similar in the earlier threads on this topic (it
> > has been around for quite some time, and is in bugzilla for oe-core)/
>
> Can you give me a link to the bugzilla entry? I didn't found it.

It seems like I've managed to archive, or otherwise misfile the old entry,
I also may have been mixing up my other long running scripts bugs.

Since I can't find the bug (or imagined it), the main reference on the
previous efforts are the oe-core threads that Jose pointed out.

>
> > I ran into issues with some kernel versions, but we may have moved on
> > far enough that it is no longer an issue.
>
> Do you remember what kind of issues these were? Possibly I can check if
> they still exist.

It was kernels older than 5.10 failing to take the r-path changes and
hence failing when doing the signing step.

But testing against the oldest reference kernel in any branch that
might be a target for a change like this should be enough (testing
via: normal build, a SDK build, and signing).

Bruce

>
> Kind regards
>
> J=C3=B6rg Sommer
> --
> Navimatix GmbH
> Tatzendpromenade 2
> D-07745 Jena
> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> Registergericht: Amtsgericht Jena, HRB 501480
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

