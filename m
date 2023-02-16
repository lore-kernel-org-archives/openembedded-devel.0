Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E4CC636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:28:09 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.8790.1676550482847010977
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X0Co/C/t;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id z5so1830288qtn.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 04:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TP9jAilICKS/Gtg2YRYoFUs6FszlcODKXAzYDS1PUGo=;
        b=X0Co/C/tKoGglCB5TKxW+73segI3U9mJEKEQzMwafdWj/7MUlmuJDKzsq3wlhkLqDs
         CvWwwW1GJv8a2pbYcKZdjqDJIwpl1+Gi9+yISW2UVzAh4h0bkkZXme/CkuHFym7s7oD2
         mRvHWv0zVAO/EYulihuXGK6gQeyyLU2kFZnvqzYgSr8YncTT894UZkdvk7aeey8eUfxE
         BM4GwEsm7kdRa3jqAyvoM1asNEK081rQcZAjz9dzdGktpheJBjwl23fPjEoGxXgkxaM3
         nqICv1X/Qvg6aWqdQs6WTA0T98DdxHE2IoT0g/rX1+kZ2zG2Yisfg72xgRecoe7NJTIG
         07Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TP9jAilICKS/Gtg2YRYoFUs6FszlcODKXAzYDS1PUGo=;
        b=lmyJoYpM5v1K2tsde5JAoAcm/xy5do1U9y32GFbvLbBp9yAYfCb9RVL5d8Sf7pKWAF
         lvu/ZToK4ncW+vsFNMTUr8/2vJUm9lNLQlPDIjwBayGGkohVEWHgjcgEoDIZ7RstFbOz
         9Y/K4Ttt2oU5PvnP7kcNG5cU1jaOi7xM1sQzGcRBqwnX2w1f1k6u/xdSxX4ZhSxJjFyZ
         CNEkJmvDnS2fWl0Q+eWM6cJYUF/UwDztc0vmXOxd794BXtome0YL+Y984CoAoVgZLxSx
         X1oynE8Wynk+dJWzYGZCXYcAQHPRGIWusHB0BnCS0zGm0NZm7XAwzgECz3No61Wt7Ur4
         QwYg==
X-Gm-Message-State: AO0yUKViYjsHQND+oy0+djnEC4Xr2YdN2MyDspsudcdB8SbQmgoVD8j3
	XlHShGJDx4PHKwwuVynVwX3Hf5cL9L0=
X-Google-Smtp-Source: AK7set/rS/B4LvX7QitO4J+6/0rt8g1uWyNx3GGWwEcx45E5noz95YgZVmYFWeg2xuZOjtBvXWbnpA==
X-Received: by 2002:a05:622a:3c7:b0:3bc:fa79:c20c with SMTP id k7-20020a05622a03c700b003bcfa79c20cmr3544898qtx.16.1676550481789;
        Thu, 16 Feb 2023 04:28:01 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:2ead:d6b6:b6e2:9e85])
        by smtp.gmail.com with ESMTPSA id t127-20020a379185000000b0073b4d9e2e8dsm1102362qkd.43.2023.02.16.04.28.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:28:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 03/15] python3-pillow: upgrade 9.3.0 -> 9.4.0
Date: Thu, 16 Feb 2023 07:27:13 -0500
Message-Id: <6e01fb8272a93db3cbcc6fd66abe41ac25564578.1676550369.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676550369.git.akuster808@gmail.com>
References: <cover.1676550369.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 12:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101105

From: Wang Mingyu <wangmy@fujitsu.com>

License-Updated: copyright year updated to 2023

Changelog:
==========
 Fixed null pointer dereference crash with malformed font #6846
 Return from ImagingFill early if image has a zero dimension #6842
 Reversed deprecations for Image constants, except for duplicate Resampling attributes #6830
 Improve exception traceback readability #6836
 Do not attempt to read IFD1 if absent #6840
 Fixed writing int as ASCII tag #6800
 If available, use wl-paste or xclip for grabclipboard() on Linux #6783
 Added signed option when saving JPEG2000 images #6709
 Patch OpenJPEG to include ARM64 fix #6718
 Added support for I;16 modes in putdata() #6825
 Added conversion from RGBa to RGB #6708
 Added DDS support for uncompressed L and LA images #6820
 Added LightSource tag values to ExifTags #6749
 Fixed PyAccess after changing ICO size #6821
 Do not use EXIF from info when saving PNG images #6819
 Fixed saving EXIF data to MPO #6817
 Added Exif hide_offsets() #6762
 Only compare to previous frame when checking for duplicate GIF frames while saving #6787
 Always initialize all plugins in registered_extensions() #6811
 Ignore non-opaque WebP background when saving as GIF #6792
 Only set tile in ImageFile __setstate__ #6793
 When reading BLP, do not trust JPEG decoder to determine image is CMYK #6767
 Added IFD enum to ExifTags #6748
 Fixed bug combining GIF frame durations #6779
 Support saving JPEG comments #6774
 Added getxmp() to WebPImagePlugin #6758
 Added "exact" option when saving WebP #6747
 Use fractional coordinates when drawing text #6722
 Fixed writing int as BYTE tag #6740
 Added MP Format Version when saving MPO #6735
 Added Interop to ExifTags #6724
 CVE-2007-4559 patch when building on Windows #6704
 Fix compiler warning: accessing 64 bytes in a region of size 48 #6714
 Use verbose flag for pip install #6713

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b73867b9d77e8050c20dc28ec449572f2185cb2a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-pillow_9.3.0.bb => python3-pillow_9.4.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_9.3.0.bb => python3-pillow_9.4.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
index 11f5451609..403a987d1e 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
@@ -3,7 +3,7 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors."
 HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bc416d18f294943285560364be7cbec1"
 
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
            file://0001-support-cross-compiling.patch \
@@ -39,4 +39,4 @@ RPROVIDES:${PN} += "python3-imaging"
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "d594f4cb8dc47fb0c69ae58d9fff86faae4515bd"
+SRCREV = "a5bbab1c1e63b439de191ef2040173713b26d2da"
-- 
2.25.1


