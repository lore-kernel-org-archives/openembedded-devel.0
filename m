Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AEC9D0D7B4
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 15:01:51 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.14074.1728658905885639087
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 08:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ayBr4Pp/;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-717677ed0abso1115524a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728658905; x=1729263705; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpSC4E9kOz3OjDPLPTN9IvHw/WiBuvA/LrPQ/vMtte0=;
        b=ayBr4Pp/SEV5YhaLmjLXee3turcTEsuHrjNJ98zISIk0p8XC+8vNQ/nxYBRHV3daf/
         rICwHq5N/bXrgvgLgBImcuPv1F8wqcBilg1+9OZdC5gYcWNBYHglv0cKiu5dP3IaLEqJ
         VgoOdZniEziqD97FGCsF0qBn/uctc5jjhOIYKBcIWUIUtT1biHtvQXhJ0YXc2HFGsUzE
         rrXzwCU5mof5zLdcPZJ8gbcDSWLsAatS1ZDxYYg1I/g7YBhH/WbgRc6+MFQY9zkgHUl+
         UkEIscP99CGxHYwXRkvNMdH+AKSYeORtpY15pKFi4hjVln9bXHMku+dLFNGcGh2dmRkH
         5q0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728658905; x=1729263705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpSC4E9kOz3OjDPLPTN9IvHw/WiBuvA/LrPQ/vMtte0=;
        b=sESN7WaWbFMN+2zvDQrE/cLsAzAyRH9265nTDh8vJkkySNOpDmwk7tZ0E8Wo2Xq3MW
         TFgP0YXunIKfdJLRe/Pge6aH3ZCy0LCtL1pwmFEwQoeVwN9L9mCWrpxLKb3tFY3gMf+S
         lgFeM0xqH3+baY5r14vmAgD+v/eQ/LDLGSyUvjXMN48qk7BZIvyIx3Wjy1Qh4G9P0UUy
         PAOBfwT1RnX7y5SsaPjW/mLHcxbG/eY5DRbnPSQPyGSmDsvPq470SN52toOM9KOSVayU
         hGwGfXTdEJFMaKSW2opNL0koTTlWIdPlHZisaps9/OMi/b6CWlKwTaiiTy3YGtfIzNxQ
         7Cjg==
X-Gm-Message-State: AOJu0Yz6BF0VHJkB2UMOz+d8GE2z0EvlDhjvEqfQQkJEaG0ReawCVp9D
	3Cle1cbBu87RJlk6Y+b5eZWhTk6nDOGxSNjm8ZvniY1/d3CYviiFden6dO6QBnEd0KHxPa/jqBs
	IZmwQTix3/WM+LRYNLLhpj60wOZrSiILJQg8=
X-Google-Smtp-Source: AGHT+IFBFjDz3Ei73gSQRaKWx7CtzwAHdrYVFu1RkrnzCne7ZgDR3tc9YKFPzTXQZErmtvmjbqAn6DhBpZiYJrgNcyY=
X-Received: by 2002:a05:6870:316:b0:25e:24a0:4c96 with SMTP id
 586e51a60fabf-2886dddb150mr1917328fac.11.1728658904934; Fri, 11 Oct 2024
 08:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20241009123007.1023153-1-leon.anavi@konsulko.com> <20241009123007.1023153-4-leon.anavi@konsulko.com>
In-Reply-To: <20241009123007.1023153-4-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Oct 2024 08:01:17 -0700
Message-ID: <CAMKF1spthnFjSj=RkoOEjk0LfzP_N0FHt3u6X37wLg3JwESDcg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-yarl: Upgrade 1.13.1 -> 1.14.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 15:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112805

Hi Leon,

As I have noted in my prior email that I would expect that ptests for
enabled packages are passing for patches touching those recipes, this
recipe failed
ptest run

MACHINE=3Dqermux86-64
bitbake meta-python-image-ptest-python3-yarl
bitbake -ctestimage meta-python-image-ptest-python3-yarl

would do it for this recipe, and doing same for
meta-python-image-ptest-all/meta-python-image-ptest-fast/meta-python-image-=
ptest-slow
are other targets which will run ptests for all the recipes in
meta-python which have ptest enabled.

I have added the missing dependency on python3-hypothesis which was
the problem.

On Wed, Oct 9, 2024 at 5:30=E2=80=AFAM Leon Anavi via lists.openembedded.or=
g
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> Upgrade to release 1.14.0:
>
> - Switched to using the :mod:`propcache <propcache.api>` package
>   for property caching
> - Started testing with Hypothesis
> - Improved performance of :py:meth:`~yarl.URL.is_default_port` when
>   no explicit port is set
> - Improved performance of converting :class:`~yarl.URL` to a string
>   when no explicit port is set
> - Improved performance of the :py:meth:`~yarl.URL.origin` method
> - Improved performance of encoding hosts
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../python/{python3-yarl_1.13.1.bb =3D> python3-yarl_1.14.0.bb}  | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-yarl_1.13.1.bb =3D> =
python3-yarl_1.14.0.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.13.1.bb b=
/meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-yarl_1.13.1.bb
> rename to meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb
> index 16708fd1f..a7406dfb8 100644
> --- a/meta-python/recipes-devtools/python/python3-yarl_1.13.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/aio-libs/yarl/"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
>
> -SRC_URI[sha256sum] =3D "ec8cfe2295f3e5e44c51f57272afbd69414ae629ec7c6b27=
f5a410efc78b70a0"
> +SRC_URI[sha256sum] =3D "88c7d9d58aab0724b979ab5617330acb1c7030b79379c813=
8c1c8c94e121d1b3"
>
>  SRC_URI +=3D "file://run-ptest"
>
> @@ -20,6 +20,7 @@ RDEPENDS:${PN} =3D "\
>      python3-multidict \
>      python3-idna \
>      python3-io \
> +    python3-propcache \
>  "
>
>  RDEPENDS:${PN}-ptest +=3D " \
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112730): https://lists.openembedded.org/g/openembedde=
d-devel/message/112730
> Mute This Topic: https://lists.openembedded.org/mt/108907751/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

