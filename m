Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FD4CCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 17:24:12 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.22805.1760289843365671008
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Oct 2025 10:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fnjjTNtJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-74435335177so66733177b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 10:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760289842; x=1760894642; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcv05ggvtDi7UI/dY0hioqT0JzXng2e44o04V2Mpk30=;
        b=fnjjTNtJ5bB0RHJyl0dXDPC+UXrjHjRzFoGrd90RB2biBYeoxQQI/J02TFhR1wNi2j
         Oj9DppmuNMjm8KidVJi4GBijAyBGFNuen9Pljmw8S/P/zHRvmvTx3PjMO9EKgnfLNxZ1
         A+qTR1p7FJG3cpVXh5eeABf81N9ujpakvPHr3sWjq86WjhxOO0VfOCE5eFYQWtNQ8VDC
         0wCipKp1uUXHvd0d5FmQ5REpljiGbvU4zlIJXT+u5E4VjaQD3KCKlrDt99AOeVmLbt7Q
         YOJIwBlc29IFzCqAg0aMzsGTuFcZRjsO4xZqaSjq6QYM2jJL2zOLMnYPUtGBfLNoZC7f
         ntMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760289842; x=1760894642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcv05ggvtDi7UI/dY0hioqT0JzXng2e44o04V2Mpk30=;
        b=U/xaFHVy0/HUd3y+tcUP3WKyIr8mZKxGG2GBH9uhTIBSV+LZID95lt4bOqvKJFDnED
         uKJFKNpAIFRUUv5AinTvPA9I1UcBOEoU6oKHyAcQebCAS3BDxqPzCIFYK9MqST5ZXIxC
         3/1aAFTbzc/5SpLS2mn001BgKPd2Um/cl8hYbItcy/th8B0WlsopqqTukcrXQz5uWtio
         Aee7fnHkIi7qHqzebO/cGrWaE8Mt+BOMW+hlzKXm6SNuLZIhIcrwBKGZ0wHzNNAz2wV7
         n1F6l+bA2C+cuCz852TvgKS3LBkW2Yc0As3r89zi1avepsY/mINBMa51QByoN9zq5mG/
         kcqw==
X-Gm-Message-State: AOJu0Yw0CYn7bS72JnOg7uxG7vrYdBe9vy6IK5nI/sEMO/NSITumoXSY
	N75WZk3AW6UaZ08UtRp9xu21MM424LGYlhDEbDg8Rv5ukOMv9NWjDIpzAS+gKmvx+quBNRQCtJC
	hD9aLEXcS6oPhya0JN/7E6yCboiurNLtAE7BP0jI=
X-Gm-Gg: ASbGncsmVhTsOJfpnK+BDvHjWZJPhK26tH55yxF+svVWX7zv50g6Vhck+Hh6yY0Z24L
	0KpIsysdPhhcvBFLYTWopP7jaoxx0zKFSQIhUwJIEuyvoQAKZS2OfAAhk1fcsShof8sAPBY7QiD
	DgREL9zGGcxBdRiRE6K3dEBluC8e2eC1lWRM4LPuBvQkanZfK/pLUz6xG5MpGc2jqz2E7Vgfi7r
	6U5LDCMXPoS7LGcM+rCrSbBA/LdZDNGTs7FnRscLqwEuaZca9RaVcqdO/fDczS5sJ6Gxw==
X-Google-Smtp-Source: AGHT+IGZgK1TTeS9vDr4RWJKdhQjDTNpCUxRkxHGJ7x788zklkqFCO02LeWcQZ5o1MXAjuPh9w9q3Hy0PhxHRopzX/Y=
X-Received: by 2002:a05:690e:150e:b0:63c:f5a6:f2cf with SMTP id
 956f58d0204a3-63cf5a706dfmr4337743d50.30.1760289842398; Sun, 12 Oct 2025
 10:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20251011132213.1704548-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251011132213.1704548-1-dmitry.baryshkov@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Oct 2025 10:23:36 -0700
X-Gm-Features: AS18NWCF3-96WF1lyIXmCGT0ZdPiKMNLdQsrPXwlBVBZId-WUVZY_8jz2v5LSHA
Message-ID: <CAMKF1srv+2TbJd7paRz-55cnYfhqhOq+VE7AGPXGSD5qHfCqNQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vulkan-cts: upgrade 1.4.3.3 -> 1.4.4.0
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 17:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120520

