Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D53C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 05:21:03 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.43772.1719984053677963876
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jul 2024 22:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SDtIU4wc;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70af0684c2bso28437b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jul 2024 22:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719984053; x=1720588853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PnfuBiIyD3511mg6EvFRloMbao1tnFhEqfvgP2nnw8k=;
        b=SDtIU4wcZrqiZyS25x70UBSGDnUCiGgdNTURm0ugVGYypImpEHKaS9LTkmPYRCgYEn
         kIVOxXbI5I7n8lyGVZMwAusdgEuHjc6N+UFyqZBCvrJEn4yZeici1fYsTjqFNADSPbZ+
         BgubxOOVbugIdn3g8tLjbKM/4WLatYBUKXWWRpVeF93zng0OzfBwsiRlvL7NeOhu8aHp
         KvIHyAoee/p1WWUctj17CsnFAkmMUw1ES1N7c6FICSz4XVyE4XCilUUEdpG5WXDvLvzH
         JOLipr2nD1ZPZ8v1ugo01NRiqwb2fMZtrUdVmymRhTB+shhRBKGMMTVBV8slPJY6e9Vx
         e/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719984053; x=1720588853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnfuBiIyD3511mg6EvFRloMbao1tnFhEqfvgP2nnw8k=;
        b=w+lvTjkhq2MQlcPnquDzmkVl6TGC5HSijAZdCTgMoFTWCWSlKNgF/093psQ7j66a2t
         VW4rfHU30bmTHwGEA+G9OLm96FRZVt5mW3Ug6hbzsGiq3hhMYgrDv890j1Xm3PTBi36C
         szcgspNz0tHMNDVXc8oCfhiuuGZ/M0jL9ItFEl7T9+55Q1PK4/xlPIsQ/EdBcta/jPfi
         KjE/U56/l/YBOpNm5ablVpyP/SmIeuYQEqohhE1LwmZOPtwoeRQL4RPY/rkcLI4INaF7
         GVgfIEaKyIygakwnTk3XD+aYrrHkDF3jdTQCblNPR0wI3q4dfuvYiq8gb8D2oTIVROCe
         Goqw==
X-Gm-Message-State: AOJu0YyDIPpl92z3BJjqU7ZlPVjYs/4c1cYe5h9MV4MT/MbKMTpUTzCb
	wCVbSh4wwYpNb0GrjsnQYhqW3IWTtcaFOsWFA9qQPJnwjQdiwkuMZXlW8A==
X-Google-Smtp-Source: AGHT+IEM2n9nU5gAHJ/Z5tQ5xgWCo/VkZivXx4vmUvddP0+IKpEDhF3CTYQkwZUw1TAgQMLtpxEF/Q==
X-Received: by 2002:a05:6a21:33a8:b0:1be:c947:f17a with SMTP id adf61e73a8af0-1bef614081dmr11001411637.24.1719984052529;
        Tue, 02 Jul 2024 22:20:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10e392asm93718515ad.78.2024.07.02.22.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 22:20:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/2] flite: Fix buld with clang fortify enabled distros
Date: Tue,  2 Jul 2024 22:20:48 -0700
Message-ID: <20240703052049.2661826-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 05:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111217

This issue shows up with upcoming glibc-2.40+ where
clang fortify support has been enhanced significantly.

Set CLEANBROKEN since it does not recover from a dirty tree

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Remove-defining-const-as-nothing.patch | 79 +++++++++++++++++++
 .../recipes-multimedia/flite/flite_2.2.bb     |  3 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/flite/flite/0001-Remove-defining-const-as-nothing.patch

