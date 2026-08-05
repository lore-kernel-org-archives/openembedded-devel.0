Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F24DC561E6
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 21:26:21 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6106.1785965179241242415
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 14:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ausK7kvG;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbe3fed2f58so1233075a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 14:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785965179; x=1786569979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=am69Zl6c9X7OKQcnmcDDOCqJhLtAuqm9gwewp3ty2KA=;
        b=ausK7kvG7/o/kP/eeAmbgG85s8yVLpmoYhZIsbvL2fF3+4l22ae0sggC/Y+QiZOrDZ
         NZrIsd9iCiE5pCVehbUczLXCHHXu6CemJKJA9aaPYTFe2syXsCXwaQGXvHooHZsebY3i
         5VEEOSnxmzz+AixJMWO2YhlmiNNUUJ1KYIJztKuuCmO8DK9BZz4fsh0aySpqmgrlO5EF
         fxQP9B7UzI9x8utgpLypNeQ7uaDfREUZNO6DtK34sS5QMQLu6yMqepl/H2+xL75DBNp8
         A5bfgmZ40RkUkGX4RKb904+Zos927AUEaYNbqqAN5AVSbrALpypPpBXEORUI9iLLB+qz
         y3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785965179; x=1786569979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=am69Zl6c9X7OKQcnmcDDOCqJhLtAuqm9gwewp3ty2KA=;
        b=tRMRoNca1OGH3X2o2RCIAz3dMjv9Sk1z/o5flOcp0dGwOIRxWGP2tOV2MkzTUpb+ab
         n4O9eNTa5lfmHsaxKb1i+Op4My6bi0VO5mxLJNUnruYOHi5hiEndHHD+EmxWD29P3UjI
         L/Z2r/aikWjhxsu5GgwTDzl9rVH/7oTLblW7Fi7lDdvWKRbgwzHRvUqlNKEPJvAMR0gI
         TnGpVp5zUeKQeCRem4/Dmx4mKDm03qagzOeyBgTJcZPSTCOr9DiUGr1oEP0XmbiCjbNQ
         FfV3JokYogaAadtYN5wauKZW4pZXyt9TptYQpGwx/d7RyqiFzgjgx/+qJ6nA9xcvpwz1
         mPKg==
X-Gm-Message-State: AOJu0YwoWvEMnqWVJtrw5n83GYA1eZH55uDn8IPefcvb2UrF75rzc91z
	FaHCThx8e2D8bueubB3kqU3oF9/6nY2IsbpiWSghF1ucB21EJNkEC+dT4ORtIJ3I
X-Gm-Gg: AR+sD13NGtpj/Y1ybA4iPZ57mumzcgHgVS9VZ02sYMaWZyY00no4rDPJ+VSV0Scs2Cm
	LFS2TXEYBQ7QQC5AJjRM7UBt3TtUwuqvR+7rdrVQNHTnz5oACjt1LC7O0DY3RYQWb0kyAV3casP
	y8cjGbBDnLSGoyKrNtwvRZB2jqnlL6m9XYs/R18run+1oW+739QwKTKagLEi26Dy9qmGoIrJ9tE
	aATAxTDWyD6fntNqd2OsF7+5dfrxheMI0iMGwDcRRnreHzNYjlz9GSbUxNUi1SveHoikvD5Vz6B
	NI0s3mI8BfvpLiZ4hAshwFOKRr6WvL7RjwVM5gQjP3BDxsmBDYic1NDk1h8cSySwhGiDf7R3frX
	inNj8WOn2u0XvNYa2XgBoMYzMWFhqqGSo1t+osvKuQxtTACLVRbaCio9X18+Wl0jux6i3QI59Wo
	yjd6oX4TP7QkcFKa6sjZqT5deMw/Qaw++KO/dSUqGoaShk859peO66IvOYOm4SDJjE5lhkN2pOB
	9dibUQmNfB/JRPw6rOGmdN74144N90LMtHzURVDp5RAkRm7Cshm0bdv2Sx8YMvgcm1Fa7MwKmN2
	5ZaLNIzcCMSqU8SzezwVMaAxRGVAH25j0a4pOARdBU9OCbSK6NK1tZ8B4Mxsm+hkAQ1IPR6Cqia
	BSA==
X-Received: by 2002:a05:6a21:70c8:b0:3c3:b226:f165 with SMTP id adf61e73a8af0-3cb8603af69mr11093944637.35.1785965178491;
        Wed, 05 Aug 2026 14:26:18 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be4dsm25585093eec.16.2026.08.05.14.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 14:26:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/3] cjose: Fix build with clang by initializing decoded buffer lengths
Date: Wed,  5 Aug 2026 14:26:12 -0700
Message-ID: <20260805212612.1351211-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805212612.1351211-1-khem.raj@oss.qualcomm.com>
References: <20260805212612.1351211-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 21:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128825

