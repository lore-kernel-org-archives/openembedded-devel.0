Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08A3C7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 17:48:21 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.2821.1750441694582708150
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 10:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LaVHxJaw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so12671435e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 10:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750441692; x=1751046492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rv4oYGpZ4AAnkDGhzsHQEtAwSX8TjSo3TUrkDOw3kgU=;
        b=LaVHxJawx7atACLoUVNlE9gaBBdDySQuUyxZHZvZiwPQjEDgp5RUc6ek1QQay+Zjpi
         QHiCc3NLlgEdJYh3UE0qk+Sk3jwkwe0ySMs4rUKPFOihZTTPP0P3dO+uLS1cnRCePjht
         z1zuVsaRPYX4p21z2jXInXGT5klFRyhBiqFR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750441692; x=1751046492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rv4oYGpZ4AAnkDGhzsHQEtAwSX8TjSo3TUrkDOw3kgU=;
        b=jRe/t3roQTKGO0aYsSq/q6tnDXgQ0EVDSZSskpsy56tfSx8/kJwwmvMkvYlxRD2p6m
         MOoLkqn19E6iokK42hE4ss2oKD36ResPGczf6944mcrggEzqATFRH2rFNcyQ05zWN2Ul
         DUxuEK8Oyt8EkCngyccBRZ9FxbsjlcD/iN+DcQrAadBqhxT1z01YZu0CwhEWPs0FvGPE
         rzQaeVD3kFKIUs4wy7eDZjL4RLUhiBa0ZrKSqiER8JcGik0HL7PEDiceK/+5GHGS8fP5
         pfmeN1Mp8OheVMuRbp54hzVZNAe+RP60gJrJHJEF8ftmYtTRV2zwLXd5JYt2huw+2V9t
         sP9w==
X-Gm-Message-State: AOJu0YxZnpqWesXkOD0W/VaV/eMThzLgOmL1oDO053V4NaHvzNyZuk3c
	B89np+VlQT48IjZuoTWjNru6H36cQVNNfeCj/p7iLJWG0RTvBvceXcGvEOrXa9/8FIiZPfgbYU3
	1y7C/DtM=
X-Gm-Gg: ASbGncvUAYWNjRoWGZ5R5WmuKUk3ZTH6ft9ztBo1ZcShv0xDtXx5M0v+NDHrsCF4Vd2
	Yb/ts2tb+xi0gCt9yE5/pcN0QwoxL0x5EumvdcgVewvjg9utFQXpbTYpZRa+1FYM8PmOSR/G4la
	R2dg9QgxfhGDjZu1YFP8b00ObzhoZd5QBYGEniSsTAYNvLqvBKeUBZ0R3MC/D55eXaRkKX0e7Ma
	0KLBQQwlKDrCy+ztV7yPI/kXV+5mRsAndoUpum+BWBcacRwVh2BdqIq41cpn9Hmt8E6qSHOCNk+
	o0d8csOvxGa8HAa1qDTFKSkEP2LeIoCRtbV+h5Y0dR/bzhBlvrhFSfh/+LS2QTk1U4GLTHeCfRg
	B6F1dsA==
X-Google-Smtp-Source: AGHT+IHc/9HfRGJQ4ur7P6h2SmRcnrVYFSrNgkzuLkRCflAjMJ/K66SJAOHivrQooeW5wySb7IczbQ==
X-Received: by 2002:a05:600c:4754:b0:453:23fe:ca86 with SMTP id 5b1f17b1804b1-453659be4d6mr35312835e9.4.1750441692028;
        Fri, 20 Jun 2025 10:48:12 -0700 (PDT)