diff --git a/meta-multimedia/recipes-multimedia/flite/flite/0001-Remove-defining-const-as-nothing.patch b/meta-multimedia/recipes-multimedia/flite/flite/0001-Remove-defining-const-as-nothing.patch
new file mode 100644
index 0000000000..899ef26637
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/flite/flite/0001-Remove-defining-const-as-nothing.patch
@@ -0,0 +1,79 @@
+From c71d844f5639ea447b9f795a4db5b5d43f0de814 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Jul 2024 21:41:24 -0700
+Subject: [PATCH] Remove defining 'const' as nothing
+
+This is a hack to override constness of struct members
+however, with modern compiler like clang with fortified
+glibc ( 2.40+ ) headers this runs into compiler errors
+
+| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/flite/2.2/recipe-sysroot/usr/include/bits/stdlib.h:38:54: error: pass_object_size attribute only applies to constant pointer arguments
+|    38 |                  __fortify_clang_overload_arg (char *, __restrict, __resolved)))
+|       |                                                                    ^
+| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/flite/2.2/recipe-sysroot/usr/include/bits/stdlib.h:73:43: error: pass_object_size attribute only applies to constant pointer arguments
+|    73 |                  __fortify_clang_overload_arg (char *, ,__buf),
+|       |                                                         ^
+| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/flite/2.2/recipe-sysroot/usr/include/bits/stdlib.h:91:55: error: pass_object_size attribute only applies to constant pointer arguments
+|    91 | __NTH (wctomb (__fortify_clang_overload_arg (char *, ,__s), wchar_t __wchar))
+|       |                                                       ^
+| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/flite/2.2/recipe-sysroot/usr/include/bits/stdlib.h:129:71: error: pass_object_size attribute only applies to constant pointer arguments
+|   129 | __NTH (mbstowcs (__fortify_clang_overload_arg (wchar_t *, __restrict, __dst),
+|       |                                                                       ^
+| /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/flite/2.2/recipe-sysroot/usr/include/bits/stdlib.h:159:68: error: pass_object_size attribute only applies to constant pointer arguments
+|   159 | __NTH (wcstombs (__fortify_clang_overload_arg (char *, __restrict, __dst),
+|       |                                                                    ^
+| 5 errors generated.
+|
+
+Therefore take this out, instead cast away the 'const' qualifier where needed ( equilly dangerous )
+however limited to just this file instead of apply to all headers including system headers
+
+Upstream-Status: Submitted [https://github.com/festvox/flite/pull/112]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/find_sts_main.c | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/tools/find_sts_main.c b/tools/find_sts_main.c
+index 3c94449..a5bf8ef 100644
+--- a/tools/find_sts_main.c
++++ b/tools/find_sts_main.c
+@@ -41,9 +41,6 @@
+ #include <math.h>
+ #include <string.h>
+ 
+-/* To allow some normally const fields to manipulated during building */
+-#define const
+-
+ #include "cst_args.h"
+ #include "cst_wave.h"
+ #include "cst_track.h"
+@@ -132,16 +129,16 @@ cst_sts *find_sts(cst_wave *sig, cst_track *lpc)
+ 			lpc->frames[i],lpc->num_channels,
+ 			resd,
+ 			size);
+-	sts[i].size = size;
++	*(int *)(&sts[i].size) = size;
+ 	sts[i].frame = cst_alloc(unsigned short,lpc->num_channels-1);
+ 	for (j=1; j < lpc->num_channels; j++)
+-	    sts[i].frame[j-1] = (unsigned short)
++	    *(unsigned short *)(&sts[i].frame[j-1]) = (unsigned short)
+ 		(((lpc->frames[i][j]-lpc_min)/lpc_range)*65535);
+         if (cst_streq(residual_codec,"ulaw"))
+         {
+             sts[i].residual = cst_alloc(unsigned char,size);
+             for (j=0; j < size; j++)
+-                sts[i].residual[j] = cst_short_to_ulaw((short)resd[j]);
++                *(unsigned char *)(&sts[i].residual[j]) = cst_short_to_ulaw((short)resd[j]);
+         }
+         else if (cst_streq(residual_codec,"g721"))
+         {
+@@ -189,7 +186,7 @@ cst_sts *find_sts(cst_wave *sig, cst_track *lpc)
+             {
+                 sts[i].residual = cst_alloc(unsigned char,size);
+                 for (j=0; j < size; j++)
+-                    sts[i].residual[j] = cst_short_to_ulaw((short)resd[j]);
++                    *(unsigned char *)(&sts[i].residual[j]) = cst_short_to_ulaw((short)resd[j]);
+             } 
+             else /* Unvoiced frame */
+             {
diff --git a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
index 0a7680a8c4..bb9edfd5bf 100644
--- a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
+++ b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
@@ -9,6 +9,7 @@ inherit autotools-brokensep
 DEPENDS += "alsa-lib chrpath-replacement-native"
 
 SRC_URI = "git://github.com/festvox/flite.git;protocol=https;branch=master"
+SRC_URI += "file://0001-Remove-defining-const-as-nothing.patch"
 
 SRCREV = "e9e2e37c329dbe98bfeb27a1828ef9a71fa84f88"
 
@@ -25,3 +26,5 @@ do_install:append() {
 }
 # | make[1]: *** No rule to make target 'flite_voice_list.c', needed by 'all'.  Stop.
 PARALLEL_MAKE = ""
+
+CLEANBROKEN = "1"

