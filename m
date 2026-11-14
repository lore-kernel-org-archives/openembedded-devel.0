Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3145.1794685065322665952
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 11:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mIebLr3j;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37071c0f42aso3133954eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 11:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794685065; x=1795289865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaeYEnq2/z/teyjw6KyRdoSS+KOiv7yWeI3AtO7XmtU=;
        b=mIebLr3jIid41NHiJMYfEd4cCe/AvNAim0ZzOEkChucctu/UK57iDvOUM3W1ZcOlZn
         sfZYURcYCPvyu+9d93h9wfUbRMYIQdMETfiZJ6MnH8T117K9R16OK+unKgHa1ECCEbND
         sCyPDpEmEcfaUIwepOo3b1PSeZrrCBsRo7SY4TzltSw07dfVSJ+9Cz0E6zi4//dnypRM
         F9fh5f6Wi367tJlG9F6OddgV7gtJBxRgx1ZyT1m6Tg2VYB+UYPc3YMME1icimHRQpRQc
         uoBruPAJcbpcMwNAWm+IA9LBn98BaY4IEdLNJp11ndS7v8P2TC3mt1vNad2dCJ6DbXgi
         l6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685065; x=1795289865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaeYEnq2/z/teyjw6KyRdoSS+KOiv7yWeI3AtO7XmtU=;
        b=Q/aZhtke32zEWaSk0HIMxfmBBPb7M1iADLl5w+a1Aco1s5GjU0C5LkCIYRAVdlB41z
         iPlicq4RWe3ga/ednPQHImNpG2b4S1HbAR15eBpjZs3zHqs04Wh4A+lK14Lt/R3fmT9y
         JkLjLZJyhjUo+YSkTH16dP8gxja2rBvrpBl9clh/gNOAyI1/7rC1/T2F7DJq9Vu27eyN
         Bzg67CVZdsBpmyMVP3trAHs38FrHwzRjCi0HVCutlDWxU32vpdYQQIpcXmWluadt0+KH
         opIiOUOy8CzfbU7s1cVFI/GBXRgYDF0kJI93qQstrE5HNBgUZJhtfaxjUi4STgKLkkvS
         08EA==
X-Gm-Message-State: APuU4Z9eP6ml6KJT7nfxmEppVXqur+I1j4Lqt63dmZK0dEiqFdpd/r9g
	Ygl2QFbg6xZKX2+HNxVNuM0dJxtbcbgJJ7arsKvbMDW38yR/wBFPR8IvbXs51WY+
X-Gm-Gg: AYBFou3MDtnCA6bhai5XTpTgG4XakI9OzcFWMSte4kG9tdD3E8hkMUG3D8WyHsJGoi1
	BSI4CX32/sl0fFmoBscQJSPuTKnn1TNxqPeK8QUSJBpfBdWWNNQfxIHZI2RwSMeWNyt2+yWAiT+
	1ooO6M4MQKaGMSRjo5+E9hJxTLKdXhvYtKMhLtvg8UGXt0RxcdZEj2BN1hp3ON4zJcNq09UU/gT
	Asf6xY4ldgyvvMhhyKq/HmR9eVGZzQQMvjRKK2ps4kF9/urVGZlY7hBt9blT/0INxZh4b37GQmx
	Z/hPf84qCZvIpiPZ68AmEkg9ike1qeMiu4G+EF/HRvJ98ZWgRL9GHHB6vgRFH0VRc0jCyUWR0wq
	qEoSgNFWlOqad4+80lj7mR7esC9vDZtGpWbrqhbroRWBCMNeY5j+2f3P8cCC6G/N6834i8BGnq3
	Ra8MizbnfmOzctYUg97cOMItUsOcSBLs6XgC68Dm+PQRFIKDxY6kN32pzbwpiRZf19iB2qXw8cD
	p2cdVJ0hRmGMMdfRZhG1Filwtdf/f3kKaUuRhV5t2I9H9jUOLkEmq6BENUkD0A8qOvHOv/R8HBl
	F6f+IJDV72UFfVa4EWkRxYtlbFuWOskbQUVi+XE8KxEnq+stmi5TAhIz9eIXySoxh8K2LsVC3Xe
	+LUb0y8XDdkDC3fgaXnBq2q59uwwNSnDAd2jCYgv7ikYjUAKy/+CHDdTN0+F8KlZSIE9TPbu9Oh
	DBk1hnnL1H2YH6qJoIgfmV4KMRyDfMOEcOgC9XTas6A8YIon6FaGppZNSs3/fTRcTJKKMDldC+p
	WVodtg9ewVAVDAbOiJr7rVK7lCrxhB6BDuyzJArs6KbwhdUf5g4bBy0g5X1Gzx3euhpHjbu62/X
	ziaq
