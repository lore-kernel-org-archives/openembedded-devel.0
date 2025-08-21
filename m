Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608E6CA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 18:17:25 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.3587.1755800244022970215
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 11:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AarAE1ok;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e933af9f8b5so1062296276.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 11:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755800243; x=1756405043; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rV7xg8RUaED0OmN8wxQE4UXWjYejA6oI/zeU9W93wVY=;
        b=AarAE1okFkV8gHyaIp3K1nqyLOdVA79VV7NUoXx80kmo3OnIZnF2qvBBqVibYRXyM2
         CrSxfw1n02KQic0RbxKeA+fmKBT/ByTUvmhitH7aIpv62Udetdk5zhIfUrU1fc3e3ZwU
         Q9wdsdydG07zIRjT5EEaRZcafYC8fw/Uixat48cWMbqwzEjSdQLFdjPCapWnH9eCwd0U
         kSYayY2WlU7/UJV5HXbofnjn+lAR/JdofTFqifSpDuARLLi+WCVM6WGGIO7P9l+4NqiB
         Zlzi9/6cuoqC2bX5vCYfKzg56jzPwOiHHwq8tlTAry+NFjpAWx0AOiXnSbSMtpF0LIJX
         NXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755800243; x=1756405043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rV7xg8RUaED0OmN8wxQE4UXWjYejA6oI/zeU9W93wVY=;
        b=vwdsn0Aqm1B664zXz9D9rxe58MxoBECo+24TyokrtubKktlFYv9GDwMAW5pQ3t1wDS
         o41tUa/15r8HJ+utjF9FuvRlR14aDKatcevK7gMxOwMkSj5pNd1Ims1QZUu5FZHNdm6N
         /9sB/53DLtqfkJV6nc7Cta6iFAxecTHgbHRRb1692TjbFgaqQcIckKqjMGa1OsnCVbPG
         l1TfauDaAa8vkq9LvJxdI+f3q7h2GmjHKVHtKmWFSIfDvgE5Ct0bI9SoLPe5utfsFPwf
         fEwxavTfCI+hjkxzasJiM9g1Qp6ZBP6/J9mG2qn8mrqiCFBcYEGGL07+vnNLBZZgvM5k
         g/oA==
X-Gm-Message-State: AOJu0YxQia2ormkY1cJlBMVgCtq3b2l3dB1su9aE0AaMx62tqK2LyyHO
	q1YVbfxGNevK7DBUAwKDtaNgtSauH1Iz8eon4dCwaPItkE1/AgYGniAC9c0Z/F4nblRidyDNWgJ
	rz8TGl1O01fGhuFOmUpspz+36iaa/h88=
X-Gm-Gg: ASbGncsFTIYi2LiefbNIkYYJAhTZciWyyTjugDmHDIqpMNouJFvewQ6xZKzKbarw1gT
	YWonKektnY9Ci2uRJQQCzLUCSkkuAtcu3XTD6FhYfQ+DjTEPsNc8mNmtiCX5/0uX02N+GErmPwg
	jKgn6Ak8KsbNIlYe1cfD+e4tRwXIVdj2qJgYxpsNxznUM/0q6Vo+NKe5tNHLmbTzRq4ptW1PAIm
	GEIyi19WtWTNGKrD19pN0biX1durNNUEcWV
X-Google-Smtp-Source: AGHT+IEugx3NJrLB8x+mbriPmQ3VneCmztQh+OC4hXFx2x9gFkBf7QKNIcEoULPmYrqXMceP3Flj0rAhzXCh8yiG2rw=
X-Received: by 2002:a05:6902:3102:b0:e91:7b14:4d7d with SMTP id
 3f1490d57ef6-e951c27ddd1mr677495276.15.1755800242677; Thu, 21 Aug 2025
 11:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250821085954.2056-1-wangmy@fujitsu.com> <20250821085954.2056-7-wangmy@fujitsu.com>
In-Reply-To: <20250821085954.2056-7-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Aug 2025 11:16:55 -0700
X-Gm-Features: Ac12FXzB0OfBJDl1bHUE_aDSkbSPzYefAMCuO4k9J6Zry4qAyFQaNHEbY4u9a9w
Message-ID: <CAMKF1spcbKy9N-gH9PP+YPLH6rU48pOvq1ewzLvfY0EpPKPRvg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 07/21] python3-multidict: upgrade 6.6.3
 -> 6.6.4
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 18:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119077

On Thu, Aug 21, 2025 at 2:00=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-multidict_6.6.3.bb =3D> python3-multidict_6.6.4.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-multidict_6.6.3.bb =
=3D> python3-multidict_6.6.4.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.6.3.=
bb b/meta-python/recipes-devtools/python/python3-multidict_6.6.4.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-multidict_6.6.3.b=
b
> rename to meta-python/recipes-devtools/python/python3-multidict_6.6.4.bb
> index 5b262ed933..dad669fd9c 100644
> --- a/meta-python/recipes-devtools/python/python3-multidict_6.6.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-multidict_6.6.4.bb
> @@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-py=
test
>
>  PV .=3D "+git"

do we still need to keep appending +git to PV ?
>
> -SRCREV =3D "dbd686f37c1bc14355dce9c16dbbfae82f11dc00"
> +SRCREV =3D "e0e61c28e9f66efcdce01cde9d6772518f6e9224"
>  PYPI_SRC_URI =3D "git://github.com/aio-libs/multidict;branch=3Dmaster;pr=
otocol=3Dhttps"
>  S =3D "${UNPACKDIR}/python3-multidict-${PV}"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119057): https://lists.openembedded.org/g/openembedde=
d-devel/message/119057
> Mute This Topic: https://lists.openembedded.org/mt/114814437/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

