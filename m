Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 985ABC54FDF
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 07:18:27 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6181.1785395904562836044
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2026 00:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qp6usJI4;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1490728f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 00:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785395902; x=1786000702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlMXA68K+S3x/haBHq45SOyz7zIZZIIdV221pYeenX8=;
        b=qp6usJI4L//h+Fvbqi0BliO+kswtssESzoju15eZ7PQJhc8R5LIZ4jrlwM+QqYecKp
         5uYFqQVG/JCbMJmaljY1YqGhuQPmpB/dteSurOCgNZN89xg6IkpK5U8qEuAkX6y/sWKc
         fo5pTjbppk1xxBDlmkBCh9ceEk9CoU0vOlpgprA+Nkx0oLJq4fxctbbzfSNnCIVRr8Ol
         k03Sy0lktD9lqKgaInEkidT0P/ExwPD6qSlE1M4moXEX2Fx8COsCNn9s6MDFzCDVhGWY
         L2KqZNYFJ8E23/SStK9UsKbaFlJLPvx86V7WR/RTEwvxbLyLkq6Zs2Vx4L+F0MrVr62Z
         2e/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785395902; x=1786000702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlMXA68K+S3x/haBHq45SOyz7zIZZIIdV221pYeenX8=;
        b=i26bc6Uua2Y+R6PWHzghu89XDpr9UMh3xh2aq7bs0CjiTPgpUR0xKZOwEPDmluhCVy
         imzkRmxzgXVBqglPx5lu7EBL3K3MM9jt+yiTrDHO0i3+qmuQyORJZmQ4YDdS4q+z1IKv
         v/ksw6WZ0+1jdKBKNOhcfdpbWqO/LL08u0wlRYvMmIeuYLK0Zx9xc86l3TYb2D5XQKWt
         edAlYGIi1NWzFbLBLq05s/PhKx0p+Vzo173qwvn+gKZncwV8qgncRhLUMNdvmUhCf9cx
         xfZgcih27jfNUJIaKfYLUArLiA3GYZ3TmNC2G4jhq1+Jlhu7tf1n00oGmgBRSXJJliH/
         ougw==
X-Gm-Message-State: AOJu0YzLf3yfhDE9o/qMFpAQ4eV9PuNvPolI1TiqiN9zk2wlvMZ+xY9w
	hDfcuEP4/DXhwaX45XMd3O1SI023y4SZURpXAdTTCHQeho12OqjUmq5ZmmCAWBUD
X-Gm-Gg: AR+sD10plgkTiB/HMYECav+NKAhpkDalnZaeHRsY/YqBCVuoftuZginCuZpW8Vk8BFv
	U1hd/FV28YfYDD/jDrlbxjzbjyExw/XXdnywBs9gRVg+PVF4GCLbUX7tfjG7VIENVfserWg5xaJ
	BFx7N8nR2X1PBjqDelWqZcvSmLx7Q9Afg/RMK2VoxfQGqeCZeLRDvi6mEothBWYwXHR7csk+J9K
	wdZl2Tr4LynntpATjBCGCIsfx6OChRs7rMyYn8xsgvqVIXDvAjLmJHhby/EYghNlIdRwocORE/9
	sg81XAK0xd3dmoSA68O76VZjHX20T7ceYAvntcluk2Td0gUmVrF8KTHu7anYH7w0FXZA5ExZtm0
	I+d6LrCosLL2t49zHtFSkqVzfuzZA3omyav0kVUVqxqml4dXpXq0ivLJDVkYvD+qD8NU5fpubCe
	cdvUfH6yNDfytIUSo9RsJwG9vXkqEUMDpfyO+xd+U8bGkrWdaabPCkd5IViXAqb6+wBfRWnSVLo
	aEJwPtniih77g==
X-Received: by 2002:a05:6000:2010:b0:47f:90a5:be77 with SMTP id ffacd0b85a97d-47fc80c3163mr1771404f8f.6.1785395902389;
        Thu, 30 Jul 2026 00:18:22 -0700 (PDT)
