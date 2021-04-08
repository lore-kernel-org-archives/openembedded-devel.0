Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.237.1617899813670897536
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b5zdIdIo;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id x207so2823193oif.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=IRXLM+VqN8VdLSQIlDheZWGGtBCc3cTeNs4bWWJYNAE=;
        b=b5zdIdIo9QlfVEZwSmWUFzY9mZvFVLBH9PVa+HxyE21SzASAUTVktnpMtr3luRf82f
         5LdOZ0LaCUflZ3dwsrT2A1qiNhk7bjswnEg006OcVTFQ8VmdUmUptlNwQv5yOWmObN93
         0WLuOPsJj43p8Zua26zPw81hkyDusVMBxWFOtbvKtoPBVLkOvJxsjtaul20tTF59V/BR
         wgx5APkyS4Xu20pEAtvJ8EHD57xhwf/KXQ13Z+bUCRxsrkXw91SXB9XGwwlp9+z7/4QC
         Nu3BVuGH4uq+0qh1NVHi73+a+ZLI9rjwUMCZJX0KOxLLF0F8Eu9PGU/7xMSw+UTdPb9c
         xEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=IRXLM+VqN8VdLSQIlDheZWGGtBCc3cTeNs4bWWJYNAE=;
        b=pxY9XWAPk3bKyLhO4bnvNzXukNMLJ8f7N23UU4abO79aeU3pDQ2H4koTlG32Fmyqa8
         qwvFuKM05wjU7BsesnOtdeHonahyjSClTo4FRUSxeowpjoxf/3VYdhdmunr4p2pYenY4
         8qWzDY7a02ov7tnhE8Maq8h+/CE+XKYcGkKakvxlfE0V4OGyYmVKfteBN7qetTNJjTcX
         tjGzMkRN3kol08/UhRaX6GjY1mSSEE6q3hjHX8SdVSt8GsVfqAzLoyjlicVsZPFZSske
         ogRT2gitrL5iwcLSD7ymB2WAsMmD+2HE25EFmHWg5fEyBu7QVR0ZmLmNNhwte/XEt1gB
         t/Ww==
X-Gm-Message-State: AOAM533AZLwMRSQe6mo+7w4vDvU+Bqj8rJ89j+yDuQx9LTL5Bzf1S9nk
	4ffdMFnsNNbo15vItismiKZEHiTg20M=
X-Google-Smtp-Source: ABdhPJzHonBsb+Xh69Isi3o7RC/XiqbJ/iSW4hRy76td8c1h2/6gsWM8dStIPwH/50SWWypbLSCoOA==
X-Received: by 2002:aca:1803:: with SMTP id h3mr6858248oih.65.1617899812910;
        Thu, 08 Apr 2021 09:36:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:52 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 43/64] python3-pillow: Upgrade 8.1.2 -> 8.2.0
Date: Thu,  8 Apr 2021 09:35:50 -0700
Message-Id: <08ae1e71412cfff424977a4833879ea32a4a4c2d.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 8.2.0:

- Added getxmp() method
- Add ImageShow support for GraphicsMagick
- Do not load transparent pixels from subsequent GIF frames
- Use LZW encoding when saving GIF images
- Set all transparent colors to be equal in quantize()
- Allow PixelAccess to use Python __int__ when parsing x and y
- Removed Image._MODEINFO
- Add preserve_tone option to autocontrast
- Fixed linear_gradient and radial_gradient I and F modes
- Add support for reading TIFFs with PlanarConfiguration=2
- Deprecated categories
- Do not premultiply alpha when resizing with Image.NEAREST
  resampling
- Dynamically link FriBiDi instead of Raqm
- Allow fewer PNG palette entries than the bit depth maximum when
  saving
- Use duration from info dictionary when saving WebP
- Stop flattening EXIF IFD into getexif()
- Replaced tiff_deflate with tiff_adobe_deflate compression when
  saving TIFF images
- Save ICC profile from TIFF encoderinfo
- Moved RGB fix inside ImageQt class
- Allow alpha_composite destination to be negative
- Ensure file is closed if it is opened by ImageQt.ImageQt
- Added ImageDraw rounded_rectangle method
- Added IPythonViewer
- Only draw each rectangle outline pixel once
- Use mmap instead of built-in Win32 mapper
- Handle PCX images with an odd stride
- Only read different sizes for "Large Thumbnail" MPO frames
- Added PyQt6 support
- Changed Image.open formats parameter to be case-insensitive
- Deprecate Tk/Tcl 8.4, to be removed in Pillow 10 (2023-01-02)
- Added tk version to pilinfo
- Support for ignoring tests when running valgrind
- OSS-Fuzz support

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 0fc9235bbb8f4df0ac7b33f0b875e1fc36e1e563)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-pillow_8.1.2.bb => python3-pillow_8.2.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_8.1.2.bb => python3-pillow_8.2.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
index a1b4f9059d9..3241230d13f 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.1.x \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.2.x \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "88bd672dafad68b419ea29bef941dfa17f941038"
+SRCREV ?= "e0e353c0ef7516979a9aedce3792596649ce4433"
 
 inherit setuptools3
 
-- 
2.17.1

