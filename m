Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9A6C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 10:28:27 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.10517.1752229701660395168
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 03:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NiuYCK+r;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso2032480e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 03:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752229700; x=1752834500; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDlqMxLUOE6IoiD9Uj5GMMgtwOffdu0qq9N96XG775Q=;
        b=NiuYCK+rN2j9Aa4a6zmtqYP3+qdw83guqrLleZqq+zi/YAUNL8N729Kh0s1Sp8C+q3
         Q+Rx7OiI+4qyWyK7c3cn3Zj5J1gPuNAYxvpc/Z2SZNf45QgbvOFQOm9+FAccK32exoBS
         An8FtL6+l9z1uurGut2rbH81VSFIx8dE3J7sgZqufyKgpjZuZcUmcAdb/0P6kOwXJSgZ
         i0MzHFPYxEI2hxMPtEFFGv4SNN2b7sPkBSguw/NhdwWFvEZRdxJQ56i/f66Nh9xblMz/
         VKpkRGsW/gJcSPehGLcbejfjvVv1lTIcuJEoXVM/xqH8e+71AlHzJqMOy6WudvQvDuNs
         0Ysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752229700; x=1752834500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDlqMxLUOE6IoiD9Uj5GMMgtwOffdu0qq9N96XG775Q=;
        b=PAmhp+W8GxLV7xg/MHPELxmtzo2rx3XOZAqAnGFsEOVKNj0bzQduuaXufVOvzGjG2U
         lnxCCjehE0meeGd3KAMkUpc0CC1SvYAqEhADaMfz2twy0d9nJUcWq0UHa1qGsNLLBOh1
         W7ZZfilIYWak1Uls6avoFpElGStoF5qPPbmLyaKLBFnH3EPbmXhQfQA4YAcJOatR91KG
         fgPUrq5R8ikPx0FHfy2KrSR3B4SaHDry7VgwIsC5vQzjsdf5CzOodqZstNOih0h3C7yw
         3pkilgrEuHVTmmB7KWTb5k32QvyVzui/+a/QHLimJSuKEAbAFp2M5UEx/JdLKzIodoZR
         JY1w==
X-Gm-Message-State: AOJu0YxdZDxmAb5bf9sE5liJpI8+T0pEgrWONWiyVPTUW+u977SZDKvz
	ffpXqJqGVYgV4wqnhnxsFfToKeI9T1b7qzwkPx6R9Www5vIPhHP9/Jur7rIp4tq5vtZizbIb8qI
	vT0rqQalk+PVHrybtifI62bnFfQG5Ah0=
X-Gm-Gg: ASbGncsOUK9bb7LMx3HLTXMIkn+UT0eHYWXn2T9zKv6tls/PSRzplWAGjM0FwZ2VyFb
	Ejimqy05xel4jWt8KSuq8D90xODGSVJ8TcsLwififDoYjdhwrFlOxpAuftDMlxCizS8Pmjxeabx
	cfTaN2ViScfC09uDr9IiRz8YVEeYF3To8Pg4AVJWWyXuA9LlwEVaH+g1QSio0XRzuG1TkQHsKjP
	nisztHsZA==
X-Google-Smtp-Source: AGHT+IERO8puRNFB35cXAMIpNZtvJ2tqrSnHeFjRgQ1Ahvo/TQZIA+IDKEd9/0aKXbzbCJGrLQvomKrU89Xk9kEQAGA=
X-Received: by 2002:a05:6512:3b12:b0:553:37da:2bad with SMTP id
 2adb3069b0e04-55a046475ccmr744299e87.38.1752229699352; Fri, 11 Jul 2025
 03:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250711100052.255467-1-Moritz.Haase@bmw.de> <20250711100052.255467-11-Moritz.Haase@bmw.de>
In-Reply-To: <20250711100052.255467-11-Moritz.Haase@bmw.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 11 Jul 2025 12:28:06 +0200
X-Gm-Features: Ac12FXwMtTirNnuOKJ23o31u5xVXxMYDc0Pam2o7fvxal8yswRYWA2bT2u-izEA
Message-ID: <CA+chaQckg=5Q4KfAB7T+6e6vLLc-5zGxpvVCCfz0_i3Z7=uD_w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 10/10] [RFC] vulkan-cts: upgrade 1.4.2.1 -> 1.4.3.1
To: Moritz.Haase@bmw.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 10:28:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118445

