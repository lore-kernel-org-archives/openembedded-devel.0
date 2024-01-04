Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BC8C47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 19:15:20 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.2621.1704395712214611082
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jan 2024 11:15:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NZMDJ7JE;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3bc09434600so322190b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Jan 2024 11:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704395711; x=1705000511; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjDS6Bk/b96E26oUQ47gC+6YFdl7aWjnE8u/BF2m4GU=;
        b=NZMDJ7JESeY39dBpDLAuZxvAjEuBWev/1Xyjf2tPC6Pr3gN8oLYJHAoyW2SSdtI7Q1
         z8ETZPHoXHNcFgp5UIzEl9Pbn6gGAKMa5PyX9Zc4OuAm2QOom01P2nFRPPJteUAsUCxp
         erHdgOgvLkbw/TBYM14Un9HLusHf9DwgYmsrVvBugom/NFrB7PqwbutIh42EbwZvRzlx
         AXM+Kfs0und9RmD5hM6neoDDmy1Hy9va7jnzI3RHpaLPfc3hwN6MOQdv0GRwvdScGwTl
         eSnD4wsMxfDxnwmBy4XWGsJDeMzD7X5sbYiD2lKGru1vyNAzD8FFr8pQf7Nxuqn4NN2a
         0Zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704395711; x=1705000511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjDS6Bk/b96E26oUQ47gC+6YFdl7aWjnE8u/BF2m4GU=;
        b=KPQfz/C2ZKK6olFpy20bjYB0d9vlpIN+74zPp4ydlAO77UMb4IyLH/p20L9HNpUGyJ
         oS17Xjt7uRnE4a6bwRnCNircQWn/vdWgT2FBfO2aeT0jKZ0/KiqoOh3vW8jy/oeQ5kfO
         mvHSklgfogjN5WEMa4DP/BfrkG9Iw8ub0sD+6KV8iRFUF/hkYYfAHPCyWHvp1DRm49Z8
         aT8FZMdo4juokCpXFUeMCm0R6CwSzF/7jzsGB0/pRtjxo6XOkTwevrHzyhakmuIrZy1M
         1qmy8SCZ65O1kv+vsK6dIDzU+9AM/PK9S8+pbkUmD9x8nmOr1CDxGVeOufEcDJAQlkWh
         YVSg==
X-Gm-Message-State: AOJu0YxQ7RcEpNhGENd5yJOwrdaj4nY2f2tJoK923dmJwnabPguuV0a4
	8Q8dKgmGVdz1wkO+93jOM3LoMvxPo0iaOFA9pl4=
X-Google-Smtp-Source: AGHT+IE/5b0Pwr76SO8HPY7d5hb70aVqxkjPEyk+jE7LGAd/Z/XjY65INW8jKt9/LjJ9q4qYQd6f7S+L8f2Nw+B0dzc=
X-Received: by 2002:a05:6808:4c2:b0:3bb:df24:808a with SMTP id
 a2-20020a05680804c200b003bbdf24808amr388388oie.44.1704395711309; Thu, 04 Jan
 2024 11:15:11 -0800 (PST)
MIME-Version: 1.0
References: <20240103065145.170716-1-alperyasinak1@gmail.com>
In-Reply-To: <20240103065145.170716-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Jan 2024 11:14:45 -0800
Message-ID: <CAMKF1srZeNTbYU=Oe-1ojyy18cNf4RANKpsSghRPM0E8QfadxA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] librdkafka: upgrade 1.8.2 -> 2.3.0
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jan 2024 19:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108039

this is causing libcppkafta builds to fail

| DEBUG: Executing shell function do_compile
| NOTE: cmake --build
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/libcppkafka/0.4.0+git/b=
uild
--target all --
| ninja: error: '/usr/lib/libcurl.so', needed by
'src/lib/libcppkafka.so.0.4.0', missing and no known rule to make it

also see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3484/step=
s/14/logs/stdio

