Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F2DC36014
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 15:35:14 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.10.1743780905846670855
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 08:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WykOZKvq;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6041e84715eso84486eaf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 08:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743780905; x=1744385705; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8J67itdzWfvQJtUK+0cyh/RRy7aOx0mAPHlSpyY5WcE=;
        b=WykOZKvqVsk27hwqRpaNgnncaJ99d4BihD0vT8X18bDt0WTBYH79xtTQz6tKTnZ9op
         XCWUF0atMIQJl+XLSWdWMVARU1OdtTI8pSz1l/YlKPAKcFRjpJ+alzlqYH53p6TFv61b
         sbQmZXzg1stPkq7oYqvpCdQCA9S8WBZqeMiRpWIJNWComd1HYXfYSVYBTnTeas+Be65+
         kRaNV7XcujzIBhIf/pjbLgsCR0NkOd9mlvFbK32HSBoiKBJLT3+/LkJF8Et8uHeGY380
         3xlA2frxhZCTtIOF0ZONw0GUTcpeLPiOSm1fJAHcSAki/xSp9dVXFMQrf1gT4ZnRdVPl
         STEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743780905; x=1744385705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8J67itdzWfvQJtUK+0cyh/RRy7aOx0mAPHlSpyY5WcE=;
        b=oh5b1vKEr8pgb21YObcUz1qOXEvnJ5izUNyCCWgmwmMGo+3g8MGHjadDJArT2RBoBD
         dLSLuLUpZLyW330tDKMr+PtYCUBp0d4GyJlJFWCdBaZlH6kvZ1MwNznElZGDLNf9/wHc
         dbija+pvclUwKYoVlkx8NeyEVp291Ie+pVP+AFitXFak6QVjLwd30iqBLU98jTYbqVlY
         kKJBnxCh4t0etBML9a03TUbnsA+bDT8fVzVQOl4edn9vUKDuKWS04mHi9sphNaUnNe/H
         XGse29iMxYFFr0hT4f3sxVP4GW70al3bdN8UM6J+RzxsUZluXkbqKRumBI/4SstJqQ7a
         0TAw==
X-Gm-Message-State: AOJu0Ywrb7lEGTPwVUEz/NetGSvlQXhCOSqKY4k1FMI3Pb+aSzp3UCAU
	YT8Uv5lDMi6uP18f6Kza3cuhRt1nkzXLfB7Du1J6xCELLB770W7LJX+ygYINVknszdkUiVkI4Cy
	a1qgt3mawHeMYqiDH+fc6//IIc35fOBVt
X-Gm-Gg: ASbGncslfZ/7ooPrvE951Z7EdP5xnzWFFXWafJA9xP2QeI/6UHC5xkCa+nN6gYej581
	xP3l0nVwddayvWnNTPFB40WdGAj+aU/RpIhHZf4SeJzeFbTgjwxGz4pYCOiOLxzU83jy1Hr9V+n
	hRSfVZpcQZ/aLKW3qNH8LgFs2CUw==
X-Google-Smtp-Source: AGHT+IGhxhpTEvDqmpk0Hw3Gze0y4Xiuc0Qu76/AW9NO0Be4wgstgZS/QkhRdVoVZZ5ARi0OTDz/FXk0BEeqJEnwrd0=
X-Received: by 2002:a05:6820:3107:b0:603:f29b:85c3 with SMTP id
 006d021491bc7-604163832a4mr1604599eaf.0.1743780904946; Fri, 04 Apr 2025
 08:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250404113724.2617709-1-soumya.sambu@windriver.com>
In-Reply-To: <20250404113724.2617709-1-soumya.sambu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Apr 2025 08:34:38 -0700
X-Gm-Features: ATxdqUGpXjSvay3C956j0MnIpNBcqKp5jMVCzisO8gqwGVNfGPIsvcPaaFpwdFA
Message-ID: <CAMKF1sojdKyqxnDuf==NDyUzdvJRHni2PGb0z7nVw87U=sSouQ@mail.gmail.com>
Subject: Re: [oe][meta-python][PATCH 1/1] python3-django: upgrade 4.2.18 -> 4.2.20
To: soumya.sambu@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 15:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116590

On Fri, Apr 4, 2025 at 4:37=E2=80=AFAM Soumya via lists.openembedded.org
<soumya.sambu=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> Includes fix for CVE-2025-26699
>
> Release Notes:
> https://docs.djangoproject.com/en/dev/releases/4.2.19/
> https://docs.djangoproject.com/en/dev/releases/4.2.20/
>
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  .../{python3-django_4.2.18.bb =3D> python3-django_4.2.20.bb}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-django_4.2.18.bb =3D=
> python3-django_4.2.20.bb} (64%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.18.bb=
 b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python3-django_4.2.18.bb
> rename to meta-python/recipes-devtools/python/python3-django_4.2.20.bb
> index 9e0a908507..8644b282c6 100644
> --- a/meta-python/recipes-devtools/python/python3-django_4.2.18.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
> @@ -1,7 +1,7 @@
>  require python3-django.inc
>  inherit python_setuptools_build_meta
>
> -SRC_URI[sha256sum] =3D "52ae8eacf635617c0f13b44f749e5ea13dc34262819b2cc8=
c8636abb08d82c4b"
> +SRC_URI[sha256sum] =3D "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7=
fbef2b62b876e789"
>
>  RDEPENDS:${PN} +=3D "\
>      python3-sqlparse \
> @@ -10,5 +10,5 @@ RDEPENDS:${PN} +=3D "\
>
>  # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
>  # default. To build the 4.x branch,
> -# PREFERRED_VERSION_python3-django =3D "4.2.18" can be added to local.co=
nf
> +# PREFERRED_VERSION_python3-django =3D "4.2.20" can be added to local.co=
nf

Maybe use  "4.2.%"  so it is not needed to be bumped with every upgrade.

>  DEFAULT_PREFERENCE =3D "-1"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116585): https://lists.openembedded.org/g/openembedde=
d-devel/message/116585
> Mute This Topic: https://lists.openembedded.org/mt/112082459/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

