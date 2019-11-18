Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 37C627F699
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:04:06 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id o9so9046787plk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 21:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ltBcumpUpeYJ1Q/XNbw9nG4/NXHrlEDVuqN5OrH0z58=;
	b=Mozy1JvyolXRp1xL9jG9kbyS2uSbAbjSvrHbbxj0otQ4EOW7tDRqZmZx1RZMTNrWH0
	k3+kiHfUQQKP/4Whc4KO7O8bCMfq4sPk3yARG9+QMmPWtzknoZ4pxhdHTkQxWitHLG8N
	vaa7ZBr/YpliO+g+T6mnzGa+gBuL7RXvYwYC9Qfg4z3TBuA8LD1G6TI8oU7+YZszxxUn
	c4olSR2Pb16pnfFqL0Ng2u1HUQQ741TdQkFIv5aXdqdD0Y6HGKkmIiAWjkwAsQOc/0wF
	pe++wZ2wJHxXzacN6u83BW7rzMbz1GlHCyKcmhN/ZOtu6zWpC/K6KSSiDZIhPIYV3lw9
	6aFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ltBcumpUpeYJ1Q/XNbw9nG4/NXHrlEDVuqN5OrH0z58=;
	b=NVOqUyzQDWGSonpeEd5pV1ryl4vuir7PsCPRSmPODQz1e+nBqiHq0tDaeeonuGmFnc
	lb4yGgWjiGT7kkQpuj52KazeB+Ztxuhb4+WFO7hhH2651+iD7zO2q1FKzIQu5AVaUJ/l
	XAPXeCNc/QGKi6lu9AZ62aVir2SL8Gzh09PwmgxFI1IZvflU+d/acNHa6FXNM9664rv6
	ajb+t4Mzptt7ZFE4SLM2Y/GcJBmGIzoWXTLzMrTUQl1euXBTQF/BTC4pPkmgN+sq38lg
	B2n0EbXuKZKLVtOv5bO0xc3971qs7Lp9cNfAMGdzRPQXJ5splpoZI2bMu9nSRF+wMcPN
	jx5Q==
X-Gm-Message-State: APjAAAVeRhOxBpxDSY6gpQx7JvNRU5fGbA+eNrk+P+i6tencyOeZDj77
	CtBBIwYpcHOdsfaV4uoIuGSUfUMkS7g=
X-Google-Smtp-Source: APXvYqweP5LqXd4EO75lDRyufvinsLvs51/k5udXQg3jUTCG9ZNIK8LpwykNMPHgWvt4rdVei8FEAQ==
X-Received: by 2002:a17:90a:3264:: with SMTP id
	k91mr36435909pjb.23.1574053446425; 
	Sun, 17 Nov 2019 21:04:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	y6sm16881131pfm.12.2019.11.17.21.04.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 17 Nov 2019 21:04:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Nov 2019 21:03:48 -0800
Message-Id: <20191118050352.1379153-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/5] libmad: Define O2 for all arches as default optimization
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
X-List-Received-Date: Mon, 18 Nov 2019 05:04:06 -0000
Content-Transfer-Encoding: 8bit

Extend mips inline asm fix to build on clang

../libmad-0.15.1b/layer12.c:94:10: error: invalid output constraint '=h' in asm
  return mad_f_mul(sample, linear_table[nb - 2]);
         ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ove-clang-unsupported-compiler-flags.patch | 92 +++++++++++++------
 .../libmad/fix_for_mips_with_gcc-4.5.0.patch  |  8 +-
 2 files changed, 69 insertions(+), 31 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libmad/libmad/0004-Remove-clang-unsupported-compiler-flags.patch b/meta-oe/recipes-multimedia/libmad/libmad/0004-Remove-clang-unsupported-compiler-flags.patch
index 5bfce4d908..70723f2d08 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad/0004-Remove-clang-unsupported-compiler-flags.patch
+++ b/meta-oe/recipes-multimedia/libmad/libmad/0004-Remove-clang-unsupported-compiler-flags.patch
@@ -7,37 +7,77 @@ Subject: [PATCH 4/4] Remove clang unsupported compiler flags
  configure.ac | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 4fcd48b..40302db 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -140,20 +140,20 @@ then
-     case "$optimize" in
- 	-O|"-O "*)
- 	    optimize="-O"
+@@ -124,70 +124,7 @@ done
+ 
+ if test "$GCC" = yes
+ then
+-    if test -z "$arch"
+-    then
+-	case "$host" in
+-	    i386-*)           ;;
+-	    i?86-*)           arch="-march=i486" ;;
+-	    arm*-empeg-*)     arch="-march=armv4 -mtune=strongarm1100" ;;
+-	    armv4*-*)         arch="-march=armv4 -mtune=strongarm" ;;
+-	    powerpc-*)        ;;
+-	    mips*-agenda-*)   arch="-mcpu=vr4100" ;;
+-	    mips*-luxsonor-*) arch="-mips1 -mcpu=r3000 -Wa,-m4010" ;;
+-	esac
+-    fi
+-
+-    case "$optimize" in
+-	-O|"-O "*)
+-	    optimize="-O"
 -	    optimize="$optimize -fforce-addr"
