Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BFBC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 12:26:35 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.6816.1654086388941838212
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 05:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e9btPeOm;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so1902765pjf.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 05:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vybIPYEnGl1aHwtqrgfd6p8xv/EFMdrFns/4Io89QL0=;
        b=e9btPeOmAIGosyhomlTvWd/Cd9bla2HQCsfhOOVPJCBxkZVksahz9qIu9+DFuNSUp9
         7YlyeJ/K0FAKB5/F2jR2UDxEHDom3lt5eXdqnU5xCsplxbXOtHRaogkgt6W2bFlqRd/s
         jWK7qMNfLAdenq2Qu2C8OqbbBlNncNIRFZBs0TRx78i8HjGlzNXw4se56LN5XXkZTS68
         Htq3h5Hmb0iilQvJEbEVHTag+c2t2Ij3qxkPxtSQZRH00KtC7DxFQLsRX3WOZkD67GQU
         QaCHw9YyQEjEThlxZ/AO/3trMWXFBKCq0LoaqaTgiaaYx1D0e7bFA24mU40y3fftGMJW
         vXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vybIPYEnGl1aHwtqrgfd6p8xv/EFMdrFns/4Io89QL0=;
        b=VnnrvLEZknsaOglTt1Qh+aA570y2YC4YLQ0TLkH8dFyS3XLW9HuNwQ+M8Tv5fFYeoU
         u2jRieNQRcZm/h/yoJqXKS4MebnxQnfSecW+ZDmSI1crz8AocKcIBfSkMe8nlcmCj3Gb
         4YeItAq0nndjOZckpGZwdZXPWOirvnokvvoU7nxtcmqZZWtTQGqprvdxMd67GLo///6/
         vY6VP+ExUIHOSK7vTKG+8pSsgqNqBrLMWBzoTSXyWwT9kQCRx6pzZ++9CeJ5LWFmJSMr
         sEehBQg/vrJYxA6L8XhR0wtSc7gkC8OMG7prTLMzBv2Qb9xbvdCEzOJG1eQXlDYtumM8
         od2Q==
X-Gm-Message-State: AOAM531zsJ0gDLYEan7jP92mULRPhtEc3PufQHaZt78+5PzNqWu5Irl9
	Qua2DwgdyQ250+u1lq9GFTTv1ZKQvAKp9A==
X-Google-Smtp-Source: 
 ABdhPJyKg7cgcwr1azrd2yLHgkvdAkpkPgMfbSoxb8FpFfaXk6KxN4kD6mYmhC2wW8i+HSESMTJwmA==
X-Received: by 2002:a17:903:2304:b0:162:ed1:ed9c with SMTP id
 d4-20020a170903230400b001620ed1ed9cmr51262926plh.122.1654086388041;
        Wed, 01 Jun 2022 05:26:28 -0700 (PDT)
Received: from localhost.localdomain ([103.85.9.215])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm1401006plm.191.2022.06.01.05.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:26:27 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	raj.khem@gmail.com,
	Leon Anavi <leon.anavi@konsulko.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta-python][dunfell][PATCH 2/9] python3-pillow: Upgrade 7.2.0 ->
 8.1.0
Date: Wed,  1 Jun 2022 17:55:20 +0530
Message-Id: <20220601122527.19987-2-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
References: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jun 2022 12:26:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97360

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 8.1.0:

- Fix TIFF OOB Write error
- Fix for Buffer Read Overrun in PCX Decoding
- Fix for SGI Decode buffer overrun
- Fix OOB Read when saving GIF of xsize=1
- Add support for PySide6
- Moved QApplication into one test
- Use disposal settings from previous frame in APNG
- Revert "skip wheels on 3.10-dev due to wheel#354"
- Better _binary module use
- Added exception explaining that repr_png saves to PNG
- Use previous disposal method in GIF load_end
- Do not catch a ValueError only to raise another
- Allow putpalette to accept 1024 integers to include alpha values
- Fix OOB Read when writing TIFF with custom Metadata
- Removed unused variable
- Fix dereferencing of potential null pointers
- Fixed warnings assigning to "unsigned char *" from "char *"
- Add append_images support for ICO
- Fixed comparison warnings
- Block TIFFTAG_SUBIFD
- Fix dereferencing potential null pointer
- Replaced PyErr_NoMemory with ImagingError_MemoryError
- Remove duplicate code
- Moved warning to end of execution
- Removed unused fromstring and tostring C methods
- init() if one of the formats is unrecognised

