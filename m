Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937F5C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:16:03 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.15559.1752646546806119990
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=X5WOqVgF;
 spf=pass (domain: mvista.com, ip: 209.85.215.182, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b321bd36a41so5638730a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 23:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1752646546; x=1753251346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=riYFYXieUsvC3Ju5OgjTNrNJ//rqrzjrMcVi2/M13Qs=;
        b=X5WOqVgF6ULH/Di062KryNgvunNrLDFkkzZMA61wtRbdWYAMrQ3INBPGWV65C26i0O
         w9qlgV37gfreF9jayIi+/AvoxuGZUdtomCeP6Fq7gJyYlU9Ts8KqxKrgx1Mwf3mTDJu+
         nyPBxCyPee5kjcYx2pbSJlP4SVrnPzsOeYEB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752646546; x=1753251346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=riYFYXieUsvC3Ju5OgjTNrNJ//rqrzjrMcVi2/M13Qs=;
        b=XEtyg2Hzm2OuRL09+jw1O5O/vZMh+BMLDVNhrrc8ZVLiS2zVGla7a9buqjs3k3iTL1
         kioH8Et94TKNcAfGw5ZWlDKZ56dNhdbCK3WrtJaotuPOk8Um/FvShIwlKoMg6pC6tmZx
         fs0/K7xw1b1AsYamJNeb15i/qhTv1Mcfosnl5jkEGm6Lb4ljtcU6Z0KWcYw+Lazn388m
         kBc9cZzbrP0URrr2hiHQqKWmhrf5PsDwOo4XTMYeg8ITgr7IQdkcaAfVi6l9p7xpRZdc
         /9n0w6OYfjJE9Ut3dlaqW842QRUI9lTHkACnkcA3hZeq1NjVm1FlEcxUFuOfS7UgGzZa
         Xobg==
X-Gm-Message-State: AOJu0YwlUfsH3tKCkvoUXTsGMD0FpO0Ktx9+g+HveDxZLxOPAEgzSB91
	fGh9aPO4Lv4wK18r8fzs6jSaYcsOWOid6e8DVjIXNrdLm92WqzD16XRfcvnmgRT+cHv+5PWJbN6
	ifrat
X-Gm-Gg: ASbGncvlPzljx11nlBVgORVc2QD1NIIaIB+3ISx14axRwGutp6tGwsO+5vN9vRCpgqA
	oRG/Y0AJApp75WZq0YGD4Q+NIsWBTEwQIFIGcve+oMtAyfXrNiVVu0ysRZbzzri5hyd9IjpMWkr
	HW7vONQEQcsI0Q0PQR8AUl0TRUtJ0K+Jxh1CcDtEZpDzlGOW+qEQFmJUYlFBvGM/4A7WIO7DvbO
	dFqlJvk1rHmJiTge6R0l6ygzNcRJ3EzSCKon5W+6UAMRvGoYDQa3k2mqCG1EhaLrlvXQlEMzHMb
	OQLzIDwh5AKYJC/7C+ApsJHMmsIOcyYvQb3TAVsW+yjjNjdlZ64sfzeyJdikCqq5yZeYFGwtxTW
	3wA3ipkGHxYk2HzPaD/OVbvAOvhSNHK+QqNM=
X-Google-Smtp-Source: AGHT+IH0MQV8+wltr6DLAEKf/zEfgL9p77s6l5zHCWl7WxnKuyeCKNhuvPTH3fmVsQQQG8cPUfKHRQ==
X-Received: by 2002:a17:902:ef49:b0:235:779:edfd with SMTP id d9443c01a7336-23e25759752mr22870715ad.39.1752646545664;
        Tue, 15 Jul 2025 23:15:45 -0700 (PDT)
Received: from MVIN00016.mvista.com ([43.249.234.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42ad212sm117870455ad.80.2025.07.15.23.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 23:15:45 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][scarthgap][PATCH] redis: fix CVE-2025-32023
Date: Wed, 16 Jul 2025 11:45:12 +0530
Message-ID: <20250716061512.27366-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118570

Upstream-Status: Backport from https://github.com/redis/redis/commit/50188747cbfe43528d2719399a2a3c9599169445

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../redis/redis-7.2.8/CVE-2025-32023.patch    | 218 ++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_7.2.8.bb |   1 +
 2 files changed, 219 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-32023.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-32023.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-32023.patch
new file mode 100644
index 0000000000..eb7e81c0b9
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-32023.patch
@@ -0,0 +1,218 @@
+From 50188747cbfe43528d2719399a2a3c9599169445 Mon Sep 17 00:00:00 2001
+From: "debing.sun" <debing.sun@redis.com>
+Date: Wed, 7 May 2025 18:25:06 +0800
+Subject: [PATCH] Fix out of bounds write in hyperloglog commands
+ (CVE-2025-32023)
+
+Co-authored-by: oranagra <oran@redislabs.com>
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/50188747cbfe43528d2719399a2a3c9599169445]
+CVE: CVE-2025-32023
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.8.bb b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
index bf9de7a166..a1739b4f30 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0004-src-Do-not-reset-FINAL_LIBS.patch \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
+           file://CVE-2025-32023.patch \
           "
 
 SRC_URI[sha256sum] = "6be4fdfcdb2e5ac91454438246d00842d2671f792673390e742dfcaf1bf01574"
-- 
2.49.0


