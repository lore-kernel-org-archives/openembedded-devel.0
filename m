Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C69C369C2
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 15:05:05 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.21425.1744815895480742233
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 08:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TdoThbFu;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-603ff8e915aso1952416eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 08:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744815895; x=1745420695; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJ7KsCGs8ICvplec0xsuKp9T2+k3/kSfbJuKrbjlzLE=;
        b=TdoThbFuMHh/nHEzpG25ARMLz9ipkA+Q3vP3Q9cRGEcpazcz39PACdGL5GJZfK3If6
         AnPkElh+U7xZWul5TaiLdSkVhJDGXZqEnoB4NzUU+RdzVqASQk2d3psm7jw5JaPdnTq3
         T19hHDr4/LvSXxb84B6Sab3Dsm5heO9abM+PesyVTBQzz/9Rr/+1hKWqFAKZU/Z9Sxlv
         q4V/+MC7r0u+t/YwiM3J9SPGF9LofkMAPmGyRQZrllV6iK6aQptB4YoPCHauISXe20BP
         NBnvtQq0qZGPn2HGwD9aoSvl82vl/fIKjbdp04uSj5PUOo4/OxLUdToVGy9o/F3lkaKA
         9Oxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815895; x=1745420695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJ7KsCGs8ICvplec0xsuKp9T2+k3/kSfbJuKrbjlzLE=;
        b=jvqyru5T6wicOHazJimCvaf2BfDQYTvzeOxgo8+gyDdj5W/KPbe4qcSiuHySfkAoqI
         vtFfqF1LEg2KntHgtE63uzAvOJwfIMNJLaHYQxpZS0NwVnqVvpmi+I5PCTgD7/01/iaf
         c0A7bClHu42ZRpA1HyDi/hk5X4XfY6i4QgjiKcSM/TjOoyc16NiB71Ea3DPSEB9M/681
         7OJcCCPC/90sz+w3C+6AJqQaYjImn+duNZnEAhtgK/qMDN3G0rpZpA8Qoo4js3B0Y/H8
         pnINkQcfILUnaSaAtbttZq28stESK6BgbkxDNQN/YnaomhVXMhuifCf57XijyHkPk4MS
         5A7Q==
X-Gm-Message-State: AOJu0YxXXl0uD7H91fZHe0ohBp7xjoOoNIVLWOwUB0eutGdaycllQFWO
	1tSXAPwJqfPvc36C316e5Z51UC4ANzG0yB1Ae1c6XXctIaiW8yMUFFuef7ZOlNZoVNb74vyjrLj
	iwUYfkWKlHiRGP/KEVJdjck4aD6Q=
X-Gm-Gg: ASbGncu6cK5RlM8v4+wvUJA5hPaAv/sr75y4iCQ2myotEJeVngl0T+mYjk8WDotnlB4
	WUnKwS8V7Y8/jWO6yXtIuyw8+dAR7F3D5p4ymzoRds/SrCJvpxF29h2v2Qh1yk9ywnXM6175fWY
	NNuwvwot2EJZRKXlPlP693JeTeWT7NxqI=
X-Google-Smtp-Source: AGHT+IFqnbvxS0OjnKc6od9A1vie/ioyviKTwiTqgmzTNIVWTPBXVPjMVdSGugzNAFrZkxvXgPVt0nEzEoSX5hz8V9g=
X-Received: by 2002:a05:6820:827:b0:604:5476:dc6f with SMTP id
 006d021491bc7-604a92b0bedmr860941eaf.5.1744815894658; Wed, 16 Apr 2025
 08:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250415171446.21770-1-nguyenthaithuanalg@gmail.com>
In-Reply-To: <20250415171446.21770-1-nguyenthaithuanalg@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Apr 2025 08:04:27 -0700
X-Gm-Features: ATxdqUHRz1cHjPzDJTor4-qHrXABs-oYDdZhPg2fTnKS7uFBdc55zjWV3MdxHBI
Message-ID: <CAMKF1spQm1K6mv6U37_2fJEOnwiq4Dn+ctyv-HbuYJ9pdW4WnQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsimplelog: A new logging library for C89-C++20
To: nguyenthaithuanalg@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 15:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116910

it fails in build QA step see
https://errors.yoctoproject.org/Errors/Details/852535/

Please squash the patches together and send a single patch one you
have fixed this issue

On Tue, Apr 15, 2025 at 11:38=E2=80=AFAM Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=
=A1i via
lists.openembedded.org
<nguyenthaithuanalg=3Dgmail.com@lists.openembedded.org> wrote:
>
> - Edit released version: 1.0.3
>
> Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
> ---
>  .../recipes-libsimplelog/libsimplelog/libsimplelog_git.bb    | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.b=
b b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> index 0415bf485..749085710 100644
> --- a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> +++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> @@ -7,9 +7,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D22cdd382a6=
275cb4c2e75c517952ac7c"
>
>  SRC_URI =3D "git://github.com/thuanalg/simplelog-topic.git;branch=3Dmain=
;protocol=3Dhttps"
>
> -# Modify these as desired
> -PV =3D "1.0+git"
> -SRCREV =3D "ff30ba71807db1d7e1962dd014c2bb0a060572a3"
> +PV =3D "1.0.3+git"
> +SRCREV =3D "c8d0155601522e53b62b09cbe2e5c635717ad068"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.47.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116867): https://lists.openembedded.org/g/openembedde=
d-devel/message/116867
> Mute This Topic: https://lists.openembedded.org/mt/112273596/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

