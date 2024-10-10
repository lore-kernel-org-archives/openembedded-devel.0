Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF9ECF07C7
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:40:08 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.38722.1728549594557979282
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 01:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=W9dHsQps;
 spf=pass (domain: konsulko.com, ip: 209.85.208.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c9362c26d8so648703a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 01:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728549593; x=1729154393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hT5BchYO3SualrRp0NfwRU9Aaezt51I194ciVWJ4DsM=;
        b=W9dHsQpsUnZidfb1KALIxE/yehcuJGceJmMEz9DVEzkMFXTwYmDrktaNgacYGjfPoo
         xMbu5wHEcXb5VWXaVWT9XWBqKB9+VL7bAwEqSyyw4E3ntAMf3DL9/S+sOkDrw/90YsYZ
         kz3B3D6ez0mlaXfjZnZmlT8ZjZ06fT4Pd0yYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728549593; x=1729154393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hT5BchYO3SualrRp0NfwRU9Aaezt51I194ciVWJ4DsM=;
        b=WGUhrw0rNB3g3JSmVeoowCjwu50IQRgpipU4YSIORVtzENXGkqnmMg761+V09yFDyD
         Sxw85jCFxY9tm+PTRV/rxE2PssIYLXetFUgd9okLZZyn/6zofjVcHQ3WoCov9I/9ZU8O
         JqymtC+Z1Neh0BL69cbs8aAzViV+J9akq4RRdZeA/xgjhV4yd3Bji+UJP/0tjkq8QATG
         0svqBybgWFG9mvTEpw93tMAuGeUzrJlX8woD7FXjH9RnxASKkJXIZxgvUkzl0vw5MQJ6
         fFabiu9geaKUVqyTOfrsYOzJuGLZkMHUHGnuNwX/5bswxyUCf0LWZrOatKYwRNgVcQUG
         0jDQ==
X-Gm-Message-State: AOJu0YwKpVF49cbcXt+fImPvkomHkxztSxZvAbpaoiCKGm8wRA5dbwtv
	KFHFSXgjf/HnHBcbgofasgRZ8ebWS7Eq33dPAfHIrdzTkRK78lBOZKNDwuIgYkDg+iQJ53pvoTS
	D
X-Google-Smtp-Source: AGHT+IFJMZoNsLviUW/AvBqZJX5hHQt8cc6kH8aePTgI5NvbkH2oTstdjbF2xyHTzG1O8YxGLfc9QA==
X-Received: by 2002:a05:6402:278d:b0:5c5:bda8:8635 with SMTP id 4fb4d7f45d1cf-5c93354844fmr2092439a12.8.1728549592462;
        Thu, 10 Oct 2024 01:39:52 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937153939sm476047a12.47.2024.10.10.01.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:39:52 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-gmpy2: Upgrade 2.1.5 -> 2.2.1
Date: Thu, 10 Oct 2024 11:39:47 +0300
Message-Id: <20241010083947.7303-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241010083947.7303-1-leon.anavi@konsulko.com>
References: <20241010083947.7303-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 08:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112765

Upgrade to release 2.2.1:

- Bug fix: use C int instead of C char for some internal code
- Bug fix: add xmpz.bit_count method

Drop 0001-src-fix-python-3.12-builds.patch because a similar
change has been implemented upstream and the patch is not needed.

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes:
WARNING: python3-gmpy2-2.2.1-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-src-fix-python-3.12-builds.patch     | 263 ------------------
 ...-gmpy2_2.1.5.bb => python3-gmpy2_2.2.1.bb} |   6 +-
 2 files changed, 2 insertions(+), 267 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-gmpy2/0001-src-fix-python-3.12-builds.patch
 rename meta-python/recipes-devtools/python/{python3-gmpy2_2.1.5.bb => python3-gmpy2_2.2.1.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-gmpy2/0001-src-fix-python-3.12-builds.patch b/meta-python/recipes-devtools/python/python3-gmpy2/0001-src-fix-python-3.12-builds.patch
deleted file mode 100644
index 1171322e2..000000000
--- a/meta-python/recipes-devtools/python/python3-gmpy2/0001-src-fix-python-3.12-builds.patch
+++ /dev/null
@@ -1,263 +0,0 @@
-From 43f132103cedfd92b85173bcdacfbabd5916d9fc Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 27 Dec 2023 14:52:16 +0100
-Subject: [PATCH] src: fix python 3.12 builds
-
-This is a backport for 3.1.x versions provided separately in https://github.com/aleaxit/gmpy/issues/446
-
-Upstream-Status: Inappropriate [can be dropped when 2.2.x is released]
-
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/gmpy2_convert.h       |  21 +++++++
- src/gmpy2_convert_gmp.c   | 129 +++++++++++++-------------------------
- src/gmpy2_convert_utils.c |   2 +-
- 3 files changed, 65 insertions(+), 87 deletions(-)
-
-diff --git a/src/gmpy2_convert.h b/src/gmpy2_convert.h
-index f887d47..3e8cb2b 100644
---- a/src/gmpy2_convert.h
-+++ b/src/gmpy2_convert.h
-@@ -142,6 +142,27 @@ extern "C" {
- #define IS_TYPE_COMPLEX_ONLY(x)     ((x > OBJ_TYPE_REAL) && \
-                                      (x < OBJ_TYPE_COMPLEX))
- 
-+/* Compatibility macros (to work with PyLongObject internals).
-+ */
-+
-+#if PY_VERSION_HEX >= 0x030C0000
-+#  define TAG_FROM_SIGN_AND_SIZE(is_neg, size) ((is_neg?2:(size==0)) | (((size_t)size) << 3))
-+#  define _PyLong_SetSignAndDigitCount(obj, is_neg, size) (obj->long_value.lv_tag = TAG_FROM_SIGN_AND_SIZE(is_neg, size))
-+#elif PY_VERSION_HEX >= 0x030900A4
-+#  define _PyLong_SetSignAndDigitCount(obj, is_neg, size) (Py_SET_SIZE(obj, (is_neg?-1:1)*size))
-+#else
-+#  define _PyLong_SetSignAndDigitCount(obj, is_neg, size) (Py_SIZE(obj) = (is_neg?-1:1)*size)
-+#endif
-+
-+#if PY_VERSION_HEX >= 0x030C0000
-+#  define GET_OB_DIGIT(obj) obj->long_value.ob_digit
-+#  define _PyLong_IsNegative(obj) ((obj->long_value.lv_tag & 3) == 2)
-+#  define _PyLong_DigitCount(obj) (obj->long_value.lv_tag >> 3)
-+#else
-+#  define GET_OB_DIGIT(obj) obj->ob_digit
-+#  define _PyLong_IsNegative(obj) (Py_SIZE(obj) < 0)
-+#  define _PyLong_DigitCount(obj) (_PyLong_IsNegative(obj)? -Py_SIZE(obj):Py_SIZE(obj))
-+#endif
- 
- /* Since the macros are used in gmpy2's codebase, these functions are skipped
-  * until they are needed for the C API in the future.
-diff --git a/src/gmpy2_convert_gmp.c b/src/gmpy2_convert_gmp.c
-index cf0891e..8b8df81 100644
---- a/src/gmpy2_convert_gmp.c
-+++ b/src/gmpy2_convert_gmp.c
-@@ -59,33 +59,24 @@ GMPy_MPZ_From_PyIntOrLong(PyObject *obj, CTXT_Object *context)
-     }
- #endif
- 
--    switch (Py_SIZE(templong)) {
--    case -1:
--        mpz_set_si(result->z, -(sdigit)templong->ob_digit[0]);
-+    len = _PyLong_DigitCount(templong);
-+    negative = _PyLong_IsNegative(templong);
-+
-+    switch (len) {
-+    case 1:
-+        mpz_set_si(result->z, (sdigit)GET_OB_DIGIT(templong)[0]);
-         break;
-     case 0:
-         mpz_set_si(result->z, 0);
-         break;
--    case 1:
--        mpz_set_si(result->z, templong->ob_digit[0]);
--        break;
-     default:
--        mpz_set_si(result->z, 0);
--
--        if (Py_SIZE(templong) < 0) {
--            len = - Py_SIZE(templong);
--            negative = 1;
--        } else {
--            len = Py_SIZE(templong);
--            negative = 0;
--        }
--
--        mpz_import(result->z, len, -1, sizeof(templong->ob_digit[0]), 0,
--                   sizeof(templong->ob_digit[0])*8 - PyLong_SHIFT, templong->ob_digit);
-+        mpz_import(result->z, len, -1, sizeof(GET_OB_DIGIT(templong)[0]), 0,
-+                   sizeof(GET_OB_DIGIT(templong)[0])*8 - PyLong_SHIFT,
-+                   GET_OB_DIGIT(templong));
-+    }
- 
--        if (negative) {
--            mpz_neg(result->z, result->z);
--        }
-+    if (negative) {
-+        mpz_neg(result->z, result->z);
-     }
-     return result;
- }
-@@ -105,33 +96,24 @@ mpz_set_PyIntOrLong(mpz_t z, PyObject *obj)
-     }
- #endif
- 
--    switch (Py_SIZE(templong)) {
--    case -1:
--        mpz_set_si(z, -(sdigit)templong->ob_digit[0]);
-+    len = _PyLong_DigitCount(templong);
-+    negative = _PyLong_IsNegative(templong);
-+
-+    switch (len) {
-+    case 1:
-+        mpz_set_si(z, (sdigit)GET_OB_DIGIT(templong)[0]);
-         break;
-     case 0:
-         mpz_set_si(z, 0);
-         break;
--    case 1:
--        mpz_set_si(z, templong->ob_digit[0]);
--        break;
-     default:
--        mpz_set_si(z, 0);
--
--        if (Py_SIZE(templong) < 0) {
--            len = - Py_SIZE(templong);
--            negative = 1;
--        } else {
--            len = Py_SIZE(templong);
--            negative = 0;
--        }
--
--        mpz_import(z, len, -1, sizeof(templong->ob_digit[0]), 0,
--                   sizeof(templong->ob_digit[0])*8 - PyLong_SHIFT, templong->ob_digit);
-+        mpz_import(z, len, -1, sizeof(GET_OB_DIGIT(templong)[0]), 0,
-+                   sizeof(GET_OB_DIGIT(templong)[0])*8 - PyLong_SHIFT,
-+                   GET_OB_DIGIT(templong));
-+    }
- 
--        if (negative) {
--            mpz_neg(z, z);
--        }
-+    if (negative) {
-+        mpz_neg(z, z);
-     }
-     return;
- }
-@@ -186,12 +168,7 @@ GMPy_PyLong_From_MPZ(MPZ_Object *obj, CTXT_Object *context)
- 
-     /* Assume gmp uses limbs as least as large as the builtin longs do */
- 
--    if (mpz_sgn(obj->z) < 0) {
--        negative = 1;
--    } else {
--        negative = 0;
--    }
--
-+    negative = mpz_sgn(obj->z) < 0;
-     size = (mpz_sizeinbase(obj->z, 2) + PyLong_SHIFT - 1) / PyLong_SHIFT;
- 
-     if (!(result = _PyLong_New(size))) {
-@@ -200,31 +177,20 @@ GMPy_PyLong_From_MPZ(MPZ_Object *obj, CTXT_Object *context)
-         /* LCOV_EXCL_STOP */
-     }
- 
--    mpz_export(result->ob_digit, &count, -1, sizeof(result->ob_digit[0]), 0,
--               sizeof(result->ob_digit[0])*8 - PyLong_SHIFT, obj->z);
-+    mpz_export(GET_OB_DIGIT(result), &count, -1, sizeof(GET_OB_DIGIT(result)[0]), 0,
-+               sizeof(GET_OB_DIGIT(result)[0])*8 - PyLong_SHIFT, obj->z);
- 
-     if (count == 0) {
--        result->ob_digit[0] = 0;
-+        GET_OB_DIGIT(result)[0] = 0;
-     }
- 
-     /* long_normalize() is file-static so we must reimplement it */
-     /* longobjp = long_normalize(longobjp); */
--    while ((size>0) && (result->ob_digit[size-1] == 0)) {
-+    while ((size>0) && (GET_OB_DIGIT(result)[size-1] == 0)) {
-         size--;
-     }
--#if PY_VERSION_HEX >= 0x030900A4
--    Py_SET_SIZE(result, size);
--#else
--    Py_SIZE(result) = size;
--#endif
- 
--    if (negative) {
--#if PY_VERSION_HEX >= 0x030900A4
--        Py_SET_SIZE(result, - Py_SIZE(result));
--#else
--        Py_SIZE(result) = - Py_SIZE(result);
--#endif
--    }
-+    _PyLong_SetSignAndDigitCount(result, negative, size);
-     return (PyObject*)result;
- }
- 
-@@ -476,33 +442,24 @@ GMPy_XMPZ_From_PyIntOrLong(PyObject *obj, CTXT_Object *context)
-     }
- #endif
- 
--    switch (Py_SIZE(templong)) {
--    case -1:
--        mpz_set_si(result->z, -(sdigit)templong->ob_digit[0]);
-+    len = _PyLong_DigitCount(templong);
-+    negative = _PyLong_IsNegative(templong);
-+
-+    switch (len) {
-+    case 1:
-+        mpz_set_si(result->z, (sdigit)GET_OB_DIGIT(templong)[0]);
-         break;
-     case 0:
-         mpz_set_si(result->z, 0);
-         break;
--    case 1:
--        mpz_set_si(result->z, templong->ob_digit[0]);
--        break;
-     default:
--        mpz_set_si(result->z, 0);
--
--        if (Py_SIZE(templong) < 0) {
--            len = - Py_SIZE(templong);
--            negative = 1;
--        } else {
--            len = Py_SIZE(templong);
--            negative = 0;
--        }
--
--        mpz_import(result->z, len, -1, sizeof(templong->ob_digit[0]), 0,
--                   sizeof(templong->ob_digit[0])*8 - PyLong_SHIFT, templong->ob_digit);
-+        mpz_import(result->z, len, -1, sizeof(GET_OB_DIGIT(templong)[0]), 0,
-+                   sizeof(GET_OB_DIGIT(templong)[0])*8 - PyLong_SHIFT,
-+                   GET_OB_DIGIT(templong));
-+    }
- 
--        if (negative) {
--            mpz_neg(result->z, result->z);
--        }
-+    if (negative) {
-+        mpz_neg(result->z, result->z);
-     }
-     return result;
- }
-@@ -639,7 +596,7 @@ GMPy_MPQ_From_PyStr(PyObject *s, int base, CTXT_Object *context)
-     }
- 
-     cp = PyBytes_AsString(ascii_str);
--    
-+
-     {
-         char *whereslash = strchr((char*)cp, '/');
-         char *wheredot = strchr((char*)cp, '.');
-diff --git a/src/gmpy2_convert_utils.c b/src/gmpy2_convert_utils.c
-index d676eaf..8908d17 100644
---- a/src/gmpy2_convert_utils.c
-+++ b/src/gmpy2_convert_utils.c
-@@ -123,7 +123,7 @@ static unsigned long
- GMPy_Integer_AsUnsignedLongWithType_v2(PyObject *x, int xtype)
- {
-     if IS_TYPE_PyInteger(xtype) {
--        if (Py_SIZE(x) < 0) {
-+        if (_PyLong_IsNegative(((PyLongObject*)x))) {
-             VALUE_ERROR("n must be > 0");
-             return (unsigned long)-1;
-         }
diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.1.5.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.2.1.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-gmpy2_2.1.5.bb
rename to meta-python/recipes-devtools/python/python3-gmpy2_2.2.1.bb
index d9e9bd50e..15599bfad 100644
--- a/meta-python/recipes-devtools/python/python3-gmpy2_2.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.2.1.bb
@@ -6,10 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 DEPENDS += "gmp mpfr libmpc"
 
-PYPI_PACKAGE = "gmpy2"
-SRC_URI[sha256sum] = "bc297f1fd8c377ae67a4f493fc0f926e5d1b157e5c342e30a4d84dc7b9f95d96"
+SRC_URI[sha256sum] = "e83e07567441b78cb87544910cb3cc4fe94e7da987e93ef7622e76fb96650432"
 
-inherit pypi setuptools3 python3native
-SRC_URI += "file://0001-src-fix-python-3.12-builds.patch"
+inherit pypi python_setuptools_build_meta python3native
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


