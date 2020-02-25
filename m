Return-Path: <leo.yan@linaro.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 45B2F61302
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 06:37:19 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id u6so13288628wrt.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 22:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=4PFnoWr+f/5qCDhynVgzM4CvGE9wezdBUMmfvYN3V2A=;
	b=SZrWpfpxmFvwWhGb3bjWPca29yDxtwqQPAGS0oN8jqouQdc0wegZzhWpF0mQi2usi7
	1bG+1AqJPsgeVwTaV/74lO9mIQo5gVMvLkDp4mDwD/rqAlRV00dqOt4nVuDe0qhtdBCy
	pzQZLbQRUwuypU3BhvjZmF2Fd6dnKqxZUOB9qZKA1i+4uOe3hwAfMLNiNgf5raVhyni/
	csVQ60fC6W5wB0QQXeGiod/NSMG5gwUV6P1HIdfjx3y19IPyqd92NoI2dVqZbNLT5n/j
	as7NFCCtaWc6PLTjZtgsHgh12NbBtuB935LSAV18b2sR+PTxyfAUy6rXM97yJj3CNCNc
	dFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4PFnoWr+f/5qCDhynVgzM4CvGE9wezdBUMmfvYN3V2A=;
	b=cZ+sQFKq5bke8uFKMnsZ5m4mTPc7tEGsESkiqQlcuIZ4NntQCyiapYSKYPr5U6TecJ
	EVUz7ozO+Fasb9+an8rqWLRJDBn7s4HHGFj/Q0sv57742mfMVMWJFFHjT9x2NTxLIOwJ
	w2hfdvtD8IJneUwuVaJWd7UZ/NDWWp4yriE3XTHrvwg17ISEU+PfwZI7vUp1VD4VFu24
	pSPKn0oglh/g6aDg8P1KPdxlxCWOZEICLf3qEEiH/mQnYUa8bAqUOzeC5SrTHHMZ16iQ
	2oOZQ+9uN7RZ7ejS5GnYn0S2UMeElgngTLNtemFB3BdgyJC2m8BHzf2PaNx6gZerJ0BH
	MKYA==
X-Gm-Message-State: APjAAAUA9wZQ1E/v7Sth45Kh8/+8budXmZhn9tFl6P5G8mFnNdFwWg1t
	kUBmCL8fXCaB8bTOfHGne8sBbb/9ZHs=
X-Google-Smtp-Source: APXvYqyT+hqhLY8/v5BupLrSn/yCG2gxDSxWNTJJAULPrFd+nuQo2g+F/OQ6NjJSTtFyo2rS1KAYiA==
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr47047127wrm.302.1582612639312;
	Mon, 24 Feb 2020 22:37:19 -0800 (PST)
Received: from hackbox2.linaro.org ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	x21sm2592325wmi.30.2020.02.24.22.37.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 22:37:18 -0800 (PST)
From: Leo Yan <leo.yan@linaro.org>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>, Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>
Date: Tue, 25 Feb 2020 06:37:11 +0000
Message-Id: <20200225063711.4848-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v3] luajit: Upgrade to 2.1.0-beta3
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
X-List-Received-Date: Tue, 25 Feb 2020 06:37:19 -0000

Since luajit 2.1.0-beta3 can support architecture aarch64 and the old
misses to support aarch64, the patch upgrades to luajit 2.1.0-beta3.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../luajit/luajit/clang.patch                 | 19 -------------------
 .../luajit/{luajit_2.0.5.bb => luajit_git.bb} | 14 ++++++--------
 2 files changed, 6 insertions(+), 27 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/luajit/luajit/clang.patch
 rename meta-oe/recipes-devtools/luajit/{luajit_2.0.5.bb => luajit_git.bb} (89%)

diff --git a/meta-oe/recipes-devtools/luajit/luajit/clang.patch b/meta-oe/recipes-devtools/luajit/luajit/clang.patch
deleted file mode 100644
index c39ef6fd4..000000000
--- a/meta-oe/recipes-devtools/luajit/luajit/clang.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-clang pretends to be gcc 4.2.0 which is a big lie when it comes
-to features, its same as latest gcc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: LuaJIT-2.0.5/src/lj_arch.h
-===================================================================
---- LuaJIT-2.0.5.orig/src/lj_arch.h
-+++ LuaJIT-2.0.5/src/lj_arch.h
-@@ -313,7 +313,7 @@
- #error "Need at least GCC 4.2 or newer"
- #endif
- #elif !LJ_TARGET_PS3
--#if (__GNUC__ < 4) || ((__GNUC__ == 4) && __GNUC_MINOR__ < 3)
-+#if (__GNUC__ < 4) || ((__GNUC__ == 4) && __GNUC_MINOR__ < 3) && !defined(__clang__)
- #error "Need at least GCC 4.3 or newer"
- #endif
- #endif
diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
similarity index 89%
rename from meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
rename to meta-oe/recipes-devtools/luajit/luajit_git.bb
index 93128dda8..da798328e 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -1,14 +1,13 @@
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
-           file://clang.patch \
-"
+           "
 
 S = "${WORKDIR}/git"
 
@@ -90,8 +89,7 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
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


