Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 91D856FF97
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 13:51:37 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id b35so10569523qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 05:51:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=dY3R9dZfo734u4a+ogvIVEmKGtIx2zY8Ncs1Lqh3g4c=;
	b=DIrKUyVsmhfn28LxnAyOjfBCPjGIGmw/jlchid2YKrBDER33uDLOYAIQzcasDS6hG2
	lxoYSqwHb0RWjdFHUS7OJhMzAf587DTk5BanlYz2rlzdUVi4pwpreSPEkhhtwalIYOZd
	RQ7HkMcXj4fs0PhEwzTR4j+zmmnAaAScor+IVyr4sLkiw6PUdVRBZ+YidlqhTM3b7vCX
	azCKzNmgTfgDocWg/Mi7yuz+n2KUJRl8o/njaaOXxBk1821r4ViczBQBRWJcFeevylYh
	R2UBYpbKCAN+Y5/G2SJqm4bs4AC++LzL6hHwhgLsjVckp6kFRjvaWk29x5LgptN+R8Tr
	ov5w==
X-Gm-Message-State: AG10YOQR9wHNpEAXNe3KLmOreclbwmRg5QtE5gZ97pYrJ6IjQ2uGPkk3w6rYvn+Bjo1f/w==
X-Received: by 10.140.85.19 with SMTP id m19mr20222283qgd.106.1455544297804;
	Mon, 15 Feb 2016 05:51:37 -0800 (PST)
Received: from localhost ([187.23.153.138]) by smtp.gmail.com with ESMTPSA id
	n48sm11079976qgd.38.2016.02.15.05.51.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Feb 2016 05:51:36 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 15 Feb 2016 11:51:29 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Feb 2016 11:51:20 -0200
Message-Id: <1455544280-18166-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455544280-18166-1-git-send-email-otavio@ossystems.com.br>
References: <1455544280-18166-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Fabio Berton <fabio.berton@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH 2/2] testfloat: Add recipe for version 3a
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
X-List-Received-Date: Mon, 15 Feb 2016 13:51:39 -0000

From: Fabio Berton <fabio.berton@ossystems.com.br>

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...0001-Makefile-for-cross-compile-SoftFloat.patch | 348 ++++++++++++++++++
 ...0002-Makefile-for-cross-compile-TestFloat.patch | 396 +++++++++++++++++++++
 meta-oe/recipes-extended/testfloat/testfloat_3a.bb |  35 ++
 3 files changed, 779 insertions(+)
 create mode 100644 meta-oe/recipes-extended/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch
 create mode 100644 meta-oe/recipes-extended/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch
 create mode 100644 meta-oe/recipes-extended/testfloat/testfloat_3a.bb

