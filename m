Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE37C48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 17:19:23 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.47194.1707931162738064354
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Feb 2024 09:19:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yn/X8EUE;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6e2e58feaefso978371a34.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 09:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707931161; x=1708535961; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a44Qh6AnzySwlIXmbOMrlvOqyjl9oRh8YZ19A0nakjQ=;
        b=Yn/X8EUEMoEyoka02/5j4z1ITPp6Ul8c3DQFMh5ZQV9mPZ0fa4dR9wfEBE9pS4llp6
         FBI3IANPQhs1BpFGmFZrAR0/1TpGXdRvUwWjXUsGpU98ykn1sW6uR83GVb9uUOGvpcms
         A3BtnFfqFcRh4CFA0VIAK23bZtqBgR+SkRpSIT6a7Vd8swdIePjiQSPcMmVP1i3xzXGu
         we4xFncsM9F9qMc+XRCRT7QR4pkrjeeqiLB+ODi4OmsHHUHZZy//k1noFV3IjyqneSM2
         6TUHAi/GV10eMhpxzfmI+wzhEM9bhstEGIfD5qU9qQdLnQtaIO81i7h71Rkd8YSPGJqI
         tL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707931161; x=1708535961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a44Qh6AnzySwlIXmbOMrlvOqyjl9oRh8YZ19A0nakjQ=;
        b=Q0W4Yg7/OzR839hOszquxbMduIR+c4qElfFTNThknfF5F+F/fnhxe0YCyTFQi1zmAM
         VBv4xT/HJrgazLxVXFDT3eX4QfDWPtcWJGhrNLxkoydTWHv6fBQq7zb+XQcnijwpiA/B
         G5xnY6h6kXLYXT+KeX4iTRRGVJ+nwoGXp5U82TEen1BEHv/nO1kUjJWLZDYyk45ACKiz
         Xb7/9cMSCEUgWahibj7kteWaPqWoeSoJU8TI1MZvVkGoQS4QPKmusi00zk+5g0mIF36a
         M34qnHDOks4QedNyIcBixfZ8WrCzNvuJ09ScQA/3GpHG5vyTDLJGs7nW9eZrIXc3T9kk
         +elg==
X-Gm-Message-State: AOJu0YwEQxEDl44/9IY+PAYVHpSpaV3WVolaEWlHf8L8/o3lRxwMWGTJ
	be8fs5BQ52KZLP7ODb8aMTA9B1tJzzzObBWPHKMV+vmf5YXtbF9MeKEpOkw9sbTqNKNpF64Jp7F
	FVjND/tZq1tUqQsVNhgQILS+t6xE=
X-Google-Smtp-Source: AGHT+IFcnJGgDSYEzLwPT9jYyWUlhOD6ozEpNcGiLHqKgsjidhxHE4gjM0T0tB7mGsMOPCBlPgzSvnVEQdzjlceYYdI=
X-Received: by 2002:a05:6870:5e4d:b0:21a:8e6c:26ea with SMTP id
 ne13-20020a0568705e4d00b0021a8e6c26eamr3579507oac.8.1707931161536; Wed, 14
 Feb 2024 09:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20240214092807.1224894-1-archana.polampalli@windriver.com>
In-Reply-To: <20240214092807.1224894-1-archana.polampalli@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Feb 2024 09:18:55 -0800
Message-ID: <CAMKF1sq5PzDFwP6MMkmciZzRwsG6fZZ-z430hNQrD1uiprAqXA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/1] nodejs: update to latest v20 version 20.11.0
To: archana.polampalli@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 17:19:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108744

On Wed, Feb 14, 2024 at 1:28=E2=80=AFAM Polampalli, Archana via
lists.openembedded.org
<archana.polampalli=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> License-Update:
>     update c-ares to 1.20.0 [1]
>     Copyright update [2]
>
> Removed below patches as these are availbe in 20.11.0
>     0001-build-fix-build-with-Python-3.12.patch [3]
>     0001-gyp-resolve-python-3.12-issues.patch [4]

I see them removed from SRC_URI, however they should be deleted from
repository as well which I do not see in this patch.

>
> Changelog:
>    https://github.com/nodejs/node/releases/tag/v20.11.0
>
> [1] https://github.com/nodejs/node/commit/b705e19a95b5fc5a2edc9fc11a7649d=
6eb32d70b
> [2] https://github.com/nodejs/node/commit/347e1dd06a5f927d9fd64ce72d776c5=
6d5101910
> [3] https://github.com/nodejs/node/commit/0a5e9c12cf961a56bd63005974b953b=
bc0bc62a7
> [4] https://github.com/nodejs/node/commit/68ec1e5eeb4ff984868c625f0ce8082=
10169360d
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  .../oe-npm-cache                                            | 0
>  ...cache-native_20.5.bb =3D> nodejs-oe-cache-native_20.11.bb} | 0
>  .../nodejs/{nodejs_20.8.1.bb =3D> nodejs_20.11.0.bb}          | 6 ++----
>  3 files changed, 2 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.5 =3D> nodejs=
-oe-cache-20.11}/oe-npm-cache (100%)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.5.bb =
=3D> nodejs-oe-cache-native_20.11.bb} (100%)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_20.8.1.bb =3D> nodejs_20.=
11.0.bb} (95%)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.5/oe-npm-=
cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.11/oe-npm-cache
> similarity index 100%
> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.5/oe-npm-c=
ache
> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.11/oe-npm-ca=
che
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.5.=
bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.11.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.5.b=
b
> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.11.bb
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb b/meta-oe/r=
ecipes-devtools/nodejs/nodejs_20.11.0.bb
> similarity index 95%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_20.11.0.bb
> index 5cdcd2767..cc5135478 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.11.0.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>  HOMEPAGE =3D "http://nodejs.org"
>  LICENSE =3D "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Ap=
ache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D162595a4a2f3453a0534e60b0afe4=
e7b"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D78ad16dab3c1d15d4878c81770be0=
be7"
>
>  CVE_PRODUCT =3D "nodejs node.js"
>
> @@ -27,8 +27,6 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.=
tar.xz \
>             file://0001-Revert-io_uring-changes-from-libuv-1.46.0.patch \
>             file://0002-Revert-io_uring-changes-from-libuv-1.45.0.patch \
>             file://run-ptest \
> -           file://0001-build-fix-build-with-Python-3.12.patch \
> -           file://0001-gyp-resolve-python-3.12-issues.patch \
>             "
>
>  SRC_URI:append:class-target =3D " \
> @@ -40,7 +38,7 @@ SRC_URI:append:toolchain-clang:x86 =3D " \
>  SRC_URI:append:toolchain-clang:powerpc64le =3D " \
>             file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
>             "
> -SRC_URI[sha256sum] =3D "f799c66f6a6386bb8ac2c75a378f740c455e97f1fe964393=
dd39c9f9f6efbc70"
> +SRC_URI[sha256sum] =3D "31807ebeeeb049c53f1765e4a95aed69476a4b696dd100cb=
539ab668d7950b40"
>
>  S =3D "${WORKDIR}/node-v${PV}"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108738): https://lists.openembedded.org/g/openembedde=
d-devel/message/108738
> Mute This Topic: https://lists.openembedded.org/mt/104349882/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

