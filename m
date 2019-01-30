Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCD57C1F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 05:29:22 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q1so10877576pfi.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2019 21:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=e89RoUbPU3V96B16Un3pD7Y4pGfQLyU0rSW3XMs4EpE=;
	b=NYArGPRCjWLt5MHNNAbebmJxUeYdRrBu7pwnuZmGGJBko1em+NSu7m7HGq26ufURRH
	JT0CRkFffpV2KLEVyfhZr5DaEs9D5qoEg7MSpEmXkdNRws3va8sNNjrNNeYRf8RZ7SLq
	IMLVLSqAy6VzfCN0UfW0eZktzUp7yRy69ugBU8JWaIyu86Jjk4igM2nr/CStAVdg+nTx
	GmvKb7J6oPVj5axASliDr2M2FRyyajPVQ7oOvcADNRm/r2GHawAMrPHxsOhs/ma8R0xL
	2HsWUDZPjSceJ8a3V7dZVI+tods1VVVfvaoYw77IImsvPLieZ2wJDzMVK+JlJfB2FLRX
	Bo0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=e89RoUbPU3V96B16Un3pD7Y4pGfQLyU0rSW3XMs4EpE=;
	b=UKr4M/TxzGi85/aD3J/HejO1eJnzq0q8lMCy6e34VgCcoJYib/Rp7+UfQ4jkZB/adx
	f66/9GZx2m+Qs7ehIX3ee+8elq0S3eHxFFhfF7CletvNv/IMtqvRHHyotpeQUyy7CtP8
	CPik930urclFrH7na1AHRUEam6pLM2Lqbk+mG1k2i+wJJZki1Xi9Xo4YRaVfnsQoEP7c
	JYeirLSQHjT521WFhlYfpU86soux92q6kDUAuE9saF4AZ1CPAGKt/zq1y6Mz0gK8Td7b
	+2Ft8ySvBrbls7So5VRj+OVWTX5RMb6bO10E9IMBEocFCkCNMSFZiB9pPet//uuwTRYa
	EEcg==
X-Gm-Message-State: AJcUukeqzFDYI+tynuidNsoGAAfvDAA3jtx8xcYj1GO3MW3FXMQoDCHZ
	aFLDtw0+AtfccJB/mRuaNpueyqBleAI=
X-Google-Smtp-Source: ALg8bN7dejHSCYnpfGo8UdaXpwg20RfFH1nzBgJ3+LHNMQiAJKxIbOcppm3G4q7K/P0/JSxMRMJmEg==
X-Received: by 2002:a63:ce08:: with SMTP id y8mr26090905pgf.388.1548826163042; 
	Tue, 29 Jan 2019 21:29:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	v190sm652633pfv.26.2019.01.29.21.29.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 21:29:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2019 21:29:06 -0800
Message-Id: <20190130052911.36336-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130052911.36336-1-raj.khem@gmail.com>
References: <20190130052911.36336-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/8] tinymembench: Fix build with clang assembler
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2019 05:29:22 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...asm-Delete-.func-.endfunc-directives.patch | 444 ++++++++++++++++++
 .../tinymembench/tinymembench_git.bb          |   4 +-
 2 files changed, 447 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/tinymembench/tinymembench/0001-asm-Delete-.func-.endfunc-directives.patch

diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench/0001-asm-Delete-.func-.endfunc-directives.patch b/meta-oe/recipes-benchmark/tinymembench/tinymembench/0001-asm-Delete-.func-.endfunc-directives.patch
new file mode 100644
index 0000000000..c090700763
--- /dev/null
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench/0001-asm-Delete-.func-.endfunc-directives.patch
@@ -0,0 +1,444 @@
+From b0a64ddebb517a1678c44d9baf24d8bbe39d02cd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 29 Jan 2019 13:15:07 -0800
+Subject: [PATCH] asm: Delete .func/.endfunc directives
+
+These are useful only with stabs debug format, which is not used on
+linux systems, gas ignores them silently, but clang assembler does not
+and rightly so.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ aarch64-asm.S | 14 +-------------
+ arm-neon.S    | 24 ------------------------
+ mips-32.S     |  5 ++---
+ x86-sse2.S    | 21 ++++++++++-----------
+ 4 files changed, 13 insertions(+), 51 deletions(-)
+
+diff --git a/aarch64-asm.S b/aarch64-asm.S
+index 842b9e2..165c8ac 100644
+--- a/aarch64-asm.S
++++ b/aarch64-asm.S
+@@ -31,8 +31,7 @@
+ 
+ .macro asm_function function_name
+     .global \function_name
+-    .type \function_name,%function 
+-.func \function_name
++    .type \function_name,%function
+ \function_name:
+     DST         .req x0
+     SRC         .req x1
+@@ -54,7 +53,6 @@ asm_function aligned_block_copy_ldpstp_x_aarch64
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     ret
+-.endfunc
+ 
+ asm_function aligned_block_copy_ldpstp_q_aarch64
+ 0:
+@@ -67,7 +65,6 @@ asm_function aligned_block_copy_ldpstp_q_aarch64
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     ret
+-.endfunc
+ 
+ asm_function aligned_block_copy_ldpstp_q_pf32_l2strm_aarch64
+ 0:
+@@ -82,7 +79,6 @@ asm_function aligned_block_copy_ldpstp_q_pf32_l2strm_aarch64
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     ret
+-.endfunc
+ 
+ asm_function aligned_block_copy_ldpstp_q_pf64_l2strm_aarch64
+ 0:
+@@ -96,7 +92,6 @@ asm_function aligned_block_copy_ldpstp_q_pf64_l2strm_aarch64
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     ret
+-.endfunc
+ 
+ asm_function aligned_block_copy_ldpstp_q_pf32_l1keep_aarch64
+ 0:
+@@ -111,7 +106,6 @@ asm_function aligned_block_copy_ldpstp_q_pf32_l1keep_aarch64
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     ret
+-.endfunc
+ 
+ asm_function aligned_block_copy_ldpstp_q_pf64_l1keep_aarch64
+ 0:
+@@ -125,7 +119,6 @@ asm_function aligned_block_copy_ldpstp_q_pf64_l1keep_aarch64
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     ret
+-.endfunc
+ 
+ asm_function aligned_block_fill_stp_x_aarch64
+ 0:
+@@ -137,7 +130,6 @@ asm_function aligned_block_fill_stp_x_aarch64
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     ret
+-.endfunc
+ 
+ asm_function aligned_block_fill_stp_q_aarch64
+ 0:
+@@ -147,7 +139,6 @@ asm_function aligned_block_fill_stp_q_aarch64
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     ret
+-.endfunc
+ 
+ asm_function aligned_block_fill_stnp_x_aarch64
+ 0:
+@@ -159,7 +150,6 @@ asm_function aligned_block_fill_stnp_x_aarch64
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     ret
+-.endfunc
+ 
+ asm_function aligned_block_fill_stnp_q_aarch64
+ 0:
+@@ -169,7 +159,6 @@ asm_function aligned_block_fill_stnp_q_aarch64
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     ret
+-.endfunc
+ 
+ asm_function aligned_block_copy_ld1st1_aarch64
+ 0:
+@@ -180,6 +169,5 @@ asm_function aligned_block_copy_ld1st1_aarch64
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     ret
+-.endfunc
+ 
+ #endif
+diff --git a/arm-neon.S b/arm-neon.S
+index 4db78ce..9631d82 100644
+--- a/arm-neon.S
++++ b/arm-neon.S
+@@ -32,7 +32,6 @@
+ 
+ .macro asm_function function_name
+     .global \function_name
+-.func \function_name
+ \function_name:
+     DST         .req r0
+     SRC         .req r1
+@@ -66,7 +65,6 @@ asm_function aligned_block_read_neon
+     vpadd.u32   d31, d31, d31
+     vmov.u32    r0, d31[0]
+     bx          lr
+-.endfunc
+ 
+ /* Actually this calculates a sum of 32-bit values */
+ asm_function aligned_block_read_pf32_neon
+@@ -97,7 +95,6 @@ asm_function aligned_block_read_pf32_neon
+     vpadd.u32   d31, d31, d31
+     vmov.u32    r0, d31[0]
+     bx          lr
+-.endfunc
+ 
+ /* Actually this calculates a sum of 32-bit values */
+ asm_function aligned_block_read_pf64_neon
+@@ -127,7 +124,6 @@ asm_function aligned_block_read_pf64_neon
+     vpadd.u32   d31, d31, d31
+     vmov.u32    r0, d31[0]
+     bx          lr
+-.endfunc
+ 
+ /* Actually this calculates a sum of 32-bit values */
+ asm_function aligned_block_read2_neon
+@@ -156,7 +152,6 @@ asm_function aligned_block_read2_neon
+     vpadd.u32   d31, d31, d31
+     vmov.u32    r0, d31[0]
+     bx          lr
+-.endfunc
+ 
+ /* Actually this calculates a sum of 32-bit values */
+ asm_function aligned_block_read2_pf32_neon
+@@ -187,7 +182,6 @@ asm_function aligned_block_read2_pf32_neon
+     vpadd.u32   d31, d31, d31
+     vmov.u32    r0, d31[0]
+     bx          lr
+-.endfunc
+ 
+ /* Actually this calculates a sum of 32-bit values */
+ asm_function aligned_block_read2_pf64_neon
+@@ -217,7 +211,6 @@ asm_function aligned_block_read2_pf64_neon
+     vpadd.u32   d31, d31, d31
+     vmov.u32    r0, d31[0]
+     bx          lr
+-.endfunc
+ 
+ asm_function aligned_block_copy_neon
+ 0:
+@@ -226,7 +219,6 @@ asm_function aligned_block_copy_neon
+     subs        SIZE, SIZE, #32
+     bgt         0b
+     bx          lr
+-.endfunc
+ 
+ asm_function aligned_block_copy_unrolled_neon
+     vpush       {d8-d15}
+@@ -244,7 +236,6 @@ asm_function aligned_block_copy_unrolled_neon
+     bgt         0b
+     vpop        {d8-d15}
+     bx          lr
+-.endfunc
+ 
+ asm_function aligned_block_copy_pf32_neon
+ 0:
+@@ -254,7 +245,6 @@ asm_function aligned_block_copy_pf32_neon
+     subs        SIZE, SIZE, #32
+     bgt         0b
+     bx          lr
+-.endfunc
+ 
+ asm_function aligned_block_copy_unrolled_pf32_neon
+     vpush       {d8-d15}
+@@ -280,7 +270,6 @@ asm_function aligned_block_copy_unrolled_pf32_neon
+     bgt         0b
+     vpop        {d8-d15}
+     bx          lr
+-.endfunc
+ 
+ asm_function aligned_block_copy_pf64_neon
+ 0:
+@@ -292,7 +281,6 @@ asm_function aligned_block_copy_pf64_neon
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     bx          lr
+-.endfunc
+ 
+ asm_function aligned_block_copy_unrolled_pf64_neon
+     vpush       {d8-d15}
+@@ -314,7 +302,6 @@ asm_function aligned_block_copy_unrolled_pf64_neon
+     bgt         0b
+     vpop        {d8-d15}
+     bx          lr
+-.endfunc
+ 
+ asm_function aligned_block_copy_backwards_neon
+     add         SRC, SRC, SIZE
+@@ -328,7 +315,6 @@ asm_function aligned_block_copy_backwards_neon
+     subs        SIZE, SIZE, #32
+     bgt         0b
+     bx          lr
+-.endfunc
+ 
+ asm_function aligned_block_copy_backwards_pf32_neon
+     add         SRC, SRC, SIZE
+@@ -343,7 +329,6 @@ asm_function aligned_block_copy_backwards_pf32_neon
+     subs        SIZE, SIZE, #32
+     bgt         0b
+     bx          lr
+-.endfunc
+ 
+ asm_function aligned_block_copy_backwards_pf64_neon
+     add         SRC, SRC, SIZE
+@@ -360,7 +345,6 @@ asm_function aligned_block_copy_backwards_pf64_neon
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     bx          lr
+-.endfunc
+ 
+ asm_function aligned_block_fill_neon
+     vld1.8      {d0, d1, d2, d3}, [SRC]!
+@@ -370,7 +354,6 @@ asm_function aligned_block_fill_neon
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     bx          lr
+-.endfunc
+ 
+ asm_function aligned_block_fill_backwards_neon
+     add         SRC, SRC, SIZE
+@@ -383,7 +366,6 @@ asm_function aligned_block_fill_backwards_neon
+     subs        SIZE, SIZE, #32
+     bgt         0b
+     bx          lr
+-.endfunc
+ 
+ /* some code for older ARM processors */
+ 
+@@ -398,7 +380,6 @@ asm_function aligned_block_fill_stm4_armv4
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     pop         {r4-r12, pc}
+-.endfunc
+ 
+ asm_function aligned_block_fill_stm8_armv4
+     push        {r4-r12, lr}
+@@ -409,7 +390,6 @@ asm_function aligned_block_fill_stm8_armv4
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     pop         {r4-r12, pc}
+-.endfunc
+ 
+ asm_function aligned_block_fill_strd_armv5te
+     push        {r4-r12, lr}
+@@ -426,7 +406,6 @@ asm_function aligned_block_fill_strd_armv5te
+     subs        SIZE, SIZE, #64
+     bgt         0b
+     pop         {r4-r12, pc}
+-.endfunc
+ 
+ asm_function aligned_block_copy_incr_armv5te
+     push        {r4-r12, lr}
+@@ -442,7 +421,6 @@ asm_function aligned_block_copy_incr_armv5te
+     stmia       DST!, {r8-r11}
+     bgt         0b
+     pop         {r4-r12, pc}
+-.endfunc
+ 
+ asm_function aligned_block_copy_wrap_armv5te
+     push        {r4-r12, lr}
+@@ -458,7 +436,6 @@ asm_function aligned_block_copy_wrap_armv5te
+     stmia       DST!, {r8-r11}
+     bgt         0b
+     pop         {r4-r12, pc}
+-.endfunc
+ 
+ asm_function aligned_block_copy_vfp
+     push        {r4-r12, lr}
+@@ -470,6 +447,5 @@ asm_function aligned_block_copy_vfp
+     bgt         0b
+     vpop        {d8-d15}
+     pop         {r4-r12, pc}
+-.endfunc
+ 
+ #endif
+diff --git a/mips-32.S b/mips-32.S
+index 17b2b7f..4f7ddae 100644
+--- a/mips-32.S
++++ b/mips-32.S
+@@ -32,7 +32,6 @@
+ .macro asm_function function_name
+     .global \function_name
+     .type \function_name, @function
+-    .func \function_name
+ \function_name:
+ .endm
+ 
+@@ -93,7 +92,7 @@ asm_function aligned_block_fill_pf32_mips32
+ 2:
+     jr          $ra
+     nop
+-.endfunc
++
+ 
+ /*
+  * void aligned_block_copy_pf32_mips32(int64_t *dst, int64_t *src, int size)
+@@ -178,6 +177,6 @@ asm_function aligned_block_copy_pf32_mips32
+     lw          $s7,    28($sp)
+     jr          $ra
+     addi        $sp,    $sp,    32
+-.endfunc
++
+ 
+ #endif
+diff --git a/x86-sse2.S b/x86-sse2.S
+index d8840e4..409031b 100644
+--- a/x86-sse2.S
++++ b/x86-sse2.S
+@@ -30,7 +30,6 @@
+ 
+ .macro asm_function_helper function_name
+     .global \function_name
+-.func \function_name
+ \function_name:
+ #ifdef __amd64__
+   #ifdef _WIN64
+@@ -90,7 +89,7 @@ asm_function aligned_block_copy_movsb
+     pop3        edi esi ecx
+ #endif
+     ret
+-.endfunc
++
+ 
+ asm_function aligned_block_copy_movsd
+ 0:
+@@ -110,7 +109,7 @@ asm_function aligned_block_copy_movsd
+     pop3        edi esi ecx
+ #endif
+     ret
+-.endfunc
++
+ 
+ asm_function aligned_block_copy_sse2
+ 0:
+@@ -127,7 +126,7 @@ asm_function aligned_block_copy_sse2
+     sub         SIZE, 64
+     jg          0b
+     ret
+-.endfunc
++
+ 
+ asm_function aligned_block_copy_nt_sse2
+ 0:
+@@ -144,7 +143,7 @@ asm_function aligned_block_copy_nt_sse2
+     sub         SIZE, 64
+     jg          0b
+     ret
+-.endfunc
++
+ 
+ asm_function aligned_block_copy_pf32_sse2
+ 0:
+@@ -163,7 +162,7 @@ asm_function aligned_block_copy_pf32_sse2
+     sub         SIZE,       64
+     jg          0b
+     ret
+-.endfunc
++
+ 
+ asm_function aligned_block_copy_nt_pf32_sse2
+ 0:
+@@ -182,7 +181,7 @@ asm_function aligned_block_copy_nt_pf32_sse2
+     sub         SIZE,       64
+     jg          0b
+     ret
+-.endfunc
++
+ 
+ asm_function aligned_block_copy_pf64_sse2
+ 0:
+@@ -200,7 +199,7 @@ asm_function aligned_block_copy_pf64_sse2
+     sub         SIZE,       64
+     jg          0b
+     ret
+-.endfunc
++
+ 
+ asm_function aligned_block_copy_nt_pf64_sse2
+ 0:
+@@ -218,7 +217,7 @@ asm_function aligned_block_copy_nt_pf64_sse2
+     sub         SIZE,       64
+     jg          0b
+     ret
+-.endfunc
++
+ 
+ asm_function aligned_block_fill_sse2
+     movdqa      xmm0,       [SRC + 0]
+@@ -231,7 +230,7 @@ asm_function aligned_block_fill_sse2
+     sub         SIZE,       64
+     jg          0b
+     ret
+-.endfunc
++
+ 
+ asm_function aligned_block_fill_nt_sse2
+     movdqa      xmm0,       [SRC + 0]
+@@ -244,7 +243,7 @@ asm_function aligned_block_fill_nt_sse2
+     sub         SIZE,       64
+     jg          0b
+     ret
+-.endfunc
++
+ 
+ /*****************************************************************************/
+ 
diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
index 842644b8a1..2ce10f9c44 100644
--- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://main.c;endline=22;md5=879b9bbb60851454885b5fa47eb6b34
 PV = "0.4.0+git${SRCPV}"
 
 SRCREV = "a2cf6d7e382e3aea1eb39173174d9fa28cad15f3"
-SRC_URI = "git://github.com/ssvb/tinymembench.git"
+SRC_URI = "git://github.com/ssvb/tinymembench.git \
+           file://0001-asm-Delete-.func-.endfunc-directives.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


