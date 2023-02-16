Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB0DC61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:28:09 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.8629.1676550482045557388
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QwWgLaRK;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id c2so1846534qtw.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 04:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jXbv3FJUCEhdfFkBpR33ml3b6xg+Ur2YrLUhNC8UeA=;
        b=QwWgLaRKC2BUYBFeeEOozZxjnQhOjz8r/ekvxoyxSGWuIMClwCUxZGesPXa9q/zwvs
         hvRlmJ5ODaFZ0kfSkniS5QGPmJribJSZMNnJnBaaoTr++yu9/yP/i4oruYtJu+OPcM7n
         ahrRclTm873ETcMWp+K29eGZTPonhcysg86St6XbRnVrnnSHBEliaJpS9SibzEzO1vn7
         LFcWGj2Y7CzVWQGMrF0au43OO31YYKH/9Fx4mA5Xeqo8UwuzQiCw4CYVPBKBAbevLECn
         wc6zXq0U2QAPC+IS7ltQQQM2HkKcCiIT+qh/K8cdFiif8UKqAH4Yt6YWAjNlJt3BydKX
         agqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jXbv3FJUCEhdfFkBpR33ml3b6xg+Ur2YrLUhNC8UeA=;
        b=wsocsj4SASmPZYyH76LQgWzvfplcslX42/mop5JGhbYdwzgtxrj9SaEVJsdw+kux0K
         uYBDX29Txv7J3vWpo8UwGbJL+rrkuuBHzmBfm6+4uefb8e1qhrWQ/qChjMVE3F9qdLnY
         Iu39lb/6fDSsyKxL3ZUgleX8sP3P15JpzBpINtw8dVhXkWT4pqtAi1l5oomDf5xoAM5q
         5DEG0ACAwNfZkDqWLn9/5MAyylPprV7LIkEZHiXdIlqg283QI5ylBvzLjKTpWxYE+Pp4
         p3duHD+vM1i3GgC2JdxJy0TPst2oy2ccNJ0qZvWCxP18bg2juyiJ8wV/+6Uw5gB+A86L
         IAMA==
X-Gm-Message-State: AO0yUKX4gN6a2vtWOTpoc3ihFBfSmC0oaPWbjGACLhJC+9/top4O0PnJ
	oafUk2rfA2W5tVsQ/lK2W4G0QDqIEcw=
X-Google-Smtp-Source: AK7set99BAyLjx8Hzhth7vU4M4DGrw+Fy0XGZH1Kfj5nhE6W6be6gX3E7EWbq4eT0PWVSg+ef69fyQ==
X-Received: by 2002:ac8:5c96:0:b0:3b9:bc8c:c206 with SMTP id r22-20020ac85c96000000b003b9bc8cc206mr3695021qta.17.1676550480940;
        Thu, 16 Feb 2023 04:28:00 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:2ead:d6b6:b6e2:9e85])
        by smtp.gmail.com with ESMTPSA id t127-20020a379185000000b0073b4d9e2e8dsm1102362qkd.43.2023.02.16.04.28.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:28:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 02/15] python3-pillow: upgrade 9.2.0 -> 9.3.0
