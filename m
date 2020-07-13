Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.20612.1594650649740950106
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2020 07:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06DEUBG5015767
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2020 07:30:38 -0700
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 13 Jul 2020
 07:30:11 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/1] nss: upgrade 3.51.1 -> 3.54
Date: Mon, 13 Jul 2020 17:28:00 +0300
Message-ID: <20200713142800.18149-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Upgrade nss 3.51.1 -> 3.54:
* Refresh patches
* Drop riscv.patch and 0001-Enable-uint128-on-mips64.patch patches as upstream
  commit [1] should implement that logic
* Use "autobuild" as do_compile make target (Makefile logic has changed
  significantly, so the default target is no longer enough)

[1] https://hg.mozilla.org/projects/nss/rev/60aa7df14f119d2a21750668c5ce36fa38ef2c6c

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../nss/0001-Enable-uint128-on-mips64.patch   |  48 --------
 ...figure-option-to-disable-ARM-HW-cryp.patch |  22 ++--
 ...0001-nss-fix-support-cross-compiling.patch |  10 +-
 .../nss/nss/disable-Wvarargs-with-clang.patch |  17 ++-
 .../nss-fix-incorrect-shebang-of-perl.patch   | 107 +++++++-----------
 .../nss/nss/nss-fix-nsinstall-build.patch     |  20 +++-
 .../nss-no-rpath-for-cross-compiling.patch    |  10 +-
 .../nss/nss/pqg.c-ULL_addend.patch            |  21 +++-
 meta-oe/recipes-support/nss/nss/riscv.patch   |  36 ------
 .../nss/{nss_3.51.1.bb => nss_3.54.bb}        |   8 +-
 10 files changed, 113 insertions(+), 186 deletions(-)
 delete mode 100644 meta-oe/recipes-support/nss/nss/0001-Enable-uint128-on-mips64.patch
 delete mode 100644 meta-oe/recipes-support/nss/nss/riscv.patch
 rename meta-oe/recipes-support/nss/{nss_3.51.1.bb => nss_3.54.bb} (97%)

diff --git a/meta-oe/recipes-support/nss/nss/0001-Enable-uint128-on-mips64.patch b/meta-oe/recipes-support/nss/nss/0001-Enable-uint128-on-mips64.patch
deleted file mode 100644
index 90ec379c6..000000000
--- a/meta-oe/recipes-support/nss/nss/0001-Enable-uint128-on-mips64.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 8cf7afb5417e23cd3ebf8141239bf020f5dd2ac8 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 30 Apr 2020 06:56:09 +0000
-Subject: [PATCH] Enable uint128 on mips64
-
-Fix below error:
-| verified/kremlin/kremlib/dist/minimal/FStar_UInt128.h:22:1: error: 'FStar_UInt128___proj__Mkuint128__item__low' declared 'static' but never defined [-Werror=unused-function]
-|   22 | FStar_UInt128___proj__Mkuint128__item__low(FStar_UInt128_uint128 projectee);
-
-Upstream-Status: Pending
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- .../freebl/verified/kremlin/include/kremlin/internal/types.h   | 3 ++-
- .../kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h         | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/nss/lib/freebl/verified/kremlin/include/kremlin/internal/types.h b/nss/lib/freebl/verified/kremlin/include/kremlin/internal/types.h
-index 801e78f..cdac61e 100644
---- a/nss/lib/freebl/verified/kremlin/include/kremlin/internal/types.h
-+++ b/nss/lib/freebl/verified/kremlin/include/kremlin/internal/types.h
-@@ -57,7 +57,8 @@ typedef const char *Prims_string;
- typedef __m128i FStar_UInt128_uint128;
- #elif !defined(KRML_VERIFIED_UINT128) && !defined(_MSC_VER) && \
-     (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__) || \
--     (defined(__riscv) && __riscv_xlen == 64))
-+     (defined(__riscv) && __riscv_xlen == 64) || \
-+     defined(__mips64))
- typedef unsigned __int128 FStar_UInt128_uint128;
- #else
- typedef struct FStar_UInt128_uint128_s {
-diff --git a/nss/lib/freebl/verified/kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h b/nss/lib/freebl/verified/kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h
-index f38fda3..7ca67d2 100644
---- a/nss/lib/freebl/verified/kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h
-+++ b/nss/lib/freebl/verified/kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h
-@@ -26,7 +26,8 @@
- #include <stdint.h>
- #if !defined(KRML_VERIFIED_UINT128) && !defined(_MSC_VER) && \
-     (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__) || \
--     (defined(__riscv) && __riscv_xlen == 64))
-+     (defined(__riscv) && __riscv_xlen == 64) || \
-+     defined(__mips64))
- 
- /* GCC + using native unsigned __int128 support */
- 
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
index c380c1449..1a87a0577 100644
--- a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
+++ b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
@@ -1,4 +1,4 @@
-From 5595e9651aca39af945931c73eb524a0f8bd130d Mon Sep 17 00:00:00 2001
+From 8b67c22b057e158f61c9fdd5b01f37195c6f5ca4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 18 Dec 2019 12:29:50 +0100
 Subject: [PATCH] freebl: add a configure option to disable ARM HW crypto
