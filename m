Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61986C05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 13:36:02 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.23094.1675258558287170734
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Feb 2023 05:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O1DEUaDs;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id d188so15722617oia.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 05:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yXXNOuzmKekRzg8okq/Nza7/z3fv06ZPDbBmZAlJveY=;
        b=O1DEUaDsoQil8MTV5T2VsTqCrIluo3VMEh1qidnZ/V93xQ81husvksmr0CFVUuh7lM
         RoBqMRyTAM9qmY1ii1WFxrigi/lOIFs1xphM8/RaG6N4mPvPHq/6BZlTuhRJg28ReIfB
         DaoeVsdnKCxebButNgk11qXMd097b3B71owXOWiWJr2mnnd4NRpzTc7Yfs8E3DfTj1y3
         xGzVBOCReu1waicEHP003g+K6+CDGaBWDBETTkYbP8UEEPv4VmDNSn5u05XfV9SZ92pr
         tQaZXp/TaSECY4z8hCgljW7noJTxUtnpoQTfomIRK6qehEHUR+IkZH8/IvSCC2eblZDt
         VEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yXXNOuzmKekRzg8okq/Nza7/z3fv06ZPDbBmZAlJveY=;
        b=0yhcwcWNFs6gJTDkld8g4hPrFR/hhDDOQXhJBjq9oMGzoXu6ZUGtVhtMgWLDeo7PRd
         m4+FT6QxeQS9Pb41/oYEHoc7ksBvRaYwbINXew7nZztVsbmvh3NHqBu1nuQtEpsUTwpM
         e7VfeU/q9F1X/OkilIQ7kYwQZ5aBkwJVm6f5ZpA2S2yVP9Rt0SlOVFoxEM07zGzX4qZK
         xviSFTee/R8YcPwApOluTdfidbFaRWFkpbVRIi2sk2TIRV17PcJdoX7+A1Qu2VvUxbX+
         20exRaZE/Yr+gC0DV3VrjGEXTsGIbJ8ByW1WG0sEnZ9uA1vM9p/jnCHI16HIexK+EgA2
         L5Ew==
X-Gm-Message-State: AO0yUKXl2SDrBy3F8flu2AzN3sOJaLYZm4UDNGauggDEO/SHV1LjMvtt
	b+uvxbJowMFN8cUORHwIuiY=
X-Google-Smtp-Source: AK7set8bPvXj2xLwkMO1WBZXvmNmxIs1J2DUH9CQVPOf/ELtmunmHMLlw/i6c2kfDWJbuFbd4GF8/w==
X-Received: by 2002:aca:c044:0:b0:364:7d13:acf with SMTP id q65-20020acac044000000b003647d130acfmr973297oif.13.1675258557552;
        Wed, 01 Feb 2023 05:35:57 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:47a4:b49a:4424:1351? ([2600:1700:9190:ba10:47a4:b49a:4424:1351])
        by smtp.gmail.com with ESMTPSA id m24-20020a05680806d800b00377fae9d36csm5569255oih.52.2023.02.01.05.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 05:35:56 -0800 (PST)
Message-ID: <06197dd2-46e8-ffba-c703-681cee51b14c@gmail.com>
Date: Wed, 1 Feb 2023 08:35:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-python][kirkstone][PATCH 3/6] python3-pillow: upgrade
 9.2.0 -> 9.3.0
Content-Language: en-US
To: Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
 <20230131230851.2785067-3-Randy.MacLeod@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230131230851.2785067-3-Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 13:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100904

Hello Randy,

