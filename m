Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAA6C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 01:44:47 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.1706.1654134285851531402
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 18:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FLEL+bdW;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id e66so3454080pgc.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 18:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jS3izeiWKed9fJC82eJ4fjJS8P2ksJJPuyUnseyb4LY=;
        b=FLEL+bdWTP9bOegv64HFh0uNtF9jZ7mIaPQRi8OdQ3lxKA1b8J3Guy1sgF3yHMa0S5
         rUGsQ1n74SieaLQB2fFp8zh8EFIBDydKunXO4fi2bn/LkxyMlMPgoyflgqBvrCdVX14c
         bvSWVhBE+RMSaEiJ1HfHab+yRlm9jBJ8ijQQ6jSD9f2Jot1+lP3wqQZAOSqvwvn13BXG
         6d5qSLUeHCsF77hirb3d7fbNonyJ6EXIOOssYZo492e/+iEkw9vq1zUY7F0siXHYlIsJ
         ILamLtbLem/xQXseGMWy8nbHRdVnOwotGRthminqvN9l5lg03rtunzR8w6Bgcf3xRFLK
         oD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jS3izeiWKed9fJC82eJ4fjJS8P2ksJJPuyUnseyb4LY=;
        b=BZv/+TM6ktqIC1GFHXxdGU6+vKU1dlvEakczwPwUEJtjR74Iq8l1feMFFNNyyEZNNx
         Nhz37u50ugnWppUYUVCjOvaAwaUEWZ1TIA6S5dlM9U+HR2RK0R3Vfg1ljsWSZAFu68s0
         LerjaYC8Fq+yZl7K9RqrtM2nH4TgQedKg2gijVop5oXlk26QZnew62vwPdcIMozOxX4L
         geo0RdWeV8RdpOqOLErFOslwj1ZJNiGZfEREgltu7iCzj4YvlPm2/aYyMLC602lKkkHC
         pZP/A7t8TlVRDvTs+3zPCt4vBAJEu8ja1fOEKaM+0lg/lYES8OkDUP42WEiPJh4gCcA7
         jFWg==
X-Gm-Message-State: AOAM5301a9dHfcypWT9G+Qer4BsXLv1ARA9kA5j+PLLxqNxPEglr7iAb
	bPV0MDMv7YOUGGoniPVOb1o=
X-Google-Smtp-Source: 
 ABdhPJyhwsex4xfiVJEIZjecjaabt5AhIHTL85nupY45I/QZgpSfz0fS/KSTiPs0pv4Kq2QB47dfLQ==
X-Received: by 2002:a62:6411:0:b0:50a:81df:bfa6 with SMTP id
 y17-20020a626411000000b0050a81dfbfa6mr2546625pfb.26.1654134285333;
        Wed, 01 Jun 2022 18:44:45 -0700 (PDT)
Received: from ?IPV6:2601:202:4180:a5c0:e8e8:b71d:2c05:ffc8?
 ([2601:202:4180:a5c0:e8e8:b71d:2c05:ffc8])
        by smtp.gmail.com with ESMTPSA id
 x3-20020aa793a3000000b0051b560b0a98sm2061073pff.159.2022.06.01.18.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 18:44:44 -0700 (PDT)
Message-ID: <6bdffec7-eb98-b2ba-a89a-a13cf4ac5a85@gmail.com>
Date: Wed, 1 Jun 2022 18:44:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-python][dunfell][PATCH 1/9] python3-pillow: Upgrade 6.2.1
 -> 7.2.0
Content-Language: en-US
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, Leon Anavi <leon.anavi@konsulko.com>,
 Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
References: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jun 2022 01:44:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97378