On Fri, Jul 11, 2025 at 12:01=E2=80=AFPM Moritz Haase via
lists.openembedded.org <Moritz.Haase=3Dbmw.de@lists.openembedded.org>
wrote:
>
> New version includes support to build against CMake 4+.
>
> Release notes are available at [0].
>
> [0]: https://github.com/KhronosGroup/VK-GL-CTS/releases
>
> ---
>
> This is an RFC, as the build doesn't pass for me locally, it fails with:
>
>     | CMake Error at external/spirv-tools/CMakeLists.txt:39 (message):
>     |   spirv-tools not found
>
> From what I can tell, the in-place fetching of the submodule doesn't seem=
 to be
> working correctly.

Isn't it because in this change you have (probably accidentally)
changed the destsuffix in SRC_URI?

Cheers,

> Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> ---
>  ...LAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch | 29 -------------------
>  .../vk-gl-cts/khronos-cts.inc                 |  1 -
>  .../vk-gl-cts/vulkan-cts-sources.inc          | 25 ++++++++--------
>  ...n-cts_1.4.2.1.bb =3D> vulkan-cts_1.4.3.1.bb} |  2 +-
>  4 files changed, 13 insertions(+), 44 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-D=
efine-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
>  rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.2.1.bb =3D> vu=
lkan-cts_1.4.3.1.bb} (92%)
>
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-W=
AYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch b/meta-oe/recipes-graphics/vk-=
gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patc=
h
> deleted file mode 100644
> index 9eef9a702e..0000000000
> --- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_=
SCANNER-and-WAYLAND_PROTOCOLS_D.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From ec12bb7bda60cdf2c848e13df67452a7d30a42be Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 3 Sep 2022 18:52:42 -0700
> -Subject: [PATCH] cmake: Define WAYLAND_SCANNER and WAYLAND_PROTOCOLS_DIR=
 if
