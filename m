Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.3347.1588818903990977544
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2020 19:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sifive.com header.s=google header.b=CJUDRiBH;
 spf=pass (domain: sifive.com, ip: 209.85.210.196, mailfrom: zong.li@sifive.com)
Received: by mail-pf1-f196.google.com with SMTP id f7so2192359pfa.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2020 19:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=OgYVPc+F5NpjdIsvnLi/HeSemLWwf8xF2axD7vyntmc=;
        b=CJUDRiBHlHPxD7h0V6omuXsE4/PfGlOP2t7Awpaiz9Kv7PufyYMq/19tHrMok+OGFx
         me89GBeHQAePAq0cBDAUfFVeLDqCuZoXLwhbFhdODrRY56bHB0qX1oFefm+SLk4ZpqGr
         e9KZljoHOWGt6GI2uTogng35aZO67/zWS9bCfDlTTWvopZsrYlxsyc11VOy6wtnuCMk0
         qgWll7T+ouQwB6FoAe6+JWljlf8y42eI2a1J0pXLrG731RtVlGGQRz3GXh6ryapIRSlH
         zjSs+Q6BlsKsr6sx9OIC/GWv5SkJ9hRRYOUk+W4BsVCFqRzVgwVzfDcDr3NmUfs9cduN
         Xwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OgYVPc+F5NpjdIsvnLi/HeSemLWwf8xF2axD7vyntmc=;
        b=bw5Yvwb9eNQ/hTebuYVKAQT+dhWLIK/FSyyw+yk+WvKftQBqaZnQKscgV4gKV0SIEW
         kImVnaBkfZsHJZkI0wEy41JVgzc7m7D8x5IKFfRomDy1aCTG3CDyZpb8gA1G+k2aHgYm
         wGoAb68ubxNSE9DbFuI3a/ERk8ttno3q7/cDApme884t80NBee17qhxaikmwxuZhr6x1
         dwk548zB8su8+3XIvE9iWb3MayezvNFO/iYw93D1r9nrEJS/WQh9trsi07Vx5BYKZWAn
         1XsYRI42TtS5zlO3z9QKLroWbRwZkjsgk0eAaVqssDxHKmJRFxzJ7ydjUPwVbucb7QG7
         doXw==
X-Gm-Message-State: AGi0PuYTeSmNEi9/pvNfLQ8qf9C+5aiBwWgyJWIY2gCq6yeqLwRzqPlO
	uw5CkxZW//izsEv8xXBCvA2zp3TkkDg=
X-Google-Smtp-Source: APiQypIX8tlAFo6aCgeOJ+kuCdXmCfV2GL254U6uKPhHSRKU9cdzpZDq155ng/9YwCYZR/qlKG3MDQ==
X-Received: by 2002:a63:8d4b:: with SMTP id z72mr9385076pgd.376.1588818902416;
        Wed, 06 May 2020 19:35:02 -0700 (PDT)
Return-Path: <zong.li@sifive.com>
Received: from gamma03.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id b16sm3152174pft.191.2020.05.06.19.35.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 19:35:01 -0700 (PDT)
From: zong.li@sifive.com
To: openembedded-devel@lists.openembedded.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [meta-oe][PATCH] Upgrade testfloat to 3e version.
Date: Wed,  6 May 2020 19:34:59 -0700
Message-Id: <1588818899-10035-1-git-send-email-zong.li@sifive.com>
X-Mailer: git-send-email 2.7.4

Upgrade TestFloat to 3e version.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 ...0001-Makefile-for-cross-compile-SoftFloat.patch | 135 +++++++++++++++------
 ...0002-Makefile-for-cross-compile-TestFloat.patch | 117 ++++++++++++------
 meta-oe/recipes-test/testfloat/testfloat_3a.bb     |  35 ------
 meta-oe/recipes-test/testfloat/testfloat_3e.bb     |  36 ++++++
 4 files changed, 211 insertions(+), 112 deletions(-)
 delete mode 100644 meta-oe/recipes-test/testfloat/testfloat_3a.bb
 create mode 100644 meta-oe/recipes-test/testfloat/testfloat_3e.bb

diff --git a/meta-oe/recipes-test/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch b/meta-oe/recipes-test/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch
index 71782c5..9f41bf2 100644
--- a/meta-oe/recipes-test/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch
+++ b/meta-oe/recipes-test/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch
@@ -1,32 +1,34 @@
-Upstream-Status: Inappropriate [configuration]
+From 99b62670d01c6081d883303722726beb65699cbb Mon Sep 17 00:00:00 2001
+From: Zong Li <zong.li@sifive.com>
+Date: Wed, 6 May 2020 01:23:22 -0700
+Subject: [PATCH] Makefile for cross compile SoftFloat 3e
 
