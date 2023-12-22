Return-Path: <padalkards17082001@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AD5C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 07:28:34 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.19067.1703230110818212446
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 23:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cp++TJu7;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: padalkards17082001@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d3e416f303so7500195ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 23:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703230109; x=1703834909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9e0YHxNCE755LHVKODL/lK9R5kOmMVA14Q2tWEvmlJE=;
        b=cp++TJu7LynLK3YA9JfBAKq9xuBl9rZzm94JnzO1enqV+/1mvl8wphHgS3KmYpb9/C
         EHm6zvJ8b/8UGWVYQ7E1PRtKsVpRK3uE02Dj28qskjkxzxTcfCUoGvCw8sBGjtEsCsQw
         bSGAoZZu3fbcd2/H9SiHMILCl5QNFnuynm1gsEp+QvvpWi1eIS89n8sA9HEUcwDDdLNo
         nTx/R3BNIacD65hK8E7vx+SKPQkKWsAqqdARft6x/BFfRFjAVWEfar1ofluK3mUAutQY
         v2BIAXeO8afmoyQpQ4BaOer9CHXvNIFKqD4JHvBBCM3LbLzalalqu3iwQDLZS5PoCnpJ
         9Vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703230109; x=1703834909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9e0YHxNCE755LHVKODL/lK9R5kOmMVA14Q2tWEvmlJE=;
        b=gxPVUthQzStwDjNVaTbxH8t44EloG8wIHfoLRZ/W2Dqx/DjHgZ4ZWf/0HjOBBfst54
         3Mk8yaPRGgxeBF42FwpOf639fp2A2SjJPvdHstnCnz/EIFp2WjvheTbo9zBmX9GuZP+d
         MVOKrBjnSNff1+zUbvV1k4unyyH71FfA7d9jbRNvIQyfBHEZtBrfOk3Ugdqr1G447P1x
         38g+xG4zgoTKmjgSSykcdB58ODChBQHsZco/r99oeHCAGiceZ4HglgaicV6OjZfxB4Jp
         BAEMPu3M9oHpoQQpum1qQ/rnRa4LVwxnv8m5BQNoJdnfNlWJ2Gz5BgXkLJr/1iwCFd0z
         ja0Q==
X-Gm-Message-State: AOJu0YyDT/G6xF+vWnzgx3q1KZkRimlhuUFsVND8Is0P7l0YF0t+l998
	IdwS+es204x0L+CynS/jI6MCod8zsq4=
X-Google-Smtp-Source: AGHT+IFlMysFCrsboo9S8H5rZnA5KKdeuTYa9NeLpEnSg6GQG/J4bCrcQ+KS8vwqxQoPk3dGIakw5g==
X-Received: by 2002:a17:902:a38c:b0:1d4:12f0:1293 with SMTP id x12-20020a170902a38c00b001d412f01293mr569127pla.93.1703230109175;
        Thu, 21 Dec 2023 23:28:29 -0800 (PST)
Received: from localhost.localdomain ([106.76.78.71])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902e54100b001cf51972586sm2761103plf.292.2023.12.21.23.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 23:28:28 -0800 (PST)
From: dnyandev <padalkards17082001@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	padalkards17082001@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [oe][meta-python][kirkstone][PATCH] python3-pillow: Fix CVE-2023-44271
Date: Fri, 22 Dec 2023 12:56:35 +0530
Message-Id: <20231222072635.456015-1-padalkards17082001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 07:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107747

Add patch to fix CVE-2023-44271

Reference:
https://github.com/python-pillow/Pillow/commit/1fe1bb49c452b0318cad12ea9d97c3bef188e9a7

Signed-off-by: Dnyandev Padalkar <padalkards17082001@gmail.com>
---
 .../python3-pillow/CVE-2023-44271.patch       | 156 ++++++++++++++++++
 .../python/python3-pillow_9.4.0.bb            |   1 +
 2 files changed, 157 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2023-44271.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-44271.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-44271.patch
