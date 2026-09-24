Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D11C982FD
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:33:42 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.728.1790224420630621001
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lIPJKk1B;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8692a8568e9so789716b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224420; x=1790829220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WPhtXwCjvOyBtO0TJ2wBlznFBwJbVfptGad2ehmvos=;
        b=lIPJKk1Bh4cL+e3E3WtmV7DKcTSR0pno4cy9ApbsknJzgNJ3o+qv9mQPsOkWPX4ThQ
         q9cWq8byxhj3XxpPJVnG1VjrR9vOyaXWguJyZg/96a+QDB//2Ev/fhCZ5QlhSaf6RNUU
         x4Idg4LvwShsKL7UZ+DJr5T5V3TZsEpK94TPKG5OooxUaxwI9tUwdDZpSLb5/apSwF/T
         vCBs0QdXt4LMqt6RgqPrQqqqyRWDooGQ1OfpK87QvhZVydmVOLOMSp65cHVi5I6w05Bh
         qpEYQnbiMFVNkwJYBlr49HNWrjL4+3UL0wvd5KxX3I1iU7FVsGBSNay1LZhXNbArHHI5
         mePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224420; x=1790829220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+WPhtXwCjvOyBtO0TJ2wBlznFBwJbVfptGad2ehmvos=;
        b=0o3Rl1go3nbQFp0WZqX71/7MozQl7Qoh7uLIDOc7F4XuVPtkmCDcamaIQMGLqjfCJE
         9Ta5zzssFWgKTzLPKDtRZOyCLEYnJAgiKb0fSpmX08wmVH5/9M18Ax1DnRLK/id3rG93
         /QkcsAA+dSSYZx8X7guJIZgoaKvokwnbarW7hDiPDCoo+MhFbNmQURWgfgwI/h/4Umdg
         swwc0DoHGqpsN3Rfde+gY0uvpEl9x6h5EvxTQgUXYSemq4wV9uZ889cv2+OL9U93v9GS
         k4sYjjrr6LwUmw94Ynt47nC8bORa5xtbEXkW82uZe5W8UP2j+fF1UFz20iN9qvX2gZak
         XqJA==
X-Gm-Message-State: AFuF++m0kK3pTd3qqdaSLq+d2eNy+FeJ9TGPLEvZizJCYE4emXjiSCCp
	Pf7eNqYRYgaGgQd8EI7olsSOOt+X4qd4rRfvxGMSMw3Kz7dfGtarrorsaw5sFA==
X-Gm-Gg: AYBFou2jgcBPLydgbVc5iU9HMFtun7d68WHDfs+RY9YGUxmYDHgFZF3GcdLf5jWn0zm
	VUAKAfjBn+1cC9ZUHhuWEaRo3Q+J3v972z1ORgMj8WNvhgMtIldqhTUrXYtDpm5NXf2E0l3mmHf
	zk2VxVseFOiBpJTAL41JrlA5g3cy1fBqxTi42/+GcJnJOalfU1NImnxHu+M+SHVIzlglWTVIqWD
	m/YGokYo0y/iuiZgzEMI2cfUbkbXDdwaklMmXwDMZTA8s2FL3wYO9fES2Xd+BSX29ekYCxK9SIf
	liWdH40RUHszmCuuPRI9QNevlh3Uf+VJg2UTvAXLx+1IA5CBlG/072qMVvSpSBoApXPJ/AGSpix
	JtiTw+Kz6cu+RDh/BjhH8+BDC3c55k2mstu7NKxBwwrLUbR72uLGhtL7M0grXrkxl/TPaXPXrdZ
	84tLQ0gl/at9qZOznrWQ/GEq5pp54WIALMKCy4CmvMk//ozjhcHgcKTZic0QSx01YmrF3MuCQQX
	C8JSPLPGt7nIzDyuMiZ4Ow=
X-Received: by 2002:a05:6a00:6ca2:b0:87d:6df6:103 with SMTP id d2e1a72fcca58-87e9f054f68mr989386b3a.34.1790224419948;
        Wed, 23 Sep 2026 21:33:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:33:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 9/24] strongswan: patch CVE-2026-78129
Date: Thu, 24 Sep 2026 16:32:59 +1200
Message-ID: <20260924043315.1663186-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130257

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78129

