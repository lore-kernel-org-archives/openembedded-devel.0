Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BBECA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:15:57 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.35398.1725272152801437880
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SgjV55Wt;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c210e23573so4120848a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Sep 2024 03:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725272151; x=1725876951; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNqVSGAAuI/xi6xGH7yRSSSPYmhb+uxjf4UBsfUdeB0=;
        b=SgjV55WtdepDbcFrMjgsLQ/Y9Puk22MB6jEzTK9i819+xr6jON6QYf+ULEtY8VpR3T
         OfbpFYQeawqyf0mr98LJ/LkVHmj8ZNul+RHJFQFcFX1l9i2ODeb8OD1tVPc1zMRUDXkP
         idfCG6VlfN/9h1/eTTcJWsUoNfHN/sXRFxJ1EkLscR7DSdNTNGqA8suXoYsqRjLDhfCq
         CQGWijTQqrPG9Txz7aYziF0p9394eREBO5vYcaHvLBZJ1lY+RMoA4yOH3Lal6KFRbBAp
         Tx4CcBH1ilnyFc7S0VayU/SD4E3yX4Nce6u4thM/3/ZtuIJHdbNJdTvP9wUkx8mQu3tH
         n1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272151; x=1725876951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNqVSGAAuI/xi6xGH7yRSSSPYmhb+uxjf4UBsfUdeB0=;
        b=YeeByiGqHtF4K9dBg0DVOAsC1mfroRxp4pdsVzoR/IEayvSJW+gK9elsKXPXOws+X2
         couWDIhDjs3wn0e0R5JI2UbO2CMvDtBOeiUreoqUBuMmQjVZD4Hqf02VXdvVACkDSRC1
         rl9RTpHf0ONUMagaf1ttgKWqSdNrAuB2/vLqSaeivqqPcQnRM74RT6LRO9J6r3QAdEh3
         3qhKMKmBCoJLgUMgXqKweCkp16pZ4V8s3+kWqspTsbgz72wm2uFggK2WacWsbUUcm2Ff
         ENiNwdP6tJ/yQn6fqL6o7JfsivjEtlrfIg4O7B7Mvsux17x0JhVjo6B4r3E4GnDI7J9d
         x6yw==
X-Gm-Message-State: AOJu0YzCaOni8a5OiEOkLUBi9dckzCZpawv/EHKBsJ0Nb05sgWjEU30E
	KaU/j6jalVJjwoR5KUtMHsDjmI9ezIq6TWnUXHmHR8PRD1sVH8NkLYTmeiPet+XLhuzGdzob3lE
	TNw5FM6S4w+DbYmj0wwwMfC00IOw0RA==
X-Google-Smtp-Source: AGHT+IFGN6WUUTDWxzE+haixvnzDlNJL+coJFDwLaZaTQHruwYCBpjaL3jUEK3O3EkTVhsZzV30Z7RyAYSo83LHeEFk=
X-Received: by 2002:a05:6402:5241:b0:5a3:a4d7:caf5 with SMTP id
 4fb4d7f45d1cf-5c25f2739cemr1205998a12.36.1725272150362; Mon, 02 Sep 2024
 03:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240902093432.2865221-1-dmitry.baryshkov@linaro.org> <2cd0f5f1-a7d6-45f1-8edf-46d03dab6657@smile.fr>
In-Reply-To: <2cd0f5f1-a7d6-45f1-8edf-46d03dab6657@smile.fr>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Mon, 2 Sep 2024 13:15:38 +0300
Message-ID: <CALT56yMHxXuKXbDsszok3wh=cW7ooN0VPMb+nc4qQG7dG3g-oQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] README.md: discourage use of GitHub pull
 request system
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Sep 2024 10:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112071

On Mon, 2 Sept 2024 at 13:13, Yoann Congal <yoann.congal@smile.fr> wrote:
>
> Hi,
>
> Le 02/09/2024 =C3=A0 11:34, Dmitry Baryshkov via lists.openembedded.org a=
 =C3=A9crit :
> > Sending patches via GH results in the reviews of a lesser quality.
> > Discourage its usage and point out that developers should use emails
> > only.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  meta-oe/README.md | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta-oe/README.md b/meta-oe/README.md
> > index 676a2c89252a..0e9d43c10f91 100644
> > --- a/meta-oe/README.md
> > +++ b/meta-oe/README.md
> > @@ -24,6 +24,10 @@ When sending single patches, please use something li=
ke:
> >  You are encouraged to fork the mirror on GitHub https://github.com/ope=
nembedded/meta-openembedded
> >  to share your patches, this is preferred for patch sets consisting of =
more than one patch.
> >
> > +Note, it is discouraged to send patches via GitHub pull request system=
. Such
> > +patches get less attention from developers and can be mishandled or no=
t
> > +reviewed properly. Please use emails instead.
> > +
>
> Doesn't that contradict the paragraph just above? For context, it says:
> > You are encouraged to fork the mirror on GitHub https://github.com/open=
embedded/meta-openembedded
> > to share your patches, this is preferred for patch sets consisting of m=
ore than one patch.
>
> For example, I actually felt encouraged to use the Github PR system for s=
ome contributions (with more than one patch). But maybe that was wrong... :=
/

And the next paragraph mentions GitLab and repo.or.cz. After several
discussions on GH I think that it was meant as 'use these services to
push you patches and then send a pull request by email using git
request-pull'.

>
> Regards,
>
>
> >  Other services like GitLab, repo.or.cz or self-hosted setups are of co=
urse accepted as well,
> >  'git fetch <remote>' works the same on all of them. We recommend GitHu=
b because it is free, easy
> >  to use, has been proven to be reliable and has a really good web GUI.
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#112069): https://lists.openembedded.org/g/openembed=
ded-devel/message/112069
> > Mute This Topic: https://lists.openembedded.org/mt/108223947/4316185
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[yoann.congal@smile.fr]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> --
> Yoann Congal
> Smile ECS - Tech Expert



--=20
With best wishes
Dmitry

