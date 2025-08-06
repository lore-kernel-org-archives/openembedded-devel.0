Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AE6C87FCA
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 03:49:39 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.17297.1754452172828677117
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Aug 2025 20:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m+T2kfWW;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-306e88f0b0aso2060265fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 20:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754452172; x=1755056972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fywSozIReIvADTU4CSPyhBQUo7HAfHTG/1Hp31EtmI8=;
        b=m+T2kfWWZDiwrUqrR4Hcpxv7xH3AlXBO6EwT7f9lNLLgIH9rqt7xxNVgDqZgsYYHu7
         Ra4MFqaBGHe/imzq0JyEMwnC7Tnys7LsKl3sBF7IN2dD5WfzPpUq/u1qTRZv/r8y4ORv
         0Rh0jvfwJObhketorwMk8VsHB/aBhB/NOrZwSbFm/Wvst/5EnXEbtyudx0Z7biL+9EK5
         HIEt3Z0+PIhPgJ/e4uPUNVdlZrFSHadpQ7G/85ao+K+7OL+/kJYMMHmgsCg9ieUzXuHC
         cCFJXaO7MuQhT2JdecPx0xhZ4o0mrUtOTQpUZGR3gd8Nz5K4743TKM/Bh3oeQ+ZQeD/B
         g2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754452172; x=1755056972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fywSozIReIvADTU4CSPyhBQUo7HAfHTG/1Hp31EtmI8=;
        b=afd8erca3Mh4XPjOzHr3dY0H6ZCf2F+X8NfoMWUq1TghVmdM5yuKYtGjgtmVPIabdl
         DMXRb6gWY7l4kxb1WCexDYXlUm+9Dui8szTUWOxnV2u6h1xYGsUPYJYwhZphrX3ZchlX
         H9AEAMxS8TPQZgh8CKhxoaHTtU/JkKXhc3zcvZRSwIY1wXFeLA/W+6futBo9iKq4Bmbg
         8nUHqFxAGaod+bAM5JP5VT7TYImIyM9RqFPa01LzHuOTXYar/IhPlxjN38Q/nU/FeW6P
         FO5o0rxQYzGZ+AYf9/8x1KHa63KfdOTZWHFhLGAJz2SRJGjnjzCQl5U1yazRDR/y7435
         sG+A==
X-Gm-Message-State: AOJu0Yx7ERuO56JhYze4EXL2z6mSW2nzBKtiOqC/MGBIOrOOvkfKJLf7
	0+nY11pLqVXJwm8S2Tgu17uZ6xI7otXef6dB909oUqAqsKVfZ0+rb11GEL2baJhl37g=
X-Gm-Gg: ASbGnctSz1HhlEsyCu3e9gH+JCbpoNjjw/D+veNfvwgpUZCaXt01DTOuAQKIxVhyDNc
	jQ/tyR4aujI7C2Xgecep9733TweCHv3DVTiLk80IvA6LTd8sQGVOgI7vMa2lVuVnz71bcS0djJB
	fXUtG0o15Lc+7Iv67FuXl8CwhJ+iG9Axrc+FLF/4zhjJuOVOseam3Z93ugAacvw/FbJi7mWnVYU
	XGEjyoMaRFrA+dKtsMvz4pDtfxfoNEqMCeaId864798ACvh0pqWRDZFS9iEtH8Z7xfuPOBzKDBE
	bgXKSMlYgvFhlGePsyWm+cBlm8Wjv74k1dSiKDzMsfUTSlyDqgCF5HEP2f1fTRCzjcm+qcgX5vL
	kk7QLTL1KQ8HBHXy68TTLDQ==
X-Google-Smtp-Source: AGHT+IGY8Wx1qrnxyOAh+UhmlTCADAPhDHPsO6w+T60zLtRrO/udwgwEfq2wMq9Lx6+oU3XvPHsJFQ==
X-Received: by 2002:a05:6870:e0c9:b0:301:2a4:14e2 with SMTP id 586e51a60fabf-30be25433bcmr863318fac.0.1754452170462;
        Tue, 05 Aug 2025 20:49:30 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ccc5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7b2700sm12361848a12.15.2025.08.05.20.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 20:49:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] gphoto2: Strip --sysroot out of emitted compiler string into binaries
