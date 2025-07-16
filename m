Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D73CC83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 15:46:17 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.25819.1752680773940274282
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jul 2025 08:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b1fHcP1E;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7183dae66b0so6385517b3.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 08:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752680773; x=1753285573; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcG3+oJmJJwwh9nArbeZc1RS2OqcChh2rjx+f0EVHA0=;
        b=b1fHcP1Eq8ZgsRRPw3utUN+HnARZ4xMT/htHOLTlgH7GNC8A6vpq82H1S5IG/4RLVi
         z/kRVCCnpYBRYhsX1MYkY2UfB9sbIVzKmWMTtFQzl1Jrk15/QcxS2l98DNEuRhhOm20A
         dojhdqWCr5Kp8sTo5DI1uKJq35j+0HoPvACamVrLhOcc0ohVzTYu/MxplIxtY+L9Fzfd
         A2JkBz6tT0laDAIaeyKYd0RnFVFg7LfHnV0y1IhoFyux8gfISx0TUftppJDNbkp/QPIS
         pLB7Xi/lcSDQUmYs8HgkVE3ytOJu369rVhP1WAy9ZxcDgUAxe7VcJYnwu50VnTo8PMp3
         f+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680773; x=1753285573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcG3+oJmJJwwh9nArbeZc1RS2OqcChh2rjx+f0EVHA0=;
        b=m3wEdWXXLkOu6WP8kHIqziQStvPBvNdc/KqHa2jwPS2HSsNCUuyem+qefSSbWYSQpZ
         Va0ibiq/noRZztNJfcxTJdFFGCS+qvUUCxn44TgyOO1ZpS8kf9db5uGdl2DOkK8DHfoe
         hr4gbZr6DvIztrE+s1NNVZ2dAA0mHSkbMy/l4CeKRbXaSRTs3pFglc2l2ya7p/QbLKD+
         hmnMLmT+w47u3XI0dSmwWArVnRQjRU5ztH7Mt1TqXc48lWuBtquy+qtNseOQT3MRqDbA
         TkzniCI1LNm7wev62EnT5IrfkkvYb3spRmI+ThJIfQUyYoOxV62yvGRgUCpGe/hDtKaZ
         ctMw==
X-Gm-Message-State: AOJu0Yzikdch/mIzgAYPNKrcZ6qRYeJ63EcuWrcZ/Ri8GBsVRgyLj3q5
	aWgAbxfklQzl2EySCuRu3M3eySfX7lWrPlBb7I5SxH0XVmAx/twcn0xondZPV5KJmeXKI6jguoP
	j8nszjQeidO0tsAKAq9VPXOKeXYpJl4o=
X-Gm-Gg: ASbGncuuHxFgG4kxNVnoVBRTm/9eT+93WvcBKijOHLL9LALpCCDdpUsDBcsgYKb/N0G
	kvzB/sdoBbqy/Fqo//UxK9RRIRD1QXH/3KPDGfGqKTd4LiEYj09jy5rFWlhywfPuVFOJmVhg+xK
	7EnNtANJFlumALJwRkU04YjtLpM2YAl6dMcKHhRjtm6Woxlppsl2oFYzod018OXDOuUc+3f0/eF
	iEJjXs=
X-Google-Smtp-Source: AGHT+IFUho8GSNCrJK8ykzfVloVAkn6zkclew34iEx8dAAqWPbcTIJB+YlTk6t5qyFE65W1ZAkZN2P6UzwkuTpwMnk4=
X-Received: by 2002:a05:690c:d19:b0:70c:bd93:452d with SMTP id
 00721157ae682-71834fd8451mr49166857b3.15.1752680772786; Wed, 16 Jul 2025
 08:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250716064102.1813-1-wangmy@fujitsu.com> <20250716064102.1813-14-wangmy@fujitsu.com>
In-Reply-To: <20250716064102.1813-14-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Jul 2025 08:45:46 -0700
X-Gm-Features: Ac12FXwMkcr7V2izyhDZ0ASKWgpLRu3nk4nHY3v8BI-7q-qRh-0cMFapVg73O-I
Message-ID: <CAMKF1srF-n3neHZjpH4J1PNadteo3Px02FJiCmY-AgrOvkEnww@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 14/14] uftrace: upgrade 0.17 -> 0.18
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 15:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118600

This version fails to buld with lld linker on qemux86 as it finds
undefined symbols

https://errors.yoctoproject.org/Errors/Details/872341/

On Tue, Jul 15, 2025 at 11:41=E2=80=AFPM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - symbol: Fix uninitialized 'sec_iter' in the 'arch_load_dynsymtab_noplt'
> - graph: -f total-avg,self-avg,total-max,total-min,self-max,self-min in t=
ui,cmds
> - test: exclude system_initialize_function in t295 and t296 using filter =
option
> - record: Add shmem directory to exec permission
> - misc: Support Rocky Linux 9 in install-deps parts
> - tests: Fix s-thread.c and s-exp-mixed.c tests from clang
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../uftrace/{uftrace_0.17.bb =3D> uftrace_0.18.bb}              | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/uftrace/{uftrace_0.17.bb =3D> uftrace_0.=
18.bb} (94%)
>
> diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb b/meta-oe/r=
ecipes-devtools/uftrace/uftrace_0.18.bb
> similarity index 94%
> rename from meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb
> rename to meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb
> index 776bb014f4..f82dc17071 100644
> --- a/meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb
> +++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb
> @@ -10,8 +10,8 @@ DEPENDS:append:libc-musl =3D " argp-standalone"
>
>  inherit autotools
>
> -SRCREV =3D "b0d936107edcefb519abbc9c363ca40daaac23b3"
> -SRC_URI =3D "git://github.com/namhyung/${BPN};branch=3Dmaster;protocol=
=3Dhttps \
> +SRCREV =3D "8ccd4f627569b0af122c8d1df98dc6813ab97a40"
> +SRC_URI =3D "git://github.com/namhyung/${BPN};branch=3Dmaster;protocol=
=3Dhttps;tag=3Dv${PV} \
>             file://0001-include-libgen.h-for-basename.patch"
>
>  LDFLAGS:append:libc-musl =3D " -largp"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118584): https://lists.openembedded.org/g/openembedde=
d-devel/message/118584
> Mute This Topic: https://lists.openembedded.org/mt/114181015/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