Received: from max.broadband ([84.69.248.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d1508sm31863715e9.12.2025.06.20.10.48.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 10:48:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [PATCH v2] suitesparse: Update after toolchain selection changes
Date: Fri, 20 Jun 2025 18:48:09 +0100
Message-ID: <20250620174809.2544647-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 17:48:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117984

The toolchain selection changes mean CC is not set until after the recipe
is parsed, breaking the manipulations made by this recipe.

Replace it with code to inherit the cmake class, which correctly
configures cmake to use the right compiler/compiler flags.

We need to patch the makefiles to avoid those options being added
incorrectly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../suitesparse/makefile-quoting.patch        | 32 +++++++++++++++++++
 .../suitesparse/suitesparse_5.10.1.bb         | 17 +++-------
 2 files changed, 37 insertions(+), 12 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/makefile-quoting.patch

diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/makefile-quoting.patch b/meta-oe/recipes-devtools/suitesparse/suitesparse/makefile-quoting.patch
new file mode 100644
index 0000000000..6bd2ffbb55
--- /dev/null
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse/makefile-quoting.patch
@@ -0,0 +1,32 @@
+OE's CC and CXX contain spaces and extra options which is incompatible with 
+cmake way of handling them. Remove passing the compiler options this way in
+favour of our normal cmake toolchain files added elsewhere.
+
+Upstream-Status: Pending
+
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
+@@ -282,7 +282,7 @@ metis: include/metis.h
+ # hardcoded below.
+ include/metis.h:
+ ifeq (,$(MY_METIS_LIB))
+-	- ( cd metis-5.1.0 && $(MAKE) config shared=1 prefix=$(SUITESPARSE) cc=$(CC) )
++	- ( cd metis-5.1.0 && $(MAKE) config shared=1 prefix=$(SUITESPARSE) )
+ 	- ( cd metis-5.1.0 && $(MAKE) )
+ 	- ( cd metis-5.1.0 && $(MAKE) install )
+ 	- $(SO_INSTALL_NAME) $(SUITESPARSE)/lib/libmetis.dylib \
+Index: git/SuiteSparse_config/SuiteSparse_config.mk
+===================================================================
+--- git.orig/SuiteSparse_config/SuiteSparse_config.mk
++++ git/SuiteSparse_config/SuiteSparse_config.mk
+@@ -146,7 +146,7 @@ SUITESPARSE_VERSION = 5.10.1
+         endif
+     endif
+ 
+-    CMAKE_OPTIONS += -DCMAKE_CXX_COMPILER=$(CXX) -DCMAKE_C_COMPILER=$(CC)
++    #CMAKE_OPTIONS += -DCMAKE_CXX_COMPILER=$(CXX) -DCMAKE_C_COMPILER=$(CC)
+ 
+     #---------------------------------------------------------------------------
+     # CFLAGS for the C/C++ compiler
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
index 13e6fd066c..29f114a9dc 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
@@ -4,6 +4,7 @@ SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https;branc
            file://0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch \
            file://0002-Preserve-links-when-installing-libmetis.patch \
            file://0003-Add-version-information-to-libmetis.patch \
+           file://makefile-quoting.patch \
            "
 SRCREV = "538273cfd53720a10e34a3d80d3779b607e1ac26"
 
@@ -14,25 +15,17 @@ DEPENDS = "cmake-native lapack gmp mpfr chrpath-native"
 PROVIDES = "mongoose graphblas"
 RPROVIDES:${PN} = "mongoose graphblas"
 
-# The values of $CC, $CXX, and $LD that Bitbake uses have spaces in them which
-# causes problems when the SuiteSparse Makefiles try to pass these values on
-# the command line. To get around this problem, set these variables to only the
-# program name and prepend the rest of the value onto the corresponding FLAGS
-# variable.
-CFLAGS:prepend := "${@" ".join(d.getVar('CC').split()[1:])} "
-export CC := "${@d.getVar('CC').split()[0]}"
+inherit cmake
 
-CXXFLAGS:prepend := "${@" ".join(d.getVar('CXX').split()[1:])} "
-export CXX := "${@d.getVar('CXX').split()[0]}"
-
-LDFLAGS:prepend := "${@" ".join(d.getVar('LD').split()[1:])} "
-export LD := "${@d.getVar('LD').split()[0]}"
+B = "${S}"
 
 export CMAKE_OPTIONS = " \
     -DCMAKE_INSTALL_PREFIX=${D}${prefix} \
     -DCMAKE_INSTALL_LIBDIR=${baselib} \
 "
 
+OECMAKE_SOURCEPATH = "${S}/Mongoose ${S}/metis-5.1.0 ${S}/GraphBLAS"
+
 do_compile () {
 	oe_runmake library
 }

