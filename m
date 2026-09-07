Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFEF0C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:59 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31934.1788776690928682585
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ThFscdHq;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso3120287a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776690; x=1789381490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQlYGAtHaJZXMEbHQKrgByntMCHVWO72pU3Joy7ZYi4=;
        b=ThFscdHqUqk504Ym3vEWj6iaEREJ+J6PWIJ9Ei0G9ZAa4xRUGATmXuUTIgGVr8aAe2
         uU8N0Iiymgcqz064hykZST48wpcxqyKfc8sv0uEi15zjPirkwmySgGO6WqFrVKfUtEqB
         6VjqvS/RHpkDWLELFZeAOzOhX4EoxBIgdJKyegXU1/il4Zckc0xqCqBhl/olGhOIcOar
         5yLH53tagOiBbVVVgogYs7ITKrLLKiFJp8jxhan30mDutkV0S1FNwtGD4mqTQVa31p73
         Gc5Xt/gPDjvwZqTovExEHyY1vXi2JycA7uo+O2OCl1Y9DjLgZQYEaRdcgWo5oX8NzQgE
         1WRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776690; x=1789381490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQlYGAtHaJZXMEbHQKrgByntMCHVWO72pU3Joy7ZYi4=;
        b=W0Lgz/e4PV7hvAlBzjG3dDYlISHMLA1NysO2v/u/IITfYaG9fOnaqqZh9bxd7Q5ew5
         6DVh9GDUJPcxHcTR8b3lZB+Eh/rYyNs2kgaJGQhIFJU+BS7raISMFq7BJNodpJy+T1zX
         7MRSUFbgtB/fHJ9NMzkSi9z21YT4npsb3u7kr83NCeUo6IAdDKR3cVlnK39QnqQzCcQ0
         FJmzpm51IawzQVaifBw5Na7rg4GlHIyPxSIEwmLOTwhxabYVdNMO2iKhZAjwGPTcKvYK
         +7rYq+OdgdlZT9wy9tT1PC0gRANXe5fcpOZPDXQ2F3WrRK0qkjKxqNLwGayhtiq1ThVr
         aKCQ==
X-Gm-Message-State: AFuF++m+aiAFedgNTiduHHxRcEYST+LewaIwVq/ydqp+H3JVbOzQU41H
	ovLw4a7Vgv5YB+vdIsPanHsAUSxoMotq21106xuEYAiAPy1Sc+BdM8+EbkBLphSz
X-Gm-Gg: AYBFou2r8AHPgmkN9JBfeQLAZ1cinwc6Bk5kl6kSoUBVaAAYmJD+Ybhn4FooISmS5AF
	3E1Fzw1TIbv57PwmC0aZAQvRd9C1BT8TtUuGRqU9zgXWJ0EBOkZvmnXIDuV8PH9fW9DZaH787o1
	sVeH/0TKGWRpym/F4GPA7RpcotCrffBVp/rQe7OxX93RhWxryO8hJddiOVBjYz2kTMuUt/3DQIB
	2fAZcnmo3v4et0uc78fkSk2F7Pmi77X7XyLYlRCHU1y2wNq/VN0St6mk9YMm6z2WtB0qDMenSG8
	OhDB1L1Y63cwIjMP5E85o7DBkR2oMp6OzGG5+1mQNmCp4YO2kWzE/g9Gu77WqW/+/ai/Pjs3txc
	XjTWGuD9N5Bdb2JiVe876fyN1U2SZ/RWczBCq5ktTPKqXvwQGw0/ULcIgl720k+slVPASKVZU6e
	DyLVY3WvvAXvFBfBBkK6W1alMVjRH6oAy/OToBpYgkmCpW13qD24KHlk9dDC9l/9NE5jEzzFGo
X-Received: by 2002:a05:6a21:e081:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3da39bb593dmr33455823637.2.1788776689947;
        Mon, 07 Sep 2026 03:24:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 29/33] wolfssl: patch CVE-2026-6325
Date: Mon,  7 Sep 2026 22:23:13 +1200
Message-ID: <20260907102318.2459883-29-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129841

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-6325

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-6325.patch         | 123 ++++++++++++++++++
 .../wolfssl/wolfssl_5.9.1.bb                  |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6325.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6325.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6325.patch
