Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B20EC83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 16:22:49 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.18097.1752250960598877145
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 09:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WSmy/bVB;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-40af40aeef6so767679b6e.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 09:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752250960; x=1752855760; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+aoy7RNWyeh141W/ShSFNDeerPlSfJDgD0jUo7xH9uk=;
        b=WSmy/bVBOZ5wDraFlG3kcAjtnvpUEzHNc5YGA1KjBNZPwNc2IdLgY6gNf1/tkPxgV6
         Ry15jALncGACEwpjqxsQC9FIFqW96r1+oorQhg5lrZ0sfbNfTzR+TEc6z6nhotIAh1wk
         4IOdpTqrqqJq6YRoGB7PqK9qAUgoHlDjiUH8n99e1FTfCndzA3d8A1RAJ1vJeE9mrVjo
         k+RQKjZqLBKw6z/1qDqne7kTT9M0BJVFXPhEwOiJUfCkxEu2J+PD1iVivcCuX5RANXDX
         EC1kbFQOKksYtHOZ3VeS/Dp86oqUM8nbOzMwZmQd9DlhW7Nlkv2naEwC1mo+LLUevLm1
         Ih0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752250960; x=1752855760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+aoy7RNWyeh141W/ShSFNDeerPlSfJDgD0jUo7xH9uk=;
        b=Zu1amj/HoW38C7D9jYMpQSkyT1bkplqRpaUXudHSogGxIKJ+C2dyUsik8nUe6NpoI+
         Gk1PBuSnelug9VtXtzm5H/UHAMFNDjSnnU2DOxbondhyS73z1nUdnKpGQqLdxAfYggaP
         1WIsVmpE+T69odl8vesEYElKTXI7MCKhP9Vf9YCSluCfwmOZxLKAorhTfnXWYCn4R+04
         vVv5psPw2zqopclPhgNEEc+A986rZ3ZwiFJOfYrndeJ+Fmap0kxlwADbAQ0lb9ai1S3j
         yNFHebQB0SJfeRV1hX8RcTJH3JU7gBLUGaXvqJR1huT1dCZ49/HT5r7aDUMzgPUBthPm
         rZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+kzNLabFXv1cr18UixzRiebL4LBXfo1ojcnSXNV/RF4P0vXGq3xFxZ+U+HJiuEmHZdqHiR3F5M5wM0vFdwkoIjoI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzfnW/V/20J8TGgQAKIJp6TE/HzBFb9lD60BS0b6x5FqlSlkLPV
	EHHxDgKfkZ/3Ud8YlZ2Jh39Jn62TvjyyFNYA16lDsM967WcePwNZ8Vb+
X-Gm-Gg: ASbGncu/dUtJmqLtfCrlax5IJyHcxSU8N1xrmlQlhM5Iz/rfUCFIaZGE4SWOkCxYoJO
	kUpUEt/xaVxOg8yMxsQs7liKVNeJMlCceEOtJ4lcFe/nIzHe4e9k/soiWp1izOuk3Iu0BzIFEGw
	On8DELEOVD6e7LNtlqD5kgiQG8FKqEP3B6P88O8sNfHOBQ2vbSojhwagy8JBfoMdN/A+O7ZPIiG
	3T2fX+kPzGQsjeuVhaUikJgNO4822ASljcXuHiwXjDUuzegBZV8PGqAGX0Z+IbHlRfXWh8cG+6S
	0OdTRD0sYg38kvK93BqmHAfeWASSSuRSeG4Co7A/y7cjoqC/H2uvO37FxzsD1dC5vf5MPbN0WDG
	X61CWrWguUfqQvgCFJ0Tx/tzEtH9xPYj43zJqSCigbWDkWVju/PK7auIr7zVR0HUoOHEewbw4bw
	xFFLuA5w1sBg==