@@ -8,10 +8,14 @@ prior to armv8 does not.
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- nss/lib/freebl/Makefile | 3 +++
- 1 file changed, 3 insertions(+)
+ nss/lib/freebl/Makefile | 4 ++++
+ nss/lib/freebl/gcm.c    | 2 ++
+ 2 files changed, 6 insertions(+)
 
+diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
+index f99f769..b0ec81b 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
 @@ -125,6 +125,9 @@ else
@@ -22,9 +26,9 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 +ifdef NSS_USE_ARM_HW_CRYPTO
 +    DEFINES += -DNSS_USE_ARM_HW_CRYPTO
  ifeq ($(CPU_ARCH),aarch64)
-     DEFINES += -DUSE_HW_AES
-     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c
-@@ -146,6 +149,7 @@ ifeq ($(CPU_ARCH),arm)
+     DEFINES += -DUSE_HW_AES -DUSE_HW_SHA2
+     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c sha256-armv8.c
+@@ -148,6 +151,7 @@ endif
          endif
      endif
  endif
@@ -32,9 +36,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  
  ifeq ($(OS_TARGET),OSF1)
      DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
+diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
+index c2cc18d..b77f573 100644
 --- a/nss/lib/freebl/gcm.c
 +++ b/nss/lib/freebl/gcm.c
-@@ -17,6 +17,7 @@
+@@ -18,6 +18,7 @@
  
  #include <limits.h>
  
