Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E42CD40CEB
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 23:03:00 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.33755.1730847774099908144
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 15:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AIdWDJIn;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb518014b9so51726931fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 15:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730847772; x=1731452572; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmOQd27LTdg2o5CNSn7V7IT2mnrsgT8foYkprc1jpsg=;
        b=AIdWDJIn8Go4Q/4S6khdgPT1K8iDvp1gMugEEYsQSw8Xc6P4HoRj6fQStJ2++HqR6n
         68de/wxmGw9il3k7L1Mu2V6+OMecWeUWmbT+I1kOj9r/R1ZOmHW/f8Tk2whNv2R77DUF
         kPs8/yDpyr/6lfhpL1dEFvoBBuvshPyP0amwMWKJXYAKRC+sbZCSVj/sGkCdXcHiqu0D
         +alcWiNTVvyb62w6z/Q5YWamXx+lbHnfu+vvpS3Inn03s2T4uvL94ayUUuSLcibGPzOs
         sZpHMj0MXtObt952UqsWucQdFAapHyQW1EUxO5N7y9kBIXlxncLcW8apz1CD4Q59EyY6
         CAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730847772; x=1731452572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmOQd27LTdg2o5CNSn7V7IT2mnrsgT8foYkprc1jpsg=;
        b=ZjbZ8KvvuPNZCkI+hHAW9y0aWkEVdNBFTEES2LW0GVP02v9rhd6UWqQ4ohQ66CkdJg
         ppDzvCxYY5J2VANjEABlXjTLB6yMr0E3DeMjugk755x1X4mPGrn8+4bqSraopGsDhlpL
         izBotDOjYbu2uUeLrxSobcKQvV4oVOvzDbARwC1r6npoBBRxyHYICoYyryXv1SBy9ba7
         1NG9Iozvon8bZVeN1XYXLagtB84lWNojkgeSS/werDjtjd6XoWv7kHnI6TjBw3acJxR2
         ZoVcwzzpm/VofIsMK1T8EDxDK9l4eouabCF5DrLNDthZVVs8IVgZ0b6kYjFk2oxCH6Q0
         sxiw==
X-Forwarded-Encrypted: i=1; AJvYcCX0sz/tUr2hykM3/TrxnK1ZVT4byyzarBT9s8tpTC0qo1e14nEm94t7S7cniW2FFL61jU6o0JVb+qjVPtbJRE4v5es=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yynmki/ozr2IxlpMmpT1s43O5+c3l1ix1FpPlwRgsYXFExWsM/p
	nlC8zSObCa5YXuTmuZl31iKBuES5QRxqWXuAalA8BO1vrSiIlMnxK4Et8ScHQYYD3eaCx5i1jm/
	0pNDqcuNvxoZYW4A0KTmmpgvC4ZUpsQ==
X-Google-Smtp-Source: AGHT+IG6pKju69+9VpR6JA+z5Gdu2T4WZwR/bW+kYcISByh+Gd9J3Fzghpf0FBz1k0futtBJ/4y5+Vlx8BBMyE+mPgU=
X-Received: by 2002:a05:651c:1a0a:b0:2f5:11f6:1b24 with SMTP id
 38308e7fff4ca-2fcbdf8d25amr192977931fa.18.1730847771897; Tue, 05 Nov 2024
 15:02:51 -0800 (PST)
MIME-Version: 1.0
References: <20241105183658.34982-2-schonm@gmail.com> <CAMKF1soPxY9ic1WUBPL4iXFgKA6eV8F0a8ab0nDvVfkyJ4Na8w@mail.gmail.com>
 <CABTo8gA+4kJDeMOWOWqiAcwZdCa9XFxpVq9cyAQXQUD_dUFz8Q@mail.gmail.com>
In-Reply-To: <CABTo8gA+4kJDeMOWOWqiAcwZdCa9XFxpVq9cyAQXQUD_dUFz8Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 6 Nov 2024 00:02:37 +0100
Message-ID: <CA+chaQeHTahXvMFvrG26LUz3kJZoU1huGuPYGo7bRcvXEro5pQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 0/161] Drop unnecessary SRC_URI md5sum
To: schonm@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 23:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113679

Why not send all these simple one line changes in single commit per
layer? They aren't controversial nor need separate explanation for
each recipe.

On Tue, Nov 5, 2024 at 11:59=E2=80=AFPM J. S. via lists.openembedded.org
<schonm=3Dgmail.com@lists.openembedded.org> wrote:
>
> I did indeed run into mail throttling.  I will keep my submissions
> shorter in the future.
>
> The remaining 100-161 should be on the mailing list at this point.
>
> Please let me know if you encounter any issues.
>
> Thanks,
> Jason Schonberg
>
> On Tue, Nov 5, 2024 at 4:10=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > Thanks for this much needed cleanup. I see that it says patch 0/161,
> > but then I only see 99 patches on ML.
> > so something is amiss here. I wonder if there is some throttling on
> > mailer or some such. so perhaps send 100 onwards
> > as a new patch series. If nothing works create a pull request
> >
> > On Tue, Nov 5, 2024 at 10:54=E2=80=AFAM J. S. via lists.openembedded.or=
g
> > <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > Following the note in section 5.5 found here :
> > >   https://docs.yoctoproject.org/dev-manual/new-recipe.html?highlight=
=3Dmd5sum#fetching-code
> > > drop the use of the SRC_URI[md5sum] where SRC_URI[sha256sum] is alrea=
dy being used.
> > >
> > > Thanks,
> > > Jason Schonberg
> > >
> > >
> > >
> > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113678): https://lists.openembedded.org/g/openembedde=
d-devel/message/113678
> Mute This Topic: https://lists.openembedded.org/mt/109411793/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

