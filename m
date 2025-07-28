Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCAFFC83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 17:57:58 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.87874.1753725471734266863
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Jul 2025 10:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bRqbMzhh;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71a34087749so2297957b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 10:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753725471; x=1754330271; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQQoBiuGTO0EzEsp/i8uECf5Jdzd+VP5yzFhGcF2j5Y=;
        b=bRqbMzhho/OH2L1LJQ0t5sDjOmzf7cktpIr2FZx8EJH1+M+zeuyFFzzcMeZ56t00EG
         7J9RtFvWF3jjcVBLQ6BD/cI3jeIsmW4KjPEMPi2IFCtkKMILbO3ptSsA/YmSAHO8NikO
         S48OlIAb5AfJUDxQrFJzpOc5R2SK0Yw/cU2oIVh2+NXYhuliDkfJDx2OCFgkRfKleRZj
         zR/J7ciopI2c3xJCxhSxDAvispX5l5ad7sPleKk8kkcu/rN7ffoL9MFxNFaoZF3IiUtG
         CAULSkFwJ9RS2FREuWuLUUGsLy/tjC6+0MK96uNjIhJcrNwfSSKLzYp/upErLjF9vL4f
         zLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725471; x=1754330271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQQoBiuGTO0EzEsp/i8uECf5Jdzd+VP5yzFhGcF2j5Y=;
        b=Je1ZRhzzsuiu6NkvCGbsP0xEWpZ8j0VPPYb5gnGD5rky5ovx8p/tLWA+MHOgi/SQRP
         P3HthVD022aZVlivpUSWbPK6SA5HLZ7qXvUemlY4TyljrUEXPyYtIWJWFqkS5b5NYerC
         t5a8i15Q4TdUI/RLJcO/57yuvDZekz3KE+0SzYsNiL7ww0OZWlsrqalbjyBXh1Qi4nzC
         4K5sk7jM2pCC3Rlp/J52ycF0TQaH9V3bXzdZMxrABXPJhGTYKddX0Ty+ASuNnxFlxEcB
         7SHzIqb3X7kFngIzSfcFZoJfJqg7n5/O0KeVu4j/VpP5pjZrMQpN61jEUdugsIPwXhT7
         RKIw==
X-Gm-Message-State: AOJu0Yzj4dd0rhy16ujkKnOHcs94K8PmlwZ7UGw9n7ZGJDIcDimZvWtX
	pneRIq7QJ4gcrAkUEIM0M/omhNmFi+Yd1UplUNSS63qB7V/tBa7JyvHgQIGoXBJKcG5wG6KHBb8
	1ycBt9aQkHZTXlLDlxi0Q4/sQzSvOby+jT3b65zI=
X-Gm-Gg: ASbGncuKAfXvqjUzfqBTCmFtEPr4lZxW4SPHmwnfAUj7f9hdNs8V9dqfevqDTVwxSIJ
	/p0YtQ5n1YvKLTEfntLhoWXKuuqcm/5rihgudHbd62FZoR1Lp1ahEIoNKjWsoJP6bWYkPVtTR58
	rDIVsbZ4nlSJj3uyVPYTqxAY4NeQPSQm0gpurc9VFyOwcDZSu9QBe1CCN5IUFDsTrVuz2wGHtby
	Cp7Ds/F6HOODC2dzUAg24ZqgAqBqYU1NUg=
X-Google-Smtp-Source: AGHT+IG5gA7MBbKKg12dvPLfzo7fDAOKumtfrMEo7MZs5DNN35mKG15npbi4b04YSZaOBQWGHgWPDpCtJ81yVeJ6tcs=
X-Received: by 2002:a05:690c:61c6:b0:70a:2675:70b3 with SMTP id
 00721157ae682-719e32ea2dcmr173625357b3.17.1753725470563; Mon, 28 Jul 2025
 10:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250728141401.3522091-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20250728141401.3522091-1-jiaying.song.cn@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2025 10:57:24 -0700
X-Gm-Features: Ac12FXz3m6-inXs_EFoqqnyi2W4W9XjHMhKq5x0SgZrsUO_b3DhSzX5-XNJMFgw
Message-ID: <CAMKF1spqPgqXzsdJfJRQq7sWBsatkVHpdaUWEJsabN9rySF06A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][walnascar][PATCH] v4l-utils: Fix QA and build
 errors related to _TIME_BITS on 32-bit
To: Jiaying.Song.CN@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 17:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118750

