Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728FCC77B7C
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 09:02:32 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web11.9552.1685523747195007373
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 02:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=1Yr3Uw9R;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.217.52, mailfrom: brgl@bgdev.pl)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-437d6a60763so523906137.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 02:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685523746; x=1688115746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eywlWXyL1gWHslE8MSaHHT2qmUFi6FrHXAe5QPMMpsw=;
        b=1Yr3Uw9RxHyeQIn7IKelSGI9ff//zlAeONx5H9XDKPMRJZigz0WrvUqUbCI17sRgPO
         fLXTxbC8St5qWtCudTU0/XLyK3z2HYoixjXAaKB463YNPbG22qfS1D1gqroDxEQLmHxo
         RxHZusSplybQg6EqBAAouLLCj1TIOBOn/BTg5zuE2DLBUtUlAxNYQlE9cpQP406W1Y/r
         k6vUnhr0XHObIKVt1th47ABZQW27njTVfWCU8YzqGTCkslnyrLaNWFgl+Ca0Fu0L2FO+
         K9iFAOeioJlPE6FAJaqOydG1lDCGlcsQpWRDjdWlv5RpWHnJlejGs44O3lRAeZ+a/SPF
         Cuqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685523746; x=1688115746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eywlWXyL1gWHslE8MSaHHT2qmUFi6FrHXAe5QPMMpsw=;
        b=iK3OZUe9ckhxeslAemA0LtFhUzzNUY27sxPUV6Sfh7s/K8REjzi2LTvN/8lZkoo0cp
         KovRObvjQVUMcZ0FtgjiGiG3lzUCW4c9i/YheeDDNUpEPK5gT/qd8h5Doyfw3yPGgs0F
         x66m/4M6LM5h4lD27tlUWYqIaqYFsqwXdigeopzRAXcq44MRAnPlLWackMKR9CeSnWMe
         gRkgKZQtjQnIN2VpIphJct7HkJH0QqP4oCl8YvohzYvzl6j4aJDHQSvw81Mc68b6CSx9
         xk6j5dGrtcTWPRb/S7GLyQPO4bb/Y5+ER4+pwT4/m62xbvcGN6x3J6mJwiOHzTFusHL7
         7iUQ==
X-Gm-Message-State: AC+VfDzmYStbOcYmpE6pOSBMHZl4c0vOc9ijcMWlBB+mE1Eo9Ta8q63M
	wycs6VNiLhtJ/5zxr4HjvCZI9oDbXxXRYlSMq2WJRg==
X-Google-Smtp-Source: ACHHUZ4a041fnROgxY8j/ahHpXaAhTSbOQCY2G5NmvX/2WRBQR9ymV9g4B+wJxW12bJIPHVZG8q7ZAMN6RkLerh5vzA=
X-Received: by 2002:a05:6102:374:b0:439:4fb6:83fa with SMTP id
 f20-20020a056102037400b004394fb683famr4430458vsa.9.1685523746274; Wed, 31 May
 2023 02:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230531082437.10646-1-brgl@bgdev.pl> <45fcfa94-0f71-47af-3eb8-2091d3c8d0db@windriver.com>
In-Reply-To: <45fcfa94-0f71-47af-3eb8-2091d3c8d0db@windriver.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 31 May 2023 11:02:15 +0200
Message-ID: <CAMRc=Me-r_8sj_9-OVo0kYHDVu2aNXpJLjdxu0AptVo=78nZrg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 000/149] python3: improve run-time
 dependencies situation
To: ChenQi <Qi.Chen@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 09:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103028

On Wed, May 31, 2023 at 10:55=E2=80=AFAM ChenQi <Qi.Chen@windriver.com> wro=
te:
>
> On 5/31/23 16:22, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > A significant number of python recipes don't specify all the run-time
> > dependencies required to at least be able to import all the installed
> > modules. This series is the result of a semi-automated run through all
> > python recipes in meta-python, building minimal images and verifying th=
at
> > there are no import exceptions.
>
> I checked a few changes. Why are some recipes adding 'python3-unittest'
> as a runtime dependency?
>
> For example, python3-ldap does not seem to need it. I checked the codes,
> https://github.com/cannatag/ldap3, all unittest references reside inside
> the test/ directory.
>
> If it's a semi-automated run, then when it fails, I think the failed
> import commands could be recorded and put in the commit message. This
> could be achieved by using a template commit file which is then
> substituted to generate the actual commit file and using '-F' option to
> commit.
>
> Regards,
>
> Qi

In this case it's not ldap itself but slapdtest which is also shipped
and installed by the recipe. If someone ends up splitting it into its
propert ptest package then we could remove this dependency but as it
is now: it's impossible to import all shipped modules without unittest
so adding it at least makes it more correct.

Bart

