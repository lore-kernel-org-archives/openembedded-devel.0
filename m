Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B626F45A12
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 22:56:44 +0000 (UTC)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.167844.1775861799461868121
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 15:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V3dm3nP8;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1279eced0b9so3870197c88.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 15:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775861798; x=1776466598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GpOHAns5+Mrb6YCpVTZx1+QkpgVy5RdBhH4cB9A/tW8=;
        b=V3dm3nP8HYrXfN2Wwk6zWYhQ7yNQkAXJEs0CG385HM8JiyU99mPKwepTtUOfzgQPT0
         mFEADu/28dJPIR9X+j1pun/mMLAxx6q7aP1+mrpIuZ8n5z0G8ig9DI18FNBk0H20jKbW
         o0lukVHNypA/eIxkfmdgFkavEwvpY5gHi9GPhKCkKxejAgH0yb5RkDHmIVr57LoJLp5s
         JH26K67YsmDOdmZFQ0CB2FAzXgYb+iwG86Gii3Yvs7Uf3hzBTXYK/5BF4MBD5if0k883
         iPIZxNWay/nqRsyYU4hFKu2oDAfS2HgMaHbG8UpAjYYCw2Ca7jfhNkqyQMy1uPDDme02
         SG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775861798; x=1776466598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpOHAns5+Mrb6YCpVTZx1+QkpgVy5RdBhH4cB9A/tW8=;
        b=WVNE7Xqn5lwWtdOsHwSv2Bwu1VGIHCKkpit8NmCAMI8RG1StmCtAz4oGn+h9LW18+F
         /UZuLLMtvFOyaXAhBySLcL47wfn2jd+/XcmuCTHwbofybE3x4pR0G6N4K0Bc2NdOg0NT
         L/wUeqJzrTw+8Dg8QYSexv4SaGghrRFOdbKxIrBLnPsrvPRBONCi8uj6XkCZ+4RIAtmA
         HNvB/AXOwR0+i4wMafXd8T9+dfYt17vH46i4jZPC5ZeOlnDf5jPzLkHXN/nfMOU3aItF
         gzIdPEbx/kMAAM5IC0QhREd8h4s10ORO75maLVdrZqVSzsnrE6t0oOo20jlSfonurKbK
         mCeg==
X-Gm-Message-State: AOJu0YwDhKu6+O4+h/EToNGv2sbfxeq05lNhWn0Hh/Qo3cjKd9PhsiB6
	8gb7yAoU26DA9Iyw/vrkGFuB6ZxKD3LxmpJ+QMeOj9QXwW9Eq++fbvFOJn0LbRoG
X-Gm-Gg: AeBDievlZVm3se+Tbxp6dHRiIsNREp3pzjwESzJLEKK0mk7LwqEAbDYy/nDShcHk+Kr
	tyCbAzWwh+I+2O4knE6u71HcKTAwUvFoK4pylJyLIk+n8IYuakWp/jpZ7z2mwdNY6Z1qnrhNRKs
	njafwDvjKu/RW9w+wzZaihqhKUjFzhA+BnvawEwXJ63mH6za4lvaR3B+pR6rJaNRDhnLSg8DJ2/
	xYyxGA7uTneCR1JMh7KdkIxFPPmfsTK72k0UG7jMYawf7TWwz17eLn+0ZuihvMmrz0dgmHfvpkp
	cbPtAJmgYQqzThcNbqPkTAqTK9F840WtOC5TcHiOtngtZ8C5f5bb3lixY3owSMfg8OanK+SRwhO
	pjuDqGgiQt76RikSw6y/4fDZz9a4a99x5DCZv7oM8vsbvKars1c3wZ8y4G+T1tgLZVLkDmFYMGO
	msjX2E+x6tDJFBDu/toNq30o813CfO7BdAs/oQax6rUCe2NTy68KvEhf7cZHic/bO5BAgVSUdg/
	/Ron98Nz96sMtY7xgQJx9Hi7mN1nJ6UmuirOe9bMYpDPXjiEYH1wNTq7utb
X-Received: by 2002:a05:7022:69a2:b0:12c:8b9:7208 with SMTP id a92af1059eb24-12c34eeb95cmr2948417c88.26.1775861798167;
        Fri, 10 Apr 2026 15:56:38 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c3459faa7sm6157150c88.2.2026.04.10.15.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:56:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] cyrus-sasl: Fix build with std=gnu23
Date: Fri, 10 Apr 2026 15:56:35 -0700
Message-ID: <20260410225635.411057-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 22:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126246

clang has dropped K&R style with std=c23

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...R-function-definitions-to-ANSI-C-sty.patch | 301 ++++++++++++++++++
 .../cyrus-sasl/cyrus-sasl_2.1.28.bb           |   1 +
 2 files changed, 302 insertions(+)
 create mode 100644 meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/0001-style-convert-K-R-function-definitions-to-ANSI-C-sty.patch

diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/0001-style-convert-K-R-function-definitions-to-ANSI-C-sty.patch b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/0001-style-convert-K-R-function-definitions-to-ANSI-C-sty.patch
new file mode 100644
index 0000000000..d8efc9b5d7
--- /dev/null
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/0001-style-convert-K-R-function-definitions-to-ANSI-C-sty.patch
@@ -0,0 +1,301 @@
+From 80bc0c1bfff769728d18ac5d9e22755e60fc23d8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 10 Apr 2026 13:08:52 -0700
+Subject: [PATCH] style: convert K&R function definitions to ANSI C style in
+ md5.c
+
+Replace old-style K&R function parameter declarations with modern ANSI
+C prototypes across all functions in lib/md5.c. Also strip trailing
+whitespace throughout the file. No functional changes.
+
+Upstream-Status: Inappropriate [md5 does not exist in master branch]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ lib/md5.c       | 231 +++++++++++++++++++++++++-----------------------
+ saslauthd/md5.c |  77 +++++++++-------
+ 2 files changed, 163 insertions(+), 145 deletions(-)
+
+--- a/saslauthd/md5.c
++++ b/saslauthd/md5.c
+@@ -98,8 +98,9 @@ Rotation is separate from addition to pr
+ /* MD5 initialization. Begins an MD5 operation, writing a new context.
+ */
+
+-void _saslauthd_MD5Init (context)
+-MD5_CTX *context; /* context */
++void _saslauthd_MD5Init (
++MD5_CTX *context /* context */
++)
+ {
+        context->count[0] = context->count[1] = 0;
+
+@@ -114,10 +115,11 @@ MD5_CTX *context; /* context */
+        operation, processing another message block, and updating the context.
+ */
+
+-void _saslauthd_MD5Update (context, input, inputLen)
+-MD5_CTX *context; /* context */
+-unsigned char *input; /* input block */
+-unsigned int inputLen; /* length of input block */
++void _saslauthd_MD5Update (
++MD5_CTX *context, /* context */
++unsigned char *input, /* input block */
++unsigned int inputLen /* length of input block */
++)
+ {
+        unsigned int i, index, partLen;
+
+@@ -159,9 +161,10 @@ unsigned int inputLen; /* length of inpu
+        the message digest and zeroizing the context.
+ */
+
+-void _saslauthd_MD5Final (digest, context)
+-unsigned char digest[16]; /* message digest */
+-MD5_CTX *context; /* context */
++void _saslauthd_MD5Final (
++unsigned char digest[16], /* message digest */
++MD5_CTX *context /* context */
++)
+ {
+        unsigned char bits[8];
+        unsigned int index, padLen;
+@@ -186,9 +189,10 @@ MD5_CTX *context; /* context */
+
+ /* MD5 basic transformation. Transforms state based on block. */
+
+-static void MD5Transform (state, block)
+-UINT4 state[4];
+-unsigned char block[64];
++static void MD5Transform (
++UINT4 state[4],
++unsigned char block[64]
++)
+ {
+        UINT4 a = state[0], b = state[1], c = state[2], d = state[3], x[16];
+
+@@ -281,10 +285,11 @@ unsigned char block[64];
+
+         */
+
+-static void Encode (output, input, len)
+-unsigned char *output;
+-UINT4 *input;
+-unsigned int len;
++static void Encode (
++unsigned char *output,
++UINT4 *input,
++unsigned int len
++)
+ {
+        unsigned int i, j;
+
+@@ -301,10 +306,11 @@ unsigned int len;
+
+         */
+
+-static void Decode (output, input, len)
+-UINT4 *output;
+-unsigned char *input;
+-unsigned int len;
++static void Decode (
++UINT4 *output,
++unsigned char *input,
++unsigned int len
++)
+ {
+        unsigned int i, j;
+
+@@ -317,10 +323,11 @@ unsigned int len;
+
+         */
+
+-static void MD5_memcpy (output, input, len)
+-POINTER output;
+-POINTER input;
+-unsigned int len;
++static void MD5_memcpy (
++POINTER output,
++POINTER input,
++unsigned int len
++)
+ {
+        unsigned int i;
+
+@@ -331,10 +338,11 @@ unsigned int len;
+ /* Note: Replace "for loop" with standard memset if possible.
+ */
+
+-static void MD5_memset (output, value, len)
+-POINTER output;
+-int value;
+-unsigned int len;
++static void MD5_memset (
++POINTER output,
++int value,
++unsigned int len
++)
+ {
+        unsigned int i;
+
+@@ -452,12 +460,13 @@ void _saslauthd_hmac_md5_final(unsigned
+ }
+
+
+-void _saslauthd_hmac_md5(text, text_len, key, key_len, digest)
+-const unsigned char* text; /* pointer to data stream */
+-int text_len; /* length of data stream */
+-const unsigned char* key; /* pointer to authentication key */
+-int key_len; /* length of authentication key */
+-unsigned char *digest; /* caller digest to be filled in */
++void _saslauthd_hmac_md5(
++const unsigned char* text, /* pointer to data stream */
++int text_len, /* length of data stream */
++const unsigned char* key, /* pointer to authentication key */
++int key_len, /* length of authentication key */
++unsigned char *digest /* caller digest to be filled in */
++)
+ {
+   MD5_CTX context;
+
+--- a/lib/md5.c
++++ b/lib/md5.c
+@@ -98,8 +98,9 @@ Rotation is separate from addition to pr
+ /* MD5 initialization. Begins an MD5 operation, writing a new context.
+ */
+
+-void _sasl_MD5Init (context)
+-MD5_CTX *context; /* context */
++void _sasl_MD5Init (
++MD5_CTX *context /* context */
++)
+ {
+        context->count[0] = context->count[1] = 0;
+
+@@ -114,10 +115,11 @@ MD5_CTX *context; /* context */
+        operation, processing another message block, and updating the context.
+ */
+
+-void _sasl_MD5Update (context, input, inputLen)
+-MD5_CTX *context; /* context */
+-const unsigned char *input; /* input block */
+-unsigned int inputLen; /* length of input block */
++void _sasl_MD5Update (
++MD5_CTX *context, /* context */
++const unsigned char *input, /* input block */
++unsigned int inputLen /* length of input block */
++)
+ {
+        unsigned int i, index, partLen;
+
+@@ -159,9 +161,10 @@ unsigned int inputLen; /* length of inpu
+        the message digest and zeroizing the context.
+ */
+
+-void _sasl_MD5Final (digest, context)
+-unsigned char digest[16]; /* message digest */
+-MD5_CTX *context; /* context */
++void _sasl_MD5Final (
++unsigned char digest[16], /* message digest */
++MD5_CTX *context /* context */
++)
+ {
+        unsigned char bits[8];
+        unsigned int index, padLen;
+@@ -186,9 +189,10 @@ MD5_CTX *context; /* context */
+
+ /* MD5 basic transformation. Transforms state based on block. */
+
+-static void MD5Transform (state, block)
+-UINT4 state[4];
+-const unsigned char block[64];
++static void MD5Transform (
++UINT4 state[4],
++const unsigned char block[64]
++)
+ {
+        UINT4 a = state[0], b = state[1], c = state[2], d = state[3], x[16];
+
+@@ -281,10 +285,11 @@ const unsigned char block[64];
+
+         */
+
+-static void Encode (output, input, len)
+-unsigned char *output;
+-UINT4 *input;
+-unsigned int len;
++static void Encode (
++unsigned char *output,
++UINT4 *input,
++unsigned int len
++)
+ {
+        unsigned int i, j;
+
+@@ -301,10 +306,11 @@ unsigned int len;
+
+         */
+
+-static void Decode (output, input, len)
+-UINT4 *output;
+-const unsigned char *input;
+-unsigned int len;
++static void Decode (
++UINT4 *output,
++const unsigned char *input,
++unsigned int len
++)
+ {
+        unsigned int i, j;
+
+@@ -317,10 +323,11 @@ unsigned int len;
+
+         */
+
+-static void MD5_memcpy (output, input, len)
+-POINTER output;
+-POINTER input;
+-unsigned int len;
++static void MD5_memcpy (
++POINTER output,
++POINTER input,
++unsigned int len
++)
+ {
+        unsigned int i;
+
+@@ -331,10 +338,11 @@ unsigned int len;
+ /* Note: Replace "for loop" with standard memset if possible.
+ */
+
+-static void MD5_memset (output, value, len)
+-POINTER output;
+-int value;
+-unsigned int len;
++static void MD5_memset (
++POINTER output,
++int value,
++unsigned int len
++)
+ {
+        unsigned int i;
+
+@@ -452,12 +460,13 @@ void _sasl_hmac_md5_final(unsigned char
+ }
+
+
+-void _sasl_hmac_md5(text, text_len, key, key_len, digest)
+-const unsigned char* text; /* pointer to data stream */
+-int text_len; /* length of data stream */
+-const unsigned char* key; /* pointer to authentication key */
+-int key_len; /* length of authentication key */
+-unsigned char *digest; /* caller digest to be filled in */
++void _sasl_hmac_md5(
++const unsigned char* text, /* pointer to data stream */
++int text_len, /* length of data stream */
++const unsigned char* key, /* pointer to authentication key */
++int key_len, /* length of authentication key */
++unsigned char *digest /* caller digest to be filled in */
++)
+ {
+   MD5_CTX context;
+
diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
index bd15b0bda8..26ec8a71a1 100644
--- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
@@ -20,6 +20,7 @@ SRC_URI = " \
     file://0001-configure-prototypes.patch \
     file://0002-Fix-incompatible-pointer-types-error-with-gcc-15.patch \
     file://0003-Add-compatibility-for-gcc-15-869.patch \
+    file://0001-style-convert-K-R-function-definitions-to-ANSI-C-sty.patch \
 "

 UPSTREAM_CHECK_URI = "https://github.com/cyrusimap/cyrus-sasl/archives"

