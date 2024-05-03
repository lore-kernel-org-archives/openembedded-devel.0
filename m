Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD541C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 09:50:37 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.8758.1714729833759964173
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 May 2024 02:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HYKuVTTW;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51f25f87e58so1962187e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 May 2024 02:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714729832; x=1715334632; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnEXCX74bogDjLBOHNeuXIDwru5E8yAwYYG4aDUyJ4Q=;
        b=HYKuVTTWvQ8H43N/SFFLQWPZsCWO0qL2190jn8wJm9/K6OmSaTUnWE3E7NY7fDI68o
         2yS7R5x7aPoRl1WBxH1zjAg7JjZSPO1qbhZqhCSKx5CG3U87jOupDssE9/TyQ/zJokU8
         PSS6nSTC4QqMJB6LLzR1+9Uybk9vnhqtMdT77mQfXjUGEJECPfaSjgtWJ1deINwM3nTK
         rEj3LQFR8wW8bZBoW3SPQDt3ZJut62PrM+/DvlQp4aFspwF31LhbUqk8qxj7t73zzOmP
         z6J9QawMVSGk7gIXk+d3/wEsfJQ+eGw2u/TaiKh9IH9rjn5IPhHc0WU2kMWt9tNneFQ/
         3Asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714729832; x=1715334632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnEXCX74bogDjLBOHNeuXIDwru5E8yAwYYG4aDUyJ4Q=;
        b=DLPD7BlwYPBnM9iIU7NgviDGdXCYItoxHCZ43cJDp1VrY5ZuZqs0TSa2K4A9SV5B4o
         FB41jWiOL+r88nrsOoQjGvXPR52+Pk1ZgnJ4kcGBFFkIj4lFmDIJstgN4Gxzaj2vlvmy
         eSwFc4XlieNb6e61wJ3Px7+bwBGNaESCzgqCW49q4xdjcOJ6o+VjKjwALnHoWadfN4sf
         g3Jel03yWi/MUWLfczJ9OsLJjuI/GFrpDRkAkuf+JduyIoRz0bgioGzEpSnHB18VToqA
         vzcRnbmgnXQoJ21rb6d3JUGt+nr7vfbA0iG+Fuj8DNnBB67DZtINvD3v3nIuoTia5e4v
         IthQ==
X-Gm-Message-State: AOJu0Yxu/bb5viSZagzyInLH0ADDk1BHnjYRGtjOb9AhPZE47hGHQpB9
	gKP2BGUgPMMgZbffSM2kMwGGFbjl709MaLlC9QqfSQLRJcPJKNxjFxen8S67Hd+OowsknDBDdGo
	k6NC0IElo5dVtEsBO6BwXC8szYjecMPuX
X-Google-Smtp-Source: AGHT+IFI0xRPQCSushRtqgKAoNgMHlAhsYyIL8cjrz5/2L9B8rKWDfO4tkIvYB0D18rsJnmJxmY7OitLSY6r9CbXCFI=
X-Received: by 2002:a05:6512:201:b0:51d:68fb:5d73 with SMTP id
 a1-20020a056512020100b0051d68fb5d73mr1525531lfo.8.1714729831487; Fri, 03 May
 2024 02:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240425082519.2888002-1-archana.polampalli@windriver.com>
In-Reply-To: <20240425082519.2888002-1-archana.polampalli@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 3 May 2024 11:50:19 +0200
Message-ID: <CA+chaQfPhbJgPw+iLZkC67Ld-89TckhWHj6koYsSer8xXtRxUQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/1] nodejs: upgrade 20.11.1 -> 20.12.2
To: archana.polampalli@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 May 2024 09:50:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110246

Hi,

since this update I'm seeing couple of npmsw:// recipes failing with
ENOTCACHED for various dependencies, e.g.:

npm ERR! code ENOTCACHED
npm ERR! request to https://registry.npmjs.org/documentation failed:
cache mode is 'only-if-cached' but no cached response is available.
--
npm ERR! code ENOTCACHED
npm ERR! request to https://registry.npmjs.org/@babel%2feslint-plugin
failed: cache mode is 'only-if-cached' but no cached response is
available.

reverting npm upgrade from 10.3.0 to 10.5.0 from:
https://github.com/nodejs/node/commit/208dd887a5
https://github.com/nodejs/node/pull/51913
seems to fix this issue. Refreshing the shrinkwrap with 10.5.0 npm
produces identical shrinkwrap.

Is anyone else seeing this issue?

Cheers,


On Thu, Apr 25, 2024 at 10:25=E2=80=AFAM Polampalli, Archana via
lists.openembedded.org
<archana.polampalli=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> License-Update:
>     Copyright year updated
>     zlib version updated
>     GN files License update
>
> https://github.com/nodejs/node/commit/b5bc597871ca701bab750c46d31ed626dec=
d7f89
> https://github.com/nodejs/node/commit/c8233912e9fd7464898b549d6762130722b=
f0bf4
>
> Changelog:
> https://github.com/nodejs/node/releases/tag/v20.12.2
> https://github.com/nodejs/node/releases/tag/v20.12.1
> https://github.com/nodejs/node/releases/tag/v20.12.0
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  .../oe-npm-cache                                              | 0
>  ...-cache-native_20.11.bb =3D> nodejs-oe-cache-native_20.12.bb} | 0
>  .../nodejs/{nodejs_20.11.1.bb =3D> nodejs_20.12.2.bb}           | 4 ++--
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.11 =3D> nodej=
s-oe-cache-20.12}/oe-npm-cache (100%)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.11.bb =
=3D> nodejs-oe-cache-native_20.12.bb} (100%)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_20.11.1.bb =3D> nodejs_20=
.12.2.bb} (97%)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.11/oe-npm=
-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache
> similarity index 100%
> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.11/oe-npm-=
cache
> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-ca=
che
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.11=
.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.12.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.11.=
bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.12.bb
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.11.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_20.12.2.bb
> similarity index 97%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_20.11.1.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
> index 9a61cfcf7..d86c38f2f 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_20.11.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>  HOMEPAGE =3D "http://nodejs.org"
>  LICENSE =3D "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Ap=
ache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D78ad16dab3c1d15d4878c81770be0=
be7"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9a7fcce64128730251dbc58aa41b4=
674"
>
>  CVE_PRODUCT =3D "nodejs node.js"
>
> @@ -36,7 +36,7 @@ SRC_URI:append:toolchain-clang:x86 =3D " \
>  SRC_URI:append:toolchain-clang:powerpc64le =3D " \
>             file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
>             "
> -SRC_URI[sha256sum] =3D "77813edbf3f7f16d2d35d3353443dee4e61d5ee84d9e3138=
c7538a3c0ca5209e"
> +SRC_URI[sha256sum] =3D "d7cbcc5fbfb31e9001f3f0150bbeda59abe5dd7137aaa627=
3958cd59ce35ced7"
>
>  S =3D "${WORKDIR}/node-v${PV}"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110150): https://lists.openembedded.org/g/openembedde=
d-devel/message/110150
> Mute This Topic: https://lists.openembedded.org/mt/105726620/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