-From 07f2528d93f44fe1d8080a4225f29f4ada9f4663 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Thu, 4 Feb 2016 09:15:37 -0200
-Subject: [PATCH 1/2] Makefile for cross compile SoftFloat
+This commit adds a Makefile for cross compile on SoftFloat
+3e version. Almost implementation is based on meta-oe porting
+from Fabio Berton <fabio.berton@ossystems.com.br>.
 
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+Signed-off-by: Zong Li <zongbox@gmail.com>
 ---
- SoftFloat-3a/build/Linux-Cross-Compile/Makefile   | 274 ++++++++++++++++++++++
- SoftFloat-3a/build/Linux-Cross-Compile/platform.h |  44 ++++
- 2 files changed, 318 insertions(+)
- create mode 100644 SoftFloat-3a/build/Linux-Cross-Compile/Makefile
- create mode 100644 SoftFloat-3a/build/Linux-Cross-Compile/platform.h
+ SoftFloat-3e/build/Linux-Cross-Compile/Makefile   | 325 ++++++++++++++++++++++
+ SoftFloat-3e/build/Linux-Cross-Compile/platform.h |  52 ++++
+ 2 files changed, 377 insertions(+)
+ create mode 100644 SoftFloat-3e/build/Linux-Cross-Compile/Makefile
+ create mode 100644 SoftFloat-3e/build/Linux-Cross-Compile/platform.h
 
-diff --git a/SoftFloat-3a/build/Linux-Cross-Compile/Makefile b/SoftFloat-3a/build/Linux-Cross-Compile/Makefile
+diff --git a/SoftFloat-3e/build/Linux-Cross-Compile/Makefile b/SoftFloat-3e/build/Linux-Cross-Compile/Makefile
 new file mode 100644
-index 0000000..c4d0a60
+index 0000000..4da4bc9
 --- /dev/null
-+++ b/SoftFloat-3a/build/Linux-Cross-Compile/Makefile
-@@ -0,0 +1,274 @@
++++ b/SoftFloat-3e/build/Linux-Cross-Compile/Makefile
+@@ -0,0 +1,325 @@
 +
 +#=============================================================================
 +#
-+# This Makefile is part of the SoftFloat IEEE Floating-Point Arithmetic
-+# Package, Release 3a, by John R. Hauser.
++# This Makefile template is part of the SoftFloat IEEE Floating-Point
++# Arithmetic Package, Release 3e, by John R. Hauser.
 +#
-+# Copyright 2011, 2012, 2013, 2014 The Regents of the University of
-+# California.  All rights reserved.
++# Copyright 2011, 2012, 2013, 2014, 2015, 2016, 2017 The Regents of the
++# University of California.  All rights reserved.
 +#
 +# Redistribution and use in source and binary forms, with or without
 +# modification, are permitted provided that the following conditions are met:
@@ -55,21 +57,25 @@ index 0000000..c4d0a60
 +#
 +#=============================================================================
 +
-+SOURCE_DIR = ../../source
-+SPECIALIZE_TYPE = 8086
++SOURCE_DIR ?= ../../source
++SPECIALIZE_TYPE ?= 8086
 +
-+SOFTFLOAT_OPTS = -DINLINE_LEVEL=5 -DSOFTFLOAT_FAST_DIV64TO32 -fgnu89-inline
++SOFTFLOAT_OPTS ?= \
++  -DSOFTFLOAT_ROUND_ODD -DINLINE_LEVEL=5 -DSOFTFLOAT_FAST_DIV32TO16 \
++  -DSOFTFLOAT_FAST_DIV64TO32
 +
 +DELETE = rm -f
 +C_INCLUDES = -I. -I$(SOURCE_DIR)/$(SPECIALIZE_TYPE) -I$(SOURCE_DIR)/include
 +COMPILE_C = \
 +  ${CC} -c -Werror-implicit-function-declaration $(SOFTFLOAT_OPTS) \
-+    $(C_INCLUDES) -O2 -o $@
++  $(C_INCLUDES) -O2 -o $@
 +MAKELIB = ${AR} crs $@
 +
 +OBJ = .o
 +LIB = .a
 +
++OTHER_HEADERS =
++
 +.PHONY: all
 +all: softfloat$(LIB)
 +
@@ -87,6 +93,7 @@ index 0000000..c4d0a60
 +  s_shiftRightJamM$(OBJ) \
 +  s_shiftRightM$(OBJ) \
 +  s_countLeadingZeros8$(OBJ) \
++  s_countLeadingZeros16$(OBJ) \
 +  s_countLeadingZeros32$(OBJ) \
 +  s_countLeadingZeros64$(OBJ) \
 +  s_addM$(OBJ) \
@@ -97,12 +104,17 @@ index 0000000..c4d0a60
 +  s_subM$(OBJ) \
 +  s_mul64To128M$(OBJ) \
 +  s_mul128MTo256M$(OBJ) \
