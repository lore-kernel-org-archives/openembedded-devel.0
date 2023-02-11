Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FD6C61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 15:51:15 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.11665.1676130673791780344
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 07:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=egF3V/gT;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id i12so5593788qvs.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 07:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2jXbv3FJUCEhdfFkBpR33ml3b6xg+Ur2YrLUhNC8UeA=;
        b=egF3V/gT+fh/kc2K1fkbedagOu+8ywKSHh9Q90Z1/O9AYSuvXxM9ESxEVQDRwmWSYq
         YPvGVtcqJwQfgeO8fZ66n/0G4BrRr8lPBN55VScIr2Vf9h+nY+efkHF3PRCb62arzGcG
         9nACL5Hwe3ndpLhRX9818+89BWDWWY373m70UL3iOjcwgcfg92L9YP1r9hpQx5qbHgv/
         HmpWxS1PkYePd8WUejXq2ZIvJ1SRuFPJDMPouHlUBHjV/qI1OK1nKq8yLG1w23cHxFJ6
         vOGs7bssbZfCKWwxmcTPfvId+RaPbB9SoDmbXazt3+043viWS6nvK9spYf0dQF6M9964
         LLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jXbv3FJUCEhdfFkBpR33ml3b6xg+Ur2YrLUhNC8UeA=;
        b=JsNQ/TcLAIS3+hh45W3W4JqNQBgv/TlBvPqePdgY5j5j0gnNKtqPG2KI7GmyX5O8c4
         LoiXzHreZ0OvYXydf1jnrE7/Zs3UBaJoWBqgrOnIop4XHmfcwTjYstVCL3rZK/GSgg6h
         Zeudjhib5VVDvXG4CwrVs2QS3htySxbFOyKxswg40CFBhuzwhYyYdiL60vxd3C2hpLhZ
         hRbPdPAjrlNG7sBG695PQrIp0EhsYryFnr/AFY8lL4m6n2IM2kfATanNPmO32Dwc7Niu
         W5HGOy0cBV7O2LSt7eKAlEEghSDKqjXP/TucCWVDbh1Gkr8vCV1SG5e0OewjIrHXTxET
         UmYA==
X-Gm-Message-State: AO0yUKWnFC2gGnQd3PmkfeXBrZ2jkr/z2v/a08cG5V6VHMFo061J25aN
	T2lspWS31x2kiy06V47Yc5rAiU7UuP8=
X-Google-Smtp-Source: AK7set+cYKCZpV0031dBsHobbO1XyrEucCg3jklGsqam13GwkEiKC24Y+r9MDXvN6xomYAeyZl7d3g==
X-Received: by 2002:ad4:5dcb:0:b0:56b:eda2:a6bc with SMTP id m11-20020ad45dcb000000b0056beda2a6bcmr32926132qvh.11.1676130672617;
        Sat, 11 Feb 2023 07:51:12 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6c32:d739:9179:1de7])
        by smtp.gmail.com with ESMTPSA id l67-20020a37bb46000000b0071d0f1d01easm5855481qkf.57.2023.02.11.07.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 07:51:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 1/4] python3-pillow: upgrade 9.2.0 -> 9.3.0
Date: Sat, 11 Feb 2023 10:51:08 -0500
Message-Id: <20230211155111.3984602-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 15:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101029

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


