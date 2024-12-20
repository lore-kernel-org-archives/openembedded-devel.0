Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE649E7718A
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 06:39:59 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.147146.1734676794087507193
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 22:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T+j6IAU0;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-725f2f79ed9so1307498b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 22:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734676793; x=1735281593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYuvGny+Rj2xJ/EQWROhkXwRCDQ7OTvmw5jBYm1m/tY=;
        b=T+j6IAU0M4Yanet3h6U/M+5/3UMS/vX/QyDAHVoCUZsCQrWnNzBbO0mo1dp4wrY6dx
         uSEH8+ImFtLWIfW3pBhac6ZazEKs0odZo+d1xPB6pif8QU94gc2OwmKJv9r5PR1JyGN+
         qx5gi2VlUUf4A4yPr/1izxSmUFDndvum5hEDfs51qCvtqUa0D1qLwG13ug3UgC/a1oNc
         gKUKR32PHTh6lkH8CjUU4LOTq90L77EDi+GmhVJwHBVjsaRGBbJD08XJ9xG/JiJ+kpAe
         Zt1/YBE9aHkQljGK2/N7eUSWjFApiiKicV7KDhr22t7PriBZ31iDDkop10O04WZ/oUB4
         Jw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734676793; x=1735281593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYuvGny+Rj2xJ/EQWROhkXwRCDQ7OTvmw5jBYm1m/tY=;
        b=r187x3xPIFTVK9jBeXIv9CeLvwWQaaGbyyKP7K+mP4tcCTVwuAPrLSBNRhexA6qUya
         YUafQWngsA1UFO++uJ7HwWTQl1K29CCBu38lhRmZ6Z7M3qJmuMW7GcQw1l9V00rE/t6S
         w8E0m1dFpR1EL2F+P1imopSV38M/fDq67Dkz/YdZhmouJ7AuD/d1ayiQbrN4zwkbk0lE
         LsqQx3brFmaV6zuqPzp6IG8rHmgJxnKm3nKPV7o3NgijQuIYpQgMTvQxjKdyhMGNvKbj
         0EnxoKVyEai9VbIQEn3Klr+ahMkb/uHRZ6PwGWTx15NcD0RFZxSp/vYIn1jWb8WHhujF
         B1Iw==
X-Gm-Message-State: AOJu0YzgDl+AjTlgo5vQsfRpLY/nwJDbCSVKEoeF63ryTZqPMn2PjqTK
	IupdxQEz/fqzOokho8N1urXKCjT9y3gSwA1QioiSIV6sbS9FkKl/R77ROytX
X-Gm-Gg: ASbGncunEb3tBZvejVXLky5I/HeqaIkJikfDpPmSQ00brZGyYxdDCLkMH9FWWbeKUoX
	17zB0ZA6GrMNDFvzZsaZbnxCtzfu4iggR9iVkiFXXcKU2WjB/GA8FogO6eWJE4zxNaxqc5Pc+Ao
	XiX/580xiW/EclWW7ZA8lCT+6OiYSsyaWUPSgzLb0TpjHx7Un+yV1kWKJ4Q5IBtb8RveX+/XGXB
	P02TbR5lASfAt8pLj8BIrUkcIu/QViB+ylJC7u7OBDJa4PLswLpBW7Jag==
X-Google-Smtp-Source: AGHT+IGfWIrPJnAeHFQgs6NiovyF+lAwVBksg6llUqkNyLe6poRPub8U6x1kxiYqXIAnVPhiSGEfEg==
X-Received: by 2002:a05:6a00:4ac5:b0:725:b12e:604c with SMTP id d2e1a72fcca58-72abdd3c467mr2291709b3a.4.1734676793146;
        Thu, 19 Dec 2024 22:39:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dba83sm2374419b3a.116.2024.12.19.22.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 22:39:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] 7zip: Fix build with clang
Date: Thu, 19 Dec 2024 22:39:49 -0800
Message-ID: <20241220063949.3205273-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220063949.3205273-1-raj.khem@gmail.com>
References: <20241220063949.3205273-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 06:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114430

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/7zip/7zip_24.09.bb   | 31 +++++++++++++------
 .../0001-support-yocto-cross-compiling.patch  | 18 ++++++-----
 2 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/meta-oe/recipes-extended/7zip/7zip_24.09.bb b/meta-oe/recipes-extended/7zip/7zip_24.09.bb
index 2ccec78404..84093e8d37 100644
--- a/meta-oe/recipes-extended/7zip/7zip_24.09.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_24.09.bb
@@ -17,19 +17,27 @@ UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 S = "${WORKDIR}/git"
 
 # Support Yocto cross compiling
+CXXFLAGS:append:toolchain-clang = " -Wno-error=cast-qual -Wno-error=sign-conversion \
+                                    -Wno-error=disabled-macro-expansion \
+                                    -Wno-error=cast-function-type-strict"
+
 EXTRA_OEMAKE += " \
     CXXFLAGS_EXTRA='${CXXFLAGS}' \
     CFLAGS_BASE2='${CFLAGS}' \
     LDFLAGS_STATIC_3='${LDFLAGS}' \
 "
 
