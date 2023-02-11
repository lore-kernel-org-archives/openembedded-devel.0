Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9ADEC636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 15:51:15 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.11641.1676130674524624498
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 07:51:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ch7Dr4e1;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id g8so9099339qtq.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 07:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TP9jAilICKS/Gtg2YRYoFUs6FszlcODKXAzYDS1PUGo=;
        b=ch7Dr4e1NwIKG1uKzcAixehLXobzjqJDXHYVSr2nnEWcsAKV3NIPU9rTDQ1VUctFOF
         pRp1WBP0IuiFDpD21/hdcQc12NhwRVTEQGROdw/XJGX8UqmSLQRhslncjhHB5LUCMBV+
         EWEyACDGb1zRBhCa4L1Wln+Lw1lkUk8NYUHK8JP7Jvh8DfZPawmfT7Lda1Ql8CDJVd+P
         FI0nv6q/0awX0yEcdihkyzNqdnz65vJwaVXVtLpGAvQOVtRXb+FOFobY/xUa1o29Ea2B
         KOGqGnqxB1riEVBYjZbsqF7E5/R9jCsztMR5edZrAzPUwNoVt3NSf3kkQkJc6g4jLgoX
         vKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TP9jAilICKS/Gtg2YRYoFUs6FszlcODKXAzYDS1PUGo=;
        b=KUVDzp0jx5F4BbA8uveNt+W+lTrwQcAlnh1dnXS4L61Upp6O+qWBMA7LlhPfWJzQLt
         NEnO3oW9wbx5VkSKEie3cwX/BVcNRtFCOqaeM6auxZELpk6TxaHYyygufS5/j+v+gfux
         Gyw0J+KYxmmnF/K67hVBT2MjzYgDqLNAW5l+g18SEA6XtTUvJ4BT6NB7DBH6XMiDNbBN
         LY5dpQYcGtzlKITa5sAm4PbgPLFWU05KjNmkImB5gVrfawAXubDsENkjgG6Aq2hZ1WgW
         71FE9c290G3XXgsHsGEUS8VK0FMgpYhH3imAHN6amuOympE+BMyCYzex65h+JHommjBF
         tQUw==
X-Gm-Message-State: AO0yUKXft0uV3tq3Ds+U/j+RVzQ915yZXcPtkYYKvPEje6wa5arizQQL
	lEJW+IHYtvYhBWmartnzXAelAIn7aj4=
X-Google-Smtp-Source: AK7set+BnMokjSiXxCOB703WH9uKCamQ5B/GQQU9gi0THOsf6fAcWlQDEE80cxF+eJTWiZiHlRQE0g==
X-Received: by 2002:ac8:48cd:0:b0:3b9:bc8c:c213 with SMTP id l13-20020ac848cd000000b003b9bc8cc213mr12871986qtr.30.1676130673514;
        Sat, 11 Feb 2023 07:51:13 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6c32:d739:9179:1de7])
        by smtp.gmail.com with ESMTPSA id l67-20020a37bb46000000b0071d0f1d01easm5855481qkf.57.2023.02.11.07.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 07:51:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 2/4] python3-pillow: upgrade 9.3.0 -> 9.4.0
Date: Sat, 11 Feb 2023 10:51:09 -0500
Message-Id: <20230211155111.3984602-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230211155111.3984602-1-akuster808@gmail.com>
References: <20230211155111.3984602-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 15:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101030

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


