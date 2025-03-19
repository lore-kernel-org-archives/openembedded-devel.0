Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10ACC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 20:43:59 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.5200.1742417036956543672
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 13:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ElbkRpPp;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3f8ae3ed8f4so24026b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 13:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742417036; x=1743021836; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUufwepTwjiJua4VRFQLMpW5/ijmoEk0s2bcGqQvncQ=;
        b=ElbkRpPpqTwJ76XYFopl3mYhWypR1H/l4e7mfm4iP3FmtavSxyhWKW0qgnIKnamYhH
         jTgCJhDv6rI56S6HkNwBMV1mYwWa0eJ8C0qeh47y2907DQjlcluviCBDuULzfuXwDHDL
         Nezgfwv2bR90MuSIeTZfiF1o5dVEvfJzQjanYv6sof8R/rY/XL//NWupMQISRZJhPHLk
         4A9C5BGVFLcWMcWAGypnajbMJEzmzK5MckyYvnLk2Z23V4PW4E4Hac8P5rae4wOKNgeC
         citBXmvS58dUeL9vT5VR2MWOHVDuB28uUHnktLR8457ADjiYYaIyI/abgfXlnV9KWbx2
         /3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742417036; x=1743021836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUufwepTwjiJua4VRFQLMpW5/ijmoEk0s2bcGqQvncQ=;
        b=YoCAAYOZnNQOyCIeDViWCSPxR9qpQKnTGJJ8GZeqThl3l7aGzORgvn9Nxz7njeEVwk
         y5wbHP62Od414GRwhPT1AeYPcKscbgVfCkIoF0TbgFu2TY3fLhdsY6xEHn4QO0/9w8xv
         JwJm1kFYzDOAQ6ZzNXij2jUpIFWGzjh+ic2U5XJoJ7Dkoqt66GN6JpDqNpjz5s7J1qvb
         VXUdKI3cP0rwHq9uWfNuLCwrUVEfkUh89d7CdYtnXY372nxygZrDvqJ2FjnzE+XcE4Jl
         VGi8wY1+QAKuLDXJweEZl+Awh37PZ/5silCyNJiE2zwlWCktlqlWQtoeGzWwXWVr2RR1
         g6ug==
X-Gm-Message-State: AOJu0YyTjTQDGW1lIzMJSVTxZ0ajtkCpaNdAZK+P4QHxgAGciGvRXlV3
	aw7MOC4G/maxGmXvumeiAj4XQBb3dL4EYXJrV5zuJmIVEOCS5y3LbMYUx1jxEPobomi1csE5F/a
	gFpl9eoNkuiIrP+xl/cEeQVEC/a0=
X-Gm-Gg: ASbGnctyun7ldeOzheoi58xLz81VvW5SXUXHAGo4V0Vw/z8b0mbiHvQmZaOqBevuTqX
	Q7H/wyI3IlS4H/xAF+ATtdtXDpXERxxsE3dkOWmokF53tnT6z8qVMp82P3dwwOYQzC1868wy0E6
	IdgvDtENPyjEZHlmgArfzE9FPx0ou9vIQiCFw4u4zfa9ALLP3kkv8fxPzEiBHHyZW3Iw==
X-Google-Smtp-Source: AGHT+IH/l1buF/ANGm31D8W1mNEhOQNrNsXbFx6YEdfeK1tlapzcbjbIIzYPQtDvyQEFN2FGS5UQ7nbiBCCr7wnV9/0=
X-Received: by 2002:a05:6808:2f1b:b0:3fa:4418:679b with SMTP id
 5614622812f47-3fead5875fcmr3264162b6e.13.1742417036072; Wed, 19 Mar 2025
 13:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250319082110.2907028-1-leon.anavi@konsulko.com>
In-Reply-To: <20250319082110.2907028-1-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Mar 2025 13:43:29 -0700
X-Gm-Features: AQ5f1Jrg3-0EET2ZpDkqZvCLFWNlklJsGRbAoeCUGkzvZTN2z4bLgIFWyYyX2eg
Message-ID: <CAMKF1spq0LPZ8NN=9_2s9=6GuU9qEoGdjnLvtwYME8ejyC=dSA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-multidict: Upgrade 6.1.0 -> 6.2.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 20:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116109

This fails ptests due to missing dependency on python3-pytest-codspeed

I would encourage to run recipe ptests when doing upgrades etc. e.g.
for python3-multidict one would do
bitbake meta-python-image-ptest-python3-multidict

On Wed, Mar 19, 2025 at 1:21=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> Upgrade to release 6.2.0:
>
> - Fixed in checks throwing an exception instead of returning
>   :data:`False` when testing non-strings.
> - Fix a leak when the last accessed module in PyInit__multidict
>   init is not released.
> - Implemented support for the free-threaded build of CPython 3.13
> - Started publishing wheels made for the free-threaded build of
>   CPython 3.13
> - Used stricter typing across the code base, resulting in improved
>   typing accuracy across multidict classes. Funded by an NLnet grant.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-multidict_6.1.0.bb =3D> python3-multidict_6.2.0.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-multidict_6.1.0.bb =
=3D> python3-multidict_6.2.0.bb} (90%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.1.0.=
bb b/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
> similarity index 90%
> rename from meta-python/recipes-devtools/python/python3-multidict_6.1.0.b=
b
> rename to meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
> index ed49b8ff02..568b1b93ce 100644
> --- a/meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
> @@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-py=
test
>
>  PV .=3D "+git"
>
> -SRCREV =3D "4140e63780dc6dd600a1837cb9b4c5198c3dcd68"
> +SRCREV =3D "af07d5b2b18bb30e041983db2bea1fcb3e1c4b79"
>  PYPI_SRC_URI =3D "git://github.com/aio-libs/multidict;branch=3Dmaster;pr=
otocol=3Dhttps"
>  S =3D "${WORKDIR}/git"
>
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116065): https://lists.openembedded.org/g/openembedde=
d-devel/message/116065
> Mute This Topic: https://lists.openembedded.org/mt/111785561/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

