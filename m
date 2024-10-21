Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68770D3C92F
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 03:18:05 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.37951.1729480683686853758
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Oct 2024 20:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hKjcnUWR;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7183a3f3beaso31580a34.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Oct 2024 20:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729480683; x=1730085483; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKM0IcII+sgEuNlmEJeV/viKwDI1BvS9SePrevS6X20=;
        b=hKjcnUWRGOwaTJCjiJI5s8jVAROQULmHX6v9vooD59knw9mnM2gqIYHczMFINhVypv
         jF/8PrnYN/d4CFYgZeqjrclAvImRi61kBvTlx5dV2oEtXX/9OQ+h0t3sm54m+cvO/4ez
         d8GV13fpn8je8y2HpHw4ULGBIxcLIJf82WMP8NfH2tG3AVcBbxUw1PE6KqyeVuATo09q
         m4Wkr0GqUWgIBDzHXLvuqGSCiFYbCFFWYdy68SDIxkrXWOE3H249qfmoL2mjgy7uQXvc
         oF/idMMeAp4op39H7Rtfu235I/CDrGnJpkfiZ/QRMonYHcws80mBoaHHTCYdidLaJ1wN
         Lh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729480683; x=1730085483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKM0IcII+sgEuNlmEJeV/viKwDI1BvS9SePrevS6X20=;
        b=QCF3GnxD2HIRuItWJ1M4BJMde1BHvcQLQbK9yS8DlWDf6kWYkQp/kJciNqkbKUlAmk
         CxdmMvCkSLyr03u+MNZQs22k7LjfEkoAMLNQpyZaV+tdnmBsBHGXJnT8kfCGalKvvBhD
         QVrbAyw6zpHK1C0g1C9vaPKXWx1xsik3F7LaMr2wUkrEDndrQrjsd1JjzZQd6g25C+k1
         X6yx4AjNc5JL+D4YFIc01JFr7kx9Xrk7KYA92vH5aiAZ12IGxN11RmYTm+OnaEZVfPLr
         WnqqiTvXoZtqyg5yPRn7Xi6Qg0IUhtJ/U5mJYHrie1cb2+CKf1EvyRnLUuv4/gL0Hm/C
         EgFg==
X-Forwarded-Encrypted: i=1; AJvYcCXtoLxVsIMevuHFczmcpoHm+KWQ1HCXxUgbMRiU+SBM8hKoMF79t05xXThbLS49M5eawxO7mPuHfb/2pN0avSlStHg=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy12ky8oeFM4nctaRhKFbElvnLKCSzZxuv2gOJqQ2K5pXeJi2tg
	Z4AdLuSE89gHy/mIxm2KZWiN+sXdCiF8GSPYiuHFzPA8lGcUZbNuzn6JAfMsLZ9VxzlA35ILyji
	hEK4DGcEQ45cCxXY6EKfS5cluRLo=
X-Google-Smtp-Source: AGHT+IEOaf2Uih+30pue5I/gxxJCdnbkZs05f80gTOjgeIfMYVRdW8UYun0ebxUMOUuxwG1urhftIXUHuOx07E8qxNk=
X-Received: by 2002:a05:6830:34a9:b0:710:f3cb:5b85 with SMTP id
 46e09a7af769-7181a8313e2mr7016581a34.6.1729480682895; Sun, 20 Oct 2024
 20:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
 <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com>
 <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
 <CAMKF1sqr6WcQHBXietnNMmVqSFq2wenkMtfLSqyD5OCRxeirEQ@mail.gmail.com> <7eebebc1-6c64-49e2-976d-247c8c0fd22c@amperemail.onmicrosoft.com>
In-Reply-To: <7eebebc1-6c64-49e2-976d-247c8c0fd22c@amperemail.onmicrosoft.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Oct 2024 20:17:36 -0700
Message-ID: <CAMKF1sp0ujF6n6TT_o5vcH=n-ZmcawockNNcxOArbiRkLZNjbw@mail.gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 03:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113072