++  s_approxRecip_1Ks$(OBJ) \
 +  s_approxRecip32_1$(OBJ) \
++  s_approxRecipSqrt_1Ks$(OBJ) \
 +  s_approxRecipSqrt32_1$(OBJ) \
 +  s_remStepMBy32$(OBJ) \
 +
 +OBJS_SPECIALIZE = \
 +  softfloat_raiseFlags$(OBJ) \
++  s_f16UIToCommonNaN$(OBJ) \
++  s_commonNaNToF16UI$(OBJ) \
++  s_propagateNaNF16UI$(OBJ) \
 +  s_f32UIToCommonNaN$(OBJ) \
 +  s_commonNaNToF32UI$(OBJ) \
 +  s_propagateNaNF32UI$(OBJ) \
@@ -119,10 +131,16 @@ index 0000000..c4d0a60
 +  s_propagateNaNF128M$(OBJ) \
 +
 +OBJS_OTHERS = \
-+  s_roundPackToUI32$(OBJ) \
-+  s_roundPackMToUI64$(OBJ) \
-+  s_roundPackToI32$(OBJ) \
-+  s_roundPackMToI64$(OBJ) \
++  s_roundToUI32$(OBJ) \
++  s_roundMToUI64$(OBJ) \
++  s_roundToI32$(OBJ) \
++  s_roundMToI64$(OBJ) \
++  s_normSubnormalF16Sig$(OBJ) \
++  s_roundPackToF16$(OBJ) \
++  s_normRoundPackToF16$(OBJ) \
++  s_addMagsF16$(OBJ) \
++  s_subMagsF16$(OBJ) \
++  s_mulAddF16$(OBJ) \
 +  s_normSubnormalF32Sig$(OBJ) \
 +  s_roundPackToF32$(OBJ) \
 +  s_normRoundPackToF32$(OBJ) \
@@ -151,22 +169,53 @@ index 0000000..c4d0a60
 +  s_addF128M$(OBJ) \
 +  s_mulAddF128M$(OBJ) \
 +  softfloat_state$(OBJ) \
++  ui32_to_f16$(OBJ) \
 +  ui32_to_f32$(OBJ) \
 +  ui32_to_f64$(OBJ) \
 +  ui32_to_extF80M$(OBJ) \
 +  ui32_to_f128M$(OBJ) \
++  ui64_to_f16$(OBJ) \
 +  ui64_to_f32$(OBJ) \
 +  ui64_to_f64$(OBJ) \
 +  ui64_to_extF80M$(OBJ) \
 +  ui64_to_f128M$(OBJ) \
++  i32_to_f16$(OBJ) \
 +  i32_to_f32$(OBJ) \
 +  i32_to_f64$(OBJ) \
 +  i32_to_extF80M$(OBJ) \
 +  i32_to_f128M$(OBJ) \
++  i64_to_f16$(OBJ) \
 +  i64_to_f32$(OBJ) \
 +  i64_to_f64$(OBJ) \
 +  i64_to_extF80M$(OBJ) \
 +  i64_to_f128M$(OBJ) \
++  f16_to_ui32$(OBJ) \
++  f16_to_ui64$(OBJ) \
++  f16_to_i32$(OBJ) \
++  f16_to_i64$(OBJ) \
++  f16_to_ui32_r_minMag$(OBJ) \
++  f16_to_ui64_r_minMag$(OBJ) \
++  f16_to_i32_r_minMag$(OBJ) \
++  f16_to_i64_r_minMag$(OBJ) \
++  f16_to_f32$(OBJ) \
++  f16_to_f64$(OBJ) \
++  f16_to_extF80M$(OBJ) \
++  f16_to_f128M$(OBJ) \
++  f16_roundToInt$(OBJ) \
++  f16_add$(OBJ) \
++  f16_sub$(OBJ) \
++  f16_mul$(OBJ) \
++  f16_mulAdd$(OBJ) \
++  f16_div$(OBJ) \
++  f16_rem$(OBJ) \
++  f16_sqrt$(OBJ) \
++  f16_eq$(OBJ) \
++  f16_le$(OBJ) \
++  f16_lt$(OBJ) \
++  f16_eq_signaling$(OBJ) \
++  f16_le_quiet$(OBJ) \
++  f16_lt_quiet$(OBJ) \
++  f16_isSignalingNaN$(OBJ) \
 +  f32_to_ui32$(OBJ) \
 +  f32_to_ui64$(OBJ) \
 +  f32_to_i32$(OBJ) \
@@ -175,6 +224,7 @@ index 0000000..c4d0a60
 +  f32_to_ui64_r_minMag$(OBJ) \
 +  f32_to_i32_r_minMag$(OBJ) \
 +  f32_to_i64_r_minMag$(OBJ) \