diff --git a/meta-oe/recipes-extended/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch b/meta-oe/recipes-extended/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch
new file mode 100644
index 0000000..71782c5
--- /dev/null
+++ b/meta-oe/recipes-extended/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch
@@ -0,0 +1,348 @@
+Upstream-Status: Inappropriate [configuration]
+
+From 07f2528d93f44fe1d8080a4225f29f4ada9f4663 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Thu, 4 Feb 2016 09:15:37 -0200
+Subject: [PATCH 1/2] Makefile for cross compile SoftFloat
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ SoftFloat-3a/build/Linux-Cross-Compile/Makefile   | 274 ++++++++++++++++++++++
+ SoftFloat-3a/build/Linux-Cross-Compile/platform.h |  44 ++++
+ 2 files changed, 318 insertions(+)
+ create mode 100644 SoftFloat-3a/build/Linux-Cross-Compile/Makefile
+ create mode 100644 SoftFloat-3a/build/Linux-Cross-Compile/platform.h
+
+diff --git a/SoftFloat-3a/build/Linux-Cross-Compile/Makefile b/SoftFloat-3a/build/Linux-Cross-Compile/Makefile
+new file mode 100644
+index 0000000..c4d0a60
+--- /dev/null
++++ b/SoftFloat-3a/build/Linux-Cross-Compile/Makefile
+@@ -0,0 +1,274 @@
++
++#=============================================================================
++#
++# This Makefile is part of the SoftFloat IEEE Floating-Point Arithmetic
++# Package, Release 3a, by John R. Hauser.
++#
++# Copyright 2011, 2012, 2013, 2014 The Regents of the University of
++# California.  All rights reserved.
++#
++# Redistribution and use in source and binary forms, with or without
++# modification, are permitted provided that the following conditions are met:
++#
++#  1. Redistributions of source code must retain the above copyright notice,
++#     this list of conditions, and the following disclaimer.
++#
++#  2. Redistributions in binary form must reproduce the above copyright
++#     notice, this list of conditions, and the following disclaimer in the
++#     documentation and/or other materials provided with the distribution.
++#
++#  3. Neither the name of the University nor the names of its contributors
++#     may be used to endorse or promote products derived from this software
++#     without specific prior written permission.
++#
++# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS "AS IS", AND ANY
++# EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
++# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, ARE
++# DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY
++# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
++# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
++# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
++# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++#
++#=============================================================================
++
++SOURCE_DIR = ../../source
++SPECIALIZE_TYPE = 8086
++
++SOFTFLOAT_OPTS = -DINLINE_LEVEL=5 -DSOFTFLOAT_FAST_DIV64TO32 -fgnu89-inline
++
++DELETE = rm -f
++C_INCLUDES = -I. -I$(SOURCE_DIR)/$(SPECIALIZE_TYPE) -I$(SOURCE_DIR)/include
++COMPILE_C = \
++  ${CC} -c -Werror-implicit-function-declaration $(SOFTFLOAT_OPTS) \
++    $(C_INCLUDES) -O2 -o $@
++MAKELIB = ${AR} crs $@
++
++OBJ = .o
++LIB = .a
++
++.PHONY: all
++all: softfloat$(LIB)
++
++OBJS_PRIMITIVES = \
++  s_compare96M$(OBJ) \
++  s_compare128M$(OBJ) \
++  s_shortShiftLeft64To96M$(OBJ) \
++  s_shortShiftLeftM$(OBJ) \
++  s_shiftLeftM$(OBJ) \
++  s_shortShiftRightM$(OBJ) \
++  s_shortShiftRightJam64$(OBJ) \
++  s_shortShiftRightJamM$(OBJ) \
++  s_shiftRightJam32$(OBJ) \
++  s_shiftRightJam64$(OBJ) \
++  s_shiftRightJamM$(OBJ) \
++  s_shiftRightM$(OBJ) \
++  s_countLeadingZeros8$(OBJ) \
++  s_countLeadingZeros32$(OBJ) \
++  s_countLeadingZeros64$(OBJ) \
++  s_addM$(OBJ) \
++  s_addCarryM$(OBJ) \
++  s_addComplCarryM$(OBJ) \
++  s_negXM$(OBJ) \
++  s_sub1XM$(OBJ) \
++  s_subM$(OBJ) \
++  s_mul64To128M$(OBJ) \
++  s_mul128MTo256M$(OBJ) \
++  s_approxRecip32_1$(OBJ) \
++  s_approxRecipSqrt32_1$(OBJ) \
++  s_remStepMBy32$(OBJ) \
++
++OBJS_SPECIALIZE = \
++  softfloat_raiseFlags$(OBJ) \
++  s_f32UIToCommonNaN$(OBJ) \
++  s_commonNaNToF32UI$(OBJ) \
++  s_propagateNaNF32UI$(OBJ) \
++  s_f64UIToCommonNaN$(OBJ) \
++  s_commonNaNToF64UI$(OBJ) \
++  s_propagateNaNF64UI$(OBJ) \
++  extF80M_isSignalingNaN$(OBJ) \
++  s_extF80MToCommonNaN$(OBJ) \
++  s_commonNaNToExtF80M$(OBJ) \
++  s_propagateNaNExtF80M$(OBJ) \
++  f128M_isSignalingNaN$(OBJ) \
++  s_f128MToCommonNaN$(OBJ) \
++  s_commonNaNToF128M$(OBJ) \
++  s_propagateNaNF128M$(OBJ) \
++
++OBJS_OTHERS = \
++  s_roundPackToUI32$(OBJ) \
++  s_roundPackMToUI64$(OBJ) \
++  s_roundPackToI32$(OBJ) \
++  s_roundPackMToI64$(OBJ) \
++  s_normSubnormalF32Sig$(OBJ) \
++  s_roundPackToF32$(OBJ) \
++  s_normRoundPackToF32$(OBJ) \
++  s_addMagsF32$(OBJ) \
++  s_subMagsF32$(OBJ) \
++  s_mulAddF32$(OBJ) \
++  s_normSubnormalF64Sig$(OBJ) \
++  s_roundPackToF64$(OBJ) \
++  s_normRoundPackToF64$(OBJ) \
++  s_addMagsF64$(OBJ) \
++  s_subMagsF64$(OBJ) \
++  s_mulAddF64$(OBJ) \
++  s_tryPropagateNaNExtF80M$(OBJ) \
++  s_invalidExtF80M$(OBJ) \
++  s_normExtF80SigM$(OBJ) \
++  s_roundPackMToExtF80M$(OBJ) \
++  s_normRoundPackMToExtF80M$(OBJ) \
++  s_addExtF80M$(OBJ) \
++  s_compareNonnormExtF80M$(OBJ) \
++  s_isNaNF128M$(OBJ) \
++  s_tryPropagateNaNF128M$(OBJ) \
++  s_invalidF128M$(OBJ) \
++  s_shiftNormSigF128M$(OBJ) \
++  s_roundPackMToF128M$(OBJ) \
++  s_normRoundPackMToF128M$(OBJ) \
++  s_addF128M$(OBJ) \
++  s_mulAddF128M$(OBJ) \
++  softfloat_state$(OBJ) \
++  ui32_to_f32$(OBJ) \
++  ui32_to_f64$(OBJ) \
++  ui32_to_extF80M$(OBJ) \
++  ui32_to_f128M$(OBJ) \
++  ui64_to_f32$(OBJ) \
++  ui64_to_f64$(OBJ) \
++  ui64_to_extF80M$(OBJ) \
++  ui64_to_f128M$(OBJ) \
++  i32_to_f32$(OBJ) \
++  i32_to_f64$(OBJ) \
++  i32_to_extF80M$(OBJ) \
++  i32_to_f128M$(OBJ) \
++  i64_to_f32$(OBJ) \
++  i64_to_f64$(OBJ) \
++  i64_to_extF80M$(OBJ) \
++  i64_to_f128M$(OBJ) \
++  f32_to_ui32$(OBJ) \
++  f32_to_ui64$(OBJ) \
++  f32_to_i32$(OBJ) \
++  f32_to_i64$(OBJ) \
++  f32_to_ui32_r_minMag$(OBJ) \
++  f32_to_ui64_r_minMag$(OBJ) \
++  f32_to_i32_r_minMag$(OBJ) \
++  f32_to_i64_r_minMag$(OBJ) \
++  f32_to_f64$(OBJ) \
++  f32_to_extF80M$(OBJ) \
++  f32_to_f128M$(OBJ) \
++  f32_roundToInt$(OBJ) \
++  f32_add$(OBJ) \
++  f32_sub$(OBJ) \
++  f32_mul$(OBJ) \
++  f32_mulAdd$(OBJ) \
++  f32_div$(OBJ) \
++  f32_rem$(OBJ) \
++  f32_sqrt$(OBJ) \
++  f32_eq$(OBJ) \
++  f32_le$(OBJ) \
++  f32_lt$(OBJ) \
++  f32_eq_signaling$(OBJ) \
++  f32_le_quiet$(OBJ) \
++  f32_lt_quiet$(OBJ) \
++  f32_isSignalingNaN$(OBJ) \
++  f64_to_ui32$(OBJ) \
++  f64_to_ui64$(OBJ) \
++  f64_to_i32$(OBJ) \
++  f64_to_i64$(OBJ) \
++  f64_to_ui32_r_minMag$(OBJ) \
++  f64_to_ui64_r_minMag$(OBJ) \
++  f64_to_i32_r_minMag$(OBJ) \
++  f64_to_i64_r_minMag$(OBJ) \
++  f64_to_f32$(OBJ) \
++  f64_to_extF80M$(OBJ) \
++  f64_to_f128M$(OBJ) \
++  f64_roundToInt$(OBJ) \
++  f64_add$(OBJ) \
++  f64_sub$(OBJ) \
++  f64_mul$(OBJ) \
++  f64_mulAdd$(OBJ) \
++  f64_div$(OBJ) \
++  f64_rem$(OBJ) \
++  f64_sqrt$(OBJ) \
++  f64_eq$(OBJ) \
++  f64_le$(OBJ) \
++  f64_lt$(OBJ) \
++  f64_eq_signaling$(OBJ) \
++  f64_le_quiet$(OBJ) \
++  f64_lt_quiet$(OBJ) \
++  f64_isSignalingNaN$(OBJ) \
++  extF80M_to_ui32$(OBJ) \
++  extF80M_to_ui64$(OBJ) \
++  extF80M_to_i32$(OBJ) \
++  extF80M_to_i64$(OBJ) \
++  extF80M_to_ui32_r_minMag$(OBJ) \
++  extF80M_to_ui64_r_minMag$(OBJ) \
++  extF80M_to_i32_r_minMag$(OBJ) \
++  extF80M_to_i64_r_minMag$(OBJ) \
++  extF80M_to_f32$(OBJ) \
++  extF80M_to_f64$(OBJ) \
++  extF80M_to_f128M$(OBJ) \
++  extF80M_roundToInt$(OBJ) \
++  extF80M_add$(OBJ) \
++  extF80M_sub$(OBJ) \
++  extF80M_mul$(OBJ) \
++  extF80M_div$(OBJ) \
++  extF80M_rem$(OBJ) \
++  extF80M_sqrt$(OBJ) \
++  extF80M_eq$(OBJ) \
++  extF80M_le$(OBJ) \
++  extF80M_lt$(OBJ) \
++  extF80M_eq_signaling$(OBJ) \
++  extF80M_le_quiet$(OBJ) \
++  extF80M_lt_quiet$(OBJ) \
++  f128M_to_ui32$(OBJ) \
++  f128M_to_ui64$(OBJ) \
++  f128M_to_i32$(OBJ) \
++  f128M_to_i64$(OBJ) \
++  f128M_to_ui32_r_minMag$(OBJ) \
++  f128M_to_ui64_r_minMag$(OBJ) \
++  f128M_to_i32_r_minMag$(OBJ) \
++  f128M_to_i64_r_minMag$(OBJ) \
++  f128M_to_f32$(OBJ) \
++  f128M_to_f64$(OBJ) \
++  f128M_to_extF80M$(OBJ) \
++  f128M_roundToInt$(OBJ) \
++  f128M_add$(OBJ) \
++  f128M_sub$(OBJ) \
++  f128M_mul$(OBJ) \
++  f128M_mulAdd$(OBJ) \
++  f128M_div$(OBJ) \
++  f128M_rem$(OBJ) \
++  f128M_sqrt$(OBJ) \
++  f128M_eq$(OBJ) \
++  f128M_le$(OBJ) \
++  f128M_lt$(OBJ) \
++  f128M_eq_signaling$(OBJ) \
++  f128M_le_quiet$(OBJ) \
++  f128M_lt_quiet$(OBJ) \
++
++OBJS_ALL = $(OBJS_PRIMITIVES) $(OBJS_SPECIALIZE) $(OBJS_OTHERS)
++
++$(OBJS_ALL): \
++  platform.h $(SOURCE_DIR)/include/primitiveTypes.h \
++  $(SOURCE_DIR)/include/primitives.h
++$(OBJS_SPECIALIZE) $(OBJS_OTHERS): \
++  $(SOURCE_DIR)/include/softfloat_types.h $(SOURCE_DIR)/include/internals.h \
++  $(SOURCE_DIR)/$(SPECIALIZE_TYPE)/specialize.h \
++  $(SOURCE_DIR)/include/softfloat.h
++
++$(OBJS_PRIMITIVES) $(OBJS_OTHERS): %$(OBJ): $(SOURCE_DIR)/%.c
++	$(COMPILE_C) $(SOURCE_DIR)/$*.c
++
++$(OBJS_SPECIALIZE): %$(OBJ): $(SOURCE_DIR)/$(SPECIALIZE_TYPE)/%.c
++	$(COMPILE_C) $(SOURCE_DIR)/$(SPECIALIZE_TYPE)/$*.c
++
++softfloat$(LIB): $(OBJS_ALL)
++	$(DELETE) $@
++	$(MAKELIB) $^
++
++.PHONY: clean
++clean:
++	$(DELETE) $(OBJS_ALL) softfloat$(LIB)
++
+diff --git a/SoftFloat-3a/build/Linux-Cross-Compile/platform.h b/SoftFloat-3a/build/Linux-Cross-Compile/platform.h
+new file mode 100644
+index 0000000..5e566fc
+--- /dev/null
++++ b/SoftFloat-3a/build/Linux-Cross-Compile/platform.h
+@@ -0,0 +1,44 @@
++
++/*============================================================================
++
++This C header file is part of the SoftFloat IEEE Floating-Point Arithmetic
++Package, Release 3a, by John R. Hauser.
++
++Copyright 2011, 2012, 2013, 2014 The Regents of the University of California.
++All rights reserved.
++
++Redistribution and use in source and binary forms, with or without
++modification, are permitted provided that the following conditions are met:
++
++ 1. Redistributions of source code must retain the above copyright notice,
++    this list of conditions, and the following disclaimer.
++
++ 2. Redistributions in binary form must reproduce the above copyright notice,
++    this list of conditions, and the following disclaimer in the documentation
++    and/or other materials provided with the distribution.
++
++ 3. Neither the name of the University nor the names of its contributors may
++    be used to endorse or promote products derived from this software without
++    specific prior written permission.
++
++THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS "AS IS", AND ANY
++EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
++WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, ARE
++DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY
++DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
++(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
++LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
++ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
++SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++
++=============================================================================*/
++
++/*----------------------------------------------------------------------------
++*----------------------------------------------------------------------------*/
++#define LITTLEENDIAN 1
++
++/*----------------------------------------------------------------------------
++*----------------------------------------------------------------------------*/
++#define INLINE extern inline
++
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-extended/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch b/meta-oe/recipes-extended/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch
new file mode 100644
index 0000000..cc124b3
--- /dev/null
+++ b/meta-oe/recipes-extended/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch
@@ -0,0 +1,396 @@
+Upstream-Status: Inappropriate [configuration]
+
+From 9aa4a416f05967320c1aa52bdccfe105a3bf3269 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Thu, 4 Feb 2016 09:16:09 -0200
+Subject: [PATCH 2/2] Makefile for cross compile TestFloat
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ TestFloat-3a/build/Linux-Cross-Compile/Makefile   | 321 ++++++++++++++++++++++
+ TestFloat-3a/build/Linux-Cross-Compile/platform.h |  45 +++
+ 2 files changed, 366 insertions(+)
+ create mode 100644 TestFloat-3a/build/Linux-Cross-Compile/Makefile
+ create mode 100644 TestFloat-3a/build/Linux-Cross-Compile/platform.h
+
+diff --git a/TestFloat-3a/build/Linux-Cross-Compile/Makefile b/TestFloat-3a/build/Linux-Cross-Compile/Makefile
+new file mode 100644
+index 0000000..a89326a
+--- /dev/null
++++ b/TestFloat-3a/build/Linux-Cross-Compile/Makefile
+@@ -0,0 +1,321 @@
++
++#=============================================================================
++#
++# This Makefile is part of TestFloat, Release 3a, a package of programs for
++# testing the correctness of floating-point arithmetic complying with the IEEE
++# Standard for Floating-Point, by John R. Hauser.
++#
++# Copyright 2011, 2012, 2013, 2014, 2015 The Regents of the University of
++# California.  All rights reserved.
++#
++# Redistribution and use in source and binary forms, with or without
++# modification, are permitted provided that the following conditions are met:
++#
++#  1. Redistributions of source code must retain the above copyright notice,
++#     this list of conditions, and the following disclaimer.
++#
++#  2. Redistributions in binary form must reproduce the above copyright
++#     notice, this list of conditions, and the following disclaimer in the
++#     documentation and/or other materials provided with the distribution.
++#
++#  3. Neither the name of the University nor the names of its contributors
++#     may be used to endorse or promote products derived from this software
++#     without specific prior written permission.
++#
++# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS "AS IS", AND ANY
++# EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
++# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, ARE
++# DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY
++# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
++# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
++# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
++# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++#
++#=============================================================================
++
++SOURCE_DIR = ../../source
++SUBJ_SOURCE_DIR = $(SOURCE_DIR)/subj-C
++SOFTFLOAT_DIR = ../../../SoftFloat-3a
++SOFTFLOAT_INCLUDE_DIR = $(SOFTFLOAT_DIR)/source/include
++PLATFORM = Linux-Cross-Compile
++
++SOFTFLOAT_H = \
++  $(SOFTFLOAT_INCLUDE_DIR)/softfloat_types.h \
++  $(SOFTFLOAT_INCLUDE_DIR)/softfloat.h
++SOFTFLOAT_LIB = $(SOFTFLOAT_DIR)/build/$(PLATFORM)/softfloat$(LIB)
++
++TESTFLOAT_OPTS = -DEXTFLOAT80 -DFLOAT128 -DLONG_DOUBLE_IS_EXTFLOAT80 -fgnu89-inline
++
++DELETE = rm -f
++C_INCLUDES = \
++  -I. -I$(SUBJ_SOURCE_DIR) -I$(SOURCE_DIR) -I$(SOFTFLOAT_INCLUDE_DIR)
++COMPILE_C = \
++  ${CC} -c -Werror-implicit-function-declaration $(TESTFLOAT_OPTS) \
++    $(C_INCLUDES) -O2 -o $@
++COMPILE_SLOWFLOAT_C = \
++  ${CC} -c -Werror-implicit-function-declaration $(TESTFLOAT_OPTS) \
++    $(C_INCLUDES) -O3 -o $@
++MAKELIB = ${AR} crs $@
++LINK = ${CC} -o $@
++OTHER_LIBS = -lm
++
++OBJ = .o
++LIB = .a
++EXE =
++
++.PHONY: all
++all: \
++  testsoftfloat$(EXE) \
++  timesoftfloat$(EXE) \
++  testfloat_gen$(EXE) \
++  testfloat_ver$(EXE) \
++  testfloat$(EXE) \
++
++OBJS_GENCASES = \
++  genCases_ui32$(OBJ) \
++  genCases_ui64$(OBJ) \
++  genCases_i32$(OBJ) \
++  genCases_i64$(OBJ) \
++  genCases_f32$(OBJ) \
++  genCases_f64$(OBJ) \
++  genCases_extF80$(OBJ) \
++  genCases_f128$(OBJ) \
++
++OBJS_WRITECASE = \
++  writeCase_a_ui32$(OBJ) \
++  writeCase_a_ui64$(OBJ) \
++  writeCase_a_f32$(OBJ) \
++  writeCase_ab_f32$(OBJ) \
++  writeCase_abc_f32$(OBJ) \
++  writeCase_a_f64$(OBJ) \
++  writeCase_ab_f64$(OBJ) \
++  writeCase_abc_f64$(OBJ) \
++  writeCase_a_extF80M$(OBJ) \
++  writeCase_ab_extF80M$(OBJ) \
++  writeCase_abc_extF80M$(OBJ) \
++  writeCase_a_f128M$(OBJ) \
++  writeCase_ab_f128M$(OBJ) \
++  writeCase_abc_f128M$(OBJ) \
++  writeCase_z_bool$(OBJ) \
++  writeCase_z_ui32$(OBJ) \
++  writeCase_z_ui64$(OBJ) \
++  writeCase_z_f32$(OBJ) \
++  writeCase_z_f64$(OBJ) \
++  writeCase_z_extF80M$(OBJ) \
++  writeCase_z_f128M$(OBJ) \
++
++OBJS_TEST = \
++  test_a_ui32_z_f32$(OBJ) \
++  test_a_ui32_z_f64$(OBJ) \
++  test_a_ui32_z_extF80$(OBJ) \
++  test_a_ui32_z_f128$(OBJ) \
++  test_a_ui64_z_f32$(OBJ) \
++  test_a_ui64_z_f64$(OBJ) \
++  test_a_ui64_z_extF80$(OBJ) \
++  test_a_ui64_z_f128$(OBJ) \
++  test_a_i32_z_f32$(OBJ) \
++  test_a_i32_z_f64$(OBJ) \
++  test_a_i32_z_extF80$(OBJ) \
++  test_a_i32_z_f128$(OBJ) \
++  test_a_i64_z_f32$(OBJ) \
++  test_a_i64_z_f64$(OBJ) \
++  test_a_i64_z_extF80$(OBJ) \
++  test_a_i64_z_f128$(OBJ) \
++  test_a_f32_z_ui32_rx$(OBJ) \
++  test_a_f32_z_ui64_rx$(OBJ) \
++  test_a_f32_z_i32_rx$(OBJ) \
++  test_a_f32_z_i64_rx$(OBJ) \
++  test_a_f32_z_ui32_x$(OBJ) \
++  test_a_f32_z_ui64_x$(OBJ) \
++  test_a_f32_z_i32_x$(OBJ) \
++  test_a_f32_z_i64_x$(OBJ) \
++  test_a_f32_z_f64$(OBJ) \
++  test_a_f32_z_extF80$(OBJ) \
++  test_a_f32_z_f128$(OBJ) \
++  test_az_f32$(OBJ) \
++  test_az_f32_rx$(OBJ) \
++  test_abz_f32$(OBJ) \
++  test_abcz_f32$(OBJ) \
++  test_ab_f32_z_bool$(OBJ) \
++  test_a_f64_z_ui32_rx$(OBJ) \
++  test_a_f64_z_ui64_rx$(OBJ) \
++  test_a_f64_z_i32_rx$(OBJ) \
++  test_a_f64_z_i64_rx$(OBJ) \
++  test_a_f64_z_ui32_x$(OBJ) \
++  test_a_f64_z_ui64_x$(OBJ) \
++  test_a_f64_z_i32_x$(OBJ) \
++  test_a_f64_z_i64_x$(OBJ) \
++  test_a_f64_z_f32$(OBJ) \
++  test_a_f64_z_extF80$(OBJ) \
++  test_a_f64_z_f128$(OBJ) \
++  test_az_f64$(OBJ) \
++  test_az_f64_rx$(OBJ) \
++  test_abz_f64$(OBJ) \
++  test_abcz_f64$(OBJ) \
++  test_ab_f64_z_bool$(OBJ) \
++  test_a_extF80_z_ui32_rx$(OBJ) \
++  test_a_extF80_z_ui64_rx$(OBJ) \
++  test_a_extF80_z_i32_rx$(OBJ) \
++  test_a_extF80_z_i64_rx$(OBJ) \
++  test_a_extF80_z_ui32_x$(OBJ) \
++  test_a_extF80_z_ui64_x$(OBJ) \
++  test_a_extF80_z_i32_x$(OBJ) \
++  test_a_extF80_z_i64_x$(OBJ) \
++  test_a_extF80_z_f32$(OBJ) \
++  test_a_extF80_z_f64$(OBJ) \
++  test_a_extF80_z_f128$(OBJ) \
++  test_az_extF80$(OBJ) \
++  test_az_extF80_rx$(OBJ) \
++  test_abz_extF80$(OBJ) \
++  test_ab_extF80_z_bool$(OBJ) \
++  test_a_f128_z_ui32_rx$(OBJ) \
++  test_a_f128_z_ui64_rx$(OBJ) \
++  test_a_f128_z_i32_rx$(OBJ) \
++  test_a_f128_z_i64_rx$(OBJ) \
++  test_a_f128_z_ui32_x$(OBJ) \
++  test_a_f128_z_ui64_x$(OBJ) \
++  test_a_f128_z_i32_x$(OBJ) \
++  test_a_f128_z_i64_x$(OBJ) \
++  test_a_f128_z_f32$(OBJ) \
++  test_a_f128_z_f64$(OBJ) \
++  test_a_f128_z_extF80$(OBJ) \
++  test_az_f128$(OBJ) \
++  test_az_f128_rx$(OBJ) \
++  test_abz_f128$(OBJ) \
++  test_abcz_f128$(OBJ) \
++  test_ab_f128_z_bool$(OBJ) \
++
++OBJS_LIB = \
++  uint128$(OBJ) \
++  fail$(OBJ) \
++  functions_common$(OBJ) \
++  functionInfos$(OBJ) \
++  standardFunctionInfos$(OBJ) \
++  random$(OBJ) \
++  genCases_common$(OBJ) \
++  $(OBJS_GENCASES) \
++  genCases_writeTestsTotal$(OBJ) \
++  verCases_common$(OBJ) \
++  verCases_writeFunctionName$(OBJ) \
++  readHex$(OBJ) \
++  writeHex$(OBJ) \
++  $(OBJS_WRITECASE) \
++  testLoops_common$(OBJ) \
++  $(OBJS_TEST) \
++
++uint128$(OBJ): $(SOURCE_DIR)/uint128.h
++fail$(OBJ): $(SOURCE_DIR)/fail.h
++functions_common$(OBJ): $(SOFTFLOAT_H) $(SOURCE_DIR)/functions.h
++functionInfos$(OBJ): $(SOURCE_DIR)/functions.h
++standardFunctionInfos$(OBJ): $(SOURCE_DIR)/functions.h
++random$(OBJ): $(SOURCE_DIR)/random.h
++genCases_common$(OBJ): $(SOURCE_DIR)/fail.h $(SOURCE_DIR)/genCases.h
++$(OBJS_GENCASES): \
++  $(SOURCE_DIR)/random.h $(SOFTFLOAT_H) $(SOURCE_DIR)/genCases.h
++genCases_f128$(OBJ): $(SOURCE_DIR)/uint128.h
++genCases_writeTestsTotal$(OBJ): $(SOURCE_DIR)/genCases.h
++verCases_common$(OBJ): $(SOURCE_DIR)/verCases.h
++verCases_writeFunctionName$(OBJ): $(SOURCE_DIR)/verCases.h
++readHex$(OBJ): $(SOURCE_DIR)/readHex.h
++writeHex$(OBJ): $(SOURCE_DIR)/uint128.h $(SOFTFLOAT_H) $(SOURCE_DIR)/writeHex.h
++$(OBJS_WRITECASE): \
++  $(SOFTFLOAT_H) $(SOURCE_DIR)/writeHex.h $(SOURCE_DIR)/writeCase.h
++testLoops_common$(OBJ): $(SOURCE_DIR)/testLoops.h
++$(OBJS_TEST): \
++  $(SOURCE_DIR)/uint128.h $(SOFTFLOAT_H) $(SOURCE_DIR)/genCases.h \
++  $(SOURCE_DIR)/verCases.h $(SOURCE_DIR)/writeCase.h $(SOURCE_DIR)/testLoops.h
++$(OBJS_LIB): %$(OBJ): platform.h $(SOURCE_DIR)/%.c
++	$(COMPILE_C) $(SOURCE_DIR)/$*.c
++testfloat$(LIB): $(OBJS_LIB)
++	$(MAKELIB) $^
++
++OBJS_TESTSOFTFLOAT = slowfloat$(OBJ) testsoftfloat$(OBJ)
++
++slowfloat$(OBJ): \
++  platform.h $(SOURCE_DIR)/uint128.h $(SOFTFLOAT_H) \
++  $(SOURCE_DIR)/slowfloat.h $(SOURCE_DIR)/slowfloat.c
++	$(COMPILE_SLOWFLOAT_C) $(SOURCE_DIR)/slowfloat.c
++testsoftfloat$(OBJ): \
++  platform.h $(SOURCE_DIR)/uint128.h $(SOURCE_DIR)/fail.h $(SOFTFLOAT_H) \
++  $(SOURCE_DIR)/slowfloat.h $(SOURCE_DIR)/functions.h \
++  $(SOURCE_DIR)/genCases.h $(SOURCE_DIR)/verCases.h $(SOURCE_DIR)/writeCase.h \
++  $(SOURCE_DIR)/testLoops.h $(SOURCE_DIR)/testsoftfloat.c
++	$(COMPILE_C) $(SOURCE_DIR)/testsoftfloat.c
++
++testsoftfloat$(EXE): $(OBJS_TESTSOFTFLOAT) testfloat$(LIB) $(SOFTFLOAT_LIB)
++	$(LINK) $^ $(OTHER_LIBS)
++
++OBJS_TIMESOFTFLOAT = timesoftfloat$(OBJ)
++
++timesoftfloat$(OBJ): \
++  platform.h $(SOURCE_DIR)/uint128.h $(SOURCE_DIR)/fail.h $(SOFTFLOAT_H) \
++  $(SOURCE_DIR)/functions.h $(SOURCE_DIR)/timesoftfloat.c
++	$(COMPILE_C) $(SOURCE_DIR)/timesoftfloat.c
++
++timesoftfloat$(EXE): $(OBJS_TIMESOFTFLOAT) testfloat$(LIB) $(SOFTFLOAT_LIB)
++	$(LINK) $^ $(OTHER_LIBS)
++
++OBJS_TESTFLOAT_GEN = genLoops$(OBJ) testfloat_gen$(OBJ)
++
++genLoops$(OBJ): \
++  platform.h $(SOURCE_DIR)/uint128.h $(SOURCE_DIR)/fail.h $(SOFTFLOAT_H) \
++  $(SOURCE_DIR)/genCases.h $(SOURCE_DIR)/writeHex.h $(SOURCE_DIR)/genLoops.h \
++  $(SOURCE_DIR)/genLoops.c
++	$(COMPILE_C) $(SOURCE_DIR)/genLoops.c
++testfloat_gen$(OBJ): \
++  $(SOURCE_DIR)/fail.h $(SOFTFLOAT_H) $(SOURCE_DIR)/functions.h \
++  $(SOURCE_DIR)/genCases.h $(SOURCE_DIR)/genLoops.h \
++  $(SOURCE_DIR)/testfloat_gen.c
++	$(COMPILE_C) $(SOURCE_DIR)/testfloat_gen.c
++
++testfloat_gen$(EXE): $(OBJS_TESTFLOAT_GEN) testfloat$(LIB) $(SOFTFLOAT_LIB)
++	$(LINK) $^ $(OTHER_LIBS)
++
++OBJS_TESTFLOAT_VER = verLoops$(OBJ) testfloat_ver$(OBJ)
++
++verLoops$(OBJ): \
++  platform.h $(SOURCE_DIR)/uint128.h $(SOURCE_DIR)/fail.h $(SOFTFLOAT_H) \
++  $(SOURCE_DIR)/readHex.h $(SOURCE_DIR)/verCases.h $(SOURCE_DIR)/writeCase.h \
++  $(SOURCE_DIR)/verLoops.h $(SOURCE_DIR)/verLoops.c
++	$(COMPILE_C) $(SOURCE_DIR)/verLoops.c
++testfloat_ver$(OBJ): \
++  platform.h $(SOURCE_DIR)/uint128.h $(SOURCE_DIR)/fail.h $(SOFTFLOAT_H) \
++  $(SOURCE_DIR)/functions.h $(SOURCE_DIR)/verCases.h \
++  $(SOURCE_DIR)/writeCase.h $(SOURCE_DIR)/verLoops.h \
++  $(SOURCE_DIR)/testfloat_ver.c
++	$(COMPILE_C) $(SOURCE_DIR)/testfloat_ver.c
++
++testfloat_ver$(EXE): $(OBJS_TESTFLOAT_VER) testfloat$(LIB) $(SOFTFLOAT_LIB)
++	$(LINK) $^ $(OTHER_LIBS)
++
++OBJS_TESTFLOAT = subjfloat$(OBJ) subjfloat_functions$(OBJ) testfloat$(OBJ)
++
++subjfloat$(OBJ): \
++  platform.h $(SOFTFLOAT_H) $(SUBJ_SOURCE_DIR)/subjfloat_config.h \
++  $(SOURCE_DIR)/subjfloat.h $(SUBJ_SOURCE_DIR)/subjfloat.c
++	$(COMPILE_C) $(SUBJ_SOURCE_DIR)/subjfloat.c
++subjfloat_functions$(OBJ): \
++  platform.h $(SUBJ_SOURCE_DIR)/subjfloat_config.h $(SOURCE_DIR)/subjfloat.h \
++  $(SOURCE_DIR)/functions.h $(SOURCE_DIR)/subjfloat_functions.c
++	$(COMPILE_C) $(SOURCE_DIR)/subjfloat_functions.c
++testfloat$(OBJ): \
++  platform.h $(SOURCE_DIR)/uint128.h $(SOURCE_DIR)/fail.h $(SOFTFLOAT_H) \
++  $(SUBJ_SOURCE_DIR)/subjfloat_config.h $(SOURCE_DIR)/subjfloat.h \
++  $(SOURCE_DIR)/functions.h $(SOURCE_DIR)/genCases.h $(SOURCE_DIR)/verCases.h \
++  $(SOURCE_DIR)/testLoops.h $(SOURCE_DIR)/testfloat.c
++	$(COMPILE_C) $(SOURCE_DIR)/testfloat.c
++
++testfloat$(EXE): $(OBJS_TESTFLOAT) testfloat$(LIB) $(SOFTFLOAT_LIB)
++	$(LINK) $^ $(OTHER_LIBS)
++
++.PHONY: clean
++clean:
++	$(DELETE) $(OBJS_LIB) testfloat$(LIB)
++	$(DELETE) $(OBJS_TESTSOFTFLOAT) testsoftfloat$(EXE)
++	$(DELETE) $(OBJS_TIMESOFTFLOAT) timesoftfloat$(EXE)
++	$(DELETE) $(OBJS_TESTFLOAT_GEN) testfloat_gen$(EXE)
++	$(DELETE) $(OBJS_TESTFLOAT_VER) testfloat_ver$(EXE)
++	$(DELETE) $(OBJS_TESTFLOAT) testfloat$(EXE)
++
+diff --git a/TestFloat-3a/build/Linux-Cross-Compile/platform.h b/TestFloat-3a/build/Linux-Cross-Compile/platform.h
+new file mode 100644
+index 0000000..09e63a0
+--- /dev/null
++++ b/TestFloat-3a/build/Linux-Cross-Compile/platform.h
+@@ -0,0 +1,45 @@
++
++/*============================================================================
++
++This C header file is part of TestFloat, Release 3a, a package of programs for
++testing the correctness of floating-point arithmetic complying with the IEEE
++Standard for Floating-Point, by John R. Hauser.
++
++Copyright 2011, 2012, 2013, 2014 The Regents of the University of California.
++All rights reserved.
++
++Redistribution and use in source and binary forms, with or without
++modification, are permitted provided that the following conditions are met:
++
++ 1. Redistributions of source code must retain the above copyright notice,
++    this list of conditions, and the following disclaimer.
++
++ 2. Redistributions in binary form must reproduce the above copyright notice,
++    this list of conditions, and the following disclaimer in the documentation
++    and/or other materials provided with the distribution.
++
++ 3. Neither the name of the University nor the names of its contributors may
++    be used to endorse or promote products derived from this software without
++    specific prior written permission.
++
++THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS "AS IS", AND ANY
++EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
++WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, ARE
++DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY
++DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
++(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
++LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
++ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
++SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++
++=============================================================================*/
++
++/*----------------------------------------------------------------------------
++*----------------------------------------------------------------------------*/
++#define LITTLEENDIAN 1
++
++/*----------------------------------------------------------------------------
++*----------------------------------------------------------------------------*/
++#define INLINE extern inline
++
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-extended/testfloat/testfloat_3a.bb b/meta-oe/recipes-extended/testfloat/testfloat_3a.bb
new file mode 100644
index 0000000..28e9677
--- /dev/null
+++ b/meta-oe/recipes-extended/testfloat/testfloat_3a.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "Berkeley TestFloat is a small collection of programs for \
+    testing that an implementation of binary floating-point conforms to the \
+    IEEE Standard for Floating-Point Arithmetic."
+
+HOMEPAGE = "http://www.jhauser.us/arithmetic/TestFloat.html"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://TestFloat-${PV}/COPYING.txt;md5=e45c175a323b5727777fb6bd4b26eafc"
+
+SRC_URI = "\
+    http://www.jhauser.us/arithmetic/TestFloat-3a.zip;name=TestFloat \
+    http://www.jhauser.us/arithmetic/SoftFloat-3a.zip;name=SoftFloat \
+    file://0001-Makefile-for-cross-compile-SoftFloat.patch \
+    file://0002-Makefile-for-cross-compile-TestFloat.patch \
+"
+SRC_URI[TestFloat.md5sum] = "5a124e85ab74c5e52da27d401cea6cc3"
+SRC_URI[TestFloat.sha256sum] = "fa258b5b3c751656a372051adee4183e19ad4763032322eb7a87dfb9e2c22c75"
+SRC_URI[SoftFloat.md5sum] = "e53bd4550cf99690642c41374d188517"
+SRC_URI[SoftFloat.sha256sum] = "946fd23180559d60eb6683dda1cf8b142f5426dedfefb97b03c6afdfd70ee9e0"
+
+S = "${WORKDIR}"
+
+do_compile(){
+    oe_runmake -C SoftFloat-${PV}/build/Linux-Cross-Compile/
+    oe_runmake -C TestFloat-${PV}/build/Linux-Cross-Compile/
+}
+
+do_install(){
+    install -d ${D}/${bindir}
+    install ${S}/TestFloat-${PV}/build/Linux-Cross-Compile/testfloat     ${D}/${bindir}
+    install ${S}/TestFloat-${PV}/build/Linux-Cross-Compile/testfloat_gen ${D}/${bindir}
+    install ${S}/TestFloat-${PV}/build/Linux-Cross-Compile/testfloat_ver ${D}/${bindir}
+    install ${S}/TestFloat-${PV}/build/Linux-Cross-Compile/testsoftfloat ${D}/${bindir}
+    install ${S}/TestFloat-${PV}/build/Linux-Cross-Compile/timesoftfloat ${D}/${bindir}
+}
-- 
2.7.1