Received: from dld58y9k4-lin.dl.net ([2.33.127.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88d708bsm3916489f8f.6.2026.07.30.00.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 00:18:21 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <locutusofborg@debian.org>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] boinc-client: update to 8.2.15
Date: Thu, 30 Jul 2026 09:18:15 +0200
Message-ID: <20260730071815.787912-1-locutusofborg@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 07:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128564

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 ...01-Do-not-undefine-_FILE_OFFSET_BITS.patch | 59 -------------------
 ...lient_7.20.5.bb => boinc-client_8.2.15.bb} |  9 ++-
 2 files changed, 4 insertions(+), 64 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/boinc/boinc-client/0001-Do-not-undefine-_FILE_OFFSET_BITS.patch
 rename meta-oe/recipes-extended/boinc/{boinc-client_7.20.5.bb => boinc-client_8.2.15.bb} (92%)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client/0001-Do-not-undefine-_FILE_OFFSET_BITS.patch b/meta-oe/recipes-extended/boinc/boinc-client/0001-Do-not-undefine-_FILE_OFFSET_BITS.patch
deleted file mode 100644
index 846fb099dc..0000000000
--- a/meta-oe/recipes-extended/boinc/boinc-client/0001-Do-not-undefine-_FILE_OFFSET_BITS.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 4e5c5a245f248976ea55fe1f805badb0cb1bb072 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 30 Dec 2022 23:41:36 -0800
-Subject: [PATCH] Do not undefine _FILE_OFFSET_BITS
-
-This does not work when we want to use 64bit time_t in glibc
-therefore let system decide on defining these macros
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- client/client_types.cpp  | 9 ---------
- client/hostinfo_unix.cpp | 9 ---------
- 2 files changed, 18 deletions(-)
-
-diff --git a/client/client_types.cpp b/client/client_types.cpp
-index 2977ef7863..7653517302 100644
---- a/client/client_types.cpp
-+++ b/client/client_types.cpp
-@@ -22,15 +22,6 @@
- #include "zlib.h"
- #else
- #include "config.h"
--// Somehow having config.h define _FILE_OFFSET_BITS or _LARGE_FILES is
--// causing open to be redefined to open64 which somehow, in some versions
--// of zlib.h causes gzopen to be redefined as gzopen64 which subsequently gets
--// reported as a linker error.  So for this file, we compile in small files
--// mode, regardless of these settings
--#undef _FILE_OFFSET_BITS
--#undef _LARGE_FILES
--#undef _LARGEFILE_SOURCE
--#undef _LARGEFILE64_SOURCE
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <zlib.h>
-diff --git a/client/hostinfo_unix.cpp b/client/hostinfo_unix.cpp
-index ff0b596221..0ad6841b39 100644
---- a/client/hostinfo_unix.cpp
-+++ b/client/hostinfo_unix.cpp
-@@ -26,15 +26,6 @@
- 
- #if !defined(_WIN32) || defined(__CYGWIN32__)
- 
--// Access to binary files in /proc filesystem doesn't work in the 64bit
--// files environment on some systems.
--// None of the functions here need 64bit file functions,
--// so undefine _FILE_OFFSET_BITS and _LARGE_FILES.
--//
--#undef _FILE_OFFSET_BITS
--#undef _LARGE_FILES
--#undef _LARGEFILE_SOURCE
--#undef _LARGEFILE64_SOURCE
- #include <iostream>
- #include <vector>
- #include <string>
--- 
-2.39.0
-
diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb
similarity index 92%
rename from meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
rename to meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb
index af4bf3a9a9..27e3202de2 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_8.2.15.bb
@@ -16,9 +16,9 @@ global warming, discover sources of gravitational waves, and many other types \
 of scientific and mathematical research."
 
 HOMEPAGE = "http://boinc.berkeley.edu/"
-LICENSE = "GPL-3.0-only AND LGPL-2.0-or-later"
+LICENSE = "GPL-3.0-only AND LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
+                    file://COPYING.LESSER;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 SECTION = "applications"
 DEPENDS = "curl \
            jpeg \
@@ -33,12 +33,11 @@ DEPENDS = "curl \
 CVE_PRODUCT = "boinc_client"
 CVE_STATUS[CVE-2013-2018] = "fixed-version: fixed in version 7.0.45 and later"
 
-SRCREV = "4774e1cbe0ad13cb9a6f7fffbb626a417316f61d"
-BRANCH = "client_release/7/7.20"
+SRCREV = "3422898505b74c637a4b530a94b63be90bdf025b"
+BRANCH = "client_release/8/8.2"
 SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \
            file://boinc-AM_CONDITIONAL.patch \
            file://0001-scripts-Do-not-check-for-files-on-build-host.patch \
-           file://0001-Do-not-undefine-_FILE_OFFSET_BITS.patch \
 "
 
 inherit gettext autotools pkgconfig features_check systemd
-- 
2.43.0


