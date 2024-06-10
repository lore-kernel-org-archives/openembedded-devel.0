Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A385C27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 20:23:43 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.30078.1718051013243011796
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 13:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Spa0qII3;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-250671a1bc7so2369274fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 13:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718051012; x=1718655812; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9jWEhOwYLQw6PbUcFxttnGDHncmAbpSyQEy6PtaiRc=;
        b=Spa0qII3GcH0TvbX1d5pHhdxZBGZr7in4djMfQbP9tkr8NiDxtGkXBlYDaMIkGBaC1
         Jjhr46EcRLbI0L98FNsPDY3MvvxK3g8J2hiXvjuVupSY7kWjgBHshX/JKf41YBVOaW0J
         cjWdM1KE1k4dOD6josTfcHbhnofgpTFCdCJLKtaBjERHKmRVXmwm19LmZo8SfnpvneF/
         drfiabN65Dtv4MdxHzdWQzhrdWEGjgcBGTpPJuQWkSB8OWMbJwd4aNVqOQeIEqL66LYc
         i7FF8kml8HOoD7MMKDOcIEl0sA6DYU7xceQWkbeL9tutOuU8iCbPWA2GckK+BmVluMVD
         MKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718051012; x=1718655812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9jWEhOwYLQw6PbUcFxttnGDHncmAbpSyQEy6PtaiRc=;
        b=TYUH7xMac47GOgWH0x9S1ESgdfNcwWE4rFmLzD/78p0jRveDSUG22io01TOpbghC7w
         EG3B/bh6kzCJrATUkDMuR3gr/bUJP8iqtWymGRtqH3S8xYS/p/eGq/Us9Ua4RMT11j8k
         BsgsECna8JVOUqcIXJuHE3es/ZQH5t0g7Q3V6iB762Y3XuGISV/+qf9E0Il2r/5mmKYk
         Swu6dekFiLag+NaRnHljJ+Agm7t8IWibA1st8oqY+8fdYIwPdXbWdYtaISa0/OwcOMnL
         WQfiI9tB20Hp4ya8wZn8qDwELRvYf04T/HpsvLAPvV1aChVmgIEOn1U+w4hPtB/DwFI6
         z6aA==
X-Gm-Message-State: AOJu0Yw3YdNMgOwt/dIpWZ931pgLGbibBfUV6xon1UuIUez3EikpWD4y
	FbY2Jlo+i4ssySnUto9MkWTaBpeE0qWwpOAU9eRWeNe1blWFAKShDj9km+i1+2EdjmfOr9aouRz
	2LRSztLTyzbUGByxT3RVgIpbZk2U=
X-Google-Smtp-Source: AGHT+IHWQT9fpu6REQAuOUk+o8WvW0W/LjKE6QfZkvIqRF3TElWfLToOpdgJu/IC2zabDO45qIxXzHPxltEVRWxbJl0=
X-Received: by 2002:a05:6870:d187:b0:254:bc92:9b97 with SMTP id
 586e51a60fabf-254bc929e3dmr5363113fac.57.1718051012443; Mon, 10 Jun 2024
 13:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240610182058.2286377-1-raj.khem@gmail.com> <CAMRc=Mc3e8PdFPHRCcPMvE4Js+utpwN-oXzaHy2w9976tWa7ig@mail.gmail.com>
 <CAMKF1srw9-pcKB0Z08uxZYbD2R1WK9VUv5vsiGC-AAqk8pwKqQ@mail.gmail.com> <CAMRc=Mef6nXpD02jNMOJjc4xcF-Nnv0cmhzxmxDu3xbUs4Y02g@mail.gmail.com>
In-Reply-To: <CAMRc=Mef6nXpD02jNMOJjc4xcF-Nnv0cmhzxmxDu3xbUs4Y02g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Jun 2024 13:23:06 -0700
Message-ID: <CAMKF1so9xFs=2-47kZjiOD5Ec4H0qVMKZz-PQrBfEkTGRDD9Pg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod-1.x: Disable ptests and fix build
 on musl
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 20:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110806

On Mon, Jun 10, 2024 at 12:56=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Mon, Jun 10, 2024 at 9:31=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > On Mon, Jun 10, 2024 at 11:34=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> > >
> > > On Mon, 10 Jun 2024 at 20:21, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > libgpiod-1.x is still in use by some BSPs e.g.
> > > > variscite SOMs, so we can not get rid of completely
> > > > so give some time to move away from 1.x and disable
> > > > ptests as they need older version of catch2 which is
> > > > being removed
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > ---
> > >
> > > TBH I still support v1.6.x as this is what Debian stable still ships
> > > with (and will continue to for some time) so how about dropping only
> > > C++ tests?
> >
> > Should be ok I guess, would you mind sending a hint on top of this patc=
h
> > how to do it ?
> >
>
> On top? This patch should be dropped and logically split into two.
>
> The musl fix is already upstream as commit f6444fb306d6 ("core: add
> missing #include for basename()") which allows you to set the
> Upstream-Status tag to accepted.

Right, I have divided this into two patches and added the backport info to
musl patch, thanks.

>
> I will send an alternative version tomorrow morning.

cool. I will drop my workaround from master-next once you send it

>
> Bart

