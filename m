Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E08C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:55:38 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.15.1646409337776574886
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n+gAZ/OX;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id z66so6712689qke.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KbZyYLdv2jeidlI2qNHcgukpqQBF/yB85HDXg/oX238=;
        b=n+gAZ/OXCWP5jzDMV0+1hm7W4FUFd/4xg+mNvK/MSm/Wkw8GOC0yZYNzotdkuA4lkh
         cIOzRII3ynjDawWcdjUmQlB1kJJ4ifZnuNFKZjpnb7/uGW9lOai6YbQU8yPoRT172RAl
         2a8DfRaIn9qakg4Tv1OaQEq9SptpNTqOaJv6G8knTbkhanHq3zp/TMyiW6BG9Rs2Igm4
         7w5h+6Hzib/lAmAKvaYWcZ+DDLuqxRZ7CSRFhfXDEerr+Uwfi3oCD3GcEQBc1Ebxvz1N
         aUp/jZgPgq8388SlHHesjHXO2iwBEJam46HN6LQEUdQoczmFFshVeuQ32saQwtjm+HJy
         4fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KbZyYLdv2jeidlI2qNHcgukpqQBF/yB85HDXg/oX238=;
        b=DP45bJnd1NldLPvfNU3Htii9NgzG/hp1WS/F7ULizl2fuuMvX2DDZ3j/9l79egx/D1
         oEEifuLEQdNmY5FQD53nvnmCxMvXd9TR93WvoQesZPMYTjOhhzxaEq8x7EuqX2HWy6aZ
         cmQg8l+3dE73+UMPBQOYuQDA+KFdPZdIAU2ErOKV2fATDu2N5t2G7NNWBW+9Ranj7E9F
         BjuSUSuvVDR5VbO2HLKDGOpSnUQjLGTv5GaboSQmuX2ZXi8JVXQ8K4FHXFehUkm2rgKh
         P2V5I+rfcK2yZq7mPX8zVES2YaN3ZjiQqXr4WNkbMRyo/+1oKFBvEKVH8W+mjFBiSO97
         nB4g==
X-Gm-Message-State: AOAM530E4Tazc2v9BMiUU7wHW7Z6bgc/d2hevm16dbUMiR2rhzc6DhPi
	A5wuibn1bqFXU4FEw/UNDcPTNLIBQqqOg84so9XAy5rjqnI=
X-Google-Smtp-Source: 
 ABdhPJyL47sixTcNdCJ1e6HIm9Ru3Ayk9UP0jF+xhQ3O6aMTQrS1W/Gm//TMgMxZOZZE1tBFNHAz+j3AszH8lXuGfyg=
X-Received: by 2002:a05:620a:372c:b0:67a:de08:875e with SMTP id
 de44-20020a05620a372c00b0067ade08875emr1400561qkb.149.1646409336742; Fri, 04
 Mar 2022 07:55:36 -0800 (PST)
MIME-Version: 1.0
References: <20220304152827.31576-1-jsbronder@cold-front.org>
In-Reply-To: <20220304152827.31576-1-jsbronder@cold-front.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Mar 2022 07:55:10 -0800
Message-ID: 
 <CAMKF1speZYSTs-dHwfd6T3OPUPy3U5UTHym7AyN8wZCMi0LxPg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-crc32c: set target platform via
 setup.cfg
To: Justin Bronder <jsbronder@cold-front.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 15:55:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95790

On Fri, Mar 4, 2022 at 7:28 AM Justin Bronder <jsbronder@cold-front.org> wrote:
>
> Looks like we're not the first to need to specify the target platform
> when building this package.  According to upstream, we can just update
> setup.cfg instead of patching setup.py.
> https://github.com/ICRAR/crc32c/pull/10
>
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
>  ...p.py-Fix-determining-target-platform.patch | 34 -------------------
>  .../python/python3-crc32c_2.2.post0.bb        |  7 ++--
>  2 files changed, 5 insertions(+), 36 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-crc32c/0001-setup.py-Fix-determining-target-platform.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-crc32c/0001-setup.py-Fix-determining-target-platform.patch b/meta-python/recipes-devtools/python/python3-crc32c/0001-setup.py-Fix-determining-target-platform.patch
> deleted file mode 100644
> index b534c05e9a..0000000000
> --- a/meta-python/recipes-devtools/python/python3-crc32c/0001-setup.py-Fix-determining-target-platform.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 855428feb14c44762ea21a18b05638e3e6266ab5 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 3 Mar 2022 23:50:30 -0800
> -Subject: [PATCH] setup.py: Fix determining target platform
> -
> -Do not poke at the build machine to determine target platform or architecture
> -pass it from environment instead for cross compiling to work
> -
> -Upstream-Status: Inappropriate [OE-Specific]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - setup.py | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -20,6 +20,7 @@
> - #    MA 02111-1307  USA
> - #
> - import glob
> -+import os
> - import platform
> -
> - import distutils.ccompiler
> -@@ -58,7 +59,8 @@ class _build_ext(build_ext):
> -
> -     def run(self):
> -         assert(len(self.distribution.ext_modules) == 1)
> --        platform = self.platform.lower()
> -+        platform = os.environ.get('PLATFORM', 'True')
> -+
> -         is_intel = platform in ['x86_64', 'amd64', 'i386', 'i686']
> -         is_arm = platform in ['aarch64_be', 'aarch64', 'armv8b', 'armv8l']
> -         distutils.log.info("platform: %s, is_intel: %d, is_arm: %d", platform, is_intel, is_arm)
> diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
> index 78e14e1d2f..4f6a3aba99 100644
> --- a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
> +++ b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
> @@ -9,11 +9,14 @@ LIC_FILES_CHKSUM = " \
>      file://crc32c_adler.c;startline=9;endline=24;md5=c60e6e55d0e5d95effa6fad27db0711a \
>  "
>
> -SRC_URI += "file://0001-setup.py-Fix-determining-target-platform.patch"
>  SRC_URI[sha256sum] = "3d058e7a5e37e4985d1a7ad4cb702bca56b490daa658d4851377d13ead8b435e"
>
>  inherit pypi setuptools3
>
> -export PLATFORM = "${TARGET_ARCH}"
> +do_compile:prepend() {
> +    if ! grep 'platform =' setup.cfg; then
> +        printf "[build_ext]\nplatform = ${TARGET_ARCH}" >> setup.cfg
> +    fi
> +}

I think this is better since it avoid maintaining a patch, I will take
this one if this passes the CI

>
>  RDEPENDS:${PN} += "python3-core"
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95788): https://lists.openembedded.org/g/openembedded-devel/message/95788
> Mute This Topic: https://lists.openembedded.org/mt/89551016/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