[1]https://download.strongswan.org/security/CVE-2026-78129/strongswan-5.6.3-6.0.7_pkcs5_params_dos.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78129).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78129.patch           | 155 ++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78129.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78129.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78129.patch
new file mode 100644
index 0000000000..2a6167dd62
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78129.patch
@@ -0,0 +1,155 @@
+From ec14a504137915cc45080323238c64d348d020eb Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Tue, 23 Jun 2026 11:55:31 +0200
+Subject: [PATCH] pkcs5: Validate parsed parameters to avoid DoS attacks
+
+With the unbounded iterations, an attacker can craft a PKCS#7 file and
+send it during IKEv1 to block the processing thread practically for an
+unlimited amount of time.
+
+As the key length is used for an allocation on the stack, not limiting
+it could cause a crash.  We validate it after parsing the params, but
+since `encryption_algorithm_from_oid()` only returns trusted key lengths
+that are lower than the limit, that's fine.
+
+The unlimited salt length had no direct impact (the maximum is bound by
+the accepted message size), but we now limit it as well before cloning.
+
+Fixes: 4076e3ee9121 ("Extract PKCS#5 handling from pkcs8 plugin to separate helper class")
+Fixes: fd1ff46f6143 ("Added support for PKCS#5 v2 schemes when decrypting PKCS#8 files.")
+Fixes: cab127cba66c ("Added support for encrypted PKCS#8 files (for some PKCS#5 v1.5 schemes).")
+Fixes: CVE-2026-78129
+
+CVE: CVE-2026-78129
+Upstream-Status: Backport [https://github.com/strongiswan/strongswan/commit/f60a55e36f95e210ab067de295c9f6bacefcdd1a]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libstrongswan/crypto/pkcs5.c | 65 +++++++++++++++++++++++++++++++-
+ 1 file changed, 64 insertions(+), 1 deletion(-)
+
+diff --git a/src/libstrongswan/crypto/pkcs5.c b/src/libstrongswan/crypto/pkcs5.c
+index 822656f..e01010b 100644
+--- a/src/libstrongswan/crypto/pkcs5.c
++++ b/src/libstrongswan/crypto/pkcs5.c
+@@ -14,6 +14,8 @@
+  * for more details.
+  */
+ 
++#include <inttypes.h>
++
+ #include "pkcs5.h"
+ 
+ #include <utils/debug.h>
+@@ -22,6 +24,15 @@
+ #include <asn1/asn1_parser.h>
+ #include <credentials/containers/pkcs12.h>
+ 
++/** maximum accepted length for salts in parsed parameters */
++#define PKCS5_SALT_LEN_MAX			128
++
++/** maximum accepted iteration count in parsed parameters */
++#define PKCS5_ITERATIONS_MAX		1000000
++
++/** maximum key length accepted in parsed parameters */
++#define PKCS5_KEY_LEN_MAX			64
++
+ typedef struct private_pkcs5_t private_pkcs5_t;
+ 
+ /**
+@@ -379,6 +390,41 @@ METHOD(pkcs5_t, decrypt, bool,
+ 						   keymat, key, iv);
+ }
+ 
++/**
++ * Make sure the salt has an appropriate length
++ */
++static bool validate_salt_length(chunk_t salt)
++{
++	if (salt.len > PKCS5_SALT_LEN_MAX)
++	{
++		DBG1(DBG_ASN, "  salt length %zu exceeds maximum of %zu bytes",
++			 salt.len, (size_t)PKCS5_SALT_LEN_MAX);
++		return FALSE;
++	}
++	return TRUE;
++}
++
++/**
++ * Validate that parsed parameters are in an allowed range
++ */
++static bool validate_params(private_pkcs5_t *this)
++{
++	if (!this->iterations || this->iterations > PKCS5_ITERATIONS_MAX)
++	{
++		DBG1(DBG_ASN, "  iteration count %" PRIu64 " is out of range "
++			 "(1-%" PRIu64 ")", this->iterations,
++			 (uint64_t)PKCS5_ITERATIONS_MAX);
++		return FALSE;
++	}
++	if (this->keylen > PKCS5_KEY_LEN_MAX)
++	{
++		DBG1(DBG_ASN, "  key length %zu exceeds maximum of %zu bytes",
++			 this->keylen, (size_t)PKCS5_KEY_LEN_MAX);
++		return FALSE;
++	}
++	return TRUE;
++}
++
+ /**
+  * ASN.1 definition of a PBEParameter structure
+  */
+@@ -399,7 +445,7 @@ static bool parse_pbes1_params(private_pkcs5_t *this, chunk_t blob, int level0)
+ 	asn1_parser_t *parser;
+ 	chunk_t object;
+ 	int objectID;
+-	bool success;
++	bool success = FALSE;
+ 
+ 	parser = asn1_parser_create(pbeParameterObjects, blob);
+ 	parser->set_top_level(parser, level0);
+@@ -410,6 +456,10 @@ static bool parse_pbes1_params(private_pkcs5_t *this, chunk_t blob, int level0)
+ 		{
+ 			case PBEPARAM_SALT:
+ 			{
++				if (!validate_salt_length(object))
++				{
++					goto end;
++				}
+ 				this->salt = chunk_clone(object);
+ 				break;
+ 			}
+@@ -421,6 +471,11 @@ static bool parse_pbes1_params(private_pkcs5_t *this, chunk_t blob, int level0)
+ 		}
+ 	}
+ 	success = parser->success(parser);
++	if (success)
++	{
++		success = validate_params(this);
++	}
++end:
+ 	parser->destroy(parser);
+ 	return success;
+ }
+@@ -471,6 +526,10 @@ static bool parse_pbkdf2_params(private_pkcs5_t *this, chunk_t blob, int level0)
+ 		{
+ 			case PBKDF2_SALT:
+ 			{
++				if (!validate_salt_length(object))
++				{
++					goto end;
++				}
+ 				this->salt = chunk_clone(object);
+ 				break;
+ 			}
+@@ -500,6 +559,10 @@ static bool parse_pbkdf2_params(private_pkcs5_t *this, chunk_t blob, int level0)
+ 		}
+ 	}
+ 	success = parser->success(parser);
++	if (success)
++	{
++		success = validate_params(this);
++	}
+ end:
+ 	parser->destroy(parser);
+ 	return success;
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index 2637c19d1e..c8f956f4d8 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78124.patch \
            file://CVE-2026-78126.patch \
            file://CVE-2026-78127.patch \
+           file://CVE-2026-78129.patch \
 "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"

