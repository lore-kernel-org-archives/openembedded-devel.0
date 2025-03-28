Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A628DC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 06:37:24 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.5690.1743143841091716777
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 23:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Olyn92OR;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3f6dccdcadaso1271851b6e.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 23:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743143840; x=1743748640; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54T3NLLgOqC0q8H0J0ubbvVjQKMgySCpF94Kc22JfzI=;
        b=Olyn92ORpJXJ1bt7FeUhLY3XugIN38kEGPStKvqLQQXsDiVXjMf500AiQhTgD8WtoX
         cTiXavMJwoHJljKkyl/bWVx7mw3NyNKlKRakTh/32dDzWuknzP6aWG/qt92L5HuOV9ms
         Ge7+8N/s2SX3AxDF235Z3jbcQmJ6/BJDLBebVREjL9lV4t6Qkn8JW83TTGOBIN8n+kIV
         i1eC7UmuaPmqFiXqmhCcPJ3vdPbEOMYHnPHN1Rqb9dbiaEbhGNEhqucyKWEStzvSuzDv
         2I7/TcU0NgVgOs1wm8gmxisOlKFdTM7FPzAgXiJ9wVC15sXzrjZDcDQg81Eux3zKUDMp
         AhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743143840; x=1743748640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54T3NLLgOqC0q8H0J0ubbvVjQKMgySCpF94Kc22JfzI=;
        b=cV66SbfAH0rBMhTdkVGEhRLo9xylKcX8LuWewwkybFwbAVD54J5Xf8BLzwTzYMIo6r
         RYmpQo6dZVySKZLuYvzcG1EBF38kDLpJf26SjdF+bI7CH8eqa6Oeu+I/mKjeQI4xdOBa
         moSGnTLqjByqXI/J770aQ5uqFbjas2nXpRafT0TFIYhyyfhnJSZtFKmQzspZYyeL38mU
         mNTWQ+OLLkXvGJRwhGuRAI0p2v9WfL5PjwVxxw8UQIkhdTE0u1F2aGNXdjMcctKrHH8v
         xNFSbPFtRYasSRkmq6ZZv8tB6sKLqrtqU8hnMzWIwuh3vDPheDxbVH6z/7H/ex4a4MX2
         7P6w==
X-Gm-Message-State: AOJu0YyubwXSpZUgrGZ+MzgEzI+q5sDX0B0S0+91bdx4eMut8KXnAcIW
	sZSLBt4vNFiWl/bKNJNwkyHan5T3VVb7cCAjPKg8fTckMEwwBHxBNDROOQ5M+d6MtcYnbJISa3Q
	DmCagMA7WtsP5bG/cWzX8gDhMrpg=
X-Gm-Gg: ASbGnctYY0EWSGhzSphqMpf73vhAe82WNn16X0RkecOiOBPFz+xUdguGi3bmPjqzk73
	kqspE9hBKCZ8CSoqy4kG/b06ZnRx+uoVKahISPeChdgbt+y+IBZjzb+E/Gfac0y0KBenhtho9Xs
	8PxRdgKIVV1krgiT548IbdPWW3eYdXnMi0rnLJQMNN8X7vVFdfQfo1b91RTMw=
X-Google-Smtp-Source: AGHT+IE356opauUZ/uuigWJ+hqQE9a0msiHfewVuZw5CygQho8Y/aGCDZVimMBzGFVh1Yn0slc08AuNGkuZ0K0C6cjI=
X-Received: by 2002:a05:6808:2512:b0:3f9:6df8:1d33 with SMTP id
 5614622812f47-3fefa4e6bf1mr3288557b6e.6.1743143839967; Thu, 27 Mar 2025
 23:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250328062115.126982-1-thond2009@gmail.com>
In-Reply-To: <20250328062115.126982-1-thond2009@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Mar 2025 23:36:53 -0700
X-Gm-Features: AQ5f1JrFc0X8r0d3WuqI8nbpN6d1XzZWolYdm0Nh8pwhlQ9Ct3KydiyyEmpanQ0
Message-ID: <CAMKF1srg4tgteAQVsoVSFFKLWmU6MukBvPoG+9SjqpoL6CcrKQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] apitrace: Fix build with gcc-15
To: thond2009@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	"tho3.nguyen" <tho3.nguyen@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 06:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116345

