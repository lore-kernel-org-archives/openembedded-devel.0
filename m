Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C94BCCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 19:49:47 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.28243.1759866582671005653
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 12:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VHQfFS3O;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-637a2543127so12324092a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 12:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759866581; x=1760471381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ooux8Uoy+fSCoafLKwK5R0iVoD3tD5ZGTjDlFh1mEO8=;
        b=VHQfFS3Oas6+FmVGPLbPltv8BInat1Ug2CSJWm5jm4mjyw5EWoBld3XX/ZjQQTfWhu
         GCLfBl2qfmAEgDzYbYwLf9RbYiWPguat39eN4WSi+KYp73m7be2SfAJWodlXXkGWPY8G
         H6azH3cCyOLowHh9uZ04jWyWQg9N1tVsnbaFaZqNLd+GEMKey8M+iiINMQQHo0clHmys
         cjiuiz7d8Kqd35QCrfjumwvqP5QnuiLIM635gGHs3RgmBw/eSSmZuj1B2IEPpWOn2vll
         t1iWz987SZiafQrLVQSFrEuHYcqNmUdlGcjSEBgKa7K/6qpU77SeZ3tlWFl+HsLkuLwI
         gjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759866581; x=1760471381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ooux8Uoy+fSCoafLKwK5R0iVoD3tD5ZGTjDlFh1mEO8=;
        b=hoO5NC6Gwf9O97x78c8rHbIpBRD6nL0T8UNy1lQx2x7zpTNBXUTuru0K93H55+p1Mj
         ZEaPsop/8D6+olp3LBQxhrAxQRPvXpSt6+JLI5bEL/2Frd8pmex+e+mvhu+Pwt6BamHC
         X+fB/f4JE6vc1S7crX5/rnzNrgYgcYY3reuGASzKXJ34skpG8MK9gRURKaQezXH+G5Ub
         TKlXxG97m6a4VZbcuL+hE/iki3I8pmFsTNt2qrfmBIe+UtKjtL73+6GZo9WU1AtOqaps
         JD/CK824V5LwwjVW3AExaHaiA2ydPhzj7ODWggDWqpvEZWGpjygTrklswF9gg063HfcZ
         r8vg==
X-Gm-Message-State: AOJu0YzN7z6ro7Txc+8cGqQpaYjviCWtKNbUrnr0JQFMsqLdFGRQvwcr
	vEyWzxOxNxkmFqMcErghmq0bMKL7n9D/QerXfOl54Uj6TJlZ8qk8j0Pn6pQ+rA==
X-Gm-Gg: ASbGncsffXnCfKOeCAt+AksZoQcryHaDPh8z7g//2bvNAMFpa+SYTM+FdedfZ+sBziE
	KIQ8bjwcfzhEmIokWJzIwMqnbRf+QTktpJX5hAHbaybroBqAh90O2SpoE9mc5g3E8ovk3jvETNz
	6bLebd8QFtvNmGvTIvIHf1Z8AW5E3iz4CexHuoEUPFLokX5QB5XioTunF1zkUTD65xwXd7VMKaf
	hygvjuI9cTt2zCMi2e0ghWnjZsphAPLi+xUH6nKb2Z5rgfXiGDgDCpGb0ldt7rwdfZMbjQ0plA+
	G0lSL1P44IY2WBr4l9dC3j1MY1Gk5T/JibAdRnV9nk89AZgmLgBiBxOoB2S6dUoSBGPAtT5yhV8
	oVnPYpngT0LL/cB4LZ+NTx9HK4+6WnZFu9BlUvnRriAyt
X-Google-Smtp-Source: AGHT+IE5iW4DZdCo+MQ+xwNSne/AzYJkp0XiSs8dlMKbulEeT4ubSgiCVs+vE0oGmz4H+yyvXgXWeQ==
X-Received: by 2002:a05:6402:35cb:b0:634:bb0c:728 with SMTP id 4fb4d7f45d1cf-639d5c2ae43mr611090a12.23.1759866580703;
        Tue, 07 Oct 2025 12:49:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6378810112bsm12961955a12.26.2025.10.07.12.49.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 12:49:40 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 3/4] redis: patch CVE-2025-32023