On 6/1/22 05:25, Ranjitsinh Rathod wrote:
> From: Leon Anavi <leon.anavi@konsulko.com>
>
> Upgrade to release 7.2.0:
>
> - Do not convert I;16 images when showing PNGs
> - Fixed ICNS file pointer saving
> - Fixed loading non-RGBA mode APNGs with dispose background
> - Deprecated _showxv
> - Deprecate Image.show(command="...")
> - Updated JPEG magic number
> - Change STRIPBYTECOUNTS to LONG if necessary when saving
> - Write JFIF header when saving JPEG
> - Replaced tiff_jpeg with jpeg compression when saving TIFF images
> - Writing TIFF tags: improved BYTE, added UNDEFINED
> - Consider transparency when pasting text on an RGBA image
> - Added method argument to single frame WebP saving
> - Use ImageFileDirectory_v2 in Image.Exif
> - Corrected reading EXIF metadata without prefix
> - Fixed drawing a jointed line with a sequence of numeric values
> - Added support for 1-D NumPy arrays
> - Parse orientation from XMP tags
> - Speed up text layout by not rendering glyphs
> - Fixed ZeroDivisionError in Image.thumbnail
> - Replaced TiffImagePlugin DEBUG with logging
> - Fix repeatedly loading .gbr
> - JPEG: Truncate icclist instead of setting to None
> - Fixes default offset for Exif
> - Fixed bug when unpickling TIFF images
> - Fix pickling WebP
> - Replace IOError and WindowsError aliases with OSError

This appears to be more than a bug fix only update. This series of 
changes are not suited for a stable release.

Thanks for thinking about this LTS release.

-armin
>
> License-Update: Word wrap and updated copyright year.
>
> Conflicts:
> 	meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
> Conflicts due to extra parameter protocol=https in SRC_URI
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 995fc86b298d5b09fdd6288b9e9f4211feea3b18)
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
> ---
>   .../0001-explicitly-set-compile-options.patch | 19 +++++++++++--------
>   ...illow_6.2.1.bb => python3-pillow_7.2.0.bb} |  6 +++---
>   2 files changed, 14 insertions(+), 11 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pillow_6.2.1.bb => python3-pillow_7.2.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
> index 35aee42145..005fea5c66 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
> +++ b/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
> @@ -1,6 +1,6 @@
> -From 862a981ce462cd83a99e3db9faeeda1f8c64983f Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Mon, 18 Mar 2019 23:23:55 -0400
> +From 27bfa4028453dc79a72569823e97da8fd1994ffc Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Tue, 1 Sep 2020 11:53:53 +0000
>   Subject: [PATCH] explicitly set compile options
>   
>   OE does not support to install egg package, so
> @@ -10,19 +10,19 @@ explicitly set build_ext options for oe-core's
>   Upstream-Status: Inappropriate [oe specific]
>   
>   Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>   ---
>    setup.cfg | 12 ++++++++++++
>    1 file changed, 12 insertions(+)
>   
>   diff --git a/setup.cfg b/setup.cfg
> -index 1c6ebc84..1ccc3d69 100644
> +index 19979cf7..ed27dfe1 100644
>   --- a/setup.cfg
>   +++ b/setup.cfg
> -@@ -13,3 +13,15 @@ multi_line_output = 3
> -
> +@@ -11,3 +11,15 @@ multi_line_output = 3
>    [tool:pytest]
> - addopts = -rs
> + addopts = -ra --color=yes
> + testpaths = Tests
>   +
>   +[build_ext]
>   +disable-platform-guessing = 1
> @@ -35,3 +35,6 @@ index 1c6ebc84..1ccc3d69 100644
>   +disable-webp = 1
>   +disable-webpmux = 1
>   +disable-imagequant = 1
> +--
> +2.17.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb b/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
> index 80b7e941ae..28aaff8060 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
> @@ -3,13 +3,13 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
>   Contributors."
>   HOMEPAGE = "https://pillow.readthedocs.io"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=55c0f320370091249c1755c0d2b48e89"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ea2dc3f5611e69058503d4b940049d03"
>   
> -SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=6.2.x;protocol=https \
> +SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=7.2.x;protocol=https \
>              file://0001-support-cross-compiling.patch \
>              file://0001-explicitly-set-compile-options.patch \
>   "
> -SRCREV ?= "6e0f07bbe38def22d36ee176b2efd9ea74b453a6"
> +SRCREV ?= "2bd74943fb9f320def6c066e732b701d1c15f677"
>   
>   
>   inherit setuptools3


