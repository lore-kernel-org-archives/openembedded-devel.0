Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.23437.1591978252758736060
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 09:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oKhrCKNB;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id x6so10251008wrm.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 09:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=40oM6Ga/C5jluJiXLHAONTiDHr5bNgGFDVMNUYF9csk=;
        b=oKhrCKNBhBYWMAJ8e6JhxwiKc9FM2d+G025WufNHjJttm0G2aIGtTuRamzCsAnSg2S
         NAwfX1lw8TPKSRgsTSv7BVNhPCVKDkUjldgOxMsr1IbWmDtozIrDEnCijsuWyKwujj14
         ugJeOrqmPj5s6QzuZeSqAXsIRuH+4Zx3gq1oqJMxhPnmCSJzBaJKntkMJ7j9U+tDG7mr
         jhFFEoea7dB0eNWpKqQKNsTF8ZKrLjq90F3BcODjbTY27i/qorwkMS+kAw5DEFYoADRq
         yClizkkgKYzdl7zwjVtDttxtEIZ0VssoEfuj7dK+5tbRW9qAqNxdKxO9CSsNbLiLqtyD
         AwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=40oM6Ga/C5jluJiXLHAONTiDHr5bNgGFDVMNUYF9csk=;
        b=t3Cq/+hfBdFoK4FtJdu/WzmSLH7pKJieS+xE1/FudWwx6G2/eN32EFkdBbGJbTvoj9
         fueUKf0vhHxOkHdM2H6/xL2K8KJld6CIychlCIRLgEe4LQtiucwoKsJb/39ZGbhbHY68
         8QbSRIpx0wr/IvJoGCs5NrrX6Qw1GD7zyaehXklGeLUVxu4cDwBbnfKRfvQ16Is+2Y1X
         WVX5MkWvkXOFk4jASkHcTFTCTpybcXD+oqiMZ63m1xEY5WQD+xSFzYcgum0ioT9r1+4r
         DGnqoxsyy85/FTVfHA3Bg7JELR3LY09QVNkudBHyVBQaaESKYm4hJzNSay7w0KLerxXG
         TyQw==
X-Gm-Message-State: AOAM533lwXNXqYKSHc56dq/DQ2TWzviajB8JMCtVaH1/c2Eh7wrFU/iX
	JbAxKa1SVJ5Ty4Zt//Zg3fF1mvqdIug=
X-Google-Smtp-Source: ABdhPJwcuyow8LzyaoiqIygXgOntZEZaf5Uc9TAI0llSZDV9wkgMDfoU+O3nbytSNlpi+eVECJ2b6A==
X-Received: by 2002:adf:fd81:: with SMTP id d1mr16135185wrr.96.1591978250848;
        Fri, 12 Jun 2020 09:10:50 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id o15sm9311340wmm.31.2020.06.12.09.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 09:10:50 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] zstd: Upgrade 1.4.4 -> 1.4.5
Date: Fri, 12 Jun 2020 17:09:42 +0100
Message-Id: <20200612160942.7224-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../0001-Fix-legacy-build-after-2103.patch    | 27 +++++++++++++++++++
 .../zstd/{zstd_1.4.4.bb => zstd_1.4.5.bb}     |  6 +++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch
 rename meta-oe/recipes-extended/zstd/{zstd_1.4.4.bb => zstd_1.4.5.bb} (85%)

diff --git a/meta-oe/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch b/meta-oe/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch
new file mode 100644
index 000000000000..c701554b8b0c
--- /dev/null
+++ b/meta-oe/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch
@@ -0,0 +1,27 @@
+From 93cec0c1d6d0be8dd3a9d01d3e7f2099f1728df7 Mon Sep 17 00:00:00 2001
+From: Orivej Desh <orivej@gmx.fr>
+Date: Fri, 22 May 2020 12:48:02 +0000
+Subject: [PATCH] Fix legacy build after #2103
+
+Upstream-Status: Backport
+Signed-of-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ lib/legacy/zstd_v04.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/legacy/zstd_v04.c b/lib/legacy/zstd_v04.c
+index 56bf45222498..19fda8980abf 100644
+--- a/lib/legacy/zstd_v04.c
++++ b/lib/legacy/zstd_v04.c
+@@ -74,7 +74,7 @@ extern "C" {
+ /*-*************************************
+ *  Debug
+ ***************************************/
+-#include "debug.h"
++#include "../common/debug.h"
+ #ifndef assert
+ #  define assert(condition) ((void)0)
+ #endif
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/zstd/zstd_1.4.4.bb b/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
similarity index 85%
rename from meta-oe/recipes-extended/zstd/zstd_1.4.4.bb
rename to meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
index eb201f41396e..cd0b471e179b 100644
--- a/meta-oe/recipes-extended/zstd/zstd_1.4.4.bb
+++ b/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
@@ -9,9 +9,11 @@ LICENSE = "BSD-3-Clause & GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
 
-SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1"
+SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1 \
+           file://0001-Fix-legacy-build-after-2103.patch \
+           "
 
-SRCREV = "10f0e6993f9d2f682da6d04aa2385b7d53cbb4ee"
+SRCREV = "b706286adbba780006a47ef92df0ad7a785666b6"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1

