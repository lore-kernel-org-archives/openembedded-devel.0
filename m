Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.3580.1618693578420707447
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TXp62tf8;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id b17so21555819pgh.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=o8PB78VFwG4R5uQq6HN0VLyxTy66NrOQJa3Ih5m/o28=;
        b=TXp62tf8z3Y3rsCMxv3NpIe3wroDsiyTzo0FD258p8cVunXlIWUD3j2VkLZpVmTFle
         Q8atreMIn9YX7Ea+7xDaru0aAHk8Z+DQCAyHhuyjk2AKI1YmBHWOGecb/OhnCf6LgS0U
         oIOntXigsjvB/BE251cN8wscUUv8uCEHlA3B1h3xUicXkjYECpDgOmVOHLt8P3bgrmS8
         +ukvta3H7xSRaI76Qw2vr9G7Ld+8VzU7Y6wq2FeOSxwVhfWHKMteOVNm/nF1Odpp6iTz
         og+pZlqUH6M0ZQZcGJeaC+OKJbg3NTnjojKlvjnwfZKvILd9uHP2YRt9WNr+YBGVQZug
         E51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=o8PB78VFwG4R5uQq6HN0VLyxTy66NrOQJa3Ih5m/o28=;
        b=iC6h3l4xnTavJTVVsyAPfTbuhcUTYWZzHEZ4RZsQm5ip0YU/3czr3cKeChwwdeVVjq
         Ko30Mhnt+f4+r+UjgwvZqnH3BvS6Hc2qehdv7pc+2ocLOTtA2dlH/hHBuBfU1t0MGst9
         LCKglmImTOGWwaqRFUk90iw7DB20yTRjbJji50AxaEzSrkbZDOoSldbmbOQZyMK4/+Ta
         7WO3+I6k5od7e8e+GLIIA9EK3a22SBwcKjkgLLvpgOfTVSqMRtxL6pOqtfqTpjBCXutZ
         pU5E2afIIlUyB8uxC9MvRZmc5UM1xPHSmptoTKFE0jnRMP+lpw1oCYz5sSjqo4pbemPW
         n4Rw==
X-Gm-Message-State: AOAM5332jDQxwVBPlmtJRhv7prGEVqlhhFR3i1XSZybC4P/ru2w1+aJf
	LIYWu1cK8at+qFU/zfw07CeZBc6tGKbGnw==
X-Google-Smtp-Source: ABdhPJyNjA7WDRvdApuQQK+9DDrC5NZa+oSsTZ+anfbyWGrk93cPdVQdvq3guI2KUHUQ3dzk+eatxQ==
X-Received: by 2002:a05:6a00:882:b029:24b:afda:acfa with SMTP id q2-20020a056a000882b029024bafdaacfamr13138373pfj.72.1618693577795;
        Sat, 17 Apr 2021 14:06:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:17 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 11/50] python3-grpcio: Upgrade 1.36.1 -> 1.37.0
Date: Sat, 17 Apr 2021 14:05:20 -0700
Message-Id: <184db3060f75f9ae21d1e401b1256f796fd2d709.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.37.0:

- Use boringssl asm optimizations in aarch64 wheel source build.
- Clarify Guarantees about grpc.Future Interface.
- Use crosscompilation to build python armv7 wheels.
- [Aio] Add time_remaining method to ServicerContext.
- Standardize all environment variable boolean configuration in
  python's setup.py.
- Crosscompile python aarch64 wheels with dockcross.
- Fix Signal Safety Issue.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit d5e3c261605e7623eb361db8fe3dbf18413d6ecb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-grpcio/boring_ssl.patch    | 50 ++++++++++++-------
 ...cio_1.36.1.bb => python3-grpcio_1.37.0.bb} |  2 +-
 2 files changed, 33 insertions(+), 19 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.36.1.bb => python3-grpcio_1.37.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/boring_ssl.patch b/meta-python/recipes-devtools/python/python3-grpcio/boring_ssl.patch