new file mode 100644
index 000000000..ad51f1728
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2023-44271.patch
@@ -0,0 +1,156 @@
+From 1fe1bb49c452b0318cad12ea9d97c3bef188e9a7 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Fri, 30 Jun 2023 23:32:26 +1000
+Subject: [PATCH] Added ImageFont.MAX_STRING_LENGTH
+
+Upstream-status: Backport [https://github.com/python-pillow/Pillow/commit/1fe1bb49c452b0318cad12ea9d97c3bef188e9a7]
+CVE: CVE-2023-44271
+Comment: Refresh hunk for test_imagefont.py, ImageFont.py and
+Remove hunk 10.0.0.rst because in our version it is 9.4.0
+
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+Signed-off-by: Dnyandev Padalkar <padalkards17082001@gmail.com>
+---
+ Tests/test_imagefont.py      | 19 +++++++++++++++++++
+ docs/reference/ImageFont.rst | 18 ++++++++++++++++++
+ src/PIL/ImageFont.py         | 15 +++++++++++++++
+ 3 files changed, 52 insertions(+)
+
+diff --git a/Tests/test_imagefont.py b/Tests/test_imagefont.py
+index 7fa8ff8cbfd..c50447a153d 100644
+--- a/Tests/test_imagefont.py
++++ b/Tests/test_imagefont.py
+@@ -1107,6 +1107,25 @@
+     assert_image_equal_tofile(im, "Tests/images/text_mono.gif")
+ 
+ 
++def test_too_many_characters(font):
++    with pytest.raises(ValueError):
++        font.getlength("A" * 1000001)
++    with pytest.raises(ValueError):
++        font.getbbox("A" * 1000001)
++    with pytest.raises(ValueError):
++        font.getmask2("A" * 1000001)
++
++    transposed_font = ImageFont.TransposedFont(font)
++    with pytest.raises(ValueError):
++        transposed_font.getlength("A" * 1000001)
++
++    default_font = ImageFont.load_default()
++    with pytest.raises(ValueError):
++        default_font.getlength("A" * 1000001)
++    with pytest.raises(ValueError):
++        default_font.getbbox("A" * 1000001)
++
++
+ @pytest.mark.parametrize(
+     "test_file",
+     [
+diff --git a/docs/reference/ImageFont.rst b/docs/reference/ImageFont.rst
+index 946bd3c4bed..2abfa0cc997 100644
+--- a/docs/reference/ImageFont.rst
++++ b/docs/reference/ImageFont.rst
+@@ -18,6 +18,15 @@ OpenType fonts (as well as other font formats supported by the FreeType
+ library). For earlier versions, TrueType support is only available as part of
+ the imToolkit package.
+ 
++.. warning::
++    To protect against potential DOS attacks when using arbitrary strings as
++    text input, Pillow will raise a ``ValueError`` if the number of characters
++    is over a certain limit, :py:data:`MAX_STRING_LENGTH`.
++
++    This threshold can be changed by setting
++    :py:data:`MAX_STRING_LENGTH`. It can be disabled by setting
++    ``ImageFont.MAX_STRING_LENGTH = None``.
++
+ Example
+ -------
+ 
+@@ -73,3 +82,12 @@ Constants
+ 
+     Requires Raqm, you can check support using
+     :py:func:`PIL.features.check_feature` with ``feature="raqm"``.
++
++Constants
++---------
++
++.. data:: MAX_STRING_LENGTH
++
++    Set to 1,000,000, to protect against potential DOS attacks. Pillow will
++    raise a ``ValueError`` if the number of characters is over this limit. The
++    check can be disabled by setting ``ImageFont.MAX_STRING_LENGTH = None``. 
+diff --git a/src/PIL/ImageFont.py b/src/PIL/ImageFont.py
+index 3ddc1aaad64..1030985ebc4 100644
+--- a/src/PIL/ImageFont.py
++++ b/src/PIL/ImageFont.py
+@@ -43,6 +43,9 @@
+     RAQM = 1
+ 
+ 
++MAX_STRING_LENGTH = 1000000
++
++
+ def __getattr__(name):
+     for enum, prefix in {Layout: "LAYOUT_"}.items():
+         if name.startswith(prefix):
+@@ -67,6 +67,12 @@
+     core = _ImagingFtNotInstalled()
+ 
+ 
++def _string_length_check(text):
++    if MAX_STRING_LENGTH is not None and len(text) > MAX_STRING_LENGTH:
++        msg = "too many characters in string"
++        raise ValueError(msg)
++
++
+ _UNSPECIFIED = object()
+ 
+ 
+@@ -192,6 +192,7 @@
+ 
+         :return: ``(left, top, right, bottom)`` bounding box
+         """
++        _string_length_check(text)
+         width, height = self.font.getsize(text)
+         return 0, 0, width, height
+ 
+@@ -202,6 +202,7 @@
+ 
+         .. versionadded:: 9.2.0
+         """
++        _string_length_check(text)
+         width, height = self.font.getsize(text)
+         return width
+ 
+@@ -359,6 +359,7 @@
+ 
+         :return: Width for horizontal, height for vertical text.
+         """
++        _string_length_check(text)
+         return self.font.getlength(text, mode, direction, features, language) / 64
+ 
+     def getbbox(
+@@ -418,6 +418,7 @@
+ 
+         :return: ``(left, top, right, bottom)`` bounding box
+         """
++        _string_length_check(text)
+         size, offset = self.font.getsize(
+             text, mode, direction, features, language, anchor
+         )
+@@ -762,6 +762,7 @@
+                  :py:mod:`PIL.Image.core` interface module, and the text offset, the
+                  gap between the starting coordinate and the first marking
+         """
++        _string_length_check(text)
+         if fill is _UNSPECIFIED:
+             fill = Image.core.fill
+         else:
+@@ -924,6 +924,7 @@
+         if self.orientation in (Image.Transpose.ROTATE_90, Image.Transpose.ROTATE_270):
+             msg = "text length is undefined for text rotated by 90 or 270 degrees"
+             raise ValueError(msg)
++        _string_length_check(text)
+         return self.font.getlength(text, *args, **kwargs)
+ 
+ 
diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
index 86705d2d8..b9c09127c 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
            file://run-ptest \
+           file://CVE-2023-44271.patch \
            "
 SRCREV ?= "82541b6dec8452cb612067fcebba1c5a1a2bfdc8"
 
-- 
2.25.1


