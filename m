Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B77C83F1A
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 00:07:51 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.27309.1752278865379246109
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 17:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WkcoCpeq;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-710bbd7a9e2so25950207b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 17:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752278864; x=1752883664; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r48N2bWj4Y88gncNkGlxWftqwNgMK7xw8mbqq6tXLH4=;
        b=WkcoCpeq3fxylK0ggdqUAmj5XbDkdY8G93NIsnNtcDukKGBqOigCO7MYVj0+XwZJSj
         jG9UHRZor0XkN8re6AwPMuAP53oizFI+JH7clxs6M/xyzE6llFgdNF3oU/rWT1/158V5
         VR7iFidMwMi9Uk+pd7ISbKwYm3+7VGjXELrcKM3VqpTh/nhOFyGqWLbWR3dAJ8w1uG46
         zMWiaLyVsmDaM34Fp3O7SuYcyT0a29g7SgcUD9Pv6rwf/A+DbwDLfFjPoNvcsMbRQoHg
         lB5ZOWflM5+ZCz/+XBN7r53XDeUSOakgxhmKb/se96ZIkL7J7t9f6qif76ut91FPIVqT
         gvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752278864; x=1752883664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r48N2bWj4Y88gncNkGlxWftqwNgMK7xw8mbqq6tXLH4=;
        b=VpX4bcxCvmZkvhkBgDe3Q17AB1riBK4XdpDhahCDEUnnlERRIl7VmZvTpjYDa4OKAY
         DAsJWzcwpUhNtwFIgk19HVSkRGpY3aiApFf9Buafer/7Yp4RL6GwRutxBaHV/j0nZTur
         o9rn+ZSY7Qom/YCVwwOIz8M93lt7ym/YqC4lZig+cWfvNZd/B6OA3a844swKCJQN1SuJ
         OQhdgiRDMe5trpXxFZjNbyI9a+vhUlZChXNAXqxPJdTJz9OgoAwMdl3u58/PNII+29dI
         TTho6RqxB3XnAIxdr/8OUsaRnCBV2fmLNQJWODmfON//wqXwxwWY3wXO8y6euQlHRj4m
         AOtg==
X-Gm-Message-State: AOJu0Yyko4FjwlfsV+wpfEFTI5iIxJHzejI+hc9BlWh9dXKBYW+3n8Vi
	n8dl9RxdxcnvouLolPo7R4+8sdl7M9+aOG24d21j847MzI7IY9ijjk4XNF0eNBC+AKZIsZaxgjC
	G5ODVzAWDhtwX1QPhchuaNriwu2GbYyw=
X-Gm-Gg: ASbGncvF84Y4BcEs+eYt8Bfea0r7deu+TMGaBVlx1ZYVgrQet0RCXM5LsuVs6v5dIi5
	jXLrJaGGOa4tVaDSC6PEbq3t+Hg2SznROtpp69Ly9G6GNTla2Pb0RHJZWX6yt23kFEqcgPhNyLM
	1WoWeffmfNAhsqF9hLO0l1QUnQKI5l/5E5p2qu6DeEt417eDtdKJAxpbzo9GhHkz5v/u0r8xyvQ
	S7X7G3W0bVv4nsy8w==
X-Google-Smtp-Source: AGHT+IGM92iij8Ou8Ia2wTvGr7p/bZvxi1KsxtxNSLGHz6T4CyreRASZfBzJcrmVFsM/0EiBYE4gws0/e3rxJ7J0+4M=
X-Received: by 2002:a05:690c:338e:b0:710:f39f:4d43 with SMTP id
 00721157ae682-717d78615aemr74947127b3.7.1752278864381; Fri, 11 Jul 2025
 17:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250711174400.2092299-1-alperyasinak1@gmail.com> <20250711174400.2092299-2-alperyasinak1@gmail.com>