index 65db4a6ed47..d12e35a993e 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/boring_ssl.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/boring_ssl.patch
@@ -1,36 +1,50 @@
+From f71b32eb8a5c173fc5733847437b9485d75bb2e5 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Fri, 9 Apr 2021 14:06:36 +0300
+Subject: [PATCH] setup.py: Fix determining target platform
+
 Do not poke at the build machine to determine target platform or architecture
 pass it from environment instead for cross compiling to work
 
 Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ setup.py | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index c93d419f32..71a944a9d0 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -109,6 +109,8 @@ CLASSIFIERS = [
- BUILD_WITH_BORING_SSL_ASM = os.environ.get('GRPC_BUILD_WITH_BORING_SSL_ASM',
-                                            True)
+@@ -116,6 +116,9 @@ def _env_bool_value(env_name, default):
+ BUILD_WITH_BORING_SSL_ASM = _env_bool_value('GRPC_BUILD_WITH_BORING_SSL_ASM',
+                                             'True')
  
 +BORING_SSL_PLATFORM = os.environ.get('GRPC_BORING_SSL_PLATFORM',
-+                                           True)
- # Environment variable to determine whether or not the Cython extension should
- # *use* Cython or use the generated C files. Note that this requires the C files
- # to have been generated by building first *with* Cython support. Even if this
-@@ -306,15 +308,15 @@ asm_key = ''
- if BUILD_WITH_BORING_SSL_ASM and not BUILD_WITH_SYSTEM_OPENSSL:
++                                           'True')
++
+ # Export this environment variable to override the platform variant that will
+ # be chosen for boringssl assembly optimizations. This option is useful when
+ # crosscompiling and the host platform as obtained by distutils.utils.get_platform()
+@@ -336,13 +339,13 @@ if BUILD_WITH_BORING_SSL_ASM and not BUILD_WITH_SYSTEM_OPENSSL:
      LINUX_X86_64 = 'linux-x86_64'
      LINUX_ARM = 'linux-arm'
--    if LINUX_X86_64 == util.get_platform():
+     LINUX_AARCH64 = 'linux-aarch64'
+-    if LINUX_X86_64 == boringssl_asm_platform:
 +    if LINUX_X86_64 == BORING_SSL_PLATFORM:
          asm_key = 'crypto_linux_x86_64'
--    elif LINUX_ARM == util.get_platform():
+-    elif LINUX_ARM == boringssl_asm_platform:
 +    elif LINUX_ARM == BORING_SSL_PLATFORM:
          asm_key = 'crypto_linux_arm'
--    elif "mac" in util.get_platform() and "x86_64" in util.get_platform():
-+    elif "mac" in BORING_SSL_PLATFORM and "x86_64" in BORING_SSL_PLATFORM:
+-    elif LINUX_AARCH64 == boringssl_asm_platform:
++    elif LINUX_AARCH64 == BORING_SSL_PLATFORM:
+         asm_key = 'crypto_linux_aarch64'
+-    elif "mac" in boringssl_asm_platform and "x86_64" in boringssl_asm_platform:
++    elif "mac" in boringssl_asm_platform and "x86_64" in BORING_SSL_PLATFORM:
          asm_key = 'crypto_mac_x86_64'
      else:
          print("ASM Builds for BoringSSL currently not supported on:",
--              util.get_platform())
-+              BORING_SSL_PLATFORM)
- if asm_key:
-     asm_files = grpc_core_dependencies.ASM_SOURCE_FILES[asm_key]
- else:
+-- 
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.37.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.37.0.bb
index 13cef537e2a..47fb71120dc 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.37.0.bb
@@ -13,7 +13,7 @@ SRC_URI_append_class-target = " file://ppc-boringssl-support.patch \
                                 file://mips_bigendian.patch \
                                 file://0001-absl-always-use-asm-sgidefs.h.patch \
 "
-SRC_URI[sha256sum] = "a66ea59b20f3669df0f0c6a3bd57b985e5b2d1dcf3e4c29819bb8dc232d0fd38"
+SRC_URI[sha256sum] = "b3ce16aa91569760fdabd77ca901b2288152eb16941d28edd9a3a75a0c4a8a85"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.17.1