On Tue, Jan 2, 2024 at 10:51=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com> =
wrote:
>
> * License-Update: Copyright year changed
> * 0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch dropped because fixed in the =
new version
> * Fix -> WARNING: librdkafka-2.3.0-r0 do_package_qa: QA Issue: File /usr/=
lib/cmake/RdKafka/RdKafkaTargets.cmake in package librdkafka-dev contains r=
eference to TMPDIR [buildpaths]
>
> Changelog:
>
> https://github.com/confluentinc/librdkafka/blob/v2.3.0/CHANGELOG.md
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch | 30 -------------------
>  ...ibrdkafka_1.8.2.bb =3D> librdkafka_2.3.0.bb} | 21 +++++++------
>  2 files changed, 12 insertions(+), 39 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/librdkafka/librdkafka/0001-cm=
ake-Use-CMAKE_INSTALL_LIBDIR.patch
>  rename meta-oe/recipes-support/librdkafka/{librdkafka_1.8.2.bb =3D> libr=
dkafka_2.3.0.bb} (59%)
>
> diff --git a/meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use=
-CMAKE_INSTALL_LIBDIR.patch b/meta-oe/recipes-support/librdkafka/librdkafka=
/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch
> deleted file mode 100644
> index 053a4cc2d..000000000
> --- a/meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_=
INSTALL_LIBDIR.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From ed1dd35e0e23a98e57567718a0d474fd29cc348a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 19 Mar 2022 21:36:41 -0700
> -Subject: [PATCH] cmake: Use CMAKE_INSTALL_LIBDIR
> -
> -this ensures that it is portable across platforms e.g. ppc64/linux
> -uses lib64 not lib
> -
> -Upstream-Status: Submitted [https://github.com/edenhill/librdkafka/pull/=
3770]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - CMakeLists.txt | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index d1129bce..774473fa 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -219,7 +219,7 @@ configure_file("packaging/cmake/config.h.in" "${GENE=
RATED_DIR}/config.h")
> -
> - include(GNUInstallDirs)
> -
> --set(config_install_dir "lib/cmake/${PROJECT_NAME}")
> -+set(config_install_dir "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
> -
> - set(generated_dir "${CMAKE_CURRENT_BINARY_DIR}/generated")
> -
> ---
> -2.35.1
> -
> diff --git a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb b/met=
a-oe/recipes-support/librdkafka/librdkafka_2.3.0.bb
> similarity index 59%
> rename from meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
> rename to meta-oe/recipes-support/librdkafka/librdkafka_2.3.0.bb
> index 6148e7cb0..5b6e94d56 100644
> --- a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
> +++ b/meta-oe/recipes-support/librdkafka/librdkafka_2.3.0.bb
> @@ -5,19 +5,22 @@ HOMEPAGE =3D "https://github.com/edenhill/librdkafka"
>  SECTION =3D "libs"
>  LICENSE =3D "BSD-2-Clause"
>
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2be8675acbfdac48935e73897af5f=
646"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D40b04809b5d6f648f20f45143cbcb=
1ad"
>
> -SRC_URI =3D "git://github.com/edenhill/librdkafka;protocol=3Dhttps;branc=
h=3Dmaster \
> -           file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch \
> -          "
> -SRCREV =3D "063a9ae7a65cebdf1cc128da9815c05f91a2a996"
> +SRC_URI =3D "git://github.com/edenhill/librdkafka;protocol=3Dhttps;branc=
h=3Dmaster"
> +SRCREV =3D "95a542c87c61d2c45b445f91c73dd5442eb04f3c"
>
> -DEPENDS =3D "zlib openssl zstd"
> -
> -inherit cmake
> +DEPENDS =3D "zlib curl zstd openssl"
>
>  S =3D "${WORKDIR}/git"
>
> -FILES:${PN} +=3D "${datadir}"
> +inherit pkgconfig cmake
>
>  EXTRA_OECMAKE +=3D "-DRDKAFKA_BUILD_EXAMPLES=3DOFF -DRDKAFKA_BUILD_TESTS=
=3DOFF"
> +
> +do_install:append() {
> +       # remove absolute paths
> +       sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/RdKafka/Rd=
KafkaTargets.cmake
> +}
> +
> +FILES:${PN} +=3D "${datadir}"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108024): https://lists.openembedded.org/g/openembedde=
d-devel/message/108024
> Mute This Topic: https://lists.openembedded.org/mt/103497939/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

