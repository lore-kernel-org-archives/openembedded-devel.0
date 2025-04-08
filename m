Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64683C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 22:17:37 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.8783.1744150650354237635
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 15:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DUKUZYmF;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3f6dccdcadaso3757138b6e.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 15:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744150649; x=1744755449; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGkLV9xChSGzorY5cVJJXB0OA/Kfal75wrWz6Nd7PYc=;
        b=DUKUZYmF4xKy9bP0OMXUNihR/zn1rBzhtlnhgZyc4SMhlBOiFEiwqw0OaaBt2SjlLs
         De0XnDoUFyZZJ6hLg4gJaJATT8O1I5ZpXJwLGwBlGcbuVQ1qI+zTMgCtfuC4eD5sDmI7
         PI0ufOl0eL0rbdYcNV9xZIGiaTGIUUOGMjj+RLkmNtU1bUeXqJAE12Dk6jwd8Y/dqarJ
         njBZpFqqt3hYZbebXgPFBrnWMkQXG6cNt/qSbPNzcgmrfboZPaA9i6KFzx4fx7+/i3xZ
         I/2EIOxBDiuL7SSTLZln9x34PFkSFoCZX2X/Sy8o2x2wNoLlJeLyvYdRcJNsQOghZXV/
         dxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150649; x=1744755449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGkLV9xChSGzorY5cVJJXB0OA/Kfal75wrWz6Nd7PYc=;
        b=BCVZZ5garQ6nxOsRkN9sVd+Dz3TerEz6UB3+BNgW13DPR3VpvcWoCAjwJca2RpzVca
         8GApn0xcd+9wlLukt5GO3uN1il085+5Ox3KkBfouFSn0RB7euyzTtw1E2lxDC0tywaTL
         eUiTWu3f4OPHeMxLsQ53Zkx9vdmRWvhjH3Q9LGAdPj/e7Cn4drEThcmSddzXfS8IYozF
         MuIIomcWA4XqT1It4OEoxfvCmtG4S4PMPB7IPotmdbU5XQF5sHV9QAeg2QAg8LaEB+F9
         Ay0ZL24Vaa0Kz7VN/xahxNEPXRgco2P9ItMC8lym/xE1EtEH83hVjPKB4mdUvjYmV/Pd
         Xsyg==
X-Forwarded-Encrypted: i=1; AJvYcCUAWkUAMhxBbQ5qRqq+WHVbFgLXRkKEb8ZQBqzA2X2UwqjLzPosxt2uRuSTz3R15d7QMPdCuQ2wlfMTYPCv/qeyb84=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwHEEqu4d3Be3q4erIhdj0wexNAfcxZG8Lj2MVLwNVfHcszMZk2
	H5JyLMuSyzH9cwaHuHIH4Bi3yPbLlBO3SsyMbpnvcMnOJ8KK2f6nIH5Y9dgqfjKlwB3kfAfCUcb
	RvuWfsJbIqQdvRGuZ0vyw5tjygns=
X-Gm-Gg: ASbGncsxSFiT1muI10XUp4gCzbAaWwBfeIhMiv8gUwRk8eVo0FK0c2nncLQsRqqGC4U
	z9s6ZhmkU1oGekXYDJty5f2NtDVVL7Yb9Y736bvgEHQWbe+J8obGjpj8s/3aCtutovSVt07nvxH
	ysGb2r48SxQqPPCIGiodrSag1AgQ==
X-Google-Smtp-Source: AGHT+IE06zLzhAH9Mke2hpHtkeLAGkXQqFT81NJNJlVdtCAFrinGVQibzgffkQfUWLVygkEtlrzJ17DwZ+CHr9NbPoo=
X-Received: by 2002:a05:6808:1a2a:b0:3f7:d16c:e283 with SMTP id
 5614622812f47-400736bdd4amr379941b6e.11.1744150649381; Tue, 08 Apr 2025
 15:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250404003320.1703471-1-Randy.MacLeod@windriver.com>
 <FC376EA8-6664-4B03-8334-5E852F65545C@iki.fi> <18334531BE4E7A16.27826@lists.openembedded.org>
 <529ff21d-ff78-4f69-9fc5-6d572f9f2b36@windriver.com>