_cjose_jwk_import_RSA() and _cjose_jwk_import_EC() declare their
*_buflen variables in the middle of the function, interleaved with error
paths that goto a shared cleanup label. An early decode failure jumps
over the remaining declarations, and the cleanup block then reads them
uninitialized:

| jwk.c:1501:9: error: variable 'dq_buflen' is used uninitialized
|                whenever 'if' condition is true
|                [-Werror,-Wsometimes-uninitialized]
| jwk.c:1554:39: note: uninitialized use occurs here
|     _cjose_cleanse_dealloc(dq_buffer, dq_buflen);

_cjose_cleanse_dealloc() uses the length to wipe key material, so this
is an out-of-bounds write hazard on the error path rather than just a
warning. src/Makefile.am builds with -Werror, so clang also makes it
fatal; the 0.6.2.4 -> 0.6.2.7 upgrade exposed it.

Verified on aarch64 for qemuarm64: do_compile fails before the change
with 20 such errors, and do_compile and do_package succeed after.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-the-decoded-buffer-lengths-up-front.patch | 149 ++++++++++++++++++
 .../recipes-support/cjose/cjose_0.6.2.7.bb    |   4 +-
 2 files changed, 152 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/cjose/cjose/0001-jwk-initialize-the-decoded-buffer-lengths-up-front.patch

