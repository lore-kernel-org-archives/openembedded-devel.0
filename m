Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B83C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 12:26:45 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.6775.1654086397683949531
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 05:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jja18I8a;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id q18so1628680pln.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 05:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9G2VSx2Hlww+37Qb9Cn8gnGhBMBI2QSdC/7QAFK6qeQ=;
        b=jja18I8aEkORvHFx/Uv3OmzGTBP8stmo5LRniPvgn1hPzSO6Rd0BSuOh4j+Yhi24ll
         WlYHg4ampu6U2l2vkwljv/Fh5cMFcMBjM7gy2KwNM8O2HjXx0+yJOLt+zMbWbTF0MC+I
         O7xh7ZagI6ngNX+BpWP6tOmESzLbNHM6DxXqhsQn420BVeqZKaZqPyk/ag9Q6NdypsmF
         zqXU14VQNQ0lLLFOBCZadRxBiIyRjcsMXUSsZ/TXoMUCDYlOS/P37FbcTguVDybQpvoq
         T2O8bnMlnIO6VdZSeedP6MltzmGD6Dc4rs89k7WcwYuKsvm3eqzSolA8JOywsRcTrKIc
         CJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9G2VSx2Hlww+37Qb9Cn8gnGhBMBI2QSdC/7QAFK6qeQ=;
        b=v4EZApkIbtLr4PeKMJu3OFg+x9YDTtG1fuKv87hA9WSgwxwGWKRzk8O9wb93hF/eu3
         17TjeBJp9NDZg+IgLHq63Hq+htwuYVp1vLN9uaxi4CZhcBaJW1LHLuuXfXc9P7v1Q/DI
         joigN5fr+gjrmFjNIJaOFs1UVA3QFp64jIQdgnVyn7vf3RPJrDYC1psweP1ovLxLCKsJ
         BchgVqLoMy0o4DJcZHFYOCkXjtwoEMJxkP2DEw9B0P/AD24DmntFQMAjP1dlyvSwlRch
         EOZJFa8CcRRqyb3T62gOprGmAtYU5vEjlqjXzGM/0gFkuqx7/ron3/Gr3ZHdvgk4ysO8
         v4zw==
X-Gm-Message-State: AOAM532C6Wbwa+I0ij28DviajuALSPABrzr8B19PjlBI2hydvl7p64oJ
	GRO3/gf9IVVX6ah4nIcJsQWBINU35aQ4OQ==
X-Google-Smtp-Source: 
 ABdhPJxQVa76yZ17G/2qnmQKNMeyjKXT57qcFJsgRMUwAFLizVejBSXzGQTyk2sxBhJhPI62m3RUxA==
X-Received: by 2002:a17:90b:17c6:b0:1e2:ab17:a8f9 with SMTP id
 me6-20020a17090b17c600b001e2ab17a8f9mr23029860pjb.68.1654086396833;
        Wed, 01 Jun 2022 05:26:36 -0700 (PDT)
Received: from localhost.localdomain ([103.85.9.215])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm1401006plm.191.2022.06.01.05.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:26:36 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	raj.khem@gmail.com,
	Leon Anavi <leon.anavi@konsulko.com>,
	Trevor Gamblin <trevor.gamblin@windriver.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta-python][dunfell][PATCH 4/9] python3-pillow: Upgrade 8.1.2 ->
 8.2.0
Date: Wed,  1 Jun 2022 17:55:22 +0530
Message-Id: <20220601122527.19987-4-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
References: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jun 2022 12:26:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97362

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

Conflicts:
	meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
Conflicts due to extra parameter protocol=https in SRC_URI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 0fc9235bbb8f4df0ac7b33f0b875e1fc36e1e563)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../{python3-pillow_8.1.2.bb => python3-pillow_8.2.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_8.1.2.bb => python3-pillow_8.2.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
index de234b01fe..9a9a843b48 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.1.x;protocol=https \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.2.x;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "88bd672dafad68b419ea29bef941dfa17f941038"
+SRCREV ?= "e0e353c0ef7516979a9aedce3792596649ce4433"
 
 inherit setuptools3
 
-- 
2.17.1


