Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4AFC7115D
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 10:14:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.4497.1750414449244954287
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 03:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F7XP9WMW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450dd065828so11882855e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 03:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750414447; x=1751019247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zyUQ7gZH0MPoNLGnV2NfrtN8ecCQ5J4yv7ezVmzW87w=;
        b=F7XP9WMWnsXr2EGFa4QBGRmyxHPpUmvSmZ2WkpQcM3nc9NFa0zraftH2czw76OOi9K
         lsUwTZcmQdbUquSOFMcLyvGqp51hQOealMjxNzWZeWY528U6aOO3gnFZNG4zc2gVGZAF
         VzvR/YYu4H8DvGuEB57WNi7Q2fR7ZdFmo0EdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750414447; x=1751019247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zyUQ7gZH0MPoNLGnV2NfrtN8ecCQ5J4yv7ezVmzW87w=;
        b=G7UbH/nmazS9oOm2TDuxVR7O4qNP218nyGwK41ErZjbyWSvpjXnm1YH8J5YjzMAakK
         y/bb97MPYa0kXvf8ARRvnr1Wd9Vb3DZZylIBCXhtZS23iQX+n4vL7QafknQz9ozk3SOK
         7r7vjzPatygQIVZGWl/s4OsY6duPXHYVSKgdQ7uex0+MXww7RpbuCw/21tO2rvw1ejsA
         5/8zH++uy7Vzs6+StK17XEyKZL46uI/bo0xXlBCAEOrsQaon7Lve1446j8lIFIOpEtuS
         Lm+ylE30g++7r4+HFwG1CUuREy0rYzqSdXw1Ea6IqNBg0vECjJ1+jffLO3eYEZ0YSjHV
         glfA==
X-Gm-Message-State: AOJu0YwA/Ds0VX5u98udHxn+WIoAV2YuMAeZ5IeP9QCsFuOLlXi0kAhm
	gEU5oO0H1hJn4D2l1O6b1gUDoBy4j3fKNOEuCaYmq91Ty3jjGM0YAumFOvgur5BjEoHeR9AKbZe
	3rop8mLo=
X-Gm-Gg: ASbGncs0ufnAKOnXzbxfjm5sPsBv8Wyk72Ke5U2pgMExHaqryVtbFbyzq0rEdCI9IGm
	M5Up0MGG8C/o7prB88dLMtax9voXqnyRhi7gmqArgy6+WWUyc2y8OkMIYmTmBNW6yS+UMd/PcEd
	StADFj1gGLeiiYJGHTpEw4WDsAJe6GxXrxHWfeyyRZRul+RS0PjU9ovO9RJVrrceHTU5tA1xvFq
	iRzKuidK0tDPJVabYEcvINo4oYz/mp/To5kxyPwz0MnWwKuq9TF6TII/5OxCNMYKifcOlgqkusQ
	yG8w43w/tBafW2E6vXssz+MAodxWfn4iQgd64U7lbBS7/MXoljuanGbpKD59Nm3kcBQgxhih29C
	nAPponCNEQzyzDKkSG8hUcQagqg==
X-Google-Smtp-Source: AGHT+IHfWgOUH65eM15SvC/2x+Co2jZVm2xdu1ILXiy26/dgRn41IFbX13MrzqkHJA6MRXWY9qM5nQ==
X-Received: by 2002:a05:600c:45d0:b0:453:6150:de50 with SMTP id 5b1f17b1804b1-453659badc0mr16755295e9.28.1750414446888;
        Fri, 20 Jun 2025 03:14:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b606:370e:6752:7b3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647084a5sm20142185e9.38.2025.06.20.03.14.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:14:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [PATCH] suitesparse: Update after toolchain selection changes
Date: Fri, 20 Jun 2025 11:14:05 +0100
Message-ID: <20250620101405.2455812-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 10:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117967

The toolchain selection changes mean CC is not set until after the recipe
is parsed, breaking the manipulations made by this recipe.

Replace it with code to inherit the cmake class, which correctly
configures cmake to use the right compiler/compiler flags.

We need to patch the makefiles to avoid those options being added
incorrectly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../suitesparse/makefile-quoting.patch        | 32 +++++++++++++++++++
 .../suitesparse/suitesparse_5.10.1.bb         |  7 ++++
 2 files changed, 39 insertions(+)
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
index b113145808..29f114a9dc 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
@@ -4,6 +4,7 @@ SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https;branc
            file://0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch \
            file://0002-Preserve-links-when-installing-libmetis.patch \
            file://0003-Add-version-information-to-libmetis.patch \
+           file://makefile-quoting.patch \
            "
 SRCREV = "538273cfd53720a10e34a3d80d3779b607e1ac26"
 
@@ -14,11 +15,17 @@ DEPENDS = "cmake-native lapack gmp mpfr chrpath-native"
 PROVIDES = "mongoose graphblas"
 RPROVIDES:${PN} = "mongoose graphblas"
 
+inherit cmake
+
+B = "${S}"
+
 export CMAKE_OPTIONS = " \
     -DCMAKE_INSTALL_PREFIX=${D}${prefix} \
     -DCMAKE_INSTALL_LIBDIR=${baselib} \
 "
 
+OECMAKE_SOURCEPATH = "${S}/Mongoose ${S}/metis-5.1.0 ${S}/GraphBLAS"
+
 do_compile () {
 	oe_runmake library
 }

