Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F6EC5DF8E
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 04:35:39 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.684.1787286936895101225
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 21:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U2yGKtzu;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38759bcd877so627697a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 21:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787286936; x=1787891736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYyT51OdRxkmfyI2OqNMQEAD95nfD64NcEtSTHvndcw=;
        b=U2yGKtzuVdMLntLwH6wkZrVNDCPwLeZ+VXEnStO6ZshAzYhyY3otNRE398yzXRK6/d
         AIg35Br1vbLwZ6ZBov3LAz4ZuafW0ShWQ6iuVzSvAZWRv/gjyIYVAjyNTwl5R87Yd2mK
         Q5ZV0EKS2DZgRn2UXes+EF05JDg/L4uR9CCE76F1LuqYJ2jnVaM28FudvhuXOXyu4sFj
         JtP+bwrCC+4Wo7rrnyqG7x7QIafflTfDuenfS+SHEXw47wH/1UtSK9JIJl0sVTQ4msFa
         7dO+kj9VRXPQ3N4X3vLGSIjV6xzXAMvWum8Lmg9T3E8jJud875rxKE10tx4hP5J6wKq8
         z7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787286936; x=1787891736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JYyT51OdRxkmfyI2OqNMQEAD95nfD64NcEtSTHvndcw=;
        b=WpEoBL0t5tgOWLqjooFyCELkatcPd3wdjkejNIEF2aezGEmbMnY6XGS99PyYueZWnw
         eibDtDmG/hi4/hgn4Tl284+FV8GqxD6hxn+H4nkMNdiaxCy60S/851CyBJX9L//JIe97
         BuBmwwLatb7nCv+4OmZGiYc0Ao075vTW8BG9NQADmDU0pSWIZrmUC/2C6UZPqpn5ayuG
         y39xfiK6l6BWJvH+Xo6K183Gra7RQPXjhF8+XSbyNlw3clTO1niwM5nJGdLariBGujcI
         iUlYHUPE0QJuSPhiOXyU9jECojLPWvnk4LEAwJ2XHj/WdePhFFe9ZJI48nSKUo+sZI21
         y14w==
X-Gm-Message-State: AFuF++kv7ONR+ATwcag2nxYYdqqQ1Ak+NFq87ORaFbHeFEhw2Rt/lT9J
	taV/s4bVQrsySYn16sF+LMQWr4bTdiCWY8x3DTh1Z/5QyMRZqGnuRkilTXeeBQ==
X-Gm-Gg: AR+sD136JmLGag7KAfVbZeAVQjUeeit+3Ouw5YQTnFG0YJOo2xwejZf3zV3YEN2rwMO
	HMW8sDACIoMV85OXYM93dtbo0AJaSKvQAMMTraeFMHYKi0siKdtnEPCH4geJiBo7RTs/Y0QdtGs
	mixc9JLYRJmkxWqsY+bn9/WfzPl0ZMwgaI6MHK1iItom57N9mrFTmI+NzRSY8HH8MkrcrLnxY+a
	QukYGulk/DBhXkupT1Pggv50v8UJKDF2CTpPfFq0R0CGgPjTmEoQvv/U6Kcdj2C+OSYL/l5312i
	medEj3Sd1/nkbcZfsE5YLEmaXYEZUp9h29xKh1fS7u/ECcTDNSLnQAeR8WNbkUOuixUdLP2SdiR
	JTezOgmCscNFePG4o3bX5stItVoc1IQKutswoxDHlP+MzCcoL7Me8rP+tUhHH7g6RiuBXf7d7wP
	5VFKtyRrkLZCrlOe3krFxSu0bpIvb8ZQozN+vXY0nlSaZUjTSGqUsRKEQ1ts9d5Va+YNZ7YJKY6
	soZCIrN
