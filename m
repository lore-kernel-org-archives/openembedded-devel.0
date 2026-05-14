Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4B8CD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 13:15:56 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10793.1778764553209420409
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 06:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CsQv5Swp;
 spf=pass (domain: mvista.com, ip: 74.125.82.179, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f7ca62a3c4so8330216eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 06:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1778764552; x=1779369352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uhfAiynSDMtF6H05p/qZ2gjsvapWJPpvyVC7WLll6uw=;
        b=CsQv5SwpKd9qJnxhP0xl1lsUZvyXuEA8Z5Dw78m7GMeH7MFHgIPwx/1HtsZvIUA6Od
         ByQKkF0TRaqJ+nO0amNPELgu/83C7ikOd087SLsKY+f1NRTF1+gbHZz+cHvum1hQSQbD
         nZDSEZxNevRATALWKs5DxXkp+YAvcIP8Iyz/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764552; x=1779369352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhfAiynSDMtF6H05p/qZ2gjsvapWJPpvyVC7WLll6uw=;
        b=cku0ozCcQ3lIjEpcdM8nUhC8QpcOmix98586g68GpEyduaHkIyFkdAdWy3KASE9YPd
         ydreAURJIQGzo+IBLySVsuhR/nPnOlhMetC1xxYnl797gHtjbIvfyrPmQ7/gcnOTsK6V
         1Filsfb+nXvJ0GD17Z4Vd/ZJbf6PX9UTibdpC6zsfDYcsBN5A44jHTy8Utrf1PTaAnPv
         ofOsZC5wYDy5GpLVOBgP2Nf+UPgI/IklNYvGd/PD/2D0xDpvyZjqed2iNgHfICYy5lKU
         PX+XE+oWnE/n9jQCS9BwStqvx80P1Va2mL/372S5j8YPV9dGEFreIeoTPLJ6sQGfWfRf
         0lYg==
X-Gm-Message-State: AOJu0Yxbr9xCFhJ+zbVwkWgtND2CT5M4D6FI+zSH2rj1++EffdHOCRcy
	q3oCGoy4khJQJD0X/iD5OeIn4zGZc08N9oosWBU6zITxTL3PUzIbz23tAffWqI1AMFfjXoMaFs0
	Je25gfME=
X-Gm-Gg: Acq92OEPvFurTHJJhPLbAHj34kfNRbBS2PT8J9aYNpnIs9eqn6SIA88gLX+Yg0h2VJ5
	oELaYMUgwlGRPzPBpIYymOawrtF0aPXw0AIU2SAEiE/hhAR+5F/10RkuLGej1tn2339qGHT3clq
	wcJ5ipqU9FyxLSP7noLZclQie5FiLF5j653zjojChalMb8DTKBBRusGq7xuSPHCkbJ12L13XvpU
	oXDl7ZUx5Th/PSR29wpWV0uHJXxucgUAWcnUW/zpm6TzPkLgE65c3+wU8RmP71fVxxH6aolqkGD
	bWy9JccP0BhdrFbu4nYM8ue03+2RWcZ/ssunQmRh1k7dyDxqCm4IZoVHPVlAUb8a0govDMYBvVB
	g+p1trgBQMXEEAVhUSoHMi1CVGNp6sn4xpTpsXYatUFQ2F70uf8w3SeTS8YwpMPWIzUABJcQ5wA
	B77BL54Y84LKvCHzGqz0xJoifxYfWH4YQcTQQR
X-Received: by 2002:a05:7301:6787:b0:2d8:71c2:255d with SMTP id 5a478bee46e88-3015468f4demr4384728eec.14.1778764552235;
        Thu, 14 May 2026 06:15:52 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.175])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978ad18asm2755348eec.26.2026.05.14.06.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:15:51 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][scarthgap][PATCH] strongswan: fix for CVE-2026-35334
Date: Thu, 14 May 2026 18:45:41 +0530
Message-ID: <20260514131542.486134-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 13:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126989

Pick patch according to [1]

[1] https://download.strongswan.org/security/CVE-2026-35334
[2] https://www.strongswan.org/blog/2026/04/22/strongswan-vulnerability-(cve-2026-35334).html
[3] https://security-tracker.debian.org/tracker/CVE-2026-35334

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../strongswan/CVE-2026-35334.patch           | 255 ++++++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |   1 +
 2 files changed, 256 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-35334.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-35334.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-35334.patch
