Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9F5C4707B
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.218944.1704025422060381305
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OxuVKjBm;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40d5b159350so41223005e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025420; x=1704630220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=towHQuLyDqvJD+G7pjJB4hOSk1A+0XmK8mqEW9Rn4D4=;
        b=OxuVKjBm39gq0CSNJ7RVmIxMqqbn4s02srbFWYHIFDfQwAzbqg8YzsAPekRfTA8rXA
         L1jZLaiZQ86eRp8Xx0jt/TCOViUZTbN99B9G8YtL+t96Sx5N5jZB9Jkg1Vvr12mO+P4Q
         EOOCEvr/YDZRTOPx7U3JW+yzqBJQNfJov57wNjcb+LsBqx6y2YsWDTiw6z1n5JUMibOx
         u666ZdjqbwXzryDuyRElMM/ZZ9wW6Gyx6S2ssLfGXL3qbH7vIJi4dT0mBpgdFrGSdMiB
         sPO33CrQsnbDFKujak3W2kVzPpzKR7Rix6zyC1NMvJRhMnDLhP798+kPWgK0+BoBUrIW
         wOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025420; x=1704630220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=towHQuLyDqvJD+G7pjJB4hOSk1A+0XmK8mqEW9Rn4D4=;
        b=PAabeqU/aC/vvfrWgW9rThN9FkSLorSQMFZUSFUfxksUAr27iAFB4kaNeuSG6ypHUG
         HeEEGbDPYiqvMvfI/FKFctCv/v8RsnsHAtpQIdPIaUvaQNmcbWYyQkzJXQuGkEZUAJfU
         SVhMsKOj44lXrz4QFrh2GfMy58Ufh++2rGLQnzVP4Cklon3epdWBMBXZzNr/WWiFkbxw
         pjZ0c3D0HdqpjYdFtmvggs7zAKdZ0ri8jjLr4E/IpPXZ/qeyoQjZXPxvVl0w+WHwulsq
         pjz38/e2tmMmyaXX+P/WYu+yr44F6zDNljpuWbbUh/TOsMB75OXfzEYScxu+aHbb6OGj
         mdOw==
X-Gm-Message-State: AOJu0YxVX/HMYAZdtMKQB+RqlG/rBNVtxGx9xUwh+upq4dINQRCap7dW
	Q1jVYoLproxNVBGCA4gQYSwELWZsUPU=
X-Google-Smtp-Source: AGHT+IH1ciaDzuvi2nzdz0OynZVeDgDRcJUKakly4EDUQTaWAr1dRVujci/fRKutXSmCzw1bNo2dfw==
X-Received: by 2002:a05:600c:705:b0:40d:47b5:8e3 with SMTP id i5-20020a05600c070500b0040d47b508e3mr6954849wmn.31.1704025420483;
        Sun, 31 Dec 2023 04:23:40 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/23] python3-gmpy2: fix python 3.12 issues
Date: Sun, 31 Dec 2023 13:23:15 +0100
Message-Id: <20231231122329.405225-9-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107960

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-src-fix-python-3.12-builds.patch     | 263 ++++++++++++++++++
 .../python/python3-gmpy2_2.1.5.bb             |   1 +
 2 files changed, 264 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-gmpy2/0001-src-fix-python-3.12-builds.patch

