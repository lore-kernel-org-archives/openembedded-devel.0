Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB3AC87FCF
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 18:44:49 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.3483.1754333080027173339
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 11:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D9L/703Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71b49bbb95cso31940187b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 11:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754333079; x=1754937879; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0pOXfCcQzW4T/mkg8r/QjnaqZGD+HMQD8MM3PTL39A=;
        b=D9L/703YXz7cWWgqeagsHxY42sRySknZJ5Q3ZzDrdIAzXqgK6LEy3PybY+vFKmwlF3
         bqnXuPIJ4UbPkVyQpURBAci1fOxb2jSDzDj39HyjyqEFyVSd5DmI3nKpHOM798172o92
         pBP/YoeBkYMdKp1KL9fmIQ83nGElkZHigjj2CqZlictBFDEi6pbBZqucRcXQkBNa6TMp
         sJxmsVNJTI+YoWxwco0weRojPrRkPAPBYwNNLRbjJ0dnXfC6IJLOeiCne8R4+JUSrPwX
         5gvNxLIQqu0zDo2rD9PNnSCvCyAQVZm/He/mAV2wNpOLucsv8Z9bWq6xm/iiI2j8VYrG
         MjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754333079; x=1754937879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0pOXfCcQzW4T/mkg8r/QjnaqZGD+HMQD8MM3PTL39A=;
        b=volZycbc5o9EoOkIF16P5Dm92pgwLqKJrZOwC8KN3vpEC8Ew/tUCQFHgAMi1Ycd6+R
         VFePCGRcvLlczt2xU1C+1pQ0SwrGaSBEPopbIy4Iw4jDp8ND7QnSFUvBBdPG6a6tGgTb
         FlogOpU6POMWRF4TeCUGc20enoOD6NbDIdsRCr/e0AWyjvJFhCG3qX09WnID6EZF3vLa
         1gm05hO6ZE2zCgi72xyegKI5UgSlPk4IiUKezQIZTBH8lknHROdiMFymDr5kW8dmXyp5
         VcaJjqlMlMDPpQBopxvzFNSHbMwUDGtBPRXXoR8c6elLJFLqDHoFNtjf1O0JNw00hP/M
         aUuA==
X-Gm-Message-State: AOJu0YwycA2Y7gixGd5i2w3Dve8ikvYfrF9KM+9tSl2ZoQUCXhxIUSqN
	6MUAw1/u/XusRDZ9+FeBJT0FuVAaDu6mr0gXDNDh7OCTwW1Rd4Uffdi57eJaZMWAdCN6C23cDdo
	prof969xK1RMkHXC9/+d18kNmFdwYACU=
X-Gm-Gg: ASbGncuKx3n1mPDqwwCNst+8TvIcTbJErbIV963BORne3mxctbq5Aook1JbYTb+H1/Q
	t0W9EN4PlX+qwQDt8Sg3dkrdP5DUj3JiTsHKUCJroI2SyrbRPvAdikzrqwXnRhbPAbx71LmvP7x
	K5o1blq9n6ci208tJ6ymubYcPtScnc5BuS8yiB0F8pSw5SWVslcm0dTamZ6DPEH4HRWg2H0VgN9
	gE7bc/VkAjyDGWdOAFpnfRtlDcMAdYLzv1sicODGjgudHJuDGo=
X-Google-Smtp-Source: AGHT+IFUVU6Wgr+yr6EZwvqM//IxWt/teDndQFrG4mVerFlKtJ5sT0KSqxQScjfSep7EtHFjyvCF8qjc54b/l5mqaXI=
X-Received: by 2002:a05:690c:290d:b0:71b:76c2:e914 with SMTP id
 00721157ae682-71b7f3f8401mr95177627b3.25.1754333079056; Mon, 04 Aug 2025
 11:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250804083340.1649-1-wangmy@fujitsu.com>
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Aug 2025 11:44:13 -0700
X-Gm-Features: Ac12FXwv3ngzcQrasBpxhh34UdefShGd9JBboxOvTPfnGcTWD5AQ28f1PEaDpRc
Message-ID: <CAMKF1sriFWWmvZGab-vWpvLn_NwopGfwe7L1b3r0rGeebUROwQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 01/18] aml: upgrade 0.3.0 -> 1.0.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 18:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118853

I am seeing a build failure which seems related to this

bitbake neatvnc

...

 Subproject aml is buildable: NO (disabling)
   Run-time dependency aml found: NO (tried pkgconfig)

   ../sources/neatvnc-0.8.1/meson.build:71:7: ERROR: Dependency "aml"
not found, tried pkgconfig

On Mon, Aug 4, 2025 at 1:33=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - sys/queue.h: Remove "#include <sys/cdefs.h>"
> - FUNDING.yml: Add github sponsors
> - Stop single-shot also when no cb is set
> - Replicate methods for every type
> - Use explicit types in callbacks
> - meson: Add run_command check argument
> - meson: Relocate headers and pkgconfig
> - kqueue: Call EV_SET without NOTE_ABSTIME on Mach
> - kqueue: Pass unspecified timeout as NULL
> - thread-pool: Make pthread_setcancelstate optional for Android
> - build: Make librt optional
> - Properly initialize global mutex
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-graphics/aml/{aml_git.bb =3D> aml_1.0.0.bb} | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-graphics/aml/{aml_git.bb =3D> aml_1.0.0.bb} (91%)
>
> diff --git a/meta-oe/recipes-graphics/aml/aml_git.bb b/meta-oe/recipes-gr=
aphics/aml/aml_1.0.0.bb
> similarity index 91%
> rename from meta-oe/recipes-graphics/aml/aml_git.bb
> rename to meta-oe/recipes-graphics/aml/aml_1.0.0.bb
> index a0b27bd256..c88591f114 100644
> --- a/meta-oe/recipes-graphics/aml/aml_git.bb
> +++ b/meta-oe/recipes-graphics/aml/aml_1.0.0.bb
> @@ -4,12 +4,9 @@ HOMEPAGE =3D "https://github.com/any1/aml"
>  LICENSE =3D "ISC"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De6f3cfaa39204b96e14b68b9d50d3=
e4e"
>
> -SRC_URI =3D "git://github.com/any1/aml;branch=3Dmaster;protocol=3Dhttps"
> -
> -SRCREV =3D "b83f3576ce4187d9285f06e9066ef43a691464d4"
> -
> -PV =3D "0.3.0+git"
> +SRC_URI =3D "git://github.com/any1/aml;branch=3Dmaster;protocol=3Dhttps;=
tag=3Dv${PV}"
>
> +SRCREV =3D "685035c9830aa89df02a43df89b644690bd885f5"
>
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[examples] =3D "-Dexamples=3Dtrue,-Dexamples=3Dfalse"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118834): https://lists.openembedded.org/g/openembedde=
d-devel/message/118834
> Mute This Topic: https://lists.openembedded.org/mt/114527095/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