new file mode 100644
index 0000000000..5a67a30dc0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6325.patch
@@ -0,0 +1,123 @@
+From b47170ed386de50deb3f1ce7c9f39cdb17630fc0 Mon Sep 17 00:00:00 2001
+From: Sean Parkinson <sean@wolfssl.com>
+Date: Wed, 15 Apr 2026 11:39:26 +1000
+Subject: [PATCH] Merge pull request #10204 from mattia-moffa/20260413-fixes
+
+SetSuitesHashSigAlgo fix
+
+(cherry picked from commit 6ac0f82b8589736e15683b7d94a822681b8949fc)
+
+CVE: CVE-2026-6325
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/6ac0f82b8589736e15683b7d94a822681b8949fc]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/internal.c | 11 ++++++++++
+ tests/api.c    | 58 +++++++++++++++++++++++++++-----------------------
+ 2 files changed, 42 insertions(+), 27 deletions(-)
+
+diff --git a/src/internal.c b/src/internal.c
+index 267c75a5d..769ba6764 100644
+--- a/src/internal.c
++++ b/src/internal.c
+@@ -29546,6 +29546,17 @@ int SetSuitesHashSigAlgo(Suites* suites, const char* list)
+                     break;
+                 }
+             }
++            {
++                word32 needed = 2;
++#if defined(WC_RSA_PSS) && defined(WOLFSSL_TLS13)
++                if (sig_alg == rsa_pss_sa_algo)
++                    needed = 4;
++#endif
++                if ((word32)idx + needed > WOLFSSL_MAX_SIGALGO) {
++                    ret = 0;
++                    break;
++                }
++            }
+             AddSuiteHashSigAlgo(suites->hashSigAlgo, mac_alg, sig_alg, 0, &idx);
+             sig_alg = 0;
+             mac_alg = no_mac;
+diff --git a/tests/api.c b/tests/api.c
+index 78fcf13ce..739cf0c68 100644
+--- a/tests/api.c
++++ b/tests/api.c
+@@ -15878,6 +15878,33 @@ static int test_wolfSSL_set1_sigalgs_list(void)
+                     WC_NO_ERR_TRACE(WOLFSSL_FAILURE));
+         ExpectIntEQ(wolfSSL_set1_sigalgs_list(ssl, "RSA+SHA256+RSA"),
+                     WC_NO_ERR_TRACE(WOLFSSL_FAILURE));
++
++        {
++            const char entry[] = "RSA+SHA256";
++            const int entryLen = (int)sizeof(entry) - 1;
++            const int entries = WOLFSSL_MAX_SIGALGO + 1;
++            int listSz = entries * (entryLen + 1);
++            char* longList = (char*)XMALLOC(listSz, NULL,
++                DYNAMIC_TYPE_TMP_BUFFER);
++            int i;
++            int pos = 0;
++
++            ExpectNotNull(longList);
++            if (longList != NULL) {
++                for (i = 0; i < entries; i++) {
++                    if (i != 0)
++                        longList[pos++] = ':';
++                    XMEMCPY(longList + pos, entry, entryLen);
++                    pos += entryLen;
++                }
++                longList[pos] = '\0';
++                ExpectIntEQ(wolfSSL_CTX_set1_sigalgs_list(ctx, longList),
++                    WC_NO_ERR_TRACE(WOLFSSL_FAILURE));
++                ExpectIntEQ(wolfSSL_set1_sigalgs_list(ssl, longList),
++                    WC_NO_ERR_TRACE(WOLFSSL_FAILURE));
++                XFREE(longList, NULL, DYNAMIC_TYPE_TMP_BUFFER);
++            }
++        }
+     #endif
+ #endif
+ #ifdef HAVE_ECC
+@@ -35744,7 +35771,6 @@ static int test_pkcs7_padding(void)
+     int outSz;
+     int ctOff = -1;
+     int ctLen = 0;
+-    int i;
+ 
+     XMEMSET(key, 0xAA, sizeof(key));
+     XMEMSET(plaintext, 'X', sizeof(plaintext));
+@@ -35767,32 +35793,10 @@ static int test_pkcs7_padding(void)
+         (word32)encodedSz, output, sizeof(output)), (int)sizeof(plaintext));
+     wc_PKCS7_Free(&pkcs7);
+ 
+-    /* Find ciphertext block in encoded DER */
+-    if (EXPECT_SUCCESS()) {
+-        for (i = encodedSz - 10; i > 10; i--) {
+-            if (encoded[i] == 0x04 || encoded[i] == 0x80) {
+-                int len, lbytes;
+-
+-                if (encoded[i+1] < 0x80) {
+-                    len = encoded[i+1]; lbytes = 1;
+-                }
+-                else if (encoded[i+1] == 0x81) {
+-                    len = encoded[i+2]; lbytes = 2;
+-                }
+-                else {
+-                    continue;
+-                }
+-                if (len > 0 && len % 16 == 0 &&
+-                    i + 1 + lbytes + len <= encodedSz) {
+-                    ctOff = i + 1 + lbytes;
+-                    ctLen = len;
+-                    break;
+-                }
+-            }
+-        }
+-    }
+-    ExpectIntGT(ctOff, 0);
+-    ExpectIntGE(ctLen, 32);
++    /* encryptedContent is the last element in the DER, so it ends at encodedSz;
++     * 27-byte plaintext -> 32-byte AES-256-CBC ciphertext. */
++    ctLen = 32;
++    ctOff = encodedSz - ctLen;
+ 
+     /* Corrupt an interior padding byte via CBC bit-flip */
+     if (EXPECT_SUCCESS()) {
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
index 5569df4d56..843d5071b4 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
@@ -29,6 +29,7 @@ SRC_URI = " \
     file://CVE-2026-6094-4.patch \
     file://CVE-2026-6094-5.patch \
     file://CVE-2026-6291.patch \
+    file://CVE-2026-6325.patch \
 "
 
 SRCREV = "1d363f3adceba9d1478230ede476a37b0dcdef24"

