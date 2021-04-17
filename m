Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.3582.1618693579658407734
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BQiMraI5;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id c17so20635858pfn.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=tTHGmdU8mdgaLjZQPcpkgXXP5xxq2cGDt+LCYga0sT0=;
        b=BQiMraI5+x3bf2iJdE2n2Z0yUHHSe3tRFXxa84WoJ0eNqteI+mJYA09Ztx76aW2s/l
         tbT7bVFUdS8smftbsi2G1fu1mxDD3iZ/Yn7GmiZb65AUfj5dK0oEqsFb/Xtuhyf74fxP
         FHSSeSvecARxKHghrWiHT5CH17e7kM8sXBvFLaSD637RRhf6H6oO9ppcqrNsvdEJFgDM
         uXXPtgEhRqcI6uw2fsduvGbPoBeNho+F8RzpoEz9FvHfEfLeDApUi60ZPkk+bf67ehf9
         RNvhp0MLT6/dFjSZCI5tC/puscLoK2e7G+S/oVNKH9FmQH8uk9SEPP7RT2kv4Bt6eceI
         hRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=tTHGmdU8mdgaLjZQPcpkgXXP5xxq2cGDt+LCYga0sT0=;
        b=Y0rCF6Yg6XVP0l6dJfOymru51JfRF1V9gdaGtIUAaiQVCvGMf5qswkYm+C5/GoDOin
         t/qCh01A7Vru15NxAjqcEo9LVWC1VW4igOgy9I5MxJwndCSROSnL0IB9UAR1+gekROVa
         1ORazqPMFg3pGbZv9PRQC+Vnb11M8X+hnbb8POOZCdN4uH0ldVoPH11i2+FmEjYFf/hP
         c6N0CGac89kX8IW/C3QF7VB8dw6v8lZ31E+II9Pcq166c2soP8SSE3Ngbmf5gZnncqSi
         gxnNRSuT/Y+BoVANoowZGEJfZVBVGFlfqNv+xt5L5ED+mbOLZXFAKron5LbbaKX6QQ9+
         Mp3g==
X-Gm-Message-State: AOAM533oIoLRQcdCjvdIzWgXj/hz6rindNEfIHj5Ml9KGmx0c7SfNO0r
	ttNm9B9xI26qjnILQY46RPTvdZ4rb+DC8A==
X-Google-Smtp-Source: ABdhPJyKDD2r4BVdEkWUPwbcll06Ec3ieqeJvWD8QnXWktz81fRhVT5naRToZfssVoU53KZVDoEZ5g==
X-Received: by 2002:aa7:8428:0:b029:250:1323:2d05 with SMTP id q8-20020aa784280000b029025013232d05mr13339063pfn.12.1618693579097;
        Sat, 17 Apr 2021 14:06:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:18 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 13/50] python3-astroid: upgrade 2.5.2 -> 2.5.3
Date: Sat, 17 Apr 2021 14:05:22 -0700
Message-Id: <d7ca5843450bb21b2913b63c99e7278ef31346f7.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

What's New in astroid 2.5.3?
============================
Release Date: 2021-04-10

* Takes into account the fact that subscript inferring for a ClassDef may involve __class_getitem__ method

* Reworks the `collections` and `typing` brain so that `pylint`s acceptance tests are fine.

  Closes PyCQA/pylint#4206

* Use ``inference_tip`` for ``typing.TypedDict`` brain.

* Fix mro for classes that inherit from typing.Generic

* Add inference tip for typing.Generic and typing.Annotated with ``__class_getitem__``

  Closes PyCQA/pylint#2822

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit b06d10f7dec7c1194b86e80ae84c71dd9df9c6f8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-astroid_2.5.2.bb => python3-astroid_2.5.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.5.2.bb => python3-astroid_2.5.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.5.2.bb b/meta-python/recipes-devtools/python/python3-astroid_2.5.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.5.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.5.3.bb
index 93027754b6b..f1d9c66af7b 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.5.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI[sha256sum] = "6b0ed1af831570e500e2437625979eaa3b36011f66ddfc4ce930128610258ca9"
+SRC_URI[sha256sum] = "ad63b8552c70939568966811a088ef0bc880f99a24a00834abd0e3681b514f91"
 
 inherit pypi setuptools3
 
-- 
2.17.1