++  f32_to_f16$(OBJ) \
 +  f32_to_f64$(OBJ) \
 +  f32_to_extF80M$(OBJ) \
 +  f32_to_f128M$(OBJ) \
@@ -201,6 +251,7 @@ index 0000000..c4d0a60
 +  f64_to_ui64_r_minMag$(OBJ) \
 +  f64_to_i32_r_minMag$(OBJ) \
 +  f64_to_i64_r_minMag$(OBJ) \
++  f64_to_f16$(OBJ) \
 +  f64_to_f32$(OBJ) \
 +  f64_to_extF80M$(OBJ) \
 +  f64_to_f128M$(OBJ) \
@@ -227,6 +278,7 @@ index 0000000..c4d0a60
 +  extF80M_to_ui64_r_minMag$(OBJ) \
 +  extF80M_to_i32_r_minMag$(OBJ) \
 +  extF80M_to_i64_r_minMag$(OBJ) \
++  extF80M_to_f16$(OBJ) \
 +  extF80M_to_f32$(OBJ) \
 +  extF80M_to_f64$(OBJ) \
 +  extF80M_to_f128M$(OBJ) \
@@ -251,6 +303,7 @@ index 0000000..c4d0a60
 +  f128M_to_ui64_r_minMag$(OBJ) \
 +  f128M_to_i32_r_minMag$(OBJ) \
 +  f128M_to_i64_r_minMag$(OBJ) \
++  f128M_to_f16$(OBJ) \
 +  f128M_to_f32$(OBJ) \
 +  f128M_to_f64$(OBJ) \
 +  f128M_to_extF80M$(OBJ) \
@@ -272,7 +325,7 @@ index 0000000..c4d0a60
 +OBJS_ALL = $(OBJS_PRIMITIVES) $(OBJS_SPECIALIZE) $(OBJS_OTHERS)
 +
 +$(OBJS_ALL): \
-+  platform.h $(SOURCE_DIR)/include/primitiveTypes.h \
++  $(OTHER_HEADERS) platform.h $(SOURCE_DIR)/include/primitiveTypes.h \
 +  $(SOURCE_DIR)/include/primitives.h
 +$(OBJS_SPECIALIZE) $(OBJS_OTHERS): \
 +  $(SOURCE_DIR)/include/softfloat_types.h $(SOURCE_DIR)/include/internals.h \
@@ -293,20 +346,20 @@ index 0000000..c4d0a60
 +clean:
 +	$(DELETE) $(OBJS_ALL) softfloat$(LIB)
 +
-diff --git a/SoftFloat-3a/build/Linux-Cross-Compile/platform.h b/SoftFloat-3a/build/Linux-Cross-Compile/platform.h
+diff --git a/SoftFloat-3e/build/Linux-Cross-Compile/platform.h b/SoftFloat-3e/build/Linux-Cross-Compile/platform.h
 new file mode 100644
-index 0000000..5e566fc
+index 0000000..1728c15
 --- /dev/null
-+++ b/SoftFloat-3a/build/Linux-Cross-Compile/platform.h
-@@ -0,0 +1,44 @@
++++ b/SoftFloat-3e/build/Linux-Cross-Compile/platform.h
+@@ -0,0 +1,52 @@
 +
 +/*============================================================================
 +
-+This C header file is part of the SoftFloat IEEE Floating-Point Arithmetic
-+Package, Release 3a, by John R. Hauser.
++This C header template is part of the SoftFloat IEEE Floating-Point Arithmetic
++Package, Release 3e, by John R. Hauser.
 +
-+Copyright 2011, 2012, 2013, 2014 The Regents of the University of California.
-+All rights reserved.
++Copyright 2011, 2012, 2013, 2014, 2015, 2016 The Regents of the University of
++California.  All rights reserved.
 +
 +Redistribution and use in source and binary forms, with or without
 +modification, are permitted provided that the following conditions are met:
@@ -341,8 +394,16 @@ index 0000000..5e566fc
 +
 +/*----------------------------------------------------------------------------
 +*----------------------------------------------------------------------------*/
++#ifdef __GNUC_STDC_INLINE__
++#define INLINE inline
++#else
 +#define INLINE extern inline
++#endif
 +
++/*----------------------------------------------------------------------------
++*----------------------------------------------------------------------------*/
++#define SOFTFLOAT_BUILTIN_CLZ 1
++#include "opts-GCC.h"
 -- 
-2.1.4
+2.7.4
 
