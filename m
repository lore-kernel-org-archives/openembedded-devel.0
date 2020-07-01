Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.10734.1593562066594729667
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N9eUBCyr;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id c1so2968549pja.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=OXJ3guRQUbsWA4I4EVqn7DDtYacYHLsTABmLa3AcPdc=;
        b=N9eUBCyrg4V2O1Clv+deRDnztp/SEGZcaYIgKS+Ar01RAZ911JHhz1mbgKy08oviW8
         sSky/mLTUpJyu6QiuIU5kT1XZqqzqswRqTMPIhIfxIsdXhN7caXARYG+UYSU5cCXT7lu
         kXfn5fZMASJsZRbCY0EmpHtIXcLB36Fq6/XNWZU3Nng3Ui4bRNuOcdDPtbH9nO3Y7d80
         WIGAc6oB4mn8uWuKLAosHuEn3Z/n++ZwpDEMFTRxM9tzzogr+FilF1adb83UjwyJHOPS
         1KwYA3TtC2Dx+CPRLwtln+zwjmrkZRY6y6JO4zRBKRYm0xWfJJw6yELZgafH1wLDnfaq
         MWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=OXJ3guRQUbsWA4I4EVqn7DDtYacYHLsTABmLa3AcPdc=;
        b=GxmFtVxztoMHQEKxqh9kEePRwvTr2vkgHcg4pSg+F8rV/UMkyOZiMcm77nfKqJ40R0
         G0x7erAFb2nQ+nUI0m459qncGKMoqhZ6oNvl385hqgiIwQEfdsuIkugGh4Ak0AKH1xR7
         RlSeTtoAd5vcBGWuGex/invXucl5tIEIYsZwXIKDUaS2BX7Kme2xEbCWmSYSOGsDeraH
         mGanE1i98BSclosEuLbk/OMX+DAJdMOIIgxOjaToKWmLbaAi6yyGY3RdTvplZVu89Mrt
         8QbHjYduFzbPQ6YH+7woQTOaazfMxsYpZB0JSdZSmg/DZMtnx8sOBTJkigRp1SQ1G/gZ
         TEog==
X-Gm-Message-State: AOAM5311pCmjRPRMn5pv1kPf5ElU8QArAYaiomlfLQmxgBLNPhb4gIYZ
	wvyeZOoJgY1LpANcnIcb34RCzr7+zTQ=
X-Google-Smtp-Source: ABdhPJwjQtnVOTWBGaqpHHgtpoCbjs5kIALL7UljZsO1om2bCKSg3mZxLoc2E2Gq4MAkUISaOEuPNg==
X-Received: by 2002:a17:902:8c84:: with SMTP id t4mr19506859plo.315.1593562065777;
        Tue, 30 Jun 2020 17:07:45 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:45 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 21/32] zstd: Upgrade 1.4.4 -> 1.4.5
Date: Tue, 30 Jun 2020 17:07:06 -0700
Message-Id: <d35b46dbe10bf47f1fffa456c41d42a9cdb1a9a1.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Alex Kiernan <alex.kiernan@gmail.com>

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f6aa84fcf197bb74ed2a4dc1e3bb898fc884e27b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-Fix-legacy-build-after-2103.patch    | 27 +++++++++++++++++++
 .../zstd/{zstd_1.4.4.bb => zstd_1.4.5.bb}     |  6 +++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch
 rename meta-oe/recipes-extended/zstd/{zstd_1.4.4.bb => zstd_1.4.5.bb} (85%)

diff --git a/meta-oe/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch b/meta-oe/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch
new file mode 100644
index 0000000000..c701554b8b
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
index eb201f4139..cd0b471e17 100644
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