X-Google-Smtp-Source: AGHT+IEKwt28udBjK9WZpng8DCLXP2zygF1U62MQnKzgs1cWXp34sQ0QkUokpv3eIkf9oVQB6ktN+Q==
X-Received: by 2002:a05:6808:2124:b0:401:ea7b:e535 with SMTP id 5614622812f47-41511619958mr3121249b6e.22.1752250959623;
        Fri, 11 Jul 2025 09:22:39 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:f056:4b03:1ef9:9958? ([2601:646:8201:fd20:f056:4b03:1ef9:9958])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-613d9f00ceesm516869eaf.19.2025.07.11.09.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 09:22:38 -0700 (PDT)
Message-ID: <fbaa3ce9-c31f-4b0b-9e2e-5f04f7b1a56a@gmail.com>
Date: Fri, 11 Jul 2025 09:22:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2 10/10] vulkan-cts: upgrade 1.4.2.1 ->
 1.4.3.1
To: Moritz.Haase@bmw.de, openembedded-devel@lists.openembedded.org
References: <20250711131254.303582-2-Moritz.Haase@bmw.de>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250711131254.303582-2-Moritz.Haase@bmw.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 16:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118455



On 7/11/25 6:12 AM, Moritz Haase via lists.openembedded.org wrote:
> New version includes support to build against CMake 4+.
> 
> Release notes are available at [0].
> 
> The SRC_URI update helper script required adaptations, as it was broken by
> recent Poky changes. The SRC_URI entries were only updated manually back then
> via [1].
> 
> [0]: https://github.com/KhronosGroup/VK-GL-CTS/releases
> [1]: https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc?h=master-next&id=fc78d37ff0ce9e0d60455465851dbe4e86d7a8b3
> 
> Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> ---
>   ...LAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch | 29 -------------------
>   .../vk-gl-cts/files/generate-srcuri.py        |  8 +++--
>   .../vk-gl-cts/khronos-cts.inc                 |  1 -
>   .../vk-gl-cts/vulkan-cts-sources.inc          | 17 +++++------
>   ...n-cts_1.4.2.1.bb => vulkan-cts_1.4.3.1.bb} |  2 +-
>   5 files changed, 15 insertions(+), 42 deletions(-)
>   delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch


is the problem this patch addressed is fixed somehow as well ?