diff --git a/meta-oe/recipes-test/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch b/meta-oe/recipes-test/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch
index 71ca343..b7d861f 100644
--- a/meta-oe/recipes-test/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch
+++ b/meta-oe/recipes-test/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch
@@ -1,33 +1,35 @@
-Upstream-Status: Inappropriate [configuration]
+From 3503f7f3845caba454949fdf8408e85ca4fdb943 Mon Sep 17 00:00:00 2001
+From: Zong Li <zong.li@sifive.com>
+Date: Wed, 6 May 2020 01:25:55 -0700
+Subject: [PATCH] Makefile for cross compile TestFloat 3e
 
-From 9aa4a416f05967320c1aa52bdccfe105a3bf3269 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Thu, 4 Feb 2016 09:16:09 -0200
-Subject: [PATCH 2/2] Makefile for cross compile TestFloat
+This commit adds a Makefile for cross compile on TestFloat
+3e version. Almost implementation is based on meta-oe porting
+from Fabio Berton <fabio.berton@ossystems.com.br>.
 
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+Signed-off-by: Zong Li <zongbox@gmail.com>
 ---
- TestFloat-3a/build/Linux-Cross-Compile/Makefile   | 321 ++++++++++++++++++++++
- TestFloat-3a/build/Linux-Cross-Compile/platform.h |  45 +++
- 2 files changed, 366 insertions(+)
- create mode 100644 TestFloat-3a/build/Linux-Cross-Compile/Makefile
- create mode 100644 TestFloat-3a/build/Linux-Cross-Compile/platform.h
+ TestFloat-3e/build/Linux-Cross-Compile/Makefile   | 353 ++++++++++++++++++++++
+ TestFloat-3e/build/Linux-Cross-Compile/platform.h |  48 +++
+ 2 files changed, 401 insertions(+)
+ create mode 100644 TestFloat-3e/build/Linux-Cross-Compile/Makefile
+ create mode 100644 TestFloat-3e/build/Linux-Cross-Compile/platform.h
 
-diff --git a/TestFloat-3a/build/Linux-Cross-Compile/Makefile b/TestFloat-3a/build/Linux-Cross-Compile/Makefile
+diff --git a/TestFloat-3e/build/Linux-Cross-Compile/Makefile b/TestFloat-3e/build/Linux-Cross-Compile/Makefile
 new file mode 100644
-index 0000000..a89326a
+index 0000000..d82b9ed
 --- /dev/null
-+++ b/TestFloat-3a/build/Linux-Cross-Compile/Makefile
-@@ -0,0 +1,321 @@
++++ b/TestFloat-3e/build/Linux-Cross-Compile/Makefile
+@@ -0,0 +1,353 @@
 +
 +#=============================================================================
 +#
-+# This Makefile is part of TestFloat, Release 3a, a package of programs for
-+# testing the correctness of floating-point arithmetic complying with the IEEE
-+# Standard for Floating-Point, by John R. Hauser.
++# This Makefile template is part of TestFloat, Release 3b, a package of
++# programs for testing the correctness of floating-point arithmetic complying
++# with the IEEE Standard for Floating-Point, by John R. Hauser.
 +#
-+# Copyright 2011, 2012, 2013, 2014, 2015 The Regents of the University of
-+# California.  All rights reserved.
++# Copyright 2011, 2012, 2013, 2014, 2015, 2016 The Regents of the University
++# of California.  All rights reserved.
 +#
 +# Redistribution and use in source and binary forms, with or without
 +# modification, are permitted provided that the following conditions are met:
@@ -56,28 +58,29 @@ index 0000000..a89326a
 +#
 +#=============================================================================
 +
-+SOURCE_DIR = ../../source
++SOURCE_DIR ?= ../../source
++SOFTFLOAT_DIR ?= ../../../SoftFloat-3e
++PLATFORM ?= Linux-Cross-Compile
++
 +SUBJ_SOURCE_DIR = $(SOURCE_DIR)/subj-C
-+SOFTFLOAT_DIR = ../../../SoftFloat-3a
 +SOFTFLOAT_INCLUDE_DIR = $(SOFTFLOAT_DIR)/source/include
-+PLATFORM = Linux-Cross-Compile
 +
 +SOFTFLOAT_H = \
 +  $(SOFTFLOAT_INCLUDE_DIR)/softfloat_types.h \
 +  $(SOFTFLOAT_INCLUDE_DIR)/softfloat.h
 +SOFTFLOAT_LIB = $(SOFTFLOAT_DIR)/build/$(PLATFORM)/softfloat$(LIB)
 +
-+TESTFLOAT_OPTS = -DEXTFLOAT80 -DFLOAT128 -DLONG_DOUBLE_IS_EXTFLOAT80 -fgnu89-inline
++TESTFLOAT_OPTS ?= -DFLOAT16 -DFLOAT64 -DEXTFLOAT80 -DFLOAT128 -DFLOAT_ROUND_ODD
 +
 +DELETE = rm -f
 +C_INCLUDES = \
 +  -I. -I$(SUBJ_SOURCE_DIR) -I$(SOURCE_DIR) -I$(SOFTFLOAT_INCLUDE_DIR)
 +COMPILE_C = \
