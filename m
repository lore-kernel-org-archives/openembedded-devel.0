Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CC4C79F9F
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:39 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31704.1788776669737572920
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XzRWZGOx;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc147d86bebso3023412a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776669; x=1789381469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2sGyBIyPYuTH5WoWwO42Oy42NHP4EK9G7eiQnILPsLU=;
        b=XzRWZGOxdfsgjm4Gf298wgVVJxBtZJLgcF02rF7GJ1MObYABNw42GD2z+spvVhq4Os
         dHi25jfuV3UGaNmyV8NbN33Pk6IOq6JdJqUdcIYMVENXDIe9A7+vVEp08a9l+KyINixE
         JsDcN4t8Q8OIUqCkMm1RYuPe5cZpkOijm4eo/RHoR1vJaj3OpyotFSn8MHryh/YyTkyQ
         bj1PTulnBosVyABy5kuozwBbIT+SBDDugqM37yip3YzrFBFoZXjTFK3xjx0BRU0dc1uZ
         XpWDz7DWo2gyy8w+r0TptAmD9MvAL1ptE1qzs3ObCux3OU3TTzccTEjpgW2cWyq0wSv5
         XS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776669; x=1789381469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2sGyBIyPYuTH5WoWwO42Oy42NHP4EK9G7eiQnILPsLU=;
        b=TNEM3EpXyh8DRzXoyD/kk/Zw1s/GriDGusFUjdRc6ovreXitxCj3diRcDZeDsC7nx3
         k7ez6wFt4YGKdVN4HYHCtBS42ow1x3TVYWSjjeiGazA+8dYm8CHrB7qCg2vEwUIBlSL0
         h8L8KdJHxfwnVDlqb5IdOseTRIggTszuHrGR1vlOaB75MzDIYc8koZnxy+t9MvZPBhIA
         fwadQBf3s4YIjV2r2XWDSvqHAnDug2t4Zhz/QD0c4MqYaYvtV9bY336xRfI/yrc/9cGY
         3VQb9hzqCKps5K+XCFrIv7gF1MUEor6tQEdlFeomgXer79KkVxjsPcRAMbgDK88QnaN/
         6GoA==
X-Gm-Message-State: AFuF++mD+ciVkUHCYkEF7cM2wfba8N0hcKMTMzJUsEFZ19NYsAnlKxmF
	ir6V2dyxXcFhzDr1x+nbg0cOZULENcSBrJFKs8xs/wjgXA2xjBkrTY33bAfvWyzm
X-Gm-Gg: AYBFou3cvdf9+5rt7nnSlfk/juIf3XBi2amEZyGI9d8eOCCil5kpoux4GNL3KHl/8S6
	VHRIANRyhagcl7wKOG0QNVk7dm7/3UJXvwkVlHU5NKnIffRZ1uBzL3/uV7+Q/UGszXdbuMG80FF
	3/lCLLsKz0G5SWKfbyBJONYijrm5OZHSn3Myi1n/8+shaFg0s6FyrSfaz0yM8dV0vA1lxbA/x6S
	F3TY56PCg2voR9WzXH4sUD+liptiekG+auUHFEYzANAXqxvBgeKDCnNCprnGEIKMX12ASgI+DiQ
	37sSLI1E1SKaCHegthjw0oSVT4R9eNInuzdABgetw/nGnd8ZYK91UDNly7pImN9tdQyvqzUr0oT
	S2Oo6tQmJae8uWcBlruW3TxNhTCRPGGgMuE1sYcPsY0wtmN+z5jwlEhleAKO/0nGlc/nsFOn5D4
	w8dfZaRMbNQLm6LMHshUXL7oKeKrAFs/zrIvHOiDkjguUoTYmwtl+//feLYt7ugBW0/X2VG4kPV
	A==
X-Received: by 2002:a05:6a20:cf83:b0:3d2:ee7a:eba9 with SMTP id adf61e73a8af0-3da213cae76mr31665053637.4.1788776669061;
        Mon, 07 Sep 2026 03:24:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 22/33] wolfssl: patch CVE-2026-10512
Date: Mon,  7 Sep 2026 22:23:06 +1200
Message-ID: <20260907102318.2459883-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129834

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-10512

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-10512.patch        | 182 ++++++++++++++++++
 .../wolfssl/wolfssl_5.9.1.bb                  |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10512.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10512.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10512.patch