-+	    : #optimize="$optimize -fforce-addr"
- 	    : #x optimize="$optimize -finline-functions"
- 	    : #- optimize="$optimize -fstrength-reduce"
+-	    : #x optimize="$optimize -finline-functions"
+-	    : #- optimize="$optimize -fstrength-reduce"
 -	    optimize="$optimize -fthread-jumps"
 -	    optimize="$optimize -fcse-follow-jumps"
 -	    optimize="$optimize -fcse-skip-blocks"
-+	    : #optimize="$optimize -fthread-jumps"
-+	    : #optimize="$optimize -fcse-follow-jumps"
-+	    : #optimize="$optimize -fcse-skip-blocks"
- 	    : #x optimize="$optimize -frerun-cse-after-loop"
- 	    : #x optimize="$optimize -frerun-loop-opt"
- 	    : #x optimize="$optimize -fgcse"
- 	    optimize="$optimize -fexpensive-optimizations"
+-	    : #x optimize="$optimize -frerun-cse-after-loop"
+-	    : #x optimize="$optimize -frerun-loop-opt"
+-	    : #x optimize="$optimize -fgcse"
+-	    optimize="$optimize -fexpensive-optimizations"
 -	    optimize="$optimize -fregmove"
-+	    : #optimize="$optimize -fregmove"
- 	    : #* optimize="$optimize -fdelayed-branch"
- 	    : #x optimize="$optimize -fschedule-insns"
+-	    : #* optimize="$optimize -fdelayed-branch"
+-	    : #x optimize="$optimize -fschedule-insns"
 -	    optimize="$optimize -fschedule-insns2"
-+	    : #optimize="$optimize -fschedule-insns2"
- 	    : #? optimize="$optimize -ffunction-sections"
- 	    : #? optimize="$optimize -fcaller-saves"
- 	    : #> optimize="$optimize -funroll-loops"
--- 
-2.1.0
-
+-	    : #? optimize="$optimize -ffunction-sections"
+-	    : #? optimize="$optimize -fcaller-saves"
+-	    : #> optimize="$optimize -funroll-loops"
+-	    : #> optimize="$optimize -funroll-all-loops"
+-	    : #x optimize="$optimize -fmove-all-movables"
+-	    : #x optimize="$optimize -freduce-all-givs"
+-	    : #? optimize="$optimize -fstrict-aliasing"
+-	    : #* optimize="$optimize -fstructure-noalias"
+-
+-	    case "$host" in
+-		arm*-*)
+-		    optimize="$optimize -fstrength-reduce"
+-		    ;;
+-		mips*-*)
+-		    optimize="$optimize -fstrength-reduce"
+-		    optimize="$optimize -finline-functions"
+-		    ;;
+-		i?86-*)
+-		    optimize="$optimize -fstrength-reduce"
+-		    ;;
+-		powerpc-apple-*)
+-		    # this triggers an internal compiler error with gcc2
+-		    : #optimize="$optimize -fstrength-reduce"
+-
+-		    # this is really only beneficial with gcc3
+-		    : #optimize="$optimize -finline-functions"
+-		    ;;
+-		*)
+-		    # this sometimes provokes bugs in gcc 2.95.2
+-		    : #optimize="$optimize -fstrength-reduce"
+-		    ;;
+-	    esac
+-	    ;;
+-    esac
++	optimize="-O2"
+ fi
+ 
+ case "$host" in
diff --git a/meta-oe/recipes-multimedia/libmad/libmad/fix_for_mips_with_gcc-4.5.0.patch b/meta-oe/recipes-multimedia/libmad/libmad/fix_for_mips_with_gcc-4.5.0.patch
index 01c7aa3c8c..5bc91f355d 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad/fix_for_mips_with_gcc-4.5.0.patch
+++ b/meta-oe/recipes-multimedia/libmad/libmad/fix_for_mips_with_gcc-4.5.0.patch
@@ -11,15 +11,13 @@ Upstream-Status: Pending
 2010/07/29
 Nitin A Kamble <nitin.a.kamble@intel.com>
 
-Index: libmad-0.15.1b/fixed.h
-===================================================================
---- libmad-0.15.1b.orig/fixed.h
-+++ libmad-0.15.1b/fixed.h
+--- a/fixed.h
++++ b/fixed.h
 @@ -297,6 +297,15 @@ mad_fixed_t mad_f_mul_inline(mad_fixed_t
  
  /* --- MIPS ---------------------------------------------------------------- */
  
-+# elif defined(FPM_MIPS) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4))
++# elif defined(FPM_MIPS) && (defined(__clang__) || __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4))
 +    typedef unsigned int u64_di_t __attribute__ ((mode (DI)));
 +#   define MAD_F_MLX(hi, lo, x, y) \
 +    do { \
-- 
2.24.0