new file mode 100644
index 0000000000..5ed9f1bf61
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-35334.patch
@@ -0,0 +1,255 @@
+From c23cf29373bb25a24b952ea4c5bf7ea326b78714 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Tue, 24 Mar 2026 18:00:23 +0100
+Subject: [PATCH] gmp: Avoid crash and timing leaks in PKCS#1 v1.5 decryption
+ padding validation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This fixes a potential crash due to a null-pointer dereference if rsadp()
+returns NULL (e.g. with an all-zero ciphertext).
+
+And it also implements the PKCS#1 v1.5 decryption padding check in
+constant time.
+
+The timing leak caused by the previous implementation was measured at
+~17.5 Î¼s at 3 GHz, which could allow a Bleichenbacher-like attack in
+LAN environments.  However, because of how RSA encryption is used in
+strongSwan, this is not that much of an issue in practice.  The mechanism
+is only used for two use cases.  One is SCEP/EST via PKCS#7 enveloped
+data.  Fortunately, this can not be triggered in significant numbers by
+an attacker.  The other use case is TLS as used by EAP methods (EAP-TLS,
+EAP-PEAP/TTLS) during the authentication.  While the cipher suites that
+use RSA encryption are still enabled by default, the TLS messages are
+wrapped in EAP and encrypted by IKE, making any kind of attack difficult.
+
+Note that the gmp plugin isn't enabled anymore by default.  And even
+before that, most setups had the openssl plugin enabled, which has
+priority over the gmp plugin.  So it's unlikely the plugin was used in
+practice.
+
+Also note that this patch doesn't modify libstrongswan's Makefile.am
+to avoid potentially requiring autotools when patching a tarball.
+
+Fixes: d615ffdcf3cd ("implement gmp_rsa_private_key.decrypt()")
+Fixes: CVE-2026-35334
+
+
+CVE: CVE-2026-35334
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2026-35334/strongswan-5.3.1-6.0.5_gmp_rsa_decrypt_pad.patch]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ .../plugins/gmp/gmp_rsa_private_key.c         |  54 ++++++---
+ src/libstrongswan/utils/utils.h               |   1 +
+ src/libstrongswan/utils/utils/constant_time.h | 103 ++++++++++++++++++
+ 3 files changed, 140 insertions(+), 18 deletions(-)
+ create mode 100644 src/libstrongswan/utils/utils/constant_time.h
+
+diff --git a/src/libstrongswan/plugins/gmp/gmp_rsa_private_key.c b/src/libstrongswan/plugins/gmp/gmp_rsa_private_key.c
+index 47784b6..7312fa9 100644
+--- a/src/libstrongswan/plugins/gmp/gmp_rsa_private_key.c
++++ b/src/libstrongswan/plugins/gmp/gmp_rsa_private_key.c
+@@ -495,8 +495,8 @@ METHOD(private_key_t, decrypt, bool,
+ 	private_gmp_rsa_private_key_t *this, encryption_scheme_t scheme,
+ 	void *params, chunk_t crypto, chunk_t *plain)
+ {
+-	chunk_t em, stripped;
+-	bool success = FALSE;
++	chunk_t em;
++	u_int valid, i, j, found_sep = 0, sep_index = 0, m_index;
+ 
+ 	if (scheme != ENCRYPT_RSA_PKCS1)
+ 	{
+@@ -505,33 +505,51 @@ METHOD(private_key_t, decrypt, bool,
+ 		return FALSE;
+ 	}
+ 	/* rsa decryption using PKCS#1 RSADP */
+-	stripped = em = rsadp(this, crypto);
++	em = rsadp(this, crypto);
++	if (em.len != this->k)
++	{
++		return FALSE;
++	}
+ 
+-	/* PKCS#1 v1.5 8.1 encryption-block formatting (EB = 00 || 02 || PS || 00 || D) */
++	/* PKCS#1 v1.5, RFC 8017, section 7.2.2 message structure:
++	 * EM = 00 || 02 || PS || 00 || M */
+ 
+ 	/* check for hex pattern 00 02 in decrypted message */
+-	if ((*stripped.ptr++ != 0x00) || (*(stripped.ptr++) != 0x02))
++	valid  = constant_time_eq(em.ptr[0], 0x00);
++	valid &= constant_time_eq(em.ptr[1], 0x02);
++
++	/* the plaintext data starts after first 0x00 byte */
++	for (i = 2; i < em.len; i++)
+ 	{
+-		DBG1(DBG_LIB, "incorrect padding - probably wrong rsa key");
+-		goto end;
++		u_int zero = constant_time_eq(em.ptr[i], 0x00);
++
++		sep_index = constant_time_select(i, sep_index, ~found_sep & zero);
++		found_sep |= zero;
+ 	}
+-	stripped.len -= 2;
+ 
+-	/* the plaintext data starts after first 0x00 byte */
+-	while (stripped.len-- > 0 && *stripped.ptr++ != 0x00)
++	/* make sure PS is at least eight bytes long (plus the initial bytes) */
++	valid &= constant_time_ge(sep_index, 10);
++
++	/* instead of copying the message directly, we try not to reveal the message
++	 * length i.e. where the 0x00 byte was. and since clearing a chunk is
++	 * relatively efficient, i.e. doesn't leak much, we always allocate and copy
++	 * a value and then clear it if the structure was invalid */
++	m_index = constant_time_select(sep_index + 1, 11, valid);
+ 
+-	if (stripped.len == 0)
++	*plain = chunk_alloc(this->k);
++	for (i = 0, j = 0; i < em.len; i++)
+ 	{
+-		DBG1(DBG_LIB, "no plaintext data");
+-		goto end;
++		plain->ptr[j] = em.ptr[i];
++		j += constant_time_ge(i, m_index);
+ 	}
++	plain->len = j;
+ 
+-	*plain = chunk_clone(stripped);
+-	success = TRUE;
+-
+-end:
++	if (!valid)
++	{
++		chunk_clear(plain);
++	}
+ 	chunk_clear(&em);
+-	return success;
++	return valid;
+ }
+ 
+ METHOD(private_key_t, get_keysize, int,
+diff --git a/src/libstrongswan/utils/utils.h b/src/libstrongswan/utils/utils.h
+index 42d0114..ab0be72 100644
+--- a/src/libstrongswan/utils/utils.h
++++ b/src/libstrongswan/utils/utils.h
+@@ -53,6 +53,7 @@
+ #include "utils/atomics.h"
+ #include "utils/align.h"
+ #include "utils/byteorder.h"
++#include "utils/constant_time.h"
+ #include "utils/string.h"
+ #include "utils/memory.h"
+ #include "utils/strerror.h"
+diff --git a/src/libstrongswan/utils/utils/constant_time.h b/src/libstrongswan/utils/utils/constant_time.h
+new file mode 100644
+index 0000000..0c2c6a2
+--- /dev/null
++++ b/src/libstrongswan/utils/utils/constant_time.h
+@@ -0,0 +1,103 @@
++/*
++ * Copyright (C) 2026 Tobias Brunner
++ *
++ * Copyright (C) secunet Security Networks AG
++ *
++ * This program is free software; you can redistribute it and/or modify it
++ * under the terms of the GNU General Public License as published by the
++ * Free Software Foundation; either version 2 of the License, or (at your
++ * option) any later version.  See <http://www.fsf.org/copyleft/gpl.txt>.
++ *
++ * This program is distributed in the hope that it will be useful, but
++ * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
++ * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
++ * for more details.
++ */
++
++/**
++ * @defgroup constant_time_i constant_time
++ * @{ @ingroup constant_time_i
++ */
++
++#ifndef CONSTANT_TIME_H_
++#define CONSTANT_TIME_H_
++
++#include <stdint.h>
++
++/**
++ * Check if the given values are not equal in constant time.
++ *
++ * @param x		first value to check
++ * @param y		second value to check
++ * @return		1 if values are not equal, 0 otherwise
++ */
++static inline u_int constant_time_neq(uint32_t x, uint32_t y)
++{
++	return ((x-y) | (y-x)) >> 31;
++}
++
++/**
++ * Check if the given values are equal in constant time.
++ *
++ * @param x		first value to check
++ * @param y		second value to check
++ * @return		1 if values are equal, 0 otherwise
++ */
++static inline u_int constant_time_eq(uint32_t x, uint32_t y)
++{
++	return 1 ^ constant_time_neq(x, y);
++}
++
++/**
++ * Compare the two values and return 1 if the first argument is lower than
++ * the second in constant time.
++ *
++ * @param x		first value to check
++ * @param y		second value to check
++ * @return		1 if first value is lower than second
++ */
++static inline u_int constant_time_lt(uint32_t x, uint32_t y)
++{
++	return (x ^ ((x^y) | ((x-y) ^ y))) >> 31;
++}
++
++/**
++ * Compare the two values and return 1 if the first argument greater or equal to
++ * the second in constant time.
++ *
++ * @param x		first value to check
++ * @param y		second value to check
++ * @return		1 if first value is greater or equal to the second
++ */
++static inline u_int constant_time_ge(uint32_t x, uint32_t y)
++{
++	return 1 ^ constant_time_lt(x, y);
++}
++
++/**
++ * Return a 32-bit all bit-set mask if the given value is not 0.
++ *
++ * @param x		value to check
++ * @return		0xffffffff if value is != 0, 0 otherwise
++ */
++static inline uint32_t constant_time_mask(uint32_t x)
++{
++	return -(uint32_t)constant_time_neq(x, 0);
++}
++
++/**
++ * Select one of two values depending on whether the condition is != 0 or not.
++ * Basically equivalent to 'c ? x : y'.
++ *
++ * @param x		first value to select
++ * @param y		second value to select
++ * @param c		condition
++ * @return		x if c is != 0, y otherwise
++ */
++static inline uint32_t constant_time_select(uint32_t x, uint32_t y, uint32_t c)
++{
++	uint32_t m = constant_time_mask(c);
++	return (x & m) | (y & ~m);
++}
++
++#endif /** CONSTANT_TIME_H_ @} */
+-- 
+2.50.1
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
index 820a1ad9e8..7cc67e4d92 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
@@ -11,6 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2025-62291.patch \
            file://CVE-2026-25075.patch \
+           file://CVE-2026-35334.patch \
            "
 
 SRC_URI[sha256sum] = "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678"
-- 
2.50.1


