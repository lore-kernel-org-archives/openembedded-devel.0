Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CE7CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:20 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33275.1792043111164562838
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Zh2Zb/Mt;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e6038cebefso36464565ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043110; x=1792647910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kQX8ZX3OmqB3os19hZtjRRMHYNsxUulUgZR6g/FqSpY=;
        b=Zh2Zb/MtEhhhv1KDYHwmaD5GalAXvITx4p3/D9g55z61lAI9bO/unGHd1nYENBVTYX
         QvIqcxTM2GRqqd1hC7TsI7Dxm+k70YFn9uvy0yLSRud3rvv0lbR1IEtmrPk5tx25JDuF
         QywsJCgJQJy/jci8mH05XcFEF77uYl7d7LuxFgiuq2nu87YpWavRHcLcLftHPuKTzyUo
         sWb6eJvEiH8/JZEFm1K6se+frLUllg4SP01x3Cim/F4bhE6DoTwxDg2nEGVM71RUpmwF
         ERYUHdJJaQXzDLl8zofr5zrAGFfhtu/1B4p2TQIDbZM4tnLo+RYuKb92aqiM9OaDG7Mn
         h7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043110; x=1792647910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kQX8ZX3OmqB3os19hZtjRRMHYNsxUulUgZR6g/FqSpY=;
        b=uVxeWnj3YQmmi5ckh8b17ij1QxqAjSHYfr2M9XD1uWFyInNzg3ypDohLSETGE9XH30
         m3a2+8CASTH/972Evgeec03tsdZk5PRc6K+2j21Ceo9q8QswmHvN1QiCc3VOII9Chaye
         5FBk1ddXliVmLpLH5KrcYBSvwkWxd2wc/l+jaNw0SfKGOsikFII5eCAsBJsBzJs2VXkI
         ZTpXZg/ni2iyqWPqLs6abkJ7HxPE6LaO9jLzRsLUYZjNDPlCtVgPIXfzfgOhOkqDuaPb
         DJWRNRKH9zf61G7FdTyK1AVwDqnyfyH0DH8TgXHPeywcg3HTgzj+Ik8auB7+nzympoJN
         R03g==
X-Gm-Message-State: AFq9FYJZR+hkGS8U7u+93wMEPtSeiL9YQ96zONt18UBYsL2eP1cyCU5M
	WCZNhvICEN/tpgx4qj14s5EnYX8fhoaw4Dm3DQ241lNawSZsW55oJQzbtH4afg==
X-Gm-Gg: AYBFou2B7KKGCWuClUoDODDNiQO/ioVKPu9Rt9VreJx5AsZYJZhu8n2IzeJmEPVgVlc
	myraVo/lUxc98tcZMJTy/m8BkYeRevkQB8b9GJetnySLx/dPWlMYfxZ4U5uFSrinaZH+hynFaJk
	qVZaMNnMorOuMJD3e2Em7k9/C8Fat5oZNkdkQMy50fuqt9Qahm0AVT2YRIoU4IO+/DoX5BvdF9k
	ssS/0OvPO/i2wxsIMzeCci2Q8kbW/Wl1ot16CwLnKWP01xI3hbregyjwgupJiHmeyRljskklbJr
	ZSjFBEvgeiwELQBkAK/iK8D7k0pBSIkpYMDw/9ePPfkrx9ZEXFfh0aVo3rPTJESbHzyd2WqEhEK
	iLiLU7266zgdF4EIVhQ3GXQQap1gU3wG3iRKzxsU5H149gkB7W3VvY0hfDrAM3MSVB6zzNsuXM6
	0ZbyXLnwYMK/ODBnlSNl+qHsWnIB6b0uifg57RttPiRt2iDNqfoQ3ivH3o7vd2dGnVBkgzyuJPP
	g7YTnz0X5ODpn/h164c73k=
X-Received: by 2002:a17:903:32c9:b0:2e9:4175:306e with SMTP id d9443c01a7336-2e941753b75mr34085255ad.42.1792043110457;
        Wed, 14 Oct 2026 22:45:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 66/82] strongswan: patch CVE-2026-78129
Date: Thu, 15 Oct 2026 18:41:54 +1300
Message-ID: <7004be1e6365b4b0bef7a8c04bfff8a931d40bac.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130986

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78129

[1]https://download.strongswan.org/security/CVE-2026-78129/strongswan-5.6.3-6.0.7_pkcs5_params_dos.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78129).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 9ea8363e3055e4b608c0e19d5db87e1fbfcad7e2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78129.patch           | 155 ++++++++++++++++++
 .../strongswan/strongswan_6.0.7.bb            |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78129.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78129.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78129.patch
new file mode 100644
index 0000000000..5f327989a0
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
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/f60a55e36f95e210ab067de295c9f6bacefcdd1a]
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
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
index d8ed26d841..5a7a12d903 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78124.patch \
            file://CVE-2026-78126.patch \
            file://CVE-2026-78127.patch \
+           file://CVE-2026-78129.patch \
 "
 
 SRC_URI[sha256sum] = "e518e34e159514f4c6ba80d1f926cb151e0dd4e3a1d94213171234b8b9ae6f55"