@@ -42,7 +48,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  /* old gcc doesn't support some poly64x2_t intrinsic */
  #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
      (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
-@@ -25,6 +26,7 @@
+@@ -27,6 +28,7 @@
  /* We don't test on big endian platform, so disable this on big endian. */
  #define USE_ARM_GCM
  #endif
diff --git a/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
index d5403397e..3d90e2d95 100644
--- a/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
+++ b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 0cf47ee432cc26a706864fcc09b2c3adc342a679 Mon Sep 17 00:00:00 2001
+From 8cea16e7550ae14494fbb3a8fe9f5452e6bd1407 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 22 Feb 2017 11:36:11 +0200
 Subject: [PATCH] nss: fix support cross compiling
@@ -8,13 +8,14 @@ Let some make variables be assigned from outside makefile.
 Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  nss/coreconf/arch.mk    | 2 +-
  nss/lib/freebl/Makefile | 6 ++++++
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/nss/coreconf/arch.mk b/nss/coreconf/arch.mk
-index 06c276f..9c1eb51 100644
+index 790372d..2563134 100644
 --- a/nss/coreconf/arch.mk
 +++ b/nss/coreconf/arch.mk
 @@ -30,7 +30,7 @@ OS_TEST := $(shell uname -m)
@@ -27,7 +28,7 @@ index 06c276f..9c1eb51 100644
  
  #
 diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index 0ce1425..ebeb411 100644
+index 52d827c..f99f769 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
 @@ -36,6 +36,12 @@ ifdef USE_64
@@ -43,6 +44,3 @@ index 0ce1425..ebeb411 100644
  ifdef USE_ABI32_FPU
  	DEFINES += -DNSS_USE_ABI32_FPU
  endif
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch b/meta-oe/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
index de812d27b..e87dc9f76 100644
--- a/meta-oe/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
+++ b/meta-oe/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
@@ -1,3 +1,8 @@
+From c5b2c6327f3692ed07bf8d212123e0bf08485722 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 7 Mar 2020 08:34:02 -0800
+Subject: [PATCH] nss,nspr: Add recipes
+
 clang 3.9 add this warning to rightly flag undefined
 behavior, we relegate this to be just a warning instead
 of error and keep the behavior as it was. Right fix would
@@ -18,10 +23,14 @@ for more details
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-Index: nss-3.37.1/nss/coreconf/Werror.mk
-===================================================================
---- nss-3.37.1.orig/nss/coreconf/Werror.mk
-+++ nss-3.37.1/nss/coreconf/Werror.mk
+---
+ nss/coreconf/Werror.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/coreconf/Werror.mk b/nss/coreconf/Werror.mk
+index a569a49..687fe58 100644
+--- a/nss/coreconf/Werror.mk
++++ b/nss/coreconf/Werror.mk
 @@ -56,7 +56,7 @@ ifndef WARNING_CFLAGS
      ifdef CC_IS_CLANG
        # -Qunused-arguments : clang objects to arguments that it doesn't understand
diff --git a/meta-oe/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch b/meta-oe/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch
index 547594d5b..6f02dbcb4 100644
--- a/meta-oe/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch
+++ b/meta-oe/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch
@@ -1,82 +1,56 @@
-nss: fix incorrect shebang of perl
+From 028ec9c7e9f7a6f083eec987f3ad7e7623398d9d Mon Sep 17 00:00:00 2001
+From: Ovidiu Panait <ovidiu.panait@windriver.com>
+Date: Mon, 13 Jul 2020 12:12:31 +0300
+Subject: [PATCH] nss: fix incorrect shebang of perl
 
 Replace incorrect shebang of perl with `#!/usr/bin/env perl'.
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Upstream-Status: Pending
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+
 ---
- nss/cmd/smimetools/smime  | 2 +-
- nss/coreconf/cpdist.pl    | 2 +-
- nss/coreconf/import.pl    | 2 +-
- nss/coreconf/jniregen.pl  | 2 +-
- nss/coreconf/outofdate.pl | 2 +-
- nss/coreconf/release.pl   | 2 +-
- nss/coreconf/version.pl   | 2 +-
- nss/tests/clean_tbx       | 2 +-
- nss/tests/path_uniq       | 2 +-
- 9 files changed, 9 insertions(+), 9 deletions(-)
+ nss/cmd/signver/examples/1/form.pl       | 2 +-
+ nss/cmd/signver/examples/1/signedForm.pl | 2 +-
+ nss/cmd/smimetools/smime                 | 2 +-
+ nss/coreconf/version.pl                  | 2 +-
+ nss/tests/clean_tbx                      | 2 +-
+ nss/tests/iopr/server_scr/client.cgi     | 2 +-
+ nss/tests/path_uniq                      | 2 +-
+ 7 files changed, 7 insertions(+), 7 deletions(-)
 
-diff --git a/nss/cmd/smimetools/smime b/nss/cmd/smimetools/smime
---- a/nss/cmd/smimetools/smime
-+++ b/nss/cmd/smimetools/smime
+diff --git a/nss/cmd/signver/examples/1/form.pl b/nss/cmd/signver/examples/1/form.pl
+index f2cfddc..af58d54 100755
+--- a/nss/cmd/signver/examples/1/form.pl
++++ b/nss/cmd/signver/examples/1/form.pl
 @@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
+-#! /usr/bin/perl
 +#!/usr/bin/env perl
- 
  # This Source Code Form is subject to the terms of the Mozilla Public
  # License, v. 2.0. If a copy of the MPL was not distributed with this
-diff --git a/nss/coreconf/cpdist.pl b/nss/coreconf/cpdist.pl
-index 800edfb..652187f 100755
---- a/nss/coreconf/cpdist.pl
-+++ b/nss/coreconf/cpdist.pl
+ # file, You can obtain one at http://mozilla.org/MPL/2.0/.
+diff --git a/nss/cmd/signver/examples/1/signedForm.pl b/nss/cmd/signver/examples/1/signedForm.pl
+index 847814c..64a31ff 100755
+--- a/nss/cmd/signver/examples/1/signedForm.pl
++++ b/nss/cmd/signver/examples/1/signedForm.pl
 @@ -1,4 +1,4 @@
--#! /usr/local/bin/perl
-+#!/usr/bin/env perl
- #
- # This Source Code Form is subject to the terms of the Mozilla Public
- # License, v. 2.0. If a copy of the MPL was not distributed with this
-diff --git a/nss/coreconf/import.pl b/nss/coreconf/import.pl
-index dd2d177..428eaa5 100755
---- a/nss/coreconf/import.pl
-+++ b/nss/coreconf/import.pl
-@@ -1,4 +1,4 @@
--#! /usr/local/bin/perl
-+#!/usr/bin/env perl
- #
- # This Source Code Form is subject to the terms of the Mozilla Public
- # License, v. 2.0. If a copy of the MPL was not distributed with this
-diff --git a/nss/coreconf/jniregen.pl b/nss/coreconf/jniregen.pl
-index 2039180..5f4f69c 100755
---- a/nss/coreconf/jniregen.pl
-+++ b/nss/coreconf/jniregen.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
+-#! /usr/bin/perl
 +#!/usr/bin/env perl
- #
  # This Source Code Form is subject to the terms of the Mozilla Public
  # License, v. 2.0. If a copy of the MPL was not distributed with this
-diff --git a/nss/coreconf/outofdate.pl b/nss/coreconf/outofdate.pl
-index 33d80bb..01fc097 100755
---- a/nss/coreconf/outofdate.pl
-+++ b/nss/coreconf/outofdate.pl
+ # file, You can obtain one at http://mozilla.org/MPL/2.0/.
+diff --git a/nss/cmd/smimetools/smime b/nss/cmd/smimetools/smime
+index e67f6be..6cd85e6 100755
+--- a/nss/cmd/smimetools/smime
++++ b/nss/cmd/smimetools/smime
 @@ -1,4 +1,4 @@
 -#!/usr/local/bin/perl
 +#!/usr/bin/env perl
- #
- # This Source Code Form is subject to the terms of the Mozilla Public
- # License, v. 2.0. If a copy of the MPL was not distributed with this
-diff --git a/nss/coreconf/release.pl b/nss/coreconf/release.pl
-index 7cde19d..b5df2f6 100755
---- a/nss/coreconf/release.pl
-+++ b/nss/coreconf/release.pl
-@@ -1,4 +1,4 @@
--#! /usr/local/bin/perl
-+#!/usr/bin/env perl
- #
+ 
  # This Source Code Form is subject to the terms of the Mozilla Public
  # License, v. 2.0. If a copy of the MPL was not distributed with this
 diff --git a/nss/coreconf/version.pl b/nss/coreconf/version.pl
-index d2a4942..79359fe 100644
+index d2a4942..3ba7323 100644
 --- a/nss/coreconf/version.pl
 +++ b/nss/coreconf/version.pl
 @@ -1,4 +1,4 @@
@@ -86,7 +60,7 @@ index d2a4942..79359fe 100644
  # This Source Code Form is subject to the terms of the Mozilla Public
  # License, v. 2.0. If a copy of the MPL was not distributed with this
 diff --git a/nss/tests/clean_tbx b/nss/tests/clean_tbx
-index 4de9555..a7def9f 100755
+index 4de9555..c15a069 100755
 --- a/nss/tests/clean_tbx
 +++ b/nss/tests/clean_tbx
 @@ -1,4 +1,4 @@
@@ -95,8 +69,18 @@ index 4de9555..a7def9f 100755
  
  #######################################################################
  #
+diff --git a/nss/tests/iopr/server_scr/client.cgi b/nss/tests/iopr/server_scr/client.cgi
+index 581ad06..34ea170 100644
+--- a/nss/tests/iopr/server_scr/client.cgi
++++ b/nss/tests/iopr/server_scr/client.cgi
+@@ -1,4 +1,4 @@
+-#!/usr/bin/perl
++#!/usr/bin/env perl
+ 
+ # This Source Code Form is subject to the terms of the Mozilla Public
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
 diff --git a/nss/tests/path_uniq b/nss/tests/path_uniq
-index f29f60a..08fbffa 100755
+index f29f60a..850332a 100755
 --- a/nss/tests/path_uniq
 +++ b/nss/tests/path_uniq
 @@ -1,4 +1,4 @@
@@ -105,6 +89,3 @@ index f29f60a..08fbffa 100755
  
  ########################################################################
  #
--- 
-1.8.1.2
-
diff --git a/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch b/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
index 43c09d13e..fbfa828b2 100644
--- a/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
+++ b/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
@@ -1,4 +1,7 @@
-Fix nss multilib build on openSUSE 11.x 32bit
+From 2701905e689cf7c1ee7ca2d116f20b5bbc146431 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Sat, 7 Mar 2020 08:34:02 -0800
+Subject: [PATCH] Fix nss multilib build on openSUSE 11.x 32bit
 
 While building lib64-nss on openSUSE 11.x 32bit, the nsinstall will
 fail with error:
@@ -16,10 +19,15 @@ Upstream-Status: Pending
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 ===================================================
-Index: nss-3.24/nss/coreconf/nsinstall/Makefile
-===================================================================
---- nss-3.24.orig/nss/coreconf/nsinstall/Makefile
-+++ nss-3.24/nss/coreconf/nsinstall/Makefile
+
+---
+ nss/coreconf/nsinstall/Makefile | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/nss/coreconf/nsinstall/Makefile b/nss/coreconf/nsinstall/Makefile
+index 08dfbc2..e97fb5f 100644
+--- a/nss/coreconf/nsinstall/Makefile
++++ b/nss/coreconf/nsinstall/Makefile
 @@ -18,6 +18,13 @@ INTERNAL_TOOLS  = 1
  
  include $(DEPTH)/coreconf/config.mk
@@ -33,4 +41,4 @@ Index: nss-3.24/nss/coreconf/nsinstall/Makefile
 +
  ifeq (,$(filter-out OS2 WIN%,$(OS_TARGET)))
  PROGRAM		=
- else
+ TARGETS		=
diff --git a/meta-oe/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch b/meta-oe/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch
index 7661dc93a..7dbc1a372 100644
--- a/meta-oe/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch
+++ b/meta-oe/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch
@@ -1,12 +1,17 @@
-nss:no rpath for cross compiling
+From dc51214895bcd63fc8eb8d1fe7941cd3e5500620 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 7 Mar 2020 08:34:02 -0800
+Subject: [PATCH] nss:no rpath for cross compiling
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Upstream-Status: Inappropriate [configuration]
+
 ---
  nss/cmd/platlibs.mk | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/nss/cmd/platlibs.mk b/nss/cmd/platlibs.mk
+index 6401778..e5c4e16 100644
 --- a/nss/cmd/platlibs.mk
 +++ b/nss/cmd/platlibs.mk
 @@ -18,9 +18,9 @@ endif
@@ -21,6 +26,3 @@ diff --git a/nss/cmd/platlibs.mk b/nss/cmd/platlibs.mk
  endif
  endif
  
--- 
-1.8.1.2
-
diff --git a/meta-oe/recipes-support/nss/nss/pqg.c-ULL_addend.patch b/meta-oe/recipes-support/nss/nss/pqg.c-ULL_addend.patch
index 3a817faaa..5505ae36a 100644
--- a/meta-oe/recipes-support/nss/nss/pqg.c-ULL_addend.patch
+++ b/meta-oe/recipes-support/nss/nss/pqg.c-ULL_addend.patch
@@ -1,4 +1,8 @@
-nss does not build on mips with clang because wrong types are used?
+From a550bdf458f11dff46ebddbac94cf48c27d3471e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 7 Mar 2020 08:34:02 -0800
+Subject: [PATCH] nss does not build on mips with clang because wrong types are
+ used?
 
 pqg.c:339:16: error: comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
      if (addend < MP_DIGIT_MAX) {
@@ -6,11 +10,16 @@ pqg.c:339:16: error: comparison of constant 18446744073709551615 with expression
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
-Index: nss-3.37.1/nss/lib/freebl/pqg.c
-===================================================================
---- nss-3.37.1.orig/nss/lib/freebl/pqg.c
-+++ nss-3.37.1/nss/lib/freebl/pqg.c
-@@ -326,8 +326,8 @@ generate_h_candidate(SECItem *hit, mp_in
+
+---
+ nss/lib/freebl/pqg.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/nss/lib/freebl/pqg.c b/nss/lib/freebl/pqg.c
+index 626b2fb..052ad36 100644
+--- a/nss/lib/freebl/pqg.c
++++ b/nss/lib/freebl/pqg.c
+@@ -326,8 +326,8 @@ generate_h_candidate(SECItem *hit, mp_int *H)
  
  static SECStatus
  addToSeed(const SECItem *seed,
diff --git a/meta-oe/recipes-support/nss/nss/riscv.patch b/meta-oe/recipes-support/nss/nss/riscv.patch
deleted file mode 100644
index aef91a7c3..000000000
--- a/meta-oe/recipes-support/nss/nss/riscv.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Enable uint128 on riscv64
-
-Fixes
-| verified/kremlin/kremlib/dist/minimal/LowStar_Endianness.h:29:37: error: 'load128_be' declared 'static' but never defined [-Werror=unused-function]
-|    29 | inline static FStar_UInt128_uint128 load128_be(uint8_t *x0);
-|       |                                     ^~~~~~~~~~
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/nss/lib/freebl/verified/kremlin/include/kremlin/internal/types.h
-+++ b/nss/lib/freebl/verified/kremlin/include/kremlin/internal/types.h
-@@ -56,7 +56,8 @@ typedef const char *Prims_string;
- #include <emmintrin.h>
- typedef __m128i FStar_UInt128_uint128;
- #elif !defined(KRML_VERIFIED_UINT128) && !defined(_MSC_VER) && \
--    (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__))
-+    (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__) || \
-+     (defined(__riscv) && __riscv_xlen == 64))
- typedef unsigned __int128 FStar_UInt128_uint128;
- #else
- typedef struct FStar_UInt128_uint128_s {
---- a/nss/lib/freebl/verified/kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h
-+++ b/nss/lib/freebl/verified/kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h
-@@ -23,9 +23,10 @@
- #include "FStar_UInt128.h"
- #include "FStar_UInt_8_16_32_64.h"
- #include "LowStar_Endianness.h"
--
-+#include <stdint.h>
- #if !defined(KRML_VERIFIED_UINT128) && !defined(_MSC_VER) && \
--    (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__))
-+    (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__) || \
-+     (defined(__riscv) && __riscv_xlen == 64))
- 
- /* GCC + using native unsigned __int128 support */
- 
diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.54.bb
similarity index 97%
rename from meta-oe/recipes-support/nss/nss_3.51.1.bb
rename to meta-oe/recipes-support/nss/nss_3.54.bb
index 36e6cd8fc..4923f6868 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.54.bb
@@ -32,12 +32,9 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://system-pkcs11.txt \
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
-           file://riscv.patch \
-           file://0001-Enable-uint128-on-mips64.patch \
            "
 
-SRC_URI[md5sum] = "6acaf1ddff69306ae30a908881c6f233"
-SRC_URI[sha256sum] = "085c5eaceef040eddea639e2e068e70f0e368f840327a678ef74ae3d6c15ca78"
+SRC_URI[sha256sum] = "dab18bbfcf5e347934cda664df75ce9fd912a5772686c40d3c805e53c08d6e43"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
@@ -127,7 +124,8 @@ do_compile() {
     export CC="${CC} ${CFLAGS}"
     make -C ./nss CCC="${CXX} -g" \
         OS_TEST=${OS_TEST} \
-        RPATH="${RPATH}"
+        RPATH="${RPATH}" \
+        autobuild
 }
 
 do_compile[vardepsexclude] += "SITEINFO_BITS"
-- 
2.17.1