In-Reply-To: <20250711174400.2092299-2-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Jul 2025 17:07:18 -0700
X-Gm-Features: Ac12FXwze6ifstErbpt9KNBm-uIgkevKja3AkjhpNziPMBJfAwYhy2CnqdzhOCM
Message-ID: <CAMKF1soCY+4Y_x32ARca1gxgvOKo2x95MNak0NVV5biZ0wzEEQ@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 2/3] libmusicbrainz: Add patch for
 CMake 4+ compatibility
To: alperyasinak1@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 00:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118463

This does fix the compatibility issue but it causes another build regressio=
n

| DEBUG: Executing shell function do_compile
| NOTE: cmake --build
/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/libmusicbrainz/5.1.0+g=
it/build
--target all --
| ninja: error: 'make-c-interface', needed by
'/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/libmusicbrainz/5.1.0+=
git/build/src/mb5_c.cc',
missing and no known rule to make it

On Fri, Jul 11, 2025 at 10:44=E2=80=AFAM Alper Ak via lists.openembedded.or=
g
<alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
>
> Fix:
>
> | CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
> |   Compatibility with CMake < 3.5 has been removed from CMake.
> |
> |   Update the VERSION argument <min> value.  Or, use the <min>...<max> s=
yntax
> |   to tell CMake that the project requires at least <min> but has been u=
pdated
> |   to work with policies introduced by <max> or earlier.
> |
> |   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring anywa=
y.
> |
> |
> | -- Configuring incomplete, errors occurred!
>
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  .../0002-allow-build-with-cmake-4.patch       | 40 +++++++++++++++++++
>  .../musicbrainz/libmusicbrainz_git.bb         |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/musicbrainz/libmus=
icbrainz/0002-allow-build-with-cmake-4.patch
>
> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrain=
z/0002-allow-build-with-cmake-4.patch b/meta-multimedia/recipes-multimedia/=
musicbrainz/libmusicbrainz/0002-allow-build-with-cmake-4.patch
> new file mode 100644
> index 0000000000..2aad2b617f
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz/0002-=
allow-build-with-cmake-4.patch
> @@ -0,0 +1,40 @@
> +From f5504099fd6f93ebfa351a034d29beb86db3408c Mon Sep 17 00:00:00 2001
> +From: Alper Ak <alperyasinak1@gmail.com>
> +Date: Fri, 11 Jul 2025 16:43:29 +0300
> +Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
> + compatibility
> +
> +Fix:
> +
> +| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
> +|   Compatibility with CMake < 3.5 has been removed from CMake.
> +|
> +|   Update the VERSION argument <min> value.  Or, use the <min>...<max> =
syntax
> +|   to tell CMake that the project requires at least <min> but has been =
updated
> +|   to work with policies introduced by <max> or earlier.
> +|
> +|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring anyw=
ay.
> +|
> +|
> +| -- Configuring incomplete, errors occurred!
> +
> +Upstream-Status: Submitted [https://github.com/metabrainz/libmusicbrainz=
/pull/21]
> +
> +Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 6181a06..f3672a3 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 2.6)
> ++cmake_minimum_required(VERSION 3.5)
> +
> + PROJECT(libmusicbrainz5)
> + SET(PROJECT_VERSION 5.1.0)
> +--
> +2.43.0
> +
> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrain=
z_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_gi=
t.bb
> index 1ae43e8aef..9200d0ea72 100644
> --- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.b=
b
> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.b=
b
> @@ -10,6 +10,7 @@ PV =3D "5.1.0+git"
>  SRCREV =3D "4655b571a70d73d41467091f59c518517c956198"
>  SRC_URI =3D "git://github.com/metabrainz/libmusicbrainz.git;branch=3Dmas=
ter;protocol=3Dhttps \
>             file://0001-http-fetch-Pass-a-non-null-buffer-to-ne_set_reque=
st_.patch \
> +           file://0002-allow-build-with-cmake-4.patch \
>             "
>
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118457): https://lists.openembedded.org/g/openembedde=
d-devel/message/118457
> Mute This Topic: https://lists.openembedded.org/mt/114104562/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

