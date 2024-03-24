Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC73C54E67
	for <webhook@archiver.kernel.org>; Sun, 24 Mar 2024 01:48:12 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.21836.1711244884360113412
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 18:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y5q4Qyie;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ea8a0d1a05so927735b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 18:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711244883; x=1711849683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhVGwRwlZoX2Zq3RIU4DeBU10RshxjZWINjEsK4CC9g=;
        b=Y5q4QyiesMnZD3qm+vmR/h+964ynOEVQt/V7UmZSnn2qME97J4ArMKBSeVEyVgidcb
         l/jOG+q+/PzgG1ZW8ZAhmFcENalsNaEPshkoK6WmOUrzAumOLMssPl7xqKZqNrdI3fDp
         ddN1pvaaRvZbRPK/LPEjW+r4EH5/SM/inavrR88mJsIFfLKBeTB91MDhjjSBkZY+un+B
         g2zaGwOT+JHt/UWUam8fVTVj1R/gCXhoxsD8B49GQipg/jWMVgxHlyODByWtjj2aHgM4
         Xe9GSZ18fRRA81/P0oqamfQ+RqYo5Ist93rDvZvZ1wif1fX35EvketCvXG/J/fOUcfDN
         KsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711244883; x=1711849683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhVGwRwlZoX2Zq3RIU4DeBU10RshxjZWINjEsK4CC9g=;
        b=TQXWffKIsGADCHF2Gt3iz+iFLRqEP3dNRS+iMRD0s60Q9DSMRamHiMuWDAi8irzdtX
         A9dHE2silqFR3UiHAzBiiMQ/ZGj7caPSgS5moLow7Jvq4HtLB/XHFHNnIWYddkf59mFi
         IQMXMFs51NFPMflBC35EL5iBzB+/Q9MHvzsTpzSOvAizASxMHbBQfS9OMuwsOMHZNgi/
         l4G65MnfDaPjnjUeGNq1SvHrqOzi4ITjLLnn+rKRRIJWK0jJVZT0NHaSArofYkdp3tZ2
         Uqw4lrmBIYTi9mpwhFLoDDYK8wy9V2ei5hxzyjxWxsNaED6eTosCe8ko6GXcfe4th2gq
         3W+A==
X-Gm-Message-State: AOJu0YyYQfMTPXOUAX0H1WOz7YaMLv8TKlu6cG4gcxgchBZCFXxkwUfd
	du91TYhGcCeNzELwY+4gxQI/Prkfil7/amBREn7OW+Ywj0d1lqTCXcxe+bBi
X-Google-Smtp-Source: AGHT+IHF+FBknbKC+2j6z7Fub9AoVn7qyfY5VP5Q0CcCM9icuPQxo7bgL6uXAwrdUkbzEbKfhdUN/g==
X-Received: by 2002:a17:902:ecc1:b0:1de:de7d:d3a6 with SMTP id a1-20020a170902ecc100b001dede7dd3a6mr4294791plh.30.1711244883156;
        Sat, 23 Mar 2024 18:48:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::779c])
        by smtp.gmail.com with ESMTPSA id e4-20020a17090301c400b001dee4a22c2bsm2195453plh.34.2024.03.23.18.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 18:48:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] liburing: Upgrade to 2.5
Date: Sat, 23 Mar 2024 18:48:00 -0700
Message-ID: <20240324014800.732601-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324014800.732601-1-raj.khem@gmail.com>
References: <20240324014800.732601-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 01:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109559

Changelogs are here [1]

[1] https://github.com/axboe/liburing/commit/f4e42a515cd78c8c9cac2be14222834be5f8df2b

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ure-on-.-configure-make-shuffle-2836.patch | 34 -------------------
 .../liburing/0001-do-not-build-examples.patch | 30 ----------------
 .../{liburing_2.4.bb => liburing_2.5.bb}      |  7 ++--
 3 files changed, 2 insertions(+), 69 deletions(-)
 delete mode 100644 meta-oe/recipes-support/liburing/liburing/0001-Fixes-build-failure-on-.-configure-make-shuffle-2836.patch
 delete mode 100644 meta-oe/recipes-support/liburing/liburing/0001-do-not-build-examples.patch
 rename meta-oe/recipes-support/liburing/{liburing_2.4.bb => liburing_2.5.bb} (78%)

