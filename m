Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A469C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 07:45:57 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.9735.1714463150568233264
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Apr 2024 00:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GWX14JZH;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51967f75729so6353762e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 00:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714463149; x=1715067949; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZxBqhwRSbUBY4ib5Am1wbpDR9o2fKRpIQHu707Rg4g=;
        b=GWX14JZHXVkdkd9VDganJVHJXu0K3EQiO/VuiGndsSjkgqjf2WvrZQKhDNz3+EV/8H
         b0F0z7b8gAZUhKN0ZZ3+RAJqJ9HBdEfw81+nC84jh9XLA2hP8UUcCQhSPlEr6gc4Bc1R
         K73DH4yVVFeWYII16DwG5eCo0eldtzIWOhIp5Rcn9QGhzWTtiE9Mnr0zMabDQEzc0gNV
         nijQfgzcZKwFUNl1nO7qeLebcuE6tHkPfQcv5NxIzrDp2bhA3EL4ydMQdet+NniYSwkL
         IIP64UCnRmlLiOcMS3u5hFjyRMGPI2PiJbcOsXEl98LFHsC/uQ6vGeMwloFNfpoldTgb
         9ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714463149; x=1715067949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZxBqhwRSbUBY4ib5Am1wbpDR9o2fKRpIQHu707Rg4g=;
        b=BvIle3m9OYpYXPquN6vxPe8kVou8hqdNmwlhYtXu/SWN+fA9tjnVO59nVIyD52k038
         QjHik+6uaqNkzIGrCeJr/vXPAZVmfRy34jyahBWXB71xDwJz7Vm1UF0iYQD6RGnym2LV
         EsHdgFYTx8sF1fdpKdUMIycs5+XUT3n0Q/d0j5kjtBSvgvXoTDpRsU5q/geFrxs9Xn0N
         Ih4fvWOe7DjGI57l+sloqiUCC+roAP58l8jz5A/h4apFbx5v0nBM242eBBkuRa7GjUut
         rbaGBNOKMYci9zgI9y2ZhM5bTbPsjZOxTCyHACoLrpVk6kFXWiufxZ5K7CxAiAbmApLk
         UHsA==
X-Forwarded-Encrypted: i=1; AJvYcCUvMES6uC5odv6luiXC9Y09UaKSdPwafHGRQMwDT6BWGe9Y7Vqm5q9OSzNhSRz5cch7kLaFSSBWMY7Obak+xBgybY0dR190gRwWd3qlH6I8r8UGqf5vC9H2jA==
X-Gm-Message-State: AOJu0YxFw2EDxln7Do09q7xjUeOmH0ycmAgnRkcU1W0vWNVcA1ZCLQCs
	of/Rf41ngHiyhK+Gnujv5LnrelEHwAdms0/ZByZXU8JJVDskSVZjzsSzi+1jUviagCGK4ccNHAY
	t6OWrN2nOodaFKB5K7Z1Fl1f1518=
X-Google-Smtp-Source: AGHT+IEfK24A/Wyv/Eex5OfSFebPIqBI+hBBuzk51+61FnGSTunx0awDVGaMsIr52IdNTDptgIvGwjlbofBvgmtqfvQ=
X-Received: by 2002:ac2:4342:0:b0:516:d0c2:755 with SMTP id
 o2-20020ac24342000000b00516d0c20755mr1217211lfl.63.1714463148266; Tue, 30 Apr
 2024 00:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240327071636.2207445-1-mingli.yu@windriver.com>
 <20240327071636.2207445-2-mingli.yu@windriver.com> <CA+chaQdkCsa2P-qJ5A-fQ5=n-sAmeHXLooBW3nsbrrLHPgSLjw@mail.gmail.com>
 <97b9c07e-0d17-4c9b-9449-212bc9ee78f3@windriver.com>
In-Reply-To: <97b9c07e-0d17-4c9b-9449-212bc9ee78f3@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Apr 2024 09:45:36 +0200
Message-ID: <CA+chaQe=-D2t+T9j9=cppJLJZufhKuTiUuqDH0eC6+aCsbdt-w@mail.gmail.com>
Subject: Re: [oe] [meta-python][kirkstone][PATCH 2/3] python3-pyyaml-include:
 switch to pytest --automake
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, tim.orling@konsulko.com, 
	Ross Burton <ross.burton@arm.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 07:45:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110193

On Tue, Apr 30, 2024 at 9:28=E2=80=AFAM Yu, Mingli <mingli.yu@windriver.com=
> wrote:
>
>
>
> On 4/30/24 15:16, Martin Jansa wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Wed, Mar 27, 2024 at 8:16=E2=80=AFAM Yu, Mingli <mingli.yu@eng.windr=
iver.com> wrote:
> >>
> >> From: Tim Orling <ticotimo@gmail.com>
> >>
> >> * Also replace ${PYTHON_PN} with python3
> >>
> >> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> (cherry picked from commit 182f31a182f6572a3538b875cec7ee761e2da1e6)
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ...
> >> diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-includ=
e_1.3.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3=
.2.bb
> >> index 9bfaa2194..3a5bd99a7 100644
> >> --- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2=
.bb
> >> +++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2=
.bb
> >> @@ -2,7 +2,7 @@ SUMMARY =3D "Extending PyYAML with a custom constructo=
r for including YAML files w
> >>   HOMEPAGE =3D "https://github.com/tanbro/pyyaml-include"
> >>   LICENSE =3D "GPL-3.0-only"
> >>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673463ab874e80d4=
7fae504"
> >> -DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
> >> +DEPENDS +=3D "python3-setuptools-scm-native"
> >>   SRCREV =3D "36b6975aa8fc7a6cbf37de40aa2ed6d996b2f7be"
> >>
> >>   SRC_URI =3D " \
> >> @@ -20,9 +20,10 @@ do_install_ptest() {
> >>   }
> >>
> >>   RDEPENDS:${PN} +=3D " \
> >> -    ${PYTHON_PN}-pyyaml \
> >> +    python3-pyyaml \
> >>   "
> >>   RDEPENDS:${PN}-ptest +=3D " \
> >> -    ${PYTHON_PN}-pytest \
> >> +    python3-pytest \
> >> +    python3-unittest-automake-output \
> >>   "
> >
> > This was now merged to meta-oe kirkstone, but the
> > python3-unittest-automake-output isn't available in oe-core kirkstone,
> > causing:
> > ERROR: Nothing RPROVIDES 'python3-unittest-automake-output' (but
> > meta-oe/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.=
1.bb
> > RDEPENDS on or otherwise requires it)
> >
> > python3-unittest-automake-output was added to oe-core in mickledore:
> >
> > openembedded-core $ git log --oneline --
> > ./meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb
> > db0e82135c python3-unittest-automake-output: upgrade to 0.2
> > 961e4f3fc7 python3-unittest-automake-output: add new recipe for ptest
> > integration
> >
> > Please revert this (if the newer python3-pyyaml-include works without
> > this change) or add python3-unittest-automake-output to kirkstone as
> > well.
>
> The python3-pyyaml-include did works without
> python3-unittest-automake-output, but the python3-pyyaml-include ptest
> needs python3-unittest-automake-output and I also sent the patch to
> oe-core(kirkstone)[1].
>
> [1]
> https://lore.kernel.org/all/20240327072236.2221619-1-mingli.yu@windriver.=
com/T/#mda91919809cf156aba24f099bef65142067cd318

[1] was rejected by Steve, so what's the plan now?