+# Support clang
+MAKEFILE ?= "../../cmpl_gcc.mak"
+MAKEFILE:class-target:toolchain-clang = "../../cmpl_clang.mak"
+
 do_compile() {
-    oe_runmake -C CPP/7zip/Bundles/Alone2    -f ../../cmpl_gcc.mak
-    oe_runmake -C CPP/7zip/Bundles/Format7zF -f ../../cmpl_gcc.mak
-    oe_runmake -C CPP/7zip/UI/Console        -f ../../cmpl_gcc.mak
-    oe_runmake -C CPP/7zip/Bundles/SFXCon    -f ../../cmpl_gcc.mak
-    oe_runmake -C CPP/7zip/Bundles/Alone     -f ../../cmpl_gcc.mak
-    oe_runmake -C CPP/7zip/Bundles/Alone7z   -f ../../cmpl_gcc.mak
+    oe_runmake -C CPP/7zip/Bundles/Alone2    -f ${MAKEFILE}
+    oe_runmake -C CPP/7zip/Bundles/Format7zF -f ${MAKEFILE}
+    oe_runmake -C CPP/7zip/UI/Console        -f ${MAKEFILE}
+    oe_runmake -C CPP/7zip/Bundles/SFXCon    -f ${MAKEFILE}
+    oe_runmake -C CPP/7zip/Bundles/Alone     -f ${MAKEFILE}
+    oe_runmake -C CPP/7zip/Bundles/Alone7z   -f ${MAKEFILE}
 }
 
 FILES:${PN} += "${libdir}/*"
@@ -37,15 +45,18 @@ FILES:${PN} += "${libdir}/*"
 FILES_SOLIBSDEV = ""
 INSANE_SKIP:${PN} += "dev-so"
 
+INSTALLDIR ?= "g"
+INSTALLDIR:class-target:toolchain-clang = "c"
+
 do_install() {
 	install -d ${D}${bindir}
-	install -m 0755 ${S}/CPP/7zip/Bundles/Alone/b/g/7za ${D}${bindir}
-	install -m 0755 ${S}/CPP/7zip/Bundles/Alone7z/b/g/7zr ${D}${bindir}
-	install -m 0755 ${S}/CPP/7zip/UI/Console/b/g/7z ${D}${bindir}/7z.real
+	install -m 0755 ${S}/CPP/7zip/Bundles/Alone/b/${INSTALLDIR}/7za ${D}${bindir}
+	install -m 0755 ${S}/CPP/7zip/Bundles/Alone7z/b/${INSTALLDIR}/7zr ${D}${bindir}
+	install -m 0755 ${S}/CPP/7zip/UI/Console/b/${INSTALLDIR}/7z ${D}${bindir}/7z.real
 	install -m 0755 ${UNPACKDIR}/7z_wrapper.sh ${D}${bindir}/7z
 
 	install -d ${D}${libdir}
-	install -m 0755 ${S}/CPP/7zip/Bundles/Format7zF/b/g/7z.so ${D}${libdir}/lib7z.so
+	install -m 0755 ${S}/CPP/7zip/Bundles/Format7zF/b/${INSTALLDIR}/7z.so ${D}${libdir}/lib7z.so
 	ln -rsn ${D}${libdir}/lib7z.so ${D}${bindir}/7z.so
 }
 
diff --git a/meta-oe/recipes-extended/7zip/files/0001-support-yocto-cross-compiling.patch b/meta-oe/recipes-extended/7zip/files/0001-support-yocto-cross-compiling.patch
index 06908e94fe..e3d0477930 100644
--- a/meta-oe/recipes-extended/7zip/files/0001-support-yocto-cross-compiling.patch
+++ b/meta-oe/recipes-extended/7zip/files/0001-support-yocto-cross-compiling.patch
@@ -21,8 +21,6 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  CPP/7zip/var_gcc.mak  | 2 --
  2 files changed, 1 insertion(+), 3 deletions(-)
 
-diff --git a/CPP/7zip/7zip_gcc.mak b/CPP/7zip/7zip_gcc.mak
-index bcb06a0..297f0a8 100644
 --- a/CPP/7zip/7zip_gcc.mak
 +++ b/CPP/7zip/7zip_gcc.mak
 @@ -45,7 +45,7 @@ CFLAGS_DEBUG = -g
@@ -30,12 +28,10 @@ index bcb06a0..297f0a8 100644
  CFLAGS_DEBUG = -DNDEBUG
  ifneq ($(CC), $(CROSS_COMPILE)clang)
 -LFLAGS_STRIP = -s
-+LFLAGS_STRIP = 
++LFLAGS_STRIP =
  endif
  endif
  
-diff --git a/CPP/7zip/var_gcc.mak b/CPP/7zip/var_gcc.mak
-index 664491c..6d0f485 100644
 --- a/CPP/7zip/var_gcc.mak
 +++ b/CPP/7zip/var_gcc.mak
 @@ -6,7 +6,5 @@ IS_ARM64=
@@ -46,6 +42,12 @@ index 664491c..6d0f485 100644
 -CXX=$(CROSS_COMPILE)g++
  
  # -march=armv8-a+crc+crypto
--- 
-2.34.1
-
+--- a/CPP/7zip/var_clang.mak
++++ b/CPP/7zip/var_clang.mak
+@@ -6,6 +6,4 @@ IS_ARM64=
+ CROSS_COMPILE=
+ MY_ARCH=
+ USE_ASM=
+-CC=$(CROSS_COMPILE)clang
+-CXX=$(CROSS_COMPILE)clang++
+ USE_CLANG=1

