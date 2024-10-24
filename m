Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A470CE8E6B
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 12:18:57 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.13211.1729772335623121570
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 05:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AgGPEwov;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5ebc0dbc65dso453507eaf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 05:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729772335; x=1730377135; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0isuJFjN8T/XJGrUvAFTDaoV0AcNuYbhCKXlLs1m044=;
        b=AgGPEwovvPDqojESshMxZ4NnMsQ5aKHJP0zTA2EWZF+W0MfW4iffbikq1EhOC/zcFj
         2SYgWV2PN5B8IZb0wlJRLjvJaJNMvzFGxO4q9Ik1aLG8Nxw+DdyeluCs821T80c8kQlg
         8LqeyJbxEPFJzdxGDKRua/cjxUDM7pviQ+RddEbqk74rEEzn47Lz/wrbT4zcWk/rulmc
         kzpQRsTjs5LtMTjLhr/NkHq7rIscZTeM6PQzVSCrrBtF2aAG8oWYcCLQpdeowPZKesMI
         H0AhkGK8DM5t6m4wgCG5vY4XTqa/I7wzDQsLKvjmWB5LOWAio+6BNCvZzhLaWhxohocl
         Wgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729772335; x=1730377135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0isuJFjN8T/XJGrUvAFTDaoV0AcNuYbhCKXlLs1m044=;
        b=h71kiFkb8JEYrnKxPrHBzPv0Q2bHduJTQjc6lEDYS5/n5wu4GwPpV34r+sOnr89vf+
         6gwnDIxRQLp5nQTjka36Vuw9x6+Mk0TRtJ4CpVgcYDol6iNbBF8+0LIYQiIsrurIWoyg
         8jrsIJRnbCRsUwyRSGYNpm8VQJvIi1nu8p7A8d1pjlUOip+YWd0m1BqGcmwiXJK2iMK3
         MCSekIyp5lM6fonPzWzAReOl2VoAtTMVekFd9DR2YrvYzZOiknphpEm1Dgb+Bb4n6Jww
         1BW5B8fcmf5yTTV1IXSm4JDsaiocFBr/dZVTbCA0UkX5UgmaOcHu2MfFd5/w3blKYqhl
         mQHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9fy07LXuRs7tQ7cWqSXI2v6lfCIbCbMLrH3PIhJ0qTeuu3grVI+4QOgfLNlfKEqyAwtOE81pM8nYoRPiNTcTWa7g=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzGzdhW5vNEKsMbB0Ig5a5PZaBuuIjRPKaQNZUAIndSK8XkreHv
	rHvS3KflbCpSWOf2DNXV3g/XUY8EVusqbzuOQigQb6eBTR5ZRVOGsAu1CC3cpn7XftGbiQmhTjP
	Z3z7INaMqgBxA+/pg8hoCInOm9Yg=
X-Google-Smtp-Source: AGHT+IGhmDGrw0aQgFwCoAHWUUQhW8zfG6mOwQcAXXsTSZGyJJd9O0du8RYnzvA25ksKO81RdPeeBUX8V2em4jQ+3Ck=
X-Received: by 2002:a05:6820:22a0:b0:5eb:fc8c:4669 with SMTP id
 006d021491bc7-5ec0525b002mr1192524eaf.0.1729772334879; Thu, 24 Oct 2024
 05:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20241024065109.74010-1-chanh@os.amperecomputing.com> <38e5da48-fc0e-4685-b615-992a1f78dd45@amperemail.onmicrosoft.com>
In-Reply-To: <38e5da48-fc0e-4685-b615-992a1f78dd45@amperemail.onmicrosoft.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2024 05:18:27 -0700
Message-ID: <CAMKF1sprL34koHC73Y9ji5ZTP2J+2W+TLDmoKjRzUR9vcudDjg@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] mctp: Fix CI build error with musl+clang
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	openembedded-devel@lists.openembedded.org, 
	Thang Nguyen <thang@os.amperecomputing.com>, Thu Nguyen <tbnguyen@amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 12:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113166

Please test it and wait it to merge before sending pull request here,
feature branches are temporary and usually not something we use in OE

On Wed, Oct 23, 2024 at 11:52=E2=80=AFPM Chanh Nguyen
<chanh@amperemail.onmicrosoft.com> wrote:
>
> Hi Khem,
>
> This is only a temporary patch. It helps check CI build errors on the
> MCTP repo. Please help run the CI build; if any error you can show here,
> then Jeremy will update the mctp repo to fix errors.
>
> Please don't merge this patch. When the CI builds completely without any
> errors, I will push a new patch with the latest version on the MCTP repo.
>
> Thanks,
>
> Chanh
>
> On 24/10/2024 13:51, Chanh Nguyen wrote:
> > Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> > ---
> >   meta-networking/recipes-support/mctp/mctp_2.0.bb | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-networking/recipes-support/mctp/mctp_2.0.bb b/meta-ne=
tworking/recipes-support/mctp/mctp_2.0.bb
> > index c6aa7c104..793afe755 100644
> > --- a/meta-networking/recipes-support/mctp/mctp_2.0.bb
> > +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
> > @@ -5,9 +5,9 @@ LICENSE =3D "GPL-2.0-only"
> >
> >   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc=
61db21"
> >
> > -SRCREV =3D "f110926b082731b25720b444378ad55d7a9d451d"
> > +SRCREV =3D "089dc53fa7387cca517cd713061c323ca06fb6dd"
> >
> > -SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protoco=
l=3Dhttps"
> > +SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Ddev/cross-fi=
xes;protocol=3Dhttps"
> >
> >   S =3D "${WORKDIR}/git"
> >
>