>   rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.2.1.bb => vulkan-cts_1.4.3.1.bb} (92%)
> 
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
> deleted file mode 100644
> index 9eef9a702e..0000000000
> --- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From ec12bb7bda60cdf2c848e13df67452a7d30a42be Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 3 Sep 2022 18:52:42 -0700
> -Subject: [PATCH] cmake: Define WAYLAND_SCANNER and WAYLAND_PROTOCOLS_DIR if
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
> - 				configure_file(${WAYLAND_XDG_SHELL_SRC_DIR}/xdg-shell.c ${DEQP_XDG_SHELL_GEN_OUTPUTS_DIR}/xdg-shell.c COPYONLY)
> - 				configure_file(${WAYLAND_XDG_SHELL_SRC_DIR}/xdg-shell.h ${DEQP_XDG_SHELL_GEN_OUTPUTS_DIR}/xdg-shell.h COPYONLY)
> - 			else ()
> --				pkg_get_variable(WAYLAND_PROTOCOLS_DIR wayland-protocols pkgdatadir)
> --
> -+				if (NOT WAYLAND_PROTOCOL_DIR)
> -+					pkg_get_variable(WAYLAND_PROTOCOLS_DIR wayland-protocols pkgdatadir)
> -+				endif()
> - 				if (NOT WAYLAND_SCANNER)
> - 					pkg_get_variable(WAYLAND_SCANNER wayland-scanner wayland_scanner)
> - 				endif()
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/generate-srcuri.py b/meta-oe/recipes-graphics/vk-gl-cts/files/generate-srcuri.py
> index c2756b592c..3f64e9dc4a 100755
> --- a/meta-oe/recipes-graphics/vk-gl-cts/files/generate-srcuri.py
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/files/generate-srcuri.py
> @@ -53,11 +53,15 @@ def convert_fetch(basedir):
>               # Ignore these as so far we can use the system copies
>               pass
>           elif isinstance(p, fetch.SourceFile):
> -            dest = "/".join(["git/external", p.baseDir, p.extractDir])
> +            dest = "/".join(
> +                ["${BB_GIT_DEFAULT_DESTSUFFIX}/external", p.baseDir, p.extractDir]
> +            )
>               url = f"{p.url};subdir={dest};sha256sum={p.checksum}"
>               lines.append(f"    {url} \\")
>           elif isinstance(p, fetch.GitRepo):
> -            dest = "/".join(["git/external", p.baseDir, p.extractDir])
> +            dest = "/".join(
> +                ["${BB_GIT_DEFAULT_DESTSUFFIX}/external", p.baseDir, p.extractDir]
> +            )
>               url = transform_git(p.httpsUrl, p.revision, dest)
>               lines.append(f"    {url} \\")
>           else:
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> index 1cc2da7a49..67a0dc564c 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> @@ -2,7 +2,6 @@ LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
>   SRC_URI = "git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=https;name=vk-gl-cts;nobranch=1 \
> -           file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch \
>              file://0001-use-library-sonames-for-linking.patch \
>              file://generate-srcuri.py \
>              "
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
> index 563da1007a..8d70bf08c3 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
> @@ -6,21 +6,20 @@
>   RECIPE_UPGRADE_EXTRA_TASKS += "do_refresh_srcuri"
>   
>   python __anonymous() {
> -    if d.getVar("PV") != "1.4.2.1":
> +    if d.getVar("PV") != "1.4.3.1":
>           bb.warn("-sources.inc out of date, run refresh_srcuri task")
>   }
>   
>   SRC_URI += " \
>       https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/external/renderdoc/src;sha256sum=e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e \
> -    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/src;rev=3364b982713a0440d1d342dd5eec65b122a61b71 \
> -    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=1b65bd602b23d401d1c4c86dfa90a36a52c66294 \
> -    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-headers/src;rev=767e901c986e9755a17e7939b3046fc2911a4bbd \
> -    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/src;rev=645c59c70e826d9738b6bb103316c03d887dfed3 \
> -    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-validationlayers/src;rev=6cf616f131e9870c499a50441bca2d07ccda9733 \
> -    git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=6fa5ac1fb3b01c93eef3caa2aeb8841565e38d90 \
> +    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/src;rev=f06e0f3d2e5acfe4b14e714e4103dd1ccdb237e5 \
> +    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=963588074b26326ff0426c8953c1235213309bdb \
> +    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-headers/src;rev=6d0784e9f1ab92c17eeea94821b2465c14a52be9 \
> +    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/src;rev=112aee75d162412a4623e7d22a3de52e0233cbf5 \
> +    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-validationlayers/src;rev=6ae58a2b17b2bcebdc5377995007391b85ffa10f \
> +    git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=57ba1ca211b6f4890c013dcf42cb16069ae916dd \
>       git://github.com/open-source-parsers/jsoncpp.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/jsoncpp/src;rev=9059f5cad030ba11d37818847443a53918c327b1 \
>       git://github.com/Igalia/vk_video_samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/nvidia-video-samples/src;rev=45fe88b456c683120138f052ea81f0a958ff3ec4 \
> -    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=0e87744edbb84c9c56c3fc8de9ea5150af5ee4ea \
> +    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=a22e0084e6f38a16dc0dcebb4c19a14651a6665b \
>       git://github.com/Igalia/video_generator.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/video_generator/src;rev=426300e12a5cc5d4676807039a1be237a2b68187 \
> -    file://0001-Fix-missing-include-cstdint-causing-build-failures.patch;patchdir=external/amber/src \
>   "
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.2.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.1.bb
> similarity index 92%
> rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.2.1.bb
> rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.1.bb
> index abbd026047..3f7a2480ef 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.2.1.bb
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.1.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "Vulkan CTS"
>   
>   require khronos-cts.inc
>   
> -SRCREV_vk-gl-cts = "644f10ca39dea3b7d9dbadaa75c56206b499a520"
> +SRCREV_vk-gl-cts = "1ef11bc7acde6b53a499de73db4cf78db9572710"
>   
>   require vulkan-cts-sources.inc
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118449): https://lists.openembedded.org/g/openembedded-devel/message/118449
> Mute This Topic: https://lists.openembedded.org/mt/114099888/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