On 1/31/23 6:08 PM, Randy MacLeod wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =========
>
>      Limit SAMPLESPERPIXEL to avoid runtime DOS #6700 [wiredfool]
>      Initialize libtiff buffer when saving #6699 [radarhere]
>      Inline fname2char to fix memory leak #6329 [nulano]
>      Fix memory leaks related to text features #6330 [nulano]
>      Use double quotes for version check on old CPython on Windows #6695 [hugovk]
>      Remove backup implementation of Round for Windows platforms #6693 [cgohlke]
>      Fixed set_variation_by_name offset #6445 [radarhere]
>      Fix malloc in _imagingft.c:font_setvaraxes #6690 [cgohlke]
>      Release Python GIL when converting images using matrix operations #6418 [hmaarrfk]
>      Added ExifTags enums #6630 [radarhere]
>      Do not modify previous frame when calculating delta in PNG #6683 [radarhere]
>      Added support for reading BMP images with RLE4 compression #6674 [npjg, radarhere]
>      Decode JPEG compressed BLP1 data in original mode #6678 [radarhere]
>      Added GPS TIFF tag info #6661 [radarhere]
>      Added conversion between RGB/RGBA/RGBX and LAB #6647 [radarhere]
>      Do not attempt normalization if mode is already normal #6644 [radarhere]
>      Fixed seeking to an L frame in a GIF #6576 [radarhere]
>      Consider all frames when selecting mode for PNG save_all #6610 [radarhere]
>      Don't reassign crc on ChunkStream close #6627 [wiredfool, radarhere]
>      Raise a warning if NumPy failed to raise an error during conversion #6594 [radarhere]
>      Show all frames in ImageShow #6611 [radarhere]
>      Allow FLI palette chunk to not be first #6626 [radarhere]
>      If first GIF frame has transparency for RGB_ALWAYS loading strategy, use RGBA mode #6592 [radarhere]
>      Round box position to integer when pasting embedded color #6517 [radarhere, nulano]
>      Removed EXIF prefix when saving WebP #6582 [radarhere]
>      Pad IM palette to 768 bytes when saving #6579 [radarhere]
>      Added DDS BC6H reading #6449 [ShadelessFox, REDxEYE, radarhere]
>      Added support for opening WhiteIsZero 16-bit integer TIFF images #6642 [JayWiz, radarhere]
>      Raise an error when allocating translucent color to RGB palette #6654 [jsbueno, radarhere]
>      Added reading of TIFF child images #6569 [radarhere]
>      Improved ImageOps palette handling #6596 [PososikTeam, radarhere]
>      Defer parsing of palette into colors #6567 [radarhere]
>      Apply transparency to P images in ImageTk.PhotoImage #6559 [radarhere]
>      Use rounding in ImageOps contain() and pad() #6522 [bibinhashley, radarhere]
>      Fixed GIF remapping to palette with duplicate entries #6548 [radarhere]
>      Allow remap_palette() to return an image with less than 256 palette entries #6543 [radarhere]
>      Corrected BMP and TGA palette size when saving #6500 [radarhere]
>      Do not call load() before draft() in Image.thumbnail #6539 [radarhere]
>      Copy palette when converting from P to PA #6497 [radarhere]
>      Allow RGB and RGBA values for PA image putpixel #6504 [radarhere]
>      Removed support for tkinter in PyPy before Python 3.6 #6551 [nulano]
>      Do not use CCITTFaxDecode filter if libtiff is not available #6518 [radarhere]
>      Fallback to not using mmap if buffer is not large enough #6510 [radarhere]
>      Fixed writing bytes as ASCII tag #6493 [radarhere]
>      Open 1 bit EPS in mode 1 #6499 [radarhere]
>      Removed support for tkinter before Python 1.5.2 #6549 [radarhere]
>      Allow default ImageDraw font to be set #6484 [radarhere, hugovk]
>      Save 1 mode PDF using CCITTFaxDecode filter #6470 [radarhere]
>      Added support for RGBA PSD images #6481 [radarhere]
>      Parse orientation from XMP tag contents #6463 [bigcat88, radarhere]
>      Added support for reading ATI1/ATI2 (BC4/BC5) DDS images #6457 [REDxEYE, radarhere]
>      Do not clear GIF tile when checking number of frames #6455 [radarhere]
>      Support saving multiple MPO frames #6444 [radarhere]
>      Do not double quote Pillow version for setuptools >= 60 #6450 [radarhere]
>      Added ABGR BMP mask mode #6436 [radarhere]
>      Fixed PSDraw rectangle #6429 [radarhere]
>      Raise ValueError if PNG sRGB chunk is truncated #6431 [radarhere]
>      Handle missing Python executable in ImageShow on macOS #6416 [bryant1410, radarhere]
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Whats missing here are the dependency needs for kirkstone:
harfbuzz to 4.4.1
libtiff to 4.4.0

neither version exits in kirkstone.

and it appears to be adding a lot of new features.  Per our stable 
branch process, this update does not qualify to be included.

BR,
Armin
> ---
>   .../{python3-pillow_9.2.0.bb => python3-pillow_9.3.0.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pillow_9.2.0.bb => python3-pillow_9.3.0.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
> index 454d61a48..11f545160 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "https://pillow.readthedocs.io"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849"
>   
> -SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=9.2.x;protocol=https \
> +SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
>              file://0001-support-cross-compiling.patch \
>              file://0001-explicitly-set-compile-options.patch \
>              "
> @@ -39,4 +39,4 @@ RPROVIDES:${PN} += "python3-imaging"
>   
>   BBCLASSEXTEND = "native"
>   
> -SRCREV = "58acec3312fb8671c9d84829197e1c8150085589"
> +SRCREV = "d594f4cb8dc47fb0c69ae58d9fff86faae4515bd"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100894): https://lists.openembedded.org/g/openembedded-devel/message/100894
> Mute This Topic: https://lists.openembedded.org/mt/96664649/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