In-Reply-To: <529ff21d-ff78-4f69-9fc5-6d572f9f2b36@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Apr 2025 15:17:03 -0700
X-Gm-Features: ATxdqUEG6aKrc-rGEBC-cZ1ALfPgqt6M6L8t5Puis-XoUyYOv-YLmTcQUsFuqKo
Message-ID: <CAMKF1spmxkh_F1-0Mgvv9HMUpSWi7qoCOVJUhKL=vy_wc+iQtw@mail.gmail.com>
Subject: Re: [oe] [PATCH v2] nano: update from 8.3 -> 8.4
To: randy.macleod@windriver.com
Cc: Anders Montonen <Anders.Montonen@iki.fi>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 22:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116717

On Tue, Apr 8, 2025 at 1:12=E2=80=AFPM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2025-04-04 8:39 p.m., Randy MacLeod via lists.openembedded.org wrote:
>
> On 2025-04-04 6:58 p.m., Anders Montonen wrote:
>
> Hi,
>
> On 4 Apr 2025, at 3:33, Randy MacLeod via lists.openembedded.org <randy.m=
acleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> Release notes:
>   https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00001.html
>
> The license file checksum changed because upstream added the line:
>   SPDX-License-Identifier: BSD-3-Clause
> Add OECONF to avoid build-time checks for strcase[str|cmp], both of
> which have been in glibc and musl for > 10 years so it's sensible to
> default to yes.
>
> Adjust the patches using devtool and manually munge the Upstream-Status-e=
s.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> =E2=80=94
>
> The commit message doesn=E2=80=99t fully match the contents, there=E2=80=
=99s no license file changes nor updated patches.
>
>
> Yikes. I can't possibly have messed up that much, can I?
> Anyway, I'll check and send a v3.
>
> Sorry for the noise, I may eventually learn to double, triple check my wo=
rk
> before sending commits in the rush to branching.
>
>
> The bug has been reported to the nano tracker:
>    https://savannah.gnu.org/bugs/?66978
>
> Updating nano isn't that important since the updates are only:
>
> =E2=80=A2 Bracketed pastes over a slow connection are more reliable.
> =E2=80=A2 Tabs in an external paste at a prompt are not dropped.
> =E2=80=A2 Feedback occurs when the cursor sits on a Byte Order Mark.
> =E2=80=A2 The Execute prompt is more forgiving of a typo.
>
>
> and 3 minor (?) bug fixes.
>
>
>
> I'll wait a bit until upstream straightens things out and issue a new rel=
ease.
>

OK, this won't make it to walnascar then,

> ../Randy
>
>
> ../Randy
>
>
> Regards,
> Anders
>
> .../recipes-support/nano/{nano_8.3.bb =3D> nano_8.4.bb}    | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
> rename meta-oe/recipes-support/nano/{nano_8.3.bb =3D> nano_8.4.bb} (75%)
>
> diff --git a/meta-oe/recipes-support/nano/nano_8.3.bb b/meta-oe/recipes-s=
upport/nano/nano_8.4.bb
> similarity index 75%
> rename from meta-oe/recipes-support/nano/nano_8.3.bb
> rename to meta-oe/recipes-support/nano/nano_8.4.bb
> index d1af89ef8d..1aae49d3b6 100644
> --- a/meta-oe/recipes-support/nano/nano_8.3.bb
> +++ b/meta-oe/recipes-support/nano/nano_8.4.bb
> @@ -13,10 +13,17 @@ RDEPENDS:${PN} =3D "ncurses-terminfo-base"
> PV_MAJOR =3D "${@d.getVar('PV').split('.')[0]}"
>
> SRC_URI =3D "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
> -SRC_URI[sha256sum] =3D "551b717b2e28f7e90f749323686a1b5bbbd84cfa1390604d=
854a3ca3778f111e"
> +SRC_URI[sha256sum] =3D "5ad29222bbd55624d87ea677928b3106a743114d6c6f9b41=
f36c97be2a8e628d"
>
> UPSTREAM_CHECK_URI =3D "https://ftp.gnu.org/gnu/nano"
>
> inherit autotools gettext pkgconfig
>
> +EXTRA_OECONF =3D " \
> +    ac_cv_func_strcasestr=3Dyes \
> +    gl_cv_func_strcasecmp_works=3Dyes \
> +    ac_cv_func_strcasecmp=3Dyes \
> +"
> +
> +
> PACKAGECONFIG[tiny] =3D "--enable-tiny,"
> --
> 2.34.1
>
>
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
> pLK@tY:ATbOf1"dW
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116715): https://lists.openembedded.org/g/openembedde=
d-devel/message/116715
> Mute This Topic: https://lists.openembedded.org/mt/112076927/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