-+  ${CC} -c -Werror-implicit-function-declaration $(TESTFLOAT_OPTS) \
-+    $(C_INCLUDES) -O2 -o $@
++  ${CC} -c -Werror-implicit-function-declaration \
++  $(TESTFLOAT_OPTS) $(C_INCLUDES) -O2 -o $@
 +COMPILE_SLOWFLOAT_C = \
-+  ${CC} -c -Werror-implicit-function-declaration $(TESTFLOAT_OPTS) \
-+    $(C_INCLUDES) -O3 -o $@
++  ${CC} -c -Werror-implicit-function-declaration \
++  $(TESTFLOAT_OPTS) $(C_INCLUDES) -O3 -o $@
 +MAKELIB = ${AR} crs $@
 +LINK = ${CC} -o $@ ${LDFLAGS}
 +OTHER_LIBS = -lm
@@ -99,6 +102,7 @@ index 0000000..a89326a
 +  genCases_ui64$(OBJ) \
 +  genCases_i32$(OBJ) \
 +  genCases_i64$(OBJ) \
++  genCases_f16$(OBJ) \
 +  genCases_f32$(OBJ) \
 +  genCases_f64$(OBJ) \
 +  genCases_extF80$(OBJ) \
@@ -107,6 +111,9 @@ index 0000000..a89326a
 +OBJS_WRITECASE = \
 +  writeCase_a_ui32$(OBJ) \
 +  writeCase_a_ui64$(OBJ) \
++  writeCase_a_f16$(OBJ) \
++  writeCase_ab_f16$(OBJ) \
++  writeCase_abc_f16$(OBJ) \
 +  writeCase_a_f32$(OBJ) \
 +  writeCase_ab_f32$(OBJ) \
 +  writeCase_abc_f32$(OBJ) \
@@ -115,35 +122,56 @@ index 0000000..a89326a
 +  writeCase_abc_f64$(OBJ) \
 +  writeCase_a_extF80M$(OBJ) \
 +  writeCase_ab_extF80M$(OBJ) \
-+  writeCase_abc_extF80M$(OBJ) \
 +  writeCase_a_f128M$(OBJ) \
 +  writeCase_ab_f128M$(OBJ) \
 +  writeCase_abc_f128M$(OBJ) \
 +  writeCase_z_bool$(OBJ) \
 +  writeCase_z_ui32$(OBJ) \
 +  writeCase_z_ui64$(OBJ) \
++  writeCase_z_f16$(OBJ) \
 +  writeCase_z_f32$(OBJ) \
 +  writeCase_z_f64$(OBJ) \
 +  writeCase_z_extF80M$(OBJ) \
 +  writeCase_z_f128M$(OBJ) \
 +
 +OBJS_TEST = \
++  test_a_ui32_z_f16$(OBJ) \
 +  test_a_ui32_z_f32$(OBJ) \
 +  test_a_ui32_z_f64$(OBJ) \
 +  test_a_ui32_z_extF80$(OBJ) \
 +  test_a_ui32_z_f128$(OBJ) \
++  test_a_ui64_z_f16$(OBJ) \
 +  test_a_ui64_z_f32$(OBJ) \
 +  test_a_ui64_z_f64$(OBJ) \
 +  test_a_ui64_z_extF80$(OBJ) \
 +  test_a_ui64_z_f128$(OBJ) \
++  test_a_i32_z_f16$(OBJ) \
 +  test_a_i32_z_f32$(OBJ) \
 +  test_a_i32_z_f64$(OBJ) \
 +  test_a_i32_z_extF80$(OBJ) \
 +  test_a_i32_z_f128$(OBJ) \
++  test_a_i64_z_f16$(OBJ) \
 +  test_a_i64_z_f32$(OBJ) \
 +  test_a_i64_z_f64$(OBJ) \
 +  test_a_i64_z_extF80$(OBJ) \
 +  test_a_i64_z_f128$(OBJ) \
++  test_a_f16_z_ui32_rx$(OBJ) \
++  test_a_f16_z_ui64_rx$(OBJ) \
++  test_a_f16_z_i32_rx$(OBJ) \
++  test_a_f16_z_i64_rx$(OBJ) \
++  test_a_f16_z_ui32_x$(OBJ) \
++  test_a_f16_z_ui64_x$(OBJ) \
++  test_a_f16_z_i32_x$(OBJ) \
++  test_a_f16_z_i64_x$(OBJ) \
++  test_a_f16_z_f32$(OBJ) \
++  test_a_f16_z_f64$(OBJ) \
++  test_a_f16_z_extF80$(OBJ) \
++  test_a_f16_z_f128$(OBJ) \
++  test_az_f16$(OBJ) \
++  test_az_f16_rx$(OBJ) \
++  test_abz_f16$(OBJ) \
++  test_abcz_f16$(OBJ) \
++  test_ab_f16_z_bool$(OBJ) \
 +  test_a_f32_z_ui32_rx$(OBJ) \
 +  test_a_f32_z_ui64_rx$(OBJ) \
 +  test_a_f32_z_i32_rx$(OBJ) \
