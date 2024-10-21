Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2238ED3C92F
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 02:30:25 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.37327.1729477818299518093
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Oct 2024 19:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YV/OG71v;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-71811c7eb8dso1080830a34.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Oct 2024 19:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729477817; x=1730082617; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TaiHWHE3Z+TE9z53VkN98wOOyg0CumIyQR+PluF3Z8=;
        b=YV/OG71vjDodRg1c6q8zN3EIRsqadtA3i6hW+gGx9Oqtn2w4s9nc7USgLsYxWtr7tJ
         7NrPsThyQedpRmpag9Mq/u24YBO9jEGqao9x3DMtovH0jNiqNGbFmaNOpceps99kMh4i
         QtjD0zqx4xKRLE/t2ncULu+9T3RNa+hBXceTdQwDoOXQiyxs9i7/Mf2GW9EPwJXbHLlm
         e1/9ya8QERixvs2JZfQfQ4AWuzT2T990b4sgajTrMN6k0z03B0W49MippSbCKZawFK6r
         aoki9Q/yYCmGl+2XRmaA91SS57b1Tl5/soAmlCa5auw1jWYfYt1/cnEhNS/jtMFqfyNZ
         UJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729477817; x=1730082617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TaiHWHE3Z+TE9z53VkN98wOOyg0CumIyQR+PluF3Z8=;
        b=J6nxECUbAYJwOw3pPRyNyOcQa+71ITLURcPZu2sWwHt4aN3SquwM/AO/KIGITSSwvw
         /FcsZKayWCZ3HhEV/tLnTWzSeNPgkVywtPCqa5Cqm2TwEMCQS98UrFOG/uoY2IU1od4z
         iHI+B6vvzw4Y1TXdqdhJxfLuO/ny3HnPwZbVvRyrEy28v5NKV7M630pYgLWSkxhOKog8
         OiaLMi/nYZKx4cLA8M6HOiRER5LmGJsrKrRJ1xPBz3HHz1kv72E8BFL3p5Am5Q/M4WeH
         o2jYdEHCpSWxh+DBaXAxiihN9NJ4nqAWvTzPgMDeo6wnNxcib+I1LnO5udNTU2yV4E9y
         08/w==
X-Forwarded-Encrypted: i=1; AJvYcCUafvQjVyP4QO2/2wLvBnsXnMAIx7Q8I+OyPvXt/8vYV16OzJzD/GU+l2q417eQjQ86kNwCQXuEG4c3QLHhqci0g1Q=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy186ze8innyNOhuGcjxM4rhEbTwf8qGHKxRuu4dm/F1FG0OmNp
	TXYLWQjA7w0KxcWOYADEzR3ipZzFmQo/Ur0IN9MivsH6+SVhqCpeitQKxgwjWc2MuZ1J9ymMIjH
	O0p45TxbDligoaYoAzZFIEzluOOs=
X-Google-Smtp-Source: AGHT+IErlBnyajwjEhBX1PC3CGG1YJIn/GocQ6+GvJpehmrtIHhHRTB+nirDInOQqHsUaMoMwIupCMRzyaGYF3wyqsM=
X-Received: by 2002:a05:6830:4494:b0:718:1751:8692 with SMTP id
 46e09a7af769-7181a819c30mr5329798a34.17.1729477817307; Sun, 20 Oct 2024
 19:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
 <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com> <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
In-Reply-To: <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Oct 2024 19:29:51 -0700
Message-ID: <CAMKF1sqr6WcQHBXietnNMmVqSFq2wenkMtfLSqyD5OCRxeirEQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	openembedded-devel@lists.openembedded.org, 
	Phong Vo <phong@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, 
	Quan Nguyen <quan@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, 
	Thu Nguyen <tbnguyen@amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 02:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113070

Chanh

Can you send a patch on top of the latest master, I have applied the
v2, so please send delta which fixed the musl build as a new patch.

On Fri, Oct 18, 2024 at 12:19=E2=80=AFAM Chanh Nguyen
<chanh@amperemail.onmicrosoft.com> wrote:
>
> Hi Khem Raj,
>
> Follow the error log, I tried to use the musl cross compiler
> (https://musl.cc/) to compiler https://github.com/CodeConstruct/mctp and
> report error to mctp maintainer. Jeremy fixed this error by commit
> https://github.com/CodeConstruct/mctp/commit/0629ec8976b1d56c17db51805f64=
7bf35f4bfd3b
>
>
> Now I'll push the patch v3 with latest commit from mctp repo.
>
> Khem Raj, How can I run CI on meta-openembedded manually? I would like
> to verify errors from CI failed before push patch. That will help us
> work on the patch quickly.
>
> Thanks,
> Chanh
>
>
> On 18/10/2024 03:46, Khem Raj via lists.openembedded.org wrote:
> > ok, now it fails for musl target see
> >
> > https://errors.yoctoproject.org/Errors/Details/809802/
> >
> > maybe you need to include linux/socket.h to get AF_MCTP address family
> > definition
> >
> > On Wed, Oct 16, 2024 at 11:36=E2=80=AFPM Chanh Nguyen
> > <chanh@os.amperecomputing.com> wrote:
> >>
> >> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> >> ---
> >> Change in v2:
> >>    - Fix CI failed                              [Chanh]
> >> ---
> >>   .../recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.bb}       | 6 ++=
+++-
> >>   1 file changed, 5 insertions(+), 1 deletion(-)
> >>   rename meta-networking/recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2=
.0.bb} (93%)
> >>
> >> diff --git a/meta-networking/recipes-support/mctp/mctp_1.1.bb b/meta-n=
etworking/recipes-support/mctp/mctp_2.0.bb
> >> similarity index 93%
> >> rename from meta-networking/recipes-support/mctp/mctp_1.1.bb
> >> rename to meta-networking/recipes-support/mctp/mctp_2.0.bb
> >> index bf3961be4..62044e007 100644
> >> --- a/meta-networking/recipes-support/mctp/mctp_1.1.bb
> >> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
> >> @@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only"
> >>
> >>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29d=
c61db21"
> >>
> >> -SRCREV =3D "a591ad885aa28f113cb45870b2fd5bce48378d6f"
> >> +SRCREV =3D "9986862f88fd6e6ca75e2a29236cf332d640e600"
> >>
> >>   SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;proto=
col=3Dhttps"
> >>
> >> @@ -13,6 +13,10 @@ S =3D "${WORKDIR}/git"
> >>
> >>   inherit meson pkgconfig systemd
> >>
> >> +EXTRA_OEMESON =3D " \
> >> +    -Dtests=3Dfalse \
> >> +"
> >> +
> >>   PACKAGECONFIG ??=3D " \
> >>       ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> >>   "
> >> --
> >> 2.43.0
> >>
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#112970): https://lists.openembedded.org/g/openembe=
dded-devel/message/112970
> >> Mute This Topic: https://lists.openembedded.org/mt/109059332/9027231
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [chanh@os.amperecomputing.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