diff --git a/meta-python/recipes-devtools/python/python3-gmpy2/0001-src-fix-python-3.12-builds.patch b/meta-python/recipes-devtools/python/python3-gmpy2/0001-src-fix-python-3.12-builds.patch
new file mode 100644
index 000000000..1171322e2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gmpy2/0001-src-fix-python-3.12-builds.patch
@@ -0,0 +1,263 @@
+From 43f132103cedfd92b85173bcdacfbabd5916d9fc Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 27 Dec 2023 14:52:16 +0100
+Subject: [PATCH] src: fix python 3.12 builds
+
+This is a backport for 3.1.x versions provided separately in https://github.com/aleaxit/gmpy/issues/446
+
+Upstream-Status: Inappropriate [can be dropped when 2.2.x is released]
+
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/gmpy2_convert.h       |  21 +++++++
+ src/gmpy2_convert_gmp.c   | 129 +++++++++++++-------------------------
+ src/gmpy2_convert_utils.c |   2 +-
+ 3 files changed, 65 insertions(+), 87 deletions(-)
+
+diff --git a/src/gmpy2_convert.h b/src/gmpy2_convert.h
+index f887d47..3e8cb2b 100644
+--- a/src/gmpy2_convert.h
++++ b/src/gmpy2_convert.h
+@@ -142,6 +142,27 @@ extern "C" {
+ #define IS_TYPE_COMPLEX_ONLY(x)     ((x > OBJ_TYPE_REAL) && \
+                                      (x < OBJ_TYPE_COMPLEX))
+ 
++/* Compatibility macros (to work with PyLongObject internals).
++ */
++
++#if PY_VERSION_HEX >= 0x030C0000
++#  define TAG_FROM_SIGN_AND_SIZE(is_neg, size) ((is_neg?2:(size==0)) | (((size_t)size) << 3))
++#  define _PyLong_SetSignAndDigitCount(obj, is_neg, size) (obj->long_value.lv_tag = TAG_FROM_SIGN_AND_SIZE(is_neg, size))
++#elif PY_VERSION_HEX >= 0x030900A4
++#  define _PyLong_SetSignAndDigitCount(obj, is_neg, size) (Py_SET_SIZE(obj, (is_neg?-1:1)*size))
++#else
++#  define _PyLong_SetSignAndDigitCount(obj, is_neg, size) (Py_SIZE(obj) = (is_neg?-1:1)*size)
++#endif
++
++#if PY_VERSION_HEX >= 0x030C0000
++#  define GET_OB_DIGIT(obj) obj->long_value.ob_digit
++#  define _PyLong_IsNegative(obj) ((obj->long_value.lv_tag & 3) == 2)
++#  define _PyLong_DigitCount(obj) (obj->long_value.lv_tag >> 3)
++#else
++#  define GET_OB_DIGIT(obj) obj->ob_digit
++#  define _PyLong_IsNegative(obj) (Py_SIZE(obj) < 0)
++#  define _PyLong_DigitCount(obj) (_PyLong_IsNegative(obj)? -Py_SIZE(obj):Py_SIZE(obj))
++#endif
+ 
+ /* Since the macros are used in gmpy2's codebase, these functions are skipped
+  * until they are needed for the C API in the future.
+diff --git a/src/gmpy2_convert_gmp.c b/src/gmpy2_convert_gmp.c
+index cf0891e..8b8df81 100644
+--- a/src/gmpy2_convert_gmp.c
++++ b/src/gmpy2_convert_gmp.c
+@@ -59,33 +59,24 @@ GMPy_MPZ_From_PyIntOrLong(PyObject *obj, CTXT_Object *context)
+     }
+ #endif
+ 
+-    switch (Py_SIZE(templong)) {
+-    case -1:
+-        mpz_set_si(result->z, -(sdigit)templong->ob_digit[0]);
++    len = _PyLong_DigitCount(templong);
++    negative = _PyLong_IsNegative(templong);
++
++    switch (len) {
++    case 1:
++        mpz_set_si(result->z, (sdigit)GET_OB_DIGIT(templong)[0]);
+         break;
+     case 0:
+         mpz_set_si(result->z, 0);
+         break;
+-    case 1:
+-        mpz_set_si(result->z, templong->ob_digit[0]);
+-        break;
+     default:
+-        mpz_set_si(result->z, 0);
+-
+-        if (Py_SIZE(templong) < 0) {
+-            len = - Py_SIZE(templong);
+-            negative = 1;
+-        } else {
+-            len = Py_SIZE(templong);
+-            negative = 0;
+-        }
+-
+-        mpz_import(result->z, len, -1, sizeof(templong->ob_digit[0]), 0,
+-                   sizeof(templong->ob_digit[0])*8 - PyLong_SHIFT, templong->ob_digit);
++        mpz_import(result->z, len, -1, sizeof(GET_OB_DIGIT(templong)[0]), 0,
++                   sizeof(GET_OB_DIGIT(templong)[0])*8 - PyLong_SHIFT,
++                   GET_OB_DIGIT(templong));
++    }
+ 
+-        if (negative) {
+-            mpz_neg(result->z, result->z);
+-        }
++    if (negative) {
++        mpz_neg(result->z, result->z);
+     }
+     return result;
+ }
+@@ -105,33 +96,24 @@ mpz_set_PyIntOrLong(mpz_t z, PyObject *obj)
+     }
+ #endif
+ 
+-    switch (Py_SIZE(templong)) {
+-    case -1:
+-        mpz_set_si(z, -(sdigit)templong->ob_digit[0]);
++    len = _PyLong_DigitCount(templong);
++    negative = _PyLong_IsNegative(templong);
++
++    switch (len) {
++    case 1:
++        mpz_set_si(z, (sdigit)GET_OB_DIGIT(templong)[0]);
+         break;
+     case 0:
+         mpz_set_si(z, 0);
+         break;
+-    case 1:
+-        mpz_set_si(z, templong->ob_digit[0]);
+-        break;
+     default:
+-        mpz_set_si(z, 0);
+-
+-        if (Py_SIZE(templong) < 0) {
+-            len = - Py_SIZE(templong);
+-            negative = 1;
+-        } else {
+-            len = Py_SIZE(templong);
+-            negative = 0;
+-        }
+-
+-        mpz_import(z, len, -1, sizeof(templong->ob_digit[0]), 0,
+-                   sizeof(templong->ob_digit[0])*8 - PyLong_SHIFT, templong->ob_digit);
++        mpz_import(z, len, -1, sizeof(GET_OB_DIGIT(templong)[0]), 0,
++                   sizeof(GET_OB_DIGIT(templong)[0])*8 - PyLong_SHIFT,
++                   GET_OB_DIGIT(templong));
++    }
+ 
+-        if (negative) {
+-            mpz_neg(z, z);
+-        }
++    if (negative) {
++        mpz_neg(z, z);
+     }
+     return;
+ }
+@@ -186,12 +168,7 @@ GMPy_PyLong_From_MPZ(MPZ_Object *obj, CTXT_Object *context)
+ 
+     /* Assume gmp uses limbs as least as large as the builtin longs do */
+ 
+-    if (mpz_sgn(obj->z) < 0) {
+-        negative = 1;
+-    } else {
+-        negative = 0;
+-    }
+-
++    negative = mpz_sgn(obj->z) < 0;
+     size = (mpz_sizeinbase(obj->z, 2) + PyLong_SHIFT - 1) / PyLong_SHIFT;
+ 
+     if (!(result = _PyLong_New(size))) {
+@@ -200,31 +177,20 @@ GMPy_PyLong_From_MPZ(MPZ_Object *obj, CTXT_Object *context)
+         /* LCOV_EXCL_STOP */
+     }
+ 
+-    mpz_export(result->ob_digit, &count, -1, sizeof(result->ob_digit[0]), 0,
+-               sizeof(result->ob_digit[0])*8 - PyLong_SHIFT, obj->z);
++    mpz_export(GET_OB_DIGIT(result), &count, -1, sizeof(GET_OB_DIGIT(result)[0]), 0,
++               sizeof(GET_OB_DIGIT(result)[0])*8 - PyLong_SHIFT, obj->z);
+ 
+     if (count == 0) {
+-        result->ob_digit[0] = 0;
++        GET_OB_DIGIT(result)[0] = 0;
+     }
+ 
+     /* long_normalize() is file-static so we must reimplement it */
+     /* longobjp = long_normalize(longobjp); */
+-    while ((size>0) && (result->ob_digit[size-1] == 0)) {
++    while ((size>0) && (GET_OB_DIGIT(result)[size-1] == 0)) {
+         size--;
+     }
+-#if PY_VERSION_HEX >= 0x030900A4
+-    Py_SET_SIZE(result, size);
+-#else
+-    Py_SIZE(result) = size;
+-#endif
+ 
+-    if (negative) {
+-#if PY_VERSION_HEX >= 0x030900A4
+-        Py_SET_SIZE(result, - Py_SIZE(result));
+-#else
+-        Py_SIZE(result) = - Py_SIZE(result);
+-#endif
+-    }
++    _PyLong_SetSignAndDigitCount(result, negative, size);
+     return (PyObject*)result;
+ }
+ 
+@@ -476,33 +442,24 @@ GMPy_XMPZ_From_PyIntOrLong(PyObject *obj, CTXT_Object *context)
+     }
+ #endif
+ 
+-    switch (Py_SIZE(templong)) {
+-    case -1:
+-        mpz_set_si(result->z, -(sdigit)templong->ob_digit[0]);
++    len = _PyLong_DigitCount(templong);
++    negative = _PyLong_IsNegative(templong);
++
++    switch (len) {
++    case 1:
++        mpz_set_si(result->z, (sdigit)GET_OB_DIGIT(templong)[0]);
+         break;
+     case 0:
+         mpz_set_si(result->z, 0);
+         break;
+-    case 1:
+-        mpz_set_si(result->z, templong->ob_digit[0]);
+-        break;
+     default:
+-        mpz_set_si(result->z, 0);
+-
+-        if (Py_SIZE(templong) < 0) {
+-            len = - Py_SIZE(templong);
+-            negative = 1;
+-        } else {
+-            len = Py_SIZE(templong);
+-            negative = 0;
+-        }
+-
+-        mpz_import(result->z, len, -1, sizeof(templong->ob_digit[0]), 0,
+-                   sizeof(templong->ob_digit[0])*8 - PyLong_SHIFT, templong->ob_digit);
++        mpz_import(result->z, len, -1, sizeof(GET_OB_DIGIT(templong)[0]), 0,
++                   sizeof(GET_OB_DIGIT(templong)[0])*8 - PyLong_SHIFT,
++                   GET_OB_DIGIT(templong));
++    }
+ 
+-        if (negative) {
+-            mpz_neg(result->z, result->z);
+-        }
++    if (negative) {
++        mpz_neg(result->z, result->z);
+     }
+     return result;
+ }
+@@ -639,7 +596,7 @@ GMPy_MPQ_From_PyStr(PyObject *s, int base, CTXT_Object *context)
+     }
+ 
+     cp = PyBytes_AsString(ascii_str);
+-    
++
+     {
+         char *whereslash = strchr((char*)cp, '/');
+         char *wheredot = strchr((char*)cp, '.');
+diff --git a/src/gmpy2_convert_utils.c b/src/gmpy2_convert_utils.c
+index d676eaf..8908d17 100644
+--- a/src/gmpy2_convert_utils.c
++++ b/src/gmpy2_convert_utils.c
+@@ -123,7 +123,7 @@ static unsigned long
+ GMPy_Integer_AsUnsignedLongWithType_v2(PyObject *x, int xtype)
+ {
+     if IS_TYPE_PyInteger(xtype) {
+-        if (Py_SIZE(x) < 0) {
++        if (_PyLong_IsNegative(((PyLongObject*)x))) {
+             VALUE_ERROR("n must be > 0");
+             return (unsigned long)-1;
+         }
diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.1.5.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.1.5.bb
index 9a66af9a9..d9e9bd50e 100644
--- a/meta-python/recipes-devtools/python/python3-gmpy2_2.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.1.5.bb
@@ -10,5 +10,6 @@ PYPI_PACKAGE = "gmpy2"
 SRC_URI[sha256sum] = "bc297f1fd8c377ae67a4f493fc0f926e5d1b157e5c342e30a4d84dc7b9f95d96"
 
 inherit pypi setuptools3 python3native
+SRC_URI += "file://0001-src-fix-python-3.12-builds.patch"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