@@ -152,6 +180,7 @@ index 0000000..a89326a
 +  test_a_f32_z_ui64_x$(OBJ) \
 +  test_a_f32_z_i32_x$(OBJ) \
 +  test_a_f32_z_i64_x$(OBJ) \
++  test_a_f32_z_f16$(OBJ) \
 +  test_a_f32_z_f64$(OBJ) \
 +  test_a_f32_z_extF80$(OBJ) \
 +  test_a_f32_z_f128$(OBJ) \
@@ -168,6 +197,7 @@ index 0000000..a89326a
 +  test_a_f64_z_ui64_x$(OBJ) \
 +  test_a_f64_z_i32_x$(OBJ) \
 +  test_a_f64_z_i64_x$(OBJ) \
++  test_a_f64_z_f16$(OBJ) \
 +  test_a_f64_z_f32$(OBJ) \
 +  test_a_f64_z_extF80$(OBJ) \
 +  test_a_f64_z_f128$(OBJ) \
@@ -184,6 +214,7 @@ index 0000000..a89326a
 +  test_a_extF80_z_ui64_x$(OBJ) \
 +  test_a_extF80_z_i32_x$(OBJ) \
 +  test_a_extF80_z_i64_x$(OBJ) \
++  test_a_extF80_z_f16$(OBJ) \
 +  test_a_extF80_z_f32$(OBJ) \
 +  test_a_extF80_z_f64$(OBJ) \
 +  test_a_extF80_z_f128$(OBJ) \
@@ -199,6 +230,7 @@ index 0000000..a89326a
 +  test_a_f128_z_ui64_x$(OBJ) \
 +  test_a_f128_z_i32_x$(OBJ) \
 +  test_a_f128_z_i64_x$(OBJ) \
++  test_a_f128_z_f16$(OBJ) \
 +  test_a_f128_z_f32$(OBJ) \
 +  test_a_f128_z_f64$(OBJ) \
 +  test_a_f128_z_extF80$(OBJ) \
@@ -209,6 +241,7 @@ index 0000000..a89326a
 +  test_ab_f128_z_bool$(OBJ) \
 +
 +OBJS_LIB = \
++  uint128_inline$(OBJ) \
 +  uint128$(OBJ) \
 +  fail$(OBJ) \
 +  functions_common$(OBJ) \
@@ -218,6 +251,7 @@ index 0000000..a89326a
 +  genCases_common$(OBJ) \
 +  $(OBJS_GENCASES) \
 +  genCases_writeTestsTotal$(OBJ) \
++  verCases_inline$(OBJ) \
 +  verCases_common$(OBJ) \
 +  verCases_writeFunctionName$(OBJ) \
 +  readHex$(OBJ) \
@@ -340,21 +374,21 @@ index 0000000..a89326a
 +	$(DELETE) $(OBJS_TESTFLOAT_VER) testfloat_ver$(EXE)
 +	$(DELETE) $(OBJS_TESTFLOAT) testfloat$(EXE)
 +
-diff --git a/TestFloat-3a/build/Linux-Cross-Compile/platform.h b/TestFloat-3a/build/Linux-Cross-Compile/platform.h
+diff --git a/TestFloat-3e/build/Linux-Cross-Compile/platform.h b/TestFloat-3e/build/Linux-Cross-Compile/platform.h
 new file mode 100644
-index 0000000..09e63a0
+index 0000000..487a43b
 --- /dev/null
-+++ b/TestFloat-3a/build/Linux-Cross-Compile/platform.h
-@@ -0,0 +1,45 @@
++++ b/TestFloat-3e/build/Linux-Cross-Compile/platform.h
+@@ -0,0 +1,48 @@
 +
 +/*============================================================================
 +
-+This C header file is part of TestFloat, Release 3a, a package of programs for
-+testing the correctness of floating-point arithmetic complying with the IEEE
-+Standard for Floating-Point, by John R. Hauser.
++This C header template is part of TestFloat, Release 3e, a package of programs
++for testing the correctness of floating-point arithmetic complying with the
++IEEE Standard for Floating-Point, by John R. Hauser.
 +
-+Copyright 2011, 2012, 2013, 2014 The Regents of the University of California.
-+All rights reserved.
++Copyright 2011, 2012, 2013, 2014, 2015, 2016 The Regents of the University of
++California.  All rights reserved.
 +
 +Redistribution and use in source and binary forms, with or without
 +modification, are permitted provided that the following conditions are met:
@@ -389,8 +423,11 @@ index 0000000..09e63a0
 +
 +/*----------------------------------------------------------------------------
 +*----------------------------------------------------------------------------*/