Date: Thu, 16 Feb 2023 07:27:12 -0500
Message-Id: <c1dcb34a717022d247685b2ec66492c41febe902.1676550369.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676550369.git.akuster808@gmail.com>
References: <cover.1676550369.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 12:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101104

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========

    Limit SAMPLESPERPIXEL to avoid runtime DOS #6700 [wiredfool]
    Initialize libtiff buffer when saving #6699 [radarhere]
    Inline fname2char to fix memory leak #6329 [nulano]
    Fix memory leaks related to text features #6330 [nulano]
    Use double quotes for version check on old CPython on Windows #6695 [hugovk]
    Remove backup implementation of Round for Windows platforms #6693 [cgohlke]
    Fixed set_variation_by_name offset #6445 [radarhere]
    Fix malloc in _imagingft.c:font_setvaraxes #6690 [cgohlke]
    Release Python GIL when converting images using matrix operations #6418 [hmaarrfk]
    Added ExifTags enums #6630 [radarhere]
    Do not modify previous frame when calculating delta in PNG #6683 [radarhere]
    Added support for reading BMP images with RLE4 compression #6674 [npjg, radarhere]
    Decode JPEG compressed BLP1 data in original mode #6678 [radarhere]
    Added GPS TIFF tag info #6661 [radarhere]
    Added conversion between RGB/RGBA/RGBX and LAB #6647 [radarhere]
    Do not attempt normalization if mode is already normal #6644 [radarhere]
    Fixed seeking to an L frame in a GIF #6576 [radarhere]
    Consider all frames when selecting mode for PNG save_all #6610 [radarhere]
    Don't reassign crc on ChunkStream close #6627 [wiredfool, radarhere]
    Raise a warning if NumPy failed to raise an error during conversion #6594 [radarhere]
    Show all frames in ImageShow #6611 [radarhere]
    Allow FLI palette chunk to not be first #6626 [radarhere]
    If first GIF frame has transparency for RGB_ALWAYS loading strategy, use RGBA mode #6592 [radarhere]
    Round box position to integer when pasting embedded color #6517 [radarhere, nulano]
    Removed EXIF prefix when saving WebP #6582 [radarhere]
    Pad IM palette to 768 bytes when saving #6579 [radarhere]
    Added DDS BC6H reading #6449 [ShadelessFox, REDxEYE, radarhere]
    Added support for opening WhiteIsZero 16-bit integer TIFF images #6642 [JayWiz, radarhere]
    Raise an error when allocating translucent color to RGB palette #6654 [jsbueno, radarhere]
    Added reading of TIFF child images #6569 [radarhere]
    Improved ImageOps palette handling #6596 [PososikTeam, radarhere]
    Defer parsing of palette into colors #6567 [radarhere]
    Apply transparency to P images in ImageTk.PhotoImage #6559 [radarhere]
    Use rounding in ImageOps contain() and pad() #6522 [bibinhashley, radarhere]
    Fixed GIF remapping to palette with duplicate entries #6548 [radarhere]
    Allow remap_palette() to return an image with less than 256 palette entries #6543 [radarhere]
    Corrected BMP and TGA palette size when saving #6500 [radarhere]
    Do not call load() before draft() in Image.thumbnail #6539 [radarhere]
    Copy palette when converting from P to PA #6497 [radarhere]
    Allow RGB and RGBA values for PA image putpixel #6504 [radarhere]
    Removed support for tkinter in PyPy before Python 3.6 #6551 [nulano]
    Do not use CCITTFaxDecode filter if libtiff is not available #6518 [radarhere]
    Fallback to not using mmap if buffer is not large enough #6510 [radarhere]
    Fixed writing bytes as ASCII tag #6493 [radarhere]
    Open 1 bit EPS in mode 1 #6499 [radarhere]
    Removed support for tkinter before Python 1.5.2 #6549 [radarhere]
    Allow default ImageDraw font to be set #6484 [radarhere, hugovk]
    Save 1 mode PDF using CCITTFaxDecode filter #6470 [radarhere]
    Added support for RGBA PSD images #6481 [radarhere]
    Parse orientation from XMP tag contents #6463 [bigcat88, radarhere]
    Added support for reading ATI1/ATI2 (BC4/BC5) DDS images #6457 [REDxEYE, radarhere]
    Do not clear GIF tile when checking number of frames #6455 [radarhere]
    Support saving multiple MPO frames #6444 [radarhere]
    Do not double quote Pillow version for setuptools >= 60 #6450 [radarhere]
    Added ABGR BMP mask mode #6436 [radarhere]
    Fixed PSDraw rectangle #6429 [radarhere]
    Raise ValueError if PNG sRGB chunk is truncated #6431 [radarhere]
    Handle missing Python executable in ImageShow on macOS #6416 [bryant1410, radarhere]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4e075c7dc81c4d2824094f9d3523cf16719be9a7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-pillow_9.2.0.bb => python3-pillow_9.3.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_9.2.0.bb => python3-pillow_9.3.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
index 454d61a48e..11f5451609 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=9.2.x;protocol=https \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
            "
@@ -39,4 +39,4 @@ RPROVIDES:${PN} += "python3-imaging"
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "58acec3312fb8671c9d84829197e1c8150085589"
+SRCREV = "d594f4cb8dc47fb0c69ae58d9fff86faae4515bd"
-- 
2.25.1