X-Received: by 2002:a05:7300:81:b0:378:2e89:3958 with SMTP id 5a478bee46e88-379676fc09cmr6219200eec.19.1794685064563;
        Sat, 14 Nov 2026 11:37:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm16855164eec.4.2026.11.14.11.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:37:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 07/13] tinymembench: Fix build with clang's integrated assembler
Date: Sat, 14 Nov 2026 11:37:27 -0800
Message-ID: <20261114193733.1743149-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
References: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 19:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132264
Content-Type: text/plain; charset="utf-8"

The x86 assembly aliases registers with .set, and clang's integrated
assembler can not infer the operand size from such aliases:

  x86-sse2.S:124:9: error: ambiguous operand size for instruction 'add'

Define the aliases with the preprocessor instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...he-preprocessor-for-register-aliases.patch | 69 +++++++++++++++++++
 .../tinymembench/tinymembench_git.bb          |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/tinymembench/tinymembench/0001-x86-sse2-Use-the-preprocessor-for-register-aliases.patch

diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench/0001-x86-sse2-Use-the-preprocessor-for-register-aliases.patch b/meta-oe/recipes-benchmark/tinymembench/tinymembench/0001-x86-sse2-Use-the-preprocessor-for-register-aliases.patch
new file mode 100644
index 0000000000..ebc9327f89
--- /dev/null
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench/0001-x86-sse2-Use-the-preprocessor-for-register-aliases.patch
@@ -0,0 +1,69 @@
+From a0c69f4ab35712592194cd3839d78bfecdd4992c Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 9 Nov 2026 08:37:31 -0800
+Subject: [PATCH] x86-sse2: Use the preprocessor for register aliases
+
+clang's integrated assembler can not infer the operand size from a
+register that is aliased with .set:
+
+  x86-sse2.S:124:9: error: ambiguous operand size for instruction 'add'
+
+The aliases are the same for all functions, so define them with the
+preprocessor instead, which works with both GNU as and clang.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ x86-sse2.S | 31 +++++++++++++++++++------------
+ 1 file changed, 19 insertions(+), 12 deletions(-)
+
+diff --git a/x86-sse2.S b/x86-sse2.S
+index 409031b..2ab9e38 100644
+--- a/x86-sse2.S
++++ b/x86-sse2.S
+@@ -28,26 +28,33 @@
+
+ #define PREFETCH_DISTANCE 256
+
+-.macro asm_function_helper function_name
+-    .global \function_name
+-\function_name:
++/*
++ * Use the preprocessor for the register aliases, clang's integrated
++ * assembler can not infer the operand size from a register set with .set
++ */
+ #ifdef __amd64__
+   #ifdef _WIN64
+-    .set DST,  rcx
+-    .set SRC,  rdx
+-    .set SIZE, r8
++    #define DST  rcx
++    #define SRC  rdx
++    #define SIZE r8
+   #else
+-    .set DST,  rdi
+-    .set SRC,  rsi
+-    .set SIZE, rdx
++    #define DST  rdi
++    #define SRC  rsi
++    #define SIZE rdx
+   #endif
+ #else
++    #define DST  eax
++    #define SRC  ecx
++    #define SIZE edx
++#endif
++
++.macro asm_function_helper function_name
++    .global \function_name
++\function_name:
++#ifndef __amd64__
+     mov  eax,  [esp + 4]
+     mov  ecx,  [esp + 8]
+     mov  edx,  [esp + 12]
+-    .set DST,  eax
+-    .set SRC,  ecx
+-    .set SIZE, edx
+ #endif
+ .endm
+
diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
index f0527a7ca3..1e6f642217 100644
--- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
@@ -12,6 +12,7 @@ SRCREV = "a2cf6d7e382e3aea1eb39173174d9fa28cad15f3"
 UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI = "git://github.com/ssvb/tinymembench.git;branch=master;protocol=https \
            file://0001-asm-Delete-.func-.endfunc-directives.patch \
+           file://0001-x86-sse2-Use-the-preprocessor-for-register-aliases.patch \
            "