++#ifdef __GNUC_STDC_INLINE__
++#define INLINE inline
++#else
 +#define INLINE extern inline
-+
++#endif
 -- 
-2.1.4
+2.7.4
 
diff --git a/meta-oe/recipes-test/testfloat/testfloat_3a.bb b/meta-oe/recipes-test/testfloat/testfloat_3a.bb
deleted file mode 100644
index ace376e..0000000
--- a/meta-oe/recipes-test/testfloat/testfloat_3a.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Berkeley TestFloat is a small collection of programs for \
-    testing that an implementation of binary floating-point conforms to the \
-    IEEE Standard for Floating-Point Arithmetic."
-
-HOMEPAGE = "http://www.jhauser.us/arithmetic/TestFloat.html"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://TestFloat-${PV}/COPYING.txt;md5=e45c175a323b5727777fb6bd4b26eafc"
-
-SRC_URI = "\
-    http://www.jhauser.us/arithmetic/TestFloat-3a.zip;name=TestFloat \
-    http://www.jhauser.us/arithmetic/SoftFloat-3a.zip;name=SoftFloat \
-    file://0001-Makefile-for-cross-compile-SoftFloat.patch \
-    file://0002-Makefile-for-cross-compile-TestFloat.patch \
-"
-SRC_URI[TestFloat.md5sum] = "5a124e85ab74c5e52da27d401cea6cc3"
-SRC_URI[TestFloat.sha256sum] = "fa258b5b3c751656a372051adee4183e19ad4763032322eb7a87dfb9e2c22c75"
-SRC_URI[SoftFloat.md5sum] = "e53bd4550cf99690642c41374d188517"
-SRC_URI[SoftFloat.sha256sum] = "946fd23180559d60eb6683dda1cf8b142f5426dedfefb97b03c6afdfd70ee9e0"
-
-S = "${WORKDIR}"
-
-do_compile(){
-    oe_runmake -C SoftFloat-${PV}/build/Linux-Cross-Compile/
-    oe_runmake -C TestFloat-${PV}/build/Linux-Cross-Compile/
-}
-
-do_install(){
-    install -d ${D}/${bindir}
-    install ${S}/TestFloat-${PV}/build/Linux-Cross-Compile/testfloat     ${D}/${bindir}
-    install ${S}/TestFloat-${PV}/build/Linux-Cross-Compile/testfloat_gen ${D}/${bindir}
-    install ${S}/TestFloat-${PV}/build/Linux-Cross-Compile/testfloat_ver ${D}/${bindir}
-    install ${S}/TestFloat-${PV}/build/Linux-Cross-Compile/testsoftfloat ${D}/${bindir}
-    install ${S}/TestFloat-${PV}/build/Linux-Cross-Compile/timesoftfloat ${D}/${bindir}
-}
diff --git a/meta-oe/recipes-test/testfloat/testfloat_3e.bb b/meta-oe/recipes-test/testfloat/testfloat_3e.bb
new file mode 100644
index 0000000..2e44da4
--- /dev/null
+++ b/meta-oe/recipes-test/testfloat/testfloat_3e.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Berkeley TestFloat 3e"
+DESCRIPTION = "Berkeley TestFloat is a small collection of programs for \
+    testing that an implementation of binary floating-point conforms to the \
+    IEEE Standard for Floating-Point Arithmetic."
+
+HOMEPAGE = "http://www.jhauser.us/arithmetic/TestFloat.html"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://TestFloat-${PV}/COPYING.txt;md5=d467c2d231054347e8fd885ac06e7b2b"
+
+SRC_URI = "\
+    http://www.jhauser.us/arithmetic/TestFloat-3e.zip;name=TestFloat \
+    http://www.jhauser.us/arithmetic/SoftFloat-3e.zip;name=SoftFloat \
+    file://0001-Makefile-for-cross-compile-SoftFloat-3e.patch \
+    file://0002-Makefile-for-cross-compile-TestFloat-3e.patch \
+"
+SRC_URI[TestFloat.md5sum] = "e70a1e6c6732abf79645a6dcca69a654"
+SRC_URI[TestFloat.sha256sum] = "6d4bdf0096b48a653aa59fc203a9e5fe18b5a58d7a1b715107c7146776a0aad6"
+SRC_URI[SoftFloat.md5sum] = "7dac954ea4aed0697cbfee800ba4f492"
+SRC_URI[SoftFloat.sha256sum] = "21130ce885d35c1fe73fc1e1bf2244178167e05c6747cad5f450cc991714c746"
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
2.7.4

