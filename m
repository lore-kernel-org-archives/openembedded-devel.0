Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773DDC3DA6E
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 07:35:09 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.3080.1703316907302167907
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 23:35:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U8LGtx2F;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40d3bf30664so25154905e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 23:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703316905; x=1703921705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lKFfBtXlHQ9aQgB3fZLf/2BxBpCoYLTTo/50sEfLvfw=;
        b=U8LGtx2FeKUwEtqdnki4mvbJdUFXDCiBkve09Igj2k0KAWc0Lg4dyvWGELsZdrslUU
         2hhWHspn3HY9u3NBAt+u1RCjoUTnc0w9caDXJwvJcn1tPX7KtxYDnsosiyY5oO5/Wu/o
         X0nMVfz+YXPR1VxicdNbO2DK3p+dY1XEH/RdM7EA7fLE83eHJPoHqNF/GmvvGDxGMjA5
         Q8foiAdmqQgDhQcnOoHHR+8ky0z66TrYmiNjmaW4lfSSn92yxasUoE5HvQ2xjZJfbBPb
         C5oCaC5yi7czAIYEgMMLWtMGPGA8V4a954w7MfY0LchxGXGOVdlw++22hOdh5YmavTru
         BHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703316905; x=1703921705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKFfBtXlHQ9aQgB3fZLf/2BxBpCoYLTTo/50sEfLvfw=;
        b=X6f/z8VpL9uEcOfpJ711Pg2mEuDqjA0lOxp8L5gs+XbuhL0joluN4gpyBIg3cFBxu+
         WJtKYJAoVLouJOgCziPrbpPaml2KRQwN3CvOijNuV3ovu9nBq91bEovUSm6pdAG9/SjL
         uCqnbuBPX/05cuinAjj7i+m54870qezq1P14RFK7iJupFgW0bMaqAHk/RgAOU47wq/P7
         jCOQ/FF7HiWX2tT6M0sPfC4X924D/+rhAxsmovLJkz7i2TDtSvi6EECk0yKnvW1UiyTh
         Syii9ptthkiFM/nkk3fY5o7TnV5YNgT6opPDg5z/rNxDcg2ZRUv6D+MR9aWOWM/Vik8k
         Pt3A==
X-Gm-Message-State: AOJu0Ywv3XfRlHN1q3Va6tz58eTiWd2Y2Yh9Kj0TvMh2haq3VYpvGu8w
	wiADu9Izc7VX8kM7YjCqrjlxPPUU1qE=
X-Google-Smtp-Source: AGHT+IFn/cTp+IUe7MkljGPu0pt049e3acbOwls0laa8Jv0Hyidw8LHI0WqbAkKmb/bCvCVSIBHq2A==
X-Received: by 2002:a05:600c:4f4b:b0:40c:30e8:fc5f with SMTP id m11-20020a05600c4f4b00b0040c30e8fc5fmr1529319wmq.90.1703316905018;
        Fri, 22 Dec 2023 23:35:05 -0800 (PST)
Received: from localhost.localdomain ([176.88.106.122])
        by smtp.gmail.com with ESMTPSA id o11-20020a05600c510b00b0040b43da0bbasm9370060wms.30.2023.12.22.23.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 23:35:04 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] epeg: upgrade to latest release(0.9.3)
Date: Sat, 23 Dec 2023 10:35:01 +0300
Message-Id: <20231223073501.49038-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Dec 2023 07:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107769

* Dropped patch because fixed in the new version

Changelog:

* Fix XMP rotation bug
* add cmake as build system + add epeg_set/get_orientation + fix memleak in epeg_close
* minor fixes to build on windows + enable build of command line tool with cmake
* configure: Fix checks for libjpeg and libexif

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...e-Fix-checks-for-libjpeg-and-libexif.patch | 32 -------------------
 .../epeg/{epeg_git.bb => epeg_0.9.3.bb}       |  7 ++--
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-support/epeg/epeg/0001-configure-Fix-checks-for-libjpeg-and-libexif.patch
 rename meta-oe/recipes-support/epeg/{epeg_git.bb => epeg_0.9.3.bb} (80%)

diff --git a/meta-oe/recipes-support/epeg/epeg/0001-configure-Fix-checks-for-libjpeg-and-libexif.patch b/meta-oe/recipes-support/epeg/epeg/0001-configure-Fix-checks-for-libjpeg-and-libexif.patch
deleted file mode 100644
index 1568fe96e..000000000
--- a/meta-oe/recipes-support/epeg/epeg/0001-configure-Fix-checks-for-libjpeg-and-libexif.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 4e0c62634b0db6dbad0d41377bb71a8012abd75b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 1 Sep 2022 12:56:54 -0700
-Subject: [PATCH] configure: Fix checks for libjpeg and libexif
-
-Use the functions from the respective library instead of using main
-function which is not part of library
-
-Upstream-Status: Submitted [https://github.com/mattes/epeg/pull/27]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a4f6ebd..e474b1d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -31,8 +31,8 @@ AC_SUBST(version_info)
- dnl AC_CHECK_FUNCS(fmemopen)
- dnl AC_CHECK_FUNCS(open_memstream)
- 
--AC_CHECK_LIB([jpeg], [main], [], [echo "libjpeg library not found. Please install it before proceeding"; exit -1])
--AC_CHECK_LIB([exif], [main], [], [echo "libexif library not found. Please install it before proceeding"; exit -1])
-+AC_CHECK_LIB([jpeg], [jpeg_simple_progression], [], [echo "libjpeg library not found. Please install it before proceeding"; exit -1])
-+AC_CHECK_LIB([exif], [exif_data_new_from_file], [], [echo "libexif library not found. Please install it before proceeding"; exit -1])
- 
- my_includes=""
- my_libs="-ljpeg -lexif"
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-support/epeg/epeg_git.bb b/meta-oe/recipes-support/epeg/epeg_0.9.3.bb
similarity index 80%
rename from meta-oe/recipes-support/epeg/epeg_git.bb
rename to meta-oe/recipes-support/epeg/epeg_0.9.3.bb
index e5277b157..f70c3dd1e 100644
--- a/meta-oe/recipes-support/epeg/epeg_git.bb
+++ b/meta-oe/recipes-support/epeg/epeg_0.9.3.bb
@@ -3,12 +3,11 @@ DESCRIPTION = "Insanely fast JPEG/ JPG thumbnail scaling with the minimum fuss a
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7732a9290ea1e4b034fdc15cf49968d \
                     file://COPYING-PLAIN;md5=f59cacc08235a546b0c34a5422133035"
+
 DEPENDS = "jpeg libexif"
 
-SRC_URI = "git://github.com/mattes/epeg.git;branch=master;protocol=https \
-           file://0001-configure-Fix-checks-for-libjpeg-and-libexif.patch \
-           "
-SRCREV = "9a175cd67eaa61fe45413d8da82da72936567047"
+SRC_URI = "git://github.com/mattes/epeg.git;branch=master;protocol=https"
+SRCREV = "17bbae0f0a0b777e5fb01e0d16891e07153a41eb"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.25.1