On Sun, Oct 20, 2024 at 8:02=E2=80=AFPM Chanh Nguyen
<chanh@amperemail.onmicrosoft.com> wrote:
>
>
>
> On 21/10/2024 09:29, Khem Raj via lists.openembedded.org wrote:
> > Chanh
> >
> > Can you send a patch on top of the latest master, I have applied the
> > v2, so please send delta which fixed the musl build as a new patch.
> >
>
> Hi Khem Raj,
>
> I saw my patch was merged to the master branch of meta-openembedded
> https://github.com/openembedded/meta-openembedded/commit/b51e4288b93a9746=
7b1d7dd77b4fab537bc311e3
>
>
> I haven't understood your comment. What should I do now?
>

We still need to get the fix for musl build. So instead of doing the
musl fix included in original patch
do it as a new patch on top of what got merged.

> Thanks,
> Chanh
>
> > On Fri, Oct 18, 2024 at 12:19=E2=80=AFAM Chanh Nguyen
> > <chanh@amperemail.onmicrosoft.com> wrote:
> >>
> >> Hi Khem Raj,
> >>
> >> Follow the error log, I tried to use the musl cross compiler
> >> (https://musl.cc/) to compiler https://github.com/CodeConstruct/mctp a=
nd
> >> report error to mctp maintainer. Jeremy fixed this error by commit
> >> https://github.com/CodeConstruct/mctp/commit/0629ec8976b1d56c17db51805=
f647bf35f4bfd3b
> >>
> >>
> >> Now I'll push the patch v3 with latest commit from mctp repo.
> >>
> >> Khem Raj, How can I run CI on meta-openembedded manually? I would like
> >> to verify errors from CI failed before push patch. That will help us
> >> work on the patch quickly.
> >>
> >> Thanks,
> >> Chanh
> >>
> >>
> >> On 18/10/2024 03:46, Khem Raj via lists.openembedded.org wrote:
> >>> ok, now it fails for musl target see
> >>>
> >>> https://errors.yoctoproject.org/Errors/Details/809802/
> >>>
> >>> maybe you need to include linux/socket.h to get AF_MCTP address famil=
y
> >>> definition
> >>>
> >>> On Wed, Oct 16, 2024 at 11:36=E2=80=AFPM Chanh Nguyen
> >>> <chanh@os.amperecomputing.com> wrote:
> >>>>
> >>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> >>>> ---
> >>>> Change in v2:
> >>>>     - Fix CI failed                              [Chanh]
> >>>> ---
> >>>>    .../recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.bb}       | 6=
 +++++-
> >>>>    1 file changed, 5 insertions(+), 1 deletion(-)
> >>>>    rename meta-networking/recipes-support/mctp/{mctp_1.1.bb =3D> mct=
p_2.0.bb} (93%)
> >>>>
> >>>> diff --git a/meta-networking/recipes-support/mctp/mctp_1.1.bb b/meta=
-networking/recipes-support/mctp/mctp_2.0.bb
> >>>> similarity index 93%
> >>>> rename from meta-networking/recipes-support/mctp/mctp_1.1.bb
> >>>> rename to meta-networking/recipes-support/mctp/mctp_2.0.bb
> >>>> index bf3961be4..62044e007 100644
> >>>> --- a/meta-networking/recipes-support/mctp/mctp_1.1.bb
> >>>> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
> >>>> @@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only"
> >>>>
> >>>>    LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a=
29dc61db21"
> >>>>
> >>>> -SRCREV =3D "a591ad885aa28f113cb45870b2fd5bce48378d6f"
> >>>> +SRCREV =3D "9986862f88fd6e6ca75e2a29236cf332d640e600"
> >>>>
> >>>>    SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;pr=
otocol=3Dhttps"
> >>>>
> >>>> @@ -13,6 +13,10 @@ S =3D "${WORKDIR}/git"
> >>>>
> >>>>    inherit meson pkgconfig systemd
> >>>>
> >>>> +EXTRA_OEMESON =3D " \
> >>>> +    -Dtests=3Dfalse \
> >>>> +"
> >>>> +
> >>>>    PACKAGECONFIG ??=3D " \
> >>>>        ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> >>>>    "
> >>>> --
> >>>> 2.43.0
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#113070): https://lists.openembedded.org/g/openembe=
dded-devel/message/113070
> >> Mute This Topic: https://lists.openembedded.org/mt/109059332/9027231
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [chanh@os.amperecomputing.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

