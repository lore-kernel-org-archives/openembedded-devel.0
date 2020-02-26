Return-Path: <leo.yan@linaro.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 737F160640
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 12:26:38 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z3so2782746wru.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 04:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=fK+2rgd900TEbqvpWXLZFnYDztG22/4KHYT7rEDjOPk=;
	b=GA8gLq2A6F/Xu6WRWKmdbbiGalyrmui2lA45GT5iG1CH1itVl0WZrE9ZWI+ruZw9Sb
	IGdJUu/0K8CDZNUSZuowZf0TEmatVFCiPSH4g5PYTEg74DQ+1ja4E69kFppN2rXJovQj
	bTKkRQ9+ZXhAf1uFmFOOXZQ6R+HEeulI5HUGLFhjJ+DsT3FmhwNHh0/ANpWoQbMHKahc
	ESelY1k/eI3W6wFMU/3/a8pZTHmt+/AG1Sqwgh5lRyKWVtQRf5suLV/fE2qnPhCBPSlu
	OwGv2vWibrGy3Gn9UMzjFGPiGbcTRSLuUEUYvn6onyLL8T0BMqnSgM8ehwcOUFwWAE9t
	F5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fK+2rgd900TEbqvpWXLZFnYDztG22/4KHYT7rEDjOPk=;
	b=AihclxLXh4vmh718Utg2wCnXYdLYnou3nj0OfAlMlRBoI+X26pJzk8zEu4/uoAp8R2
	ZfJ8MJ5VJfWzI7nLNyNG5z/EaLfUhaPoOhWk/iFjR2PrqNzi6naRG5ShTzkUyVQhMS6d
	bL3GB2yqRbm8hxB/zhsP7diSqfWktN8CV/gckMB2Rz8EfNEEDeqwdl/Go47u6Dgljs9D
	4gh2mPB56eLwCg1Vjcyj3XhV+iV+DRRCyQuykauZ2ZHFOYJVVm21y+ROGiZe3GU7Ggoe
	gmHxxzUbcSi9DU/AQKoVsozILLbC8DYZ5Hzx0YpVAZfoUw1feLsLdcnNQSaOAGt39CZ+
	VvOw==
X-Gm-Message-State: APjAAAX/O9NsIsdZwYlCf5u7MnRKk9mlhAmpFeIrMlIzmCpYCTIsFOix
	zmp+LMsc0qBfDiS63aacu4LRqGAZ+/s=
X-Google-Smtp-Source: APXvYqwCjdBe0l64l4QKCDK3ZAcHtHE0tNqrVv93syYVIdDwjlYnZP1gtjlVKfid0KGSl5sJt+sJSA==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr5555568wru.398.1582719998561; 
	Wed, 26 Feb 2020 04:26:38 -0800 (PST)
Received: from hackbox2.linaro.org ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	a26sm2747958wmm.18.2020.02.26.04.26.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 26 Feb 2020 04:26:37 -0800 (PST)
From: Leo Yan <leo.yan@linaro.org>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>, Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>
Date: Wed, 26 Feb 2020 12:26:22 +0000
Message-Id: <20200226122622.33171-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v4] luajit: Upgrade to 2.1.0-beta3
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
X-List-Received-Date: Wed, 26 Feb 2020 12:26:38 -0000

Since luajit 2.1.0-beta3 can support architecture aarch64 and the old
misses to support aarch64, the patch upgrades to luajit 2.1.0-beta3.

Also updated clang.patch to dismiss patch warning: "Hunk #1 succeeded
at 436 with fuzz 1 (offset 123 lines)."

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 meta-oe/recipes-devtools/luajit/luajit/clang.patch  |  4 ++--
 .../luajit/{luajit_2.0.5.bb => luajit_git.bb}       | 13 ++++++-------
 2 files changed, 8 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-devtools/luajit/{luajit_2.0.5.bb => luajit_git.bb} (90%)

diff --git a/meta-oe/recipes-devtools/luajit/luajit/clang.patch b/meta-oe/recipes-devtools/luajit/luajit/clang.patch
index c39ef6fd4..807cc4417 100644
--- a/meta-oe/recipes-devtools/luajit/luajit/clang.patch
+++ b/meta-oe/recipes-devtools/luajit/luajit/clang.patch
@@ -8,8 +8,8 @@ Index: LuaJIT-2.0.5/src/lj_arch.h
 ===================================================================
 --- LuaJIT-2.0.5.orig/src/lj_arch.h
 +++ LuaJIT-2.0.5/src/lj_arch.h
-@@ -313,7 +313,7 @@
- #error "Need at least GCC 4.2 or newer"
+@@ -436,7 +436,7 @@
+ #endif
  #endif
  #elif !LJ_TARGET_PS3
 -#if (__GNUC__ < 4) || ((__GNUC__ == 4) && __GNUC_MINOR__ < 3)
diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
similarity index 90%
rename from meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
rename to meta-oe/recipes-devtools/luajit/luajit_git.bb
index 93128dda8..2a7243842 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Just-In-Time Compiler for Lua"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=10a96c93403affcc34765f4c2612bc22"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d739bb9250a55c124a545b588fd76771"
 HOMEPAGE = "http://luajit.org"
 
-PV .= "+git${SRCPV}"
-SRCREV = "02b521981a1ab919ff2cd4d9bcaee80baf77dce2"
-SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http \
+PV = "2.0.5+2.1.0-beta3"
+SRCREV = "0ad60ccbc3768fa8e3e726858adf261950edbc22"
+SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
            file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
            file://clang.patch \
-"
+           "
 
 S = "${WORKDIR}/git"
 
@@ -90,8 +90,7 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
 "
 FILES_luajit-common = "${datadir}/${BPN}-${PV}"
 
-# Aarch64/mips64/ppc/ppc64/riscv64 is not supported in this release
-COMPATIBLE_HOST_aarch64 = "null"
+# mips64/ppc/ppc64/riscv64 is not supported in this release
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 COMPATIBLE_HOST_powerpc = "null"
-- 
2.17.1