X-Received: by 2002:a17:90b:2747:b0:380:540:d499 with SMTP id 98e67ed59e1d1-395c33cd87dmr7098929a91.6.1787286936211;
        Thu, 20 Aug 2026 21:35:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([161.29.95.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm23626097eec.7.2026.08.20.21.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:35:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/15] cjose: upgrade 0.6.2.7 -> 0.6.2.8
Date: Fri, 21 Aug 2026 16:35:11 +1200
Message-ID: <20260821043525.448011-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
References: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 04:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129397

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Drop patch that is part of the upstream version.

Changelog:
https://github.com/OpenIDC/cjose/releases/tag/v0.6.2.8

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-the-decoded-buffer-lengths-up-front.patch | 149 ------------------
 .../{cjose_0.6.2.7.bb => cjose_0.6.2.8.bb}    |   6 +-
 2 files changed, 2 insertions(+), 153 deletions(-)
 delete mode 100644 meta-oe/recipes-support/cjose/cjose/0001-jwk-initialize-the-decoded-buffer-lengths-up-front.patch
 rename meta-oe/recipes-support/cjose/{cjose_0.6.2.7.bb => cjose_0.6.2.8.bb} (66%)

diff --git a/meta-oe/recipes-support/cjose/cjose/0001-jwk-initialize-the-decoded-buffer-lengths-up-front.patch b/meta-oe/recipes-support/cjose/cjose/0001-jwk-initialize-the-decoded-buffer-lengths-up-front.patch
deleted file mode 100644
index eace7b659f..0000000000
--- a/meta-oe/recipes-support/cjose/cjose/0001-jwk-initialize-the-decoded-buffer-lengths-up-front.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From 5e8337d3c0ad2b19b78098f72814fbe2442226c9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 5 Aug 2026 19:27:04 +0000
-Subject: [PATCH] jwk: initialize the decoded buffer lengths up front
-
-_cjose_jwk_import_EC() and _cjose_jwk_import_RSA() declare their
-*_buflen variables in the middle of the function, interleaved with
-error paths that goto the shared cleanup label. When an early decode
-fails, the goto jumps over the remaining declarations and the cleanup
-block then reads them uninitialized:
-
-| jwk.c:1501:9: error: variable 'dq_buflen' is used uninitialized
-|                whenever 'if' condition is true
-|                [-Werror,-Wsometimes-uninitialized]
-| jwk.c:1554:39: note: uninitialized use occurs here
-|     _cjose_cleanse_dealloc(dq_buffer, dq_buflen);
-
-_cjose_cleanse_dealloc() uses the length to wipe key material, so this
-is a real out-of-bounds write hazard on the error path, not just a
-warning. src/Makefile.am builds with -Werror, so it also breaks the
-build with clang.
-
-Declare the lengths alongside the buffers they pair with and assign
-them where they were previously initialized.
-
-Upstream-Status: Submitted [https://github.com/OpenIDC/cjose/pull/32]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/jwk.c | 25 ++++++++++++++-----------
- 1 file changed, 14 insertions(+), 11 deletions(-)
-
-diff --git a/src/jwk.c b/src/jwk.c
-index 9c57a0b..58f872b 100644
---- a/src/jwk.c
-+++ b/src/jwk.c
-@@ -1371,6 +1371,9 @@ static cjose_jwk_t *_cjose_jwk_import_EC(json_t *jwk_json, cjose_err *err)
-     uint8_t *x_buffer = NULL;
-     uint8_t *y_buffer = NULL;
-     uint8_t *d_buffer = NULL;
-+    size_t x_buflen = 0;
-+    size_t y_buflen = 0;
-+    size_t d_buflen = 0;
-
-     // get the value of the crv attribute
-     const char *crv_str = _get_json_object_string_attribute(jwk_json, CJOSE_JWK_CRV_STR, err);
-@@ -1389,7 +1392,7 @@ static cjose_jwk_t *_cjose_jwk_import_EC(json_t *jwk_json, cjose_err *err)
-     }
-
-     // get the decoded value of the x coordinate
--    size_t x_buflen = (size_t)_ec_size_for_curve(crv, err);
-+    x_buflen = (size_t)_ec_size_for_curve(crv, err);
-     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_X_STR, &x_buffer, &x_buflen, err))
-     {
-         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
-@@ -1397,7 +1400,7 @@ static cjose_jwk_t *_cjose_jwk_import_EC(json_t *jwk_json, cjose_err *err)
-     }
-
-     // get the decoded value of the y coordinate
--    size_t y_buflen = (size_t)_ec_size_for_curve(crv, err);
-+    y_buflen = (size_t)_ec_size_for_curve(crv, err);
-     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_Y_STR, &y_buffer, &y_buflen, err))
-     {
-         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
-@@ -1405,7 +1408,7 @@ static cjose_jwk_t *_cjose_jwk_import_EC(json_t *jwk_json, cjose_err *err)
-     }
-
-     // get the decoded value of the private key d
--    size_t d_buflen = (size_t)_ec_size_for_curve(crv, err);
-+    d_buflen = (size_t)_ec_size_for_curve(crv, err);
-     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_D_STR, &d_buffer, &d_buflen, err))
-     {
-         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
-@@ -1455,9 +1458,16 @@ static cjose_jwk_t *_cjose_jwk_import_RSA(json_t *jwk_json, cjose_err *err)
-     uint8_t *dp_buffer = NULL;
-     uint8_t *dq_buffer = NULL;
-     uint8_t *qi_buffer = NULL;
-+    size_t n_buflen = 0;
-+    size_t e_buflen = 0;
-+    size_t d_buflen = 0;
-+    size_t p_buflen = 0;
-+    size_t q_buflen = 0;
-+    size_t dp_buflen = 0;
-+    size_t dq_buflen = 0;
-+    size_t qi_buflen = 0;
-
-     // get the decoded value of n (buflen = 0 means no particular expected len)
--    size_t n_buflen = 0;
-     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_N_STR, &n_buffer, &n_buflen, err))
-     {
-         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
-@@ -1465,7 +1475,6 @@ static cjose_jwk_t *_cjose_jwk_import_RSA(json_t *jwk_json, cjose_err *err)
-     }
-
-     // get the decoded value of e
--    size_t e_buflen = 0;
-     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_E_STR, &e_buffer, &e_buflen, err))
-     {
-         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
-@@ -1473,7 +1482,6 @@ static cjose_jwk_t *_cjose_jwk_import_RSA(json_t *jwk_json, cjose_err *err)
-     }
-
-     // get the decoded value of d
--    size_t d_buflen = 0;
-     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_D_STR, &d_buffer, &d_buflen, err))
-     {
-         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
-@@ -1481,7 +1489,6 @@ static cjose_jwk_t *_cjose_jwk_import_RSA(json_t *jwk_json, cjose_err *err)
-     }
-
-     // get the decoded value of p
--    size_t p_buflen = 0;
-     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_P_STR, &p_buffer, &p_buflen, err))
-     {
-         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
-@@ -1489,7 +1496,6 @@ static cjose_jwk_t *_cjose_jwk_import_RSA(json_t *jwk_json, cjose_err *err)
-     }
-
-     // get the decoded value of q
--    size_t q_buflen = 0;
-     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_Q_STR, &q_buffer, &q_buflen, err))
-     {
-         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
-@@ -1497,7 +1503,6 @@ static cjose_jwk_t *_cjose_jwk_import_RSA(json_t *jwk_json, cjose_err *err)
-     }
-
-     // get the decoded value of dp
--    size_t dp_buflen = 0;
-     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_DP_STR, &dp_buffer, &dp_buflen, err))
-     {
-         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
-@@ -1505,7 +1510,6 @@ static cjose_jwk_t *_cjose_jwk_import_RSA(json_t *jwk_json, cjose_err *err)
-     }
-
-     // get the decoded value of dq
--    size_t dq_buflen = 0;
-     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_DQ_STR, &dq_buffer, &dq_buflen, err))
-     {
-         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
-@@ -1513,7 +1517,6 @@ static cjose_jwk_t *_cjose_jwk_import_RSA(json_t *jwk_json, cjose_err *err)
-     }
-
-     // get the decoded value of qi
--    size_t qi_buflen = 0;
-     if (!_decode_json_object_base64url_attribute(jwk_json, CJOSE_JWK_QI_STR, &qi_buffer, &qi_buflen, err))
-     {
-         CJOSE_ERROR(err, CJOSE_ERR_INVALID_ARG);
---
-2.43.0
-
diff --git a/meta-oe/recipes-support/cjose/cjose_0.6.2.7.bb b/meta-oe/recipes-support/cjose/cjose_0.6.2.8.bb
similarity index 66%
rename from meta-oe/recipes-support/cjose/cjose_0.6.2.7.bb
rename to meta-oe/recipes-support/cjose/cjose_0.6.2.8.bb
index 4538d33ef6..492ee0d143 100644
--- a/meta-oe/recipes-support/cjose/cjose_0.6.2.7.bb
+++ b/meta-oe/recipes-support/cjose/cjose_0.6.2.8.bb
@@ -3,11 +3,9 @@ HOMEPAGE = "https://github.com/OpenIDC/cjose"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7249e2f9437adfb8c88d870438042f0e"
 
-SRC_URI = "git://github.com/OpenIDC/cjose;protocol=https;branch=version-0.6.2.x;tag=v${PV} \
-           file://0001-jwk-initialize-the-decoded-buffer-lengths-up-front.patch \
-           "
+SRC_URI = "git://github.com/OpenIDC/cjose;protocol=https;branch=version-0.6.2.x;tag=v${PV}"
 
-SRCREV = "10af8915a666b50caa5500cdc3f2523b916be720"
+SRCREV = "e787ace6a203d483038a793fd58f958a2f9b48c1"
 
 DEPENDS = "openssl libcheck jansson"
 

