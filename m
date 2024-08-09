Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB6AC52D7C
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:43:17 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.88358.1723221790147472697
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jR67e7Bg;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5d5c8c1006eso1380583eaf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 09:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723221789; x=1723826589; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/A9pYmRxsbKmiizxv4GAG6AJQVfW4xanyzqbsolOB0=;
        b=jR67e7Bgf2NDl0nM+hCSTIjQBdPzWWwThyB5oxG4kyjpoH5/0hPW53eQUYc6nTCCMl
         ek5SC85cWgfRiujw24/p6s5/jFTaVQIWF2wHXMUMn86p00gr2fQ/5B86UIuZaS+HiWV3
         U5LSt07ResU00HSMprlARk87hQiQCQg7j7NaGTpksroG1RVkpEOuH7r87Av3QvWuuT8+
         ehfiMoW/gcnLAI3WpDjF9KQuDR0fEJIyIb8FijFNrAUKs+lrx4TUViaPbhmuIVjJingC
         IZLYrt4+DyiBZWn7ToPXHhm9GhpPnlxUxVwnyNNAJvPtGJ5IM2XuMgaN/hIcBMkFfA4L
         ReMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723221789; x=1723826589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/A9pYmRxsbKmiizxv4GAG6AJQVfW4xanyzqbsolOB0=;
        b=EDbzCyxVdWnrVVTtFBfuMtBOcuA8N3hHvTF2fwZSdHtVwvFueNOG6RDiKHHbir8nCx
         MxGfB9882XV4EEgDbTU0UMi9NtArXS7dMtdEFOkoYxe+81tI3qzJMAHfDRJISWGTzs6j
         r/Gf9kiWqaRz7nf4iIvFUpSs8X6IYNwlVl3YtwNyQPA/f1mJQFLvglHPx4sZO3Vd9SB+
         Zlzs/WUBJcPq1F7W9eRVqoA4ABzk5lZJzFvr67IeFSbeSa1gud+MwCbDA/8C9x3I8Q8G
         6KICBjK71ZiCAInPA5t5PkRnMQ7rd8JwOMEQyuqujy6ounB2cB1oaF8o2G2qQqNOctIg
         cFSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJKksGvlj9S93yKNnXB/Z0r+vRETnzqz7IDG4dnP/yANwoPPCl9bJOIMfZRDYKAjTrF7kKHQSO+cjUuDYhgkQw8lYRjqe+8b+kuKCS0JXwRtxru0ccRH2RgQ==
X-Gm-Message-State: AOJu0YyZpwCa8k3Vo/BIDq3xb9GKoYHq2yNOs6BWlalNmTdMAp6EFvdC
	k4pdPL3xObVDiCnANqp8ALzmRh+L05jp5r1RpOp8IX4H/NPdzpbgCgGS1Y4WWmvCDXH3ngAgEhM
	T6K/VRuJ7sO30P8ley7kSYdzO/l6ok5Rwfpw=
X-Google-Smtp-Source: AGHT+IGBp8xEMfE6tWEpVQT/JpoygijDZlMpbo87gl7u73EhbyAk14pF1+RT3Qc4K11RzPRYSTe+NnZ1dyjhBmQF7qc=
X-Received: by 2002:a05:6820:1b94:b0:5c6:7519:9b58 with SMTP id
 006d021491bc7-5d86ca38f32mr2257251eaf.4.1723221789215; Fri, 09 Aug 2024
 09:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
 <1722933994-32549-15-git-send-email-wangmy@fujitsu.com> <864eb3e4-2102-45ae-98d5-26925b40af62@windriver.com>
In-Reply-To: <864eb3e4-2102-45ae-98d5-26925b40af62@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Aug 2024 09:42:43 -0700
Message-ID: <CAMKF1sqUJtNH3zGfLH72SotDo=SvBcAqR8btxT2+hS1cHSPp4w@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 15/60] liblinebreak: upgrade 1.2 -> 2.1
To: randy.macleod@windriver.com
Cc: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:43:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111726

I think it has been superseded by
https://vimgadgets.sourceforge.net/libunibreak/
so I am in favor of removing this recipe. If someone adds a recipe for
libunibreak we might add it to meta-oe

On Fri, Aug 9, 2024 at 9:36=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2024-08-06 4:45 a.m., wangmy via lists.openembedded.org wrote:
>
> License-Update: Copyright year updated from 2008 to 2008-2011
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{liblinebreak_1.2.bb =3D> liblinebreak_2.1.bb}             | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/liblinebreak/{liblinebreak_1.2.bb =3D> li=
blinebreak_2.1.bb} (69%)
>
> Hello,
>
> Do you or does anyone actually use this library?
>
>
> I was going to remove it with this commit log:
>
>
> Subject: [PATCH] liblinebreak: remove obsolete library
>
> liblinebreak has no users in meta-oe or in the layer index:
>    https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3D=
depends%3Aliblinebreak
> so remove it.
>
> The upstream is has not been maintained for some time:
>    https://vimgadgets.sourceforge.net/liblinebreak/
> and they say that liblinebreak has been superceded by libunibreak,
> an equivalent library that works in more languages:
>    https://vimgadgets.sourceforge.net/libunibreak/
> but since there are no users, libunibreak  was not packaged.
>
> ../Randy
>
>
>
>
> diff --git a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb b/m=
eta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
> similarity index 69%
> rename from meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
> rename to meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
> index 539b58bc5..c6caf450a 100644
> --- a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
> +++ b/meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
> @@ -2,11 +2,10 @@ DESCRIPTION =3D "Liblinebreak is an implementation of t=
he line breaking algorithm
>  HOMEPAGE =3D "http://vimgadgets.sourceforge.net/liblinebreak/"
>  SECTION =3D "libs"
>  LICENSE =3D "Zlib"
> -LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D3715191da62bafb5cfc4ff36195b2=
ec3"
> +LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Df89a1ce02e2dba48c1c0a8e603846=
4c2"
>
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/${PV}=
/liblinebreak-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "d18039259001ccb24b5dd4648c49c5ad"
> -SRC_URI[sha256sum] =3D "9efcb0cb1afc75ad1e92d2b2dbf4d9c77b072d6656c5f1a1=
50af8b718d0c7b76"
> +SRC_URI[sha256sum] =3D "dd8cba554d260cf686865cc53d0c6be98102a80f56f8152c=
a5e7307bf06a66b8"
>
>  UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/vimgadgets/file=
s/liblinebreak/"
>  UPSTREAM_CHECK_REGEX =3D "${BPN}/(?P<pver>\d+(\.\d+)+)"
>
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
> View/Reply Online (#111725): https://lists.openembedded.org/g/openembedde=
d-devel/message/111725
> Mute This Topic: https://lists.openembedded.org/mt/107747837/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