configure fails for x86_64 -
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/3801833/raw_inlin=
e

On Sat, Oct 11, 2025 at 6:22=E2=80=AFAM Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> Upgrade Vulkan CTS in order to pick up tests for new extension and also
> some fixes or old tests.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../vk-gl-cts/vulkan-cts-sources.inc              | 15 +++++++--------
>  ...ulkan-cts_1.4.3.3.bb =3D> vulkan-cts_1.4.4.0.bb} |  2 +-
>  2 files changed, 8 insertions(+), 9 deletions(-)
>  rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.3.3.bb =3D> vu=
lkan-cts_1.4.4.0.bb} (92%)
>
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/=
meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
> index 6a8d781447eb..a40327869958 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
> @@ -6,20 +6,19 @@
>  RECIPE_UPGRADE_EXTRA_TASKS +=3D "do_refresh_srcuri"
>
>  python __anonymous() {
> -    if d.getVar("PV") !=3D "1.4.3.3":
> +    if d.getVar("PV") !=3D "1.4.4.0":
>          bb.warn("-sources.inc out of date, run refresh_srcuri task")
>  }
>
>  SRC_URI +=3D " \
>      https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/a=
pi/app/renderdoc_app.h;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/rende=
rdoc/src;sha256sum=3De7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3=
d0bdb6868e \
> -    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/src;=
rev=3Df06e0f3d2e5acfe4b14e714e4103dd1ccdb237e5 \
> -    git://github.com/KhronosGroup/glslang.git;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=3D9=
63588074b26326ff0426c8953c1235213309bdb \
> -    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-headers/=
src;rev=3D6d0784e9f1ab92c17eeea94821b2465c14a52be9 \
> -    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/src;=
rev=3D112aee75d162412a4623e7d22a3de52e0233cbf5 \
> -    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/vu=
lkan-validationlayers/src;rev=3D6ae58a2b17b2bcebdc5377995007391b85ffa10f \
> +    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/src;=
rev=3Db8b90dba56eb8c75050a712188d662fd51c953df \
> +    git://github.com/KhronosGroup/glslang.git;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=3D3=
8f6708b6b6f213010c51ffa8f577a7751e12ce7 \
> +    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-headers/=
src;rev=3D97e96f9e9defeb4bba3cfbd034dec516671dd7a3 \
> +    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/src;=
rev=3D9c6d565f72ba6929c239c3e20f90b6375acad3bd \
> +    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/vu=
lkan-validationlayers/src;rev=3D68e4cdd8269c2af39aa16793c9089d1893eae972 \
>      git://github.com/google/amber.git;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=3D57ba1ca211b6=
f4890c013dcf42cb16069ae916dd \
>      git://github.com/open-source-parsers/jsoncpp.git;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/jsoncpp/src;r=
ev=3D9059f5cad030ba11d37818847443a53918c327b1 \
> -    git://github.com/Igalia/vk_video_samples.git;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/nvidia-video-samp=
les/src;rev=3D45fe88b456c683120138f052ea81f0a958ff3ec4 \
> -    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-=
video-samples/src;rev=3Da22e0084e6f38a16dc0dcebb4c19a14651a6665b \
> +    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-=
video-samples/src;rev=3D56a40ba4199e5500b2a7540c15dc139fc4b19595 \
>      git://github.com/Igalia/video_generator.git;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/video_generator/sr=
c;rev=3D426300e12a5cc5d4676807039a1be237a2b68187 \
>  "
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.3.bb b/m=
eta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
> similarity index 92%
> rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.3.bb
> rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
> index ca653aad132b..459e1721c3d1 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.3.bb
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Vulkan CTS"
>
>  require khronos-cts.inc
>
> -SRCREV_vk-gl-cts =3D "f36967dd19034bdfe30e5cb21544079078c154d1"
> +SRCREV_vk-gl-cts =3D "03c0746a55b78eab63c664a11948b52419e1f309"
>
>  require vulkan-cts-sources.inc
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120493): https://lists.openembedded.org/g/openembedde=
d-devel/message/120493
> Mute This Topic: https://lists.openembedded.org/mt/115704103/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