diff --git a/meta-oe/recipes-support/liburing/liburing/0001-Fixes-build-failure-on-.-configure-make-shuffle-2836.patch b/meta-oe/recipes-support/liburing/liburing/0001-Fixes-build-failure-on-.-configure-make-shuffle-2836.patch
deleted file mode 100644
index 0cf8548e4c..0000000000
--- a/meta-oe/recipes-support/liburing/liburing/0001-Fixes-build-failure-on-.-configure-make-shuffle-2836.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c34dca74854cb6e7f2b09affa2a4ab0145e62371 Mon Sep 17 00:00:00 2001
-From: Kartik Mahajan <stonebrakert6@gmail.com>
-Date: Fri, 30 Jun 2023 11:34:07 +0530
-Subject: [PATCH] Fixes build failure on ./configure && make
- --shuffle=2836571325
-
-./configure && make --shuffle=2836571325 fails.
-The build fails on parallel builds for me and above command reproduces it.
-Note that --shuffle options is available on make version >= 4.4
-Target ffi_libname in src/Makefile should have a additional dependency
-upon $(liburing_sobjs)
-
-Upstream-Status: Backport [https://github.com/axboe/liburing/commit/c34dca74854cb6e7f2b09affa2a4ab0145e62371]
-Signed-off-by: Kartik Mahajan <stonebrakert6@gmail.com>
----
- src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index c4c28cb..7832095 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -81,7 +81,7 @@ liburing-ffi.a: $(liburing_objs) $(liburing_ffi_objs)
- $(libname): $(liburing_sobjs) liburing.map
- 	$(QUIET_CC)$(CC) $(SO_CFLAGS) -shared -Wl,--version-script=liburing.map -Wl,-soname=$(soname) -o $@ $(liburing_sobjs) $(LINK_FLAGS)
- 
--$(ffi_libname): $(liburing_ffi_objs) $(liburing_ffi_sobjs) liburing-ffi.map
-+$(ffi_libname): $(liburing_ffi_objs) $(liburing_ffi_sobjs) $(liburing_sobjs) liburing-ffi.map
- 	$(QUIET_CC)$(CC) $(SO_CFLAGS) -shared -Wl,--version-script=liburing-ffi.map -Wl,-soname=$(ffi_soname) -o $@ $(liburing_sobjs) $(liburing_ffi_sobjs) $(LINK_FLAGS)
- 
- install: $(all_targets)
--- 
-2.41.0
-
diff --git a/meta-oe/recipes-support/liburing/liburing/0001-do-not-build-examples.patch b/meta-oe/recipes-support/liburing/liburing/0001-do-not-build-examples.patch
deleted file mode 100644
index 03ab075314..0000000000
--- a/meta-oe/recipes-support/liburing/liburing/0001-do-not-build-examples.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 653c39b0b30b2a329db5041e558cfc97c03d6bfb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 17 Feb 2021 19:18:16 -0800
-Subject: [PATCH] do not build examples
-
-examples need ucontext and some architectures on musl do not have it
-implemented e.g. riscv
-
-Upstream-Status: Inappropriate [Arch-Specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 5d9c4dc..53e1615 100644
---- a/Makefile
-+++ b/Makefile
-@@ -11,7 +11,6 @@ default: all
- all:
- 	@$(MAKE) -C src
- 	@$(MAKE) -C test
--	@$(MAKE) -C examples
- 
- .PHONY: all install default clean test
- .PHONY: FORCE cscope
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-support/liburing/liburing_2.4.bb b/meta-oe/recipes-support/liburing/liburing_2.5.bb
similarity index 78%
rename from meta-oe/recipes-support/liburing/liburing_2.4.bb
rename to meta-oe/recipes-support/liburing/liburing_2.5.bb
index e5dba70df0..440259ffbd 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.4.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.5.bb
@@ -9,11 +9,8 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only | MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=2b0e9926530c269f5ae95560370195af"
 
-SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https \
-           file://0001-Fixes-build-failure-on-.-configure-make-shuffle-2836.patch"
-SRC_URI:append:libc-musl:riscv64 = " file://0001-do-not-build-examples.patch "
-SRC_URI:append:libc-musl:riscv32 = " file://0001-do-not-build-examples.patch "
-SRCREV = "298c083d75ecde5a8833366167b3b6abff0c8d39"
+SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https"
+SRCREV = "f4e42a515cd78c8c9cac2be14222834be5f8df2b"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


