Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 104EB79724
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:40 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id s17-v6so5288269plp.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9XyNxhc3JyIbg6Ro2SOi27MWBnbJg48MXVjEiS0IX60=;
	b=lFgFTq9TuLb5r14BbnpAIFFhAkoX4HlrOcxLfdq824r0xx78XsJDMgyRCOPIjk/RLU
	sGipf+E5Oc8MIoj/jWIiHX7s8A8WTQdISuDAzYAQOXveG+htyYFKYoqpcvNtP7dIf906
	gd37IhPc+wsVPFLbSF5NB2/R9A3tXZaSjQBLw6of+4LXN5pAYiWok9PCl2/xpEfVZgLg
	9OVxgr2/j8808cZFDUZV6ZJ8WoaN88JzN3anQf/mN2AUjScFhW4YikT+7GszaqDwLIVx
	9pmCl8ULSuK4R7j74HZ2sA4zqwzqgUQiqTuiNK3ZvmCbpJ97mxq10nxq73KX3Iqp5lgf
	EY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9XyNxhc3JyIbg6Ro2SOi27MWBnbJg48MXVjEiS0IX60=;
	b=IDnCuuI/DwixDgTKdMYvzVGMdXiocjrIqbWJ7JYXFSPcW0l0xdnb+rPw89XzB5ckbe
	WTzDZ4dCPdSnplV2+qgm1ym68we6Hem0qskhKBXTgn+xFqNfGQrZ9fzN9gIMKoCggwHn
	Sq7W2DyeLYi0BwAEUHGghGM1mxLPKwTcju9SjbCLoC2pl0O8GYildcRQwtu+xy4r7AAH
	qXFEWaN8lgzKOnITMNfQzMpWNaQQwDVBvaa61uM/bywG74Giiqxh4fuGHtr9JeAkC0H7
	vPWNbAKuEFFePc05Y4ROGJRjuX4EUDQqxiYDethTx2SM4vUVet3q4MUqkjBgvUnpCGFb
	KJiA==
X-Gm-Message-State: APzg51C1dToi9tYsILgi8W5OCc3s/hXZAIACv9DbnoCsDNdiq1wMytbe
	igqFS5vaXMVWIl32qun4O/WkQCRc
X-Google-Smtp-Source: ANB0VdbD401QNdumMARBHTH2XoRk1+PVgsSMMdfxOw0QHrM1EvgUjGQdCk+vGzkZitCIw2nk80NFPQ==
X-Received: by 2002:a17:902:654b:: with SMTP id
	d11-v6mr3804851pln.8.1536254561021; 
	Thu, 06 Sep 2018 10:22:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:22:10 -0700
Message-Id: <20180906172210.42551-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906172210.42551-1-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
Subject: [meta-python][PATCH 17/17] python-m2crypto: Ignore WCHAR_MAX and WCHAR_MIN when on musl
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
X-List-Received-Date: Thu, 06 Sep 2018 17:22:40 -0000

This fixes the build until we upgrade to swig 4.0 where this is fixed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python-m2crypto.inc  |  9 +++------
 .../m2crypto-0.26.4-gcc_macros.patch             | 16 ++++++++++++----
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/meta-python/recipes-devtools/python/python-m2crypto.inc
index da714874af..a36ab8a7fa 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto.inc
+++ b/meta-python/recipes-devtools/python/python-m2crypto.inc
@@ -19,10 +19,11 @@ inherit pypi siteinfo
 DEPENDS += "openssl swig-native"
 RDEPENDS_${PN} += "python-typing"
 
-DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_DIR_HOST} -I${STAGING_INCDIR}"
-DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}"
+DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGING_INCDIR}"
+DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR}"
 
 SWIG_FEATURES_x86 = "-D__i386__"
+SWIG_FEATURES_x32 = "-D__ILP32__"
 SWIG_FEATURES ?= "-D__${HOST_ARCH}__"
 export SWIG_FEATURES
 
@@ -51,7 +52,3 @@ do_configure_prepend() {
 }
 
 BBCLASSEXTEND = "native"
-
-# http://errors.yoctoproject.org/Errors/Details/184714/
-# SWIG/_m2crypto.i:10: Error: Unable to find 'gcc_macros.h'
-CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch b/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
index 931c25c8ee..7f6dd29f8a 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
+++ b/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
@@ -4,16 +4,19 @@ Index: M2Crypto-0.30.1/SWIG/_m2crypto.i
 ===================================================================
 --- M2Crypto-0.30.1.orig/SWIG/_m2crypto.i
 +++ M2Crypto-0.30.1/SWIG/_m2crypto.i
-@@ -7,7 +7,7 @@
-  * Copyright (c) 2009-2010 Heikki Toivonen. All rights reserved.
+@@ -8,6 +8,11 @@
   *
   */
--
+ 
 +%import "gcc_macros.h"
++
++%ignore WCHAR_MAX;
++%ignore WCHAR_MIN;
++
  %module(threads=1) m2crypto
  /* We really don't need threadblock (PyGILState_Ensure() etc.) anywhere.
     Disable threadallow as well, only enable it for operations likely to
-@@ -15,11 +15,6 @@
+@@ -15,11 +20,6 @@
  %nothreadblock;
  %nothreadallow;
  
@@ -25,3 +28,8 @@ Index: M2Crypto-0.30.1/SWIG/_m2crypto.i
  %{
  #ifdef _WIN32
  #define _WINSOCKAPI_
+@@ -95,4 +95,3 @@ static PyObject *x509_store_verify_cb_fu
+ %constant int encrypt = 1;
+ %constant int decrypt = 0;
+ #endif
+-  
-- 
2.18.0


