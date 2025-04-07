Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F04C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:44:49 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.42816.1744019083941423920
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ojb1TrAC;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so36711271fa.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744019082; x=1744623882; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+whZr53qii7Szh+100B7ZSpoNa0fM5myJxlmYsG9B18=;
        b=Ojb1TrAChZ7IteOZx0GzMKBD59v5EB2BdakzY6ZF7/6yAukpUaNk1qmzZfUqygilMM
         JJUYlLf6ZVvXnP3IZ/ttkfSy7t3zKXWWCHphyu2FEaWV4E1dK23/lB/pa5lXogE/GI/i
         sLdnwXHzwdJdjdkqoo7DIGh0lBpy93KTTJfii62oTghoCrRDao+LgDuAc8CEtFnA0feN
         F5J2tMLeRpcMREQhNp13u3ImenBBxzlfURF/7HZv8rIeU1whrRs1pbiKlcyO7c3Scn5i
         R5OrsE+hqn9jcp0M30CQbFABh2PX+95aecuZy9bTdvSjZ5rVcG4zRuj6X81GSuZrDoF1
         LsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019082; x=1744623882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+whZr53qii7Szh+100B7ZSpoNa0fM5myJxlmYsG9B18=;
        b=lqGtiFau3QF5NYgN0NFz3U9pMWTecDYGqLVPYMC76j3+IM0CeDeuTCOZCe3am7uMzt
         eY3C4MWYLMDAAVRD6T9DHg14p5veD048ygd2BbH1mXziKeK48aFLbb4U00SqTQUrn8it
         91U29g1ucm5HNnK5vSaPVpjwKNQm1El1xIVcQ79lU7rAEN2lYGFlEByUHEluykrOxvMj
         u6oc/1FN/R7h4d8NXC2GHCdr435Z8vIYVpcrh40toYmut8WZtWM5f5luC/g1LGBJuwU9
         L08d47nZsN/FNPQ1UFAiWfxZEwtcSrfVDEbJ9kwGcclJfQdYiV9Y66OtL3HAwtHE26ky
         3AKA==
X-Gm-Message-State: AOJu0YyIuVVBNS3m7cEz9fh1ElAox9k7awM3TfW6/X+kqx6nQjlIel1Q
	MM7b4du+XKwQztvFwPbbWFJq3wgDyH0qhh5DdxNOOgHeidvVuwDietBnQL6L32LdEiXQ/aB8/qw
	fvYOKQnNQSrnkhFCjshEeQMIxmFs=
X-Gm-Gg: ASbGncvRKIH0pbmL7j0Z8e9D/9dgohxwhzYKHT5eDfWS97H8uHpXdzmF2dNVzV0qYY/
	pBReaoi+WMXOZ10N86gG8d3oOD2Ao/J+x1gz+O/Q8bSqLNkdA/PXwW1coufM5+pvxH3MVS1Js3b
	Xj9x10vaVNL3poytvq1bw9AL65iRHy
X-Google-Smtp-Source: AGHT+IGju8TpflXcFlCaI37D5q5BfB7EzG71BQt05IUVsJNEBHRIXnCuvSTZiTFZWfpQkqJuC8FEaJYlUOyULM9UYIE=
X-Received: by 2002:a05:651c:1478:b0:2ff:d0c4:5ffe with SMTP id
 38308e7fff4ca-30f0a10ce25mr39438601fa.16.1744019081818; Mon, 07 Apr 2025
 02:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250406072310.862374-1-raj.khem@gmail.com> <20250406072310.862374-2-raj.khem@gmail.com>
In-Reply-To: <20250406072310.862374-2-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 7 Apr 2025 11:44:30 +0200
X-Gm-Features: ATxdqUHcoXiu0eJUIfTyfEQH-b2D0ptcfpnmDjRwqiyqFsBcCl481PcyOPT1V24
Message-ID: <CA+chaQfcWbx0-6NGXD8HZ9C6_kfj5wm=tc9-X+3HS0cyGE_AtQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/5] icon-slicer: Fix hotspot y coordinates
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116656

xcursorgen is available only with x11 in DISTRO_FEATURES, so this should ge=
t

inherit features_check
REQUIRED_DISTRO_FEATURES =3D "x11"

as well, do you want me to send patch with this (and
packagegroup-meta-oe adjustment)?

On Sun, Apr 6, 2025 at 9:23=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../icon-slicer/files/hotspotfix.patch        | 27 +++++++++++++++++++
>  .../icon-slicer/icon-slicer_0.3.bb            |  6 +++--
>  2 files changed, 31 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/icon-slicer/files/hotspotfix=
.patch
>
> diff --git a/meta-oe/recipes-devtools/icon-slicer/files/hotspotfix.patch =
b/meta-oe/recipes-devtools/icon-slicer/files/hotspotfix.patch
> new file mode 100644
> index 0000000000..1f8730aba0
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/icon-slicer/files/hotspotfix.patch
> @@ -0,0 +1,27 @@
> +Description: Fix hotspot y coordinate
> +Author: Tim Swast <tswast@gmail.com>
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +--- a/src/main.c
> ++++ b/src/main.c
> +@@ -103,7 +103,7 @@
> +   if (n_channels =3D=3D 3)
> +     {
> +       out->x =3D start_x;
> +-      out->y =3D start_x;
> ++      out->y =3D start_y;
> +       out->width =3D source->gridsize;
> +       out->height =3D source->gridsize;
> +
> +@@ -137,8 +137,8 @@
> +                   {
> +                     min_x =3D start_x + i;
> +                     max_x =3D start_x + i + 1;
> +-                    min_y =3D start_y + i;
> +-                    max_y =3D start_y + i + 1;
> ++                    min_y =3D start_y + j;
> ++                    max_y =3D start_y + j + 1;
> +
> +                     found =3D TRUE;
> +                   }
> diff --git a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb b/me=
ta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
> index 991133185f..8079f871d1 100644
> --- a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
> +++ b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
> @@ -1,10 +1,12 @@
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
>
> -DEPENDS =3D "gdk-pixbuf popt"
> +DEPENDS =3D "gdk-pixbuf popt xcursorgen"
>
>  SRC_URI =3D "http://freedesktop.org/software/${BPN}/releases/${BPN}-${PV=
}.tar.gz \
> -           file://0001-Makefile.am-no-examples.patch"
> +           file://0001-Makefile.am-no-examples.patch \
> +           file://hotspotfix.patch \
> +           "
>  SRC_URI[sha256sum] =3D "05f0216dd0c25a17859de66357f64da5033375b6fbf5f31c=
a54867311160b64d"
>
>  inherit autotools pkgconfig
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116606): https://lists.openembedded.org/g/openembedde=
d-devel/message/116606
> Mute This Topic: https://lists.openembedded.org/mt/112112278/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

