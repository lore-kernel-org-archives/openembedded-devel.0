Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02165CCD19A
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:10:42 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.4460.1760609434183872195
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 03:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gDDJLOoG;
 spf=pass (domain: mvista.com, ip: 209.85.215.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b6a225b7e9eso354365a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 03:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1760609433; x=1761214233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/A4odrhFzVnMA6Iy6I7R/iejPnF5Oy0LDGyOytYc4SE=;
        b=gDDJLOoGv1A5vH9QiRtC/A91NntMe2twYWvQ9Ubvm9XdVyxY3nUMYXAkwGRjiqVQVc
         tkB+6XxgHTQjsBiPM9l3gn7eT8oKYaPB5P/ixVwIlcz0mEPtrN3qSlA+MO69qz2rGE3d
         e9smbN2KG+ah7HyDOc3v6u+BGjCIOX291BKiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760609433; x=1761214233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/A4odrhFzVnMA6Iy6I7R/iejPnF5Oy0LDGyOytYc4SE=;
        b=i1GYBBtPeKu6+pGNpFazvk9siIhP2YpoCnnSMHjaAoJIfAsGrP4XqNHW8qIUv7cuDT
         e+cetgW9UB6Jv5QJA3B6z1B5z8f+uVlTgTLuDpvsvmJ+LUYf2QNNLqmkY7JEr+J46W0f
         9QGRkgNiFGNFxc03Gk9DRQuRWiUdI5ScrDTwYkc0ffVQgk7tBmq7gz5cgl2VrUQ55kvt
         fa6w53w/P1q5yPp7hpkUdmMEWR0vazf4+gVEocTrr9xKrkmP2eKv3zUrXCiML8VD4N0R
         Bh7dOQyeYrOxB8NVVZA/vSfGr5P/aWGYx8FcmjnQMSSaUos0WM5cuzkEQcWD2+g+CQ8j
         EOng==
X-Gm-Message-State: AOJu0YwQWlA54ft6WnlwwWg4MzBau9H+lixFk1Sho1KJqGWMwkql5eh7
	X9CW0TV3JsFj7YleuQAkh4kel4xGgvqm2cihhtOXOJfSDAEAVbMOeApfafFSW2NDzsaXdGlzMOB
	1s77XCCc=
X-Gm-Gg: ASbGnctmb5JjoZVPjuEmghwEZ5sMZeq6j6QCQbt7RuP+8F3uORk+v2obFv3eckeYjfp
	kFkwL2AbExqs3/knzOdfCa5J3qf0msUBJHP5mQavpF2FZc8pvR8xGLo+SuPISE0oG6Ry/wrfyM4
	kqgS3p10jyz5JRtyvVPat6scMSvKnFl6X0oXr8FsXvt+IemnePdMkOEbgPxKvy1q8XwE+xk0h8t
	/9qLkzeA/BnC1DTDOaYIKvwMd08b7RHKy5rt4ZPFTTzC35Fgb7joJcY2D+gQOmfOTjXKh8oPOxp
	nCOMIy+GKjrrdrPEhdOTNYhUyKkVpAlrz7mwNh+talukD0jdJXBen5ef1ydSqakG4yEf+RTQHFn
	Tw378FZCqYSfVMkZ8hx2V1cgqbiG68I0mrjz0qjs35L6YB7zlrWHn/YDROWGiCov3NIciePJqGw
	x97DVoDwXbxLGf96Y=
X-Google-Smtp-Source: AGHT+IEn16Enb1aRiVjLWqV/qdpFzSNLNePL7cKkEIbWTQ007ee3+1qWEWL+breIA9/i93ZqinxoYg==
X-Received: by 2002:a17:903:8cc:b0:27d:69cc:990 with SMTP id d9443c01a7336-29027402f43mr432500165ad.49.1760609432888;
        Thu, 16 Oct 2025 03:10:32 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8fcc:1614:2a1b:7928:3155:7a64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7cebbsm24617685ad.64.2025.10.16.03.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:10:32 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH 2/7] redis: Fix CVE-2025-32023
Date: Thu, 16 Oct 2025 15:40:15 +0530
Message-Id: <20251016101020.279084-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251016101020.279084-1-vanusuri@mvista.com>
References: <20251016101020.279084-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 10:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120730

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/redis/redis/commit/f35b72dd1735f381337a2eb078083450cb98e237

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../redis/redis-7.0.13/CVE-2025-32023.patch   | 215 ++++++++++++++++++
 .../recipes-extended/redis/redis_7.0.13.bb    |   1 +
 2 files changed, 216 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-32023.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-32023.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-32023.patch
new file mode 100644
index 0000000000..41244ffe0a
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-32023.patch
@@ -0,0 +1,215 @@
+From f35b72dd1735f381337a2eb078083450cb98e237 Mon Sep 17 00:00:00 2001
+From: "debing.sun" <debing.sun@redis.com>
+Date: Wed, 7 May 2025 18:25:06 +0800
+Subject: [PATCH] Fix out of bounds write in hyperloglog commands
+ (CVE-2025-32023)
+
+Co-authored-by: oranagra <oran@redislabs.com>
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/f35b72dd1735f381337a2eb078083450cb98e237]
+CVE: CVE-2025-32023
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/hyperloglog.c          | 47 +++++++++++++++++++++++++++++++----
+ tests/unit/hyperloglog.tcl | 51 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 93 insertions(+), 5 deletions(-)
+
+diff --git a/src/hyperloglog.c b/src/hyperloglog.c
+index 1a74f479377..ca592a08e6d 100644
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
+index ee437189fb8..bc90eb210a9 100644
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
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.13.bb b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
index 22163d9e74..1c45784b6e 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2024-51741.patch \
            file://CVE-2025-21605.patch \
            file://CVE-2025-27151.patch \
+           file://CVE-2025-32023.patch \
            "
 SRC_URI[sha256sum] = "97065774d5fb8388eb0d8913458decfcb167d356e40d31dd01cd30c1cc391673"
 
-- 
2.25.1