This is needed on the master branch as well. I have picked it for master-ne=
xt

On Mon, Jul 28, 2025 at 7:14=E2=80=AFAM Song, Jiaying (CN) via
lists.openembedded.org
<Jiaying.Song.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> * Remove GLIBC_64BIT_TIME_FLAGS=3D"" to enable _TIME_BITS=3D64 by default=
,
>   which avoids the following QA issue during builds on 32-bit systems:
>
>   WARNING: lib32-v4l-utils-1.24.1+git-r0 do_package_qa: QA Issue: /usr/bi=
n/cec-compliance uses 32-bit api 'time'
>
> * Undefine _TIME_BITS to fix the build error:
>
>   /usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=3D64 is =
allowed only with _FILE_OFFSET_BITS=3D64"
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  ...on.build-fix-arm-_TIME_BITS-64-error.patch | 38 +++++++++++++++++++
>  .../v4l2apps/v4l-utils_1.28.1.bb              |  5 +--
>  2 files changed, 39 insertions(+), 4 deletions(-)
>  create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-me=
son.build-fix-arm-_TIME_BITS-64-error.patch
>
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.bui=
ld-fix-arm-_TIME_BITS-64-error.patch b/meta-oe/recipes-multimedia/v4l2apps/=
v4l-utils/0003-meson.build-fix-arm-_TIME_BITS-64-error.patch
> new file mode 100644
> index 0000000000..f41dde0e16
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix-=
arm-_TIME_BITS-64-error.patch
> @@ -0,0 +1,38 @@
> +From 5aabd01e415374fc97eebe80d4635c3bae728f81 Mon Sep 17 00:00:00 2001
> +From: Hans Verkuil <hverkuil@xs4all.nl>
> +Date: Sat, 12 Apr 2025 12:30:13 +0200
> +Subject: [PATCH] meson.build: fix arm _TIME_BITS=3D64 error
> +
> +Undefine _TIME_BITS to avoid this error on 32-bit arm:
> +
> +/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=3D64 is a=
llowed only with _FILE_OFFSET_BITS=3D64"
> +
> +Upstream-Status: Backport [https://github.com/gjasny/v4l-utils/commit/d5=
17cfdcdc16533ab7e06e97c07ca089cf261aef]
> +
> +Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> +Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> +---
> + meson.build | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 269a9da7..31927cda 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -53,8 +53,12 @@ v4l2_wrapper_args =3D [
> +     # As the library needs to provide both 32-bit and 64-bit versions
> +     # of file operations, disable transparent large file support (fixes
> +     # 'Error: symbol `open64/mmap64' is already defined' compile failur=
e
> +-    # otherwise)
> ++    # otherwise).
> ++    #
> ++    # Also disable _TIME_BITS=3D64 since this is allowed only with
> ++    # _FILE_OFFSET_BITS=3D64, which is now 32.
> +     '-U_FILE_OFFSET_BITS',
> ++    '-U_TIME_BITS',
> +     '-D_FILE_OFFSET_BITS=3D32',
> +     '-D_LARGEFILE64_SOURCE',
> + ]
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb b/me=
ta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
> index afe217e1f3..5d21df04af 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
> @@ -13,10 +13,6 @@ DEPENDS =3D "jpeg \
>  DEPENDS:append:libc-musl =3D " argp-standalone"
>  DEPENDS:append:class-target =3D " udev"
>  LDFLAGS:append =3D " -pthread"
> -# v4l2 explicitly sets _FILE_OFFSET_BITS=3D32 to get access to
> -# both 32 and 64 bit file APIs.  But it does not handle the time side?
> -# Needs further investigation
> -GLIBC_64BIT_TIME_FLAGS =3D ""
>
>  inherit meson gettext pkgconfig
>
> @@ -29,6 +25,7 @@ SRC_URI =3D "\
>      git://git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstable=
-1.28 \
>      file://0001-media-ctl-Install-media-ctl-header-and-library-files.pat=
ch \
>      file://0002-media-ctl-Install-media-ctl-pkg-config-files.patch \
> +    file://0003-meson.build-fix-arm-_TIME_BITS-64-error.patch \
>  "
>
>  SRCREV =3D "fc15e229d9d337e46d730f00647821adbbd58548"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118746): https://lists.openembedded.org/g/openembedde=
d-devel/message/118746
> Mute This Topic: https://lists.openembedded.org/mt/114413900/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

