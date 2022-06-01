Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93BBC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 12:26:55 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.6890.1654086411788368831
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 05:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mnvmjih3;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id u18so1666721plb.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 05:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MeAXy4jOVAu+97z3MbNzo9f+U3AqD1J/av4Bt8rVk6U=;
        b=Mnvmjih3ApvQ1r+OwM9Jrg5bdwRQPwdOq74Bg8rP0hpGprM2Jlm9OFkAFJNvFjTCr7
         LDPdVEsVThufhe+muWaqa9heZqQynaT+RB/G02shIbmLzqL0DQ2Cw3qK/dDhxvgRQfm5
         kAtUhPi6XtZoyusmTQj+lADrnUovvxEJIS8Mjl1Gk8vytRAjBlBu8jPu5AtaG4TXufim
         kZJcnqxrwjObyYXgWueZS/nmDCwblTeLDpGZEh0eh/BAY8uLMDTVTvG2ani65Hr3KyOH
         Mxin9swGPUdw8bNZJqDI0SPswZBG1ItkVpyKkc6J8/QCPBVONgQw/IKZ7rmKlHJ84Acy
         JC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MeAXy4jOVAu+97z3MbNzo9f+U3AqD1J/av4Bt8rVk6U=;
        b=v/mS1iASoT0H3EBNnne69R2IJUuvfoboxSmCpdftXnSuqQw2jg3/5qwAyD+MCLXDZ1
         6NxBbx+E3oHELzlLp6jvCVtf//hTI06zMco/oU06iiTI/GcBSfBYvbEkN66r82YEuACH
         Co+5gT1fYxczo9Jy2EQIOsvGKkRIPcAE/FOsZP1mIMjW9fbyhrvA1eLeA0axNx979SGh
         HBz66+OCRkMiq7Rw2yCoi3mpSmZ16EepcijICsDxGj/Xy3z4Bq71JMKEorTKW+Sq1Tko
         nTeEIe9uLF6+CYxmNcRuJtvcnHiKAUVjMkd+GWH3Vu6qnVOdQSHsLQARxRhP06ou5J2B
         G8qA==
X-Gm-Message-State: AOAM5312IAzPB+HNNMdOp/74a8a0Ul9+dUay05bORHyLm3y6+o08gmcL
	USkzPq3JvO4VRjIDjfM5zCPB5/kaUKl0AQ==
X-Google-Smtp-Source: 
 ABdhPJzl/Ghb/djoZZiUW0RcRoy/czSyxeNDJedVfVt/RMRtb/RL0EuX1ZNQTGIxtPxguS2vxIH3Bg==
X-Received: by 2002:a17:903:228c:b0:163:baf6:582a with SMTP id
 b12-20020a170903228c00b00163baf6582amr19842412plh.43.1654086410958;
        Wed, 01 Jun 2022 05:26:50 -0700 (PDT)
Received: from localhost.localdomain ([103.85.9.215])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm1401006plm.191.2022.06.01.05.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:26:50 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	raj.khem@gmail.com,
	Leon Anavi <leon.anavi@konsulko.com>,
	Trevor Gamblin <trevor.gamblin@windriver.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta-python][dunfell][PATCH 7/9] python3-pillow: Upgrade 8.3.2 ->
 9.0.0
Date: Wed,  1 Jun 2022 17:55:25 +0530
Message-Id: <20220601122527.19987-7-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
References: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jun 2022 12:26:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97365

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 9.0.0:

- Restrict builtins for ImageMath.eval()
- Ensure JpegImagePlugin stops at the end of a truncated file
- Fixed ImagePath.Path array handling
- Remove consecutive duplicate tiles that only differ by their
  offset
- Removed redundant part of condition
- Explicitly enable strip chopping for large uncompressed TIFFs
- Use the Windows method to get TCL functions on Cygwin
- Changed error type to allow for incremental WebP parsing
- Improved I;16 operations on big endian
- Ensure that BMP pixel data offset does not ignore palette
- Limit quantized palette to number of colors
- Use latin1 encoding to decode bytes
- Fixed palette index for zeroed color in FASTOCTREE quantize
- When saving RGBA to GIF, make use of first transparent palette
  entry
- Pass SAMPLEFORMAT to libtiff
- Added rounding when converting P and PA
- Improved putdata() documentation and data handling
- Exclude carriage return in PDF regex to help prevent ReDoS
- Image.NONE is only used for resampling and dithers
- Fixed freeing pointer in ImageDraw.Outline.transform
- Add Tidelift alignment action and badge
- Replaced further direct invocations of setup.py
- Added ImageShow support for xdg-open
- Switched from deprecated "setup.py install" to "pip install ."
- Support 16-bit grayscale ImageQt conversion
- Fixed raising OSError in _safe_read when size is greater than
  SAFEBLOCK
- Convert subsequent GIF frames to RGB or RGBA
- WebP: Fix memory leak during decoding on failure
- Do not prematurely return in ImageFile when saving to stdout
- Added support for top right and bottom right TGA orientations
- Corrected ICNS file length in header
- Block tile TIFF tags when saving
- Added line width argument to ImageDraw polygon
- Do not redeclare class each time when converting to NumPy
- Only prevent repeated polygon pixels when drawing with
  transparency
- Fix pushes_fd method signature
- Add support for pickling TrueType fonts
- Only prefer command line tools SDK on macOS over default
  MacOSX SDK
- Fix compilation on 64-bit Termux
- Replace 'setup.py sdist' with '-m build --sdist'
- Use declarative package configuration
- Use title for display in ImageShow
- Fix for PyQt6
- Rename master to main

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit f41b3757dddfc1b950f0d21de3af6b81167cd3ba)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../{python3-pillow_8.3.2.bb => python3-pillow_9.0.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_8.3.2.bb => python3-pillow_9.0.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.3.2.bb b/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-pillow_8.3.2.bb
rename to meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
index 3e3214f142..e522269927 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
@@ -3,13 +3,13 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors."
 HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.3.x;protocol=https \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=9.0.x;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "8013f130a5077b238a4346b73e149432b180a8ea"
+SRCREV ?= "82541b6dec8452cb612067fcebba1c5a1a2bfdc8"
 
 inherit setuptools3
 
-- 
2.17.1