License-Update: Updated copyright year

Conflicts:
	meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
Conflicts due to extra parameter protocol=https in SRC_URI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ae76da9210b51485da995b51f7ed41e89471dea9)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../0001-support-cross-compiling.patch        | 43 ++++++-------------
 ...illow_7.2.0.bb => python3-pillow_8.1.0.bb} |  7 ++-
 2 files changed, 16 insertions(+), 34 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_7.2.0.bb => python3-pillow_8.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
index 6de19ad87a..e4ba35b886 100644
--- a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
@@ -1,20 +1,21 @@
-From ae7c8d0336381dd4c10e809e9c8926f9deeafeb8 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 14 Mar 2019 03:48:10 -0400
+From cd09b6f68aa49c72e9a9bb0765e8c666238a7b7e Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 11 Jan 2021 13:25:12 +0000
 Subject: [PATCH] support cross compiling
 
 Upstream-Status: Inappropriate [oe specific]
 
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Suggested-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
- setup.py | 13 +++----------
- 1 file changed, 3 insertions(+), 10 deletions(-)
+ setup.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 5ceae344..07863340 100755
+index cbc2641c..302bc6e7 100755
 --- a/setup.py
 +++ b/setup.py
-@@ -105,7 +105,7 @@ _LIB_IMAGING = (
+@@ -123,7 +123,7 @@ _LIB_IMAGING = (
      "codec_fd",
  )
  
@@ -23,39 +24,21 @@ index 5ceae344..07863340 100755
  
  
  class DependencyException(Exception):
-@@ -396,21 +396,16 @@ class pil_build_ext(build_ext):
+@@ -408,12 +408,12 @@ class pil_build_ext(build_ext):
                      _add_directory(library_dirs, match.group(1))
  
          # include, rpath, if set as environment variables:
 -        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE"):
-+        for k in ('C_INCLUDE_PATH', 'CPATH', 'INCLUDE', 'STAGING_INCDIR'):
++        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE", "STAGING_INCDIR"):
              if k in os.environ:
                  for d in os.environ[k].split(os.path.pathsep):
                      _add_directory(include_dirs, d)
  
 -        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB"):
-+        for k in ('LD_RUN_PATH', 'LIBRARY_PATH', 'LIB', 'STAGING_LIBDIR'):
++        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB", "STAGING_LIBDIR"):
              if k in os.environ:
                  for d in os.environ[k].split(os.path.pathsep):
                      _add_directory(library_dirs, d)
- 
--        prefix = sysconfig.get_config_var("prefix")
--        if prefix:
--            _add_directory(library_dirs, os.path.join(prefix, "lib"))
--            _add_directory(include_dirs, os.path.join(prefix, "include"))
--
-         #
-         # add platform directories
- 
-@@ -469,8 +464,6 @@ class pil_build_ext(build_ext):
-             or sys.platform.startswith("gnu")
-             or sys.platform.startswith("freebsd")
-         ):
--            for dirname in _find_library_dirs_ldconfig():
--                _add_directory(library_dirs, dirname)
-             if sys.platform.startswith("linux") and os.environ.get(
-                 "ANDROID_ROOT", None
-             ):
 -- 
-2.20.1
+2.17.1
 
diff --git a/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
index 28aaff8060..adbf639b39 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
@@ -3,14 +3,13 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors."
 HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ea2dc3f5611e69058503d4b940049d03"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=7.2.x;protocol=https \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.1.x;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "2bd74943fb9f320def6c066e732b701d1c15f677"
-
+SRCREV ?= "fcc42e0d344146ee9d265d1f43c094ce5a0ec4cf"
 
 inherit setuptools3
 
-- 
2.17.1