Date: Tue,  5 Aug 2025 20:49:26 -0700
Message-ID: <20250806034926.3195325-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806034926.3195325-1-raj.khem@gmail.com>
References: <20250806034926.3195325-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Aug 2025 03:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118885

Update patch status
Substitute hardcoding with BP in SRC_URI
Drop sed kludge

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ototypes-of-callbacks-with-libgphoto.patch |  2 +-
 ...figure-Filter-out-buildpaths-from-CC.patch | 26 +++++++++++++++++++
 .../gphoto2/gphoto2_2.5.28.bb                 |  7 ++---
 3 files changed, 29 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure-Filter-out-buildpaths-from-CC.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-Match-prototypes-of-callbacks-with-libgphoto.patch b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-Match-prototypes-of-callbacks-with-libgphoto.patch
index abe38e12ce..e0c3de469a 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-Match-prototypes-of-callbacks-with-libgphoto.patch
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-Match-prototypes-of-callbacks-with-libgphoto.patch
@@ -8,7 +8,7 @@ we tried to fix by using pthread_t but it also needs to make changes in
 libgphoto and these changes can be invasive, therefore lets revert to
 older types and to fix musl problem fix it via type casts
 
-Upstream-Status: Submitted [https://github.com/gphoto/gphoto2/pull/569]
+Upstream-Status: Backport [https://github.com/gphoto/gphoto2/pull/569]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gphoto2/main.c | 8 ++++----
diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure-Filter-out-buildpaths-from-CC.patch b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure-Filter-out-buildpaths-from-CC.patch
new file mode 100644
index 0000000000..3d54d58e18
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure-Filter-out-buildpaths-from-CC.patch
@@ -0,0 +1,26 @@
+From 06be633b8f4e2241bd37d4faf62b49606ad778e7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 25 May 2023 19:01:36 -0700
+Subject: [PATCH] configure: Filter out buildpaths from CC
+
+Upstream-Status: Inappropriate [Cross-compile specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                 | 4 +++-
+ libgphoto2_port/configure.ac | 6 ++++--
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -26,7 +26,9 @@ AC_PROG_INSTALL
+ AC_SYS_LARGEFILE
+ 
+ GP_CONFIG_MSG([Compiler],[${CC}])
+-AC_DEFINE_UNQUOTED([HAVE_CC],"$CC",[The C compiler we're using])
++CC_NO_SYSROOT=`echo $CC | sed -e \
++	's|--sysroot=.*\b||g'`
++AC_DEFINE_UNQUOTED([HAVE_CC], ["$CC_NO_SYSROOT"], [The C compiler we're using])
+ 
+ dnl AC_STRUCT_TIMEZONE
+ 
diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
index 63993bfbeb..40409ed388 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
@@ -6,10 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "libgphoto2 popt readline"
 RDEPENDS:gphoto2 = "libgphoto2"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/gphoto2-${PV}.tar.bz2;name=gphoto2 \
+SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.bz2;name=gphoto2 \
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
            file://0001-gphoto2-Use-pthread_t-abstract-type-for-thead-IDs.patch \
            file://0001-Match-prototypes-of-callbacks-with-libgphoto.patch \
+           file://0001-configure-Filter-out-buildpaths-from-CC.patch \
 "
 SRC_URI[gphoto2.sha256sum] = "2a648dcdf12da19e208255df4ebed3e7d2a02f905be4165f2443c984cf887375"
 
@@ -18,7 +19,3 @@ inherit autotools pkgconfig gettext
 EXTRA_OECONF += "--with-jpeg-prefix=${STAGING_INCDIR} \
                  --without-cdk \
 "
-
-do_compile:prepend() {
-	sed -i -e 's/--sysroot=[^ "]*//g' ${B}/config.h
-}

