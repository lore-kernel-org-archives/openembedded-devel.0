Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A69C83F17
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 01:59:04 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.4479.1752199135472937093
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 18:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PemrYaXm;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e3e0415a7so14995817b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 18:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752199134; x=1752803934; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHkwZSzbPAd81ZDRc0oW8zCyy+RIzXcu+AZeDWADzMY=;
        b=PemrYaXm6Yp4uSUYV17PdUzd2Zfg0vOhtTwDTHwQzPeuYjOitIpL1OsUB0pjMNPAuj
         YjoLOEIYDYlpwJYX+XA75jCpFb8/KhdB7shmrlTdYvFRZtVQaeJPOQDEIi7lYHkkdxHg
         5v1h81zgFNHfMOlm4k1wcVAIej7b03A6IQJNjv1vWHarNV/oSQ2eno3bSB0coRAcehVK
         2JHNCFf4YU4CNrG6Q8z7hk7tV1myRVh2Fp4KX1+BosjL6KWgCLKmDX9efyxVem7ic+Hg
         PBZcan/c+mcoaknnV07SSUeQ995+d2XZjpzVYycT4O3euBxFd1SLCBnbfj7S0tQ432zk
         DbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752199134; x=1752803934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHkwZSzbPAd81ZDRc0oW8zCyy+RIzXcu+AZeDWADzMY=;
        b=D6WDhDymWd21+FmgZGknD/dzGKmyOJDzvYR1IXg00wwOBVH8xzcPGQSlQI0kvifV1k
         c8Ry6S8kKJj02nAa3HYDcbTJYh6foitnvQry0jmlChJkAcwqSP6RjJxmoHbwqFe1i0oW
         jWReZtMV6F9w67hd5IjtZNz1NPh9ZnD2etPBH9FcRqlcDJX3bmaIJodTUQEIaQN//DX0
         DzPW1IbmSsTQsNRvXETxlyYpAi7rzriBb95p05Oi4bj39Y6gE65HzZkXzFbANqv25zSW
         pVaIawFW5+wG7edQkUkKAxCuqjpvUcsIkxVkOfYxAvPUkDBDianqupiJeQYG/F4/u20g
         b9Tg==
X-Gm-Message-State: AOJu0YwhCqOS0Xr8A4vLhnelC+CvFkNzw0lKDmXKQncS6tGaqTTOE3qz
	UIgncmFWCdrnh4WYfoY7jvalN4XS8hUabpFuTuW+J+sLLFlD394BjZ49+zQGIjwVBppIxkefZed
	1ZKUnhrYfSBu87m3jYayK07Z4MEj9vyg=
X-Gm-Gg: ASbGnctr8RTlo9fE/RlVEUVp03HbakqpPEibuIHhINxIQjPokHic+uPrh7cunN57mdx
	1cyM9BSTD2MptF8wXeHKyCqME2y5HnuBOaiEqeVO/r/FqP4y89joTswALH6f4NnesZvSnT3eUhn
	TDkFpBVdJJFPrIsPODK4HzsbTzl9JSsg+GIUR4msp0LW7x0GD4DaF4gxytEFKmbIk627CYtvB2h
	8SJTB8=
X-Google-Smtp-Source: AGHT+IEpLDTYI0+TBGB5+udX+wFtpPkxIhqeC2cJ4yxRSftnH9viQI3qmf/qZn0LG/fT4POSkYdLW8rh4o8JN8V6Wug=
X-Received: by 2002:a05:690c:1c:b0:712:c5f7:1ee9 with SMTP id
 00721157ae682-717c14b3978mr96489397b3.8.1752199134324; Thu, 10 Jul 2025
 18:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250710173827.43239-1-alperyasinak1@gmail.com> <20250710173827.43239-5-alperyasinak1@gmail.com>
In-Reply-To: <20250710173827.43239-5-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Jul 2025 18:58:28 -0700
X-Gm-Features: Ac12FXzOkTUXvpBSl8lNoqYU3Qeqd6SNxepsu4XHZPZszBMf1CWODDeK4qQCtM0
Message-ID: <CAMKF1spBd6BEtZscGGFzrpArx3+w0HsYBrWF4ZOW6+XXBnTs-w@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 5/5] linux-serial-test: Add patch
 for CMake 4+ compatibility
To: alperyasinak1@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 01:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118427

your patch has been accepted. Please bump the SRCREV instead here now ?

On Thu, Jul 10, 2025 at 10:39=E2=80=AFAM Alper Ak via lists.openembedded.or=
g
<alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
>
> Fix:
>
> | CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
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
>  .../0001-allow-build-with-cmake-4.patch       | 43 +++++++++++++++++++
>  .../linux-serial-test_git.bb                  |  3 +-
>  2 files changed, 45 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-test/linux-serial-test/linux-serial-t=
est/0001-allow-build-with-cmake-4.patch
>
> diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test/000=
1-allow-build-with-cmake-4.patch b/meta-oe/recipes-test/linux-serial-test/l=
inux-serial-test/0001-allow-build-with-cmake-4.patch
> new file mode 100644
> index 0000000000..0b67ad03b1
> --- /dev/null
> +++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test/0001-allow=
-build-with-cmake-4.patch
> @@ -0,0 +1,43 @@
> +From 83ec3d72913cbdee0c0f27fe74f77bf2ef1d1901 Mon Sep 17 00:00:00 2001
> +From: Alper Ak <alperyasinak1@gmail.com>
> +Date: Thu, 10 Jul 2025 14:11:22 +0300
> +Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
> + compatibility
> +
> +Fix:
> +
> +| CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
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
> +Upstream-Status: Submitted [https://github.com/cbrake/linux-serial-test/=
pull/60]
> +
> +Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 10e3968..4ce6ef1 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1,7 +1,7 @@
> + # SPDX-License-Identifier: MIT
> +
> + project(linux-serial-test C)
> +-cmake_minimum_required(VERSION 2.6)
> ++cmake_minimum_required(VERSION 3.5)
> + add_executable(linux-serial-test linux-serial-test.c)
> + target_link_libraries(linux-serial-test rt)
> + install(TARGETS linux-serial-test DESTINATION bin)
> +--
> +2.43.0
> +
> diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git=
.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> index c617cf09a3..a451db2a76 100644
> --- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> +++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> @@ -3,7 +3,8 @@ HOMEPAGE =3D "https://github.com/cbrake/linux-serial-test=
"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSES/MIT;md5=3D544799d0b492f119fa04641d=
1b8868ed"
>
> -SRC_URI =3D "git://github.com/cbrake/linux-serial-test.git;protocol=3Dht=
tps;branch=3Dmaster"
> +SRC_URI =3D "git://github.com/cbrake/linux-serial-test.git;protocol=3Dht=
tps;branch=3Dmaster \
> +        file://0001-allow-build-with-cmake-4.patch"
>
>  PV =3D "0+git"
>  SRCREV =3D "2ee61484167eab846f7b7c565284d7c350d738d3"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118420): https://lists.openembedded.org/g/openembedde=
d-devel/message/118420
> Mute This Topic: https://lists.openembedded.org/mt/114086939/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

