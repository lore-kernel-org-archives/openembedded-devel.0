Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D029C35FFF
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:19:34 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.2118.1742494771554607136
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 11:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gBIp49go;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3f7f7b70aebso619686b6e.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 11:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742494771; x=1743099571; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHQgfKdbywntB33f7wXhrcuXbqiT2DKo/lGI3H5ihyM=;
        b=gBIp49goiPyDdOKKj19qlBAi5ReZITlu+MnqCVg2CGBtEp4VqKjlv296JZ+gw37a/a
         rPUr+20Th+xbQpeJ0RHwomZeZC4+RMnU21ifiAfsl6Firuv9v8SiGPcJQ+mkUhvyZsq+
         du4Vcm4vyZ7yyOHAZWt3J5jY7vSmaCVyJdgsv5dI/lmKjCTuzFMcCdtLMUvioyGlalEy
         LnKFFye9MsFc+iWlgrWFpHcQvRgdpXzRkMy5+MkZtbtk5H8vCVHyTKXoG/ruIt+x/bh4
         NIUEqykQUa3GMHIdPsw6dd6qqDXK2hLPk5kOYALa1J0UyCclRqpRZuMUfFWM0RkysSY0
         Z6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742494771; x=1743099571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHQgfKdbywntB33f7wXhrcuXbqiT2DKo/lGI3H5ihyM=;
        b=EXG5f22XwrmAVxT/KQ6xJPZHAs2gs2kkJxQNGcYkGok212ukXz8qyJXAdCROyxpozH
         FDS8MIFpFQBgMJsrJzLjw/uGRNaRaJ+MfkkKTDF86xRBTjr9Tzik8EJH8xrOgyoDwQkT
         hv7Z3UGN8oea4+BrXH5ij2nwr/T+c7wMHHEV4mt/WU1w3XHrfB/DhsG9Bf5JD0gGMvIr
         mARTCEqpB7DpOTDfnEX+oAwLW5IShz65r69nHB4I2ZGhBGx79fDjiLBYx72MiNl9FNci
         58A+1UuErPl4Iv1xRzdaxuGv9ymJ2G17S99+CQmpzc4wujEG8H8ehU+0l1erxK1pwDx9
         bo+Q==
X-Gm-Message-State: AOJu0YymHjoSzewe/U0ipAGZM+DyboAWWQbkdpDSNNPImMlBA23jcbvd
	wDU3ZKooO8MCvYh0cEQzZHAPkUbWElba3IEJiybtESYCtjXZj8vGfCXCTnaZVwkkRJJF4anqGmD
	15nPXkbg/5yDxJSswRyayvUkOWzUMqPDG
X-Gm-Gg: ASbGncvmjxl0Ql/UnSs7xjPPI98X+aYRUraOwevBhcG8Q+SE1ItBziAbBXYfvppc0cW
	EINZA6UPSneIIhXArqDGg2XlL5RKL/NBVipIKf0lhHuLilp81ED0lnmXHd/ZK8Q4uUXtxc+mK0K
	OrLIGhLMlxT0Vu8TYYXo2LIC85GhZ18EkVORaYaSOm9Bt4CmyoR7Xwhsw=
X-Google-Smtp-Source: AGHT+IE3PTJEJVFubXb/TOKKi/zegGRLe627IYTrnwjYzd2BmZ9/7EZ2wJBEwoVkyVPDuKiU5qbDtikFCWZ55Z2q5Q0=
X-Received: by 2002:a05:6808:2121:b0:3f6:ab0d:8dbf with SMTP id
 5614622812f47-3febf78813cmr108024b6e.29.1742494770796; Thu, 20 Mar 2025
 11:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250319082110.2907028-1-leon.anavi@konsulko.com>
 <CAMKF1spq0LPZ8NN=9_2s9=6GuU9qEoGdjnLvtwYME8ejyC=dSA@mail.gmail.com> <77f6bda7-d880-4e52-8a66-de975d185a59@konsulko.com>
In-Reply-To: <77f6bda7-d880-4e52-8a66-de975d185a59@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Mar 2025 11:19:04 -0700
X-Gm-Features: AQ5f1JqbKETYXszksc7ytwQim4nCVdCSyIJsEWtnFkXt5DBaTH024mD1oAbsLjE
Message-ID: <CAMKF1spub-KYytBQvNiTT0Mc0+nw6TabUckpDBfBxLO7funLYA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-multidict: Upgrade 6.1.0 -> 6.2.0
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 18:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116139

On Thu, Mar 20, 2025 at 3:41=E2=80=AFAM Leon Anavi <leon.anavi@konsulko.com=
> wrote:
>
> Hi Khem,
>
> On 19.03.25 =D0=B3. 22:43 =D1=87., Khem Raj wrote:
> > This fails ptests due to missing dependency on python3-pytest-codspeed
> >
> > I would encourage to run recipe ptests when doing upgrades etc. e.g.
> > for python3-multidict one would do
> > bitbake meta-python-image-ptest-python3-multidict
>
> Thank you for the feedback. I fixed it and I sent v2 of the patch.
> Please note that it has to be applied after the my other patch from
> earlier today that updates the runtime dependencies of
> python3-pytest-codspeed.

Thanks for working on it.
I was already carrying fixes for the ptest regressions so I went ahead
with that patchset

>
> Best regards,
> Leon
>
>
> >
> > On Wed, Mar 19, 2025 at 1:21=E2=80=AFAM Leon Anavi via lists.openembedd=
ed.org
> > <leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
> >> Upgrade to release 6.2.0:
> >>
> >> - Fixed in checks throwing an exception instead of returning
> >>    :data:`False` when testing non-strings.
> >> - Fix a leak when the last accessed module in PyInit__multidict
> >>    init is not released.
> >> - Implemented support for the free-threaded build of CPython 3.13
> >> - Started publishing wheels made for the free-threaded build of
> >>    CPython 3.13
> >> - Used stricter typing across the code base, resulting in improved
> >>    typing accuracy across multidict classes. Funded by an NLnet grant.
> >>
> >> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> >> ---
> >>   .../{python3-multidict_6.1.0.bb =3D> python3-multidict_6.2.0.bb}  | =
2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>   rename meta-python/recipes-devtools/python/{python3-multidict_6.1.0.=
bb =3D> python3-multidict_6.2.0.bb} (90%)
> >>
> >> diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.1=
.0.bb b/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
> >> similarity index 90%
> >> rename from meta-python/recipes-devtools/python/python3-multidict_6.1.=
0.bb
> >> rename to meta-python/recipes-devtools/python/python3-multidict_6.2.0.=
bb
> >> index ed49b8ff02..568b1b93ce 100644
> >> --- a/meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb
> >> +++ b/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
> >> @@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python=
-pytest
> >>
> >>   PV .=3D "+git"
> >>
> >> -SRCREV =3D "4140e63780dc6dd600a1837cb9b4c5198c3dcd68"
> >> +SRCREV =3D "af07d5b2b18bb30e041983db2bea1fcb3e1c4b79"
> >>   PYPI_SRC_URI =3D "git://github.com/aio-libs/multidict;branch=3Dmaste=
r;protocol=3Dhttps"
> >>   S =3D "${WORKDIR}/git"
> >>
> >> --
> >> 2.39.5
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#116065): https://lists.openembedded.org/g/openembe=
dded-devel/message/116065
> >> Mute This Topic: https://lists.openembedded.org/mt/111785561/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