On Thu, Mar 27, 2025 at 11:21=E2=80=AFPM Nguyen Dat Tho via
lists.openembedded.org <thond2009=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: "tho3.nguyen" <tho3.nguyen@lge.com>
>
> To fix errors:
> In file included from TOPDIR/tmp/work/core2-64-oe-linux/apitrace/11.1+11.=
1+git/git/frametrim/ft_matrixstate.hpp:30,
>                  from TOPDIR/tmp/work/core2-64-oe-linux/apitrace/11.1+11.=
1+git/git/frametrim/ft_matrixstate.cpp:28:
> TOPDIR/tmp/work/core2-64-oe-linux/apitrace/11.1+11.1+git/git/frametrim/ft=
_dependecyobject.hpp:187:44: error: 'uint64_t' was not declared in this sco=
pe
>   187 |     std::unordered_map<unsigned, std::pair<uint64_t, uint64_t>> m=
_buffer_mappings;
>       |                                            ^~~~~~~~
> ...
> TOPDIR/tmp/work/core2-64-oe-linux/apitrace/11.1+11.1+git/git/retrace/metr=
ic_writer.cpp:50:70: error: 'uint64_t' does not name a type
>    50 |         case CNT_NUM_UINT64: std::cout << "\t" << *(reinterpret_c=
ast<uint64_t*>(data)); break;
> ...
>
> Signed-off-by: tho3.nguyen <tho3.nguyen@lge.com>
> ---
>  .../0001-Explicit-header-stdint.patch         | 42 +++++++++++++++++++
>  .../apitrace/apitrace_11.1.bb                 |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/apitrace/apitrace/0001-Expli=
cit-header-stdint.patch
>
> diff --git a/meta-oe/recipes-devtools/apitrace/apitrace/0001-Explicit-hea=
der-stdint.patch b/meta-oe/recipes-devtools/apitrace/apitrace/0001-Explicit=
-header-stdint.patch
> new file mode 100644
> index 0000000000..9ce6693061
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/apitrace/apitrace/0001-Explicit-header-std=
int.patch
> @@ -0,0 +1,42 @@
> +From 952bad1469ea747012bdc48c48993bd5f13eec04 Mon Sep 17 00:00:00 2001
> +From: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
> +Date: Fri, 21 Mar 2025 05:02:23 +0000
> +Subject: [PATCH] Explicit header: stdint
> +
> +Fix building with GCC-15. It no longer includes it by default.
> +
> +Upstream-Status: Backport [https://github.com/apitrace/apitrace/commit/9=
52bad1469ea747012bdc48c48993bd5f13eec04]
> +
> +Signed-off-by: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
> +---
> + frametrim/ft_dependecyobject.hpp | 1 +
> + retrace/metric_writer.cpp        | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/frametrim/ft_dependecyobject.hpp b/frametrim/ft_dependecyob=
ject.hpp
> +index 2cd0b768..0f17b601 100644
> +--- a/frametrim/ft_dependecyobject.hpp
> ++++ b/frametrim/ft_dependecyobject.hpp
> +@@ -28,6 +28,7 @@
> + #pragma once
> +
> + #include "ft_tracecall.hpp"
> ++#include <stdint.h>

this should have been <cstdint> but since it's a backport, I won't
complain here.

> +
> + namespace frametrim {
> +
> +diff --git a/retrace/metric_writer.cpp b/retrace/metric_writer.cpp
> +index e923ed1d..4e4ce748 100644
> +--- a/retrace/metric_writer.cpp
> ++++ b/retrace/metric_writer.cpp
> +@@ -24,6 +24,7 @@
> +  **********************************************************************=
****/
> +
> + #include <iostream>
> ++#include <stdint.h>
> +
> + #include "metric_writer.hpp"
> +
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb b/meta-oe=
/recipes-devtools/apitrace/apitrace_11.1.bb
> index d872c4dbb5..48ba7dbaea 100644
> --- a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
> +++ b/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daeb969185a143c=
3c25130bc2c3ef9a50 \
>  SRCREV =3D "9352fc02bba106fbbeef9e8452ef34643c0d0764"
>  PV .=3D "+11.1+git"
>  SRC_URI =3D "gitsm://github.com/${BPN}/${BPN}.git;branch=3Dmaster;protoc=
ol=3Dhttps \
> +           file://0001-Explicit-header-stdint.patch \
>            "
>
>  S =3D "${WORKDIR}/git"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116344): https://lists.openembedded.org/g/openembedde=
d-devel/message/116344
> Mute This Topic: https://lists.openembedded.org/mt/111950111/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

