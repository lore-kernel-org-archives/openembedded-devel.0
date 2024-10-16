Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF29D2A554
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:35:29 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.32014.1729107320042600322
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YIr4WQNT;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4314b316495so1689255e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 12:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107318; x=1729712118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiLiot+fYDppWcLbN0IvX9PVYu+kdSNGrljX23jMQpQ=;
        b=YIr4WQNTWSb+36XuHgsAdInahnHaa+P3EINgLiyyFB1WaDw9XhxzMyF203kb6cpGQ8
         K33BDuIv75EMZwtoXJC5pwh1nIqe8i3XxjJJh0TnIvDHxGmhx1YFysK9R8EMur1JdeF2
         T2S1snFs4/QbzFtWXB1M5DhRYOczaAHW/DF2RpCHNPKrYgpft5La7qx1hxVF7X49pahX
         Qt4+HaYMzGBencHIGQbDLwQkooiNn7RKc5BlWAP+uUl1dHTv7ndk1FLcYU6I/I9wI4jM
         YKCy0BxR77DrUuEJrEM1+TQyDXlS2xgZD0aANlwhYedkwUS84o4tGZ8B4YvXI1o2R5Ts
         J/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107318; x=1729712118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiLiot+fYDppWcLbN0IvX9PVYu+kdSNGrljX23jMQpQ=;
        b=TsZa1I2J6uYCL+nkXhOAqnZCei4kqO3xxep0yRrrKZ/bmjW+2roFBsEUPm4pjOXFRF
         t0hhqtgvxd05JHe81ktBgeN878Z23E5PJYi8srm9kVE3H14GRjJOz27e2i+P7F3Qe1cE
         VuFztxhu7Dozrt05OHl4C4R6AtWC6WeM7WVKxsMmxi6SrHry1OXh+GX9zHu4bloWiuhG
         gVwDUWzAYoCm88eErsG/oT4D79V3YolvuyAILyIdAQS2GX/qmPfq+/QbEoMcCnLxi4FX
         MeeVfuSLmLbC2zlFMXi5yW6zZ6bTQG+gSPe8I1WTRCeNiaL7ICKfSAuEraSBhdrLO3DI
         ESXg==
X-Gm-Message-State: AOJu0YwJ2XriuMzLzDktNsZhoZF0A8Ym4tI1a7d3pXjZMJ5u4UGvZmLW
	jGnKW4mThdQu1KTgGmqVLLdEgZPoJfWnLp8clR78BJTAX8lkerUFGKKgFw==
X-Google-Smtp-Source: AGHT+IFAwZLFqKVEf444aY2BSiNJRlA3bNNM48gyZMVL2kJZaznzYW5BnaI0kskPu9r794x6t/0A6A==
X-Received: by 2002:adf:fa89:0:b0:37c:c9ae:23fb with SMTP id ffacd0b85a97d-37d5529ad6amr13460894f8f.40.1729107318334;
        Wed, 16 Oct 2024 12:35:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf838dsm5120724f8f.78.2024.10.16.12.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:35:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/13] python3-m2crypto: update 0.40.1 -> 0.42.0
Date: Wed, 16 Oct 2024 21:35:03 +0200
Message-Id: <20241016193505.3459828-11-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016193505.3459828-1-alex@linutronix.de>
References: <20241016193505.3459828-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 19:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112952

This addresses python 3.13 issues.

Use build_meta instead of classic setuptools.