diff --git a/meta-oe/recipes-support/cjose/cjose/0001-jwk-initialize-the-decoded-buffer-lengths-up-front.patch b/meta-oe/recipes-support/cjose/cjose/0001-jwk-initialize-the-decoded-buffer-lengths-up-front.patch
new file mode 100644
index 0000000000..eace7b659f
--- /dev/null
+++ b/meta-oe/recipes-support/cjose/cjose/0001-jwk-initialize-the-decoded-buffer-lengths-up-front.patch
@@ -0,0 +1,149 @@
+From 5e8337d3c0ad2b19b78098f72814fbe2442226c9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Aug 2026 19:27:04 +0000
+Subject: [PATCH] jwk: initialize the decoded buffer lengths up front
+
+_cjose_jwk_import_EC() and _cjose_jwk_import_RSA() declare their
+*_buflen variables in the middle of the function, interleaved with
+error paths that goto the shared cleanup label. When an early decode
+fails, the goto jumps over the remaining declarations and the cleanup
+block then reads them uninitialized:
+
+| jwk.c:1501:9: error: variable 'dq_buflen' is used uninitialized
+|                whenever 'if' condition is true
+|                [-Werror,-Wsometimes-uninitialized]
+| jwk.c:1554:39: note: uninitialized use occurs here
+|     _cjose_cleanse_dealloc(dq_buffer, dq_buflen);
+
+_cjose_cleanse_dealloc() uses the length to wipe key material, so this
+is a real out-of-bounds write hazard on the error path, not just a
+warning. src/Makefile.am builds with -Werror, so it also breaks the
+build with clang.
+
+Declare the lengths alongside the buffers they pair with and assign
+them where they were previously initialized.
+
+Upstream-Status: Submitted [https://github.com/OpenIDC/cjose/pull/32]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/jwk.c | 25 ++++++++++++++-----------
+ 1 file changed, 14 insertions(+), 11 deletions(-)
+
+diff --git a/src/jwk.c b/src/jwk.c
+index 9c57a0b..58f872b 100644
+--- a/src/jwk.c
++++ b/src/jwk.c
+@@ -1371,6 +1371,9 @@ static cjose_jwk_t *_cjose_jwk_import_EC(json_t *jwk_json, cjose_err *err)
+     uint8_t *x_buffer = NULL;
+     uint8_t *y_buffer = NULL;
+     uint8_t *d_buffer = NULL;
++    size_t x_buflen = 0;
++    size_t y_buflen = 0;
++    size_t d_buflen = 0;
+
+     // get the value of the crv attribute
+     const char *crv_str = _get_json_object_string_attribute(jwk_json, CJOSE_JWK_CRV_STR, err);
+@@ -1389,7 +1392,7 @@ static cjose_jwk_t *_cjose_jwk_import_EC(json_t *jwk_json, cjose_err *err)
+     }
+
+     // get the decoded value of the x coordinate
+-    size_t x_buflen = (size_t)_ec_size_for_curve(crv, err);
++    x_buflen = (size_t)_ec_size_for_curve(crv, err);
+     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_X_STR, &x_buffer, &x_buflen, err))
+     {
+         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
+@@ -1397,7 +1400,7 @@ static cjose_jwk_t *_cjose_jwk_import_EC(json_t *jwk_json, cjose_err *err)
+     }
+
+     // get the decoded value of the y coordinate
+-    size_t y_buflen = (size_t)_ec_size_for_curve(crv, err);
++    y_buflen = (size_t)_ec_size_for_curve(crv, err);
+     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_Y_STR, &y_buffer, &y_buflen, err))
+     {
+         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
+@@ -1405,7 +1408,7 @@ static cjose_jwk_t *_cjose_jwk_import_EC(json_t *jwk_json, cjose_err *err)
+     }
+
+     // get the decoded value of the private key d
+-    size_t d_buflen = (size_t)_ec_size_for_curve(crv, err);
++    d_buflen = (size_t)_ec_size_for_curve(crv, err);
+     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_D_STR, &d_buffer, &d_buflen, err))
+     {
+         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
+@@ -1455,9 +1458,16 @@ static cjose_jwk_t *_cjose_jwk_import_RSA(json_t *jwk_json, cjose_err *err)
+     uint8_t *dp_buffer = NULL;
+     uint8_t *dq_buffer = NULL;
+     uint8_t *qi_buffer = NULL;
++    size_t n_buflen = 0;
++    size_t e_buflen = 0;
++    size_t d_buflen = 0;
++    size_t p_buflen = 0;
++    size_t q_buflen = 0;
++    size_t dp_buflen = 0;
++    size_t dq_buflen = 0;
++    size_t qi_buflen = 0;
+
+     // get the decoded value of n (buflen = 0 means no particular expected len)
+-    size_t n_buflen = 0;
+     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_N_STR, &n_buffer, &n_buflen, err))
+     {
+         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
+@@ -1465,7 +1475,6 @@ static cjose_jwk_t *_cjose_jwk_import_RSA(json_t *jwk_json, cjose_err *err)
+     }
+
+     // get the decoded value of e
+-    size_t e_buflen = 0;
+     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_E_STR, &e_buffer, &e_buflen, err))
+     {
+         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
+@@ -1473,7 +1482,6 @@ static cjose_jwk_t *_cjose_jwk_import_RSA(json_t *jwk_json, cjose_err *err)
+     }
+
+     // get the decoded value of d
+-    size_t d_buflen = 0;
+     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_D_STR, &d_buffer, &d_buflen, err))
+     {
+         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
+@@ -1481,7 +1489,6 @@ static cjose_jwk_t *_cjose_jwk_import_RSA(json_t *jwk_json, cjose_err *err)
+     }
+
+     // get the decoded value of p
+-    size_t p_buflen = 0;
+     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_P_STR, &p_buffer, &p_buflen, err))
+     {
+         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
+@@ -1489,7 +1496,6 @@ static cjose_jwk_t *_cjose_jwk_import_RSA(json_t *jwk_json, cjose_err *err)
+     }
+
+     // get the decoded value of q
+-    size_t q_buflen = 0;
+     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_Q_STR, &q_buffer, &q_buflen, err))
+     {
+         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
+@@ -1497,7 +1503,6 @@ static cjose_jwk_t *_cjose_jwk_import_RSA(json_t *jwk_json, cjose_err *err)
+     }
+
+     // get the decoded value of dp
+-    size_t dp_buflen = 0;
+     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_DP_STR, &dp_buffer, &dp_buflen, err))
+     {
+         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
+@@ -1505,7 +1510,6 @@ static cjose_jwk_t *_cjose_jwk_import_RSA(json_t *jwk_json, cjose_err *err)
+     }
+
+     // get the decoded value of dq
+-    size_t dq_buflen = 0;
+     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_DQ_STR, &dq_buffer, &dq_buflen, err))
+     {
+         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
+@@ -1513,7 +1517,6 @@ static cjose_jwk_t *_cjose_jwk_import_RSA(json_t *jwk_json, cjose_err *err)
+     }
+
+     // get the decoded value of qi
+-    size_t qi_buflen = 0;
+     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_QI_STR, &qi_buffer, &qi_buflen, err))
+     {
+         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
+--
+2.43.0
+
diff --git a/meta-oe/recipes-support/cjose/cjose_0.6.2.7.bb b/meta-oe/recipes-support/cjose/cjose_0.6.2.7.bb
index b35cf349f1..4538d33ef6 100644
--- a/meta-oe/recipes-support/cjose/cjose_0.6.2.7.bb
+++ b/meta-oe/recipes-support/cjose/cjose_0.6.2.7.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/OpenIDC/cjose"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7249e2f9437adfb8c88d870438042f0e"

-SRC_URI = "git://github.com/OpenIDC/cjose;protocol=https;branch=version-0.6.2.x;tag=v${PV}"
+SRC_URI = "git://github.com/OpenIDC/cjose;protocol=https;branch=version-0.6.2.x;tag=v${PV} \
+           file://0001-jwk-initialize-the-decoded-buffer-lengths-up-front.patch \
+           "

 SRCREV = "10af8915a666b50caa5500cdc3f2523b916be720"