new file mode 100644
index 0000000000..74288c28f9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10512.patch
@@ -0,0 +1,182 @@
+From 8c3f7b9c7f7efb9e8539c2d98fe52e116f3402eb Mon Sep 17 00:00:00 2001
+From: Sean Parkinson <sean@wolfssl.com>
+Date: Wed, 27 May 2026 12:16:06 +1000
+Subject: [PATCH] X25519 x64 ASM: fix full reduction
+
+The last add was overflowing into the top bit.
+Must mask the last word to clear top bit.
+
+Add test vectors from Wycheproof.
+
+(cherry picked from commit 14b55a0bc42c4f2d2fa0a06af53a603ed619c9b0)
+
+CVE: CVE-2026-10512
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/14b55a0bc42c4f2d2fa0a06af53a603ed619c9b0]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ tests/api/test_curve25519.c   | 93 +++++++++++++++++++++++++++++++++++
+ tests/api/test_curve25519.h   |  2 +
+ wolfcrypt/src/fe_x25519_asm.S |  4 ++
+ 3 files changed, 99 insertions(+)
+
+diff --git a/tests/api/test_curve25519.c b/tests/api/test_curve25519.c
+index 36cf643f2..36c8e58af 100644
+--- a/tests/api/test_curve25519.c
++++ b/tests/api/test_curve25519.c
+@@ -353,6 +353,99 @@ int test_wc_curve25519_shared_secret_ex(void)
+     return EXPECT_RESULT();
+ } /* END test_wc_curve25519_shared_secret_ex */
+ 
++/*
++ * Known-answer tests for wc_curve25519_shared_secret_ex.
++ *
++ * Both vectors share one private scalar and produce a shared secret that is a
++ * small canonical value (9 and 16, little-endian). Because the result is close
++ * to a multiple of the field prime, these exercise the final modular reduction
++ * of the X25519 computation: a result that was only reduced mod 2^256 (or left
++ * in [p, 2^255)) instead of fully reduced mod 2^255-19 would not match.
++ * All values are 32-byte little-endian encodings per RFC 7748.
++ */
++int test_wc_curve25519_shared_secret_ex_kat(void)
++{
++    EXPECT_DECLS;
++#if defined(HAVE_CURVE25519) && defined(HAVE_CURVE25519_KEY_IMPORT)
++    /* Private scalar shared by both vectors. */
++    static const byte kPriv[CURVE25519_KEYSIZE] = {
++        0x60, 0xa3, 0xa4, 0xf1, 0x30, 0xb9, 0x8a, 0x5b,
++        0xe4, 0xb1, 0xce, 0xdb, 0x7c, 0xb8, 0x55, 0x84,
++        0xa3, 0x52, 0x0e, 0x14, 0x2d, 0x47, 0x4d, 0xc9,
++        0xcc, 0xb9, 0x09, 0xa0, 0x73, 0xa9, 0x76, 0x7f
++    };
++    /* Vector 1 public value, expected shared secret == 9. */
++    static const byte kPub1[CURVE25519_KEYSIZE] = {
++        0x3b, 0x18, 0xdf, 0x1e, 0x50, 0xb8, 0x99, 0xeb,
++        0xd5, 0x88, 0xc3, 0x16, 0x1c, 0xbd, 0x3b, 0xf9,
++        0x8e, 0xbc, 0xc2, 0xc1, 0xf7, 0xdf, 0x53, 0xb8,
++        0x11, 0xbd, 0x0e, 0x91, 0xb4, 0xd5, 0x15, 0x3d
++    };
++    static const byte kExpected1[CURVE25519_KEYSIZE] = {
++        0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
++    };
++    /* Vector 2 public value, expected shared secret == 16. */
++    static const byte kPub2[CURVE25519_KEYSIZE] = {
++        0xca, 0xb6, 0xf9, 0xe7, 0xd8, 0xce, 0x00, 0xdf,
++        0xce, 0xa9, 0xbb, 0xd8, 0xf0, 0x69, 0xef, 0x7f,
++        0xb2, 0xac, 0x50, 0x4a, 0xbf, 0x83, 0xb8, 0x7d,
++        0xb6, 0x01, 0xb5, 0xae, 0x0a, 0x7f, 0x76, 0x15
++    };
++    static const byte kExpected2[CURVE25519_KEYSIZE] = {
++        0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
++    };
++    /* Table-driven so both vectors run through the identical code path. */
++    struct {
++        const byte* pub;
++        const byte* expected;
++    } vec[2];
++    curve25519_key private_key;
++    curve25519_key public_key;
++    WC_RNG         rng;
++    byte           out[CURVE25519_KEYSIZE];
++    word32         outLen;
++    int i;
++
++    vec[0].pub = kPub1; vec[0].expected = kExpected1;
++    vec[1].pub = kPub2; vec[1].expected = kExpected2;
++
++    XMEMSET(&rng, 0, sizeof(WC_RNG));
++    ExpectIntEQ(wc_InitRng(&rng), 0);
++
++    for (i = 0; i < 2; i++) {
++        XMEMSET(&private_key, 0, sizeof(private_key));
++        XMEMSET(&public_key, 0, sizeof(public_key));
++        ExpectIntEQ(wc_curve25519_init(&private_key), 0);
++        ExpectIntEQ(wc_curve25519_init(&public_key), 0);
++    #ifdef WOLFSSL_CURVE25519_BLINDING
++        ExpectIntEQ(wc_curve25519_set_rng(&private_key, &rng), 0);
++    #endif
++        ExpectIntEQ(wc_curve25519_import_private_ex(kPriv, sizeof(kPriv),
++            &private_key, EC25519_LITTLE_ENDIAN), 0);
++        ExpectIntEQ(wc_curve25519_import_public_ex(vec[i].pub,
++            CURVE25519_KEYSIZE, &public_key, EC25519_LITTLE_ENDIAN), 0);
++
++        outLen = sizeof(out);
++        ExpectIntEQ(wc_curve25519_shared_secret_ex(&private_key, &public_key,
++            out, &outLen, EC25519_LITTLE_ENDIAN), 0);
++        ExpectIntEQ(outLen, CURVE25519_KEYSIZE);
++        ExpectIntEQ(XMEMCMP(out, vec[i].expected, CURVE25519_KEYSIZE), 0);
++
++        wc_curve25519_free(&private_key);
++        wc_curve25519_free(&public_key);
++    }
++
++    DoExpectIntEQ(wc_FreeRng(&rng), 0);
++#endif
++    return EXPECT_RESULT();
++} /* END test_wc_curve25519_shared_secret_ex_kat */
++
+ /*
+  * Testing wc_curve25519_make_pub
+  */
+diff --git a/tests/api/test_curve25519.h b/tests/api/test_curve25519.h
+index 0e0e65287..770b509af 100644
+--- a/tests/api/test_curve25519.h
++++ b/tests/api/test_curve25519.h
+@@ -30,6 +30,7 @@ int test_wc_curve25519_export_key_raw(void);
+ int test_wc_curve25519_export_key_raw_ex(void);
+ int test_wc_curve25519_make_key(void);
+ int test_wc_curve25519_shared_secret_ex(void);
++int test_wc_curve25519_shared_secret_ex_kat(void);
+ int test_wc_curve25519_make_pub(void);
+ int test_wc_curve25519_export_public_ex(void);
+ int test_wc_curve25519_export_private_raw_ex(void);
+@@ -43,6 +44,7 @@ int test_wc_curve25519_import_private(void);
+     TEST_DECL_GROUP("curve25519", test_wc_curve25519_export_key_raw_ex),       \
+     TEST_DECL_GROUP("curve25519", test_wc_curve25519_make_key),                \
+     TEST_DECL_GROUP("curve25519", test_wc_curve25519_shared_secret_ex),        \
++    TEST_DECL_GROUP("curve25519", test_wc_curve25519_shared_secret_ex_kat),    \
+     TEST_DECL_GROUP("curve25519", test_wc_curve25519_make_pub),                \
+     TEST_DECL_GROUP("curve25519", test_wc_curve25519_export_public_ex),        \
+     TEST_DECL_GROUP("curve25519", test_wc_curve25519_export_private_raw_ex),   \
+diff --git a/wolfcrypt/src/fe_x25519_asm.S b/wolfcrypt/src/fe_x25519_asm.S
+index f4cdf343c..5abe4cd5e 100644
+--- a/wolfcrypt/src/fe_x25519_asm.S
++++ b/wolfcrypt/src/fe_x25519_asm.S
+@@ -4639,6 +4639,7 @@ L_curve25519_base_x64_3:
+         adcq	$0x00, %r8
+         adcq	$0x00, %r9
+         adcq	$0x00, %r10
++        andq	%rax, %r10
+         # Store
+         movq	%rcx, (%rdi)
+         movq	%r8, 8(%rdi)
+@@ -7054,6 +7055,7 @@ L_curve25519_x64_3:
+         adcq	$0x00, %r9
+         adcq	$0x00, %r10
+         adcq	$0x00, %r11
++        andq	%rax, %r11
+         # Store
+         movq	%rcx, (%rdi)
+         movq	%r9, 8(%rdi)
+@@ -15107,6 +15109,7 @@ L_curve25519_base_avx2_last_3:
+         adcq	$0x00, %r9
+         adcq	$0x00, %r10
+         adcq	$0x00, %r11
++        andq	%rcx, %r11
+         # Store
+         movq	%r8, (%rdi)
+         movq	%r9, 8(%rdi)
+@@ -17116,6 +17119,7 @@ L_curve25519_avx2_last_3:
+         adcq	$0x00, %r10
+         adcq	$0x00, %r11
+         adcq	$0x00, %r12
++        andq	%rcx, %r12
+         # Store
+         movq	%r9, (%rdi)
+         movq	%r10, 8(%rdi)
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
index 094bf8d78b..4f6ae56567 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://run-ptest \
     file://CVE-2026-10098-1.patch \
     file://CVE-2026-10098-2.patch \
+    file://CVE-2026-10512.patch \
 "
 
 SRCREV = "1d363f3adceba9d1478230ede476a37b0dcdef24"