Drop all setup.py patches as no longer necessary.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...p.py-address-openssl-3.x-build-issue.patch | 28 ----------------
 ...k-in-sysroot-not-in-host-directories.patch | 33 -------------------
 .../avoid-host-contamination.patch            | 23 -------------
 .../cross-compile-platform.patch              | 33 -------------------
 ...o_0.40.1.bb => python3-m2crypto_0.42.0.bb} | 12 ++-----
 5 files changed, 3 insertions(+), 126 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-address-openssl-3.x-build-issue.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/avoid-host-contamination.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
 rename meta-python/recipes-devtools/python/{python3-m2crypto_0.40.1.bb => python3-m2crypto_0.42.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-address-openssl-3.x-build-issue.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-address-openssl-3.x-build-issue.patch
deleted file mode 100644
index c67e50803..000000000
--- a/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-address-openssl-3.x-build-issue.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 0d824e5c2ab13e761ffaeabdccf9513d5b8f280d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 8 Oct 2021 11:18:35 +0200
-Subject: [PATCH] setup.py: address openssl 3.x build issue
-
-swig throws:
-| /home/alex/development/poky/build-metaoe/tmp/work/x86_64-linux/python3-m2crypto-native/0.38.0-r0/recipe-sysroot-native/usr/include/openssl/macros.h:155: Error: CPP #error ""OPENSSL_API_COMPAT expresses an impossible API compatibility level"". Use the -cpperraswarn option to continue swig processing.
-
-I'm not sure why; upstream should take a look.
-
-Upstream-Status: Inappropriate [workaround]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- setup.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/setup.py b/setup.py
-index 2c65404..74704bc 100644
---- a/setup.py
-+++ b/setup.py
-@@ -192,6 +192,7 @@ class _M2CryptoBuildExt(build_ext.build_ext):
- 
-         self.swig_opts.append('-includeall')
-         self.swig_opts.append('-modern')
-+        self.swig_opts.append('-cpperraswarn')
-         self.swig_opts.append('-builtin')
- 
-         # These two lines are a workaround for
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
deleted file mode 100644
index 0baadfcaa..000000000
--- a/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From dfb83a41aaeae326e9b6f02b233af375bc7b8815 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Fri, 29 Mar 2013 15:17:17 +0100
-Subject: [PATCH] setup.py: link in sysroot, not in host directories
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-Upstream-Status: Pending [Unknown]
----
- setup.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
---- a/setup.py
-+++ b/setup.py
-@@ -135,6 +135,7 @@ class _M2CryptoBuildExt(build_ext.build_
-         self.set_undefined_options('build', ('bundledlls', 'bundledlls'))
- 
-         self.libraries = ['ssl', 'crypto']
-+        self.openssl = os.environ.get( "STAGING_DIR" )
-         if sys.platform == 'win32':
-             self.libraries = ['ssleay32', 'libeay32']
-             if self.openssl and openssl_version(self.openssl,
-@@ -159,8 +160,8 @@ class _M2CryptoBuildExt(build_ext.build_
- 
-         if self.openssl is not None:
-             log.debug('self.openssl = %s', self.openssl)
--            openssl_library_dir = os.path.join(self.openssl, 'lib')
--            openssl_include_dir = os.path.join(self.openssl, 'include')
-+            openssl_library_dir = os.environ.get( "STAGING_LIBDIR" )
-+            openssl_include_dir = os.environ.get( "STAGING_INCDIR" )
- 
-             self.library_dirs.append(openssl_library_dir)
-             self.include_dirs.append(openssl_include_dir)
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/avoid-host-contamination.patch b/meta-python/recipes-devtools/python/python3-m2crypto/avoid-host-contamination.patch
deleted file mode 100644
index 3cd6f7c27..000000000
--- a/meta-python/recipes-devtools/python/python3-m2crypto/avoid-host-contamination.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Filter out '/usr/include' for swig to avoid host contamination issue.
-
-Upstream-Status: Inappropriate [cross compile specific]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- setup.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 5a12981..389d49f 100644
---- a/setup.py
-+++ b/setup.py
-@@ -153,7 +153,8 @@ class _M2CryptoBuildExt(build_ext.build_ext):
-             self.swig_opts.append('-py3')
- 
-         # swig seems to need the default header file directories
--        self.swig_opts.extend(['-I%s' % i for i in _get_additional_includes()])
-+        self.swig_opts.extend(['-I%s' % i for i in _get_additional_includes()
-+                                            if i != '/usr/include'])
- 
-         log.debug('self.include_dirs = %s', self.include_dirs)
-         log.debug('self.library_dirs = %s', self.library_dirs)
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch b/meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
deleted file mode 100644
index 77ef7e557..000000000
--- a/meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Do not compute platform, this does not work in cross compile environment
-since it pokes at the system for getting architecture values
-
-Upstream-Status: Inappropriate
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/setup.py
-+++ b/setup.py
-@@ -169,24 +169,6 @@ class _M2CryptoBuildExt(build_ext.build_
-             log.debug('self.include_dirs = %s', self.include_dirs)
-             log.debug('self.library_dirs = %s', self.library_dirs)
- 
--        if platform.system() == "Linux":
--            # For RedHat-based distros, the '-D__{arch}__' option for
--            # Swig needs to be normalized, particularly on i386.
--            mach = platform.machine().lower()
--            if mach in ('i386', 'i486', 'i586', 'i686'):
--                arch = '__i386__'
--            elif mach in ('ppc64', 'powerpc64', 'ppc64le', 'ppc64el'):
--                arch = '__powerpc64__'
--            elif mach in ('ppc', 'powerpc'):
--                arch = '__powerpc__'
--            else:
--                arch = '__%s__' % mach
--            self.swig_opts.append('-D%s' % arch)
--            if mach in ('ppc64le', 'ppc64el'):
--                self.swig_opts.append('-D_CALL_ELF=2')
--            if mach in ('arm64_be'):
--                self.swig_opts.append('-D__AARCH64EB__')
--
-         self.swig_opts.extend(['-I%s' % i for i in self.include_dirs])
- 
-         # Some Linux distributor has added the following line in
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
rename to meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb
index 1d8c22d19..d5ffdbc40 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb
@@ -6,15 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/python-m2crypto:"
 
-SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
-            file://cross-compile-platform.patch \
-            file://avoid-host-contamination.patch \
-            file://0001-setup.py-address-openssl-3.x-build-issue.patch \
-            "
-SRC_URI[sha256sum] = "bbfd113ec55708c05816252a4f09e4237df4f3bbfc8171cbbc33057d257bbb30"
-
-PYPI_PACKAGE = "M2Crypto"
-inherit pypi siteinfo setuptools3
+SRC_URI[sha256sum] = "42b62df2caf623161b1d643a7235464c2fe2a3105049ebc498a6d47dc08f64b4"
+
+inherit pypi siteinfo python_setuptools_build_meta
 
 DEPENDS += "openssl swig-native"
 RDEPENDS:${PN} += "\
-- 
2.39.5


