Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00283EA4E0E
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 14:56:15 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.162189.1772463369338688696
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 06:56:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ru9WDDXj;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso721741f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 06:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772463367; x=1773068167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zl44npOMK+f3Np+AQPHvPlxUxrTyWA0a1z4yIwmLNZo=;
        b=Ru9WDDXjXDL3+TKjGBRtfXwYKP74xomIlZV/xYpce++OYDiJHgwhz76aE/81PnbU+9
         TeoCsCzVjt16j9wTp1QVDHqnLcuxwaRFUl93MkxxFA7AX09OjXMzBL+LdfaOXvH3dY5a
         mQ/3RZB2kXkiFfai16kLLnIa5VnPF++lkQIzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772463367; x=1773068167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zl44npOMK+f3Np+AQPHvPlxUxrTyWA0a1z4yIwmLNZo=;
        b=xUXywWr+YfLDkdS74Wh/WgaYbmyxpV8xfRSy0E+BdU4e0U/boVCuR+dEodwWDmu+9h
         p8abCwTCLRdKbjt3gSisozUEaJFLK78ZqVuot5KL0mlBApXzMyxsecyjlCRjYkUQTVDl
         LOgsIasBBUHP8jy+Wb1HxSdvldhF5jc4KNwwoONiblzfAgsYUaX0yfBKbQyGzhuneA+Q
         R5wBqGp7p6ETvZHpcwTO03qiEyTpOpEbSc3a95O1GSSq0XGSUb5CEfs4Ieud1glibYGe
         hBz5d241vAZtpt38A4BKfpmGFpQJgNQRXeiSXMQY49iZLkJl2uLzpCKvg84+WXhDZdOF
         r04Q==
X-Gm-Message-State: AOJu0Yz7ex4NFbgLuMiEvBS0UpHsg0dtq8Gizi8BTYxhrvqM1t5cCzSu
	yCpGZerMqvd86eQcJYk09Q7iplHadHlnKy76N5rMLDgnKu/hqTb4ivcrITIu7d95EKdtivhpgYd
	K8jST
X-Gm-Gg: ATEYQzyvsRrOJJUO88fDGfH9nxhobqmNfBM+ALPGQvSM8g08j2ErHI2pVkxo9VBdbQl
	b32HM0hgmBed5X6KynYu3Lad5kuBvrryjl/Pqh+dikXwm/B85yMbl+JdTs9U3qCJ6YlCmk5pw2r
	A8k0KgVJYUQOLgtmvOwi5I8hZO+oXc8cv7QEzzNlu1pn5Ds5yP6XcA80pYrnjrgFcZYFfgl8wUk
	ixrEEjBvZ10N/bMX9+jubffEPzmtzOY/26etw+CJipU+NqKGdtOWWBUpQMGaMMpoQ7LHbraSRa4
	M5ISbQssTYM7Qbqb6oFVcv2ktF19aaIsNgc0l4MyNGVyMaJtug2j/l4+5zweoJi7KAsB60ADb+T
	tNm1xmiW2rogcR7gi2pRnml9ue41W205TmbAuDB9t0Z9FVYK92/2Ir8xwTkeS4pkAeb4EPPLew5
	bSKFVznSWadh6GuDsfOqqKE7HtUlEIsI4sa9x1
X-Received: by 2002:a05:6000:1885:b0:439:b486:ba6b with SMTP id ffacd0b85a97d-439b486c39cmr8030539f8f.39.1772463367300;
        Mon, 02 Mar 2026 06:56:07 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75a25dsm27445295f8f.21.2026.03.02.06.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 06:56:06 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-yarl: Upgrade 1.22.0 -> 1.23.0
Date: Mon,  2 Mar 2026 16:56:01 +0200
Message-ID: <20260302145602.1385229-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302145602.1385229-1-leon.anavi@konsulko.com>
References: <20260302145602.1385229-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 14:56:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124808

Upgrade to release 1.23.0:

- Added support for pydantic, the :class:~yarl.URL could be used as
  a field type in pydantic models seamlessly.
- The CI has been set up to notify Codecov about upload completion
- The in-tree build backend allows the end-users appending
  CFLAGS and LDFLAGS by setting respective environment
  variables externally.
- The :pep:517 build backend now supports a new config
  setting for controlling whether to build the project in-tree
  or in a temporary directory. It only affects wheels and is
  set up to build in a temporary directory by default. It does
  not affect editable wheel builds - they will keep being
  built in-tree regardless.
- Starting this version, when building the wheels is happening
  in an automatically created temporary directory, the build
  backend makes an effort to normalize the respective file
  system path to a deterministic source checkout directory.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-build-wheel-in-place.patch           | 31 -------------------
 ...-yarl_1.22.0.bb => python3-yarl_1.23.0.bb} |  9 +++---
 2 files changed, 5 insertions(+), 35 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-yarl/0001-build-wheel-in-place.patch
 rename meta-python/recipes-devtools/python/{python3-yarl_1.22.0.bb => python3-yarl_1.23.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl/0001-build-wheel-in-place.patch b/meta-python/recipes-devtools/python/python3-yarl/0001-build-wheel-in-place.patch
deleted file mode 100644
index 84f81da775..0000000000
--- a/meta-python/recipes-devtools/python/python3-yarl/0001-build-wheel-in-place.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 606843ad079d9d0dac1172533d42b5a2327b99ed Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 17 Sep 2025 15:41:09 +0800
-Subject: [PATCH] build wheel in place
-
-In order to make the generated library be reproducible, build wheel
-in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
-option -fdebug-prefix-map could work as expected
-
-Upstream-Status: Pending
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- packaging/pep517_backend/_backend.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/packaging/pep517_backend/_backend.py b/packaging/pep517_backend/_backend.py
-index 61cad34..d5d839e 100644
---- a/packaging/pep517_backend/_backend.py
-+++ b/packaging/pep517_backend/_backend.py
-@@ -316,7 +316,7 @@ def build_wheel(
-     """
-     with maybe_prebuild_c_extensions(
-             line_trace_cython_when_unset=False,
--            build_inplace=False,
-+            build_inplace=True,
-             config_settings=config_settings,
-     ):
-         return _setuptools_build_wheel(
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.22.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.23.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-yarl_1.22.0.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.23.0.bb
index 6c2e2259b7..6a973f9acb 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.23.0.bb
@@ -3,15 +3,14 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "bebf8557577d4401ba8bd9ff33906f1376c877aa78d1fe216ad01b4d6745af71"
+SRC_URI[sha256sum] = "53b1ea6ca88ebd4420379c330aea57e258408dd0df9af0992e5de2078dc9f5d5"
 
 PYPI_PACKAGE = "yarl"
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta cython
 
-SRC_URI += " \
-    file://0001-build-wheel-in-place.patch \
-"
+PEP517_BUILD_OPTS = "--config-setting=build-inplace=true"
+
 
 DEPENDS += " \
     python3-expandvars-native \
@@ -33,4 +32,6 @@ RDEPENDS:${PN}-ptest += " \
     python3-unittest-automake-output \
 "
 
+INSANE_SKIP:${PN} = "already-stripped"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