Date: Tue,  7 Oct 2025 21:49:35 +0200
Message-ID: <20251007194936.146845-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007194936.146845-1-skandigraun@gmail.com>
References: <20251007194936.146845-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 19:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120348

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-32023

Backport the patch mentioned in the details.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...s-write-in-hyperloglog-commands-CVE-.patch | 215 ++++++++++++++++++
 ...s-write-in-hyperloglog-commands-CVE-.patch | 215 ++++++++++++++++++
 .../recipes-extended/redis/redis_6.2.18.bb    |   1 +
 meta-oe/recipes-extended/redis/redis_7.2.8.bb |   1 +
 4 files changed, 432 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.2.8/0001-Fix-out-of-bounds-write-in-hyperloglog-commands-CVE-.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/0001-Fix-out-of-bounds-write-in-hyperloglog-commands-CVE-.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0001-Fix-out-of-bounds-write-in-hyperloglog-commands-CVE-.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/0001-Fix-out-of-bounds-write-in-hyperloglog-commands-CVE-.patch
new file mode 100644
index 0000000000..4949424a72
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.2.8/0001-Fix-out-of-bounds-write-in-hyperloglog-commands-CVE-.patch
@@ -0,0 +1,215 @@
+From 547b5c86a0882b03def5d418db906380f649acaa Mon Sep 17 00:00:00 2001
+From: "debing.sun" <debing.sun@redis.com>
+Date: Wed, 7 May 2025 18:25:06 +0800
+Subject: [PATCH] Fix out of bounds write in hyperloglog commands
+ (CVE-2025-32023)
+
+CVE: CVE-2025-32023
+Upstream-Status: Backport [https://github.com/redis/redis/commit/f35b72dd1735f381337a2eb078083450cb98e237]
+
+Co-authored-by: oranagra <oran@redislabs.com>
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/hyperloglog.c          | 47 +++++++++++++++++++++++++++++++----
+ tests/unit/hyperloglog.tcl | 51 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 93 insertions(+), 5 deletions(-)
+
+diff --git a/src/hyperloglog.c b/src/hyperloglog.c
+index 1a74f47..ca592a0 100644
+--- a/src/hyperloglog.c
++++ b/src/hyperloglog.c
+@@ -587,6 +587,7 @@ int hllSparseToDense(robj *o) {
+     struct hllhdr *hdr, *oldhdr = (struct hllhdr*)sparse;
+     int idx = 0, runlen, regval;
+     uint8_t *p = (uint8_t*)sparse, *end = p+sdslen(sparse);
++    int valid = 1;
+ 
+     /* If the representation is already the right one return ASAP. */
+     hdr = (struct hllhdr*) sparse;
+@@ -606,16 +607,27 @@ int hllSparseToDense(robj *o) {
+     while(p < end) {
+         if (HLL_SPARSE_IS_ZERO(p)) {
+             runlen = HLL_SPARSE_ZERO_LEN(p);
++            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
++                valid = 0;
++                break;
++            }
+             idx += runlen;
+             p++;
+         } else if (HLL_SPARSE_IS_XZERO(p)) {
+             runlen = HLL_SPARSE_XZERO_LEN(p);
++            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
++                valid = 0;
++                break;
++            }
+             idx += runlen;
+             p += 2;
+         } else {
+             runlen = HLL_SPARSE_VAL_LEN(p);
+             regval = HLL_SPARSE_VAL_VALUE(p);
+-            if ((runlen + idx) > HLL_REGISTERS) break; /* Overflow. */
++            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
++                valid = 0;
++                break;
++            }
+             while(runlen--) {
+                 HLL_DENSE_SET_REGISTER(hdr->registers,idx,regval);
+                 idx++;
+@@ -626,7 +638,7 @@ int hllSparseToDense(robj *o) {
+ 
+     /* If the sparse representation was valid, we expect to find idx
+      * set to HLL_REGISTERS. */
+-    if (idx != HLL_REGISTERS) {
++    if (!valid || idx != HLL_REGISTERS) {
+         sdsfree(dense);
+         return C_ERR;
+     }
+@@ -923,27 +935,40 @@ int hllSparseAdd(robj *o, unsigned char *ele, size_t elesize) {
+ void hllSparseRegHisto(uint8_t *sparse, int sparselen, int *invalid, int* reghisto) {
+     int idx = 0, runlen, regval;
+     uint8_t *end = sparse+sparselen, *p = sparse;
++    int valid = 1;
+ 
+     while(p < end) {
+         if (HLL_SPARSE_IS_ZERO(p)) {
+             runlen = HLL_SPARSE_ZERO_LEN(p);
++            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
++                valid = 0;
++                break;
++            }
+             idx += runlen;
+             reghisto[0] += runlen;
+             p++;
+         } else if (HLL_SPARSE_IS_XZERO(p)) {
+             runlen = HLL_SPARSE_XZERO_LEN(p);
++            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
++                valid = 0;
++                break;
++            }
+             idx += runlen;
+             reghisto[0] += runlen;
+             p += 2;
+         } else {
+             runlen = HLL_SPARSE_VAL_LEN(p);
+             regval = HLL_SPARSE_VAL_VALUE(p);
++            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
++                valid = 0;
++                break;
++            }
+             idx += runlen;
+             reghisto[regval] += runlen;
+             p++;
+         }
+     }
+-    if (idx != HLL_REGISTERS && invalid) *invalid = 1;
++    if ((!valid || idx != HLL_REGISTERS) && invalid) *invalid = 1;
+ }
+ 
+ /* ========================= HyperLogLog Count ==============================
+@@ -1091,22 +1116,34 @@ int hllMerge(uint8_t *max, robj *hll) {
+     } else {
+         uint8_t *p = hll->ptr, *end = p + sdslen(hll->ptr);
+         long runlen, regval;
++        int valid = 1;
+ 
+         p += HLL_HDR_SIZE;
+         i = 0;
+         while(p < end) {
+             if (HLL_SPARSE_IS_ZERO(p)) {
+                 runlen = HLL_SPARSE_ZERO_LEN(p);
++                if ((runlen + i) > HLL_REGISTERS) { /* Overflow. */
++                    valid = 0;
++                    break;
++                }
+                 i += runlen;
+                 p++;
+             } else if (HLL_SPARSE_IS_XZERO(p)) {
+                 runlen = HLL_SPARSE_XZERO_LEN(p);
++                if ((runlen + i) > HLL_REGISTERS) { /* Overflow. */
++                    valid = 0;
++                    break;
++                }
+                 i += runlen;
+                 p += 2;
+             } else {
+                 runlen = HLL_SPARSE_VAL_LEN(p);
+                 regval = HLL_SPARSE_VAL_VALUE(p);
+-                if ((runlen + i) > HLL_REGISTERS) break; /* Overflow. */
++                if ((runlen + i) > HLL_REGISTERS) { /* Overflow. */
++                    valid = 0;
++                    break;
++                }
+                 while(runlen--) {
+                     if (regval > max[i]) max[i] = regval;
+                     i++;
+@@ -1114,7 +1151,7 @@ int hllMerge(uint8_t *max, robj *hll) {
+                 p++;
+             }
+         }
+-        if (i != HLL_REGISTERS) return C_ERR;
++        if (!valid || i != HLL_REGISTERS) return C_ERR;
+     }
+     return C_OK;
+ }
+diff --git a/tests/unit/hyperloglog.tcl b/tests/unit/hyperloglog.tcl
+index ee43718..bc90eb2 100644
+--- a/tests/unit/hyperloglog.tcl
++++ b/tests/unit/hyperloglog.tcl
+@@ -137,6 +137,57 @@ start_server {tags {"hll"}} {
+         set e
+     } {*WRONGTYPE*}
+ 
++    test {Corrupted sparse HyperLogLogs doesn't cause overflow and out-of-bounds with XZERO opcode} {
++        r del hll
++        
++        # Create a sparse-encoded HyperLogLog header
++        set pl [string cat "HYLL" [binary format c12 {1 0 0 0 0 0 0 0 0 0 0 0}]]
++
++        # Create an XZERO opcode with the maximum run length of 16384(2^14)
++        set runlen [expr 16384 - 1]
++        set chunk [binary format cc [expr {0b01000000 | ($runlen >> 8)}] [expr {$runlen & 0xff}]]
++        # Fill the HLL with more than 131072(2^17) XZERO opcodes to make the total
++        # run length exceed 4GB, will cause an integer overflow.
++        set repeat [expr 131072 + 1000]
++        for {set i 0} {$i < $repeat} {incr i} {
++            append pl $chunk
++        }
++
++        # Create a VAL opcode with a value that will cause out-of-bounds.
++        append pl [binary format c 0b11111111]
++        r set hll $pl
++
++        # This should not overflow and out-of-bounds.
++        assert_error {*INVALIDOBJ*} {r pfcount hll hll}
++        assert_error {*INVALIDOBJ*} {r pfdebug getreg hll}
++        r ping
++    }
++
++    test {Corrupted sparse HyperLogLogs doesn't cause overflow and out-of-bounds with ZERO opcode} {
++        r del hll
++        
++        # Create a sparse-encoded HyperLogLog header
++        set pl [string cat "HYLL" [binary format c12 {1 0 0 0 0 0 0 0 0 0 0 0}]]
++
++        # # Create an ZERO opcode with the maximum run length of 64(2^6)
++        set chunk [binary format c [expr {0b00000000 | 0x3f}]]
++        # Fill the HLL with more than 33554432(2^17) ZERO opcodes to make the total
++        # run length exceed 4GB, will cause an integer overflow.
++        set repeat [expr 33554432 + 1000]
++        for {set i 0} {$i < $repeat} {incr i} {
++            append pl $chunk
++        }
++
++        # Create a VAL opcode with a value that will cause out-of-bounds.
++        append pl [binary format c 0b11111111]
++        r set hll $pl
++
++        # This should not overflow and out-of-bounds.
++        assert_error {*INVALIDOBJ*} {r pfcount hll hll}
++        assert_error {*INVALIDOBJ*} {r pfdebug getreg hll}
++        r ping
++    }
++
+     test {Corrupted dense HyperLogLogs are detected: Wrong length} {
+         r del hll
+         r pfadd hll a b c
diff --git a/meta-oe/recipes-extended/redis/redis/0001-Fix-out-of-bounds-write-in-hyperloglog-commands-CVE-.patch b/meta-oe/recipes-extended/redis/redis/0001-Fix-out-of-bounds-write-in-hyperloglog-commands-CVE-.patch
new file mode 100644
index 0000000000..7b801949dd
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/0001-Fix-out-of-bounds-write-in-hyperloglog-commands-CVE-.patch
@@ -0,0 +1,215 @@
+From 8f26e5acc5e5db6040e23aeeb96b0886e02d627e Mon Sep 17 00:00:00 2001
+From: "debing.sun" <debing.sun@redis.com>
+Date: Wed, 7 May 2025 18:25:06 +0800
+Subject: [PATCH] Fix out of bounds write in hyperloglog commands
+ (CVE-2025-32023)
+
+CVE: CVE-2025-32023
+Upstream-Status: Backport [https://github.com/redis/redis/commit/df47cffd065fc886a76460959a6e2205117d0d30]
+
+Co-authored-by: oranagra <oran@redislabs.com>
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/hyperloglog.c          | 47 +++++++++++++++++++++++++++++++----
+ tests/unit/hyperloglog.tcl | 51 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 93 insertions(+), 5 deletions(-)
+
+diff --git a/src/hyperloglog.c b/src/hyperloglog.c
+index 75a0422..7cabfa1 100644
+--- a/src/hyperloglog.c
++++ b/src/hyperloglog.c
+@@ -586,6 +586,7 @@ int hllSparseToDense(robj *o) {
+     struct hllhdr *hdr, *oldhdr = (struct hllhdr*)sparse;
+     int idx = 0, runlen, regval;
+     uint8_t *p = (uint8_t*)sparse, *end = p+sdslen(sparse);
++    int valid = 1;
+ 
+     /* If the representation is already the right one return ASAP. */
+     hdr = (struct hllhdr*) sparse;
+@@ -605,16 +606,27 @@ int hllSparseToDense(robj *o) {
+     while(p < end) {
+         if (HLL_SPARSE_IS_ZERO(p)) {
+             runlen = HLL_SPARSE_ZERO_LEN(p);
++            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
++                valid = 0;
++                break;
++            }
+             idx += runlen;
+             p++;
+         } else if (HLL_SPARSE_IS_XZERO(p)) {
+             runlen = HLL_SPARSE_XZERO_LEN(p);
++            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
++                valid = 0;
++                break;
++            }
+             idx += runlen;
+             p += 2;
+         } else {
+             runlen = HLL_SPARSE_VAL_LEN(p);
+             regval = HLL_SPARSE_VAL_VALUE(p);
+-            if ((runlen + idx) > HLL_REGISTERS) break; /* Overflow. */
++            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
++                valid = 0;
++                break;
++            }
+             while(runlen--) {
+                 HLL_DENSE_SET_REGISTER(hdr->registers,idx,regval);
+                 idx++;
+@@ -625,7 +637,7 @@ int hllSparseToDense(robj *o) {
+ 
+     /* If the sparse representation was valid, we expect to find idx
+      * set to HLL_REGISTERS. */
+-    if (idx != HLL_REGISTERS) {
++    if (!valid || idx != HLL_REGISTERS) {
+         sdsfree(dense);
+         return C_ERR;
+     }
+@@ -911,27 +923,40 @@ int hllSparseAdd(robj *o, unsigned char *ele, size_t elesize) {
+ void hllSparseRegHisto(uint8_t *sparse, int sparselen, int *invalid, int* reghisto) {
+     int idx = 0, runlen, regval;
+     uint8_t *end = sparse+sparselen, *p = sparse;
++    int valid = 1;
+ 
+     while(p < end) {
+         if (HLL_SPARSE_IS_ZERO(p)) {
+             runlen = HLL_SPARSE_ZERO_LEN(p);
++            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
++                valid = 0;
++                break;
++            }
+             idx += runlen;
+             reghisto[0] += runlen;
+             p++;
+         } else if (HLL_SPARSE_IS_XZERO(p)) {
+             runlen = HLL_SPARSE_XZERO_LEN(p);
++            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
++                valid = 0;
++                break;
++            }
+             idx += runlen;
+             reghisto[0] += runlen;
+             p += 2;
+         } else {
+             runlen = HLL_SPARSE_VAL_LEN(p);
+             regval = HLL_SPARSE_VAL_VALUE(p);
++            if ((runlen + idx) > HLL_REGISTERS) { /* Overflow. */
++                valid = 0;
++                break;
++            }
+             idx += runlen;
+             reghisto[regval] += runlen;
+             p++;
+         }
+     }
+-    if (idx != HLL_REGISTERS && invalid) *invalid = 1;
++    if ((!valid || idx != HLL_REGISTERS) && invalid) *invalid = 1;
+ }
+ 
+ /* ========================= HyperLogLog Count ==============================
+@@ -1079,22 +1104,34 @@ int hllMerge(uint8_t *max, robj *hll) {
+     } else {
+         uint8_t *p = hll->ptr, *end = p + sdslen(hll->ptr);
+         long runlen, regval;
++        int valid = 1;
+ 
+         p += HLL_HDR_SIZE;
+         i = 0;
+         while(p < end) {
+             if (HLL_SPARSE_IS_ZERO(p)) {
+                 runlen = HLL_SPARSE_ZERO_LEN(p);
++                if ((runlen + i) > HLL_REGISTERS) { /* Overflow. */
++                    valid = 0;
++                    break;
++                }
+                 i += runlen;
+                 p++;
+             } else if (HLL_SPARSE_IS_XZERO(p)) {
+                 runlen = HLL_SPARSE_XZERO_LEN(p);
++                if ((runlen + i) > HLL_REGISTERS) { /* Overflow. */
++                    valid = 0;
++                    break;
++                }
+                 i += runlen;
+                 p += 2;
+             } else {
+                 runlen = HLL_SPARSE_VAL_LEN(p);
+                 regval = HLL_SPARSE_VAL_VALUE(p);
+-                if ((runlen + i) > HLL_REGISTERS) break; /* Overflow. */
++                if ((runlen + i) > HLL_REGISTERS) { /* Overflow. */
++                    valid = 0;
++                    break;
++                }
+                 while(runlen--) {
+                     if (regval > max[i]) max[i] = regval;
+                     i++;
+@@ -1102,7 +1139,7 @@ int hllMerge(uint8_t *max, robj *hll) {
+                 p++;
+             }
+         }
+-        if (i != HLL_REGISTERS) return C_ERR;
++        if (!valid || i != HLL_REGISTERS) return C_ERR;
+     }
+     return C_OK;
+ }
+diff --git a/tests/unit/hyperloglog.tcl b/tests/unit/hyperloglog.tcl
+index db26a2e..a1ae520 100644
+--- a/tests/unit/hyperloglog.tcl
++++ b/tests/unit/hyperloglog.tcl
+@@ -106,6 +106,57 @@ start_server {tags {"hll"}} {
+         set e
+     } {*WRONGTYPE*}
+ 
++    test {Corrupted sparse HyperLogLogs doesn't cause overflow and out-of-bounds with XZERO opcode} {
++        r del hll
++        
++        # Create a sparse-encoded HyperLogLog header
++        set pl [string cat "HYLL" [binary format c12 {1 0 0 0 0 0 0 0 0 0 0 0}]]
++
++        # Create an XZERO opcode with the maximum run length of 16384(2^14)
++        set runlen [expr 16384 - 1]
++        set chunk [binary format cc [expr {0b01000000 | ($runlen >> 8)}] [expr {$runlen & 0xff}]]
++        # Fill the HLL with more than 131072(2^17) XZERO opcodes to make the total
++        # run length exceed 4GB, will cause an integer overflow.
++        set repeat [expr 131072 + 1000]
++        for {set i 0} {$i < $repeat} {incr i} {
++            append pl $chunk
++        }
++
++        # Create a VAL opcode with a value that will cause out-of-bounds.
++        append pl [binary format c 0b11111111]
++        r set hll $pl
++
++        # This should not overflow and out-of-bounds.
++        assert_error {*INVALIDOBJ*} {r pfcount hll hll}
++        assert_error {*INVALIDOBJ*} {r pfdebug getreg hll}
++        r ping
++    }
++
++    test {Corrupted sparse HyperLogLogs doesn't cause overflow and out-of-bounds with ZERO opcode} {
++        r del hll
++        
++        # Create a sparse-encoded HyperLogLog header
++        set pl [string cat "HYLL" [binary format c12 {1 0 0 0 0 0 0 0 0 0 0 0}]]
++
++        # # Create an ZERO opcode with the maximum run length of 64(2^6)
++        set chunk [binary format c [expr {0b00000000 | 0x3f}]]
++        # Fill the HLL with more than 33554432(2^17) ZERO opcodes to make the total
++        # run length exceed 4GB, will cause an integer overflow.
++        set repeat [expr 33554432 + 1000]
++        for {set i 0} {$i < $repeat} {incr i} {
++            append pl $chunk
++        }
++
++        # Create a VAL opcode with a value that will cause out-of-bounds.
++        append pl [binary format c 0b11111111]
++        r set hll $pl
++
++        # This should not overflow and out-of-bounds.
++        assert_error {*INVALIDOBJ*} {r pfcount hll hll}
++        assert_error {*INVALIDOBJ*} {r pfdebug getreg hll}
++        r ping
++    }
++
+     test {Corrupted dense HyperLogLogs are detected: Wrong length} {
+         r del hll
+         r pfadd hll a b c
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.18.bb b/meta-oe/recipes-extended/redis/redis_6.2.18.bb
index 179701bbf8..9ce476e14e 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.18.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.18.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            file://0001-CVE-2025-27151.patch \
+           file://0001-Fix-out-of-bounds-write-in-hyperloglog-commands-CVE-.patch \
           "
 
 SRC_URI[sha256sum] = "470c75bac73d7390be4dd66479c6f29e86371c5d380ce0c7efb4ba2bbda3612d"
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.8.bb b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
index fe811dcc7e..f5ea3eaf5b 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            file://0001-Check-length-of-AOF-file-name-in-redis-check-aof-CVE.patch \
+           file://0001-Fix-out-of-bounds-write-in-hyperloglog-commands-CVE-.patch \
           "
 
 SRC_URI[sha256sum] = "6be4fdfcdb2e5ac91454438246d00842d2671f792673390e742dfcaf1bf01574"