> - not already defined
> -
> -This helps with cross compiling and providing these knobs from cmake
> -cmdline
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - framework/platform/CMakeLists.txt | 8 ++++++--
> - 1 file changed, 6 insertions(+), 2 deletions(-)
> -
> ---- a/framework/platform/CMakeLists.txt
> -+++ b/framework/platform/CMakeLists.txt
> -@@ -83,8 +83,9 @@ if (NOT DEFINED TCUTIL_PLATFORM_SRCS)
> -                               configure_file(${WAYLAND_XDG_SHELL_SRC_DI=
R}/xdg-shell.c ${DEQP_XDG_SHELL_GEN_OUTPUTS_DIR}/xdg-shell.c COPYONLY)
> -                               configure_file(${WAYLAND_XDG_SHELL_SRC_DI=
R}/xdg-shell.h ${DEQP_XDG_SHELL_GEN_OUTPUTS_DIR}/xdg-shell.h COPYONLY)
> -                       else ()
> --                              pkg_get_variable(WAYLAND_PROTOCOLS_DIR wa=
yland-protocols pkgdatadir)
> --
> -+                              if (NOT WAYLAND_PROTOCOL_DIR)
> -+                                      pkg_get_variable(WAYLAND_PROTOCOL=
S_DIR wayland-protocols pkgdatadir)
> -+                              endif()
> -                               if (NOT WAYLAND_SCANNER)
> -                                       pkg_get_variable(WAYLAND_SCANNER =
wayland-scanner wayland_scanner)
> -                               endif()
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe=
/recipes-graphics/vk-gl-cts/khronos-cts.inc
> index 1cc2da7a49..67a0dc564c 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> @@ -2,7 +2,6 @@ LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
>
>  SRC_URI =3D "git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=3Dhttp=
s;name=3Dvk-gl-cts;nobranch=3D1 \
> -           file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOL=
S_D.patch \
>             file://0001-use-library-sonames-for-linking.patch \
>             file://generate-srcuri.py \
>             "
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/=
meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
> index 563da1007a..df530e85e1 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
> @@ -6,21 +6,20 @@
>  RECIPE_UPGRADE_EXTRA_TASKS +=3D "do_refresh_srcuri"
>
>  python __anonymous() {
> -    if d.getVar("PV") !=3D "1.4.2.1":
> +    if d.getVar("PV") !=3D "1.4.3.1":
>          bb.warn("-sources.inc out of date, run refresh_srcuri task")
>  }
>
>  SRC_URI +=3D " \
> -    https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/a=
pi/app/renderdoc_app.h;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/rende=
rdoc/src;sha256sum=3De7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3=
d0bdb6868e \
> -    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/src;=
rev=3D3364b982713a0440d1d342dd5eec65b122a61b71 \
> -    git://github.com/KhronosGroup/glslang.git;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=3D1=
b65bd602b23d401d1c4c86dfa90a36a52c66294 \
> -    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-headers/=
src;rev=3D767e901c986e9755a17e7939b3046fc2911a4bbd \
> -    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/src;=
rev=3D645c59c70e826d9738b6bb103316c03d887dfed3 \
> -    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/vu=
lkan-validationlayers/src;rev=3D6cf616f131e9870c499a50441bca2d07ccda9733 \
> -    git://github.com/google/amber.git;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=3D6fa5ac1fb3b0=
1c93eef3caa2aeb8841565e38d90 \
> -    git://github.com/open-source-parsers/jsoncpp.git;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/jsoncpp/src;r=
ev=3D9059f5cad030ba11d37818847443a53918c327b1 \
> -    git://github.com/Igalia/vk_video_samples.git;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/nvidia-video-samp=
les/src;rev=3D45fe88b456c683120138f052ea81f0a958ff3ec4 \
> -    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-=
video-samples/src;rev=3D0e87744edbb84c9c56c3fc8de9ea5150af5ee4ea \
> -    git://github.com/Igalia/video_generator.git;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/video_generator/sr=
c;rev=3D426300e12a5cc5d4676807039a1be237a2b68187 \
> -    file://0001-Fix-missing-include-cstdint-causing-build-failures.patch=
;patchdir=3Dexternal/amber/src \
> +    https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/a=
pi/app/renderdoc_app.h;subdir=3Dgit/external/renderdoc/src;sha256sum=3De7b5=
f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e \
> +    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3Dgit/external/spirv-tools/src;rev=3Df06e0f3d2e5acfe4b14=
e714e4103dd1ccdb237e5 \
> +    git://github.com/KhronosGroup/glslang.git;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3Dgit/external/glslang/src;rev=3D963588074b26326ff0426c8953=
c1235213309bdb \
> +    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3Dgit/external/spirv-headers/src;rev=3D6d0784e9f1ab92c=
17eeea94821b2465c14a52be9 \
> +    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3Dgit/external/vulkan-docs/src;rev=3D112aee75d162412a462=
3e7d22a3de52e0233cbf5 \
> +    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3Dgit/external/vulkan-validationlayers/src=
;rev=3D6ae58a2b17b2bcebdc5377995007391b85ffa10f \
> +    git://github.com/google/amber.git;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3Dgit/external/amber/src;rev=3D57ba1ca211b6f4890c013dcf42cb16069ae91=
6dd \
> +    git://github.com/open-source-parsers/jsoncpp.git;protocol=3Dhttps;no=
branch=3D1;destsuffix=3Dgit/external/jsoncpp/src;rev=3D9059f5cad030ba11d378=
18847443a53918c327b1 \
> +    git://github.com/Igalia/vk_video_samples.git;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3Dgit/external/nvidia-video-samples/src;rev=3D45fe88b456c=
683120138f052ea81f0a958ff3ec4 \
> +    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3Dgit/external/vulkan-video-samples/src;rev=3Da=
22e0084e6f38a16dc0dcebb4c19a14651a6665b \
> +    git://github.com/Igalia/video_generator.git;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3Dgit/external/video_generator/src;rev=3D426300e12a5cc5d46=
76807039a1be237a2b68187 \
>  "
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.2.1.bb b/m=
eta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.1.bb
> similarity index 92%
> rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.2.1.bb
> rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.1.bb
> index abbd026047..3f7a2480ef 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.2.1.bb
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.1.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Vulkan CTS"
>
>  require khronos-cts.inc
>
> -SRCREV_vk-gl-cts =3D "644f10ca39dea3b7d9dbadaa75c56206b499a520"
> +SRCREV_vk-gl-cts =3D "1ef11bc7acde6b53a499de73db4cf78db9572710"
>
>  require vulkan-cts-sources.inc
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118436): https://lists.openembedded.org/g/openembedde=
d-devel/message/118436
> Mute This Topic: https://lists.openembedded.org/mt/114097814/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

